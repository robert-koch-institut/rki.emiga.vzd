Instance: EpiWarnOrganization
InstanceOf: EmigaOrganization
Usage: #example
* meta.security[visibility] = $ResourceVisibilityType#public
* meta.security[responsibility] = $ResourceResponsibility#1.
* meta.tag[relevance] = $RelevanceCS#IfsgKoordVwV "Paragraf 2 IfSG-Koordinierungs-VwV"
* meta.profile[emigaprofile] = "https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaOrganization|2.0.0-alpha.17"
* active = true
* extension[organizationPeriod].valuePeriod.start = "1900-01-01"
* identifier[emigaOrgvId].type = $v2-0203#XX
* identifier[emigaOrgvId].system = $EmigaOrgvId
* identifier[emigaOrgvId].value = "OrgvID-0123456789"
* identifier[emigaOrgvFileNumber].type = $v2-0203#XX
* identifier[emigaOrgvFileNumber].system = $EmigaOrgvFileNumber
* identifier[emigaOrgvFileNumber].value = "OrgvFileNumber-9876543210"
* type[emigaOrganizationType] = $OrganizationType#sepFedAut "Oberste Bundesbehörden"
* name = "Zentrum für Gesundheits- und Infektionsschutz"
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