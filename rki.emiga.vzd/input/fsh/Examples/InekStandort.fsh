Instance: IneKStandort
InstanceOf: EmigaHospitalLocation
Usage: #example
Title: "InEK Standort Beispiel"
Description: "Beispiel eines Standorts aus dem InEK Standortverzeichnis."

* meta.security[visibility] = $ResourceVisibilityType#public
* meta.security[responsibility] = $ResourceResponsibility#1.
* meta.tag[relevance] = $RelevanceCS#InEK "InEK Standortverzeichnis"
* meta.profile[emigaprofile] = "https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaHospitalLocation|2.0.0-alpha.13"
* extension[inekVersionPeriod].extension[version].valueInteger = 3
* extension[inekVersionPeriod].extension[validPeriod].valuePeriod.start = "2019-01-01"
* extension[inekVersionPeriod].extension[lastChange].valueDate = "2024-03-06"
* extension[inekPostalAddress].valueAddress.type = #postal
* extension[inekPostalAddress].valueAddress.line = "Am Krankenhaus 2"
* extension[inekPostalAddress].valueAddress.line.extension[Strasse].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName"
* extension[inekPostalAddress].valueAddress.line.extension[Strasse].valueString = "Am Krankenhaus"
* extension[inekPostalAddress].valueAddress.line.extension[Hausnummer].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber"
* extension[inekPostalAddress].valueAddress.line.extension[Hausnummer].valueString = "2"
* extension[inekPostalAddress].valueAddress.city = "Warendorf"
* extension[inekPostalAddress].valueAddress.postalCode = "48231"

* identifier[emigaOrgvId].type = $v2-0203#XX
* identifier[emigaOrgvId].system = $EmigaOrgvId
* identifier[emigaOrgvId].value = "0123456789"
* identifier[standortId].system = "https://demis.rki.de/fhir/NamingSystem/InekStandortId"
* identifier[standortId].value = "771077"
* status = #active
* name = "Josephs-Hospital Warendorf"
* mode = #instance
* address.type = #both
* address.line = "Am Krankenhaus 2"
* address.extension[municipalityKey].url = "http://fhir.de/StructureDefinition/destatis/ags"
* address.extension[municipalityKey].valueCoding.system = "http://fhir.de/sid/destatis/ags"
* address.extension[municipalityKey].valueCoding.code = #05570052

* address.line.extension[Strasse].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName"
* address.line.extension[Strasse].valueString = "Am Krankenhaus"
* address.line.extension[Hausnummer].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber"
* address.line.extension[Hausnummer].valueString = "2"
* address.city = "Warendorf"
* address.state = "DE-NW"

* physicalType.coding.system = "http://terminology.hl7.org/CodeSystem/location-physical-type"
* physicalType.coding.code = #si
* physicalType.coding.display = "Site"


* position.latitude = 51.960420529706
* position.longitude = 8.002352893336
* position.extension[UTMCoordinates].extension[UTM_Zone].valueString = "32U"
* position.extension[UTMCoordinates].extension[UTM_Easting_X].valueDecimal = 431451
* position.extension[UTMCoordinates].extension[UTM_Northing_Y].valueDecimal = 5757106
//* address.state = "Niedersachsen"
* address.postalCode = "48231"
//* address.country = "DE"
* managingOrganization.identifier.system = $identifier-iknr
* managingOrganization.identifier.value = "260551132"
* managingOrganization.identifier.extension[inekVersionPeriod].extension[version].valueInteger = 1