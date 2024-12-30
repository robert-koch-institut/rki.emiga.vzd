CodeSystem: HealthcareServiceDutyHours
Id: HealthcareServiceDutyHours

Title: "Dienstzeiten"
Description: "Die Kodiersystematik HealthcareServiceDutyHours definiert Konzepte, die die Verfügbarkeit von Dienstleistungen auf der Grundlage ihrer Dienstzeiten darstellen."
* ^url = "https://emiga.rki.de/fhir/vzd/CodeSystem/HealthcareServiceDutyHours"
* insert MetadataTerminology
* ^version = "1.0.0"
* ^date = "2024-12-18"
* ^caseSensitive = true
* ^content = #complete
* ^valueSet = "https://emiga.rki.de/fhir/vzd/ValueSet/HealthcareServiceDutyHours"

* #duringServiceHours "Während der Dienstzeit"
* #outsideServiceHours "Ausserhalb der Dienstzeit"
* #24/7 "24/7"

ValueSet: HealthcareServiceDutyHours
Id: HealthcareServiceDutyHours
Title: "Dienstzeiten (Werteliste)"
Description: "Werteliste mit Konzepten, die die Verfügbarkeit von Dienstleistungen darstellen"
* insert MetadataTerminology
* ^version = "1.0.0"
* ^date = "2024-12-18"
* include codes from system HealthcareServiceDutyHours
