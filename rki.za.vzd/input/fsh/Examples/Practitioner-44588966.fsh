Instance: 44588966
InstanceOf: BasePractitioner
Usage: #example
* meta.security[visibility]  = $ResourceVisibilityType#internal
* meta.security[responsibility] = $ResourceResponsibility#1.12.99.99.
* active = true
* name.family = "Sommer"
* name.given = "Gerd"
* name.prefix = "Dr."
* name.prefix.extension[0].url = "http://hl7.org/fhir/StructureDefinition/iso21090-EN-qualifier"
* name.prefix.extension[=].valueCode = #AC
* name.text = "Dr. Gerd Sommer"
* telecom[0].system = #email
* telecom[=].value = "gerd.sommer@example.org"
* telecom[+].system = #phone
* telecom[=].value = "0123 456789-1280"