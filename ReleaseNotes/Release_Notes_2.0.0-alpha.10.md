**fix:** coding in Example  
Examples/LaborOrganization.json  
**feat:** Add Example for "Generic" Oraganizations (Einrichtung, Bereich, Sub-Bereich)  
Examples/LaborLocation.json  
Examples/LaborLocationSub.json  
Examples/LaborOrganization.json  
**feat:** Adjust cardinality in identifier[BSNR].system and .value Elements to 1..1  
StructureDefinitions/EmigaHospitalFacilityLocation.json  
StructureDefinitions/EmigaHospitalLocation.json  
StructureDefinitions/EmigaHospitalOrganization.json  
StructureDefinitions/EmigaLocation.json  
StructureDefinitions/EmigaOrganization.json  
**feat:** Remove designations from VS  
ValueSet/GenericOrganizationType.json  
**feat:** Add English language Designations  
CodeSystem/OrganizationType.json  
**feat:** Update Dependencies  
rki.emiga.vzd/sushi-config.yaml  
**feat:** Loosen cardinality of .status element to match requirements  
StructureDefinitions/EmigaLocation.json  
**feat:** Loosen .type element cardinality to optional (0..1) to match requirements  
StructureDefinitions/EmigaOrganization.json  
**fix:** Remove level information and definitions from VS, add CodeSystem on codes  
ValueSet/GenericOrganizationType.json  
**fix:** Add CodeSystem for codes in VS  
ValueSet/OrganizationType.json  
**fix:** Remove Duplicate conept: sonstige Einrichtung, iterate CS version  
CodeSystem/OrganizationType.json  
**feat:**  new valuesets and extended codesystem for EINR/ORG  
CodeSystem/OrganizationType.json  
StructureDefinitions/EmigaHospitalOrganization.json  
ValueSet/GenericOrganizationType.json  
ValueSet/HospitalOrganizationType.json  
ValueSet/OrganizationType.json  
NamingSystem/EmigaOrgvId.json  
StructureDefinitions/EmigaDepartmentOrganization.json  
StructureDefinitions/EmigaHospitalFacilityLocation.json  
StructureDefinitions/EmigaHospitalLocation.json  
StructureDefinitions/EmigaHospitalOrganization.json  
StructureDefinitions/EmigaHospitalRoomLocation.json  
StructureDefinitions/EmigaLocation.json  
StructureDefinitions/EmigaOrganization.json  
StructureDefinitions/EmigaPublicHealthOrganization.json  
**feat:** Set cardinality of .type to must (1..1)  
StructureDefinitions/EmigaOrganization.json  
**fix:** Adjust example to fix compiler warnings  
Examples/LocationEpiWarn.json  
Examples/PractitionerRoleEpiWarn.json  
**feat:** Add identifiers, set cardinality location.alias to 0..1, allow paroOf to documant hierarchical connections between Locations, iterate Profile version. doc: Adjust Title to new "generic" Organisation,  
StructureDefinitions/EmigaLocation.json  
**feat:** Remove OrganisationsEinheitenID as not needed, Add MS on identifier[IKNR].period and identifier[BSNR].system and .value, make .type element optional, remove not needed Organizationtypes(Relevant to Hospital), set cardinality of organization.alias to 0..1, .patrOf add MS, set cardinality to 0..*, iterate profile version. doc: Adjust Title to matche the "generic" Organization  
StructureDefinitions/EmigaOrganization.json  
**feat:** change extension for ags to the one from Basis Profile DE, update example, iterate package version on meta.profile to current  
Examples/InekStandort.json  
StructureDefinitions/EmigaHospitalLocation.json  
