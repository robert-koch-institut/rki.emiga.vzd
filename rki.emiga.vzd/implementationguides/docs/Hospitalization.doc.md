Insbesondere vor dem Hintergrund der Ermittlung der Hospitalisierungsinzidenz ist das im Folgenden diskutierte Profil von besonderer Bedeutung. Mit seiner Hilfe können detaillierte Angaben zum Hospitalisierungsstatus einer betroffen Person gemacht werden.
Das [Hospitalization](https://simplifier.net/rki.demis.disease/~resources?canonical=https://demis.rki.de/fhir/structuredefinition/hospitalization)-Profil definiert seine Einschränkungen und Erweiterungen direkt auf der HL7 [Encounter](https://www.hl7.org/fhir/encounter.html)-Definition.

Ressourcen, die dieses Profil umsetzen, können die folgenden logischen Informationen als Bestandteil der Meldung transportieren: u.a. Krankenhaus (Anschrift etc.), Region, Status, Art, Beginn und Ende der Hospitalisierung sowie zusätzliche textuelle Hinweise.

Die Profilierung nimmt eine Reihe von Einschränkungen und Festlegungen vor, die primär die Verwendung bestimmter Elemente (z.B. type) unterbindet bzw. anderer Elemente (z.B. serviceType, period) fordert. Neben diesen Einschränkungen werden zusätzlich zwei Erweiterungen vorgenommen:

- **Region der Hospitalisierung** - zu nutzen, sofern kein konkretes Krankenhaus über serviceProvider referenziert werden kann
- **Hinweise/Notizen zur Hospitalisierung** - zu nutzen, sofern die meldepflichtige Person dem Gesundheitsamt gegenüber wichtige Hinweise zur Hospitalisierung übermitteln möchte.

Mit Blick auf das logische Informationsmodell ergibt sich eine weitere Besonderheit: Ein Aufenthalt auf einer Intensivstation wird nicht anders dargestellt als der Aufenthalt auf einer "normalen" Station. Eine Unterscheidung findet ausschließlich über den angegebenen serviceType statt.
