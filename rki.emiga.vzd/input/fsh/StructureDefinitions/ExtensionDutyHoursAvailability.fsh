Extension: DutyHoursAvailability
Id: DutyHoursAvailability
Title: "Erreichbarkeit Dienstzeiten"
Description: "'DutyHoursAvailability' dient der Abbildung der Erreichbarkeit der Dienstleistungen einer Einrichtung anhand der Dienstzeiten."
Context: HealthcareService.availableTime

* ^url = "https://emiga.rki.de/fhir/vzd/Extension/DutyHoursAvailability"
* ^version = "2.1.0"
* ^date = "2026-09-28"

* insert MetadataProfile

* . ^short = "Dienstzeiten"
* . ^definition = "Erreichbarkeit der Dienstleistung anhand der Dienstzeiten"
* extension 0..0
* value[x] 1..1 MS
* value[x] only Coding
* value[x].system = "https://emiga.rki.de/fhir/vzd/CodeSystem/HealthcareServiceDutyHours"
* value[x].system 1..1 MS
* value[x].code 1..1 MS
* value[x] from $DutyHoursVS (required)