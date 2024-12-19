ValueSet: OrganizationType
Id: OrganizationType
Title: "Organisationstyp (Werteliste)"
Description: "Werteliste mit Konzepten, die die Art/den Typ einer Organisation aus Sicht des ÖGD grob charakterisieren."
* insert MetadataTerminology
* ^version = "1.1.0"
* ^date = "2024-11-11"

* include codes from system $DemisOrgType

* $OrganizationType#authority "Behörde"
* $OrganizationType#authority ^designation[0].language = #en-US
* $OrganizationType#authority ^designation[=].use.system = "http://snomed.info/sct"
* $OrganizationType#authority ^designation[=].use = $sct#900000000000003001
* $OrganizationType#authority ^designation[=].value = "Authority"

* $OrganizationType#sepFedAut "Oberste Bundesbehörde"
* $OrganizationType#sepFedAut ^designation[0].language = #en-US
* $OrganizationType#sepFedAut ^designation[=].use.system = "http://snomed.info/sct"
* $OrganizationType#sepFedAut ^designation[=].use = $sct#900000000000003001
* $OrganizationType#sepFedAut ^designation[=].value = "Supreme federal authority"

* $OrganizationType#hiFedAut "Bundesoberbehörde"
* $OrganizationType#hiFedAut ^designation[0].language = #en-US
* $OrganizationType#hiFedAut ^designation[=].use.system = "http://snomed.info/sct"
* $OrganizationType#hiFedAut ^designation[=].use = $sct#900000000000003001
* $OrganizationType#hiFedAut ^designation[=].value = "Higher federal authority"

* $OrganizationType#fedInsti "Bundesanstalt"
* $OrganizationType#fedInsti ^designation[0].language = #en-US
* $OrganizationType#fedInsti ^designation[=].use.system = "http://snomed.info/sct"
* $OrganizationType#fedInsti ^designation[=].use = $sct#900000000000003001
* $OrganizationType#fedInsti ^designation[=].value = "Federal Institute"

* $OrganizationType#supFedStaAut "Oberste Landesbehörde"
* $OrganizationType#supFedStaAut ^designation[0].language = #en-US
* $OrganizationType#supFedStaAut ^designation[=].use.system = "http://snomed.info/sct"
* $OrganizationType#supFedStaAut ^designation[=].use = $sct#900000000000003001
* $OrganizationType#supFedStaAut ^designation[=].value = "Supreme Federal State authority"

* $OrganizationType#otherAutFed "Sonstige Behörde auf Bundesebene"
* $OrganizationType#otherAutFed ^designation[0].language = #en-US
* $OrganizationType#otherAutFed ^designation[=].use.system = "http://snomed.info/sct"
* $OrganizationType#otherAutFed ^designation[=].use = $sct#900000000000003001
* $OrganizationType#otherAutFed ^designation[=].value = "Other authority federal" 

* $OrganizationType#otherAutState "Sonstige Behörde auf Landesebene"
* $OrganizationType#otherAutState ^designation[0].language = #en-US
* $OrganizationType#otherAutState ^designation[=].use.system = "http://snomed.info/sct"
* $OrganizationType#otherAutState ^designation[=].use = $sct#900000000000003001
* $OrganizationType#otherAutState ^designation[=].value = "Other authority state" 

* $OrganizationType#intOrg "Internationale Organisation"
* $OrganizationType#intOrg ^designation[0].language = #en-US  
* $OrganizationType#intOrg ^designation[=].use.system = "http://snomed.info/sct" 
* $OrganizationType#intOrg ^designation[=].use = $sct#900000000000003001 
* $OrganizationType#intOrg ^designation[=].value = "International Organization"  

* $OrganizationType#resFacility "Forschungseinrichtung"
* $OrganizationType#resFacility ^designation[0].language = #en-US  
* $OrganizationType#resFacility ^designation[=].use.system = "http://snomed.info/sct" 
* $OrganizationType#resFacility ^designation[=].use = $sct#900000000000003001 
* $OrganizationType#resFacility ^designation[=].value = "Research Facility" 

* $OrganizationType#otherOrg "sonstige Einrichtung"
* $OrganizationType#otherOrg ^designation[0].language = #en-US  
* $OrganizationType#otherOrg ^designation[=].use.system = "http://snomed.info/sct" 
* $OrganizationType#otherOrg ^designation[=].use = $sct#900000000000003001 
* $OrganizationType#otherOrg ^designation[=].value = "other Organization" 

* $OrganizationType#transport "Transport"
* $OrganizationType#transport ^designation[0].language = #en-US  
* $OrganizationType#transport ^designation[=].use.system = "http://snomed.info/sct" 
* $OrganizationType#transport ^designation[=].use = $sct#900000000000003001 
* $OrganizationType#transport ^designation[=].value = "Transport" 

* $OrganizationType#airport "Flughafen"
* $OrganizationType#airport ^designation[0].language = #en-US  
* $OrganizationType#airport ^designation[=].use.system = "http://snomed.info/sct" 
* $OrganizationType#airport ^designation[=].use = $sct#900000000000003001 
* $OrganizationType#airport ^designation[=].value = "Airport" 

* $OrganizationType#harbor "Hafen"
* $OrganizationType#harbor ^designation[0].language = #en-US  
* $OrganizationType#harbor ^designation[=].use.system = "http://snomed.info/sct" 
* $OrganizationType#harbor ^designation[=].use = $sct#900000000000003001 
* $OrganizationType#harbor ^designation[=].value = "Harbor" 