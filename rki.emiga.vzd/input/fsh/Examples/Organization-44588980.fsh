// Example for the new Version 1.1.0
Instance: 44588980
InstanceOf: EmigaPublicHealthOrganization
Usage: #example
* meta.security[visibility] = $ResourceVisibilityType#public
* meta.security[responsibility] = $ResourceResponsibility#1.
* meta.profile[emigaprofile] = "https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaPublicHealthOrganization|2.0.0-alpha.14"
* identifier[codeSiteId].type = $v2-0203#PRN
* identifier[codeSiteId].system = $CodeSiteId
* identifier[codeSiteId].value = "1."
* active = true
* extension.url = "https://emiga.rki.de/fhir/vzd/Extension/ResponsibilityHealthdepartments"
* extension.extension[0].url = "geographicRegion"
* extension.extension[=].valueCoding.system = "https://demis.rki.de/fhir/CodeSystem/geographicRegion"
* extension.extension[=].valueCoding.code = #11005711
* extension.extension[+].url = "responsibilityType"
* extension.extension[=].valueCoding.system = "https://emiga.rki.de/fhir/vzd/CodeSystem/responsibilityType"
* extension.extension[=].valueCoding.code = #all
* type[emigaOrganizationType] = $OrganizationType#ga
* name = "Stadt XYZ - Gesundheitsamt"
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