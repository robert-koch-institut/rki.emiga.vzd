Extension: IneKFileHeaderMetadata
Id: IneKFileHeaderMetadata
Title: "IneK Dateikopf Metadaten"
Description: "TO DO - "
Context: Identifier
* ^url = "https://emiga.rki.de/fhir/vzd/Extension/IneKFileHeaderMetadata"
* ^version = "0.1.0"
* ^date = "2025-05-13"

* insert MetadataProfile


* extension contains
    xmlSchemaVersion 1..1 MS and
    dateCreated 1..1 MS and
    lastChanged 1..1 MS 
* extension[xmlSchemaVersion].valueString 1..1 MS
* extension[dateCreated].valueDate 1..1 MS
* extension[lastChanged].valueDate 1..1 MS
