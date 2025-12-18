Instance: EmigaPublicHealthOrganizationMinimal
InstanceOf: EmigaPublicHealthOrganization
Usage: #example
Description: "Minimale Instanz einer ÖGD Organisation (EMIGA v1.1.0)"

* meta.profile[emigaprofile] = "https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaPublicHealthOrganization|2.0.0-alpha.16"
* meta.security[visibility] = $ResourceVisibilityType#public
* meta.security[responsibility] = $ResourceResponsibility#1.

/* -------- extensions (1.. MS) -------- */
* extension[responsibilityHealthdepartments].extension[0].url = "responsibilityType"
* extension[responsibilityHealthdepartments].extension[responsibilityType].valueCoding.system = "https://emiga.rki.de/fhir/vzd/CodeSystem/responsibilityType"
* extension[responsibilityHealthdepartments].extension[responsibilityType].valueCoding.code = #all

/* -------- identifier (1.. MS, slice codeSiteId 1..1 MS) -------- */
* identifier[codeSiteId].system = $CodeSiteId
* identifier[codeSiteId].value = "1."

/* -------- active (1..1 MS) -------- */
* active = true

/* -------- type (1.. MS, slice emigaOrganizationType) -------- */
* type[emigaOrganizationType].coding.system = $OrganizationType
* type[emigaOrganizationType].coding.code = #ga
* type[emigaOrganizationType].coding.display = "Gesundheitsamt"

/* -------- name (1..1 MS) -------- */
* name = "Stadt XYZ – Gesundheitsamt"

/* -------- alias (0..* MS) -------- */
* alias[0] = "GA Musterstadt"

/* -------- telecom (MS slices) -------- */
* telecom[Email].system = #email
* telecom[Email].value = "info@gesundheitsamt.de"

* telecom[Phone].system = #phone
* telecom[Phone].value = "+49-511-1234567"

* telecom[Url].system = #url
* telecom[Url].value = "https://www.gesundheitsamt.de"

* telecom[Fax].system = #fax
* telecom[Fax].value = "+49-511-1234568"


/* -------- address (0..* MS → must be present) -------- */
* address[0].line = "Musterstraße 1"

* address[0].line.extension[Strasse].valueString = "Musterstraße"
* address[0].line.extension[Hausnummer].valueString = "1"
* address[0].line.extension[Adresszusatz].valueString = "Gebäude A"
* address[0].line.extension[Postfach].valueString = "Postfach 123"

* address[0].extension[Stadtteil].valueString = "Zentrum"

* address[0].city = "Musterstadt"
* address[0].state = "DE-BB"
* address[0].postalCode = "12345"
