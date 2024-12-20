CodeSystem: OrganizationType
Id: OrganizationType
Title: "Organizationstyp"
Description: "Die Kodiersystematik 'OrganizationType' definiert Konzepte, die die Art/den Typ einer Organisation aus Sicht des ÖGD grob charakterisieren."
* insert MetadataTerminology
* ^version = "1.1.0"
* ^date = "2024-11-11"
* ^caseSensitive = true
* ^content = #complete
* ^valueSet = "https://emiga.rki.de/fhir/vzd/ValueSet/OrganizationType"
* #ga "Gesundheitsamt"
* #ga ^designation.language = #de-DE
* #ga ^designation.use = $ConceptDesignationUse#abbreviation
* #ga ^designation.value = "GA"
* #lb "Landesbehörde"
* #lb ^designation.language = #de-DE
* #lb ^designation.use = $ConceptDesignationUse#abbreviation
* #lb ^designation.value = "LB"
* #rki "Robert Koch-Institut"
* #rki ^designation.language = #de-DE
* #rki ^designation.use = $ConceptDesignationUse#abbreviation
* #rki ^designation.value = "RKI"
* #bw "Sanitätsdienst der Bundeswehr"
* #bw ^designation.language = #de-DE
* #bw ^designation.use = $ConceptDesignationUse#abbreviation
* #bw ^designation.value = "BW"

ValueSet: OrganizationType
Id: OrganizationType
Title: "Organisationstyp (Werteliste)"
Description: "Werteliste mit Konzepten, die die Art/den Typ einer Organisation aus Sicht des ÖGD grob charakterisieren."
* insert MetadataTerminology
* ^version = "1.1.0"
* ^date = "2024-11-11"
* include codes from system OrganizationType