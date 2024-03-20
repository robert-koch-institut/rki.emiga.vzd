Instance: 44588965
InstanceOf: LocationDirectory
Usage: #example
* meta.security[visibility] = $visibilityType#public
* meta.security[responsibility] = $dataResponsibility#1.12.99.99.
* status = #active
* name = "Stadt XYZ - FB 9 / Dienste"
* mode = #instance
* type = $locationType#office
* address.extension.url = $addressLine
* address.extension.valueString = "Test Straße 21"
* address.type = #physical
* address.line = "Test Straße 21"
* address.line.extension[0].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName"
* address.line.extension[=].valueString = "Test Straße"
* address.line.extension[+].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber"
* address.line.extension[=].valueString = "21"
* address.city = "Teststadt"
* address.state = "DE-BB"
* address.postalCode = "12345"
* address.country = "DE"
* managingOrganization = Reference(44588964)