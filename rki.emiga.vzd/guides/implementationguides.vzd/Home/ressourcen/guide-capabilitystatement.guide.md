# CapabilityStatements

## EMIGA Einrichtungsverzeichnis - Konformitätserklärung

### Beschreibung

<fql output="inline">
from CapabilityStatement
where id = 'EmigaEINRVCapabilityStatementRequirements'
select
    description
</fql>


### Zweck

<fql output="inline">
from CapabilityStatement
where id = 'EmigaEINRVCapabilityStatementRequirements'
select
    purpose
</fql>


<fql>
from CapabilityStatement
where id = 'EmigaEINRVCapabilityStatementRequirements'
select
    CanonicalURL[canonical]: url,
    Intention: kind,
    Status: status,
    Version: version
with
    no header
</fql>


### Anforderungen an die FHIR-API

<fql>
from CapabilityStatement
where id = 'EmigaEINRVCapabilityStatementRequirements'
select
    Modus: rest.mode
with
    no header
</fql>


#### Interaktionen

<fql>
from CapabilityStatement
where id = 'EmigaEINRVCapabilityStatementRequirements'
select
    join rest.resource {
        Ressourcentyp: type,

        Verbindlichkeit:
            extension
                .where(url = 'http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation')
                .value.first(),

        READ:
            interaction
                .where(code = 'read')
                .extension
                .where(url = 'http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation')
                .value.first(),

        SEARCH:
            interaction
                .where(code = 'search-type')
                .extension
                .where(url = 'http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation')
                .value.first(),

        CREATE:
            interaction
                .where(code = 'create')
                .extension
                .where(url = 'http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation')
                .value.first(),

        UPDATE:
            interaction
                .where(code = 'update')
                .extension
                .where(url = 'http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation')
                .value.first(),

        PATCH:
            interaction
                .where(code = 'patch')
                .extension
                .where(url = 'http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation')
                .value.first(),

        DELETE:
            interaction
                .where(code = 'delete')
                .extension
                .where(url = 'http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation')
                .value.first(),

        VREAD:
            interaction
                .where(code = 'vread')
                .extension
                .where(url = 'http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation')
                .value.first(),

        HistoryInstance:
            interaction
                .where(code = 'history-instance')
                .extension
                .where(url = 'http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation')
                .value.first(),

        HistoryType:
            interaction
                .where(code = 'history-type')
                .extension
                .where(url = 'http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation')
                .value.first()
    }
with
    header
</fql>


#### Profile

<fql>
from CapabilityStatement
where id = 'EmigaEINRVCapabilityStatementRequirements'
select
    join rest.resource {
        Ressourcentyp: type,
        join Profile[canonical]: supportedProfile
    }
with
    header
</fql>


#### Ressourcentyp-spezifische Operations

<fql>
from CapabilityStatement
where id = 'EmigaEINRVCapabilityStatementRequirements'
select
    join rest.resource {
        RessourcenTyp: type,

        join for operation
        select {
            Name: name,

            Spezifikation[canonical]:
                definition,

            Verbindlichkeit:
                extension
                    .where(url = 'http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation')
                    .value.first()
        }
    }
with
    header
</fql>


#### Globale Operations

<fql>
from CapabilityStatement
where id = 'EmigaEINRVCapabilityStatementRequirements'
select
    join rest {
        join for operation
        select {
            Name: name,

            Spezifikation[canonical]:
                definition,

            Verbindlichkeit:
                extension
                    .where(url = 'http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation')
                    .value.first(),

            Hinweise[markdown]:
                documentation
        }
    }
with
    header
</fql>


#### Systeminteraktionen

<fql>
from CapabilityStatement
where id = 'EmigaEINRVCapabilityStatementRequirements'
select
    join rest {
        join for interaction
        select {
            Interaktion: code,

            Verbindlichkeit:
                extension
                    .where(url = 'http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation')
                    .value.first(),

            Hinweise[markdown]:
                documentation
        }
    }
with
    header
</fql>


#### Suchparameter

<fql>
from CapabilityStatement
where id = 'EmigaEINRVCapabilityStatementRequirements'
select
    join rest.resource {
        RessourcenTyp: type,

        join for searchParam
        select {
            SuchParameter: name,

            Verbindlichkeit:
                extension
                    .where(url = 'http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation')
                    .value.first(),

            Hinweise[markdown]:
                documentation,

            Definition[canonical]:
                definition
        }
    }
with
    header
</fql>


#### Includes

<fql>
from CapabilityStatement
where id = 'EmigaEINRVCapabilityStatementRequirements'
select
    join rest.resource {
        RessourcenTyp: type,

        join for searchInclude
        select {
            Include: $this,

            Verbindlichkeit:
                extension
                    .where(url = 'http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation')
                    .value.first()
        }
    }
with
    header
</fql>


#### Reverse-Includes

<fql>
from CapabilityStatement
where id = 'EmigaEINRVCapabilityStatementRequirements'
select
    join rest.resource {
        RessourcenTyp: type,

        join for searchRevInclude
        select {
            ReverseInclude: $this,

            Verbindlichkeit:
                extension
                    .where(url = 'http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation')
                    .value.first()
        }
    }
with
    header
</fql>