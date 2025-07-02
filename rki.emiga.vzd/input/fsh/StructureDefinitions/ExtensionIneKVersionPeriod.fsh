Extension: IneKVersionPeriod
Id: IneKVersionPeriod
Title: "IneK Version Period"
Description: "Information about the version and validity period of a site/location from IneK."
* ^url = "https://emiga.rki.de/fhir/vzd/Extension/IneKVersionPeriod"
* ^version = "0.1.0"
* ^date = "2025-06-17"

* insert MetadataProfile

* ^context.type = #element
* ^context.expression = "Location" // or another resource if needed
* ^context.expression = "Organization" // if used in Organization context

* extension contains
    version 0..1 and
    validPeriod 0..1 and
    lastChange 0..1
    //validUntil 0..1

* extension[version] ^short = "Version number of the site from the IneK source"
* extension[version].valueInteger 1..1 MS
//* extension[version].valueString ^maxLength = 9

* extension[validPeriod] ^short = "First day of validity (YYYY-MM-DD, between 1900-01-01 and 2999-12-31)"
* extension[validPeriod].valuePeriod 0..1 MS
* extension[validPeriod].valuePeriod.start 0..1 MS

* extension[lastChange] ^short = "Last change date of the site from the IneK source"
* extension[lastChange].valueDate 0..1 MS


//* extension[validUntil] ^short = "Last day of validity (YYYY-MM-DD, between 1900-01-01 and 2999-12-31). Required if ended."
//* extension[validUntil].valueDate 0..1

// Optionally, add constraints for date ranges if your tooling supports it