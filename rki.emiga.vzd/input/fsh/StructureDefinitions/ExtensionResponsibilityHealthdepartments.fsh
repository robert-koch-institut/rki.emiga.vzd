Alias: $county = https://demis.rki.de/fhir/ValueSet/county
Alias: $responsibilityType = https://emiga.rki.de/fhir/vzd/ValueSet/responsibilityType

Extension: ResponsibilityHealthdepartments
Id: ResponsibilityHealthdepartments
Title: "Zuständigkeit der ÖGD-Stellen"
Description: "Extension zur Abbildung der Zuständigkeiten der ÖGD-Stellen anhand des amtlichen Gemeindeschlüssels und der Art der Zuständigkeit."
Context: Organization, Location, Practitioner
* ^url = "https://emiga.rki.de/fhir/vzd/Extension/ResponsibilityHealthdepartments"
* ^version = "1.0.0"
* ^status = #draft
* ^publisher = "Robert-Koch-Institut"
* . 1..
* extension contains
    geographicRegion 1..* and
    responsibilityType 1..*
* extension[geographicRegion] from $county (required)
* extension[geographicRegion] ^binding.description = "Über das ValueSet County können die Landkreise/Stadtkreise ausgewählt werden, für die eine ÖGD-Stelle zuständig ist."
* extension[geographicRegion].value[x] only Coding
* extension[geographicRegion].value[x].system 1..
* extension[geographicRegion].value[x].system = "https://demis.rki.de/fhir/CodeSystem/geographicRegion"
* extension[geographicRegion].value[x].code 1..
* extension[responsibilityType] from $responsibilityType (required)
* extension[responsibilityType] ^binding.description = "Über das ValueSet kann die Art der Zuständigkeit einer ÖGD-Stelle ausgewählt werden."
* extension[responsibilityType].value[x] only Coding
* extension[responsibilityType].value[x] ^patternCoding.system = "https://emiga.rki.de/fhir/vzd/CodeSystem/responsibilityType"
* extension[responsibilityType].value[x].system 1..
* extension[responsibilityType].value[x].system = "https://emiga.rki.de/fhir/vzd/CodeSystem/responsibilityType"
* extension[responsibilityType].value[x].code 1..
* url = "https://emiga.rki.de/fhir/vzd/Extension/ResponsibilityHealthdepartments" (exactly)