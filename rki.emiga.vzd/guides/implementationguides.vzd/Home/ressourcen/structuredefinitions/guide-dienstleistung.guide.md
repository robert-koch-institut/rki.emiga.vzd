---
topic: EmigaHealthcareService
canonical: https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaHealthcareService
---

# {{page-title}}
## Beschreibung
<fql output= "inline" headers="false">
from 
    StructureDefinition
where
    url = %canonical
select
    description
</fql>

<br>&nbsp;<br>

## Profil
### Metadaten
<fql output="transpose" headers="true">
from
    StructureDefinition
where
    url = %canonical
select
        CanonicalURL: url, Status: status, Version: version, Herausgeber: publisher
</fql>
<br>&nbsp;<br>

### Inhalt
<tabs>
<tab title="Darstellung">{{tree, buttons}}</tab>
<tab title="XML">{{xml}}</tab>
<tab title="JSON">{{json}}</tab>
<tab title="Link">{{link}}</tab>
</tabs>
<br>&nbsp;<br>

### Constraints/Invarianten
<fql headers="true">
from 
    StructureDefinition 
where 
    url = %canonical 
for 
    differential.element 
    where
        constraint.exists()
    select 
        Name: constraint.key, Element: id, Schweregrad: constraint.severity,Beschreibung: constraint.human, Ausdruck: constraint.expression
</fql>
<br>&nbsp;<br>

### Terminology-Bindings
<fql headers="true">
from 
    StructureDefinition
where 
    url = %canonical
   
for 
    differential.element
    where 
        binding.exists()
    select
        Element: id, Staerke: binding.strength, ValueSet: binding.valueSet
</fql>
<br>&nbsp;<br>

## Anmerkungen zu Must-Support Elementen
<fql>
using 'rki.emiga.vzd@2.0.0-alpha.24'

from StructureDefinition

where
    url = %canonical

for snapshot.element

where mustSupport = true

select
    Feldname: path,
	Slice: sliceName,
    Kurzbeschreibung: short,
    Hinweise: comment
</fql>
<br>&nbsp;<br>

## Interaktionen

<tabs>

  <tab title="Interaktionen" active="true">

<fql>
using scope

from CapabilityStatement

for rest.resource

where
    supportedProfile
        .where(
            $this = %canonical
        )
        .exists()

for interaction

select
    'Name': %resource.name,
    'Interaktion': code,
    'Verbindlichkeit':
        extension
            .where(
                url = 'http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation'
            )
            .value,
    'Dokumentation' [markdown]: documentation

with header
</fql>

  </tab>


  <tab title="Suchparameter">

<fql>
using scope

from CapabilityStatement

for rest.resource

where
    supportedProfile
        .where(
            $this = %canonical
        )
        .exists()

for searchParam

select
    'Name': %resource.name,
    'Suchparameter': name,
    'Typ': type,
    'Verbindlichkeit':
        extension
            .where(
                url = 'http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation'
            )
            .value,
    'Dokumentation' [markdown]: documentation

with header
</fql>

  </tab>


  <tab title="Operationen">

<fql>
using scope

from CapabilityStatement

for rest.resource

where
    supportedProfile
        .where(
            $this = %canonical
        )
        .exists()

for operation

select
    'Name': %resource.name,
    'Operation': name,
    'Definition' [canonical]: definition,
    'Verbindlichkeit':
        extension
            .where(
                url = 'http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation'
            )
            .value,
    'Dokumentation' [markdown]: documentation

with header
</fql>

  </tab>

</tabs>


## Beispiel
Im Folgenden wird ein Beispiel für eine fiktive Dienstleistung dargestellt.

<tabs>
    <tab title="Übersicht">      
        {{render:HealthcareService-HealthcareService44588971.json}}
    </tab>
    <tab title="XML">      
        {{xml:HealthcareService-HealthcareService44588971.json}}
    </tab>
    <tab title="JSON">
        {{json:HealthcareService-HealthcareService44588971.json}}
    </tab>
    <tab title="Link">
        {{link:HealthcareService-HealthcareService44588971.json}}
    </tab>
</tabs>

<!-- {{json: HealthcareService/44588972}} -->