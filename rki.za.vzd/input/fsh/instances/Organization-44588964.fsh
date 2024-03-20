Instance: 44588964
InstanceOf: OrganizationDirectory
Usage: #example
* meta.security[visibility] = $visibilityType#public
* meta.security[responsibility] = $dataResponsibility#1.12.99.99.
* identifier.type = $v2-0203#PRN
* identifier.system = $codeSiteId
* identifier.value = "1.12.99.99."
* type = $organizationType#ga
* name = "Stadt XYZ - FB 9 / Dienste"
* telecom[0].system = #email
* telecom[=].value = "test@example.org"
* telecom[+].system = #phone
* telecom[=].value = "0123 4567890"
* telecom[+].system = #fax
* telecom[=].value = "0123 4567899"
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