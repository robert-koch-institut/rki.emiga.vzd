ValueSet: HospitalOrganizationType
Id: HospitalOrganizationType
Title: "Krankenhaus-Organisationstyp (Werteliste)"
Description: "Werteliste mit Konzepten, die die Art/den Typ einer Krankenhaus-Organisation aus Sicht des ÖGD grob charakterisieren."
* insert MetadataTerminology
* ^version = "1.0.0"
* ^date = "2025-10-27"

* $DemisOrgType#hospital "Krankenhaus"
* $DemisOrgType#hospital ^designation[0].language = #en-US
* $DemisOrgType#hospital ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* $DemisOrgType#hospital ^designation[=].use = $HL7DesignationUse#display
* $DemisOrgType#hospital ^designation[=].value = "Hospital"