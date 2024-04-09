CodeSystem: LocationType
Id: LocationType
Title: "EMIGA Standorttypen"
Description: "Definiert Konzepte, die die im EMIGA-Kontext verwendeten Standorttypen beschreiben."
* insert MetaTerminology
* ^version = "1.0.0"
* ^date = "2024-03-19"
* ^caseSensitive = true
* ^content = #complete
* ^valueSet = "https://emiga.rki.de/fhir/vzd/ValueSet/LocationType"
* #centralOffice "Zentralstelle"
* #centralOffice ^designation.language = #de-DE
* #centralOffice ^designation.use = $ConceptDesignationUse#short
* #centralOffice ^designation.value = "Zentrale"
* #branchOffice "Außenstelle"
* #branchOffice ^designation.language = #de-DE
* #branchOffice ^designation.use = $ConceptDesignationUse#short
* #branchOffice ^designation.value = "Außenstelle"

ValueSet: LocationType
Title: "EMIGA Standorttypen (ValueSet)"
Description: "Werteliste für die Standorttypen im EMIGA-Kontext."
Id: LocationType
* insert MetaTerminology
* ^version = "1.0.0"
* ^date = "2024-03-19"
* include codes from system LocationType