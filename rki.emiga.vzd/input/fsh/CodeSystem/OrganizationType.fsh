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
* #authority ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* #authority ^designation[=].use = $HL7DesignationUse#display
* #authority ^designation[=].value = "Authority"

* #authority #sepFedAut "Oberste Bundesbehörde"
* #authority #sepFedAut ^designation[0].language = #en-US
* #authority #sepFedAut ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* #authority #sepFedAut ^designation[=].use = $HL7DesignationUse#display
* #authority #sepFedAut ^designation[=].value = "Supreme federal authority"

* #authority #hiFedAut "Bundesoberbehörde"
* #authority #hiFedAut ^designation[0].language = #en-US
* #authority #hiFedAut ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* #authority #hiFedAut ^designation[=].use = $HL7DesignationUse#display
* #authority #hiFedAut ^designation[=].value = "Higher federal authority"

* #authority #fedInsti "Bundesanstalt"
* #authority #fedInsti ^designation[0].language = #en-US
* #authority #fedInsti ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* #authority #fedInsti ^designation[=].use = $HL7DesignationUse#display
* #authority #fedInsti ^designation[=].value = "Federal Institute"

* #authority #supFedStaAut "Oberste Landesbehörde"
* #authority #supFedStaAut ^designation[0].language = #en-US
* #authority #supFedStaAut ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* #authority #supFedStaAut ^designation[=].use = $HL7DesignationUse#display
* #authority #supFedStaAut ^designation[=].value = "Supreme Federal State authority"

* #authority #otherAutFed "Sonstige Behörde auf Bundesebene"
* #authority #otherAutFed ^designation[0].language = #en-US
* #authority #otherAutFed ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* #authority #otherAutFed ^designation[=].use = $HL7DesignationUse#display
* #authority #otherAutFed ^designation[=].value = "Other authority federal" 

* #authority #otherAutState "Sonstige Behörde auf Landesebene"
* #authority #otherAutState ^designation[0].language = #en-US
* #authority #otherAutState ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* #authority #otherAutState ^designation[=].use = $HL7DesignationUse#display
* #authority #otherAutState ^designation[=].value = "Other authority state" 

* #authority #intOrg "Internationale Organisation"
* #authority #intOrg ^designation[0].language = #en-US  
* #authority #intOrg ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage" 
* #authority #intOrg ^designation[=].use = $HL7DesignationUse#display
* #authority #intOrg ^designation[=].value = "International Organization"  

* #resFacility "Forschungseinrichtung"
* #resFacility ^designation[0].language = #en-US  
* #resFacility ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage" 
* #resFacility ^designation[=].use = $HL7DesignationUse#display
* #resFacility ^designation[=].value = "Research Facility" 

* #otherOrg "sonstige Einrichtung"
* #otherOrg ^designation[0].language = #en-US  
* #otherOrg ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage" 
* #otherOrg ^designation[=].use = $HL7DesignationUse#display
* #otherOrg ^designation[=].value = "other Organization" 

* #transport "Transport"
* #transport ^designation[0].language = #en-US  
* #transport ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage" 
* #transport ^designation[=].use = $HL7DesignationUse#display 
* #transport ^designation[=].value = "Transport" 

* #transport #airport "Flughafen"
* #transport #airport ^designation[0].language = #en-US  
* #transport #airport ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage" 
* #transport #airport ^designation[=].use = $HL7DesignationUse#display 
* #transport #airport ^designation[=].value = "Airport" 

* #transport #harbor "Hafen"
* #transport #harbor ^designation[0].language = #en-US  
* #transport #harbor ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage" 
* #transport #harbor ^designation[=].use = $HL7DesignationUse#display 
* #transport #harbor ^designation[=].value = "Harbor" 

* #barracks "Kaserne"
* #carWash "Autowaschanlage"
* #cemetery "Friedhof"
* #coolingTowers "Kühltürme"
* #crematorium "Krematorium"
* #deportationDetCenter "Abschiebehaftanstalt"
* #detentionCenter "Untersuchungshaftanstalt"
* #evaporativeCoolingSystem "Verdunstungskühlanlage"
* #fullInpatientCareNursingFacility "Pflege- und Betreuungseinrichtung, Vollstationäre Pflegeeinrichtung"
* #funeralHome "Bestattungsunternehmen"
* #funeralServiceEstab "Einrichtung des Bestattungswesens"
* #gym "Fitnessstudio"
* #healthInsurance "Krankenkasse"
* #initialReceptionCenter "Erstaufnahmeeinrichtung"
* #inpatientHospice "Stationäres Hospiz"
* #inpatientIntegrationAssistance "Stationäre Eingliederungshilfe"
* #juvenileDetentionCenter "Jugendstrafanstalt"
* #majorEvent "Großveranstaltung"
* #nightclub "Diskothek"
* #otherFacility "Sonstige Einrichtung"
* #pharmacy "Apotheke"
* #professionalSchool  "Berufsschule"
* #prostitutionIndustryEstab "Einrichtung des Prostitutionsgewerbes"
* #publicHealthServiceEstab "Einrichtung des öffentlichen Gesundheitsdienstes"
* #publicHealthSystemEstab "Einrichtung des öffentlichen Gesundheitswesens"
* #retirementHomeWithoutService "Altenwohnheim"
* #retirementHomeWithService "Altenheim"
* #saunaWellnessFacility "Sauna- und Wellnessanlage"
* #sea "Sonstige Einrichtung mit relevanter Wasser Aerosolierung"
* #sewageTreatmentPlant "Kläranlage"
* #sportsLeisureRecreationFacility "Sport- Freizeit- und Erholungsanlage"
* #substituteImprisonmentPenalInstitution   "Vollzugsanstalt für Ersatzfreiheitsstrafe"
* #swimmingBathingArea "Schwimm- und Badestelle"
* #tanningSalon "Sonnenstudio"
* #testCenter "Teststelle"
* #university "Hochschule"
* #wasteDisposalFacility "Abfallbeseitigungsanlage"
* #womenShelter "Frauenhaus"
* #workplace "Arbeitsstätte"