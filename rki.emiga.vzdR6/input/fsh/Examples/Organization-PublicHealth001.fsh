// Example for the new Version 2.0.0-alpha.21
Instance: PublicHealth001
InstanceOf: EmigaPublicHealthOrganizationR6
Usage: #example
* meta.security[visibility] = $ResourceVisibilityType#public "öffentlich"
* meta.security[responsibility] = $ResourceResponsibility#1.
* meta.profile[emigaprofile] = "https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaPublicHealthOrganizationR6"
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
// AUTO-DISABLED (SUSHI R6): * telecom[Email].system = #email
// AUTO-DISABLED (SUSHI R6): * telecom[Email].value = "test@example.org"
// AUTO-DISABLED (SUSHI R6): * telecom[Phone].system = #phone
// AUTO-DISABLED (SUSHI R6): * telecom[Phone].value = "030 18754 0"
// AUTO-DISABLED (SUSHI R6): * telecom[Fax].system = #fax
// AUTO-DISABLED (SUSHI R6): * telecom[Fax].value = "030 18754 2328"
// AUTO-DISABLED (SUSHI R6): * address.type = #postal
// AUTO-DISABLED (SUSHI R6): * address.line = "Seestraße 10"
// AUTO-DISABLED (SUSHI R6): * address.line.extension[0].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName"
// AUTO-DISABLED (SUSHI R6): * address.line.extension[=].valueString = "Seestraße"
// AUTO-DISABLED (SUSHI R6): * address.line.extension[+].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber"
// AUTO-DISABLED (SUSHI R6): * address.line.extension[=].valueString = "10"
// AUTO-DISABLED (SUSHI R6): * address.city = "Berlin"
// AUTO-DISABLED (SUSHI R6): * address.state = "DE-BB"
// AUTO-DISABLED (SUSHI R6): * address.postalCode = "13353"
// AUTO-DISABLED (SUSHI R6): * address.country = "DE"

