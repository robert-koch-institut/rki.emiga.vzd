Extension: DutyHoursAvailability
Id: DutyHoursAvailability
Title: "Erreichbarkeit Dienstzeiten"
Description: "Extension zur Abbildung der Erreichbarkeit der Dienstleistungen einer Organisation anhand der Dienstzeiten."
Context: HealthcareService
* ^url = "https://emiga.rki.de/fhir/vzd/Extension/DutyHoursAvailability"
* ^version = "1.0.0"
* ^date = "2024-12-18"
* insert MetadataProfile
* . ^short = "Dienstzeiten"
* . ^definition = "Erreichbarkeit der Organisation anhand der Dienstzeiten"
* value[x] only Coding
* value[x] MS
* value[x] from $dutyHoursVS (required)


