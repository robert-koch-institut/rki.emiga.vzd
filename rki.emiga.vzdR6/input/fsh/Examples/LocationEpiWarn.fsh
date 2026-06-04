Instance: EpiWarnLocation
InstanceOf: EmigaLocationR6
Usage: #example
* meta.security[visibility] = $ResourceVisibilityType#public
* meta.security[responsibility] = $ResourceResponsibility#1.
* meta.tag[relevance] = $RelevanceCS#IfsgKoordVwV "Paragraf 2 IfSG-Koordinierungs-VwV"
* meta.profile[emigaprofile] = "https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaLocationR6"
* status = #active
* name = "Umweltbezogene Risikobewertung"
* mode = #instance
* address.type = #physical
* address.line = "Uhlandstraße 4"
* address.line.extension[0].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName"
* address.line.extension[=].valueString = "Uhlandstraße"
* address.line.extension[+].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber"
* address.line.extension[=].valueString = "4"
* address.city = "Hannover"
* address.state = "Niedersachsen"
* address.postalCode = "30161"
* address.country = "DE"
* managingOrganization = Reference(EpiWarnOrganization)