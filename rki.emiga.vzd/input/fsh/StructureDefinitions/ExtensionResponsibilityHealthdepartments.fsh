
Extension: ResponsibilityHealthdepartments
Id: ResponsibilityHealthdepartments
Title: "Zuständigkeit der ÖGD-Stellen"
Description: "Extension zur Abbildung der Zuständigkeiten der ÖGD-Stellen anhand des amtlichen Gemeindeschlüssels und der Art der Zuständigkeit."
Context: Organization, Location, Practitioner
* ^url = "https://emiga.rki.de/fhir/vzd/Extension/ResponsibilityHealthdepartments"
* ^version = "2.0.0"
* ^date = "2026-02-12"
* insert MetadataProfile
//* ^status = #draft
//* ^publisher = "Robert-Koch-Institut"
* . 1..
* extension contains
    geographicRegion 1..* and
    ResponsibilityType 1..*
* extension[geographicRegion].value[x] from $county (required)
* extension[geographicRegion].value[x] ^binding.description = "Über das ValueSet County können die Landkreise/Stadtkreise ausgewählt werden, für die eine ÖGD-Stelle zuständig ist."
* extension[geographicRegion].value[x] only Coding
  * insert StrictCoding
* extension[geographicRegion].value[x].system 1..
* extension[geographicRegion].value[x].system = "https://demis.rki.de/fhir/CodeSystem/geographicRegion"
* extension[geographicRegion].value[x].code 1..
* extension[geographicRegion].value[x].display MS

* extension[ResponsibilityType].value[x] from $ResponsibilityType (required)
* extension[ResponsibilityType].value[x] ^binding.description = "Über das ValueSet kann die Art der Zuständigkeit einer ÖGD-Stelle ausgewählt werden."
* extension[ResponsibilityType].value[x] only Coding
  * insert StrictCoding
//* extension[ResponsibilityType].value[x] ^patternCoding.system = "https://emiga.rki.de/fhir/vzd/CodeSystem/ResponsibilityType"
* extension[ResponsibilityType].value[x].system 1..
* extension[ResponsibilityType].value[x].system = "https://emiga.rki.de/fhir/vzd/CodeSystem/ResponsibilityType"
* extension[ResponsibilityType].value[x].code 1..
* extension[ResponsibilityType].value[x].display MS
