Instance: IneKFileHeaderId
InstanceOf: NamingSystem
Title: "IneK DateiKopf"
Description: "Dieses NamingSystem beschreibt das Identifikationssystem für die Kennung des Datei-Kopfs von IneK-Dateien. Es definiert die formale Identität des verwendeten Identifikators und dient der eindeutigen Referenzierung und Wiederverwendung dieses Identifikationssystems in FHIR-Ressourcen."
Usage: #definition
* publisher = "Robert Koch-Institut"
* date = "2024-05-13"
* name = "IneKFileHeaderId"
* status = #active
* kind = #identifier
* uniqueId[+].type = #uri
* uniqueId[=].value = $IneKFileHeaderId