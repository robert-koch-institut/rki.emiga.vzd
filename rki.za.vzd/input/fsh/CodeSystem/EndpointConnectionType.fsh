CodeSystem: EndpointConnectionType
Id: EndpointConnectionType
Title: "EMIGA EndpointConnectionType"
Description: "Definiert Konzepte, die die im EMIGA-Kontext verwendeten Endpunkte bzw. die durch sie abgebildeten Verbindungen beschreiben."
* insert MetaTerminology
* ^version = "1.0.0"
* ^date = "2024-04-03"
* ^caseSensitive = true
* ^content = #complete
* ^valueSet = "https://emiga.rki.de/fhir/vzd/ValueSet/EndpointConnectionType"
* #survnetTransport "SurvNet (Transport)"

ValueSet: EndpointConnectionType
Title: "EMIGA EndpointConnectionType (ValueSet)"
Description: "Werteliste für die EndpointConnectionType im EMIGA-Kontext."
Id: EndpointConnectionType
* insert MetaTerminology
* ^version = "1.0.0"
* ^date = "2024-04-03"
* include codes from system EndpointConnectionType