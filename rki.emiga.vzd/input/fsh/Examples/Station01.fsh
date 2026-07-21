Instance: Station01
InstanceOf: EmigaHospitalFacilityLocation
Usage: #example
Title: "Beispiel eines Stationsstandorts"
Description: "Beispiel eines Standorts, der eine Station in einem Krankenhaus beschreibt."

* meta.security[visibility] = $ResourceVisibilityType#public
* meta.security[responsibility] = $ResourceResponsibility#1.
* meta.tag[relevance] = $RelevanceCS#UserCreated "Durch OEGD angelegt"
* meta.profile[emigaprofile] = "https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaHospitalFacilityLocation"
* identifier[EmigaID].system = $EmigaID
* identifier[EmigaID].value = "987654321"
* identifier[EmigaFileNumber].system = $EmigaFileNumber
* identifier[EmigaFileNumber].value = "[Station][1.][2026]-[87654321]"
* status = #active
* name = "Station 1"
* mode = #instance
* type.coding.system = "http://terminology.hl7.org/CodeSystem/v3-RoleCode"
* type.coding.code = #HU
* type.coding.display = "Normalstation"
* address.line = "Eine Straße 1"
* address.line.extension[Strasse].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName"
* address.line.extension[Strasse].valueString = "Eine Straße"
* address.line.extension[Hausnummer].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber"
* address.line.extension[Hausnummer].valueString = "1"
* address.city = "Eine Stadt"
* address.postalCode = "99999"
* managingOrganization.reference = "Organization/InekKrankenhausOrganization"
* managingOrganization.identifier.system = $identifier-iknr
* managingOrganization.identifier.value = "260551132"

