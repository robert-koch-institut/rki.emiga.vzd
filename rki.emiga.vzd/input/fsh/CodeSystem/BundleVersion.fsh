CodeSystem: BundleVersion
Id: BundleVersion
Title: "Organisations-Bundle-Version"
Description: "Die Kodiersystematik Organisations-Bundle-Version definiert Konzepte, die den Organisations-Bundle Version kennzeichnen."

* ^url = "https://emiga.rki.de/fhir/CodeSystem/BundleVersion"
* insert MetadataTerminology
* ^version = "0.1.0"
* ^date = "2025-06-10"
* ^caseSensitive = true
* ^content = #complete
* ^valueSet = "https://emiga.rki.de/fhir/ValueSet/BundleVersion"



ValueSet: BundleVersion
Id: BundleVersion
Title: "Relevanz (Werteliste)"
Description: "Werteliste mit Konzepten, die die Relevanz der Ressourcen für verschiedene Use Cases kennzeichnen."
* ^url = "https://emiga.rki.de/fhir/ValueSet/BundleVersion"
* insert MetadataTerminology
* ^version = "0.1.0"
* ^date = "2025-06-10"
* include codes from system BundleVersion
