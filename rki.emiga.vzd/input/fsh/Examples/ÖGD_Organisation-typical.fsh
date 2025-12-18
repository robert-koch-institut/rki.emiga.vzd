Instance: EmigaPublicHealthOrganizationTypical
InstanceOf: EmigaPublicHealthOrganization
Usage: #example
Description: "Typische Instanz einer ÖGD Organisation (EMIGA v1.1.0)"

* meta.profile[emigaprofile] =
  "https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaPublicHealthOrganization|2.0.0-alpha.16"
* meta.security[visibility] = $ResourceVisibilityType#public
* meta.security[responsibility] = $ResourceResponsibility#1.

/* -------- extensions -------- */
* extension[responsibilityHealthdepartments].extension[responsibilityType].valueCoding.system =
  "https://emiga.rki.de/fhir/vzd/CodeSystem/responsibilityType"
* extension[responsibilityHealthdepartments].extension[responsibilityType].valueCoding.code = #all

* extension[organizationPeriod].valuePeriod.start = "2015-01-01"
* extension[organizationPeriod].valuePeriod.end = "2035-12-31"

/* -------- identifiers -------- */
* identifier[codeSiteId].system = $CodeSiteId
* identifier[codeSiteId].value = "1."

* identifier[telematikID].system = "https://gematik.de/fhir/sid/telematik-id"
* identifier[telematikID].value = "123456789"

/* -------- active -------- */
* active = true

/* -------- type -------- */
* type[emigaOrganizationType].coding.system = $OrganizationType
* type[emigaOrganizationType].coding.code = #ga
* type[emigaOrganizationType].coding.display = "Gesundheitsamt"

/* -------- name / alias -------- */
* name = "Stadt XYZ – Gesundheitsamt"
* alias[0] = "GA Musterstadt"
* alias[+] = "Gesundheitsamt XYZ"

/* -------- telecom -------- */
* telecom[Email].system = #email
* telecom[Email].value = "info@gesundheitsamt.de"

* telecom[Phone].system = #phone
* telecom[Phone].value = "+49-511-1234567"

* telecom[Url].system = #url
* telecom[Url].value = "https://www.gesundheitsamt.de"

* telecom[Fax].system = #fax
* telecom[Fax].value = "+49-511-1234568"

/* -------- address -------- */
* address[0].line = "Musterstraße 1"

* address[0].line.extension[Strasse].valueString = "Musterstraße"
* address[0].line.extension[Hausnummer].valueString = "1"
* address[0].line.extension[Adresszusatz].valueString = "Gebäude A"
* address[0].line.extension[Postfach].valueString = "Postfach 123"

* address[0].extension[Stadtteil].valueString = "Zentrum"

* address[0].city = "Musterstadt"
* address[0].state = "DE-BB"
* address[0].postalCode = "12345"

/* -------- hierarchy -------- */
* partOf = Reference(Organization/Organisation-minimal)
