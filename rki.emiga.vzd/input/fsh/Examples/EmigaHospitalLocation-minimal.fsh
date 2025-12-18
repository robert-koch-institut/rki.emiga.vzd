Instance: EmigaHospitalLocationMinimal
InstanceOf: EmigaHospitalLocation
Usage: #example
Description: "Minimale Instanz eines Krankenhaus-Standorts (EMIGA)"

/* -------- meta -------- */
* meta.profile[emigaprofile] =
  "https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaHospitalLocation|2.0.0-alpha.16"
* meta.security[visibility] = $ResourceVisibilityType#public
* meta.security[responsibility] = $ResourceResponsibility#1.

/* -------- extensions (MS) -------- */

/* IneKVersionPeriod */
* extension[inekVersionPeriod].extension[validPeriod].valuePeriod.start = "2020-01-01"

/* IneKPostalAddress (MS slice) */
* extension[inekPostalAddress].valueAddress.type = #postal
* extension[inekPostalAddress].valueAddress.line = "Am Krankenhaus 2"
* extension[inekPostalAddress].valueAddress.line.extension[Strasse].valueString = "Am Krankenhaus"
* extension[inekPostalAddress].valueAddress.line.extension[Hausnummer].valueString = "2"
* extension[inekPostalAddress].valueAddress.city = "Warendorf"
* extension[inekPostalAddress].valueAddress.postalCode = "48231"

/* -------- identifier (1..* MS, all slices MS) -------- */

* identifier[emigaOrgvId].system = "https://emiga.rki.de/fhir/vzd/sid/EmigaOrgvId"
* identifier[emigaOrgvId].value = "0123456789"

* identifier[emigaOrgvFileNumber].system = "https://emiga.rki.de/fhir/vzd/sid/EmigaOrgvFileNumber"
* identifier[emigaOrgvFileNumber].value = "OrgvFile-001"

* identifier[standortId].system = "https://demis.rki.de/fhir/NamingSystem/InekStandortId"
* identifier[standortId].value = "771077"

* identifier[standortnummer-dkg].system = "http://fhir.de/sid/dkgev/standortnummer"
* identifier[standortnummer-dkg].value = "771077015"

* identifier[IKNR].system = "http://fhir.de/sid/arge-ik/iknr"
* identifier[IKNR].value = "260551132"

* identifier[BSNR].system = "https://fhir.kbv.de/NamingSystem/KBV_NS_Base_BSNR"
* identifier[BSNR].value = "197416600"

* identifier[demisParticipantId].system = "https://demis.rki.de/fhir/NamingSystem/DemisParticipantId"
* identifier[demisParticipantId].value = "DEMIS-123456"

* identifier[telematikID].system = "https://gematik.de/fhir/sid/telematik-id"
* identifier[telematikID].value = "987654321"


/* -------- status (1..1 MS) -------- */
* status = #active

/* -------- name (1..1 MS) -------- */
* name = "Josephs-Hospital Warendorf"

/* -------- alias (0..* MS) -------- */
* alias[0] = "Hauptstandort"

/* -------- description (0..1 MS) -------- */
* description = "Krankenhaus-Hauptstandort"

/* -------- mode (1..1 MS, fixed) -------- */
* mode = #instance

/* -------- type (MS → one slice) -------- */
* type[fachbereich].coding.system = $IHEXDSpracticeSettingCode
* type[fachbereich].coding.code = #ALLG
* type[fachbereich].coding.display = "Allgemeinmedizin"

/* -------- telecom (MS) -------- */
* telecom.system = #phone
* telecom.value = "+49-251-123456"

/* -------- address (0..1 MS) -------- */
* address.type = #both
* address.line = "Am Krankenhaus 2"

* address.line.extension[Strasse].valueString = "Am Krankenhaus"
* address.line.extension[Hausnummer].valueString = "2"
* address.line.extension[Adresszusatz].valueString = "Haupteingang"
* address.line.extension[Postfach].valueString = "Postfach 100"

* address.extension[municipalityKey].valueCoding.system = "http://fhir.de/sid/destatis/ags"
* address.extension[municipalityKey].valueCoding.code = #05570052
* address.extension[Stadtteil].valueString = "Innenstadt"

* address.city = "Warendorf"
* address.state = "DE-NW"
* address.postalCode = "48231"

/* -------- physicalType (MS) -------- */
* physicalType.coding.system = "http://terminology.hl7.org/CodeSystem/location-physical-type"
* physicalType.coding.code = #si
* physicalType.coding.display = "Site"

* position.longitude = 8.00235
* position.latitude = 51.96042

* position.extension[utmCoordinates].extension[UTM_Zone].valueString = "32U"
* position.extension[utmCoordinates].extension[UTM_Easting_X].valueDecimal = 431451
* position.extension[utmCoordinates].extension[UTM_Northing_Y].valueDecimal = 5757106

/* -------- managingOrganization (0..1 MS) -------- */
* managingOrganization.identifier.system = "http://fhir.de/sid/arge-ik/iknr"
* managingOrganization.identifier.value = "260551132"

/* -------- partOf (MS) -------- */
* partOf = Reference(EmigaHospitalLocation/parent-location)
