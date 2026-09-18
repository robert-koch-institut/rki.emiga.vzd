---
topic: EmigaPractitionerRole
canonical: https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaPractitionerRole
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

## FHIR REST-Schnittstelle

<tabs>

  <tab title="Interaktionen" active="true">

    {{render:fql-capability-interactions.fql}}

  </tab>

  <tab title="Suchparameter">

    {{render:fql-capability-searchparameters.fql}}

  </tab>

  <tab title="Operationen">

    {{render:fql-capability-operations.fql}}

  </tab>

</tabs>

## Beispiel
Im Folgenden wird ein Beispiel für eine Practitioner Role dargestellt.

<tabs>
    <tab title="Übersicht">      
        {{render:PractitionerRole-Practitioner44588967.json}}
    </tab>
    <tab title="XML">      
        {{xml:PractitionerRole-Practitioner44588967.json}}
    </tab>
    <tab title="JSON">
        {{json:PractitionerRole-Practitioner44588967.json}}
    </tab>
    <tab title="Link">
        {{link:PractitionerRole-Practitioner44588967.json}}
    </tab>
</tabs>

<!-- {{json: PractitionerRole/44588969}} -->