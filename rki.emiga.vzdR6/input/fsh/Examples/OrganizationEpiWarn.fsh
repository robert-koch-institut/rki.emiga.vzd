Instance: EpiWarnOrganization
InstanceOf: EmigaOrganizationR6
Usage: #example
* meta.security[visibility] = $ResourceVisibilityType#public
* meta.security[responsibility] = $ResourceResponsibility#1.
* meta.tag[relevance] = $RelevanceCS#IfsgKoordVwV "Paragraf 2 IfSG-Koordinierungs-VwV"
* meta.profile[emigaprofile] = "https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaOrganizationR6"
* active = true
// AUTO-DISABLED (SUSHI R6): * extension[organizationPeriod].valuePeriod.start = "1900-01-01"
* identifier[emigaOrgvId].type = $v2-0203#XX
* identifier[emigaOrgvId].system = $EmigaOrgvId
* identifier[emigaOrgvId].value = "OrgvID-0123456789"
* identifier[emigaOrgvFileNumber].type = $v2-0203#XX
* identifier[emigaOrgvFileNumber].system = $EmigaOrgvFileNumber
* identifier[emigaOrgvFileNumber].value = "OrgvFileNumber-9876543210"
* type[emigaOrganizationType] = $OrganizationType#sepFedAut "Oberste Bundesbehörden"
* name = "Zentrum für Gesundheits- und Infektionsschutz"
// AUTO-DISABLED (SUSHI R6): * telecom[Email].system = #email
// AUTO-DISABLED (SUSHI R6): * telecom[Email].value = "test@example.org"
// AUTO-DISABLED (SUSHI R6): * telecom[Phone].system = #phone
// AUTO-DISABLED (SUSHI R6): * telecom[Phone].value = "0123 4567890"
// AUTO-DISABLED (SUSHI R6): * telecom[Fax].system = #fax
// AUTO-DISABLED (SUSHI R6): * telecom[Fax].value = "0123 4567899"
// AUTO-DISABLED (SUSHI R6): * address.type = #postal
// AUTO-DISABLED (SUSHI R6): * address.line = "Test Straße 21"
// AUTO-DISABLED (SUSHI R6): * address.line.extension[0].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName"
// AUTO-DISABLED (SUSHI R6): * address.line.extension[=].valueString = "Test Straße"
// AUTO-DISABLED (SUSHI R6): * address.line.extension[+].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber"
// AUTO-DISABLED (SUSHI R6): * address.line.extension[=].valueString = "21"
// AUTO-DISABLED (SUSHI R6): * address.city = "Teststadt"
// AUTO-DISABLED (SUSHI R6): * address.state = "DE-BB"
// AUTO-DISABLED (SUSHI R6): * address.postalCode = "12345"
// AUTO-DISABLED (SUSHI R6): * address.country = "DE"