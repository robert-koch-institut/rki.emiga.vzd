Instance: Organization-maximal
InstanceOf: EmigaOrganization
Usage: #example

// ----------------------------------------------------
// META (profile + security)
// ----------------------------------------------------
* meta.profile[emigaprofile] = "https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaOrganization"
* meta.security[visibility] = $ResourceVisibilityType#inPublicHealthService
* meta.security[responsibility] = $ResourceResponsibility#1.

// ----------------------------------------------------
// EXTENSION — organizationPeriod (MS, 0..*)
// ----------------------------------------------------
* extension[organizationPeriod].url = $OrganizationPeriod
* extension[organizationPeriod].valuePeriod.start = "2000-01-01"
* extension[organizationPeriod].valuePeriod.end = "2030-12-31"

// ----------------------------------------------------
// IDENTIFIERS — all slices populated (all MS)
// ----------------------------------------------------
* identifier[emigaOrgvId].system = "https://emiga.rki.de/fhir/vzd/sid/EmigaOrgvId"
* identifier[emigaOrgvId].value = "ORGVID-999999"
* identifier[emigaOrgvId].use = #official

* identifier[emigaOrgvFileNumber].system = "https://emiga.rki.de/fhir/vzd/sid/EmigaOrgvFileNumber"
* identifier[emigaOrgvFileNumber].value = "ORGVFILE-2025001"
* identifier[emigaOrgvFileNumber].use = #secondary

* identifier[IKNR].system = "http://fhir.de/sid/arge-ik/iknr"
* identifier[IKNR].value = "123456789"
* identifier[IKNR].period.start = "2015-01-01"
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
// ACTIVE (1..1 MS)
// ----------------------------------------------------
* active = true

// ----------------------------------------------------
// TYPE — emigaOrganizationType slice (1..1 MS)
// ----------------------------------------------------
* type[emigaOrganizationType] = $OrganizationType#sepFedAut "Oberste Bundesbehörde"

// ----------------------------------------------------
// NAME — required (1..1 MS)
// ----------------------------------------------------
* name = "Bundesministerium für Musterwesen – Hauptsitz"

// ----------------------------------------------------
// ALIAS (0..1 MS)
// ----------------------------------------------------
* alias = "BM-MW-HQ"

// ----------------------------------------------------
// TELECOM — all slices included (all MS)
// ----------------------------------------------------
* telecom[Email][0].system = #email
* telecom[Email][0].value = "kontakt@musterbund.de"

* telecom[Phone][0].system = #phone
* telecom[Phone][0].value = "+49 30 1234567"

* telecom[Fax][0].system = #fax
* telecom[Fax][0].value = "+49 30 7654321"

* telecom[Url][0].system = #url
* telecom[Url][0].value = "https://www.musterbund.de"

// ----------------------------------------------------
// ADDRESS — full MS structure (0..1 MS)
// ----------------------------------------------------
/* -------- address -------- */
* address[0].line[0] = "Musterstraße 1"
* address[0].line[0].extension[Strasse].valueString = "Musterstraße"
* address[0].line[0].extension[Hausnummer].valueString = "1"
* address[0].line[0].extension[Adresszusatz].valueString = "Gebäude A"
* address[0].extension[Stadtteil].valueString = "Zentrum"
* address[0].line[1] = "Zentrum"
* address[0].city = "Musterstadt"
* address[0].state = "DE-BB"
* address[0].postalCode = "12345"


// ----------------------------------------------------
// PART OF — 0..1 MS
// ----------------------------------------------------
* partOf = Reference(Organization/Organization-minimal)
* partOf.display = "Übergeordnete Organisation"

