CodeSystem: HealthcareServiceDutyHours
Id: HealthcareServiceDutyHours

Title: "Dienstzeiten"
Description: "TODO"
* ^url = "https://emiga.rki.de/fhir/vzd/CodeSystem/HealthcareServiceDutyHours"
* insert MetadataTerminology
* ^version = "1.0.0"
* ^date = "2024-12-18"
* ^caseSensitive = true
* ^content = #complete
* ^valueSet = "https://emiga.rki.de/fhir/vzd/ValueSet/HealthcareServiceDutyHours"

* #duringService "Während der Dienstzeit"
* #outsideService "Ausserhalb der Dienstzeit"
* #24/7 "24/7"

ValueSet: HealthcareServiceDutyHours
Id: HealthcareServiceDutyHours
Title: "Dienstzeiten (Werteliste)"
Description: "TODO"
* insert MetadataTerminology
* ^version = "1.0.0"
* ^date = "2024-12-18"
* include codes from system HealthcareServiceDutyHours
