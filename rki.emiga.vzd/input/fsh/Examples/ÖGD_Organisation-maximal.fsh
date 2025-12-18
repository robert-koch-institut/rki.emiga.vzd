Instance: EmigaPublicHealthOrganizationMaximal
InstanceOf: EmigaPublicHealthOrganization
Usage: #example
Description: "Maximale Instanz einer ÖGD Organisation (EMIGA v1.1.0)"

/* -------- meta -------- */
* meta.profile[emigaprofile] = "https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaPublicHealthOrganization|2.0.0-alpha.16"
* meta.security[visibility] = $ResourceVisibilityType#public
* meta.security[responsibility] = $ResourceResponsibility#1.

/* -------- extensions (all slices, multiple where realistic) -------- */
/* ResponsibilityHealthdepartments: both sub-extensions populated */
* extension[responsibilityHealthdepartments].extension[geographicRegion].valueCoding.system =
  "https://demis.rki.de/fhir/CodeSystem/geographicRegion"
* extension[responsibilityHealthdepartments].extension[geographicRegion].valueCoding.code = #11005711

* extension[responsibilityHealthdepartments].extension[responsibilityType].valueCoding.system =
  "https://emiga.rki.de/fhir/vzd/CodeSystem/responsibilityType"
* extension[responsibilityHealthdepartments].extension[responsibilityType].valueCoding.code = #all

/* OrganizationPeriod: full period */
* extension[organizationPeriod].valuePeriod.start = "2010-01-01"
* extension[organizationPeriod].valuePeriod.end = "2035-12-31"

/* -------- identifiers (all slices) -------- */
/* codeSiteId slice (IdentifierCodeSiteId) – fill common sub-elements */
* identifier[codeSiteId].use = #official
* identifier[codeSiteId].type = $v2-0203#PRN
* identifier[codeSiteId].system = $CodeSiteId
* identifier[codeSiteId].value = "1."
* identifier[codeSiteId].assigner.display = "EMIGA VZD"

/* telematikID slice */
* identifier[telematikID].use = #official
* identifier[telematikID].system = "https://gematik.de/fhir/sid/telematik-id"
* identifier[telematikID].value = "123456789"
    
/* -------- active -------- */
* active = true

/* -------- type (slice + extra allowed type because slicing is open) -------- */
* type[emigaOrganizationType].coding.system = $OrganizationType
* type[emigaOrganizationType].coding.code = #ga
* type[emigaOrganizationType].coding.display = "Gesundheitsamt"

/* additional type (allowed by open slicing) */
* type[+].coding.system = "http://terminology.hl7.org/CodeSystem/organization-type"
* type[=].coding.code = #govt
* type[=].coding.display = "Government"

/* -------- name / alias (0..* MS) -------- */
* name = "Stadt XYZ – Gesundheitsamt"
* alias[0] = "GA Musterstadt"
* alias[+] = "Gesundheitsamt XYZ"
* alias[+] = "ÖGD – Stadt XYZ"

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
/* Address 0 */
* address[0].line = "Musterstraße 1"

* address[0].line.extension[Strasse].valueString = "Musterstraße"
* address[0].line.extension[Hausnummer].valueString = "1"
* address[0].line.extension[Adresszusatz].valueString = "Gebäude A"
* address[0].line.extension[Postfach].valueString = "Postfach 123"

* address[0].extension[Stadtteil].valueString = "Zentrum"
* address[0].city = "Musterstadt"
* address[0].state = "DE-BB"
* address[0].postalCode = "12345"

/* Address 1 */
* address[+].line = "Beispielweg 10"
* address[=].line.extension[Strasse].valueString = "Beispielweg"
* address[=].line.extension[Hausnummer].valueString = "10"
* address[=].line.extension[Adresszusatz].valueString = "2. OG"
* address[=].line.extension[Postfach].valueString = "Postfach 456"
* address[=].extension[Stadtteil].valueString = "Nord"
* address[=].city = "Musterstadt"
* address[=].state = "DE-BB"
* address[=].postalCode = "12345"

/* -------- hierarchy -------- */
* partOf = Reference(Organization/Organisation-maximal)
