// File: IneKBundle.fsh

Profile: EinrVBundle
Parent: Bundle
Id: EinrVBundle
Title: "Einrichtungsverzeichnis Bundle"
Description: "Dieses Bundle bildet Informationen zum Einrichtungsverzeichnis ab. Es dient der strukturierten Zusammenführung und gemeinsamen Übertragung von Einrichtungen und zugehörigen Ressourcen (z. B. Standorte, Kontakte, Klassifikationen) im Rahmen eines Einrichtungsverzeichnisses."
* ^version = "0.2.0"
* ^date = "2026-07-08"

* insert MetadataProfile
* insert ProfileResourceCommon
* insert ProfileMetaProfileTags

* meta.profile[emigaprofile] = "https://emiga.rki.de/fhir/vzd/StructureDefinition/EinrVBundle"

* type = #collection

* identifier 1..1 MS

* entry MS
* entry.resource 1..1 MS



