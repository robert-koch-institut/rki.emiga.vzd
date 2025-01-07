CodeSystem: HealthcareServiceSpecialty
Id: HealthcareServiceSpecialty
Title: "Fachspezialisierung"
Description: "Die Kodiersystematik HealthcareServiceSpecialty definiert Konzepte, die die Fachspezialisierung der Angebotene Dienstleistungen, näher Beschreiben"
* insert MetadataTerminology
* ^version = "1.0.0"
* ^date = "2024-12-27"
* ^caseSensitive = true
* ^content = #complete
* ^valueSet = "https://emiga.rki.de/fhir/vzd/ValueSet/HealthcareServiceSpecialty"

* #crisisMngmnt "Krisenmanagement"
* #crisisMngmnt ^designation[0].language = #en-US
* #crisisMngmnt ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* #crisisMngmnt ^designation[=].use = $HL7DesignationUse#display
* #crisisMngmnt ^designation[=].value = "crisis management"

* #itAndSoftware "IT und Softwareprodukte"
* #itAndSoftware ^designation[0].language = #en-US
* #itAndSoftware ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* #itAndSoftware ^designation[=].use = $HL7DesignationUse#display
* #itAndSoftware ^designation[=].value = "IT and software products"

* #press "Presse"
* #press ^designation[0].language = #en-US
* #press ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* #press ^designation[=].use = $HL7DesignationUse#display
* #press ^designation[=].value = "press"

* #healthAndComm "Gesundheitsberichterstattung und -kommunikation"
* #healthAndComm ^designation[0].language = #en-US
* #healthAndComm ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* #healthAndComm ^designation[=].use = $HL7DesignationUse#display
* #healthAndComm ^designation[=].value = "health reporting and communication"

* #trainingAndTeaching "Training und Lehre"
* #trainingAndTeaching ^designation[0].language = #en-US
* #trainingAndTeaching ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* #trainingAndTeaching ^designation[=].use = $HL7DesignationUse#display
* #trainingAndTeaching ^designation[=].value = "training and teaching"

// Possibly overlapping with ihefachrichtungen
* #surveillanceReporting "Surveillance/Meldewesen"
* #surveillanceReporting ^designation[0].language = #en-US
* #surveillanceReporting ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* #surveillanceReporting ^designation[=].use = $HL7DesignationUse#display
* #surveillanceReporting ^designation[=].value = "surveillance/reporting"


* #infectionProtectionAndEpi "Infektionsschutz und Infektionsepidemiologie"
* #infectionProtectionAndEpi ^designation[0].language = #en-US
* #infectionProtectionAndEpi ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* #infectionProtectionAndEpi ^designation[=].use = $HL7DesignationUse#display
* #infectionProtectionAndEpi ^designation[=].value = "infection protection and epidemiology"

* #hygieneDrinkingWaterAndEnv "Hygiene, Trinkwasser und Umwelt"
* #hygieneDrinkingWaterAndEnv ^designation[0].language = #en-US
* #hygieneDrinkingWaterAndEnv ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* #hygieneDrinkingWaterAndEnv ^designation[=].use = $HL7DesignationUse#display
* #hygieneDrinkingWaterAndEnv ^designation[=].value = "hygiene, drinking water and the environment"

* #igvAirportAndPort "IGV-benannte Flughäfen und Häfen"
* #igvAirportAndPort ^designation[0].language = #en-US
* #igvAirportAndPort ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* #igvAirportAndPort ^designation[=].use = $HL7DesignationUse#display
* #igvAirportAndPort ^designation[=].value = "IGV-designated airports and ports"

// Possibly overlapping with ihefachrichtungen
* #labor "Labor"
* #labor ^designation[0].language = #en-US
* #labor ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* #labor ^designation[=].use = $HL7DesignationUse#display
* #labor ^designation[=].value = "laboratory"


* #vaccPrevention "Impfprävention"
* #vaccPrevention ^designation[0].language = #en-US
* #vaccPrevention ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* #vaccPrevention ^designation[=].use = $HL7DesignationUse#display
* #vaccPrevention ^designation[=].value = "vaccine prevention"

* #HIVAndSTDs "HIV- und sexuell-übertragbare Krankheiten"	
* #HIVAndSTDs ^designation[0].language = #en-US
* #HIVAndSTDs ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* #HIVAndSTDs ^designation[=].use = $HL7DesignationUse#display
* #HIVAndSTDs ^designation[=].value = "HIV and sexually transmitted diseases"

* #hepatitis "Hepatitiden"	
* #hepatitis ^designation[0].language = #en-US
* #hepatitis ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* #hepatitis ^designation[=].use = $HL7DesignationUse#display
* #hepatitis ^designation[=].value = "hepatitis"

* #diseasesTransmissibleThroughBlood "Krankheiten, die über Blut übertragbar sind"
* #diseasesTransmissibleThroughBlood ^designation[0].language = #en-US
* #diseasesTransmissibleThroughBlood ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* #diseasesTransmissibleThroughBlood ^designation[=].use = $HL7DesignationUse#display
* #diseasesTransmissibleThroughBlood ^designation[=].value = "diseases that are transmissible through blood"

* #zoonoses "Zoonosen"
* #zoonoses ^designation[0].language = #en-US
* #zoonoses ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* #zoonoses ^designation[=].use = $HL7DesignationUse#display
* #zoonoses ^designation[=].value = "zoonoses"

* #foodborneDiseases "Lebensmittelübertragbare Erkrankungen"
* #foodborneDiseases ^designation[0].language = #en-US
* #foodborneDiseases ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* #foodborneDiseases ^designation[=].use = $HL7DesignationUse#display
* #foodborneDiseases ^designation[=].value = "foodborne diseases"

* #respDiseases	"Atemwegserkrankungen wie Influenza, Tuberkulose, Legionellose"
* #respDiseases ^designation[0].language = #en-US
* #respDiseases ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* #respDiseases ^designation[=].use = $HL7DesignationUse#display
* #respDiseases ^designation[=].value = "respiratory diseases such as influenza, tuberculosis, legionellosis"

* #antibioticResistantGerms	"Antibiotikaresistente Keime"	
* #antibioticResistantGerms ^designation[0].language = #en-US
* #antibioticResistantGerms ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* #antibioticResistantGerms ^designation[=].use = $HL7DesignationUse#display
* #antibioticResistantGerms ^designation[=].value = "antibiotic-resistant germs"

// Possibly overlapping with ihefachrichtungen
* #childAndYouthHealth "Kinder- und Jugendgesundheit"	
* #childAndYouthHealth ^designation[0].language = #en-US
* #childAndYouthHealth ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* #childAndYouthHealth ^designation[=].use = $HL7DesignationUse#display
* #childAndYouthHealth ^designation[=].value = "child and youth health"


//Possibly overlapping with ihefachrichtungen
* #socialPsychiatricService	"Sozialpsychiatrischer Dienst"
* #socialPsychiatricService ^designation[0].language = #en-US
* #socialPsychiatricService ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* #socialPsychiatricService ^designation[=].use = $HL7DesignationUse#display
* #socialPsychiatricService ^designation[=].value = "social psychiatric service"


//Possibly overlapping with ihefachrichtungen
* #preventionAndHealthPromotion	"Prävention und Gesundheitsförderung"
* #preventionAndHealthPromotion ^designation[0].language = #en-US
* #preventionAndHealthPromotion ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* #preventionAndHealthPromotion ^designation[=].use = $HL7DesignationUse#display
* #preventionAndHealthPromotion ^designation[=].value = "prevention and health promotion"


* #medServicesAndCons "Medizinische Dienste und Sprechstunden"	
* #medServicesAndCons ^designation[0].language = #en-US
* #medServicesAndCons ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* #medServicesAndCons ^designation[=].use = $HL7DesignationUse#display
* #medServicesAndCons ^designation[=].value = "medical services and consultations"

// Possibly overlapping with ihefachrichtungen
* #dentistry "Zahnmedizin"	
* #dentistry ^designation[0].language = #en-US
* #dentistry ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* #dentistry ^designation[=].use = $HL7DesignationUse#display
* #dentistry ^designation[=].value = "dentistry"


// Possibly overlapping with ihefachrichtungen
* #adminLegalMattersAndDataPrtct "Verwaltung, Recht und Datenschutz"
* #adminLegalMattersAndDataPrtct ^designation[0].language = #en-US
* #adminLegalMattersAndDataPrtct ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* #adminLegalMattersAndDataPrtct ^designation[=].use = $HL7DesignationUse#display
* #adminLegalMattersAndDataPrtct ^designation[=].value = "administration, legal matters and data protection"



