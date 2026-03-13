# FHIR Terminology Post-Fix Behavior Report

## Title
Post-fix terminology log behavior in development environment: pre-expansion and NOT_EXPANDED warnings after environment rebuild.

## Date
2026-03-13

## Scope
- Project: rki.emiga.vzd
- Environment: Development (Spring Boot + Elasticsearch)
- Area: HAPI FHIR terminology processing and validation behavior

## Executive Summary
After the development environment was rebuilt and validation started working again, two terminology log messages were observed:
1. Pre-expansion for a ValueSet saved 0 concepts.
2. HospitalOrganizationType was present in terminology tables but status remained NOT_EXPANDED, causing fallback to in-memory validate-code.

These messages indicate terminology subsystem convergence and asynchronous processing behavior, not necessarily a profile/payload defect. In many cases this state is transient. It becomes a problem only when warnings persist and validation outcomes remain unstable.

## Observed Log Messages
### Message 1
- Logger: TermReadSvcImpl
- Meaningful text: Pre-expanded ValueSet organizationType, saved 0 concepts.

### Message 2
- Logger: TermReadSvcImpl
- Meaningful text: HospitalOrganizationType is in terminology tables but NOT_EXPANDED; persistence-backed validate-code is not ready; falling back to in-memory validation; waiting for scheduled pre-expansion.

## Technical Interpretation
### 1. Pre-expansion saved 0 concepts
HAPI ran a scheduled pre-expansion pass for a ValueSet and persisted an empty expansion result at that point in time.

This can happen when:
- The ValueSet content is effectively empty for current resolution context.
- Referenced dependencies were not fully available during that scheduler cycle.
- Install/index timing caused an early expansion attempt before all terminology artifacts became ready.

### 2. NOT_EXPANDED with in-memory fallback
HAPI recognized the ValueSet metadata in terminology tables but had not yet completed persistence-backed expansion for it. For validate-code operations, HAPI used in-memory validation as a fallback.

This implies:
- Functionality may still work.
- Performance/consistency may vary until expansion catches up.
- Readiness is not yet fully converged.

## Why This Can Appear After a Successful Fix
A successful rebuild/install can still be followed by transient terminology warnings because:
1. Terminology processing is asynchronous.
2. Scheduler jobs run in cycles and may process artifacts in dependency-sensitive order.
3. Cluster/node startup and lock timing can delay or reorder expansion tasks.
4. Search/index and terminology persistence may converge at different speeds.

## Root Cause Assessment
Primary cause category: environment runtime state convergence, not profile/payload model defects.

Contributing factors likely include:
- Post-rebuild warm-up window where terminology jobs were still running.
- Dependency/order sensitivity in pre-expansion scheduling.
- Potential cluster timing differences across nodes.

## Risk Assessment
### Low risk (transient)
- Warnings appear briefly after deploy/rebuild.
- validate-code and payload validation become stable.
- Warnings disappear or reduce after scheduler cycles.

### Elevated risk (persistent)
- Same ValueSet remains NOT_EXPANDED for extended duration.
- Repeated pre-expansion with 0 concepts for ValueSets expected to contain known codes.
- Validation pass/fail toggles over time or differs by node.

## Verification Criteria
Environment is considered healthy when all of the following are consistently true:
1. ValueSet expand succeeds for HospitalOrganizationType.
2. validate-code succeeds for:
   - system: https://demis.rki.de/fhir/CodeSystem/organizationType
   - code: hospital
3. EmigaHospitalOrganization validation is stable across repeated runs.
4. Results are consistent across all app nodes/pods.

## Recommended Operational Actions
### Immediate
1. Allow warm-up period after rebuild/install before running integration validation.
2. Re-run the conformance probe after warm-up.
3. Verify behavior per node (not only through load balancer).

### If warnings persist
1. Restart all nodes/pods to align runtime state.
2. Re-run installation in controlled order:
   - CodeSystems
   - ValueSets
   - Profiles
   - Examples
3. Trigger/confirm completion of terminology and search reindex workflows.
4. Remove stale or duplicate canonical artifacts if present.
5. Compare effective runtime configuration across nodes.

## Preventive Controls
1. Make post-deploy health gate mandatory before integration tests.
2. Keep a standard rebuild/install runbook with strict sequencing.
3. Add automated conformance checks for expand, validate-code, and profile-constrained payload validation.
4. Track terminology convergence metrics/log signals during rollout.

## Related Artifacts
- Health gate guide: [TestServer/Postman/FHIR_SERVER_TESTING.md](TestServer/Postman/FHIR_SERVER_TESTING.md)
- Conformance probe collection: [TestServer/Postman/FHIR_Conformance_Probe_Collection.postman_collection.json](TestServer/Postman/FHIR_Conformance_Probe_Collection.postman_collection.json)
- Conformance probe environment: [TestServer/Postman/FHIR_Conformance_Probe.postman_environment.json](TestServer/Postman/FHIR_Conformance_Probe.postman_environment.json)
- Full incident report: [TestServer/FHIR_VALIDATION_INCIDENT_REPORT_2026-03-13.md](TestServer/FHIR_VALIDATION_INCIDENT_REPORT_2026-03-13.md)
- Management summary: [TestServer/FHIR_VALIDATION_INCIDENT_MANAGEMENT_SUMMARY_2026-03-13.md](TestServer/FHIR_VALIDATION_INCIDENT_MANAGEMENT_SUMMARY_2026-03-13.md)

## Final Conclusion
The observed post-fix logs are consistent with terminology subsystem convergence behavior in HAPI FHIR. They are not, by themselves, evidence of a new payload/profile defect. Treat them as transient unless they persist and correlate with unstable validation outcomes.
