Instance: 44588968
InstanceOf: EmigaPractitioner
Usage: #example
* meta.security[visibility] = $ResourceVisibilityType#internal
* meta.security[responsibility] = $ResourceResponsibility#1.12.99.99.
* active = true
* name.family = "Baronin von Baldrichshausen"
* name.family.extension[0].url = "http://fhir.de/StructureDefinition/humanname-namenszusatz"
* name.family.extension[=].valueString = "Baronin"
* name.family.extension[+].url = "http://hl7.org/fhir/StructureDefinition/humanname-own-name"
* name.family.extension[=].valueString = "Baldrichshausen"
* name.family.extension[+].url = "http://hl7.org/fhir/StructureDefinition/humanname-own-prefix"
* name.family.extension[=].valueString = "von"
* name.given = "Lena"
* name.prefix = "Dr."
* name.prefix.extension[0].url = "http://hl7.org/fhir/StructureDefinition/iso21090-EN-qualifier"
* name.prefix.extension[=].valueCode = #AC
* name.text = "Dr. Lena Baronin von Baldrichshausen"
* telecom[Email].system = #email
* telecom[Email].value = "lena.baldrichshausen@example.org"
* telecom[Phone].system = #phone
* telecom[Phone].value = "0123 456789-1290"