Instance: EmigaHospitalLocationMaximal
InstanceOf: EmigaHospitalLocation
Usage: #example
Description: "Maximale Instanz eines Krankenhaus-Standorts (EMIGA)"

/* -------- meta -------- */
* meta.profile[emigaprofile] =
  "https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaHospitalLocation|2.0.0-alpha.16"
* meta.security[visibility] = $ResourceVisibilityType#public
* meta.security[responsibility] = $ResourceResponsibility#1.

/* -------- extensions -------- */
* extension[inekVersionPeriod].extension[version].valueInteger = 3
* extension[inekVersionPeriod].extension[validPeriod].valuePeriod.start = "2010-01-01"
* extension[inekVersionPeriod].extension[validPeriod].valuePeriod.end = "2040-12-31"
* extension[inekVersionPeriod].extension[lastChange].valueDate = "2024-03-06"

* extension[inekPostalAddress].valueAddress.type = #postal
* extension[inekPostalAddress].valueAddress.line = "Am Krankenhaus 2"
* extension[inekPostalAddress].valueAddress.line.extension[Strasse].valueString = "Am Krankenhaus"
* extension[inekPostalAddress].valueAddress.line.extension[Hausnummer].valueString = "2"
* extension[inekPostalAddress].valueAddress.city = "Warendorf"
* extension[inekPostalAddress].valueAddress.state = "DE-NW"
* extension[inekPostalAddress].valueAddress.postalCode = "48231"

/* -------- identifier (ALL slices) -------- */
* identifier[emigaOrgvId].system =
  "https://emiga.rki.de/fhir/vzd/sid/EmigaOrgvId"
* identifier[emigaOrgvId].value = "0123456789"

* identifier[emigaOrgvFileNumber].system =
  "https://emiga.rki.de/fhir/vzd/sid/EmigaOrgvFileNumber"
* identifier[emigaOrgvFileNumber].value = "OrgvFile-001"

* identifier[standortId].system =
  "https://demis.rki.de/fhir/NamingSystem/InekStandortId"
* identifier[standortId].value = "771077"

* identifier[standortnummer-dkg].system =
  "http://fhir.de/sid/dkgev/standortnummer"
* identifier[standortnummer-dkg].value = "771077015"

* identifier[IKNR].system =
  "http://fhir.de/sid/arge-ik/iknr"
* identifier[IKNR].value = "260551132"
* identifier[IKNR].period.start = "2010-01-01"

* identifier[BSNR].system =
  "https://fhir.kbv.de/NamingSystem/KBV_NS_Base_BSNR"
* identifier[BSNR].value = "197416600"

* identifier[demisParticipantId].system =
  "https://demis.rki.de/fhir/NamingSystem/DemisParticipantId"
* identifier[demisParticipantId].value = "DEMIS-123456"

* identifier[telematikID].system =
  "https://gematik.de/fhir/sid/telematik-id"
* identifier[telematikID].value = "987654321"

/* -------- status -------- */
* status = #active

/* -------- name / alias / description -------- */
* name = "Josephs-Hospital Warendorf"
* alias[0] = "Hauptstandort"
* alias[+] = "Josephs-Hospital Campus Warendorf"
* description = "Krankenhausstandort mit stationärer und ambulanter Versorgung"

/* -------- mode -------- */
* mode = #instance

/* -------- type -------- */
* type[fachbereich].coding.system = $IHEXDSpracticeSettingCode
* type[fachbereich].coding.code = #ALLG
* type[fachbereich].coding.display = "Allgemeinmedizin"

/* -------- telecom -------- */
* telecom.system = #phone
* telecom.value = "+49-251-123456"

/* -------- address -------- */
* address.type = #both
* address.line = "Am Krankenhaus 2"
* address.line.extension[Strasse].valueString = "Am Krankenhaus"
* address.line.extension[Hausnummer].valueString = "2"
* address.line.extension[Adresszusatz].valueString = "Gebäude A"
* address.line.extension[Postfach].valueString = "Postfach 100"
* address.extension[municipalityKey].valueCoding.system =
  "http://fhir.de/sid/destatis/ags"
* address.extension[municipalityKey].valueCoding.code = #05570052
* address.extension[Stadtteil].valueString = "Innenstadt"
* address.city = "Warendorf"
* address.state = "DE-NW"
* address.postalCode = "48231"

/* -------- physicalType -------- */
* physicalType.coding.system =
  "http://terminology.hl7.org/CodeSystem/location-physical-type"
* physicalType.coding.code = #si
* physicalType.coding.display = "Site"

/* -------- position -------- */
* position.latitude = 51.9604205
* position.longitude = 8.0023529
* position.altitude = 56

* position.extension[utmCoordinates].extension[UTM_Zone].valueString = "32U"
* position.extension[utmCoordinates].extension[UTM_Easting_X].valueDecimal = 431451
* position.extension[utmCoordinates].extension[UTM_Northing_Y].valueDecimal = 5757106

/* -------- managingOrganization -------- */
* managingOrganization.reference = "Organization/JosephsHospital"
* managingOrganization.identifier.system = "http://fhir.de/sid/arge-ik/iknr"
* managingOrganization.identifier.value = "260551132"

/* -------- partOf (MS) -------- */
* partOf = Reference(EmigaHospitalLocation/parent-location)
