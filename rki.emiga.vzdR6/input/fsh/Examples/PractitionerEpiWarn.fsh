Instance: EpiWarnPractitioner
InstanceOf: EmigaPractitionerR6
Usage: #example
* meta.security[visibility]  = $ResourceVisibilityType#inAgency	"Eigene ÖGD-Stelle"
* meta.security[responsibility] = $ResourceResponsibility#1.
* meta.profile[emigaprofile] = "https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaPractitionerR6"
* meta.tag[relevance] = $RelevanceCS#IfsgKoordVwV "Paragraf 2 IfSG-Koordinierungs-VwV"
* active = true
* name.family = "Goetze"
* name.given = "Doris"
* name.prefix = "Dr."
* name.prefix.extension[0].url = "http://hl7.org/fhir/StructureDefinition/iso21090-EN-qualifier"
* name.prefix.extension[=].valueCode = #AC
* name.text = "Dr. Doris Goetze"
* telecom[Email].system = #email
* telecom[Email].value = "111@Land.NI.de"
* telecom[Phone].system = #phone
* telecom[Phone].value = "0123 45497989566"