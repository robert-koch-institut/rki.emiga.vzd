# {{page-title}}

Dieser Anwendungsfall beschreibt die Verwaltung von Krankenhäusern und krankenhausbezogenen Organisationen und Standorten im VZD.

Die allgemeinen fachlichen Regeln zur Entität `Einrichtung`, zum Lebenszyklus, zur Zuständigkeit, zur Sichtbarkeit und zur Verknüpfung mit weiteren EMIGA-Entitäten sind in den Grundlagen des VZD beschrieben.

<!-- TODO: Verweis auf die gemeinsame VZD-Grundlagenseite ergänzen. -->
<!-- TODO: Die noch offenen Extensions der verwendeten Profile ergänzen. -->

## Überblick

Für die Abbildung von Krankenhäusern und deren räumlichen und organisatorischen Einheiten werden im VZD mehrere spezialisierte Profile verwendet:

- `EmigaHospitalOrganization` für das Krankenhaus,
- `EmigaHospitalLocation` für besuchbare Krankenhausstandorte,
- `EmigaHospitalFacilityLocation` für Einrichtungsstandorte nach dem InEK-Standortverzeichnis oder für Stationen,
- `EmigaHospitalRoomLocation` für Räume innerhalb eines Krankenhausstandorts,
- `EmigaDepartmentOrganization` für organisatorische Teile einer Abteilung,
- `EmigaPractitioner` für fachlich zugeordnete Personen,
- `EmigaPractitionerRole` für die Zuordnung einer Person zu einer Organisation und Rolle,
- `EmigaHealthcareService` für angebotene Gesundheitsleistungen.

{{render:guides/implementationguides.common/PlantUML/PNGs/VzdOverview.png}}

Die Profile unterscheiden zwischen organisatorischen Einheiten und physischen Orten. Eine Klinik oder Fachabteilung ist beispielsweise eine organisatorische Einheit, während ein Krankenhausstandort, eine Station oder ein Raum einen physischen Ort beschreibt.

## Fachlicher Ablauf

Eine Krankenhausorganisation wird im VZD angelegt oder aus einer führenden Quelle übernommen. Anschließend werden die Organisationsdaten fachlich ergänzt und präzisiert. Dazu gehören insbesondere Name, Identifikatoren, Organisationsart, Zuständigkeiten und hierarchische Beziehungen.

Im nächsten Schritt können die zugehörigen Standorte und räumlichen Einheiten ergänzt werden. Je nach fachlichem Bedarf werden dabei Krankenhausstandorte, Einrichtungsstandorte, Stationen und Räume abgebildet.

{{render:guides/implementationguides.common/PlantUML/PNGs/HospitalOrg.png}}

Ansprechpersonen und weitere fachlich zugeordnete Personen werden über `EmigaPractitioner` und `EmigaPractitionerRole` verknüpft. Gesundheitsleistungen werden über `EmigaHealthcareService` beschrieben und können den Organisationen sowie den Standorten zugeordnet werden.

Die Krankenhausorganisation kann mit Meldungen, Fällen, Kontakten, Kontaktevents, Ausbrüchen und Infektionsereignissen verknüpft werden.

## Krankenhausorganisation

Das Profil `EmigaHospitalOrganization` bildet ein Krankenhaus im Kontext von EMIGA ab. Es enthält insbesondere Stammdaten, Kennziffern, Kontakt- und Adressdaten.

{{render:guides/implementationguides.common/PlantUML/PNGs/HospitalOrganization.png}}

| Element | Bedeutung |
| --- | --- |
| `identifier` | Fachliche Identifikatoren des Krankenhauses, beispielsweise Institutionskennzeichen oder weitere Krankenhauskennungen. |
| `active` | Gibt an, ob das Krankenhaus aktuell betrieben und verwendet werden kann. |
| `type` | Fachliche Einordnung des Krankenhauses. |
| `name` | Offizielle Bezeichnung des Krankenhauses. |
| `alias` | Kurz- oder Alternativbezeichnungen. |
| `telecom` | Telefonische und elektronische Kontaktdaten. |
| `address` | Post- oder Hauptanschrift des Krankenhauses. |
| `managingOrganization` | Übergeordnete Organisation, sofern das Krankenhaus einer übergeordneten Organisation zugeordnet ist. |
| `location` | Referenzen auf zugehörige Krankenhausstandorte. |

`EmigaHospitalOrganization` ist eine Spezialisierung der FHIR-Ressource `Organization`.

## Krankenhausstandorte

Das Profil `EmigaHospitalLocation` bildet einen besuchbaren Standort eines Krankenhauses ab. Dazu gehören beispielsweise ein Hauptstandort, ein Klinikgebäude oder ein weiterer Krankenhausstandort.

{{render:guides/implementationguides.common/PlantUML/PNGs/HospitalLocation.png}}

| Element | Bedeutung |
| --- | --- |
| `identifier` | Kennung des Krankenhausstandorts. |
| `status` | Status des Standorts. |
| `name` | Bezeichnung des Standorts. |
| `address` | Adresse des Standorts. |
| `position` | Optionale Geokoordinaten. |
| `managingOrganization` | Referenz auf das verwaltende `EmigaHospitalOrganization`. |
| `partOf` | Referenz auf einen übergeordneten Standort. |

Das Profil `EmigaHospitalFacilityLocation` bildet Einrichtungsstandorte nach dem InEK-Standortverzeichnis oder Stationen eines Krankenhauses ab.

{{render:guides/implementationguides.common/PlantUML/PNGs/HospitalFacilityLocation.png}}

Das Profil `EmigaHospitalRoomLocation` bildet einen Raum in einem Krankenhaus ab. Es dient der strukturierten Erfassung von räumlichen Einheiten innerhalb eines Krankenhausstandorts (z. B. Zimmer, Behandlungsräume, Isolationsbereiche) einschließlich ihrer Identifikation und Zuordnung zu übergeordneten Organisationseinheiten.

{{render:guides/implementationguides.common/PlantUML/PNGs/HospitalRoomLocation.png}}