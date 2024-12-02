// Example for the new Version 1.1.0 AuthorityOrganization
Instance: 44588981
InstanceOf: AuthorityOrganization
Usage: #example
* meta.security[visibility] = $ResourceVisibilityType#public
* meta.security[responsibility] = $ResourceResponsibility#1.12.99.99.
* identifier.type = $v2-0203#PRN
* identifier.system = $IfsgKoordVwVId
* identifier.value = "012345"
* active = true

* type[emigaOrganizationType] = $OrganizationType#sepFedAut
* name = "Stadt XYZ - Oberstebundesbehörde"
* telecom[Email].system = #email
* telecom[Email].value = "test_authority@example.org"
* telecom[Phone].system = #phone
* telecom[Phone].value = "0123 4567890"
* telecom[Fax].system = #fax
* telecom[Fax].value = "0123 4567899"
* address.type = #postal
* address.line = "AuthorityTest Straße 11"
* address.line.extension[0].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName"
* address.line.extension[=].valueString = "AuthorityTest Straße"
* address.line.extension[+].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber"
* address.line.extension[=].valueString = "11"
* address.city = "AuthorityTeststadt"
* address.state = "DE-BB"
* address.postalCode = "12345"
* address.country = "DE"