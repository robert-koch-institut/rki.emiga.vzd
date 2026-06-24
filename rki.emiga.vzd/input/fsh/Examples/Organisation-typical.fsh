Instance: Organization-typical
InstanceOf: EmigaOrganization
Usage: #example

// ----------------------------------------------------
// META (required MustSupport)
// ----------------------------------------------------
* meta.profile[emigaprofile] = "https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaOrganization"
* meta.security[visibility] = $ResourceVisibilityType#inPublicHealthService
* meta.security[responsibility] = $ResourceResponsibility#1.

// ----------------------------------------------------
// EXTENSION — organizationPeriod (MS, 0..*)
// (Typical: include start only)
// ----------------------------------------------------
* extension[organizationPeriod].url = $OrganizationPeriod
* extension[organizationPeriod].valuePeriod.start = "2010-01-01"

// ----------------------------------------------------
// IDENTIFIERS — typical subset of the MS slices
// (EmigaOrgvId + FileNumber + one medical identifier)
// ----------------------------------------------------
* identifier[emigaOrgvId].system = "https://emiga.rki.de/fhir/vzd/sid/EmigaOrgvId"
* identifier[emigaOrgvId].value = "ORGVID-123456"

* identifier[emigaOrgvFileNumber].system = "https://emiga.rki.de/fhir/vzd/sid/EmigaOrgvFileNumber"
* identifier[emigaOrgvFileNumber].value = "ORGVFILE-2025"

* identifier[BSNR].system = "https://fhir.kbv.de/NamingSystem/KBV_NS_Base_BSNR"
* identifier[BSNR].value = "234567890"

// ----------------------------------------------------
// ACTIVE (1..1 MS)
// ----------------------------------------------------
* active = true

// ----------------------------------------------------
// TYPE — emigaOrganizationType slice (1..1 MS)
// (Typical: common category “Landesbehörde” or “Gesundheitsamt”)
// ----------------------------------------------------
* type[emigaOrganizationType] = $OrganizationType#sepFedAut "Oberste Bundesbehörde"

// ----------------------------------------------------
// NAME — required
// ----------------------------------------------------
* name = "Bundesministerium für Musterwesen – Hauptsitz"

// ----------------------------------------------------
// ALIAS — 0..1 MS
// ----------------------------------------------------
* alias = "BM-MW-HQ"

// ----------------------------------------------------
// TELECOM — common channels (not all slices like maximal)
// ----------------------------------------------------
* telecom[Email].system = #email
* telecom[Email].value = "kontakt@ga-musterstadt.de"

* telecom[Phone].system = #phone
* telecom[Phone].value = "01234 567890"

// (Url typical, Fax usually not included)
* telecom[Url].system = #url
* telecom[Url].value = "https://www.ga-musterstadt.de"

* address.extension[Stadtteil].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-precinct"
* address.extension[Stadtteil].valueString = "Zentrum"
* address.line[0] = "Musterstraße 10"
* address.line[0].extension[Strasse].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName"
* address.line[0].extension[Strasse].valueString = "Musterstraße"
* address.line[0].extension[Hausnummer].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber"
* address.line[0].extension[Hausnummer].valueString = "10"
* address.line[0].extension[Adresszusatz].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-additionalLocator"
* address.line[0].extension[Adresszusatz].valueString = "EG"
* address.line[1] = "Zentrum"

// ----------------------------------------------------
// PART OF — typical simple structure
// ----------------------------------------------------
* partOf = Reference(Organization/Organization-minimal)
* partOf.display = "Übergeordnete Organisation"
