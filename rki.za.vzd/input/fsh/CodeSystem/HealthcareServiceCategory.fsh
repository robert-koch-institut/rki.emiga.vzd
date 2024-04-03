CodeSystem: HealthcareServiceCategory
Id: HealthcareServiceCategory
Title: "Dienstleistungskategorie"
Description: "Beschreibt die grobe Kategorie, in welche eine angebotene Dienstleistung einsortiert werden kann."
* insert MetaTerminology
* ^version = "1.0.0"
* ^date = "2024-03-19"
* ^caseSensitive = true
* ^content = #complete
* ^valueSet = "https://emiga.rki.de/fhir/vzd/ValueSet/HealthcareServiceCategory"
* #consultation "Baratungsangebot"
* #preventiveExamination "Vorsorgeangebot"


ValueSet: HealthcareServiceCategory
Title: "Werteliste mit Dienstleistungskategorien"
Description: "Werteliste mit Dienstleistungskategorien"
Id: HealthcareServiceCategory
* insert MetaTerminology
* ^version = "1.0.0"
* ^date = "2024-03-19"
* include codes from system HealthcareServiceCategory