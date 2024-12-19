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
* ^hierarchyMeaning = #is-a


* #ga "Gesundheitsamt"
* #ga ^designation[0].language = #de-DE
* #ga ^designation[=].use = $ConceptDesignationUse#abbreviation
* #ga ^designation[=].value = "GA"
* #lb "Landesbehörde"
* #lb ^designation[0].language = #de-DE
* #lb ^designation[=].use = $ConceptDesignationUse#abbreviation
* #lb ^designation[=].value = "LB"
* #rki "Robert Koch-Institut"
* #rki ^designation[0].language = #de-DE
* #rki ^designation[=].use = $ConceptDesignationUse#abbreviation
* #rki ^designation[=].value = "RKI"
* #bw "Sanitätsdienst der Bundeswehr"
* #bw ^designation[0].language = #de-DE
* #bw ^designation[=].use = $ConceptDesignationUse#abbreviation
* #bw ^designation[=].value = "BW"

* #authority "Behörde"
* #authority ^designation[0].language = #en-US
* #authority ^designation[=].use.system = "http://snomed.info/sct"
* #authority ^designation[=].use = $sct#900000000000003001
* #authority ^designation[=].value = "Authority"

* #authority #sepFedAut "Oberste Bundesbehörde"
* #authority #sepFedAut ^designation[0].language = #en-US
* #authority #sepFedAut ^designation[=].use.system = "http://snomed.info/sct"
* #authority #sepFedAut ^designation[=].use = $sct#900000000000003001
* #authority #sepFedAut ^designation[=].value = "Supreme federal authority"

* #authority #hiFedAut "Bundesoberbehörde"
* #authority #hiFedAut ^designation[0].language = #en-US
* #authority #hiFedAut ^designation[=].use.system = "http://snomed.info/sct"
* #authority #hiFedAut ^designation[=].use = $sct#900000000000003001
* #authority #hiFedAut ^designation[=].value = "Higher federal authority"

* #authority #fedInsti "Bundesanstalt"
* #authority #fedInsti ^designation[0].language = #en-US
* #authority #fedInsti ^designation[=].use.system = "http://snomed.info/sct"
* #authority #fedInsti ^designation[=].use = $sct#900000000000003001
* #authority #fedInsti ^designation[=].value = "Federal Institute"

* #authority #supFedStaAut "Oberste Landesbehörde"
* #authority #supFedStaAut ^designation[0].language = #en-US
* #authority #supFedStaAut ^designation[=].use.system = "http://snomed.info/sct"
* #authority #supFedStaAut ^designation[=].use = $sct#900000000000003001
* #authority #supFedStaAut ^designation[=].value = "Supreme Federal State authority"

* #authority #otherAutFed "Sonstige Behörde auf Bundesebene"
* #authority #otherAutFed ^designation[0].language = #en-US
* #authority #otherAutFed ^designation[=].use.system = "http://snomed.info/sct"
* #authority #otherAutFed ^designation[=].use = $sct#900000000000003001
* #authority #otherAutFed ^designation[=].value = "Other authority federal" 

* #authority #otherAutState "Sonstige Behörde auf Landesebene"
* #authority #otherAutState ^designation[0].language = #en-US
* #authority #otherAutState ^designation[=].use.system = "http://snomed.info/sct"
* #authority #otherAutState ^designation[=].use = $sct#900000000000003001
* #authority #otherAutState ^designation[=].value = "Other authority state" 

* #authority #intOrg "Internationale Organisation"
* #authority #intOrg ^designation[0].language = #en-US  
* #authority #intOrg ^designation[=].use.system = "http://snomed.info/sct" 
* #authority #intOrg ^designation[=].use = $sct#900000000000003001 
* #authority #intOrg ^designation[=].value = "International Organization"  

* #resFacility "Forschungseinrichtung"
* #resFacility ^designation[0].language = #en-US  
* #resFacility ^designation[=].use.system = "http://snomed.info/sct" 
* #resFacility ^designation[=].use = $sct#900000000000003001 
* #resFacility ^designation[=].value = "Research Facility" 

* #otherOrg "sonstige Einrichtung"
* #otherOrg ^designation[0].language = #en-US  
* #otherOrg ^designation[=].use.system = "http://snomed.info/sct" 
* #otherOrg ^designation[=].use = $sct#900000000000003001 
* #otherOrg ^designation[=].value = "other Organization" 

* #transport "Transport"
* #transport ^designation[0].language = #en-US  
* #transport ^designation[=].use.system = "http://snomed.info/sct" 
* #transport ^designation[=].use = $sct#900000000000003001 
* #transport ^designation[=].value = "Transport" 

* #transport #airport "Flughafen"
* #transport #airport ^designation[0].language = #en-US  
* #transport #airport ^designation[=].use.system = "http://snomed.info/sct" 
* #transport #airport ^designation[=].use = $sct#900000000000003001 
* #transport #airport ^designation[=].value = "Airport" 

* #transport #harbor "Hafen"
* #transport #harbor ^designation[0].language = #en-US  
* #transport #harbor ^designation[=].use.system = "http://snomed.info/sct" 
* #transport #harbor ^designation[=].use = $sct#900000000000003001 
* #transport #harbor ^designation[=].value = "Harbor" 


