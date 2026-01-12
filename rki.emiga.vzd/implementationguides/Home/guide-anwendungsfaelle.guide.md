## {{page-title}}
Im Folgenden werden UML-Diagramme dargestellt, die die für dieses Modul relevanten Anwendungsfälle in komprimierter Form abbilden. Der Schwerpunkt liegt auf den zentralen Use Cases und den dafür erforderlichen Funktionen, um eine klare und gut nachvollziehbare Übersicht zu gewährleisten.

## Generische Organisation
 <!--Falls wir Gerade Lienien im UML haben möchten, dann folgendes einfügen:  skinparam linetype ortho -->

<plantuml>
  set namespaceSeparator none
  skinparam backgroundcolor transparent
  skinparam classBackgroundColor #FFFFCC
  skinparam classBorderColor black
  skinparam classAttributeIconSize 1
  skinparam nodesep 50
  skinparam ranksep 50

    class EmigaOrganization{
    <b>+</b> id: string [0..1]
    -- Meta --
    <b>+</b> meta.versionID: id [0..1] 
    <b>+</b> meta.lastUpdated: instant[0..1] 
    <b>+</b> meta.profile:emigaprofile: canonical(StructureDefinition) [0..*]
    <b>+</b> meta.security:visibility.display: string [0..1]
    <b>+</b> meta.security:responsibility.display: string [1..*]
    <b>+</b> meta.tag:relevance.display: string [1..*] 
    <b>+</b> meta.tag:orgvBundleId.display: string [1..*] 
    <b>+</b> meta.tag:orgvBundleVersion.display: string [1..*] 
    -- Identifiers --
    <b>+</b> identifier:emigaOrgvId: IdentifierEmigaOrgvId [0..1] 
    <b>+</b> identifier:emigaOrgvFileNumber: IdentifierEmigaOrgvFileNumber [1..1] 
    <b>+</b> identifier:IKNR.value: string [0..1] 
    <b>+</b> identifier:BSNR.value: string [0..1] 
    <b>+</b> identifier:LANR.value: string [0..1] 
    <b>+</b> identifier:demisLaboratoryId.value: string [0..1] 
    <b>+</b> identifier:demisParticipantId.value: string [0..1] 
    <b>+</b> identifier:telematikID.value: string [0..1] 
    -- Organization Info --
    <b>+</b> extension:organizationPeriod: Extension(Period) [0..1]
    <b>+</b> active: boolean [1..1]
    <b>+</b> type:emigaOrganizationType.coding.display: string [1..1]
    <b>+</b> name: string [1..1]
    <b>+</b> alias: string [0..1]
    <b>+</b> partOf: Reference(Organization) [0..1]
    -- Kommunikation --
    <b>+</b> telecom:Email.value: string [0..*]
    <b>+</b> telecom:Phone.value: string [0..*]
    <b>+</b> telecom:Url.value: string [0..*]
    <b>+</b> telecom:Fax.value: string [0..*]
    <b>+</b> address.extension:Stadtteil: string [0..1]
    <b>+</b> address.type: code [0..1]
    <b>+</b> address.type: code [0..1]
    <b>+</b> address.text: string [0..1]
    <b>+</b> address.line.extension:Strasse: string [0..1]
    <b>+</b> address.line.extension:Hausnummer: string [0..1]
    <b>+</b> address.line.extension:Adresszusatz: string [0..1]
    <b>+</b> address.line.extension:Postfach: string [0..1]
    <b>+</b> address.city: string [0..1]
    <b>+</b> address.state: string [0..1]
    <b>+</b> address.postalCode: string [0..1]
    <b>+</b> address.country: string [0..1]
    <b>+</b> address.period.start: dateTime [0..1]
    <b>+</b> address.period.end: dateTime [0..1]
    }
</plantuml>


## Krankenhaus
 <!--Falls wir Gerade Lienien im UML haben möchten, dann folgendes einfügen:  skinparam linetype ortho -->

<plantuml>
  set namespaceSeparator none
  skinparam backgroundcolor transparent
  skinparam classBackgroundColor #FFFFCC
  skinparam classBorderColor black
  skinparam classAttributeIconSize 1
  skinparam nodesep 50
  skinparam ranksep 50

    class EmigaHospitalOrganization{
    <b>+</b> id: string [0..1]
    -- Meta --
    <b>+</b> meta.lastUpdated: instant [0..1] 
    <b>+</b> meta.profile:emigaprofile: canonical(StructureDefinition) [0..*]
    <b>+</b> meta.source: uri [0..1] 
    <b>+</b> meta.versionId: id [0..1] 
    <b>+</b> meta.security:responsibility.display: string [0..1]
    <b>+</b> meta.security:visibility.display: string [0..1]
    <b>+</b> meta.tag:orgvBundleId.display: string [0..1] 
    <b>+</b> meta.tag:orgvBundleVersion.display: string [0..1] 
    <b>+</b> meta.tag:relevance.display: string [0..1]
    -- Identifiers --
    <b>+</b> identifier:BSNR.value: string [0..1] 
    <b>+</b> identifier:demisParticipantId.value: string [0..1] 
    <b>+</b> identifier:emigaOrgvFileNumber: IdentifierEmigaOrgvFileNumber [1..1] 
    <b>+</b> identifier:emigaOrgvId: IdentifierEmigaOrgvId [0..1] 
    <b>+</b> identifier:IKNR.value: string [0..1] 
    <b>+</b> identifier:telematikID.value: string [0..1] 
    -- Organization Information --
    <b>+</b> active: boolean [1..1]
    <b>+</b> alias: string [0..1]
    <b>+</b> extension:inekVersionPeriod: Extension(Complex) [0..1]
    <b>+</b> language: code [0..1] 
    <b>+</b> name: string [1..1]
    <b>+</b> partOf: Reference(Organization) [0..1]
    <b>+</b> type:emigaOrganizationType.coding.display: string [0..1]
    <b>+</b> type:fachbereich.coding.display: string [0..1]
    -- Communication --
    <b>+</b> address.city: string [0..1]
    <b>+</b> address.country: string [0..1]
    <b>+</b> address.extension:Stadtteil: string [0..1]
    <b>+</b> address.line.extension:Adresszusatz: string [0..1]
    <b>+</b> address.line.extension:Hausnummer: string [0..1]
    <b>+</b> address.line.extension:Postfach: string [0..1]
    <b>+</b> address.line.extension:Strasse: string [0..1]
    <b>+</b> address.line.value: System.string [0..1]
    <b>+</b> address.period.end: dateTime [0..1]
    <b>+</b> address.period.start: dateTime [0..1]
    <b>+</b> address.postalCode: string [0..1]
    <b>+</b> address.state: string [0..1]
    <b>+</b> address.text: string [0..1]
    <b>+</b> address.type: code [0..1]
    <b>+</b> address.use: code [0..1]
    <b>+</b> telecom:Email.value: string [0..*]
    <b>+</b> telecom:Fax.value: string [0..*]
    <b>+</b> telecom:Phone.value: string [0..*]
    <b>+</b> telecom:Url.value: string [0..*]
    }
</plantuml>