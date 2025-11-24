Instance: LaborLocationSub
InstanceOf: EmigaLocation
Usage: #example

* meta.profile[emigaprofile] = "https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaLocation|2.0.0-alpha.17"
* meta.security[visibility] = $ResourceVisibilityType#public
* meta.security[responsibility] = $ResourceResponsibility#1.
* meta.tag[relevance] = $RelevanceCS#UserCreated "Durch OEGD angelegt"

* identifier[emigaOrgvId].type = $v2-0203#XX
* identifier[emigaOrgvId].system = $EmigaOrgvId
* identifier[emigaOrgvId].value = "LAB-SUB-BEREICH-012345"
* identifier[emigaOrgvFileNumber].type = $v2-0203#XX
* identifier[emigaOrgvFileNumber].system = $EmigaOrgvFileNumber
* identifier[emigaOrgvFileNumber].value = "LAB-SUB-BEREICH-987654"
* identifier[BSNR].system = "https://fhir.kbv.de/NamingSystem/KBV_NS_Base_BSNR"
* identifier[BSNR].value = "123456789"

* status = #active
* name = "Labor Sub Bereich Standort"
* mode = #instance
* address.type = #physical
* address.line = "Uhlandstraße 6"
* address.line.extension[0].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName"
* address.line.extension[0].valueString = "Uhlandstraße"
* address.line.extension[1].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber"
* address.line.extension[1].valueString = "6"
* address.city = "Hannover"
* address.state = "Niedersachsen"
* address.postalCode = "30161"
* address.country = "DE"
* position.latitude = 52.3755
* position.longitude = 9.7320
* managingOrganization = Reference(LaborOrganization)
* partOf = Reference(LaborLocation)