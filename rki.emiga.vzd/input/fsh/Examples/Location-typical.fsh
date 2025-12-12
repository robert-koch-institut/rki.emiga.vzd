Instance: Location-typical
InstanceOf: EmigaLocation
Usage: #example

// ----------------------------------------------------
// META   
// ----------------------------------------------------
* meta.profile[emigaprofile] = "https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaLocation|2.0.0-alpha.16"

* meta.security[visibility] = $ResourceVisibilityType#internal
* meta.security[responsibility] = $ResourceResponsibility#1.

// Typical: all MustSupport tags included
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
// IDENTIFIERS — one per slice (typical values)
// ----------------------------------------------------
* identifier[emigaOrgvId].system = "https://emiga.rki.de/fhir/vzd/sid/EmigaOrgvId"
* identifier[emigaOrgvId].value = "ORGVID-44588965"

* identifier[emigaOrgvFileNumber].system = "https://emiga.rki.de/fhir/vzd/sid/EmigaOrgvFileNumber"
* identifier[emigaOrgvFileNumber].value = "FILE-44588965"

* identifier[IKNR].system = "http://fhir.de/sid/arge-ik/iknr"
* identifier[IKNR].value = "260300123"
* identifier[IKNR].period.start = "2021-01-01"

* identifier[BSNR].system = "https://fhir.kbv.de/NamingSystem/KBV_NS_Base_BSNR"
* identifier[BSNR].value = "123456789"

* identifier[LANR].system = "https://fhir.kbv.de/NamingSystem/KBV_NS_Base_ANR"
* identifier[LANR].value = "998877665"

* identifier[demisLaboratoryId].system = "https://demis.rki.de/fhir/NamingSystem/DemisLaboratoryId"
* identifier[demisLaboratoryId].value = "54321"

* identifier[demisParticipantId].system = "https://demis.rki.de/fhir/NamingSystem/DemisParticipantId"
* identifier[demisParticipantId].value = "778899"

* identifier[telematikID].system = "https://gematik.de/fhir/sid/telematik-id"
* identifier[telematikID].value = "3-987654321"

// ----------------------------------------------------
// CORE ATTRIBUTES
// ----------------------------------------------------
* status = #active
* name = "Stadt XYZ – Standort Musterstraße"
* alias = "ST-MSTR"
* description = "Dienststelle Musterstraße des Gesundheitsamts Stadt XYZ"

* mode = #instance

// ----------------------------------------------------
// ADDRESS — minimal + typical useful fields
// ----------------------------------------------------
* address.type = #physical
* address.city = "Musterstadt"
* address.state = "DE-BE"
* address.postalCode = "10115"
* address.country = "DE"

// Typical: include street information
* address.line = "Musterstraße 12"

// MS extensions for address
* address.extension[Stadtteil].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-precinct"
* address.extension[Stadtteil].valueString = "Musterbezirk"

* address.line.extension[Strasse].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName"
* address.line.extension[Strasse].valueString = "Musterstraße"

* address.line.extension[Hausnummer].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber"
* address.line.extension[Hausnummer].valueString = "12"

// Typical: include one optional address addition
* address.line.extension[Adresszusatz].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-additionalLocator"
* address.line.extension[Adresszusatz].valueString = "EG"

// ----------------------------------------------------
// POSITION — typical (longitude, latitude only)
// ----------------------------------------------------
* position.longitude = 13.4050
* position.latitude = 52.5200

// ----------------------------------------------------
// ORGANIZATIONAL LINKS
// ----------------------------------------------------
* managingOrganization = Reference(Organization/Organization-typical)
* managingOrganization.display = "Gesundheitsamt Stadt XYZ"

* partOf = Reference(Location/Location-parent-typical)
* partOf.display = "Hauptstandort Stadt XYZ"
