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
* $OrganizationType#authority ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* $OrganizationType#authority ^designation[=].use = $HL7DesignationUse#display
* $OrganizationType#authority ^designation[=].value = "Authority"

* $OrganizationType#sepFedAut "Oberste Bundesbehörde"
* $OrganizationType#sepFedAut ^designation[0].language = #en-US
* $OrganizationType#sepFedAut ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* $OrganizationType#sepFedAut ^designation[=].use = $HL7DesignationUse#display
* $OrganizationType#sepFedAut ^designation[=].value = "Supreme federal authority"

* $OrganizationType#hiFedAut "Bundesoberbehörde"
* $OrganizationType#hiFedAut ^designation[0].language = #en-US
* $OrganizationType#hiFedAut ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* $OrganizationType#hiFedAut ^designation[=].use = $HL7DesignationUse#display
* $OrganizationType#hiFedAut ^designation[=].value = "Higher federal authority"

* $OrganizationType#fedInsti "Bundesanstalt"
* $OrganizationType#fedInsti ^designation[0].language = #en-US
* $OrganizationType#fedInsti ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* $OrganizationType#fedInsti ^designation[=].use = $HL7DesignationUse#display
* $OrganizationType#fedInsti ^designation[=].value = "Federal Institute"

* $OrganizationType#supFedStaAut "Oberste Landesbehörde"
* $OrganizationType#supFedStaAut ^designation[0].language = #en-US
* $OrganizationType#supFedStaAut ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* $OrganizationType#supFedStaAut ^designation[=].use = $HL7DesignationUse#display
* $OrganizationType#supFedStaAut ^designation[=].value = "Supreme Federal State authority"

* $OrganizationType#otherAutFed "Sonstige Behörde auf Bundesebene"
* $OrganizationType#otherAutFed ^designation[0].language = #en-US
* $OrganizationType#otherAutFed ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* $OrganizationType#otherAutFed ^designation[=].use = $HL7DesignationUse#display
* $OrganizationType#otherAutFed ^designation[=].value = "Other authority federal" 

* $OrganizationType#otherAutState "Sonstige Behörde auf Landesebene"
* $OrganizationType#otherAutState ^designation[0].language = #en-US
* $OrganizationType#otherAutState ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* $OrganizationType#otherAutState ^designation[=].use = $HL7DesignationUse#display
* $OrganizationType#otherAutState ^designation[=].value = "Other authority state" 

* $OrganizationType#intOrg "Internationale Organisation"
* $OrganizationType#intOrg ^designation[0].language = #en-US  
* $OrganizationType#intOrg ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage" 
* $OrganizationType#intOrg ^designation[=].use = $HL7DesignationUse#display 
* $OrganizationType#intOrg ^designation[=].value = "International Organization"  

* $OrganizationType#resFacility "Forschungseinrichtung"
* $OrganizationType#resFacility ^designation[0].language = #en-US  
* $OrganizationType#resFacility ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage" 
* $OrganizationType#resFacility ^designation[=].use = $HL7DesignationUse#display 
* $OrganizationType#resFacility ^designation[=].value = "Research Facility" 

* $OrganizationType#otherOrg "sonstige Einrichtung"
* $OrganizationType#otherOrg ^designation[0].language = #en-US  
* $OrganizationType#otherOrg ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage" 
* $OrganizationType#otherOrg ^designation[=].use = $HL7DesignationUse#display 
* $OrganizationType#otherOrg ^designation[=].value = "other Organization" 

* $OrganizationType#transport "Transport"
* $OrganizationType#transport ^designation[0].language = #en-US  
* $OrganizationType#transport ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage" 
* $OrganizationType#transport ^designation[=].use = $HL7DesignationUse#display 
* $OrganizationType#transport ^designation[=].value = "Transport" 

* $OrganizationType#airport "Flughafen"
* $OrganizationType#airport ^designation[0].language = #en-US  
* $OrganizationType#airport ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage" 
* $OrganizationType#airport ^designation[=].use = $HL7DesignationUse#display 
* $OrganizationType#airport ^designation[=].value = "Airport" 

* $OrganizationType#harbor "Hafen"
* $OrganizationType#harbor ^designation[0].language = #en-US  
* $OrganizationType#harbor ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage" 
* $OrganizationType#harbor ^designation[=].use = $HL7DesignationUse#display 
* $OrganizationType#harbor ^designation[=].value = "Harbor" 