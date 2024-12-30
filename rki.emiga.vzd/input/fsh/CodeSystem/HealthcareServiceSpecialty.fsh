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
* #crisisMngmnt ^designation[=].use.system = "http://snomed.info/sct"
* #crisisMngmnt ^designation[=].use = $sct#900000000000003009
* #crisisMngmnt ^designation[=].value = "crisis management"

* #itAndSoftware "IT und Softwareprodukte"
* #itAndSoftware ^designation[0].language = #en-US
* #itAndSoftware ^designation[=].use.system = "http://snomed.info/sct"
* #itAndSoftware ^designation[=].use = $sct#900000000000003009
* #itAndSoftware ^designation[=].value = "IT and software products"

* #press "Presse"
* #press ^designation[0].language = #en-US
* #press ^designation[=].use.system = "http://snomed.info/sct"
* #press ^designation[=].use = $sct#900000000000003009
* #press ^designation[=].value = "press"

* #healthAndComm "Gesundheitsberichterstattung und -kommunikation"
* #healthAndComm ^designation[0].language = #en-US
* #healthAndComm ^designation[=].use.system = "http://snomed.info/sct"
* #healthAndComm ^designation[=].use = $sct#900000000000003009
* #healthAndComm ^designation[=].value = "health reporting and communication"

* #trainingAndTeaching "Training und Lehre"
* #trainingAndTeaching ^designation[0].language = #en-US
* #trainingAndTeaching ^designation[=].use.system = "http://snomed.info/sct"
* #trainingAndTeaching ^designation[=].use = $sct#900000000000003009
* #trainingAndTeaching ^designation[=].value = "training and teaching"

* #surveillanceReporting "Surveillance/Meldewesen"
* #surveillanceReporting ^designation[0].language = #en-US
* #surveillanceReporting ^designation[=].use.system = "http://snomed.info/sct"
* #surveillanceReporting ^designation[=].use = $sct#900000000000003009
* #surveillanceReporting ^designation[=].value = "surveillance/reporting"

* #infectionProtectionAndEpi "Infektionsschutz und Infektionsepidemiologie"
* #infectionProtectionAndEpi ^designation[0].language = #en-US
* #infectionProtectionAndEpi ^designation[=].use.system = "http://snomed.info/sct"
* #infectionProtectionAndEpi ^designation[=].use = $sct#900000000000003009
* #infectionProtectionAndEpi ^designation[=].value = "infection protection and epidemiology"

* #hygieneDrinkingWaterAndEnv "Hygiene, Trinkwasser und Umwelt"
* #hygieneDrinkingWaterAndEnv ^designation[0].language = #en-US
* #hygieneDrinkingWaterAndEnv ^designation[=].use.system = "http://snomed.info/sct"
* #hygieneDrinkingWaterAndEnv ^designation[=].use = $sct#900000000000003009
* #hygieneDrinkingWaterAndEnv ^designation[=].value = "hygiene, drinking water and the environment"

* #igvAirportAndPort "IGV-benannte Flughäfen und Häfen"
* #igvAirportAndPort ^designation[0].language = #en-US
* #igvAirportAndPort ^designation[=].use.system = "http://snomed.info/sct"
* #igvAirportAndPort ^designation[=].use = $sct#900000000000003009
* #igvAirportAndPort ^designation[=].value = "IGV-designated airports and ports"

* #labor "Labor"
* #labor ^designation[0].language = #en-US
* #labor ^designation[=].use.system = "http://snomed.info/sct"
* #labor ^designation[=].use = $sct#900000000000003009
* #labor ^designation[=].value = "laboratory"

* #vaccPrevention "Impfprävention"
* #vaccPrevention ^designation[0].language = #en-US
* #vaccPrevention ^designation[=].use.system = "http://snomed.info/sct"
* #vaccPrevention ^designation[=].use = $sct#900000000000003009
* #vaccPrevention ^designation[=].value = "vaccine prevention"

* #HIVAndSTDs "HIV- und sexuell-übertragbare Krankheiten"	
* #HIVAndSTDs ^designation[0].language = #en-US
* #HIVAndSTDs ^designation[=].use.system = "http://snomed.info/sct"
* #HIVAndSTDs ^designation[=].use = $sct#900000000000003009
* #HIVAndSTDs ^designation[=].value = "HIV and sexually transmitted diseases"

* #hepatitis "Hepatitiden"	
* #hepatitis ^designation[0].language = #en-US
* #hepatitis ^designation[=].use.system = "http://snomed.info/sct"
* #hepatitis ^designation[=].use = $sct#900000000000003009
* #hepatitis ^designation[=].value = "hepatitis"

* #diseasesTransmissibleThroughBlood "Krankheiten, die über Blut übertragbar sind"
* #diseasesTransmissibleThroughBlood ^designation[0].language = #en-US
* #diseasesTransmissibleThroughBlood ^designation[=].use.system = "http://snomed.info/sct"
* #diseasesTransmissibleThroughBlood ^designation[=].use = $sct#900000000000003009
* #diseasesTransmissibleThroughBlood ^designation[=].value = "diseases that are transmissible through blood"

* #zoonoses "Zoonosen"
* #zoonoses ^designation[0].language = #en-US
* #zoonoses ^designation[=].use.system = "http://snomed.info/sct"
* #zoonoses ^designation[=].use = $sct#900000000000003009
* #zoonoses ^designation[=].value = "zoonoses"

* #foodborneDiseases "Lebensmittelübertragbare Erkrankungen"
* #foodborneDiseases ^designation[0].language = #en-US
* #foodborneDiseases ^designation[=].use.system = "http://snomed.info/sct"
* #foodborneDiseases ^designation[=].use = $sct#900000000000003009
* #foodborneDiseases ^designation[=].value = "foodborne diseases"

* #respDiseases	"Atemwegserkrankungen wie Influenza, Tuberkulose, Legionellose"
* #respDiseases ^designation[0].language = #en-US
* #respDiseases ^designation[=].use.system = "http://snomed.info/sct"
* #respDiseases ^designation[=].use = $sct#900000000000003009
* #respDiseases ^designation[=].value = "respiratory diseases such as influenza, tuberculosis, legionellosis"

* #antibioticResistantGerms	"Antibiotikaresistente Keime"	
* #antibioticResistantGerms ^designation[0].language = #en-US
* #antibioticResistantGerms ^designation[=].use.system = "http://snomed.info/sct"
* #antibioticResistantGerms ^designation[=].use = $sct#900000000000003009
* #antibioticResistantGerms ^designation[=].value = "antibiotic-resistant germs"

* #childAndYouthHealth "Kinder- und Jugendgesundheit"	
* #childAndYouthHealth ^designation[0].language = #en-US
* #childAndYouthHealth ^designation[=].use.system = "http://snomed.info/sct"
* #childAndYouthHealth ^designation[=].use = $sct#900000000000003009
* #childAndYouthHealth ^designation[=].value = "child and youth health"

* #socialPsychiatricService	"Sozialpsychiatrischer Dienst"
* #socialPsychiatricService ^designation[0].language = #en-US
* #socialPsychiatricService ^designation[=].use.system = "http://snomed.info/sct"
* #socialPsychiatricService ^designation[=].use = $sct#900000000000003009
* #socialPsychiatricService ^designation[=].value = "social psychiatric service"

* #preventionAndHealthPromotion	"Prävention und Gesundheitsförderung"
* #preventionAndHealthPromotion ^designation[0].language = #en-US
* #preventionAndHealthPromotion ^designation[=].use.system = "http://snomed.info/sct"
* #preventionAndHealthPromotion ^designation[=].use = $sct#900000000000003009
* #preventionAndHealthPromotion ^designation[=].value = "prevention and health promotion"

* #medServicesAndCons "Medizinische Dienste und Sprechstunden"	
* #medServicesAndCons ^designation[0].language = #en-US
* #medServicesAndCons ^designation[=].use.system = "http://snomed.info/sct"
* #medServicesAndCons ^designation[=].use = $sct#900000000000003009
* #medServicesAndCons ^designation[=].value = "medical services and consultations"

* #dentistry "Zahnmedizin"	
* #dentistry ^designation[0].language = #en-US
* #dentistry ^designation[=].use.system = "http://snomed.info/sct"
* #dentistry ^designation[=].use = $sct#900000000000003009
* #dentistry ^designation[=].value = "dentistry"

* #adminLegalMattersAndDataPrtct "Verwaltung, Recht und Datenschutz"
* #adminLegalMattersAndDataPrtct ^designation[0].language = #en-US
* #adminLegalMattersAndDataPrtct ^designation[=].use.system = "http://snomed.info/sct"
* #adminLegalMattersAndDataPrtct ^designation[=].use = $sct#900000000000003009
* #adminLegalMattersAndDataPrtct ^designation[=].value = "administration, legal matters and data protection"
	


ValueSet: HealthcareServiceSpecialty
Title: "Fachspezialisierung (Werteliste)"
Description: "Werteliste mit Konzepten, die die Fachspezialisierung einer Dienstleistung näher beschreiben."
Id: HealthcareServiceSpecialty
* insert MetadataTerminology
* ^version = "1.0.0"
* ^date = "2024-12-27"
* include codes from system HealthcareServiceSpecialty