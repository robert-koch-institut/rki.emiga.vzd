CodeSystem: ConceptDesignationUse
Id: ConceptDesignationUse
Title: "Nutzungszwecke für Anzeigetexte"
Description: "Enthält Konzepte, welche genutzt werden können, um verschiedene Arten bzw. Nutzungszwecke von Anzeigetexten zu unterscheiden. Die Verwendung der Konzepte erfolgt im Kontext von 'designation.use'."
* ^language = #de-DE
* ^version = "1.0.0"
* ^date = "2024-03-28"
* ^contact.name = "Robert Koch-Institut"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "https://rki.de"
* ^content = #complete
* ^valueSet = "https://emiga.rki.de/fhir/vzd/ValueSet/ConceptDesignationUse"
* insert Meta
* #abbreviation "Abkürzung" "Abkürzung für den Anzeigetext - Diese Darstellung repräsentiert eine maximal verkürzte Form des Anzeigetextes und kann beispielsweise zur platzsparenden Anzeige in Tabellen genutzt werden."
* #short "Kurzform" "Kurzform des Anzeigetextes - Diese Form sollte üblicherweise weniger umfassend sein als die Normalform und wird immer dann genutzt, wenn ein weniger platzintensive Darstellung erforderlich ist."
* #default "Normalform" "Normalform des Anzeigetextes - entspricht üblicherweise dem 'display'-Wert des Konzeptes"
* #long "Langform" "Langform des Anzeigetextes - Diese Form der Darstellung kann genutzt werden, wenn viel Platz vorhanden ist und ggf. mehr Informationen als in der Normalform transortiert werden müssen."

ValueSet: ConceptDesignationUse
Id: ConceptDesignationUse
Title: "Nutzungszwecke für Anzeigetexte (Value Set)"
Description: "Nutzungszwecke für Anzeigetexte"
* insert Meta
* ^date = "2024-03-19"
* ^version = "1.0.0"
* include codes from system ConceptDesignationUse