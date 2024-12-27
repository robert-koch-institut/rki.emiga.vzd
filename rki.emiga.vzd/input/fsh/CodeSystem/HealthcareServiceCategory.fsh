CodeSystem: HealthcareServiceCategory
Id: HealthcareServiceCategory
Title: "Dienstleistungskategorie"
Description: "Die Kodiersystematik 'HealthcareServiceCategory' definiert Konzepte, die die Kategorie, in welche eine angebotene Dienstleistung einsortiert werden kann, näher beschreiben."
* insert MetadataTerminology
* ^version = "1.0.0"
* ^date = "2024-03-19"
* ^caseSensitive = true
* ^content = #complete
* ^valueSet = "https://emiga.rki.de/fhir/vzd/ValueSet/HealthcareServiceCategory"
* #consultation "Beratungsangebot"
* #preventiveExamination "Vorsorgeangebot"


ValueSet: HealthcareServiceCategory
Title: "Dienstleistungskategorien (Werteliste)"
Description: "Werteliste mit Konzepten, die die Kategorie einer Dienstleistung näher beschreiben."
Id: HealthcareServiceCategory
* insert MetadataTerminology
* ^version = "1.0.0"
* ^date = "2024-03-19"
* include codes from system HealthcareServiceCategory