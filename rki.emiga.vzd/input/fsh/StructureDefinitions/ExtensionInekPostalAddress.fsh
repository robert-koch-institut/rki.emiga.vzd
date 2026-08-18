Extension: InekPostalAddress
Id: InekPostalAddress
Title: "IneK Postalische Addresse"
Description: "Die 'InekPostalAddress' definiert die postalische Addresse für die Standorte die aus dem InEK Krankenhausverzeichnis stammen."

* ^url = "https://emiga.rki.de/fhir/vzd/Extension/InekPostalAddress"
* ^version = "0.2.1"
* ^date = "2026-08-18"

* insert MetadataProfile

* ^context.type = #element
* ^context.expression = "Location" // or another resource if needed
//* ^context.expression = "Organization" // if used in Organization context
* value[x] only Address
* valueAddress only $address-de-basis
* valueAddress.type 1..1 MS
* valueAddress.type ^short = "Postalische Addresse"
* valueAddress.type = #postal (exactly)