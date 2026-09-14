Instance: CreateOrganizationBundle
InstanceOf: Bundle
Usage: #example
Title: "Organization Erstellung Transaction Bundle Beispiel"
Description: "Beispiel eines Transaction Bundle zum Erstellen eines Krankenhauses mit seinen beiden Standorten"
* type = #transaction
* timestamp = 2026-09-14T12:00:00Z

// Entry 1: Create the Hospital Organization
* entry[0].fullUrl = "urn:uuid:hospital-org-12345678"
* entry[0].resource = ExampleEmigaOrganization
* entry[0].request.method = #POST
* entry[0].request.url = "Organization"

// Entry 2: Create the Hospital Location (Standort)
* entry[1].fullUrl = "urn:uuid:hospital-location-87654321"
* entry[1].resource = ExampleEmigaLocation
* entry[1].request.method = #POST
* entry[1].request.url = "Location"

// Entry 3: Create the Hospital Facility Location (Einrichtungsstandort)
* entry[2].fullUrl = "urn:uuid:facility-location-11223344"
* entry[2].resource = ExampleEmigaFacilityLocation
* entry[2].request.method = #POST
* entry[2].request.url = "Location"


Instance: ExampleEmigaOrganization
InstanceOf: EmigaHospitalOrganization
Title: "Josephs-Krankenhaus"

Usage: #inline

// -------- meta -------- 
* meta.profile[emigaprofile] = "https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaHospitalOrganization"
* meta.security[visibility] = $ResourceVisibilityType#public
* meta.security[responsibility] = $ResourceResponsibility#1.

// -------- extensions -------- 
* extension[inekVersionPeriod].extension[version].valueInteger = 3
* extension[inekVersionPeriod].extension[validPeriod].valuePeriod.start = "2010-01-01"
* extension[inekVersionPeriod].extension[lastChange].valueDate = "2024-03-06"

// -------- identifier -------- 
* identifier[EmigaID].system = "https://emiga.rki.de/fhir/sid/EmigaID"
* identifier[EmigaID].value = "0123456789"
* identifier[EmigaID].use = #official

* identifier[EmigaFileNumber].system = "https://emiga.rki.de/fhir/sid/EmigaFileNumber"
* identifier[EmigaFileNumber].value = "[Krankenhaus][1.][2026]-[12345678]"
* identifier[EmigaFileNumber].use = #official

* identifier[IKNR].system = "http://fhir.de/sid/arge-ik/iknr"
* identifier[IKNR].value = "260551132"
* identifier[IKNR].period.start = "2010-01-01"

* identifier[BSNR].system = "https://fhir.kbv.de/NamingSystem/KBV_NS_Base_BSNR"
* identifier[BSNR].value = "197416600"

// -------- status -------- 
* active = true

// -------- name / -------- 
* name = "Josephs-Krankenhaus"

// -------- type -------- 
* type[emigaOrganizationType].coding.system = $DemisOrgType
* type[emigaOrganizationType].coding.code = #hospital
* type[emigaOrganizationType].coding.display = "Krankenhaus"

// -------- telecom -------- 
* telecom[Phone].system = #phone
* telecom[Phone].value = "+49 251 123456"

* telecom[Email].system = #email
* telecom[Email].value = "info@josephs-krankenhaus.de"

// -------- address -------- 
* address.type = #both
* address.line[0] = "Am Krankenhaus 2"
* address.line[0].extension[Strasse].valueString = "Am Krankenhaus"
* address.line[0].extension[Hausnummer].valueString = "2"
* address.line[0].extension[Adresszusatz].valueString = "Gebäude A"
* address.extension[Stadtteil].valueString = "Innenstadt"
* address.city = "Warendorf"
* address.state = "DE-NW"
* address.postalCode = "48231"

// entry[1] -> Josephs-Krankenhaus Standort

Instance: ExampleEmigaLocation
InstanceOf: EmigaHospitalLocation
Title: "Josephs-Krankenhaus Standort"

Usage: #inline

// -------- meta -------- 
* meta.profile[emigaprofile] = "https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaHospitalLocation"
* meta.security[visibility] = $ResourceVisibilityType#public
* meta.security[responsibility] = $ResourceResponsibility#1.

// -------- extensions -------- 
* extension[inekVersionPeriod].extension[version].valueInteger = 3
* extension[inekVersionPeriod].extension[validPeriod].valuePeriod.start = "2010-01-01"
* extension[inekVersionPeriod].extension[lastChange].valueDate = "2024-03-06"

* extension[inekPostalAddress].valueAddress.type = #postal
* extension[inekPostalAddress].valueAddress.line = "Am Krankenhaus 2"
* extension[inekPostalAddress].valueAddress.line.extension[Strasse].valueString = "Am Krankenhaus"
* extension[inekPostalAddress].valueAddress.line.extension[Hausnummer].valueString = "2"
* extension[inekPostalAddress].valueAddress.city = "Warendorf"
* extension[inekPostalAddress].valueAddress.state = "DE-NW"
* extension[inekPostalAddress].valueAddress.postalCode = "48231"

// -------- identifier -------- 
* identifier[EmigaID].system = "https://emiga.rki.de/fhir/sid/EmigaID"
* identifier[EmigaID].value = "0123456789"
* identifier[EmigaID].use = #official

* identifier[EmigaFileNumber].system = "https://emiga.rki.de/fhir/sid/EmigaFileNumber"
* identifier[EmigaFileNumber].value = "[Standort][1.][2026]-[12345678]"
* identifier[EmigaFileNumber].use = #official

* identifier[standortnummer-dkg].system = "http://fhir.de/sid/dkgev/standortnummer"
* identifier[standortnummer-dkg].value = "771077015"

* identifier[IKNR].system = "http://fhir.de/sid/arge-ik/iknr"
* identifier[IKNR].value = "260551132"
* identifier[IKNR].period.start = "2010-01-01"

// -------- status -------- 
* status = #active

// -------- name / alias -------- 
* name = "Josephs-Krankenhaus Standort"


// -------- mode -------- 
* mode = #instance

// -------- type -------- 
* type[fachbereich].coding.system = $IHEXDSpracticeSettingCode
* type[fachbereich].coding.code = #ALLG
* type[fachbereich].coding.display = "Allgemeinmedizin"

// -------- telecom -------- 
* telecom.system = #phone
* telecom.value = "+49 251 123456"

// -------- address -------- 
* address.type = #both
* address.line[0] = "Am Krankenhaus 2"
* address.line[0].extension[Strasse].valueString = "Am Krankenhaus"
* address.line[0].extension[Hausnummer].valueString = "2"
* address.line[0].extension[Adresszusatz].valueString = "Gebäude A"
* address.extension[Stadtteil].valueString = "Innenstadt"
* address.city = "Warendorf"
* address.state = "DE-NW"
* address.postalCode = "48231"

// -------- physicalType -------- 
* physicalType.coding.system = "http://terminology.hl7.org/CodeSystem/location-physical-type"
* physicalType.coding.code = #si
* physicalType.coding.display = "Site"

// -------- position -------- 
* position.latitude = 51.9604205
* position.longitude = 8.0023529
* position.altitude = 56

* position.extension[utmCoordinates].extension[UTM_Zone].valueString = "32U"
* position.extension[utmCoordinates].extension[UTM_Easting_X].valueDecimal = 431451
* position.extension[utmCoordinates].extension[UTM_Northing_Y].valueDecimal = 5757106

// -------- managing organization -------- 
* managingOrganization.reference = "urn:uuid:hospital-org-12345678"

// entry[2] -> Josephs-Krankenhaus Station A

Instance: ExampleEmigaFacilityLocation
InstanceOf: EmigaHospitalFacilityLocation
Title: "Josephs-Krankenhaus Station A"
Description: "Beispiel für einen Einrichtungsstandort innerhalb des Josephs-Krankenhauses."
Usage: #inline

// -------- meta -------- 
* meta.profile[emigaprofile] = "https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaHospitalFacilityLocation"
* meta.security[visibility] = $ResourceVisibilityType#public
* meta.security[responsibility] = $ResourceResponsibility#1.

// -------- extensions -------- 
* extension[inekVersionPeriod].extension[version].valueInteger = 3
* extension[inekVersionPeriod].extension[validPeriod].valuePeriod.start = "2010-01-01"
* extension[inekVersionPeriod].extension[lastChange].valueDate = "2024-03-06"

// -------- identifier -------- 
* identifier[EmigaID].system = "https://emiga.rki.de/fhir/sid/EmigaID"
* identifier[EmigaID].value = "0123456789-A"
* identifier[EmigaID].use = #official

* identifier[EmigaFileNumber].system = "https://emiga.rki.de/fhir/sid/EmigaFileNumber"
* identifier[EmigaFileNumber].value = "[Einrichtung][1.][2026]-[12345679]"
* identifier[EmigaFileNumber].use = #official

* identifier[standortnummer-dkg].system = "http://fhir.de/sid/dkgev/standortnummer"
* identifier[standortnummer-dkg].value = "771077015"

* identifier[abrechnungs-IKNR].system = "http://fhir.de/sid/arge-ik/iknr"
* identifier[abrechnungs-IKNR].value = "260551132"
* identifier[abrechnungs-IKNR].period.start = "2010-01-01"

// -------- status -------- 
* status = #active

//-------- name / alias -------- 
* name = "Station A"

// -------- mode -------- 
* mode = #instance

// -------- type -------- 
* type[inekFacilityType].coding.system = $IneKFacilityTypeCS
* type[inekFacilityType].coding.code = #00
* type[inekFacilityType].coding.display = "Stationäre Behandlung"

// -------- address -------- 
* address.type = #physical
* address.line[0] = "Am Krankenhaus 2"
* address.line[0].extension[Strasse].valueString = "Am Krankenhaus"
* address.line[0].extension[Hausnummer].valueString = "2"
* address.line[0].extension[Adresszusatz].valueString = "Gebäude A, 1. Etage"

* address.city = "Warendorf"
* address.state = "DE-NW"
* address.postalCode = "48231"

// -------- physicalType -------- 
* physicalType.coding.system = "http://terminology.hl7.org/CodeSystem/location-physical-type"
* physicalType.coding.code = #wa
* physicalType.coding.display = "Ward"

// -------- position -------- 
* position.latitude = 51.9604205
* position.longitude = 8.0023529
* position.altitude = 56

// -------- managing organization -------- 
* managingOrganization.reference = "urn:uuid:hospital-org-12345678"

// -------- partOf (reference to main location) -------- 
* partOf.reference = "urn:uuid:hospital-location-87654321"