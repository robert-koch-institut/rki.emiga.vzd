# Management Summary: FHIR Validation Incident

## Incident
Validation of hospital Organization payloads failed only in the development environment, while the same payload validated successfully in local and test environments.

## Business Impact
- Integration testing in development was blocked.
- Team time was spent on cross-team debugging (profile, backend, testing).
- Risk of delayed release confidence due to inconsistent environment behavior.

## What Happened
Initial validation errors pointed to profile slice mismatches in Organization.type. Technical review confirmed payload and profile alignment were correct. The issue was ultimately traced to development environment state inconsistency (runtime/index/database initialization state), not a defect in the FHIR profile or payload.

## Root Cause
Environment-level inconsistency in the development server caused divergent validation behavior despite identical artifacts and payload.

## Resolution
Backend team resolved the issue by:
1. Stopping the application.
2. Recreating the database with CLI tooling.
3. Running with installations suppressed and dry run.
4. Triggering installations afterwards.

Post-recovery validation succeeded, including hospital code validation.

## Current Status
Closed. Environment behavior is now consistent with local/test for the investigated scenario.

## Risk Assessment
- Residual risk: recurrence after future environment rebuilds/deployments if initialization sequence is not controlled.
- Product/content risk: low (no profile or payload defect identified).

## Preventive Actions Implemented
1. Added a post-deploy health gate checklist to the server testing guide:
   - [TestServer/Postman/FHIR_SERVER_TESTING.md](TestServer/Postman/FHIR_SERVER_TESTING.md)
2. Created a conformance probe collection/environment for fast cross-environment verification:
   - [TestServer/Postman/FHIR_Conformance_Probe_Collection.postman_collection.json](TestServer/Postman/FHIR_Conformance_Probe_Collection.postman_collection.json)
   - [TestServer/Postman/FHIR_Conformance_Probe.postman_environment.json](TestServer/Postman/FHIR_Conformance_Probe.postman_environment.json)

## Recommended Governance Follow-Up
1. Make the health gate mandatory after each deployment/rebuild in all non-production environments.
2. Keep a standardized environment rebuild/install runbook and enforce sequence consistency.
3. Require conformance probe pass before integration test sign-off.

## Reference
Full technical report:
- [TestServer/FHIR_VALIDATION_INCIDENT_REPORT_2026-03-13.md](TestServer/FHIR_VALIDATION_INCIDENT_REPORT_2026-03-13.md)
