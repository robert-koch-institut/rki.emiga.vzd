// Example for the new Version 2.0.0 epiWarnOrganization
Instance: Organization44588981
InstanceOf: EmigaOrganizationR6
Usage: #example
* meta.security[visibility] = $ResourceVisibilityType#public
* meta.security[responsibility] = $ResourceResponsibility#1.
* meta.profile[emigaprofile] = "https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaOrganizationR6"
* identifier[emigaOrgvId].type = $v2-0203#XX
* identifier[emigaOrgvId].system = $EmigaOrgvId
* identifier[emigaOrgvId].value = "OrgvID-012345"
* identifier[emigaOrgvFileNumber].type = $v2-0203#XX
* identifier[emigaOrgvFileNumber].system = $EmigaOrgvFileNumber
* identifier[emigaOrgvFileNumber].value = "OrgvFileNumber-987654"
* active = true
// AUTO-DISABLED (SUSHI R6): * extension[organizationPeriod].valuePeriod.start = "1900-01-01"
* type[emigaOrganizationType] = $OrganizationType#sepFedAut
* name = "Stadt XYZ - Oberstebundesbehörde"
// AUTO-DISABLED (SUSHI R6): * telecom[Email].system = #email
// AUTO-DISABLED (SUSHI R6): * telecom[Email].value = "test_authority@example.org"
// AUTO-DISABLED (SUSHI R6): * telecom[Phone].system = #phone
// AUTO-DISABLED (SUSHI R6): * telecom[Phone].value = "0123 4567890"
// AUTO-DISABLED (SUSHI R6): * telecom[Fax].system = #fax
// AUTO-DISABLED (SUSHI R6): * telecom[Fax].value = "0123 4567899"
// AUTO-DISABLED (SUSHI R6): * address.type = #postal
// AUTO-DISABLED (SUSHI R6): * address.line = "AuthorityTest Straße 11"
// AUTO-DISABLED (SUSHI R6): * address.line.extension[0].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName"
// AUTO-DISABLED (SUSHI R6): * address.line.extension[=].valueString = "AuthorityTest Straße"
// AUTO-DISABLED (SUSHI R6): * address.line.extension[+].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber"
// AUTO-DISABLED (SUSHI R6): * address.line.extension[=].valueString = "11"
// AUTO-DISABLED (SUSHI R6): * address.city = "AuthorityTeststadt"
// AUTO-DISABLED (SUSHI R6): * address.state = "DE-BB"
// AUTO-DISABLED (SUSHI R6): * address.postalCode = "12345"
// AUTO-DISABLED (SUSHI R6): * address.country = "DE"