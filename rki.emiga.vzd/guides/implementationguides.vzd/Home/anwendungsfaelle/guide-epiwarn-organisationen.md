# {{page-title}}

Dieser Anwendungsfall beschreibt die Verwaltung von Organisationen und Einrichtungen, die im Rahmen von EpiWarn fachlich relevant sind.

Die allgemeinen fachlichen Regeln zur Entität `Einrichtung`, zum Lebenszyklus, zur Zuständigkeit, zur Sichtbarkeit und zur Verknüpfung mit weiteren EMIGA-Entitäten sind in den Grundlagen des VZD beschrieben.

<!-- TODO: Verweis auf die gemeinsame VZD-Grundlagenseite ergänzen. -->
<!-- TODO: Die noch offenen Extensions der verwendeten Profile ergänzen. -->

## Überblick

{{render:guides/implementationguides.common/PlantUML/PNGs/VzdOverview.png}}

EpiWarn-Organisationen dienen der eindeutigen Identifikation und Verwaltung von Einrichtungen und Stellen, die an EpiWarn-Prozessen beteiligt sind.

EpiWarn-Organisationen werden grundsätzlich über die für Organisationen vorgesehenen EMIGA-Profile abgebildet. Je nach fachlichem Bedarf kann insbesondere `EmigaOrganization` verwendet werden. Handelt es sich bei einer EpiWarn-Organisation um eine direkt nutzende ÖGD-Organisation mit Code-Side-ID, wird `EmigaPublicHealthOrganization` verwendet.

Eine EpiWarn-Organisation kann beispielsweise folgende Funktionen haben:

- meldende Organisation,
- empfangende Organisation,
- zuständige Organisation,
- weiterleitende Organisation,
- fachlich beteiligte Organisation,
- koordinierende Stelle,
- Kontaktstelle für Rückfragen.

## Fachlicher Ablauf

Eine EpiWarn-Organisation wird aus einem zentralen EpiWarn-Verzeichnis übernommen, manuell durch einen berechtigten Nutzer angelegt oder aus einer führenden Quelle synchronisiert.

Der Client sucht eine Organisation anhand ihres Identifiers oder anhand fachlicher Suchparameter. Anschließend werden der aktuelle Detailstand, die fachliche Rolle, die Zuständigkeit und die erreichbaren Kommunikationsadressen abgerufen.

Falls die Organisation über physische Standorte verfügt, werden diese über `EmigaLocation` referenziert. Werden Gesundheitsleistungen angeboten, können diese über `EmigaHealthcareService` beschrieben werden.

Personen und deren fachliche Rollen werden über `EmigaPractitioner` und `EmigaPractitionerRole` mit der Organisation verknüpft.

Die ausgewählte Organisation wird in einem EpiWarn-Prozess als meldende, empfangende, zuständige oder beteiligte Organisation referenziert.

## EpiWarn-Organisation

Das Profil `EmigaOrganization` bildet eine EpiWarn-Organisation ab, sofern es sich nicht um eine direkt nutzende ÖGD-Organisation mit Code-Side-ID handelt.

{{render:guides/implementationguides.common/PlantUML/PNGs/Organization.png}}

| Element | Bedeutung |
| --- | --- |
| `identifier` | EpiWarn-spezifische oder fachübergreifende Identifikatoren. |
| `active` | Gibt an, ob die Organisation aktuell verwendet werden kann. |
| `type` | Fachliche Einordnung der Organisation. |
| `name` | Offizielle Bezeichnung der Organisation. |
| `alias` | Kurz- oder Alternativbezeichnungen. |
| `address` | Standort- oder Zustelladresse. |
| `telecom` | Für EpiWarn relevante Kommunikationsadressen. |
| `managingOrganization` | Referenz auf eine verwaltende Organisation, sofern vorhanden. |
| `location` | Referenzen auf physische Standorte. |
| `contact` | Fachliche Ansprechpersonen oder Kontaktstellen. |

Handelt es sich bei der Organisation um eine direkt nutzende ÖGD-Organisation mit Code-Side-ID, wird `EmigaPublicHealthOrganization` verwendet.

## ÖGD-Organisationen

Das Profil `EmigaPublicHealthOrganization` bildet direkt nutzende ÖGD-Organisationen ab, die eine Code-Side-ID besitzen.

{{render:guides/implementationguides.common/PlantUML/PNGs/PublicHealthOrganization.png}}

| Element | Bedeutung |
| --- | --- |
| `identifier` | Identifikatoren der ÖGD-Organisation. |
| `code-side-id` | Vom RKI vergebene Kennung der ÖGD-Organisation. |
| `active` | Gibt an, ob die ÖGD-Organisation aktuell aktiv ist. |
| `name` | Offizielle Bezeichnung der ÖGD-Organisation. |
| `managingOrganization` | Übergeordnete Organisation, sofern vorhanden. |
| `location` | Physische Standorte der ÖGD-Organisation. |

Die Code-Side-ID wird über das Profil `IdentifierCodeSiteId` abgebildet.

`EmigaPublicHealthOrganization` ist von `EmigaOrganization` zu unterscheiden. `EmigaOrganization` umfasst Organisationen, die nicht direkt nutzende ÖGD-Organisationen mit Code-Side-ID sind.

<!-- TODO: Die konkrete FHIR-Abbildung der Code-Side-ID ergänzen. -->
<!-- TODO: UML für EmigaPublicHealthOrganization? -->
<!-- TODO: Die Beziehung zu übergeordneten ÖGD-Organisationen konkretisieren. -->

## EpiWarn-Rollen

Eine EpiWarn-Organisation kann abhängig vom jeweiligen Prozess unterschiedliche fachliche Rollen besitzen.

| Rolle | Bedeutung |
| --- | --- |
| Meldende Organisation | Stelle, von der eine fachliche Information oder Meldung ausgeht. |
| Empfangende Organisation | Stelle, an die eine Information oder Meldung übermittelt wird. |
| Zuständige Organisation | Stelle, die für die fachliche Bearbeitung oder Bewertung zuständig ist. |
| Weiterleitende Organisation | Stelle, die Informationen an eine weitere Organisation übermittelt. |
| Koordinierende Organisation | Stelle, die einen Prozess oder ein Ereignis übergreifend koordiniert. |
| Beteiligte Organisation | Organisation, die fachlich am Prozess beteiligt ist. |
| Kontaktorganisation | Organisation, die für Rückfragen oder Abstimmungen kontaktiert werden kann. |

Eine Organisation kann mehrere Rollen besitzen. Die konkrete Rolle kann vom jeweiligen EpiWarn-Prozess oder von der verwendeten Nachricht abhängen.

<!-- TODO: EpiWarn-Rollen und deren Codierung ergänzen. -->
<!-- TODO: Wie werden Rollen technisch abgebildet? -->

## Identifikatoren

EpiWarn-Organisationen werden über geeignete fachliche oder technische Identifier identifiziert.

Mögliche Identifier sind:

- EpiWarn-Identifier,
- Code-Side-ID für direkt nutzende ÖGD-Organisationen,
- Behördenkennungen,
- ÖGD-spezifische Identifier,
- Institutionskennzeichen,
- interne Organisationsnummern,
- technische Kommunikationskennungen.

Die Auswahl einer Organisation darf nicht ausschließlich anhand ihres Namens erfolgen.

<!-- TODO: Die verbindlichen EpiWarn-Identifier und CodeSysteme ergänzen. -->
<!-- TODO: Festlegen, in welchen Fällen `IdentifierCodeSiteId` verwendet wird. -->
<!-- TODO: Regeln zur Auflösung und Validierung von Identifiern beschreiben. -->

## Physische Standorte

Physische Standorte werden über `EmigaLocation` oder ein spezialisierteres Standortprofil abgebildet.

{{render:guides/implementationguides.common/PlantUML/PNGs/Location.png}}

Ein physischer Standort kann über folgende Angaben beschrieben werden:

| Element | Bedeutung |
| --- | --- |
| `identifier` | Eindeutige Kennung des Standorts. |
| `status` | Status des Standorts. |
| `name` | Bezeichnung des Standorts. |
| `address` | Standort- oder Zustelladresse. |
| `position` | Optionale Geokoordinaten. |
| `managingOrganization` | Referenz auf die verwaltende EpiWarn-Organisation. |
| `partOf` | Referenz auf einen übergeordneten physischen Ort. |

Ein Standort wird über `managingOrganization` der EpiWarn-Organisation zugeordnet.

## Gesundheitsleistungen

Falls eine EpiWarn-Organisation eine gesundheitsbezogene Dienstleistung anbietet, kann diese über `EmigaHealthcareService` abgebildet werden.

{{render:guides/implementationguides.common/PlantUML/PNGs/HealthCareService.png}}

Beispiele sind:

- EpiWarn-Kontaktstelle,
- infektiologische Beratungsstelle,
- Meldestelle,
- Bereitschaftsdienst,
- Laborleistung,
- Koordinierungsstelle.

Die Gesundheitsleistung wird über `providedBy` der anbietenden Organisation zugeordnet. Die Standorte, an denen sie angeboten wird, werden über `location` referenziert.

## Ansprechpersonen und Rollen

EpiWarn-Organisationen können mit `EmigaPractitioner` und `EmigaPractitionerRole` verknüpft werden.

Mögliche Funktionen sind:

- EpiWarn-Kontaktstelle,
- fachliche Leitung,
- technische Kontaktstelle,
- Meldestelle,
- Bereitschaftsdienst,
- zuständige Sachbearbeitung,
- Vertretung.

{{render:guides/implementationguides.common/PlantUML/PNGs/Practitioner.png}}

`EmigaPractitionerRole` beschreibt dabei:

- den Practitioner,
- die Organisation,
- die ausgeübte Rolle,
- gegebenenfalls die Gesundheitsleistung,
- gegebenenfalls den Standort.

{{render:guides/implementationguides.common/PlantUML/PNGs/PractitionerRole.png}}

Die Sichtbarkeit der Ansprechpersonen wird getrennt von der Sichtbarkeit der Organisation gesteuert.

## Kommunikationsadressen

Für die EpiWarn-Kommunikation sind aktuelle und eindeutig zuordenbare Kommunikationsadressen erforderlich.

Eine Organisation kann mehrere Kommunikationswege besitzen:

- E-Mail-Adressen,
- sichere Übermittlungsadressen,
- technische Endpunkte,
- Telefon- oder Bereitschaftsnummern,
- fachliche Kontaktadressen.

Die Gültigkeit und Verwendbarkeit der Kommunikationsadresse muss bei der Auswahl einer Organisation berücksichtigt werden.

<!-- TODO: Die unterstützten Kommunikationsarten ergänzen. -->
<!-- TODO: Festlegen, wie technische Endpunkte und fachliche Kontaktadressen unterschieden werden. -->
<!-- TODO: Gültigkeitszeiträume für Kommunikationsadressen beschreiben. -->

## Verknüpfung mit anderen Entitäten

| Entität oder Prozess | Verwendung der EpiWarn-Organisation |
| --- | --- |
| EpiWarn-Nachricht | Meldende, empfangende, zuständige oder beteiligte Organisation. |
| `Meldung` | Meldende oder empfangende Stelle. |
| `Infektionsereignis` | Zuständige oder koordinierende Organisation. |
| `Ausbruch` | Fachlich beteiligte oder empfangende Organisation. |
| `Annotation` | Ergänzende Hinweise zur Organisation oder Kommunikation. |
| `Aufgabe` | Arbeitsschritte im Zusammenhang mit der Organisation. |

<!-- TODO: Die konkreten EpiWarn-Entitäten und deren Referenzierungsregeln ergänzen. -->

## Beispiel: EpiWarn-Kommunikation

Für ein relevantes Infektionsereignis muss eine Information an mehrere beteiligte Stellen übermittelt werden.

Im VZD werden folgende Organisationen ermittelt:

- **Meldende Organisation:** Gesundheitsamt Musterstadt
- **Zuständige Organisation:** Landesbehörde Musterland
- **Empfangende Organisation:** Bundesweite Koordinierungsstelle
- **Beteiligte Organisation:** Referenzlabor Musterstadt

Das Gesundheitsamt Musterstadt wird als `EmigaPublicHealthOrganization` mit `IdentifierCodeSiteId` geführt. Das Referenzlabor wird als `EmigaOrganization` abgebildet.

Der Client sucht die Organisationen anhand ihrer Identifier oder geeigneter fachlicher Suchparameter. Anschließend werden die aktuellen Kontaktdaten und technischen Kommunikationsadressen abgerufen.

Die EpiWarn-Nachricht referenziert die ausgewählten Organisationen. Die Stammdaten der Organisationen werden nicht in der Nachricht dupliziert.

## Zuständigkeit und Sichtbarkeit

EpiWarn-Organisationen können abhängig vom Prozess unterschiedlichen Zuständigkeiten unterliegen. Die zuständige Organisation muss eindeutig von einer lediglich beteiligten oder empfangenden Organisation unterschieden werden können.

Bei der Anzeige und Auswahl sind insbesondere folgende Informationen zu berücksichtigen:

- aktuelle Aktivität der Organisation,
- gültige fachliche Rolle,
- zuständige ÖGD-Ebene,
- Code-Side-ID, sofern vorhanden,
- erlaubte Kommunikationswege,
- Gültigkeitszeitraum,
- Sichtbarkeit für den authentifizierten Nutzer oder das aufrufende System.

<!-- TODO: Die Zuständigkeitsregeln für EpiWarn-Organisationen ergänzen. -->
<!-- TODO: Festlegen, ob EpiWarn-Organisationen ÖGD-weit sichtbar sind. -->
<!-- TODO: Regeln für organisations- oder mandantenbezogene Sichtbarkeit ergänzen. -->

## Fachlicher Lebenszyklus

Der Lebenszyklus einer EpiWarn-Organisation umfasst:

1. Anlage oder Übernahme aus einer führenden Quelle.
2. Ergänzung und fachliche Präzisierung von Identifikatoren, Rollen und Kommunikationsadressen.
3. Zuordnung physischer Standorte.
4. Zuordnung von Gesundheitsleistungen, Personen und Rollen.
5. Verwendung in EpiWarn-Prozessen.
6. Aktualisierung bei Änderungen von Zuständigkeiten oder Kommunikationswegen.
7. Deaktivierung bei Wegfall der fachlichen Relevanz.
8. Löschung gemäß dem geltenden Löschkonzept.

Historische Nachrichten und Vorgänge müssen auch nach einer Deaktivierung auf die ursprüngliche Organisation verweisen können.

## Schnittstellenoperationen

Der VZD stellt FHIR-Schnittstellen für die Suche, den Detailabruf und gegebenenfalls die Pflege von EpiWarn-Organisationen, Standorten und Rollen bereit. Die Operationen verarbeiten FHIR-Ressourcen in den Formaten `application/fhir+json` oder `application/fhir+xml` und sind über Bearer Token abgesichert.

<!-- TODO: Die verbindlichen Endpunkte und Operationsnamen anhand der VZD- und EpiWarn-Spezifikation prüfen. -->

| Operation | Methode | Zweck | Ergebnis |
| --- | --- | --- | --- |
| `/metadata` | `GET` | Abruf des FHIR-`CapabilityStatement`. | `CapabilityStatement` |
| `/Organization/$search-organization` | `GET`, `POST` | Suche nach EpiWarn-Organisationen. | `Bundle` vom Typ `searchset` |
| `/Organization/{id}/$organization-details` | `GET`, `POST` | Abruf des aktuellen Organisationsstands. | FHIR-`Organization` oder FHIR-`Bundle` |
| `/Location/$search-location` | `GET`, `POST` | Suche nach Standorten. | `Bundle` vom Typ `searchset` |
| `/HealthcareService/$search-healthcare-service` | `GET`, `POST` | Suche nach Gesundheitsleistungen. | `Bundle` vom Typ `searchset` |
| `/PractitionerRole/$search-practitioner-role` | `GET`, `POST` | Suche nach Personen und Rollen. | `Bundle` vom Typ `searchset` |
| `/Organization/$create-organization` | `POST` | Anlage einer EpiWarn-Organisation. | Gespeicherte FHIR-Ressource oder FHIR-`Bundle` |
| `/Organization/$update-organization` | `POST` | Änderung einer bestehenden Organisation. | Gespeicherte FHIR-Ressource oder FHIR-`Bundle` |
| `/Organization/{id}/$deactivate-organization` | `POST` | Deaktivierung einer Organisation. | `OperationOutcome` |
| `/OperationDefinition/{id}` | `GET` | Abruf der technischen Beschreibung einer Operation. | `OperationDefinition` |

## Erstellung und Versionierung

Beim Erstellen einer EpiWarn-Organisation werden die erforderlichen Stammdaten, Identifier, Rollen und Kommunikationsadressen an den VZD übermittelt.

Physische Standorte, Gesundheitsleistungen, Personen und Rollen werden als eigene Ressourcen angelegt und mit der Organisation verknüpft.

Bei einer Änderung werden insbesondere Identifier, Organisationstyp, fachliche Rolle, Zuständigkeit, Kommunikationsadresse, Gültigkeitszeitraum und Ansprechpersonen geprüft.

Historische Vorgänge müssen weiterhin mit dem zum jeweiligen Zeitpunkt gültigen Organisationsstand nachvollziehbar bleiben.

<!-- TODO: Festlegen, ob Änderungen versioniert werden und ob eine Historienoperation angeboten wird. -->

## Suche und Anzeige

Typische Suchkriterien sind:

- EpiWarn-Identifier,
- Code-Side-ID,
- Name oder Namensbestandteil,
- Organisationstyp,
- EpiWarn-Rolle,
- meldende Organisation,
- empfangende Organisation,
- zuständige Organisation,
- Ort oder Postleitzahl,
- Status,
- Kommunikationsadresse,
- übergeordnete Organisation,
- Gesundheitsleistung,
- Ansprechperson.

Die Suche soll nur Organisationen berücksichtigen, die für den jeweiligen Prozess aktiv und zugelassen sind.

Bei der Anzeige muss zwischen Organisation, physischem Standort, Gesundheitsleistung und Ansprechperson unterschieden werden.

<!-- TODO: Die unterstützten Suchparameter sowie `_count`, `_offset` und Sortierparameter ergänzen. -->

## Interoperabilitätshinweise

Clients sollen folgende Regeln berücksichtigen:

- `EmigaOrganization` ist für nicht direkt nutzende ÖGD-Organisationen vorgesehen.
- `EmigaPublicHealthOrganization` ist für direkt nutzende ÖGD-Organisationen mit Code-Side-ID vorgesehen.
- Die Code-Side-ID wird über `IdentifierCodeSiteId` abgebildet.
- Organisationen und physische Standorte sind getrennte Ressourcen.
- Physische Standorte werden über `EmigaLocation` oder ein spezialisiertes Standortprofil abgebildet.
- Die verwaltende Organisation eines Standorts wird über `managingOrganization` referenziert.
- Gesundheitsleistungen werden über `EmigaHealthcareService` abgebildet.
- Die anbietende Organisation wird über `providedBy` referenziert.
- Standorte einer Gesundheitsleistung werden über `location` referenziert.
- Personen und Rollen werden über `EmigaPractitioner` und `EmigaPractitionerRole` abgebildet.
- Die Rolle einer Organisation muss im jeweiligen Prozess eindeutig ausgewertet werden.
- Eine empfangende Organisation ist nicht automatisch die zuständige Organisation.
- Nur aktive und aktuell gültige Organisationen sollen für neue Prozesse ausgewählt werden.
- Kommunikationsadressen müssen auf ihre Gültigkeit und Verwendbarkeit geprüft werden.
- Historische Vorgänge müssen auch nach einer Deaktivierung auf die ursprüngliche Organisation verweisen können.
- Personenbezogene Kontaktdaten müssen entsprechend den Datenschutz- und Berechtigungsvorgaben behandelt werden.
