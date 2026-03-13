# FHIR Server Testing with Postman

This directory contains Postman collection and environment files to test if your RKI EMIGA VZD FHIR profiles and examples (v2.0.0-alpha.19) have been successfully uploaded to a FHIR server.

## Files

- **FHIR_Server_Test_Collection.postman_collection.json** - Complete test collection with requests for all resources
- **FHIR_Server_Test.postman_environment.json** - Environment configuration for server settings

## Import into Postman

### Option 1: Using Postman Desktop App
1. Open Postman
2. Click **Import** button (top left)
3. Drag and drop both JSON files or click **Upload Files**
4. Select both files:
   - `FHIR_Server_Test_Collection.postman_collection.json`
   - `FHIR_Server_Test.postman_environment.json`
5. Click **Import**

### Option 2: Using Postman Web
1. Go to https://web.postman.co/
2. Click **Import** button
3. Upload both files
4. Click **Import**

## Configuration

### Update FHIR Server URL
1. In Postman, go to **Environments** (left sidebar)
2. Select **RKI EMIGA VZD - FHIR Server Environment**
3. Update the `fhir_base_url` variable with your actual FHIR server URL
   - Examples:
     - Local HAPI FHIR: `http://localhost:8080/fhir`
     - Azure FHIR Service: `https://your-fhir-service.azurehealthcareapis.com`
     - AWS HealthLake: `https://healthlake.region.amazonaws.com/datastore/datastore-id/r4`
     - Other servers: `https://your-server.com/fhir`
4. Click **Save**

### Enable Environment
Make sure to select the **RKI EMIGA VZD - FHIR Server Environment** from the environment dropdown (top right corner of Postman).

### Optional: Add Authentication
If your FHIR server requires authentication:
1. Go to the environment settings
2. Enable the `auth_token` variable
3. Add your Bearer token value
4. In the collection, add an Authorization header:
   - Key: `Authorization`
   - Value: `Bearer {{auth_token}}`

## Test Collection Structure

The collection is organized into folders by resource type:

### 1. **StructureDefinitions (Profiles)** - 13 requests
Tests for all FHIR profile definitions including:
- EmigaOrganization
- EmigaPractitioner
- EmigaPractitionerRole
- EmigaLocation
- EmigaHealthcareService
- EmigaHospitalOrganization
- EmigaDepartmentOrganization
- EmigaPublicHealthOrganization
- EmigaHospitalLocation
- EmigaHospitalFacilityLocation
- EmigaHospitalRoomLocation
- OrgVBundle
- With a search query to get all StructureDefinitions

### 2. **CodeSystems** - 8 requests
Tests for terminology code systems:
- HealthcareServiceCategory
- HealthcareServiceDutyHours
- HealthcareServiceSpecialty
- IneKFacilityType
- OrganizationType
- PractitionerRole
- responsibilityType
- With a search query

### 3. **ValueSets** - 4 requests
Tests for value set resources with a search query

### 4. **Organizations (Examples)** - 6 requests
Tests for example Organization instances:
- EpiWarnOrganization
- InekKrankenhausOrganization
- LaborOrganization
- Organization44588980
- Organization44588981
- With a search query

### 5. **Practitioners (Examples)** - 4 requests
Tests for example Practitioner instances with search query

### 6. **PractitionerRoles (Examples)** - 4 requests
Tests for example PractitionerRole instances with search query

### 7. **Locations (Examples)** - 5 requests
Tests for example Location instances:
- EpiWarnLocation
- HospitalRoomLocation
- InekEinricthung01
- LaborLocation
- With a search query

### 8. **HealthcareServices (Examples)** - 4 requests
Tests for example HealthcareService instances with search query

### 9. **NamingSystems** - 4 requests
Tests for NamingSystem resources with search query

### 10. **ImplementationGuide** - 1 request
Tests for the main ImplementationGuide resource

### 11. **Server Metadata** - 1 request
Gets the server's CapabilityStatement to verify server capabilities

## Running Tests

### Run Individual Requests
1. Navigate to the collection in the left sidebar
2. Expand folders to find specific requests
3. Click on a request
4. Click **Send** button
5. Check the response:
   - **200 OK** = Resource found on server ✅
   - **404 Not Found** = Resource not on server ❌
   - **401 Unauthorized** = Authentication required 🔒

### Run All Tests in a Folder
1. Hover over a folder name
2. Click the **Run** icon (▷)
3. Click **Run [Folder Name]**
4. View results summary

### Run Entire Collection
1. Click the collection name
2. Click **Run** button
3. Select which folders to run
4. Click **Run RKI EMIGA VZD - FHIR Server Tests**
5. Review the test results

## Expected Results

If all resources have been uploaded successfully to your FHIR server:
- All GET requests for specific resources should return **200 OK**
- Search queries should return Bundle resources with matching entries
- The CapabilityStatement should indicate support for the resource types

## Environment Health Gate (Post-Deploy, 2-3 Minutes)

Run this gate after every deployment or environment rebuild to detect validator/terminology drift early.

### Prerequisites
- Import:
  - `FHIR_Conformance_Probe_Collection.postman_collection.json`
  - `FHIR_Conformance_Probe.postman_environment.json`
- Set `fhir_base_url` to the target environment.

### Gate Steps
1. Run request **1. Server Metadata**
   - Pass: `200 OK`, response is `CapabilityStatement`.
2. Run request **2. Get EmigaHospitalOrganization by canonical+version**
   - Pass: Profile exists and asserts:
     - `Organization.type:emigaOrganizationType.coding.system` = `https://demis.rki.de/fhir/CodeSystem/organizationType`
     - `Organization.type:emigaOrganizationType.coding.code` = `hospital`
3. Run request **4. Expand HospitalOrganizationType ValueSet**
   - Pass: `200 OK` and expansion includes `system=https://demis.rki.de/fhir/CodeSystem/organizationType`, `code=hospital`.
4. Run request **5. Transaction with known-good Organization payload**
   - Pass: `2xx` and no `error`/`fatal` `OperationOutcome` issues.

### Gate Outcome
- **PASS**: Environment is ready for payload validation and integration tests.
- **FAIL**: Stop rollout and resolve server state before functional testing.

### If Gate Fails
- Restart all app instances/pods in the environment.
- Verify all nodes have consistent app/config versions.
- Re-run artifact installation and then re-run this gate.
- If needed, rebuild database/search state and repeat installation.

## Troubleshooting

### All requests return 404
- Check that `fhir_base_url` is correctly set
- Verify the server is running and accessible
- Ensure resources were actually uploaded

### 401 Unauthorized errors
- Add authentication token to environment
- Configure authorization header in requests
- Check token validity and permissions

### Connection errors
- Verify network connectivity
- Check firewall settings
- Confirm server URL and port

### Resource not found but expected
- Verify the resource ID matches what was uploaded
- Check if the FHIR server modified IDs during upload
- Use search queries to find resources by other parameters

## Additional Information

- **FHIR Version**: 4.0.1 (R4)
- **Project Version**: 2.0.0-alpha.19
- **Canonical URL**: https://emiga.rki.de/fhir/vzd
- **Publisher**: Robert Koch Institut

## Next Steps

After verifying resources are on the server, you can:
1. Test CRUD operations (Create, Read, Update, Delete)
2. Validate resources against profiles
3. Test search parameters
4. Perform integration testing with client applications
5. Test FHIR operations and transactions

## Resources

- [FHIR R4 Specification](http://hl7.org/fhir/R4/)
- [Postman Documentation](https://learning.postman.com/)
- [HAPI FHIR Documentation](https://hapifhir.io/)