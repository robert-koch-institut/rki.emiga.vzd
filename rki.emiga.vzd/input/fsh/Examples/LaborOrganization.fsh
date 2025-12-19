Instance: LaborOrganization
InstanceOf: EmigaOrganization
Usage: #example

* meta.profile[emigaprofile] = "https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaOrganization|2.0.0-alpha.18"
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

* extension[organizationPeriod].valuePeriod.start = "1900-01-01"
* type[emigaOrganizationType].coding.system = $DemisOrgType
* type[emigaOrganizationType].coding.code = #laboratory 
* type[emigaOrganizationType].coding.display = "Erregerdiagnostische Untersuchungsstelle"

* name = "Labor XYZ GmbH"
* telecom[Email].system = #email
* telecom[Email].value = "test_laboratory@example.org"
* telecom[Phone].system = #phone
* telecom[Phone].value = "01234567890"
* telecom[Fax].system = #fax
* telecom[Fax].value = "01234567899"
* address.type = #postal
* address.line = "LaboratoryTest Straße 11"
* address.line.extension[0].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName"
* address.line.extension[0].valueString = "LaboratoryTest Straße"
* address.line.extension[1].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber"
* address.line.extension[1].valueString = "11"
* address.city = "LaboratoryTeststadt"
* address.state = "DE-BB"
* address.postalCode = "12345"
* address.country = "DE"