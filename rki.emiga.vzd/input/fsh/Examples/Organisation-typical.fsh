Instance: Organization-typical
InstanceOf: EmigaOrganization
Usage: #example

// ----------------------------------------------------
// META (required MustSupport)
// ----------------------------------------------------
* meta.profile[emigaprofile] = "https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaOrganization|2.0.0-alpha.16"
* meta.security[visibility] = $ResourceVisibilityType#internal
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

// ----------------------------------------------------
// ADDRESS — full MS structure
// ----------------------------------------------------
* address.type = #postal
* address.city = "Musterstadt"
* address.state = "DE-BE"
* address.postalCode = "10115"
* address.country = "DE"

// Required MS extensions
* address.extension[Stadtteil].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-precinct"
* address.extension[Stadtteil].valueString = "Zentrum"

* address.line = "Musterstraße 10"

* address.line.extension[Strasse].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName"
* address.line.extension[Strasse].valueString = "Musterstraße"

* address.line.extension[Hausnummer].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber"
* address.line.extension[Hausnummer].valueString = "10"

* address.line.extension[Adresszusatz].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-additionalLocator"
* address.line.extension[Adresszusatz].valueString = "EG"

* address.line.extension[Postfach].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-postBox"
* address.line.extension[Postfach].valueString = "Postfach 200"

// ----------------------------------------------------
// PART OF — typical simple structure
// ----------------------------------------------------
* partOf = Reference(Organization/Organization-parent-typical)
* partOf.display = "Übergeordnete Organisation"
