Instance: Location-minimal
InstanceOf: EmigaLocation
Usage: #example

// ----------------------------------------------------
// META (required & MustSupport)
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
// IDENTIFIERS — ALL SLICE MS ELEMENTS (1 per slice)
// ----------------------------------------------------
* identifier[emigaOrgvId].system = "https://emiga.rki.de/fhir/vzd/sid/EmigaOrgvId"
* identifier[emigaOrgvId].value = "ORGVID-123456"

* identifier[emigaOrgvFileNumber].system = "https://emiga.rki.de/fhir/vzd/sid/EmigaOrgvFileNumber"
* identifier[emigaOrgvFileNumber].value = "ORGV-FILE-78910"

* identifier[IKNR].system = "http://fhir.de/sid/arge-ik/iknr"
* identifier[IKNR].value = "123456789"
* identifier[IKNR].period.start = "2020-01-01"

* identifier[BSNR].system = "https://fhir.kbv.de/NamingSystem/KBV_NS_Base_BSNR"
* identifier[BSNR].value = "123456789"

* identifier[LANR].system = "https://fhir.kbv.de/NamingSystem/KBV_NS_Base_ANR"
* identifier[LANR].value = "987654321"

* identifier[demisLaboratoryId].system = "https://demis.rki.de/fhir/NamingSystem/DemisLaboratoryId"
* identifier[demisLaboratoryId].value = "54321"

* identifier[demisParticipantId].system = "https://demis.rki.de/fhir/NamingSystem/DemisParticipantId"
* identifier[demisParticipantId].value = "778899"

* identifier[telematikID].system = "https://gematik.de/fhir/sid/telematik-id"
* identifier[telematikID].value = "1-234567890"

// ----------------------------------------------------
// STATUS (0..1 MS → required in minimal)
// ----------------------------------------------------
* status = #active

// ----------------------------------------------------
// NAME (0..1 MS)
// ----------------------------------------------------
* name = "Standort Musterstraße"

// ----------------------------------------------------
// ALIAS (0..1 MS)
// ----------------------------------------------------
* alias = "ST-MSTR"

// ----------------------------------------------------
// DESCRIPTION (0..1 MS)
// ----------------------------------------------------
* description = "Beispielstandort für EMIGA minimal"

// ----------------------------------------------------
// MODE (1..1 MS, fixed to #instance)
// ----------------------------------------------------
* mode = #instance

// ----------------------------------------------------
// ADDRESS (0..1 MS) with all MS sub-elements & extensions
// ----------------------------------------------------
* address.type = #physical
* address.city = "Musterstadt"
* address.state = "DE-BE"
* address.postalCode = "10115"

// MS extensions
* address.extension[Stadtteil].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-precinct"
* address.extension[Stadtteil].valueString = "Musterbezirk"

* address.line = "Musterstraße 12"
* address.line.extension[Strasse].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName"
* address.line.extension[Strasse].valueString = "Musterstraße"

* address.line.extension[Hausnummer].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber"
* address.line.extension[Hausnummer].valueString = "12"

* address.line.extension[Adresszusatz].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-additionalLocator"
* address.line.extension[Adresszusatz].valueString = "EG"

* address.line.extension[Postfach].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-postBox"
* address.line.extension[Postfach].valueString = "Postfach 100"

// ----------------------------------------------------
// POSITION (0..1 MS)
// ----------------------------------------------------
* position.longitude = 13.4050
* position.latitude = 52.5200

// ----------------------------------------------------
// MANAGING ORGANIZATION (0..1 MS)
// ----------------------------------------------------
* managingOrganization = Reference(Organization/Organization-minimal)

// ----------------------------------------------------
// PART OF (0..1 MS)
// ----------------------------------------------------
* partOf = Reference(Location/ParentLocation-minimal) // Part Of: Refer OrganizationOrg.puml 
