ValueSet: GenericOrganizationType
Id: GenericOrganizationType
Title: "Organisationstyp (Werteliste)"
Description: "Werteliste mit Konzepten, die die Art/den Typ einer generischen Organisation aus Sicht des ÖGD grob charakterisieren."
* insert MetadataTerminology
* ^version = "1.0.0"
* ^date = "2025-10-27"

* $DemisOrgType#medFacility "Medizinische Einrichtung"
* $DemisOrgType#medFacility #outpatSurgery "Einrichtung für ambulantes Operieren"
* $DemisOrgType#medFacility #prevCareRehab "Vorsorge- oder Reha-Einrichtung"
* $DemisOrgType#medFacility #dialysisFacility "Dialyseeinrichtung"
* $DemisOrgType#medFacility #dayHospital "Tagesklinik"
* $DemisOrgType#medFacility #maternity "Entbindungseinrichtung"
* $DemisOrgType#medFacility #physicianOffice "Arztpraxis"
* $DemisOrgType#medFacility #dentalSurgery "Zahnarztpraxis"
* $DemisOrgType#medFacility #psycFacility "Psychotherapeutische Praxis"
* $DemisOrgType#medFacility #othMedPractice "Sonstige Heilberufepraxis"
* $DemisOrgType#medFacility #medFacPHA "Medizinische Einrichtung des ÖGDs"
* $DemisOrgType#medFacility #emResServ "emResServ"
* $DemisOrgType#medFacility #civDisFacility "Einrichtungen des Zivil- und Katastrophenschutzes	"
* $DemisOrgType#medFacility #othMedFacility "Sonstige medizinische Einrichtung"

* $DemisOrgType#childCareFacility "Gemeinschaftseinrichtung" "§ 33 IfSG; Einrichtung, in der überwiegend Säuglinge, Kinder oder Jugendliche betreut werden"
* $DemisOrgType#childCareFacility #kindergarten "Kindertageseinrichtung (z. B. Kita)"
* $DemisOrgType#childCareFacility #childDayNursery "Kindertagespflege"
* $DemisOrgType#childCareFacility #school "Schule"
* $DemisOrgType#childCareFacility #childHome "Kinderheim o.ä." "Heim, in dem überwiegend Säuglinge, Kinder oder Jugendliche untergebracht sind"
* $DemisOrgType#childCareFacility #holidayCamp "Ferienlager"
* $DemisOrgType#childCareFacility #childDayCare "Kinderhort"
* $DemisOrgType#childCareFacility #othEdFac "sonstige Ausbildungseinrichtung"
* $DemisOrgType#childCareFacility #othChildCareFac "Sonstige Kinderbetreuungseinrichtung" "	Sonstige Einrichtung, in der überwiegend Säuglinge, Kinder oder Jugendliche betreut werden"

* $DemisOrgType#housingFacility "Gemeinschaftsunterkunft" "§ 36 Abs. 1 Nr. 3 - 6 IfSG"
* $DemisOrgType#housingFacility #homelessShelter "Obdachlosenunterkunft"
* $DemisOrgType#housingFacility #migrantAccom "Migrantenunterkunft" "	Einrichtung zur gemeinschaftlichen Unterbringung von Asylbewerbern, vollziehbar Ausreisepflichtigen, Flüchtlingen und Spätaussiedlern"
* $DemisOrgType#housingFacility #prison "Justizvollzugsanstalt"
* $DemisOrgType#housingFacility #othMassAccom "Sonstige Massenunterkunft"

* $DemisOrgType#nursingHome "voll- oder teilstationäre Einrichtung und besondere Wohnform zur Betreuung und Unterbringung" "35 Abs. 1"
* $DemisOrgType#nursingHome #elderlyCareHome "Einrichtung zur Betreuung/Unterbringung älterer Menschen"
* $DemisOrgType#nursingHome #disabledCareHome "Einrichtung zur Betreuung/Unterbringung behinderter Menschen"
* $DemisOrgType#nursingHome #assistedCareHome "Einrichtung zur Betreuung/Unterbringung pflegebedürftiger Menschen"
* $DemisOrgType#nursingHome #outpatICServ "Ambulanter Intensivpflegedienst" "ambulanter Pflegedienst, der ambulante Intensivpflege in Einrichtungen, Wohngruppen oder sonstigen gemeinschaftlichen Wohnformen erbringt"
* $DemisOrgType#nursingHome #othOutpatCareS "Sonstiger ambulanter Pflegedienst"

* $DemisOrgType#othBloodRiskFac "Sonstige Einrichtung mit Blutübertragungsrisiko" "	Einrichtung oder Unternehmen, in dem durch Tätigkeiten am Menschen durch Blut Krankheitserreger übertragen werden können"

* $DemisOrgType#othHygRelFacility "Sonstige hygienerelevante Einrichtung"

* $DemisOrgType#othAccom "Andere Unterkunft"
* $DemisOrgType#othAccom #hotel "Hotel o.ä."
* $DemisOrgType#othAccom #holidayHome "Ferienwohnung"
* $DemisOrgType#othAccom #camping "Campingplatz o.ä."
* $DemisOrgType#othAccom #ship "Schiff o.ä."

* $DemisOrgType#foodEstablmt "Lebensmittelbetrieb"

* $DemisOrgType#laboratory "Erregerdiagnostische Untersuchungsstelle"
* $DemisOrgType#laboratory #publicHealthLab "Medizinaluntersuchungsamt"
* $DemisOrgType#laboratory #refLab "Einrichtung der Spezialdiagnostik" "inkl. NRZ, Konsiliarlabor"
* $DemisOrgType#laboratory #hospitalLab "Krankenhauslabor"
* $DemisOrgType#laboratory #pathology "Pathologisch-anatomische Einrichtung" "Einrichtung der pathologisch-anatomischen Diagnostik"
* $DemisOrgType#laboratory #othPublicLab "Sonstige öffentliche Untersuchungsstelle"
* $DemisOrgType#laboratory #othPrivatLab "Sonstige private Untersuchungsstelle" "inkl. Arztpraxis mit Infektionserregerdiagnostik"

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