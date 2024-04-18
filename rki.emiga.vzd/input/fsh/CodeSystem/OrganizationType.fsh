CodeSystem: OrganizationType
Id: OrganizationType
Title: "Organization Type in RKI Directory (Code System)"
Description: "Organization Type in RKI Directory"
* insert MetadataTerminology
* ^version = "1.0.0"
* ^date = "2024-03-19"
* ^caseSensitive = true
* ^content = #complete
* ^valueSet = "https://emiga.rki.de/fhir/vzd/ValueSet/OrganizationType"
* #ga "Gesundheitsamt"
* #ga ^designation.language = #de-DE
* #ga ^designation.use = $ConceptDesignationUse#abbreviation
* #ga ^designation.value = "GA"
* #ls "Landesstelle"
* #ls ^designation.language = #de-DE
* #ls ^designation.use = $ConceptDesignationUse#abbreviation
* #ls ^designation.value = "LS"
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
Title: "Organization Type in RKI Directory (Value Set)"
Description: "Organization Type in RKI Directory"
* insert MetadataTerminology
* ^version = "1.0.0"
* ^date = "2024-03-19"
* include codes from system OrganizationType