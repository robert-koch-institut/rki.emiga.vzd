Extension: InekPostalAddress
Id: InekPostalAddress
Title: "IneK Postal Address"
Description: "Information about the postal address of a site/location from IneK."
* ^url = "https://emiga.rki.de/fhir/vzd/Extension/InekPostalAddress"
* ^version = "0.1.0"
* ^date = "2025-07-11"

* insert MetadataProfile

* ^context.type = #element
* ^context.expression = "Location" // or another resource if needed
//* ^context.expression = "Organization" // if used in Organization context
* value[x] only Address
* valueAddress only $address-de-basis
* valueAddress.type 1..1 MS
* valueAddress.type ^short = "Postalische Addresse"
* valueAddress.type = #postal (exactly)
