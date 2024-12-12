Instance: EpiWarnOrganization
InstanceOf: EmigaOrganization
Usage: #example
* meta.security[visibility] = $ResourceVisibilityType#public
* meta.security[responsibility] = $ResourceResponsibility#1.12.99.99.


* active = true

* type[emigaOrganizationType] = $OrganizationType#sepFedAut "Oberste Bundesbehörden"
* name = "Zentrum für Gesundheits- und Infektionsschutz"
* telecom[Email].system = #email
* telecom[Email].value = "test@example.org"
* telecom[Phone].system = #phone
* telecom[Phone].value = "0123 4567890"
* telecom[Fax].system = #fax
* telecom[Fax].value = "0123 4567899"
* address.type = #postal
* address.line = "Test Straße 21"
* address.line.extension[0].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName"
* address.line.extension[=].valueString = "Test Straße"
* address.line.extension[+].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber"
* address.line.extension[=].valueString = "21"
* address.city = "Teststadt"
* address.state = "DE-BB"
* address.postalCode = "12345"
* address.country = "DE"