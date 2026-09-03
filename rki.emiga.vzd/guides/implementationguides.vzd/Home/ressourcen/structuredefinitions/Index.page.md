# {{page-title}}

## Inhaltsverzeichnis

{{index:children}}

---

## StructureDefinitions Überblick

Dieser Abschnitt bietet eine Übersicht über die in diesem Implementierungsleitfaden definierten **FHIR-Profile und -Ressourcen**. Die Profile sind speziell für den Öffentlichen Gesundheitsdienst (**ÖGD**) in Deutschland angepasst und erweitern Standard-FHIR-Ressourcen, um spezifische Anforderungen abzubilden. Diese Ressourcen sind zentral für die Abbildung von Organisationen, Personen und Dienstleistungen im Kontext des Infektionsschutzes und der Zusammenarbeit im Öffentlichen Gesundheitsdienst.
<br>&nbsp;<br>

<fql headers="true">
from
    StructureDefinition
where
    url.startsWith('https://emiga.rki.de/fhir/vzd/StructureDefinition/')
    or
    url.startsWith('https://emiga.rki.de/fhir/StructureDefinition/')
select
    Profil: title & ' (' & id & ')',
    Beschreibung: description
</fql>