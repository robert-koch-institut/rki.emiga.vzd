Instance: EmigaHospitalLocationTypical
InstanceOf: EmigaHospitalLocation
Usage: #example
Description: "Typische Instanz eines Krankenhaus-Standorts (EMIGA)"

/* -------- meta -------- */
* meta.profile[emigaprofile] =
  "https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaHospitalLocation|2.0.0-alpha.16"
* meta.security[visibility] = $ResourceVisibilityType#public
* meta.security[responsibility] = $ResourceResponsibility#1.

/* -------- extensions -------- */
* extension[inekVersionPeriod].extension[validPeriod].valuePeriod.start = "2015-01-01"
* extension[inekVersionPeriod].extension[validPeriod].valuePeriod.end = "2035-12-31"

* extension[inekPostalAddress].valueAddress.type = #postal
* extension[inekPostalAddress].valueAddress.line = "Am Krankenhaus 2"
* extension[inekPostalAddress].valueAddress.line.extension[Strasse].valueString = "Am Krankenhaus"
* extension[inekPostalAddress].valueAddress.line.extension[Hausnummer].valueString = "2"
* extension[inekPostalAddress].valueAddress.city = "Warendorf"
* extension[inekPostalAddress].valueAddress.postalCode = "48231"

/* -------- identifier -------- */
* identifier[emigaOrgvId].system = "https://emiga.rki.de/fhir/vzd/sid/EmigaOrgvId"
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

/* -------- status -------- */
* status = #active

/* -------- name / alias / description -------- */
* name = "Josephs-Hospital Warendorf"
* alias[0] = "Hauptstandort"
* alias[+] = "Josephs-Hospital Zentrale"
* description = "Zentraler Krankenhausstandort mit Notaufnahme"

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
* position.latitude = 51.96042
* position.longitude = 8.00235

/* -------- managingOrganization -------- */
* managingOrganization.reference = "Organization/JosephsHospital"
* managingOrganization.identifier.system =
  "http://fhir.de/sid/arge-ik/iknr"
* managingOrganization.identifier.value = "260551132"

/* -------- partOf -------- */
* partOf = Reference(EmigaHospitalLocation/campus-warendorf)
