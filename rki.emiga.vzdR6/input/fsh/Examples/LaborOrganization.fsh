Instance: LaborOrganization
InstanceOf: EmigaOrganizationR6
Usage: #example

* meta.profile[emigaprofile] = "https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaOrganizationR6"
* meta.security[visibility] = $ResourceVisibilityType#public
* meta.security[responsibility] = $ResourceResponsibility#1.
* meta.tag[relevance] = $RelevanceCS#UserCreated "Durch OEGD angelegt"

* identifier[emigaOrgvId].type = $v2-0203#XX
* identifier[emigaOrgvId].system = $EmigaOrgvId
* identifier[emigaOrgvId].value = "LAB-012345"
* identifier[emigaOrgvFileNumber].type = $v2-0203#XX
* identifier[emigaOrgvFileNumber].system = $EmigaOrgvFileNumber
* identifier[emigaOrgvFileNumber].value = "LAB-987654"
* identifier[BSNR].system = "https://fhir.kbv.de/NamingSystem/KBV_NS_Base_BSNR"
* identifier[BSNR].value = "123456789"

* active = true
// AUTO-DISABLED (SUSHI R6): 
// AUTO-DISABLED (SUSHI R6): * extension[organizationPeriod].valuePeriod.start = "1900-01-01"
* type[emigaOrganizationType].coding.system = $DemisOrgType
* type[emigaOrganizationType].coding.code = #laboratory 
* type[emigaOrganizationType].coding.display = "Erregerdiagnostische Untersuchungsstelle"

* name = "Labor XYZ GmbH"
// AUTO-DISABLED (SUSHI R6): * telecom[Email].system = #email
// AUTO-DISABLED (SUSHI R6): * telecom[Email].value = "test_laboratory@example.org"
// AUTO-DISABLED (SUSHI R6): * telecom[Phone].system = #phone
// AUTO-DISABLED (SUSHI R6): * telecom[Phone].value = "01234567890"
// AUTO-DISABLED (SUSHI R6): * telecom[Fax].system = #fax
// AUTO-DISABLED (SUSHI R6): * telecom[Fax].value = "01234567899"
// AUTO-DISABLED (SUSHI R6): * address.type = #postal
// AUTO-DISABLED (SUSHI R6): * address.line = "LaboratoryTest Straße 11"
// AUTO-DISABLED (SUSHI R6): * address.line.extension[0].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName"
// AUTO-DISABLED (SUSHI R6): * address.line.extension[0].valueString = "LaboratoryTest Straße"
// AUTO-DISABLED (SUSHI R6): * address.line.extension[1].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber"
// AUTO-DISABLED (SUSHI R6): * address.line.extension[1].valueString = "11"
// AUTO-DISABLED (SUSHI R6): * address.city = "LaboratoryTeststadt"
// AUTO-DISABLED (SUSHI R6): * address.state = "DE-BB"
// AUTO-DISABLED (SUSHI R6): * address.postalCode = "12345"
// AUTO-DISABLED (SUSHI R6): * address.country = "DE"