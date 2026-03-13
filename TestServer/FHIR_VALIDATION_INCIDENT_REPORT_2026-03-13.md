# FHIR Validation Incident Report

## Title
EmigaHospitalOrganization payload validation failure in development environment despite successful validation in local and test environments.

## Date
2026-03-13

## Scope
- Project: rki.emiga.vzd
- Affected resource/profile: EmigaHospitalOrganization
- Affected environment: Development
- Non-affected environments: Local backend server (HAPI FHIR 8.4.0), Test server (HAPI FHIR 8.6.0)

## Executive Summary
A transaction Bundle containing an Organization instance profiled as EmigaHospitalOrganization failed validation only in the development environment. The same corrected payload validated successfully in local and test environments. Initial errors suggested slice mismatches in Organization.type and a missing required slice. Investigation confirmed payload/profile alignment was correct. Root cause was environment state inconsistency in development server runtime/index/database state, not profile or payload defects. The issue was resolved by stopping the application, recreating the database with CLI tooling, suppressing installations and running a dry run, then triggering installations again.

## Impact
- Blocked validation and integration testing of hospital Organization payloads in development.
- Caused false-negative validation results and uncertainty about profile correctness.
- Increased debugging time across teams (profile authoring, backend, test).

## Symptoms Observed
1. OperationOutcome in development reported:
   - Slice mismatch for Organization.type against required profile slices.
   - Required slice not found for Organization.type:emigaOrganizationType.
   - Best-practice warning for dom-6 narrative (non-blocking).
2. Corrected payload passed in:
   - Test environment
   - Local backend environment
3. Additional runtime signal observed during investigation on development:
   - HAPI-0389 / Hibernate Search initialization error in ValueSet expansion path.

## Key Technical Context
The EmigaHospitalOrganization profile requires type slicing and specific coding constraints for the mandatory emigaOrganizationType slice.

Expected constraints:
- coding.system: https://demis.rki.de/fhir/CodeSystem/organizationType
- coding.code: hospital

Relevant project artifacts:
- [rki.emiga.vzd/input/fsh/StructureDefinitions/EmigaHospitalOrganization.fsh](rki.emiga.vzd/input/fsh/StructureDefinitions/EmigaHospitalOrganization.fsh)
- [rki.emiga.vzd/fsh-generated/resources/StructureDefinition-EmigaHospitalOrganization.json](rki.emiga.vzd/fsh-generated/resources/StructureDefinition-EmigaHospitalOrganization.json)
- [rki.emiga.vzd/input/fsh/Examples/InekKrankenhaus.fsh](rki.emiga.vzd/input/fsh/Examples/InekKrankenhaus.fsh)

## Investigation Timeline (Condensed)
1. Payload and OperationOutcome reviewed.
2. Profile differential and FSH source inspected; mismatch in submitted code system identified and corrected.
3. Corrected Bundle verified as valid on test and local backend environments.
4. Development environment still showed failures, indicating environment-specific issue.
5. Conformance probe collection/environment were created and used for cross-environment checks:
   - [TestServer/Postman/FHIR_Conformance_Probe_Collection.postman_collection.json](TestServer/Postman/FHIR_Conformance_Probe_Collection.postman_collection.json)
   - [TestServer/Postman/FHIR_Conformance_Probe.postman_environment.json](TestServer/Postman/FHIR_Conformance_Probe.postman_environment.json)
6. Development environment was rebuilt and reinitialized by backend developer.
7. Post-recovery, validation for hospital code/path succeeded.

## Root Cause
Environment state inconsistency in development server deployment (runtime/index/database initialization state), causing validation behavior to diverge from local and test environments even with identical profile/payload content.

Contributing factors likely included one or more of:
- Inconsistent initialization order for runtime subsystems.
- Stale or invalid index/cache state during validation path.
- Incomplete or inconsistent installation state in development database.

## Resolution Implemented
Backend developer performed:
1. Stopped the application.
2. Recreated the database using CLI tool.
3. Suppressed installations and executed dry run.
4. Triggered installations afterwards.
5. Re-tested validation; hospital code/path validated successfully.

## Verification of Resolution
Resolution confirmed by successful validation behavior after environment rebuild and installation sequence.

Expected post-fix checks:
1. ValueSet expansion succeeds.
2. Profile retrieval by canonical/version returns expected constraints.
3. Known-good Organization transaction validates without blocking OperationOutcome issues.

## Preventive Measures
1. Add a mandatory post-deploy health gate to every environment rollout.
   - Implemented in testing guide:
   - [TestServer/Postman/FHIR_SERVER_TESTING.md](TestServer/Postman/FHIR_SERVER_TESTING.md)
2. Standardize environment rebuild/install procedure in ops runbooks.
3. Ensure all nodes/pods are restarted and aligned after profile/terminology updates.
4. Include conformance probe execution as a release gate before integration testing.

## Artifacts Produced During Incident
- Conformance probe collection:
  - [TestServer/Postman/FHIR_Conformance_Probe_Collection.postman_collection.json](TestServer/Postman/FHIR_Conformance_Probe_Collection.postman_collection.json)
- Conformance probe environment:
  - [TestServer/Postman/FHIR_Conformance_Probe.postman_environment.json](TestServer/Postman/FHIR_Conformance_Probe.postman_environment.json)
- Updated server testing guide with health gate:
  - [TestServer/Postman/FHIR_SERVER_TESTING.md](TestServer/Postman/FHIR_SERVER_TESTING.md)

## Lessons Learned
1. Identical payload/profile behavior across environments can still diverge because of runtime state.
2. Validation errors that appear content-related can be secondary effects of environment initialization problems.
3. Fast, repeatable conformance probes significantly reduce time-to-root-cause.

## Current Status
Closed. Root cause mitigated through development environment rebuild and controlled reinstallation. Health gate added to reduce recurrence risk.
