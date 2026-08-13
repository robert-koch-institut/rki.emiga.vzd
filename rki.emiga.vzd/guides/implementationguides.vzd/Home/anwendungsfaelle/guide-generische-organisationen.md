# {{page-title}}

Dieser Anwendungsfall beschreibt die Verwaltung generischer Einrichtungen und Organisationen im VZD.

Die allgemeinen fachlichen Regeln zur Entität `Einrichtung`, zum Lebenszyklus, zur Zuständigkeit, zur Sichtbarkeit und zur Verknüpfung mit weiteren EMIGA-Entitäten sind in den Grundlagen des VZD beschrieben.

<!-- TODO: Verweis auf die gemeinsame VZD-Grundlagenseite ergänzen. -->
<!-- TODO: Die noch offenen Extensions der verwendeten Profile ergänzen. -->

## Überblick

{{render:guides/implementationguides.common/PlantUML/PNGs/VzdOverview.png}}

Generische Organisationen werden über das Profil `EmigaOrganization` abgebildet. Das Profil umfasst Organisationen, die keine direkt nutzende ÖGD-Organisation mit Code-Side-ID sind.

Dazu gehören beispielsweise:

- Behörden,
- Transport-Unternehmen,
- Krankenhäuser,
- Labore,
- Arztpraxen,
- Pflegeeinrichtungen,
- Schulen,
- Kindergärten,
- Gemeinschaftseinrichtungen,
- Unterkünfte,
- Lebensmittelbetriebe,
- Unternehmen,
- Forschungseinrichtungen,
- sonstige Institutionen.

Eine generische Organisation muss nicht zwingend über eine Straßenanschrift verfügen. Häufig besitzt sie jedoch zumindest eine Postanschrift oder elektronische Kontaktdaten.

Zusätzlich können physische Orte, Gesundheitsleistungen und fachlich zugeordnete Personen verwaltet werden.

## Fachlicher Ablauf

Eine generische Organisation wird manuell angelegt, aus einem zentralen Verzeichnis übernommen, im Rahmen einer DEMIS-Meldung erzeugt oder über einen Excel-Import eingelesen.

Nach der Anlage werden Stammdaten, Organisationstyp, Identifier, Kontaktdaten und gegebenenfalls Standorte ergänzt.

{{render:guides/implementationguides.common/PlantUML/PNGs/OrganizationOrg.png}}

Physische Orte werden über `EmigaLocation` abgebildet. Gesundheitsleistungen werden über `EmigaHealthcareService` beschrieben. Personen und deren Rollen werden über `EmigaPractitioner` und `EmigaPractitionerRole` mit der Organisation verknüpft.

Die Organisation kann mit Meldungen, Fällen, Kontakten, Kontaktevents, Ausbrüchen und Infektionsereignissen verknüpft werden.

## Generische Organisation

{{render:guides/implementationguides.common/PlantUML/PNGs/Organization.png}}

Das Profil `EmigaOrganization` bildet eine generische Organisation im Kontext von EMIGA ab.

| Element | Bedeutung |
| --- | --- |
| `identifier` | Eindeutige fachliche oder technische Identifikatoren. |
| `active` | Gibt an, ob die Organisation aktuell verwendet werden kann. |
| `type` | Fachliche Kategorie der Organisation. |
| `name` | Offizielle Bezeichnung der Organisation. |
| `alias` | Kurz- oder Alternativbezeichnungen. |
| `address` | Postanschrift oder gegebenenfalls Straßenanschrift. |
| `telecom` | Telefon, E-Mail, Webadresse und weitere Kommunikationswege. |
| `managingOrganization` | Referenz auf die verwaltende Organisation, sofern vorhanden. |
| `location` | Referenzen auf zugehörige physische Orte. |
| `contact` | Verknüpfte Ansprechpersonen oder Funktionsrollen. |

`EmigaOrganization` ist eine Spezialisierung der FHIR-Ressource `Organization`.

Eine generische Organisation ist von einer `EmigaPublicHealthOrganization` zu unterscheiden. `EmigaPublicHealthOrganization` beschreibt direkt nutzende ÖGD-Organisationen mit einer Code-Side-ID.

## Einrichtungstypen

| Einrichtungstyp | Beispiele |
| --- | --- |
| Gesundheitsamt oder Behörde | Kommunales Gesundheitsamt, Landesbehörde oder sonstige öffentliche Stelle. |
| Krankenhaus | Krankenhaus oder medizinische Einrichtung außerhalb der spezialisierten Krankenhausabbildung. |
| Labor | Medizinisches Labor oder Untersuchungslabor. |
| Arztpraxis | Hausarztpraxis, Facharztpraxis oder Gemeinschaftspraxis. |
| Pflegeeinrichtung | Pflegeheim, Seniorenheim oder ambulante Pflegeeinrichtung. |
| Gemeinschaftseinrichtung | Schule, Kindertagesstätte oder Jugendhilfeeinrichtung. |
| Unterkunft | Gemeinschaftsunterkunft, Flüchtlingsunterkunft oder Hotel. |
| Lebensmittelbetrieb | Gastronomiebetrieb, Produktionsbetrieb oder Großküche. |
| Unternehmen | Betrieb, Arbeitgeber oder sonstige Firma. |
| Forschungseinrichtung | Universität oder Forschungsinstitut. |
| Transport-Unternehmen | Unternehmen, das Transport- oder Beförderungsleistungen anbietet. |
| Sonstige Organisation | Organisation ohne spezifische fachliche Kategorie. |

<!-- TODO: Die verbindlichen Einrichtungstypen und deren Codierung ergänzen. -->
<!-- TODO: Festlegen, ob mehrere Organisationstypen gleichzeitig angegeben werden können. -->
<!-- TODO: Die Abgrenzung zwischen `EmigaOrganization` und spezialisierten Organisationsprofilen ergänzen. -->

## Physische Orte

Das Profil `EmigaLocation` beschreibt einen physischen Ort, der besucht werden kann.

{{render:guides/implementationguides.common/PlantUML/PNGs/Location.png}}

Ein physischer Ort kann grundsätzlich über Geokoordinaten und in der Regel über eine Straßenadresse beschrieben werden.

| Element | Bedeutung |
| --- | --- |
| `identifier` | Eindeutige Kennung des physischen Orts. |
| `status` | Status des Orts. |
| `name` | Bezeichnung des Orts. |
| `address` | Straßen- oder Standortadresse. |
| `position` | Optionale Geokoordinaten. |
| `managingOrganization` | Referenz auf die verwaltende Organisation. |
| `partOf` | Referenz auf einen übergeordneten physischen Ort. |

Ein `EmigaLocation` kann über `managingOrganization` einer `EmigaOrganization` zugeordnet werden.