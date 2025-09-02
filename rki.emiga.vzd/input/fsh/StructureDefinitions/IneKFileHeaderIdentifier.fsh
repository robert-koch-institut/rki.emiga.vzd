Profile: IneKFileHeaderIdentifier
Parent: Identifier
Id: IneKFileHeaderIdentifier

Title: "IneK DateiKopf"
Description: "To Do German - A profile on the Identifier resource for IneK file header identification."

* insert MetadataProfile
* ^version = "0.1.0"
* ^date = "2025-05-13"

* extension 1..1 MS
* extension contains $IneKFileHeaderMetadata named inekFileHeaderMetadata 1..
* system 1..1 MS 
* system = $IneKFileHeaderId
* value 1..1 MS
* value ^short = "Dateinummer"