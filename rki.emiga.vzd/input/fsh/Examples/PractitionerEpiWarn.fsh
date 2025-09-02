Instance: EpiWarnPractitioner
InstanceOf: BasePractitioner
Usage: #example
* meta.security[visibility]  = $ResourceVisibilityType#internal
* meta.security[responsibility] = $ResourceResponsibility#1.12.99.99.
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