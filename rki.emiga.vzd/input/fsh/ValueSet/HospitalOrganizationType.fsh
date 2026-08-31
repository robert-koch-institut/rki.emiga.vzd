ValueSet: HospitalOrganizationType
Id: HospitalOrganizationType
Title: "Krankenhaus-Organisationstyp"
Description: "'HospitalOrganizationType' ist eine Werteliste mit Konzepten, die die Art bzw. den Typ einer Krankenhaus-Organisation aus Sicht des ÖGD charakterisieren."
* ^version = "1.0.1"
* ^date = "2026-08-18"

* insert MetadataTerminology

* $DemisOrgType#hospital "Krankenhaus"
* $DemisOrgType#hospital ^designation[0].language = #en-US
* $DemisOrgType#hospital ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* $DemisOrgType#hospital ^designation[=].use = $HL7DesignationUse#display
* $DemisOrgType#hospital ^designation[=].value = "Hospital"