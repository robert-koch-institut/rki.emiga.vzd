// EMIGA VZD normative CapabilityStatement
// Verifiziert gegen ref-get-capability-statement_08092026.json

Instance: EmigaVzdCapabilityStatementRequirements
InstanceOf: CapabilityStatement
Usage: #definition
* url = "https://emiga.rki.de/fhir/vzd/CapabilityStatement/EmigaVzdRequirements"
* version = "0.2.0-draft"
* name = "EmigaVzdRequirements"
* title = "CapabilityStatement für EMIGA VZD"
* status = #draft
* experimental = true
* date = "2026-09-16"
* publisher = "Robert Koch-Institut"
* kind = #requirements
* fhirVersion = #4.0.1
* format[0] = #application/fhir+xml
* format[1] = #application/fhir+json
* description = """
Dieses CapabilityStatement beschreibt die normativen FHIR-REST-Anforderungen für EMIGA VZD.
Es ist vom Typ `requirements`. Zur Kennzeichnung der Verbindlichkeit wird die
CapabilityStatement-Expectation-Extension mit den möglichen Werten 'SHALL' (=MUSS) 'SHOULD' (=SOLL) 'MAY' (=KANN) 'SHOULD-NOT' (=SOLL NICHT) verwendet.

Die aufgeführten Interaktionen entsprechen den vom geprüften HAPI-FHIR-Referenzserver
unterstützten Interaktionen und sind in diesem Requirements-CapabilityStatement als `SHALL`
gekennzeichnet. Suchparameter, Includes, Reverse-Includes und Operationen werden für den
VZD-spezifischen Anwendungsbereich ausgewiesen.
"""
* purpose = """
Dieses CapabilityStatement definiert die für EMIGA VZD vorgesehenen Server-Fähigkeiten.
Es dient als normative Grundlage für Implementierung und Imlementierungs-Leitfaden-Dokumentation.
"""
* rest[0].mode = #server

* rest[0].interaction[0].code = #transaction
* insert Expectation(rest[0].interaction[0], SHALL)
* rest[0].interaction[0].documentation = """
**Beispiel:**
`POST [base]`

Der Server unterstützt FHIR-Transaktionen auf Systemebene.
"""
* rest[0].interaction[1].code = #history-system
* insert Expectation(rest[0].interaction[1], MAY)
* rest[0].interaction[1].documentation = """
**Beispiel:**
`GET [base]/_history`

Der Server unterstützt die systemweite Historie.
"""

* rest[0].operation[0].name = "fetch-org-details"
* rest[0].operation[0].definition = "https://orgvz.ref.emiga-rki.de/fhir/OperationDefinition/-s-fetch-org-details"
* insert Expectation(rest[0].operation[0], MAY)
* rest[0].operation[1].name = "fetch-department-details-for-org"
* rest[0].operation[1].definition = "https://orgvz.ref.emiga-rki.de/fhir/OperationDefinition/-s-fetch-department-details-for-org"
* insert Expectation(rest[0].operation[1], MAY)
* rest[0].operation[2].name = "search-history"
* rest[0].operation[2].definition = "https://orgvz.ref.emiga-rki.de/fhir/OperationDefinition/-s-search-history"
* insert Expectation(rest[0].operation[2], MAY)
* rest[0].operation[3].name = "fetch-history-org-details"
* rest[0].operation[3].definition = "https://orgvz.ref.emiga-rki.de/fhir/OperationDefinition/-s-fetch-history-org-details"
* insert Expectation(rest[0].operation[3], MAY)
* rest[0].operation[4].name = "fetch-history-department-details"
* rest[0].operation[4].definition = "https://orgvz.ref.emiga-rki.de/fhir/OperationDefinition/-s-fetch-history-department-details"
* insert Expectation(rest[0].operation[4], MAY)
* rest[0].operation[5].name = "fetch-history"
* rest[0].operation[5].definition = "https://orgvz.ref.emiga-rki.de/fhir/OperationDefinition/-s-fetch-history"
* insert Expectation(rest[0].operation[5], MAY)

// =============================================================================
// Organization
// =============================================================================

* rest[0].resource[2].type = #Organization
* insert Expectation(rest[0].resource[2], SHALL)
* rest[0].resource[2].supportedProfile[1] = "https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaHospitalOrganization"
* insert Expectation(rest[0].resource[2].supportedProfile[0], SHALL)
* rest[0].resource[2].supportedProfile[2] = "https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaOrganization"
* insert Expectation(rest[0].resource[2].supportedProfile[1], SHALL)
* rest[0].resource[2].supportedProfile[3] = "https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaPublicHealthOrganization"
* insert Expectation(rest[0].resource[2].supportedProfile[2], SHALL)
* rest[0].resource[2].supportedProfile[0] = "https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaDepartmentOrganization"
* insert Expectation(rest[0].resource[2].supportedProfile[3], SHALL)

* rest[0].resource[2].interaction[0].code = #update
* insert Expectation(rest[0].resource[2].interaction[0], SHALL)
* rest[0].resource[2].interaction[0].documentation = """
Die REST-Interaktion `update` MUSS für `Organization` unterstützt werden.
**Beispiel:**
`PUT [base]/Organization/123`
"""
* rest[0].resource[2].interaction[1].code = #patch
* insert Expectation(rest[0].resource[2].interaction[1], SHALL)
* rest[0].resource[2].interaction[1].documentation = """
Die REST-Interaktion `patch` MUSS für `Organization` unterstützt werden.
**Beispiel:**
`PATCH [base]/Organization/123`
"""
* rest[0].resource[2].interaction[2].code = #search-type
* insert Expectation(rest[0].resource[2].interaction[2], SHALL)
* rest[0].resource[2].interaction[2].documentation = """
Die REST-Interaktion `search-type` MUSS für `Organization` unterstützt werden.
**Beispiel:**
`GET [base]/Organization?_id=123`
"""
* rest[0].resource[2].interaction[3].code = #vread
* insert Expectation(rest[0].resource[2].interaction[3], SHALL)
* rest[0].resource[2].interaction[3].documentation = """
Die REST-Interaktion `vread` MUSS für `Organization` unterstützt werden.
**Beispiel:**
`GET [base]/Organization/123/_history/1`
"""
* rest[0].resource[2].interaction[4].code = #read
* insert Expectation(rest[0].resource[2].interaction[4], SHALL)
* rest[0].resource[2].interaction[4].documentation = """
Die REST-Interaktion `read` MUSS für `Organization` unterstützt werden.
**Beispiel:**
`GET [base]/Organization/123`
"""
* rest[0].resource[2].interaction[5].code = #history-type
* insert Expectation(rest[0].resource[2].interaction[5], SHALL)
* rest[0].resource[2].interaction[5].documentation = """
Die REST-Interaktion `history-type` MUSS für `Organization` unterstützt werden.
**Beispiel:**
`GET [base]/Organization/_history`
"""
* rest[0].resource[2].interaction[6].code = #history-instance
* insert Expectation(rest[0].resource[2].interaction[6], SHALL)
* rest[0].resource[2].interaction[6].documentation = """
Die REST-Interaktion `history-instance` MUSS für `Organization` unterstützt werden.
**Beispiel:**
`GET [base]/Organization/123/_history`
"""
* rest[0].resource[2].interaction[7].code = #delete
* insert Expectation(rest[0].resource[2].interaction[7], SHALL)
* rest[0].resource[2].interaction[7].documentation = """
Die REST-Interaktion `delete` MUSS für `Organization` unterstützt werden.
**Beispiel:**
`DELETE [base]/Organization/123`
"""
* rest[0].resource[2].interaction[8].code = #create
* insert Expectation(rest[0].resource[2].interaction[8], SHALL)
* rest[0].resource[2].interaction[8].documentation = """
Die REST-Interaktion `create` MUSS für `Organization` unterstützt werden.
**Beispiel:**
`POST [base]/Organization`
"""
* rest[0].resource[2].versioning = #versioned-update
* rest[0].resource[2].searchParam[0].name = "identifier"
* rest[0].resource[2].searchParam[0].definition = "http://hl7.org/fhir/SearchParameter/Organization-identifier"
* rest[0].resource[2].searchParam[0].type = #token
* rest[0].resource[2].searchParam[0].documentation = """
**Beispiel:**
`GET [base]/Organization?identifier=https://example.org/fhir/sid/example|12345`

**Anwendungshinweis:**
Ein beliebiger Identifikator der Organisation (nicht der Identifikator der Akkreditierungsstelle)
"""
* insert Expectation(rest[0].resource[2].searchParam[0], SHALL)
* rest[0].resource[2].searchParam[1].name = "partof"
* rest[0].resource[2].searchParam[1].definition = "http://hl7.org/fhir/SearchParameter/Organization-partof"
* rest[0].resource[2].searchParam[1].type = #reference
* rest[0].resource[2].searchParam[1].documentation = """
**Beispiel:**
`GET [base]/Organization?partof=Organization/123`

**Anwendungshinweis:**
Eine Organisation, zu der diese Organisation gehört
"""
* insert Expectation(rest[0].resource[2].searchParam[1], SHALL)
* rest[0].resource[2].searchParam[2].name = "address"
* rest[0].resource[2].searchParam[2].definition = "http://hl7.org/fhir/SearchParameter/Organization-address"
* rest[0].resource[2].searchParam[2].type = #string
* rest[0].resource[2].searchParam[2].documentation = """
**Beispiel:**
`GET [base]/Organization?address=Berlin`

**Anwendungshinweis:**
Eine serverdefinierte Suche, die mit beliebigen Zeichenkettenfeldern der Adresse übereinstimmen kann, einschließlich line, city, district, state, country, postalCode und/oder text
"""
* insert Expectation(rest[0].resource[2].searchParam[2], MAY)
* rest[0].resource[2].searchParam[3].name = "address-state"
* rest[0].resource[2].searchParam[3].definition = "http://hl7.org/fhir/SearchParameter/Organization-address-state"
* rest[0].resource[2].searchParam[3].type = #string
* rest[0].resource[2].searchParam[3].documentation = """
**Beispiel:**
`GET [base]/Organization?address-state=Berlin`

**Anwendungshinweis:**
Ein in einer Adresse angegebenes Bundesland bzw. eine angegebene Region
"""
* insert Expectation(rest[0].resource[2].searchParam[3], SHALL)
* rest[0].resource[2].searchParam[4].name = "active"
* rest[0].resource[2].searchParam[4].definition = "http://hl7.org/fhir/SearchParameter/Organization-active"
* rest[0].resource[2].searchParam[4].type = #token
* rest[0].resource[2].searchParam[4].documentation = """
**Beispiel:**
`GET [base]/Organization?active=true`

**Anwendungshinweis:**
Gibt an, ob der Organisationseintrag aktiv ist
"""
* insert Expectation(rest[0].resource[2].searchParam[4], SHALL)
* rest[0].resource[2].searchParam[5].name = "type"
* rest[0].resource[2].searchParam[5].definition = "http://hl7.org/fhir/SearchParameter/Organization-type"
* rest[0].resource[2].searchParam[5].type = #token
* rest[0].resource[2].searchParam[5].documentation = """
**Beispiel:**
`GET [base]/Organization?type=<code>`

**Anwendungshinweis:**
Ein Code für die Art der Organisation
"""
* insert Expectation(rest[0].resource[2].searchParam[5], SHALL)
* rest[0].resource[2].searchParam[6].name = "address-postalcode"
* rest[0].resource[2].searchParam[6].definition = "http://hl7.org/fhir/SearchParameter/Organization-address-postalcode"
* rest[0].resource[2].searchParam[6].type = #string
* rest[0].resource[2].searchParam[6].documentation = """
**Beispiel:**
`GET [base]/Organization?address-postalcode=10115`

**Anwendungshinweis:**
Eine in einer Adresse angegebene Postleitzahl
"""
* insert Expectation(rest[0].resource[2].searchParam[6], MAY)
* rest[0].resource[2].searchParam[7].name = "address-country"
* rest[0].resource[2].searchParam[7].definition = "http://hl7.org/fhir/SearchParameter/Organization-address-country"
* rest[0].resource[2].searchParam[7].type = #string
* rest[0].resource[2].searchParam[7].documentation = """
**Beispiel:**
`GET [base]/Organization?address-country=DE`

**Anwendungshinweis:**
Ein in einer Adresse angegebenes Land
"""
* insert Expectation(rest[0].resource[2].searchParam[7], MAY)
* rest[0].resource[2].searchParam[8].name = "phonetic"
* rest[0].resource[2].searchParam[8].definition = "http://hl7.org/fhir/SearchParameter/Organization-phonetic"
* rest[0].resource[2].searchParam[8].type = #string
* rest[0].resource[2].searchParam[8].documentation = """
**Beispiel:**
`GET [base]/Organization?phonetic=Mustermann`

**Anwendungshinweis:**
Ein Teil des Organisationsnamens unter Verwendung eines phonetischen Abgleichverfahrens
"""
* insert Expectation(rest[0].resource[2].searchParam[8], MAY)
* rest[0].resource[2].searchParam[9].name = "address-use"
* rest[0].resource[2].searchParam[9].definition = "http://hl7.org/fhir/SearchParameter/Organization-address-use"
* rest[0].resource[2].searchParam[9].type = #token
* rest[0].resource[2].searchParam[10].documentation = """
**Beispiel:**
`GET [base]/Organization?address-use=work`

**Anwendungshinweis:**
Ein in einer Adresse angegebener Verwendungscode
"""
* insert Expectation(rest[0].resource[2].searchParam[9], SHALL)
* rest[0].resource[2].searchParam[11].name = "name"
* rest[0].resource[2].searchParam[11].definition = "http://hl7.org/fhir/SearchParameter/Organization-name"
* rest[0].resource[2].searchParam[11].type = #string
* rest[0].resource[2].searchParam[11].documentation = """
**Beispiel:**
`GET [base]/Organization?name=Gesundheitsamt`

**Anwendungshinweis:**
Ein Teil des Namens oder Alias der Organisation
"""
* insert Expectation(rest[0].resource[2].searchParam[10], SHALL)
* rest[0].resource[2].searchParam[12].name = "_id"
* rest[0].resource[2].searchParam[12].definition = "http://hl7.org/fhir/SearchParameter/Resource-id"
* rest[0].resource[2].searchParam[12].type = #token
* rest[0].resource[2].searchParam[12].documentation = """
**Beispiel:**
`GET [base]/Organization?_id=123`

**Anwendungshinweis:**
Logische ID dieses Artefakts
"""
* insert Expectation(rest[0].resource[2].searchParam[11], SHALL)
* rest[0].resource[2].searchParam[13].name = "address-city"
* rest[0].resource[2].searchParam[13].definition = "http://hl7.org/fhir/SearchParameter/Organization-address-city"
* rest[0].resource[2].searchParam[13].type = #string
* rest[0].resource[2].searchParam[13].documentation = """
**Beispiel:**
`GET [base]/Organization?address-city=Berlin`

**Anwendungshinweis:**
Eine in einer Adresse angegebene Stadt
"""
* insert Expectation(rest[0].resource[2].searchParam[13], MAY)
* rest[0].resource[2].searchInclude[0] = "*"
* insert Expectation(rest[0].resource[2].searchInclude[0], MAY)
* rest[0].resource[2].searchInclude[1] = "Organization:endpoint"
* insert Expectation(rest[0].resource[2].searchInclude[1], MAY)
* rest[0].resource[2].searchInclude[2] = "Organization:partof"
* insert Expectation(rest[0].resource[2].searchInclude[2], SHALL)
* rest[0].resource[2].searchRevInclude[0] = "HealthcareService:organization"
* insert Expectation(rest[0].resource[2].searchRevInclude[0], MAY)
* rest[0].resource[2].searchRevInclude[1] = "Location:organization"
* insert Expectation(rest[0].resource[2].searchRevInclude[1], MAY)
* rest[0].resource[2].searchRevInclude[2] = "Organization:partof"
* insert Expectation(rest[0].resource[2].searchRevInclude[2], MAY)
* rest[0].resource[2].searchRevInclude[3] = "PractitionerRole:organization"
* insert Expectation(rest[0].resource[2].searchRevInclude[3], MAY)

* rest[0].resource[2].operation[0].name = "set-active-flag"
* rest[0].resource[2].operation[0].definition = "https://orgvz.ref.emiga-rki.de/fhir/OperationDefinition/Organization-i-set-active-flag"
* rest[0].resource[2].operation[0].documentation = """
Die Operation `$set-active-flag` wird von der Referenzimplementierung für `Organization` unterstützt.
"""
* insert Expectation(rest[0].resource[2].operation[0], MAY)
* rest[0].resource[2].operation[1].name = "duplicate-check"
* rest[0].resource[2].operation[1].definition = "https://orgvz.ref.emiga-rki.de/fhir/OperationDefinition/Organization-t-duplicate-check"
* rest[0].resource[2].operation[1].documentation = """
Die Operation `$duplicate-check` wird von der Referenzimplementierung für `Organization` unterstützt.
"""
* insert Expectation(rest[0].resource[2].operation[1], MAY)
* rest[0].resource[2].operation[2].name = "validate"
* rest[0].resource[2].operation[2].definition = "https://orgvz.ref.emiga-rki.de/fhir/OperationDefinition/Multi-it-validate"
* rest[0].resource[2].operation[2].documentation = """
Die Operation `$validate` wird von der Referenzimplementierung für `Organization` unterstützt.
"""
* insert Expectation(rest[0].resource[2].operation[2], MAY)

// =============================================================================
// Location
// =============================================================================
* rest[0].resource[1].type = #Location
* insert Expectation(rest[0].resource[1], SHALL)
* rest[0].resource[1].supportedProfile[0] = "https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaHospitalFacilityLocation"
* insert Expectation(rest[0].resource[1].supportedProfile[0], SHALL)
* rest[0].resource[1].supportedProfile[1] = "https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaHospitalLocation"
* insert Expectation(rest[0].resource[1].supportedProfile[1], SHALL)
* rest[0].resource[1].supportedProfile[2] = "https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaHospitalRoomLocation"
* insert Expectation(rest[0].resource[1].supportedProfile[2], SHALL)
* rest[0].resource[1].supportedProfile[3] = "https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaLocation"
* insert Expectation(rest[0].resource[1].supportedProfile[3], SHALL)
* rest[0].resource[1].supportedProfile[4] = "https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaPublicHealthLocation"
* insert Expectation(rest[0].resource[1].supportedProfile[4], SHALL)
* rest[0].resource[1].interaction[0].code = #search-type

* insert Expectation(rest[0].resource[1].interaction[0], SHALL)
* rest[0].resource[1].interaction[0].documentation = """
Die REST-Interaktion `search-type` MUSS für `Location` unterstützt werden.
**Beispiel:**
`GET [base]/Location?_id=123`
"""
* rest[0].resource[1].interaction[1].code = #update
* insert Expectation(rest[0].resource[1].interaction[1], SHALL)
* rest[0].resource[1].interaction[1].documentation = """
Die REST-Interaktion `update` MUSS für `Location` unterstützt werden.
**Beispiel:**
`PUT [base]/Location/123`
"""
* rest[0].resource[1].interaction[2].code = #vread
* insert Expectation(rest[0].resource[1].interaction[2], SHALL)
* rest[0].resource[1].interaction[2].documentation = """
Die REST-Interaktion `vread` MUSS für `Location` unterstützt werden.
**Beispiel:**
`GET [base]/Location/123/_history/1`
"""
* rest[0].resource[1].interaction[3].code = #read
* insert Expectation(rest[0].resource[1].interaction[3], SHALL)
* rest[0].resource[1].interaction[3].documentation = """
Die REST-Interaktion `read` MUSS für `Location` unterstützt werden.
**Beispiel:**
`GET [base]/Location/123`
"""
* rest[0].resource[1].interaction[4].code = #patch
* insert Expectation(rest[0].resource[1].interaction[4], SHALL)
* rest[0].resource[1].interaction[4].documentation = """
Die REST-Interaktion `patch` MUSS für `Location` unterstützt werden.
**Beispiel:**
`PATCH [base]/Location/123`
"""
* rest[0].resource[1].interaction[5].code = #history-type
* insert Expectation(rest[0].resource[1].interaction[5], SHALL)
* rest[0].resource[1].interaction[5].documentation = """
Die REST-Interaktion `history-type` MUSS für `Location` unterstützt werden.
**Beispiel:**
`GET [base]/Location/_history`
"""
* rest[0].resource[1].interaction[6].code = #history-instance
* insert Expectation(rest[0].resource[1].interaction[6], SHALL)
* rest[0].resource[1].interaction[6].documentation = """
Die REST-Interaktion `history-instance` MUSS für `Location` unterstützt werden.
**Beispiel:**
`GET [base]/Location/123/_history`
"""
* rest[0].resource[1].interaction[7].code = #delete
* insert Expectation(rest[0].resource[1].interaction[7], SHALL)
* rest[0].resource[1].interaction[7].documentation = """
Die REST-Interaktion `delete` MUSS für `Location` unterstützt werden.
**Beispiel:**
`DELETE [base]/Location/123`
"""
* rest[0].resource[1].interaction[8].code = #create
* insert Expectation(rest[0].resource[1].interaction[8], SHALL)
* rest[0].resource[1].interaction[8].documentation = """
Die REST-Interaktion `create` MUSS für `Location` unterstützt werden.
**Beispiel:**
`POST [base]/Location`
"""
* rest[0].resource[1].versioning = #versioned-update
* rest[0].resource[1].searchParam[0].name = "identifier"
* rest[0].resource[1].searchParam[0].definition = "http://hl7.org/fhir/SearchParameter/Location-identifier"
* rest[0].resource[1].searchParam[0].type = #token
* rest[0].resource[1].searchParam[0].documentation = """
**Beispiel:**
`GET [base]/Location?identifier=https://emiga.rki.de/fhir/sid/EmigaFileNumber|[Standort][1.][2026]-[87654321]`

**Anwendungshinweis:**
Ein Identifikator für den Standort
"""
* insert Expectation(rest[0].resource[1].searchParam[0], SHALL)
* rest[0].resource[1].searchParam[1].name = "partof"
* rest[0].resource[1].searchParam[1].definition = "http://hl7.org/fhir/SearchParameter/Location-partof"
* rest[0].resource[1].searchParam[1].type = #reference
* rest[0].resource[1].searchParam[1].documentation = """
**Beispiel:**
`GET [base]/Location?partof=Location/123`

**Anwendungshinweis:**
Ein Standort, zu dem dieser Standort gehört
"""
* insert Expectation(rest[0].resource[1].searchParam[1], SHALL)
* rest[0].resource[1].searchParam[2].name = "address"
* rest[0].resource[1].searchParam[2].definition = "http://hl7.org/fhir/SearchParameter/Location-address"
* rest[0].resource[1].searchParam[2].type = #string
* rest[0].resource[1].searchParam[2].documentation = """
**Beispiel:**
`GET [base]/Location?address=Berlin`

**Anwendungshinweis:**
Die Adresse oder ein Teil der Adresse des Standorts
"""
* insert Expectation(rest[0].resource[1].searchParam[2], MAY)
* rest[0].resource[1].searchParam[3].name = "address-state"
* rest[0].resource[1].searchParam[3].definition = "http://hl7.org/fhir/SearchParameter/Location-address-state"
* rest[0].resource[1].searchParam[3].type = #string
* rest[0].resource[1].searchParam[3].documentation = """
**Beispiel:**
`GET [base]/Location?address-state=Berlin`

**Anwendungshinweis:**
Ein in einer Adresse angegebenes Bundesland bzw. eine angegebene Region
"""
* insert Expectation(rest[0].resource[1].searchParam[3], MAY)
* rest[0].resource[1].searchParam[4].name = "operational-status"
* rest[0].resource[1].searchParam[4].definition = "http://hl7.org/fhir/SearchParameter/Location-operational-status"
* rest[0].resource[1].searchParam[4].type = #token
* rest[0].resource[1].searchParam[4].documentation = """
**Beispiel:**
`GET [base]/Location?operational-status=<code>`

**Anwendungshinweis:**
Es wird im Profile 'EmigaHospitalRoomLocation' verwendet. Sucht nach Standorten (typischerweise Bett/Zimmer), die einen Betriebsstatus aufweisen (z. B. kontaminiert, Reinigung)
"""
* insert Expectation(rest[0].resource[1].searchParam[4], SHALL)
* rest[0].resource[1].searchParam[5].name = "type"
* rest[0].resource[1].searchParam[5].definition = "http://hl7.org/fhir/SearchParameter/Location-type"
* rest[0].resource[1].searchParam[5].type = #token
* rest[0].resource[1].searchParam[5].documentation = """
**Beispiel:**
`GET [base]/Location?type=<code>`

**Anwendungshinweis:**
Ein Code für die Art des Standorts
"""
* insert Expectation(rest[0].resource[1].searchParam[5], SHALL)
* rest[0].resource[1].searchParam[6].name = "address-postalcode"
* rest[0].resource[1].searchParam[6].definition = "http://hl7.org/fhir/SearchParameter/Location-address-postalcode"
* rest[0].resource[1].searchParam[6].type = #string
* rest[0].resource[1].searchParam[6].documentation = """
**Beispiel:**
`GET [base]/Location?address-postalcode=10115`

**Anwendungshinweis:**
Eine in einer Adresse angegebene Postleitzahl
"""
* insert Expectation(rest[0].resource[1].searchParam[6], SHALL)
* rest[0].resource[1].searchParam[7].name = "address-country"
* rest[0].resource[1].searchParam[7].definition = "http://hl7.org/fhir/SearchParameter/Location-address-country"
* rest[0].resource[1].searchParam[7].type = #string
* rest[0].resource[1].searchParam[7].documentation = """
**Beispiel:**
`GET [base]/Location?address-country=DE`

**Anwendungshinweis:**
Ein in einer Adresse angegebenes Land
"""

* insert Expectation(rest[0].resource[1].searchParam[7], MAY)
* rest[0].resource[1].searchParam[8].name = "organization"
* rest[0].resource[1].searchParam[8].definition = "http://hl7.org/fhir/SearchParameter/Location-organization"
* rest[0].resource[1].searchParam[8].type = #reference
* rest[0].resource[1].searchParam[8].documentation = """
**Beispiel:**
`GET [base]/Location?organization=Organization/123`

**Anwendungshinweis:**
Sucht nach Standorten, die von der angegebenen Organisation verwaltet werden
"""
* insert Expectation(rest[0].resource[1].searchParam[8], MAY)
* rest[0].resource[1].searchParam[9].name = "address-use"
* rest[0].resource[1].searchParam[9].definition = "http://hl7.org/fhir/SearchParameter/Location-address-use"
* rest[0].resource[1].searchParam[9].type = #token
* rest[0].resource[1].searchParam[10].documentation = """
**Beispiel:**
`GET [base]/Location?address-use=work`

**Anwendungshinweis:**
Ein in einer Adresse angegebener Verwendungscode
"""
* insert Expectation(rest[0].resource[1].searchParam[10], SHALL)
* rest[0].resource[1].searchParam[11].name = "name"
* rest[0].resource[1].searchParam[11].definition = "http://hl7.org/fhir/SearchParameter/Location-name"
* rest[0].resource[1].searchParam[11].type = #string
* rest[0].resource[1].searchParam[11].documentation = """
**Beispiel:**
`GET [base]/Location?name=Gesundheitsamt`

**Anwendungshinweis:**
Ein Teil des Namens oder Alias des Standorts
"""
* insert Expectation(rest[0].resource[1].searchParam[11], SHALL)
* rest[0].resource[1].searchParam[12].name = "_id"
* rest[0].resource[1].searchParam[12].definition = "http://hl7.org/fhir/SearchParameter/Resource-id"
* rest[0].resource[1].searchParam[12].type = #token
* rest[0].resource[1].searchParam[12].documentation = """
**Beispiel:**
`GET [base]/Location?_id=123`

**Anwendungshinweis:**
Logische ID dieses Artefakts
"""
* insert Expectation(rest[0].resource[1].searchParam[12], MAY)
* rest[0].resource[1].searchParam[13].name = "near"
* rest[0].resource[1].searchParam[13].definition = "http://hl7.org/fhir/SearchParameter/Location-near"
* rest[0].resource[1].searchParam[13].type = #special
* rest[0].resource[1].searchParam[13].documentation = """
**Beispiel:**
`GET [base]/Location?near=52.5200|13.4050|5|km`

**Anwendungshinweis:**
Sucht nach Standorten, deren location.position sich in der Nähe der angegebenen Koordinaten oder innerhalb einer angegebenen Entfernung davon befindet. Die Koordinaten werden als [Breitengrad]|[Längengrad]|[Entfernung]|[Einheit] angegeben (unter Verwendung des WGS84-Bezugssystems, siehe Hinweise).
Wenn die Einheit weggelassen wird, ist von Kilometern auszugehen. Wenn die Entfernung weggelassen wird, kann der Server nach eigenem Ermessen festlegen, welche Entfernungen als „in der Nähe“ gelten; die Einheit ist in diesem Fall nicht relevant.

Server können unterschiedliche Suchverfahren verwenden, deren Genauigkeit abhängig von der jeweiligen Implementierung variieren kann.

Erfordert zusätzlich die Angabe des Parameters near-distance
"""
* insert Expectation(rest[0].resource[1].searchParam[13], SHALL)
* rest[0].resource[1].searchParam[14].name = "address-city"
* rest[0].resource[1].searchParam[14].definition = "http://hl7.org/fhir/SearchParameter/Location-address-city"
* rest[0].resource[1].searchParam[14].type = #string
* rest[0].resource[1].searchParam[14].documentation = """
**Beispiel:**
`GET [base]/Location?address-city=Berlin`

**Anwendungshinweis:**
Eine in einer Adresse angegebene Stadt
"""
* insert Expectation(rest[0].resource[1].searchParam[14], MAY)
* rest[0].resource[1].searchParam[15].name = "status"
* rest[0].resource[1].searchParam[15].definition = "http://hl7.org/fhir/SearchParameter/Location-status"
* rest[0].resource[1].searchParam[15].type = #token
* rest[0].resource[1].searchParam[15].documentation = """
**Beispiel:**
`GET [base]/Location?status=active`

**Anwendungshinweis:**
Sucht nach Standorten mit einem bestimmten Status
"""
* insert Expectation(rest[0].resource[1].searchParam[15], SHALL)
* rest[0].resource[1].searchInclude[0] = "*"
* insert Expectation(rest[0].resource[1].searchInclude[0], MAY)
* rest[0].resource[1].searchInclude[1] = "Location:organization"
* insert Expectation(rest[0].resource[1].searchInclude[1], SHALL)
* rest[0].resource[1].searchInclude[2] = "Location:partof"
* insert Expectation(rest[0].resource[1].searchInclude[2], SHALL)
* rest[0].resource[1].searchRevInclude[0] = "HealthcareService:coverage-area"
* insert Expectation(rest[0].resource[1].searchRevInclude[0], MAY)
* rest[0].resource[1].searchRevInclude[1] = "HealthcareService:location"
* insert Expectation(rest[0].resource[1].searchRevInclude[1], MAY)
* rest[0].resource[1].searchRevInclude[2] = "Location:partof"
* insert Expectation(rest[0].resource[1].searchRevInclude[2], MAY)
* rest[0].resource[1].searchRevInclude[3] = "PractitionerRole:location"
* insert Expectation(rest[0].resource[1].searchRevInclude[3], MAY)
* rest[0].resource[1].operation[0].name = "validate"
* rest[0].resource[1].operation[0].definition = "https://orgvz.ref.emiga-rki.de/fhir/OperationDefinition/Multi-it-validate"
* rest[0].resource[1].operation[0].documentation = """
Die Operation `$validate` wird von der Referenzimplementierung für `Location` unterstützt.
"""
* insert Expectation(rest[0].resource[1].operation[0], MAY)

// =============================================================================
// Practitioner
// =============================================================================
* rest[0].resource[3].type = #Practitioner
* insert Expectation(rest[0].resource[3], SHALL)
* rest[0].resource[3].supportedProfile[0] = "https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaPractitioner"
* insert Expectation(rest[0].resource[3].supportedProfile[0], SHALL)
* rest[0].resource[3].interaction[0].code = #search-type
* insert Expectation(rest[0].resource[3].interaction[0], SHALL)
* rest[0].resource[3].interaction[0].documentation = """
Die REST-Interaktion `search-type` MUSS für `Practitioner` unterstützt werden.
**Beispiel:**
`GET [base]/Practitioner?_id=123`
"""
* rest[0].resource[3].interaction[1].code = #update
* insert Expectation(rest[0].resource[3].interaction[1], SHALL)
* rest[0].resource[3].interaction[1].documentation = """
Die REST-Interaktion `update` MUSS für `Practitioner` unterstützt werden.
**Beispiel:**
`PUT [base]/Practitioner/123`
"""
* rest[0].resource[3].interaction[2].code = #vread
* insert Expectation(rest[0].resource[3].interaction[2], SHALL)
* rest[0].resource[3].interaction[2].documentation = """
Die REST-Interaktion `vread` MUSS für `Practitioner` unterstützt werden.
**Beispiel:**
`GET [base]/Practitioner/123/_history/1`
"""
* rest[0].resource[3].interaction[3].code = #read
* insert Expectation(rest[0].resource[3].interaction[3], SHALL)
* rest[0].resource[3].interaction[3].documentation = """
Die REST-Interaktion `read` MUSS für `Practitioner` unterstützt werden.
**Beispiel:**
`GET [base]/Practitioner/123`
"""
* rest[0].resource[3].interaction[4].code = #patch
* insert Expectation(rest[0].resource[3].interaction[4], SHALL)
* rest[0].resource[3].interaction[4].documentation = """
Die REST-Interaktion `patch` MUSS für `Practitioner` unterstützt werden.
**Beispiel:**
`PATCH [base]/Practitioner/123`
"""
* rest[0].resource[3].interaction[5].code = #history-type
* insert Expectation(rest[0].resource[3].interaction[5], SHALL)
* rest[0].resource[3].interaction[5].documentation = """
Die REST-Interaktion `history-type` MUSS für `Practitioner` unterstützt werden.
**Beispiel:**
`GET [base]/Practitioner/_history`
"""
* rest[0].resource[3].interaction[6].code = #history-instance
* insert Expectation(rest[0].resource[3].interaction[6], SHALL)
* rest[0].resource[3].interaction[6].documentation = """
Die REST-Interaktion `history-instance` MUSS für `Practitioner` unterstützt werden.
**Beispiel:**
`GET [base]/Practitioner/123/_history`
"""
* rest[0].resource[3].interaction[7].code = #delete
* insert Expectation(rest[0].resource[3].interaction[7], SHALL)
* rest[0].resource[3].interaction[7].documentation = """
Die REST-Interaktion `delete` MUSS für `Practitioner` unterstützt werden.
**Beispiel:**
`DELETE [base]/Practitioner/123`
"""
* rest[0].resource[3].interaction[8].code = #create
* insert Expectation(rest[0].resource[3].interaction[8], SHALL)
* rest[0].resource[3].interaction[8].documentation = """
Die REST-Interaktion `create` MUSS für `Practitioner` unterstützt werden.
**Beispiel:**
`POST [base]/Practitioner`
"""
* rest[0].resource[3].versioning = #versioned-update


* insert Expectation(rest[0].resource[3].searchParam[0], MAY)
* rest[0].resource[3].searchParam[3].name = "phonetic"
* rest[0].resource[3].searchParam[3].definition = "http://hl7.org/fhir/SearchParameter/individual-phonetic"
* rest[0].resource[3].searchParam[3].type = #string
* rest[0].resource[3].searchParam[3].documentation = """
**Beispiel:**
`GET [base]/Practitioner?phonetic=Mustermann`

**Anwendungshinweis:**
Mehrere Ressourcen: 

* [Patient](patient.html): Ein Teil des Familien- oder Vornamens unter Verwendung eines phonetischen Abgleichverfahrens
* [Person](person.html): Ein Teil des Namens unter Verwendung eines phonetischen Abgleichverfahrens
* [Practitioner](practitioner.html): Ein Teil des Familien- oder Vornamens unter Verwendung eines phonetischen Abgleichverfahrens
* [RelatedPerson](relatedperson.html): Ein Teil des Namens unter Verwendung eines phonetischen Abgleichverfahrens
"""
* insert Expectation(rest[0].resource[3].searchParam[1], SHALL)
* rest[0].resource[3].searchParam[4].name = "telecom"
* rest[0].resource[3].searchParam[4].definition = "http://hl7.org/fhir/SearchParameter/individual-telecom"
* rest[0].resource[3].searchParam[4].type = #token
* rest[0].resource[3].searchParam[4].documentation = """
**Beispiel:**
`GET [base]/Practitioner?telecom=info@example.org`

**Anwendungshinweis:**
Mehrere Ressourcen: 

* [Patient](patient.html): Der Wert in beliebigen Telekommunikations-Kontaktdaten des Patienten
* [Person](person.html): Der Wert in beliebigen Kontaktdaten
* [Practitioner](practitioner.html): Der Wert in beliebigen Kontaktdaten
* [PractitionerRole](practitionerrole.html): Der Wert in beliebigen Kontaktdaten
* [RelatedPerson](relatedperson.html): Der Wert in beliebigen Kontaktdaten
"""

* insert Expectation(rest[0].resource[3].searchParam[2], SHALL)
* rest[0].resource[3].searchParam[7].name = "email"
* rest[0].resource[3].searchParam[7].definition = "http://hl7.org/fhir/SearchParameter/individual-email"
* rest[0].resource[3].searchParam[7].type = #token
* rest[0].resource[3].searchParam[7].documentation = """
**Beispiel:**
`GET [base]/Practitioner?email=info@example.org`

**Anwendungshinweis:**
Mehrere Ressourcen: 

* [Patient](patient.html): Ein Wert in einem E-Mail-Kontakt
* [Person](person.html): Ein Wert in einem E-Mail-Kontakt
* [Practitioner](practitioner.html): Ein Wert in einem E-Mail-Kontakt
* [PractitionerRole](practitionerrole.html): Ein Wert in einem E-Mail-Kontakt
* [RelatedPerson](relatedperson.html): Ein Wert in einem E-Mail-Kontakt
"""
* insert Expectation(rest[0].resource[3].searchParam[3], SHALL)
* rest[0].resource[3].searchParam[8].name = "given"
* rest[0].resource[3].searchParam[8].definition = "http://hl7.org/fhir/SearchParameter/individual-given"
* rest[0].resource[3].searchParam[8].type = #string
* rest[0].resource[3].searchParam[8].documentation = """
**Beispiel:**
`GET [base]/Practitioner?given=Erika`

**Anwendungshinweis:**
Mehrere Ressourcen: 

* [Patient](patient.html): Ein Teil des Vornamens des Patienten
* [Practitioner](practitioner.html): Ein Teil des Vornamens
"""

* insert Expectation(rest[0].resource[3].searchParam[4], SHALL)
* rest[0].resource[3].searchParam[11].name = "active"
* rest[0].resource[3].searchParam[11].definition = "http://hl7.org/fhir/SearchParameter/Practitioner-active"
* rest[0].resource[3].searchParam[11].type = #token
* rest[0].resource[3].searchParam[11].documentation = """
**Beispiel:**
`GET [base]/Practitioner?active=true`

**Anwendungshinweis:**
Gibt an, ob der Practitioner-Eintrag aktiv ist
"""

* insert Expectation(rest[0].resource[3].searchParam[5], SHALL)
* rest[0].resource[3].searchParam[13].name = "phone"
* rest[0].resource[3].searchParam[13].definition = "http://hl7.org/fhir/SearchParameter/individual-phone"
* rest[0].resource[3].searchParam[13].type = #token
* rest[0].resource[3].searchParam[13].documentation = """
**Beispiel:**
`GET [base]/Practitioner?phone=+49-30-123456`

**Anwendungshinweis:**
Mehrere Ressourcen: 

* [Patient](patient.html): Ein Wert in einem Telefonkontakt
* [Person](person.html): Ein Wert in einem Telefonkontakt
* [Practitioner](practitioner.html): Ein Wert in einem Telefonkontakt
* [PractitionerRole](practitionerrole.html): Ein Wert in einem Telefonkontakt
* [RelatedPerson](relatedperson.html): Ein Wert in einem Telefonkontakt
"""

* insert Expectation(rest[0].resource[3].searchParam[6], SHALL)
* rest[0].resource[3].searchParam[15].name = "name"
* rest[0].resource[3].searchParam[15].definition = "http://hl7.org/fhir/SearchParameter/Practitioner-name"
* rest[0].resource[3].searchParam[15].type = #string
* rest[0].resource[3].searchParam[15].documentation = """
**Beispiel:**
`GET [base]/Practitioner?name=Gesundheitsamt`

**Anwendungshinweis:**
Eine serverdefinierte Suche, die mit beliebigen Zeichenkettenfeldern von HumanName übereinstimmen kann, einschließlich family, given, prefix, suffix und/oder text
"""
* insert Expectation(rest[0].resource[3].searchParam[7], SHALL)
* rest[0].resource[3].searchParam[16].name = "_id"
* rest[0].resource[3].searchParam[16].definition = "http://hl7.org/fhir/SearchParameter/Resource-id"
* rest[0].resource[3].searchParam[16].type = #token
* rest[0].resource[3].searchParam[16].documentation = """
**Beispiel:**
`GET [base]/Practitioner?_id=123`

**Anwendungshinweis:**
Logische ID dieses Artefakts
"""
* insert Expectation(rest[0].resource[3].searchParam[8], SHALL)
* rest[0].resource[3].searchParam[17].name = "family"
* rest[0].resource[3].searchParam[17].definition = "http://hl7.org/fhir/SearchParameter/individual-family"
* rest[0].resource[3].searchParam[17].type = #string
* rest[0].resource[3].searchParam[17].documentation = """
**Beispiel:**
`GET [base]/Practitioner?family=Mustermann`

**Anwendungshinweis:**
Mehrere Ressourcen: 

* [Patient](patient.html): Ein Teil des Familiennamens des Patienten
* [Practitioner](practitioner.html): Ein Teil des Familiennamens
"""
* insert Expectation(rest[0].resource[3].searchParam[9], SHALL)
* rest[0].resource[3].searchInclude[0] = "*"
* insert Expectation(rest[0].resource[3].searchInclude[0], MAY)
* rest[0].resource[3].searchRevInclude[0] = "PractitionerRole:practitioner"
* insert Expectation(rest[0].resource[3].searchRevInclude[0], MAY)
* rest[0].resource[3].operation[0].name = "validate"
* rest[0].resource[3].operation[0].definition = "https://orgvz.ref.emiga-rki.de/fhir/OperationDefinition/Multi-it-validate"
* rest[0].resource[3].operation[0].documentation = """
Die Operation `$validate` wird von der Referenzimplementierung für `Practitioner` unterstützt.
"""
* insert Expectation(rest[0].resource[3].operation[0], MAY)

// =============================================================================
// PractitionerRole
// =============================================================================
* rest[0].resource[4].type = #PractitionerRole
* insert Expectation(rest[0].resource[4], SHALL)
* rest[0].resource[4].supportedProfile[0] = "https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaPractitionerRole"
* insert Expectation(rest[0].resource[4].supportedProfile[0], SHALL)
* rest[0].resource[4].interaction[0].code = #search-type
* insert Expectation(rest[0].resource[4].interaction[0], SHALL)
* rest[0].resource[4].interaction[0].documentation = """
Die REST-Interaktion `search-type` MUSS für `PractitionerRole` unterstützt werden.
**Beispiel:**
`GET [base]/PractitionerRole?_id=123`
"""
* rest[0].resource[4].interaction[1].code = #update
* insert Expectation(rest[0].resource[4].interaction[1], SHALL)
* rest[0].resource[4].interaction[1].documentation = """
Die REST-Interaktion `update` MUSS für `PractitionerRole` unterstützt werden.
**Beispiel:**
`PUT [base]/PractitionerRole/123`
"""
* rest[0].resource[4].interaction[2].code = #vread
* insert Expectation(rest[0].resource[4].interaction[2], SHALL)
* rest[0].resource[4].interaction[2].documentation = """
Die REST-Interaktion `vread` MUSS für `PractitionerRole` unterstützt werden.
**Beispiel:**
`GET [base]/PractitionerRole/123/_history/1`
"""
* rest[0].resource[4].interaction[3].code = #read
* insert Expectation(rest[0].resource[4].interaction[3], SHALL)
* rest[0].resource[4].interaction[3].documentation = """
Die REST-Interaktion `read` MUSS für `PractitionerRole` unterstützt werden.
**Beispiel:**
`GET [base]/PractitionerRole/123`
"""
* rest[0].resource[4].interaction[4].code = #patch
* insert Expectation(rest[0].resource[4].interaction[4], SHALL)
* rest[0].resource[4].interaction[4].documentation = """
Die REST-Interaktion `patch` MUSS für `PractitionerRole` unterstützt werden.
**Beispiel:**
`PATCH [base]/PractitionerRole/123`
"""
* rest[0].resource[4].interaction[5].code = #history-type
* insert Expectation(rest[0].resource[4].interaction[5], SHALL)
* rest[0].resource[4].interaction[5].documentation = """
Die REST-Interaktion `history-type` MUSS für `PractitionerRole` unterstützt werden.
**Beispiel:**
`GET [base]/PractitionerRole/_history`
"""
* rest[0].resource[4].interaction[6].code = #history-instance
* insert Expectation(rest[0].resource[4].interaction[6], SHALL)
* rest[0].resource[4].interaction[6].documentation = """
Die REST-Interaktion `history-instance` MUSS für `PractitionerRole` unterstützt werden.
**Beispiel:**
`GET [base]/PractitionerRole/123/_history`
"""
* rest[0].resource[4].interaction[7].code = #delete
* insert Expectation(rest[0].resource[4].interaction[7], SHALL)
* rest[0].resource[4].interaction[7].documentation = """
Die REST-Interaktion `delete` MUSS für `PractitionerRole` unterstützt werden.
**Beispiel:**
`DELETE [base]/PractitionerRole/123`
"""
* rest[0].resource[4].interaction[8].code = #create
* insert Expectation(rest[0].resource[4].interaction[8], SHALL)
* rest[0].resource[4].interaction[8].documentation = """
Die REST-Interaktion `create` MUSS für `PractitionerRole` unterstützt werden.
**Beispiel:**
`POST [base]/PractitionerRole`
"""
* rest[0].resource[4].versioning = #versioned-update
* rest[0].resource[4].searchParam[0].name = "date"
* rest[0].resource[4].searchParam[0].definition = "http://hl7.org/fhir/SearchParameter/PractitionerRole-date"
* rest[0].resource[4].searchParam[0].type = #date
* rest[0].resource[4].searchParam[0].documentation = """
**Beispiel:**
`GET [base]/PractitionerRole?date=2026-09-16`

**Anwendungshinweis:**
Der Zeitraum, in dem die tätige Person berechtigt ist, diese Rolle bzw. Rollen auszuüben
"""

* insert Expectation(rest[0].resource[4].searchParam[0], SHALL)
* rest[0].resource[4].searchParam[3].name = "role"
* rest[0].resource[4].searchParam[3].definition = "http://hl7.org/fhir/SearchParameter/PractitionerRole-role"
* rest[0].resource[4].searchParam[3].type = #token
* rest[0].resource[4].searchParam[3].documentation = """
**Beispiel:**
`GET [base]/PractitionerRole?role=<code>`

**Anwendungshinweis:**
Die tätige Person kann diese Rolle für die Organisation ausüben
"""
* insert Expectation(rest[0].resource[4].searchParam[1], SHALL)
* rest[0].resource[4].searchParam[4].name = "practitioner"
* rest[0].resource[4].searchParam[4].definition = "http://hl7.org/fhir/SearchParameter/PractitionerRole-practitioner"
* rest[0].resource[4].searchParam[4].type = #reference
* rest[0].resource[4].searchParam[4].documentation = """
**Beispiel:**
`GET [base]/PractitionerRole?practitioner=Practitioner/123`

**Anwendungshinweis:**
Eine tätige Person, die die definierten Leistungen für die Organisation erbringen kann
"""
* insert Expectation(rest[0].resource[4].searchParam[2], SHALL)
* rest[0].resource[4].searchParam[5].name = "active"
* rest[0].resource[4].searchParam[5].definition = "http://hl7.org/fhir/SearchParameter/PractitionerRole-active"
* rest[0].resource[4].searchParam[5].type = #token
* rest[0].resource[4].searchParam[5].documentation = """
**Beispiel:**
`GET [base]/PractitionerRole?active=true`

**Anwendungshinweis:**
Gibt an, ob dieser PractitionerRole-Eintrag aktiv verwendet wird
"""

* insert Expectation(rest[0].resource[4].searchParam[3], MAY)
* rest[0].resource[4].searchParam[8].name = "service"
* rest[0].resource[4].searchParam[8].definition = "http://hl7.org/fhir/SearchParameter/PractitionerRole-service"
* rest[0].resource[4].searchParam[8].type = #reference
* rest[0].resource[4].searchParam[8].documentation = """
**Beispiel:**
`GET [base]/PractitionerRole?service=HealthcareService/123`

**Anwendungshinweis:**
Die Liste der Gesundheitsdienstleistungen, die diese tätige Person für die Organisation bzw. den Standort oder die Standorte dieser Rolle erbringt
"""
* insert Expectation(rest[0].resource[4].searchParam[4], SHALL)
* rest[0].resource[4].searchParam[9].name = "organization"
* rest[0].resource[4].searchParam[9].definition = "http://hl7.org/fhir/SearchParameter/PractitionerRole-organization"
* rest[0].resource[4].searchParam[9].type = #reference
* rest[0].resource[4].searchParam[9].documentation = """
**Beispiel:**
`GET [base]/PractitionerRole?organization=Organization/123`

**Anwendungshinweis:**
Die Organisation, die die tätige Person vertritt bzw. in deren Auftrag sie handelt
"""

* insert Expectation(rest[0].resource[4].searchParam[5], MAY)
* rest[0].resource[4].searchParam[11].name = "location"
* rest[0].resource[4].searchParam[11].definition = "http://hl7.org/fhir/SearchParameter/PractitionerRole-location"
* rest[0].resource[4].searchParam[11].type = #reference
* rest[0].resource[4].searchParam[11].documentation = """
**Beispiel:**
`GET [base]/PractitionerRole?location=Location/123`

**Anwendungshinweis:**
Einer der Standorte, an denen die tätige Person Leistungen erbringt
"""
* insert Expectation(rest[0].resource[4].searchParam[6], MAY)
* rest[0].resource[4].searchParam[12].name = "_id"
* rest[0].resource[4].searchParam[12].definition = "http://hl7.org/fhir/SearchParameter/Resource-id"
* rest[0].resource[4].searchParam[12].type = #token
* rest[0].resource[4].searchParam[12].documentation = """
**Beispiel:**
`GET [base]/PractitionerRole?_id=123`

**Anwendungshinweis:**
Logische ID dieses Artefakts
"""

* insert Expectation(rest[0].resource[4].searchParam[7], MAY)
* rest[0].resource[4].searchInclude[0] = "*"
* insert Expectation(rest[0].resource[4].searchInclude[0], MAY)
* rest[0].resource[4].searchInclude[2] = "PractitionerRole:location"
* insert Expectation(rest[0].resource[4].searchInclude[1], MAY)
* rest[0].resource[4].searchInclude[3] = "PractitionerRole:organization"
* insert Expectation(rest[0].resource[4].searchInclude[2], SHALL)
* rest[0].resource[4].searchInclude[4] = "PractitionerRole:practitioner"
* insert Expectation(rest[0].resource[4].searchInclude[3], SHALL)
* rest[0].resource[4].searchInclude[5] = "PractitionerRole:service"
* insert Expectation(rest[0].resource[4].searchInclude[4], MAY)
* rest[0].resource[4].operation[0].name = "validate"
* rest[0].resource[4].operation[0].definition = "https://orgvz.ref.emiga-rki.de/fhir/OperationDefinition/Multi-it-validate"
* rest[0].resource[4].operation[0].documentation = """
Die Operation `$validate` wird von der Referenzimplementierung für `PractitionerRole` unterstützt.
"""
* insert Expectation(rest[0].resource[4].operation[0], MAY)

// =============================================================================
// HealthcareService
// =============================================================================
* rest[0].resource[0].type = #HealthcareService
* insert Expectation(rest[0].resource[0], SHALL)
* rest[0].resource[0].supportedProfile[0] = "https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaHealthcareService"
* insert Expectation(rest[0].resource[0].supportedProfile[0], SHALL)
* rest[0].resource[0].interaction[0].code = #search-type
* insert Expectation(rest[0].resource[0].interaction[0], SHALL)
* rest[0].resource[0].interaction[0].documentation = """
Die REST-Interaktion `search-type` MUSS für `HealthcareService` unterstützt werden.
**Beispiel:**
`GET [base]/HealthcareService?_id=123`
"""
* rest[0].resource[0].interaction[1].code = #update
* insert Expectation(rest[0].resource[0].interaction[1], SHALL)
* rest[0].resource[0].interaction[1].documentation = """
Die REST-Interaktion `update` MUSS für `HealthcareService` unterstützt werden.
**Beispiel:**
`PUT [base]/HealthcareService/123`
"""
* rest[0].resource[0].interaction[2].code = #vread
* insert Expectation(rest[0].resource[0].interaction[2], SHALL)
* rest[0].resource[0].interaction[2].documentation = """
Die REST-Interaktion `vread` MUSS für `HealthcareService` unterstützt werden.
**Beispiel:**
`GET [base]/HealthcareService/123/_history/1`
"""
* rest[0].resource[0].interaction[3].code = #read
* insert Expectation(rest[0].resource[0].interaction[3], SHALL)
* rest[0].resource[0].interaction[3].documentation = """
Die REST-Interaktion `read` MUSS für `HealthcareService` unterstützt werden.
**Beispiel:**
`GET [base]/HealthcareService/123`
"""
* rest[0].resource[0].interaction[4].code = #patch
* insert Expectation(rest[0].resource[0].interaction[4], SHALL)
* rest[0].resource[0].interaction[4].documentation = """
Die REST-Interaktion `patch` MUSS für `HealthcareService` unterstützt werden.
**Beispiel:**
`PATCH [base]/HealthcareService/123`
"""
* rest[0].resource[0].interaction[5].code = #history-type
* insert Expectation(rest[0].resource[0].interaction[5], SHALL)
* rest[0].resource[0].interaction[5].documentation = """
Die REST-Interaktion `history-type` MUSS für `HealthcareService` unterstützt werden.
**Beispiel:**
`GET [base]/HealthcareService/_history`
"""
* rest[0].resource[0].interaction[6].code = #history-instance
* insert Expectation(rest[0].resource[0].interaction[6], SHALL)
* rest[0].resource[0].interaction[6].documentation = """
Die REST-Interaktion `history-instance` MUSS für `HealthcareService` unterstützt werden.
**Beispiel:**
`GET [base]/HealthcareService/123/_history`
"""
* rest[0].resource[0].interaction[7].code = #delete
* insert Expectation(rest[0].resource[0].interaction[7], SHALL)
* rest[0].resource[0].interaction[7].documentation = """
Die REST-Interaktion `delete` MUSS für `HealthcareService` unterstützt werden.
**Beispiel:**
`DELETE [base]/HealthcareService/123`
"""
* rest[0].resource[0].interaction[8].code = #create
* insert Expectation(rest[0].resource[0].interaction[8], SHALL)
* rest[0].resource[0].interaction[8].documentation = """
Die REST-Interaktion `create` MUSS für `HealthcareService` unterstützt werden.
**Beispiel:**
`POST [base]/HealthcareService`
"""

* insert Expectation(rest[0].resource[0].searchParam[0], SHALL)
* rest[0].resource[0].searchParam[1].name = "specialty"
* rest[0].resource[0].searchParam[1].definition = "http://hl7.org/fhir/SearchParameter/HealthcareService-specialty"
* rest[0].resource[0].searchParam[1].type = #token
* rest[0].resource[0].searchParam[1].documentation = """
**Beispiel:**
`GET [base]/HealthcareService?specialty=<code>`

**Anwendungshinweis:**
Die Fachrichtung der von diesem Gesundheitsdienst angebotenen Leistung
"""
* insert Expectation(rest[0].resource[0].searchParam[1], SHALL)
* rest[0].resource[0].searchParam[2].name = "service-category"
* rest[0].resource[0].searchParam[2].definition = "http://hl7.org/fhir/SearchParameter/HealthcareService-service-category"
* rest[0].resource[0].searchParam[2].type = #token
* rest[0].resource[0].searchParam[2].documentation = """
**Beispiel:**
`GET [base]/HealthcareService?service-category=<code>`

**Anwendungshinweis:**
Die Kategorie der Leistung des Gesundheitsdienstes
"""
* insert Expectation(rest[0].resource[0].searchParam[2], SHALL)
* rest[0].resource[0].searchParam[3].name = "service-type"
* rest[0].resource[0].searchParam[3].definition = "http://hl7.org/fhir/SearchParameter/HealthcareService-service-type"
* rest[0].resource[0].searchParam[3].type = #token
* rest[0].resource[0].searchParam[3].documentation = """
**Beispiel:**
`GET [base]/HealthcareService?service-type=<code>`

**Anwendungshinweis:**
Die Art der von diesem Gesundheitsdienst angebotenen Leistung
"""
* insert Expectation(rest[0].resource[0].searchParam[3], SHALL)
* rest[0].resource[0].searchParam[4].name = "active"
* rest[0].resource[0].searchParam[4].definition = "http://hl7.org/fhir/SearchParameter/HealthcareService-active"
* rest[0].resource[0].searchParam[4].type = #token
* rest[0].resource[0].searchParam[4].documentation = """
**Beispiel:**
`GET [base]/HealthcareService?active=true`

**Anwendungshinweis:**
Der Gesundheitsdienst ist derzeit als aktiv gekennzeichnet
"""
* insert Expectation(rest[0].resource[0].searchParam[4], SHALL)
* rest[0].resource[0].searchParam[9].name = "organization"
* rest[0].resource[0].searchParam[9].definition = "http://hl7.org/fhir/SearchParameter/HealthcareService-organization"
* rest[0].resource[0].searchParam[9].type = #reference
* rest[0].resource[0].searchParam[9].documentation = """
**Beispiel:**
`GET [base]/HealthcareService?organization=Organization/123`

**Anwendungshinweis:**
Die Organisation, die diesen Gesundheitsdienst bereitstellt
"""
* insert Expectation(rest[0].resource[0].searchParam[5], SHALL)
* rest[0].resource[0].searchParam[10].name = "name"
* rest[0].resource[0].searchParam[10].definition = "http://hl7.org/fhir/SearchParameter/HealthcareService-name"
* rest[0].resource[0].searchParam[10].type = #string
* rest[0].resource[0].searchParam[10].documentation = """
**Beispiel:**
`GET [base]/HealthcareService?name=Gesundheitsamt`

**Anwendungshinweis:**
Ein Teil des Namens des Gesundheitsdienstes
"""
* insert Expectation(rest[0].resource[0].searchParam[6], SHALL)
* rest[0].resource[0].searchParam[11].name = "location"
* rest[0].resource[0].searchParam[11].definition = "http://hl7.org/fhir/SearchParameter/HealthcareService-location"
* rest[0].resource[0].searchParam[11].type = #reference
* rest[0].resource[0].searchParam[11].documentation = """
**Beispiel:**
`GET [base]/HealthcareService?location=Location/123`

**Anwendungshinweis:**
Der Standort des Gesundheitsdienstes
"""
* insert Expectation(rest[0].resource[0].searchParam[7], SHALL)
* rest[0].resource[0].searchParam[12].name = "_id"
* rest[0].resource[0].searchParam[12].definition = "http://hl7.org/fhir/SearchParameter/Resource-id"
* rest[0].resource[0].searchParam[12].type = #token
* rest[0].resource[0].searchParam[12].documentation = """
**Beispiel:**
`GET [base]/HealthcareService?_id=123`

**Anwendungshinweis:**
Logische ID dieses Artefakts
"""
* insert Expectation(rest[0].resource[0].searchParam[8], SHALL)
* rest[0].resource[0].searchInclude[0] = "*"
* insert Expectation(rest[0].resource[0].searchInclude[0], SHALL)
* rest[0].resource[0].searchInclude[1] = "HealthcareService:location"
* insert Expectation(rest[0].resource[0].searchInclude[1], SHALL)
* rest[0].resource[0].searchInclude[2] = "HealthcareService:organization"
* insert Expectation(rest[0].resource[0].searchInclude[2], SHALL)
* rest[0].resource[0].searchRevInclude[0] = "PractitionerRole:service"
* insert Expectation(rest[0].resource[0].searchRevInclude[0], MAY)

* rest[0].resource[0].operation[0].name = "validate"
* rest[0].resource[0].operation[0].definition = "https://orgvz.ref.emiga-rki.de/fhir/OperationDefinition/Multi-it-validate"
* rest[0].resource[0].operation[0].documentation = """
Die Operation `$validate` wird von der Referenzimplementierung für `HealthcareService` unterstützt.
"""
* insert Expectation(rest[0].resource[0].operation[0], MAY)

/*Outcommented until we clarify with Backend Devs
// =============================================================================
// Bundle
// =============================================================================
* rest[0].resource[5].type = #Bundle
* insert Expectation(rest[0].resource[5], SHALL)
//* rest[0].resource[5].supportedProfile[0] = "https://emiga.rki.de/fhir/vzd/StructureDefinition/OrgVBundle"
//* insert Expectation(rest[0].resource[5].supportedProfile[0], SHALL)
* rest[0].resource[5].interaction[0].code = #search-type
* insert Expectation(rest[0].resource[5].interaction[0], SHALL)
* rest[0].resource[5].interaction[0].documentation = """
Die REST-Interaktion `search-type` MUSS für `Bundle` unterstützt werden.
**Beispiel:**
`GET [base]/Bundle?_id=123`
"""
* rest[0].resource[5].interaction[1].code = #update
* insert Expectation(rest[0].resource[5].interaction[1], SHALL)
* rest[0].resource[5].interaction[1].documentation = """
Die REST-Interaktion `update` MUSS für `Bundle` unterstützt werden.
**Beispiel:**
`PUT [base]/Bundle/123`
"""
* rest[0].resource[5].interaction[2].code = #vread
* insert Expectation(rest[0].resource[5].interaction[2], SHALL)
* rest[0].resource[5].interaction[2].documentation = """
Die REST-Interaktion `vread` MUSS für `Bundle` unterstützt werden.
**Beispiel:**
`GET [base]/Bundle/123/_history/1`
"""
* rest[0].resource[5].interaction[3].code = #read
* insert Expectation(rest[0].resource[5].interaction[3], SHALL)
* rest[0].resource[5].interaction[3].documentation = """
Die REST-Interaktion `read` MUSS für `Bundle` unterstützt werden.
**Beispiel:**
`GET [base]/Bundle/123`
"""
* rest[0].resource[5].interaction[4].code = #patch
* insert Expectation(rest[0].resource[5].interaction[4], SHALL)
* rest[0].resource[5].interaction[4].documentation = """
Die REST-Interaktion `patch` MUSS für `Bundle` unterstützt werden.
**Beispiel:**
`PATCH [base]/Bundle/123`
"""
* rest[0].resource[5].interaction[5].code = #history-type
* insert Expectation(rest[0].resource[5].interaction[5], SHALL)
* rest[0].resource[5].interaction[5].documentation = """
Die REST-Interaktion `history-type` MUSS für `Bundle` unterstützt werden.
**Beispiel:**
`GET [base]/Bundle/_history`
"""
* rest[0].resource[5].interaction[6].code = #history-instance
* insert Expectation(rest[0].resource[5].interaction[6], SHALL)
* rest[0].resource[5].interaction[6].documentation = """
Die REST-Interaktion `history-instance` MUSS für `Bundle` unterstützt werden.
**Beispiel:**
`GET [base]/Bundle/123/_history`
"""
* rest[0].resource[5].interaction[7].code = #delete
* insert Expectation(rest[0].resource[5].interaction[7], SHALL)
* rest[0].resource[5].interaction[7].documentation = """
Die REST-Interaktion `delete` MUSS für `Bundle` unterstützt werden.
**Beispiel:**
`DELETE [base]/Bundle/123`
"""
* rest[0].resource[5].interaction[8].code = #create
* insert Expectation(rest[0].resource[5].interaction[8], SHALL)
* rest[0].resource[5].interaction[8].documentation = """
Die REST-Interaktion `create` MUSS für `Bundle` unterstützt werden.
**Beispiel:**
`POST [base]/Bundle`
"""
* rest[0].resource[5].versioning = #versioned-update
* rest[0].resource[5].searchParam[0].name = "identifier"
* rest[0].resource[5].searchParam[0].definition = "http://hl7.org/fhir/SearchParameter/Bundle-identifier"
* rest[0].resource[5].searchParam[0].type = #token
* rest[0].resource[5].searchParam[0].documentation = """
**Beispiel:**
`GET [base]/Bundle?identifier=https://example.org/fhir/sid/example|12345`

**Anwendungshinweis:**
Persistenter Identifikator für das Bundle
"""
* insert Expectation(rest[0].resource[5].searchParam[0], SHALL)
* rest[0].resource[5].searchParam[1].name = "message"
* rest[0].resource[5].searchParam[1].definition = "http://hl7.org/fhir/SearchParameter/Bundle-message"
* rest[0].resource[5].searchParam[1].type = #reference
* rest[0].resource[5].searchParam[1].documentation = """
**Beispiel:**
`GET [base]/Bundle?message=MessageHeader/123`

**Anwendungshinweis:**
Die erste Ressource im Bundle, wenn der Bundle-Typ „message“ ist. Dabei handelt es sich um einen MessageHeader; dieser Parameter ermöglicht die Suche in dessen Inhalten
"""
* insert Expectation(rest[0].resource[5].searchParam[1], MAY)
* rest[0].resource[5].searchParam[2].name = "type"
* rest[0].resource[5].searchParam[2].definition = "http://hl7.org/fhir/SearchParameter/Bundle-type"
* rest[0].resource[5].searchParam[2].type = #token
* rest[0].resource[5].searchParam[2].documentation = """
**Beispiel:**
`GET [base]/Bundle?type=<code>`

**Anwendungshinweis:**
document | message | transaction | transaction-response | batch | batch-response | history | searchset | collection
"""
* insert Expectation(rest[0].resource[5].searchParam[2], SHALL)
* rest[0].resource[5].searchParam[3].name = "composition"
* rest[0].resource[5].searchParam[3].definition = "http://hl7.org/fhir/SearchParameter/Bundle-composition"
* rest[0].resource[5].searchParam[3].type = #reference
* rest[0].resource[5].searchParam[3].documentation = """
**Beispiel:**
`GET [base]/Bundle?composition=Composition/123`

**Anwendungshinweis:**
Die erste Ressource im Bundle, wenn der Bundle-Typ „document“ ist. Dabei handelt es sich um eine Composition; dieser Parameter ermöglicht die Suche in deren Inhalten
"""
* insert Expectation(rest[0].resource[5].searchParam[3], MAY)
* rest[0].resource[5].searchParam[4].name = "_id"
* rest[0].resource[5].searchParam[4].definition = "http://hl7.org/fhir/SearchParameter/Resource-id"
* rest[0].resource[5].searchParam[4].type = #token
* rest[0].resource[5].searchParam[4].documentation = """
**Beispiel:**
`GET [base]/Bundle?_id=123`

**Anwendungshinweis:**
Logische ID dieses Artefakts
"""
* insert Expectation(rest[0].resource[5].searchParam[4], SHALL)
* rest[0].resource[5].searchParam[5].name = "timestamp"
* rest[0].resource[5].searchParam[5].definition = "http://hl7.org/fhir/SearchParameter/Bundle-timestamp"
* rest[0].resource[5].searchParam[5].type = #date
* rest[0].resource[5].searchParam[5].documentation = """
**Beispiel:**
`GET [base]/Bundle?timestamp=2026-09-16`

**Anwendungshinweis:**
Zeitpunkt, zu dem das Bundle zusammengestellt wurde
"""
* insert Expectation(rest[0].resource[5].searchParam[5], MAY)
* rest[0].resource[5].searchInclude[0] = "*"
* insert Expectation(rest[0].resource[5].searchInclude[0], MAY)
* rest[0].resource[5].searchInclude[1] = "Bundle:composition"
* insert Expectation(rest[0].resource[5].searchInclude[1], MAY)
* rest[0].resource[5].searchInclude[2] = "Bundle:message"
* insert Expectation(rest[0].resource[5].searchInclude[2], MAY)
* rest[0].resource[5].operation[0].name = "validate"
* rest[0].resource[5].operation[0].definition = "https://orgvz.ref.emiga-rki.de/fhir/OperationDefinition/Multi-it-validate"
* rest[0].resource[5].operation[0].documentation = """
Die Operation `$validate` wird von der Referenzimplementierung für `Bundle` unterstützt.
"""
* insert Expectation(rest[0].resource[5].operation[0], MAY)

*/
