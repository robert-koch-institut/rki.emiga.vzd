Instance: InekEinricthung01
InstanceOf: EmigaHospitalFacilityLocation
Usage: #example
Title: "InEK Standort Beispiel"
Description: "Beispiel eines Standorts aus dem InEK Standortverzeichnis."

* meta.security[visibility] = $ResourceVisibilityType#public
* meta.security[responsibility] = $ResourceResponsibility#1.
* meta.tag[relevance] = $RelevanceCS#InEK "InEK Standortverzeichnis"
* meta.profile[emigaprofile] = "https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaHospitalFacilityLocation|2.0.0-alpha.13"
//* extension[InekVersionPeriod].extension[version].valueInteger = 3
* extension[inekVersionPeriod].extension[validPeriod].valuePeriod.start = "2019-01-01"
//* extension[ineKVersionPeriod].extension[lastChange].valueDate = "2024-03-06"
* identifier[emigaOrgvId].type = $v2-0203#XX
* identifier[emigaOrgvId].system = $EmigaOrgvId
* identifier[emigaOrgvId].value = "9876543210"
* identifier[standortnummer-dkg].system = "http://fhir.de/sid/dkgev/standortnummer"
* identifier[standortnummer-dkg].value = "771077015"

* identifier[abrechnungs-IKNR].system = "http://fhir.de/sid/arge-ik/iknr"
* identifier[abrechnungs-IKNR].value = "260551132"
* identifier[abrechnungs-IKNR].period.start = "2019-01-01"
* identifier[BSNR].system = "https://fhir.kbv.de/NamingSystem/KBV_NS_Base_BSNR"
* identifier[BSNR].value = "197416600"
* identifier[BSNR].period.start = "2019-01-01"
* status = #active
* name = "Zentrale Notaufnahme am Josephs-Hospital Warendorf"
* mode = #instance

* type.coding.system = $IneKFacilityTypeCS 
* type.coding.code = #15
* type.coding.display = "Zentrale Notaufnahme (ZNA) Erwachsene"
//* address.type = #physical
* address.line = "Am Krankenhaus 2"
//* address.extension[municipalityKey].url = "https://emiga.rki.de/fhir/common/Extension/MunicipalityKey"
//* address.extension[municipalityKey].valueCoding.system = "https://emiga.rki.de/fhir/common/CodeSystem/MunicipalityKey"
//* address.extension[municipalityKey].valueCoding.code = #05570052

* address.line.extension[Strasse].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName"
* address.line.extension[Strasse].valueString = "Am Krankenhaus"
* address.line.extension[Hausnummer].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber"
* address.line.extension[Hausnummer].valueString = "2"
* address.city = "Warendorf"
//* address.state = "DE-NW"
* address.postalCode = "48231"


* position.latitude = 51.960708114667
* position.longitude = 8.002224147303
* position.extension[UTMCoordinates].extension[UTM_Zone].valueString = "32U"
* position.extension[UTMCoordinates].extension[UTM_Easting_X].valueDecimal = 431443
* position.extension[UTMCoordinates].extension[UTM_Northing_Y].valueDecimal = 5757138
//* address.state = "Niedersachsen"

//* address.country = "DE"
* managingOrganization.reference = "Organization/InekKrankenhaus"
* managingOrganization.identifier.system = $identifier-iknr
* managingOrganization.identifier.value = "260551132"
//* managingOrganization.identifier.extension[version].valueInteger = 1
