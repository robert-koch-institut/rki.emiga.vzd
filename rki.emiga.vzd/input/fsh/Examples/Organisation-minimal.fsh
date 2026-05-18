Instance: Organization-minimal
InstanceOf: EmigaOrganization
Usage: #example

// ----------------------------------------------------
// META (required MustSupport elements)
// ----------------------------------------------------
* meta.profile[emigaprofile] = "https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaOrganization"

* meta.security[visibility] = $ResourceVisibilityType#inPublicHealthService
* meta.security[responsibility] = $ResourceResponsibility#1.

// (meta.tag slices also MS but we do NOT include them because you explicitly
// decided earlier that missing ValueSets make them inactive)

// ----------------------------------------------------
// EXTENSION — organizationPeriod (MS, 0..*)
// ----------------------------------------------------
* extension[organizationPeriod].url = $OrganizationPeriod
* extension[organizationPeriod].valuePeriod.start = "2020-01-01"

// ----------------------------------------------------
// IDENTIFIERS — all slices included once (all MS)
// ----------------------------------------------------
* identifier[emigaOrgvId].system = "https://emiga.rki.de/fhir/vzd/sid/EmigaOrgvId"
* identifier[emigaOrgvId].value = "ORGVID-001"

* identifier[emigaOrgvFileNumber].system = "https://emiga.rki.de/fhir/vzd/sid/EmigaOrgvFileNumber"
* identifier[emigaOrgvFileNumber].value = "ORGVFILE-001"

* identifier[IKNR].system = "http://fhir.de/sid/arge-ik/iknr"
* identifier[IKNR].value = "123456789"
* identifier[IKNR].period.start = "2020-01-01"

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
// ACTIVE (1..1 MS)
// ----------------------------------------------------
* active = true

// ----------------------------------------------------
// TYPE — emigaOrganizationType slice (1..1 MS)
// ----------------------------------------------------
* type[emigaOrganizationType] = $OrganizationType#sepFedAut "Oberste Bundesbehörde"

// ----------------------------------------------------
// NAME — required 1..1 MS
// ----------------------------------------------------
* name = "Stadt XYZ - Oberste Bundesbehörde"

// ----------------------------------------------------
// ALIAS — 0..1 MS
// ----------------------------------------------------
* alias = "SK-XYZ"   // Stadt XYZ abbreviation

// ----------------------------------------------------
// TELECOM — all slices included once (all MS)
// ----------------------------------------------------
* telecom[Email].system = #email
* telecom[Email].value = "info@muster.org"

* telecom[Phone].system = #phone
* telecom[Phone].value = "0123 4567890"

* telecom[Url].system = #url
* telecom[Url].value = "https://www.muster.org"

* telecom[Fax].system = #fax
* telecom[Fax].value = "0123 4567899"

// ----------------------------------------------------
// ADDRESS — 0..1 MS + all MS address extensions
// ----------------------------------------------------
* address.type = #postal
* address.city = "Musterstadt"
* address.state = "DE-BE"
* address.postalCode = "10115"

// Required MS extensions
* address.extension[Stadtteil].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-precinct"
* address.extension[Stadtteil].valueString = "Zentrum"
* address.line[0] = "Musterstraße 12"
* address.line[0].extension[Strasse].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName"
* address.line[0].extension[Strasse].valueString = "Musterstraße"
* address.line[0].extension[Hausnummer].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber"
* address.line[0].extension[Hausnummer].valueString = "12"
* address.line[0].extension[Adresszusatz].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-additionalLocator"
* address.line[0].extension[Adresszusatz].valueString = "EG"
* address.line[1] = "Zentrum"


// ----------------------------------------------------
// PART OF — 0..1 MS (optional in minimal, but we include it here to show how to reference the minimal Organization as parent)
// ----------------------------------------------------
// * partOf = Reference(Organization/Organization-minimal)
