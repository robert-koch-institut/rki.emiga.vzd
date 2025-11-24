Instance: HospitalRoomLocation
InstanceOf: EmigaHospitalRoomLocation
Usage: #example
Title: "KH Raum Beispiel"
Description: "Beispiel eines Raums in einer Krankenhaus."

* meta.security[visibility] = $ResourceVisibilityType#public
* meta.security[responsibility] = $ResourceResponsibility#1.
* meta.tag[relevance] = $RelevanceCS#UserCreated "Durch OEGD angelegt"
* meta.profile[emigaprofile] = "https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaHospitalRoomLocation|2.0.0-alpha.17"
//* extension[InekVersionPeriod].extension[version].valueInteger = 3
//* extension[inekVersionPeriod].extension[validPeriod].valuePeriod.start = "2019-01-01"
//* extension[ineKVersionPeriod].extension[lastChange].valueDate = "2024-03-06"
* identifier[emigaOrgvId].type = $v2-0203#XX
* identifier[emigaOrgvId].system = $EmigaOrgvId
* identifier[emigaOrgvId].value = "456789112"
* identifier[standortnummer-dkg].system = "http://fhir.de/sid/dkgev/standortnummer"
* identifier[standortnummer-dkg].value = "771077015"


* status = #active
* name = "Raum 101 am Test-Krankenhaus"
* mode = #instance

* operationalStatus.system = "http://terminology.hl7.org/CodeSystem/v2-0116"
* operationalStatus.code = #I
* operationalStatus.display = "Isoliert"
/*
* type.coding.system = $IneKFacilityTypeCS 
* type.coding.code = #15
* type.coding.display = "Zentrale Notaufnahme (ZNA) Erwachsene"
//* address.type = #physical
* address.line = "Am Krankenhaus 2"
//* address.extension[municipalityKey].url = "https://emiga.rki.de/fhir/common/Extension/MunicipalityKey"
//* address.extension[municipalityKey].valueCoding.system = "https://emiga.rki.de/fhir/common/CodeSystem/MunicipalityKey"
//* address.extension[municipalityKey].valueCoding.code = #05570052
*/
* address.line = "Eine Straße 1"
* address.line.extension[Strasse].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName"
* address.line.extension[Strasse].valueString = "Eine Straße"
* address.line.extension[Hausnummer].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber"
* address.line.extension[Hausnummer].valueString = "1"
* address.city = "EineStadt"
//* address.state = "DE-NW"
* address.postalCode = "99999"

* physicalType.coding.system = "http://terminology.hl7.org/CodeSystem/location-physical-type"
* physicalType.coding.code = #ro
* physicalType.coding.display = "Room"

//* address.state = "Niedersachsen"

//* address.country = "DE"
* managingOrganization.reference = "Organization/InekKrankenhaus"
* managingOrganization.identifier.system = $identifier-iknr
* managingOrganization.identifier.value = "88845888"
//* managingOrganization.identifier.extension[version].valueInteger = 1
