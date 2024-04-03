CodeSystem: ResourceVisibilityType
Id: ResourceVisibilityType
Title: "ResourceVisibility Type Code System"
Description: "Defines visibility of resources in VZD"
* insert MetaTerminology
* ^version = "1.0.0"
* ^date = "2024-03-19"
* ^caseSensitive = true
* ^content = #complete
* ^valueSet = "https://emiga.rki.de/fhir/vzd/ValueSet/ResourceVisibilityType"
* #public "öffentlich" "Öffentliche Sichtbarkeit - Ressourcen, die entsprechend ausgezeichnet sind, dürfen durch beliebige Akteure (auch die Öffentlichkeit) zur Anzeige gepracht werden."
* #internal "intern" "ÖGD interne Sichtbarkeit - Ressourcen, die entsprechend ausgezeichnet sind, dürfen durch beliebige Stellen des ÖGD eingesehen werden."
* #private "privat" "Private Sichtbarkeit - Ressourcen, die entsprechend ausgezeichnet sind, dürfen lediglich im Kontext einer bestimmten Stelle des Öffentlichen Gesundheitsdienstes zur Anzeige gebracht werden."

ValueSet: ResourceVisibilityType
Title: "ResourceVisibilityType Type Value Set"
Description: "Defines visibility of resources in VZD"
Id: ResourceVisibilityType
* insert MetaTerminology
* ^version = "1.0.0"
* ^date = "2024-03-19"
* include codes from system ResourceVisibilityType
