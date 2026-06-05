Extension: DutyHoursAvailability
Id: DutyHoursAvailability
Title: "Erreichbarkeit Dienstzeiten"
Description: "Extension zur Abbildung der Erreichbarkeit der Dienstleistungen einer Organisation anhand der Dienstzeiten."
// AUTO-DISABLED (SUSHI R6): Context: HealthcareService.availableTime
* ^url = "https://emiga.rki.de/fhir/vzd/Extension/DutyHoursAvailability"
* ^version = "2.0.0"
* ^date = "2024-02-12"
* insert MetadataProfile
* . ^short = "Dienstzeiten"
* . ^definition = "Erreichbarkeit der Dienstleistung anhand der Dienstzeiten"
* value[x] MS
* value[x] only Coding
* value[x].system = "https://emiga.rki.de/fhir/vzd/CodeSystem/HealthcareServiceDutyHours"
* value[x].system 1..1 MS
* value[x].code 1..1 MS
* value[x] from $DutyHoursVS (required)


