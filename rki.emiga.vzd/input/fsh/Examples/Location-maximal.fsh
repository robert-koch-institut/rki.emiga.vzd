Instance: Location-maximal
InstanceOf: EmigaLocation
Usage: #example

// ----------------------------------------------------
// META (EMIGA profile + security + tags)
// ----------------------------------------------------
* meta.profile[emigaprofile] = "https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaLocation|2.0.0-alpha.16"

* meta.security[visibility] = $ResourceVisibilityType#internal
* meta.security[responsibility] = $ResourceResponsibility#1.

// meta.tag slices (all MS)
// * meta.tag[relevance].system = $RelevanceCS
// * meta.tag[relevance].code = #primary
// * meta.tag[relevance].display = "Primärer Datensatz"

// * meta.tag[orgvBundleId].system = $BundleIdCS
// * meta.tag[orgvBundleId].code = #orgv-bundle-001
// * meta.tag[orgvBundleId].display = "OrgV Bundle 001"

// * meta.tag[orgvBundleVersion].system = $BundleVersionCS
// * meta.tag[orgvBundleVersion].code = #1.0.0
// * meta.tag[orgvBundleVersion].display = "Bundle Version 1.0.0"

// ----------------------------------------------------
// IDENTIFIERS — all slices populated
// ----------------------------------------------------
* identifier[emigaOrgvId].system = "https://emiga.rki.de/fhir/vzd/sid/EmigaOrgvId"
* identifier[emigaOrgvId].value = "ORGVID-123456"
* identifier[emigaOrgvId].use = #official

* identifier[emigaOrgvFileNumber].system = "https://emiga.rki.de/fhir/vzd/sid/EmigaOrgvFileNumber"
* identifier[emigaOrgvFileNumber].value = "ORGV-FILE-78910"
* identifier[emigaOrgvFileNumber].use = #secondary

* identifier[IKNR].system = "http://fhir.de/sid/arge-ik/iknr"
* identifier[IKNR].value = "123456789"
* identifier[IKNR].period.start = "2020-01-01"
* identifier[IKNR].period.end = "2030-12-31"

* identifier[BSNR].system = "https://fhir.kbv.de/NamingSystem/KBV_NS_Base_BSNR"
* identifier[BSNR].value = "234567890"

* identifier[LANR].system = "https://fhir.kbv.de/NamingSystem/KBV_NS_Base_ANR"
* identifier[LANR].value = "987654321"

* identifier[demisLaboratoryId].system = "https://demis.rki.de/fhir/NamingSystem/DemisLaboratoryId"
* identifier[demisLaboratoryId].value = "54321"

* identifier[demisParticipantId].system = "https://demis.rki.de/fhir/NamingSystem/DemisParticipantId"
* identifier[demisParticipantId].value = "778899"

* identifier[telematikID].system = "https://gematik.de/fhir/sid/telematik-id"
* identifier[telematikID].value = "1-234567890"

// ----------------------------------------------------
// CORE ATTRIBUTES
// ----------------------------------------------------
* status = #active

* name = "Stadt XYZ – FB 9 / Standort Musterstraße"
* alias = "FB9-MSTR"
* description = "Beispielstandort für EMIGA maximal"

* mode = #instance

// ----------------------------------------------------
// ADDRESS (full, with all EMIGA MS extensions)
// ----------------------------------------------------
* address.use = #work
* address.type = #physical
* address.text = "Musterstraße 12, 10115 Musterstadt"
* address.city = "Musterstadt"
* address.state = "DE-BE"
* address.postalCode = "10115"
* address.country = "DE"

// Stadtteil extension
* address.extension[Stadtteil].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-precinct"
* address.extension[Stadtteil].valueString = "Musterbezirk"

// Line + line extensions
* address.line[0] = "Musterstraße 12"
* address.line[0].extension[Strasse].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName"
* address.line[0].extension[Strasse].valueString = "Musterstraße"

* address.line[0].extension[Hausnummer].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber"
* address.line[0].extension[Hausnummer].valueString = "12"

* address.line[0].extension[Adresszusatz].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-additionalLocator"
* address.line[0].extension[Adresszusatz].valueString = "Haus A, EG"

* address.line[0].extension[Postfach].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-postBox"
* address.line[0].extension[Postfach].valueString = "Postfach 100"

// ----------------------------------------------------
// POSITION (0..1 MS) — longitude, latitude, altitude
// ----------------------------------------------------
* position.longitude = 13.4050
* position.latitude = 52.5200
* position.altitude = 35.2   // Not included in minimal or typical (completely optional)

// ----------------------------------------------------
// MANAGING ORGANIZATION & PART-OF
// ----------------------------------------------------
* managingOrganization = Reference(Organization/Organization-maximal)
* managingOrganization.display = "Gesundheitsamt Stadt XYZ"

* partOf = Reference(Location/Location-parent)
* partOf.display = "Hauptstandort Stadt XYZ"
