Extension: IneKVersionPeriod
Id: IneKVersionPeriod
Title: "IneK Version Period"
Description: "Informationen zur Version und Gültigkeitsdauer eines Standorts des IneK-Krankenhausverzeichnisses."
* ^url = "https://emiga.rki.de/fhir/vzd/Extension/IneKVersionPeriod"
* ^version = "0.2.0"
* ^date = "2026-02-24"

* insert MetadataProfile

* ^context[0].type = #element
* ^context[0].expression = "Organization"
* ^context[1].type = #element
* ^context[1].expression = "Location"

* extension contains
    version 0..1 and
    validPeriod 0..1 and
    lastChange 0..1
    //validUntil 0..1

* extension[version] ^short = "Versionsnummer des Datensatzes"
* extension[version].valueInteger 1..1 MS
//* extension[version].valueString ^maxLength = 9

* extension[validPeriod] ^short = "Erster Gültigkeitstag (YYYY-MM-DD, zwischen 1900-01-01 und 2999-12-31)"
* extension[validPeriod].valuePeriod 0..1 MS
* extension[validPeriod].valuePeriod.start 0..1 MS

* extension[lastChange] ^short = "Letztes Änderungsdatum des Standort-Datensatzes"
* extension[lastChange].valueDate 0..1 MS


//* extension[validUntil] ^short = "Last day of validity (YYYY-MM-DD, between 1900-01-01 and 2999-12-31). Required if ended."
//* extension[validUntil].valueDate 0..1

// Optionally, add constraints for date ranges if your tooling supports it