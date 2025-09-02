CodeSystem: OrgVBundleId
Id: OrgVBundleId
Title: "Organisations-Bundle-ID"
Description: "Die Kodiersystematik Organisations-Bundle-ID definiert Konzepte, die den Organisations-Bundle kennzeichnen."

* ^url = "https://emiga.rki.de/fhir/vzd/CodeSystem/OrgVBundleId"
* insert MetadataTerminology
* ^version = "0.1.0"
* ^date = "2025-06-10"
* ^caseSensitive = true
* ^content = #complete
* ^valueSet = "https://emiga.rki.de/fhir/vzd/ValueSet/OrgVBundleId"



ValueSet: OrgVBundleId
Id: OrgVBundleId
Title: "Relevanz (Werteliste)"
Description: "Werteliste mit Konzepten, die die Relevanz der Ressourcen für verschiedene Use Cases kennzeichnen."
* ^url = "https://emiga.rki.de/fhir/ValueSet/OrgVBundleId"
* insert MetadataTerminology
* ^version = "0.1.0"
* ^date = "2025-06-10"
* include codes from system OrgVBundleId