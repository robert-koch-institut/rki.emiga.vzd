// Example for the new Version 2.0.0-alpha.21
Instance: PublicHealth001
InstanceOf: EmigaPublicHealthOrganization
Usage: #example
* meta.security[visibility] = $ResourceVisibilityType#public "öffentlich"
* meta.security[responsibility] = $ResourceResponsibility#1.
* meta.profile[emigaprofile] = "https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaPublicHealthOrganization"
* identifier[codeSiteId].type = $v2-0203#PRN
* identifier[codeSiteId].system = $CodeSiteId
* identifier[codeSiteId].value = "1."
* active = true
* extension.url = "https://emiga.rki.de/fhir/vzd/Extension/ResponsibilityHealthdepartments"
* extension.extension[0].url = "geographicRegion"
* extension.extension[=].valueCoding.system = "https://demis.rki.de/fhir/CodeSystem/geographicRegion"
* extension.extension[=].valueCoding.code = #21000109
* extension.extension[+].url = "responsibilityType"
* extension.extension[=].valueCoding.system = "https://emiga.rki.de/fhir/vzd/CodeSystem/responsibilityType"
* extension.extension[=].valueCoding.code = #all
* type[emigaOrganizationType] = $OrganizationType#rki
* name = "Robert Koch - Institut"
* telecom[Email].system = #email
* telecom[Email].value = "test@example.org"
* telecom[Phone].system = #phone
* telecom[Phone].value = "030 18754 0"
* telecom[Fax].system = #fax
* telecom[Fax].value = "030 18754 2328"
* address.type = #postal
* address.line = "Seestraße 10"
* address.line.extension[0].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName"
* address.line.extension[=].valueString = "Seestraße"
* address.line.extension[+].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber"
* address.line.extension[=].valueString = "10"
* address.city = "Berlin"
* address.state = "DE-BB"
* address.postalCode = "13353"
* address.country = "DE"

