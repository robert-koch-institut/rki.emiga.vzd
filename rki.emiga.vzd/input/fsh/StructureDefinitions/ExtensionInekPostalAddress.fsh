Extension: InekPostalAddress
Id: InekPostalAddress
Title: "IneK Postalische Addresse"
Description: "Hier wird die postalische Addresse für die Standorte die aus der InEK Krankenhausverzeichnis stammen, definiert."
* ^url = "https://emiga.rki.de/fhir/vzd/Extension/InekPostalAddress"
* ^version = "0.2.0"
* ^date = "2026-02-12"

* insert MetadataProfile

* ^context.type = #element
* ^context.expression = "Location" // or another resource if needed
//* ^context.expression = "Organization" // if used in Organization context
* value[x] only Address
* valueAddress only $address-de-basis
* valueAddress.type 1..1 MS
* valueAddress.type ^short = "Postalische Addresse"
* valueAddress.type = #postal (exactly)
