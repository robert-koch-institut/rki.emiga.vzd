Instance: 44588970
InstanceOf: EmigaPractitioner
Usage: #example
* meta.security[visibility] = $ResourceVisibilityType#internal
* meta.security[responsibility] = $ResourceResponsibility#1.
* active = true
* name.family = "Hahn"
* name.given = "Wilhelm"
* name.prefix = "Dr."
* name.prefix.extension[0].url = "http://hl7.org/fhir/StructureDefinition/iso21090-EN-qualifier"
* name.prefix.extension[=].valueCode = #AC
* name.text = "Dr. Wilhelm Hahn"
* telecom[Email].system = #email
* telecom[Email].value = "wilhelm.hahn@example.org"
* telecom[Phone].system = #phone
* telecom[Phone].value = "0123 456789-1281"