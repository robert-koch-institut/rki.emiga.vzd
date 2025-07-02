CodeSystem: OrgVBundleVersion
Id: OrgVBundleVersion
Title: "Organisations-Bundle-Version"
Description: "Die Kodiersystematik Organisations-Bundle-Version definiert Konzepte, die den Organisations-Bundle Version kennzeichnen."

* ^url = "https://emiga.rki.de/fhir/CodeSystem/OrgVBundleVersion"
* insert MetadataTerminology
* ^version = "0.1.0"
* ^date = "2025-06-10"
* ^caseSensitive = true
* ^content = #complete
* ^valueSet = "https://emiga.rki.de/fhir/ValueSet/OrgVBundleVersion"



ValueSet: OrgVBundleVersion
Id: OrgVBundleVersion
Title: "Relevanz (Werteliste)"
Description: "Werteliste mit Konzepten, die die Relevanz der Ressourcen für verschiedene Use Cases kennzeichnen."
* ^url = "https://emiga.rki.de/fhir/ValueSet/OrgVBundleVersion"
* insert MetadataTerminology
* ^version = "0.1.0"
* ^date = "2025-06-10"
* include codes from system OrgVBundleVersion
