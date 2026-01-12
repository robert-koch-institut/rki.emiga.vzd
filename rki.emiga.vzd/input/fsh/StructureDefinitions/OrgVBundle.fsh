// File: IneKBundle.fsh

Profile: OrgVBundle
Parent: Bundle
Id: OrgVBundle
Title: "Organizationsverzeichnis Bundle"
Description: "To Do"
* ^version = "0.1.0"
* ^date = "2025-06-10"

* insert MetadataProfile
* insert ProfileResourceCommon
* insert ProfileMetaProfileTags

* meta.profile[emigaprofile] = "https://emiga.rki.de/fhir/vzd/StructureDefinition/OrgVBundle|2.0.0-alpha.18"

* type = #collection

* identifier 1..1 MS

* entry MS
* entry.resource 1..1 MS



