ValueSet: PublicHealthOrganizationType
Id: PublicHealthOrganizationType
Title: "ÖGD Organizationen"
Description: "'PublicHealthOrganizationType' ist eine Werteliste mit Konzepten, die die Arten einer Organisation des ÖGD näher beschreiben."
* ^version = "1.0.1"
* ^date = "2026-08-18"

* insert MetadataTerminology

* $OrganizationType#ga "Gesundheitsamt"
* $OrganizationType#ga ^designation.language = #de-DE
* $OrganizationType#ga ^designation.use = $ConceptDesignationUse#abbreviation
* $OrganizationType#ga ^designation.value = "GA"
* $OrganizationType#lb "Landesbehörde"
* $OrganizationType#lb ^designation.language = #de-DE
* $OrganizationType#lb ^designation.use = $ConceptDesignationUse#abbreviation
* $OrganizationType#lb ^designation.value = "LB"
* $OrganizationType#rki "Robert Koch-Institut"
* $OrganizationType#rki ^designation.language = #de-DE
* $OrganizationType#rki ^designation.use = $ConceptDesignationUse#abbreviation
* $OrganizationType#rki ^designation.value = "RKI"
* $OrganizationType#bw "Sanitätsdienst der Bundeswehr"
* $OrganizationType#bw ^designation.language = #de-DE
* $OrganizationType#bw ^designation.use = $ConceptDesignationUse#abbreviation
* $OrganizationType#bw ^designation.value = "BW"