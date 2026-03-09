Instance: PublicHealthLocation001
InstanceOf: EmigaPublicHealthLocation
Usage: #example
* meta.security[visibility] = $ResourceVisibilityType#public
* meta.security[responsibility] = $ResourceResponsibility#1.
* meta.profile[emigaprofile] = "https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaPublicHealthLocation"
* status = #active
* name = "Fachgebiet 34"
* mode = #instance
* address.type = #physical
* address.line = "Seestraße 10"
* address.line.extension[0].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName"
* address.line.extension[=].valueString = "Seestraße"
* address.line.extension[+].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber"
* address.line.extension[=].valueString = "10"
* address.city = "Berlin"
* address.state = "DE-BB"
* address.postalCode = "12345"
* address.country = "DE"
* managingOrganization = Reference(PublicHealth001)




