# {{page-title}}

## Über EMIGA
![EMIGA Logo](https://www.rki.de/SharedDocs/Bilder/Institut/Abt3/FG32/EMIGA-Logo.webp?__blob=normal&v=4 "EMIGA Logo")

Die COVID-19-Pandemie hat verdeutlicht, wie essenziell effiziente digitale Werkzeuge für die 
Überwachung und Eindämmung übertragbarer Krankheiten sind. Doch nicht nur in Krisenzeiten, sondern 
auch im Alltag unterstützt der Öffentliche Gesundheitsdienst (**ÖGD**) den Infektionsschutz in 
Deutschland.

Die Software **EMIGA** (Elektronisches Melde- und Informationssystem für Gesundheitsämter) wird im Auftrag 
des Bundesministeriums für Gesundheit (BMG) am Robert Koch-Institut (RKI) entwickelt. Ziel ist es, den 
ÖGD durch digitale Lösungen im Bereich Infektionsschutz zu entlasten und zu stärken. EMIGA soll die 
Vorbereitung auf endemische und pandemische Ausnahmesituationen sowie die Bewältigung neuer Aufgaben im 
Infektionsschutz und Meldewesen unterstützen.
<br>&nbsp;<br>

## Projektübersicht

### Projektziele

- **Effektiverer Infektionsschutz:** EMIGA verbessert die Arbeitsabläufe im ÖGD durch nutzungsfreundliche und effiziente digitale Lösungen. Die Software baut auf SurvNet@RKI auf und erweitert die Kommunikations- und Kooperationsmöglichkeiten.
- **Optimierte Zusammenarbeit:** EMIGA fördert die Zusammenarbeit zwischen Behörden und anderen Institutionen im Bereich Infektionsschutz und Meldewesen. Schnittstellen zu Fachanwendungen und automatisierte Prozesse reduzieren den administrativen Aufwand.
- **Einheitliche Datenerfassung:** Durch bundesweit einheitliche Standards, zentrale Datenhaltung und enge Anbindung an DEMIS (Deutsches Elektronisches Melde- und Informationssystem für den Infektionsschutz) wird die Datenerfassung vereinheitlicht.
- **Interoperabilität:** EMIGA setzt auf internationale Standards und Klassifikationssysteme. Schnittstellen und Spezifikationen zur Anbindung werden öffentlich verfügbar sein, um eine nahtlose Integration zu gewährleisten.
- **Zentraler Datenzugriff:** Epidemiologische Daten werden zentral bereitgestellt und durch ein Rollen- und Rechtekonzept geschützt. Dies sorgt für eine gleichmäßige Verfügbarkeit und erhöhte Datensicherheit.
- **Förderung der Digitalisierung des ÖGD:** EMIGA ist Teil der bundesweiten Zukunftsplattform **ÖGDnet** und bildet das zentrale Modul für Infektionsschutz und Meldewesen.
<br>&nbsp;<br>

### Organisationsverzeichnis als zentraler Bestandteil

Ein wesentlicher Bestandteil von EMIGA ist das **Organisationsverzeichnis**. Dieses Verzeichnis ermöglicht es, 
Organisationen und Behörden des ÖGD schnell und einfach zu finden. Nutzer können wichtige Informationen 
wie Kontaktpersonen, Kontaktdaten und Zuständigkeiten einsehen.

Ziel des Organisationsverzeichnisses ist es, die Zusammenarbeit und Kommunikation innerhalb des ÖGD zu 
verbessern, indem relevante Informationen zentral und übersichtlich bereitgestellt werden. Dies trägt dazu bei, 
Kommunikationswege zu verkürzen und Doppelarbeiten zu vermeiden.
<br>&nbsp;<br>

### Partizipation des Öffentlichen Gesundheitsdienstes

EMIGA ist so konzipiert, dass es allen Ebenen des ÖGD einen Mehrwert bietet. Vertreterinnen und Vertreter von 
Gesundheitsämtern, Landesbehörden und dem RKI werden in alle Entwicklungsphasen einbezogen, um sicherzustellen, 
dass die Software die tatsächlichen Bedürfnisse der Nutzer erfüllt.
<br>&nbsp;<br>

## UML der Datenobjekte des Organisations Verzeichnis
Das nachfolgende UML-Diagramm veranschaulicht die Beziehungen zwischen verschiedenen Datenobjekten, die im **Verzeichnisdienst (VZD)** Version von **EMIGA** verwendet werden. Diese Objekte repräsentieren zentrale **FHIR-Ressourcen** wie **Organisationen**, **Standorte**, **Dienstleistungen** und **Personen**. Die Beziehungen zwischen den Objekten definieren, wie die Daten strukturiert und miteinander verknüpft sind.

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
  }

  class EmigaLocation{
  }

  class EmigaPractitioner{
  }

  class EmigaPractitionerRole{
  }

  EmigaOrganization ..> EmigaOrganization: partOf
  EmigaLocation --> EmigaOrganization: managingOrganization
  EmigaLocation ..> EmigaLocation : partOf
  EmigaPractitionerRole --> EmigaPractitioner: Reference
  EmigaPractitionerRole --> EmigaOrganization : Reference
  EmigaPractitionerRole --> EmigaLocation: Reference
</plantuml>

---

##### 1. **Organisation/Organization**

Die **Organisation** bildet das zentrale Objekt im Diagramm. Sie steht im Mittelpunkt der meisten Verbindungen und stellt Institutionen wie **Krankenhäuser**, **Labore** oder **Gesundheitsämter** dar.

- **Beziehungen:**
  - **Organisation.partOf (0..*)**: Eine Organisation kann Teil einer übergeordneten Organisation sein. Dies ermöglicht hierarchische Strukturen, z.B. eine Abteilung als Teil eines Krankenhauses.
  - **Location.managingOrganization (0..1)**: Eine Organisation kann einen Standort verwalten, z.B. eine Klinik, die mehrere Standorte betreibt.
  - **HealthcareService.providedBy (1..1)**: Jede Dienstleistung wird von genau einer Organisation bereitgestellt.
  - **PractitionerRole.organization (0..1)**: Rollen (z.B. Arztpositionen) können einer Organisation zugewiesen werden.


##### 2. **Standort/Location**

Der **Standort** definiert physische Orte wie Gebäude, Kliniken oder Abteilungen.

- **Beziehungen:**
  - **Location.managingOrganization (0..1)**: Ein Standort kann von einer Organisation verwaltet werden.
  - **HealthcareService.location (0..*)**: Ein Standort kann mehrere Gesundheitsdienstleistungen anbieten.
  - **PractitionerRole.location (0..1)**: Eine Rolle kann an einem bestimmten Standort ausgeübt werden.


##### 3. **Dienstleistung/Healthcare Service**

Die **Dienstleistung** beschreibt die angebotenen Gesundheitsdienste, z.B. Notfallversorgung, Labordiagnostik oder Impfungen.

- **Beziehungen:**
  - **HealthcareService.providedBy (1..1)**: Jede Dienstleistung wird von genau einer Organisation bereitgestellt.
  - **HealthcareService.location (0..*)**: Eine Dienstleistung kann an mehreren Standorten angeboten werden.
  - **PractitionerRole.healthcareService (0..*)**: Rollen können bestimmten Dienstleistungen zugeordnet sein, z.B. ein Arzt, der für die Notaufnahme zuständig ist.


##### 4. **EmigaPerson/Practitioner**

Die **EmigaPerson** repräsentiert Fachkräfte im Gesundheitswesen, wie Ärzte, Pflegekräfte oder Labormitarbeiter.

- **Beziehungen:**
  - **Role.practitioner (0..1)**: Eine Person kann eine Rolle innehaben, z.B. als leitender Arzt in einer Abteilung.


##### 5. **Rolle/PractitionerRole**

Die **Rolle** beschreibt die spezifische Funktion einer Person innerhalb einer Organisation, z.B. **Chefarzt**, **Pflegekraft** oder **Labortechniker**.

- **Beziehungen:**
  - **PractitionerRole.organization (0..1)**: Die Rolle ist einer Organisation zugeordnet.
  - **PractitionerRole.location (0..1)**: Die Rolle kann an einem bestimmten Standort ausgeübt werden.
  - **PractitionerRole.healthcareService (0..*)**: Die Rolle kann mit mehreren Dienstleistungen verknüpft sein.
  - **Role.practitioner (0..1)**: Die Rolle wird von einer spezifischen Person ausgefüllt.









