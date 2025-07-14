Instance: InekKrankenhausOrganization
InstanceOf: EmigaHospitalOrganization
Usage: #example
Title: "InEK Krankenhaus Beispiel"
Description: "Beispiel eines Krankenhauses aus dem InEK Standortverzeichnis."

* meta.security[visibility] = $ResourceVisibilityType#public
* meta.security[responsibility] = $ResourceResponsibility#1.
* meta.tag[relevance] = $RelevanceCS#InEK "InEK Standortverzeichnis"
* meta.profile[emigaprofile] = "https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaHospitalOrganization|2.0.0-alpha.6"

* active = true

* extension[inekVersionPeriod].extension[version].valueInteger = 1
* extension[inekVersionPeriod].extension[validPeriod].valuePeriod.start = "2019-01-01"
* extension[inekVersionPeriod].extension[lastChange].valueDate = "2019-08-01"
* identifier[emigaOrgvId].type = $v2-0203#XX
* identifier[emigaOrgvId].system = $EmigaOrgvId
* identifier[emigaOrgvId].value = "0123456789"
* identifier[IKNR].system = "http://fhir.de/sid/arge-ik/iknr"
* identifier[IKNR].value = "260551132"
* identifier[IKNR].period.start = "2019-01-01"
* type[emigaOrganizationType] = $DemisOrgType#hospital "Krankenhaus"
* name = "Josephs-Hospital Warendorf"
