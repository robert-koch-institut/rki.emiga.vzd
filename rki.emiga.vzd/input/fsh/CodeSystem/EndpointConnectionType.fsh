CodeSystem: EndpointConnectionType
Id: EndpointConnectionType
Title: "Endpunktverbindungstyp"
Description: "Die Kodiersystematik 'EndpointConnectionType' definiert Konzepte, die die im EMIGA-Kontext verwendeten Endpunkte bzw. die durch sie abgebildeten Verbindungen grob charakterisieren."
* insert MetadataTerminology
* ^version = "1.0.0"
* ^date = "2024-04-03"
* ^caseSensitive = true
* ^content = #complete
* ^valueSet = "https://emiga.rki.de/fhir/vzd/ValueSet/EndpointConnectionType"
* #survnetTransport "SurvNet (Transport)"

ValueSet: EndpointConnectionType
Title: "Endpunktverbindungstyp (Werteliste)"
Description: "Werteliste mit Konzepten, die den Typ einer Endpunktverbindung näher beschreiben."
Id: EndpointConnectionType
* insert MetadataTerminology
* ^version = "1.0.0"
* ^date = "2024-04-03"
* include codes from system EndpointConnectionType