CodeSystem: HealthcareServiceCategory
Id: HealthcareServiceCategory
Title: "Dienstleistungskategorie"
Description: "Beschreibt die grobe Kategorie, in welche eine angebotene Dienstleistung einsortiert werden kann."
* ^version = "1.0.0"
* ^date = "2024-03-19"
* ^valueSet = "https://emiga.rki.de/fhir/ValueSet/HealthcareServiceCategory"
* ^caseSensitive = true
* ^content = #complete
* insert Meta
* #consultation "Baratungsangebot"
* #preventiveExamination "Vorsorgeangebot"


ValueSet: HealthcareServiceCategory
Title: "Werteliste mit Dienstleistungskategorien"
Description: "Werteliste mit Dienstleistungskategorien"
Id: HealthcareServiceCategory
* insert Meta
* ^date = "2024-03-19"
* ^version = "1.0.0"
* include codes from system HealthcareServiceCategory