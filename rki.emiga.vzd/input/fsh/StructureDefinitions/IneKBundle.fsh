// File: IneKBundle.fsh

Profile: IneKBundle
Parent: Bundle
Id: IneKBundle
Title: "IneK Bundle"
Description: "To Do German - A profile on the Bundle resource for IneK data."
* ^version = "0.1.0"
* ^date = "2025-05-13"

* insert MetadataProfile
* insert ProfileResourceCommon

* insert ProfileMetaProfileTags
* meta.profile[emigaprofile] = "https://emiga.rki.de/fhir/vzd/StructureDefinition/IneKBundle"


* identifier 1..1 MS
* identifier only IneKFileHeaderIdentifier
* type 1..1 MS
* type = #collection
* timestamp MS

* entry MS
* entry.resource 1..1 MS



