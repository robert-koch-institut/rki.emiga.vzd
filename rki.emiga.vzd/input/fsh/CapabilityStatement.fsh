// EMIGA VZD Informative CapabilityStatement
// Source: runtime HAPI CapabilityStatement uploaded 2026-09-16
// SHALL/MAY classifications below are proposed IG policy.

Alias: $capExpectation = http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation

RuleSet: Expectation(path, expectation)
* {path}.extension[0].url = $capExpectation
* {path}.extension[0].valueCode = #{expectation}

Instance: EmigaVzdCapabilityStatementRequirements
InstanceOf: CapabilityStatement
Usage: #definition
* url = "https://emiga.rki.de/fhir/vzd/CapabilityStatement/EmigaVzdRequirements"
* version = "0.1.0"
* name = "EmigaVzdRequirements"
* title = "EMIGA VZD CapabilityStatement - Requirements"
* status = #draft
* experimental = true
* date = "2026-09-16"
* publisher = "Robert Koch-Institut"
* kind = #requirements
* fhirVersion = #4.0.1
* format[0] = #application/fhir+json
* format[1] = #application/fhir+xml
* description = """
Dieses CapabilityStatement beschreibt die normativen REST-Anforderungen für EMIGA VZD.
Es ist vom Typ `requirements`. Die Verbindlichkeit wird analog zu ISiK über die
CapabilityStatement-Expectation-Extension mit `SHALL` und `MAY` ausgedrückt.

Die enthaltenen Fähigkeiten wurden aus dem CapabilityStatement der HAPI-FHIR-Referenzinstanz
abgeleitet. Die Einstufung als SHALL oder MAY ist eine normative Designentscheidung dieses IG
und muss durch Product Owner und Backend-Team bestätigt werden.
"""
* rest[0].mode = #server

// -----------------------------------------------------------------------------
// System-level interactions
// -----------------------------------------------------------------------------
* rest[0].interaction[0].code = #transaction
* insert Expectation(rest[0].interaction[0], SHALL)
* rest[0].interaction[1].code = #history-system
* insert Expectation(rest[0].interaction[1], MAY)

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
// HealthcareService
// =============================================================================
* rest[0].resource[0].type = #HealthcareService
* insert Expectation(rest[0].resource[0], SHALL)
* rest[0].resource[0].supportedProfile[0] = "https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaHealthcareService"
* insert Expectation(rest[0].resource[0].supportedProfile[0], SHALL)
* rest[0].resource[0].interaction[0].code = #read
* insert Expectation(rest[0].resource[0].interaction[0], SHALL)
* rest[0].resource[0].interaction[1].code = #search-type
* insert Expectation(rest[0].resource[0].interaction[1], SHALL)
* rest[0].resource[0].interaction[2].code = #create
* insert Expectation(rest[0].resource[0].interaction[2], SHALL)
* rest[0].resource[0].interaction[3].code = #update
* insert Expectation(rest[0].resource[0].interaction[3], SHALL)
* rest[0].resource[0].interaction[4].code = #patch
* insert Expectation(rest[0].resource[0].interaction[4], MAY)
* rest[0].resource[0].interaction[5].code = #delete
* insert Expectation(rest[0].resource[0].interaction[5], MAY)
* rest[0].resource[0].interaction[6].code = #vread
* insert Expectation(rest[0].resource[0].interaction[6], MAY)
* rest[0].resource[0].interaction[7].code = #history-instance
* insert Expectation(rest[0].resource[0].interaction[7], MAY)
* rest[0].resource[0].interaction[8].code = #history-type
* insert Expectation(rest[0].resource[0].interaction[8], MAY)
* rest[0].resource[0].versioning = #versioned-update
* rest[0].resource[0].searchParam[0].name = "identifier"
* rest[0].resource[0].searchParam[0].definition = "http://hl7.org/fhir/SearchParameter/HealthcareService-identifier"
* rest[0].resource[0].searchParam[0].type = #token
* rest[0].resource[0].searchParam[0].documentation = "External identifiers for this item"
* insert Expectation(rest[0].resource[0].searchParam[0], SHALL)
* rest[0].resource[0].searchParam[1].name = "specialty"
* rest[0].resource[0].searchParam[1].definition = "http://hl7.org/fhir/SearchParameter/HealthcareService-specialty"
* rest[0].resource[0].searchParam[1].type = #token
* rest[0].resource[0].searchParam[1].documentation = "The specialty of the service provided by this healthcare service"
* insert Expectation(rest[0].resource[0].searchParam[1], MAY)
* rest[0].resource[0].searchParam[2].name = "service-category"
* rest[0].resource[0].searchParam[2].definition = "http://hl7.org/fhir/SearchParameter/HealthcareService-service-category"
* rest[0].resource[0].searchParam[2].type = #token
* rest[0].resource[0].searchParam[2].documentation = "Service Category of the Healthcare Service"
* insert Expectation(rest[0].resource[0].searchParam[2], MAY)
* rest[0].resource[0].searchParam[3].name = "service-type"
* rest[0].resource[0].searchParam[3].definition = "http://hl7.org/fhir/SearchParameter/HealthcareService-service-type"
* rest[0].resource[0].searchParam[3].type = #token
* rest[0].resource[0].searchParam[3].documentation = "The type of service provided by this healthcare service"
* insert Expectation(rest[0].resource[0].searchParam[3], SHALL)
* rest[0].resource[0].searchParam[4].name = "active"
* rest[0].resource[0].searchParam[4].definition = "http://hl7.org/fhir/SearchParameter/HealthcareService-active"
* rest[0].resource[0].searchParam[4].type = #token
* rest[0].resource[0].searchParam[4].documentation = "The Healthcare Service is currently marked as active"
* insert Expectation(rest[0].resource[0].searchParam[4], SHALL)
* rest[0].resource[0].searchParam[5].name = "program"
* rest[0].resource[0].searchParam[5].definition = "http://hl7.org/fhir/SearchParameter/HealthcareService-program"
* rest[0].resource[0].searchParam[5].type = #token
* rest[0].resource[0].searchParam[5].documentation = "One of the Programs supported by this HealthcareService"
* insert Expectation(rest[0].resource[0].searchParam[5], MAY)
* rest[0].resource[0].searchParam[6].name = "characteristic"
* rest[0].resource[0].searchParam[6].definition = "http://hl7.org/fhir/SearchParameter/HealthcareService-characteristic"
* rest[0].resource[0].searchParam[6].type = #token
* rest[0].resource[0].searchParam[6].documentation = "One of the HealthcareService's characteristics"
* insert Expectation(rest[0].resource[0].searchParam[6], MAY)
* rest[0].resource[0].searchParam[7].name = "endpoint"
* rest[0].resource[0].searchParam[7].definition = "http://hl7.org/fhir/SearchParameter/HealthcareService-endpoint"
* rest[0].resource[0].searchParam[7].type = #reference
* rest[0].resource[0].searchParam[7].documentation = "Technical endpoints providing access to electronic services operated for the healthcare service"
* insert Expectation(rest[0].resource[0].searchParam[7], MAY)
* rest[0].resource[0].searchParam[8].name = "coverage-area"
* rest[0].resource[0].searchParam[8].definition = "http://hl7.org/fhir/SearchParameter/HealthcareService-coverage-area"
* rest[0].resource[0].searchParam[8].type = #reference
* rest[0].resource[0].searchParam[8].documentation = "Location(s) service is intended for/available to"
* insert Expectation(rest[0].resource[0].searchParam[8], MAY)
* rest[0].resource[0].searchParam[9].name = "organization"
* rest[0].resource[0].searchParam[9].definition = "http://hl7.org/fhir/SearchParameter/HealthcareService-organization"
* rest[0].resource[0].searchParam[9].type = #reference
* rest[0].resource[0].searchParam[9].documentation = "The organization that provides this Healthcare Service"
* insert Expectation(rest[0].resource[0].searchParam[9], SHALL)
* rest[0].resource[0].searchParam[10].name = "name"
* rest[0].resource[0].searchParam[10].definition = "http://hl7.org/fhir/SearchParameter/HealthcareService-name"
* rest[0].resource[0].searchParam[10].type = #string
* rest[0].resource[0].searchParam[10].documentation = "A portion of the Healthcare service name"
* insert Expectation(rest[0].resource[0].searchParam[10], SHALL)
* rest[0].resource[0].searchParam[11].name = "location"
* rest[0].resource[0].searchParam[11].definition = "http://hl7.org/fhir/SearchParameter/HealthcareService-location"
* rest[0].resource[0].searchParam[11].type = #reference
* rest[0].resource[0].searchParam[11].documentation = "The location of the Healthcare Service"
* insert Expectation(rest[0].resource[0].searchParam[11], SHALL)
* rest[0].resource[0].searchParam[12].name = "_id"
* rest[0].resource[0].searchParam[12].definition = "http://hl7.org/fhir/SearchParameter/Resource-id"
* rest[0].resource[0].searchParam[12].type = #token
* rest[0].resource[0].searchParam[12].documentation = "Logical id of this artifact"
* insert Expectation(rest[0].resource[0].searchParam[12], SHALL)
* rest[0].resource[0].searchInclude[0] = "HealthcareService:location"
* insert Expectation(rest[0].resource[0].searchInclude[0], SHALL)
* rest[0].resource[0].searchInclude[1] = "HealthcareService:organization"
* insert Expectation(rest[0].resource[0].searchInclude[1], SHALL)
* rest[0].resource[0].searchInclude[2] = "HealthcareService:endpoint"
* insert Expectation(rest[0].resource[0].searchInclude[2], MAY)
* rest[0].resource[0].searchInclude[3] = "HealthcareService:coverage-area"
* insert Expectation(rest[0].resource[0].searchInclude[3], MAY)
* rest[0].resource[0].searchRevInclude[0] = "PractitionerRole:service"
* insert Expectation(rest[0].resource[0].searchRevInclude[0], MAY)
* rest[0].resource[0].operation[0].name = "validate"
* rest[0].resource[0].operation[0].definition = "https://orgvz.ref.emiga-rki.de/fhir/OperationDefinition/Multi-it-validate"
* insert Expectation(rest[0].resource[0].operation[0], MAY)

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
* rest[0].resource[1].interaction[0].code = #read
* insert Expectation(rest[0].resource[1].interaction[0], SHALL)
* rest[0].resource[1].interaction[1].code = #search-type
* insert Expectation(rest[0].resource[1].interaction[1], SHALL)
* rest[0].resource[1].interaction[2].code = #create
* insert Expectation(rest[0].resource[1].interaction[2], SHALL)
* rest[0].resource[1].interaction[3].code = #update
* insert Expectation(rest[0].resource[1].interaction[3], SHALL)
* rest[0].resource[1].interaction[4].code = #patch
* insert Expectation(rest[0].resource[1].interaction[4], MAY)
* rest[0].resource[1].interaction[5].code = #delete
* insert Expectation(rest[0].resource[1].interaction[5], MAY)
* rest[0].resource[1].interaction[6].code = #vread
* insert Expectation(rest[0].resource[1].interaction[6], MAY)
* rest[0].resource[1].interaction[7].code = #history-instance
* insert Expectation(rest[0].resource[1].interaction[7], MAY)
* rest[0].resource[1].interaction[8].code = #history-type
* insert Expectation(rest[0].resource[1].interaction[8], MAY)
* rest[0].resource[1].versioning = #versioned-update
* rest[0].resource[1].searchParam[0].name = "identifier"
* rest[0].resource[1].searchParam[0].definition = "http://hl7.org/fhir/SearchParameter/Location-identifier"
* rest[0].resource[1].searchParam[0].type = #token
* rest[0].resource[1].searchParam[0].documentation = "An identifier for the location"
* insert Expectation(rest[0].resource[1].searchParam[0], SHALL)
* rest[0].resource[1].searchParam[1].name = "partof"
* rest[0].resource[1].searchParam[1].definition = "http://hl7.org/fhir/SearchParameter/Location-partof"
* rest[0].resource[1].searchParam[1].type = #reference
* rest[0].resource[1].searchParam[1].documentation = "A location of which this location is a part"
* insert Expectation(rest[0].resource[1].searchParam[1], SHALL)
* rest[0].resource[1].searchParam[2].name = "address"
* rest[0].resource[1].searchParam[2].definition = "http://hl7.org/fhir/SearchParameter/Location-address"
* rest[0].resource[1].searchParam[2].type = #string
* rest[0].resource[1].searchParam[2].documentation = "A (part of the) address of the location"
* insert Expectation(rest[0].resource[1].searchParam[2], MAY)
* rest[0].resource[1].searchParam[3].name = "address-state"
* rest[0].resource[1].searchParam[3].definition = "http://hl7.org/fhir/SearchParameter/Location-address-state"
* rest[0].resource[1].searchParam[3].type = #string
* rest[0].resource[1].searchParam[3].documentation = "A state specified in an address"
* insert Expectation(rest[0].resource[1].searchParam[3], MAY)
* rest[0].resource[1].searchParam[4].name = "operational-status"
* rest[0].resource[1].searchParam[4].definition = "http://hl7.org/fhir/SearchParameter/Location-operational-status"
* rest[0].resource[1].searchParam[4].type = #token
* rest[0].resource[1].searchParam[4].documentation = "Searches for locations (typically bed/room) that have an operational status (e.g. contaminated, housekeeping)"
* insert Expectation(rest[0].resource[1].searchParam[4], MAY)
* rest[0].resource[1].searchParam[5].name = "type"
* rest[0].resource[1].searchParam[5].definition = "http://hl7.org/fhir/SearchParameter/Location-type"
* rest[0].resource[1].searchParam[5].type = #token
* rest[0].resource[1].searchParam[5].documentation = "A code for the type of location"
* insert Expectation(rest[0].resource[1].searchParam[5], SHALL)
* rest[0].resource[1].searchParam[6].name = "address-postalcode"
* rest[0].resource[1].searchParam[6].definition = "http://hl7.org/fhir/SearchParameter/Location-address-postalcode"
* rest[0].resource[1].searchParam[6].type = #string
* rest[0].resource[1].searchParam[6].documentation = "A postal code specified in an address"
* insert Expectation(rest[0].resource[1].searchParam[6], MAY)
* rest[0].resource[1].searchParam[7].name = "address-country"
* rest[0].resource[1].searchParam[7].definition = "http://hl7.org/fhir/SearchParameter/Location-address-country"
* rest[0].resource[1].searchParam[7].type = #string
* rest[0].resource[1].searchParam[7].documentation = "A country specified in an address"
* insert Expectation(rest[0].resource[1].searchParam[7], MAY)
* rest[0].resource[1].searchParam[8].name = "endpoint"
* rest[0].resource[1].searchParam[8].definition = "http://hl7.org/fhir/SearchParameter/Location-endpoint"
* rest[0].resource[1].searchParam[8].type = #reference
* rest[0].resource[1].searchParam[8].documentation = "Technical endpoints providing access to services operated for the location"
* insert Expectation(rest[0].resource[1].searchParam[8], MAY)
* rest[0].resource[1].searchParam[9].name = "organization"
* rest[0].resource[1].searchParam[9].definition = "http://hl7.org/fhir/SearchParameter/Location-organization"
* rest[0].resource[1].searchParam[9].type = #reference
* rest[0].resource[1].searchParam[9].documentation = "Searches for locations that are managed by the provided organization"
* insert Expectation(rest[0].resource[1].searchParam[9], SHALL)
* rest[0].resource[1].searchParam[10].name = "address-use"
* rest[0].resource[1].searchParam[10].definition = "http://hl7.org/fhir/SearchParameter/Location-address-use"
* rest[0].resource[1].searchParam[10].type = #token
* rest[0].resource[1].searchParam[10].documentation = "A use code specified in an address"
* insert Expectation(rest[0].resource[1].searchParam[10], MAY)
* rest[0].resource[1].searchParam[11].name = "name"
* rest[0].resource[1].searchParam[11].definition = "http://hl7.org/fhir/SearchParameter/Location-name"
* rest[0].resource[1].searchParam[11].type = #string
* rest[0].resource[1].searchParam[11].documentation = "A portion of the location's name or alias"
* insert Expectation(rest[0].resource[1].searchParam[11], SHALL)
* rest[0].resource[1].searchParam[12].name = "_id"
* rest[0].resource[1].searchParam[12].definition = "http://hl7.org/fhir/SearchParameter/Resource-id"
* rest[0].resource[1].searchParam[12].type = #token
* rest[0].resource[1].searchParam[12].documentation = "Logical id of this artifact"
* insert Expectation(rest[0].resource[1].searchParam[12], SHALL)
* rest[0].resource[1].searchParam[13].name = "near"
* rest[0].resource[1].searchParam[13].definition = "http://hl7.org/fhir/SearchParameter/Location-near"
* rest[0].resource[1].searchParam[13].type = #special
* insert Expectation(rest[0].resource[1].searchParam[13], MAY)
* rest[0].resource[1].searchParam[14].name = "address-city"
* rest[0].resource[1].searchParam[14].definition = "http://hl7.org/fhir/SearchParameter/Location-address-city"
* rest[0].resource[1].searchParam[14].type = #string
* rest[0].resource[1].searchParam[14].documentation = "A city specified in an address"
* insert Expectation(rest[0].resource[1].searchParam[14], MAY)
* rest[0].resource[1].searchParam[15].name = "status"
* rest[0].resource[1].searchParam[15].definition = "http://hl7.org/fhir/SearchParameter/Location-status"
* rest[0].resource[1].searchParam[15].type = #token
* rest[0].resource[1].searchParam[15].documentation = "Searches for locations with a specific kind of status"
* insert Expectation(rest[0].resource[1].searchParam[15], SHALL)
* rest[0].resource[1].searchInclude[0] = "Location:organization"
* insert Expectation(rest[0].resource[1].searchInclude[0], SHALL)
* rest[0].resource[1].searchInclude[1] = "Location:partof"
* insert Expectation(rest[0].resource[1].searchInclude[1], SHALL)
* rest[0].resource[1].searchInclude[2] = "Location:endpoint"
* insert Expectation(rest[0].resource[1].searchInclude[2], MAY)
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
* insert Expectation(rest[0].resource[1].operation[0], MAY)

// =============================================================================
// Organization
// =============================================================================
* rest[0].resource[2].type = #Organization
* insert Expectation(rest[0].resource[2], SHALL)
* rest[0].resource[2].supportedProfile[0] = "https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaDepartmentOrganization"
* insert Expectation(rest[0].resource[2].supportedProfile[0], SHALL)
* rest[0].resource[2].supportedProfile[1] = "https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaHospitalOrganization"
* insert Expectation(rest[0].resource[2].supportedProfile[1], SHALL)
* rest[0].resource[2].supportedProfile[2] = "https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaOrganization"
* insert Expectation(rest[0].resource[2].supportedProfile[2], SHALL)
* rest[0].resource[2].supportedProfile[3] = "https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaPublicHealthOrganization"
* insert Expectation(rest[0].resource[2].supportedProfile[3], SHALL)
* rest[0].resource[2].interaction[0].code = #read
* insert Expectation(rest[0].resource[2].interaction[0], SHALL)
* rest[0].resource[2].interaction[1].code = #search-type
* insert Expectation(rest[0].resource[2].interaction[1], SHALL)
* rest[0].resource[2].interaction[2].code = #create
* insert Expectation(rest[0].resource[2].interaction[2], SHALL)
* rest[0].resource[2].interaction[3].code = #update
* insert Expectation(rest[0].resource[2].interaction[3], SHALL)
* rest[0].resource[2].interaction[4].code = #patch
* insert Expectation(rest[0].resource[2].interaction[4], MAY)
* rest[0].resource[2].interaction[5].code = #delete
* insert Expectation(rest[0].resource[2].interaction[5], MAY)
* rest[0].resource[2].interaction[6].code = #vread
* insert Expectation(rest[0].resource[2].interaction[6], MAY)
* rest[0].resource[2].interaction[7].code = #history-instance
* insert Expectation(rest[0].resource[2].interaction[7], MAY)
* rest[0].resource[2].interaction[8].code = #history-type
* insert Expectation(rest[0].resource[2].interaction[8], MAY)
* rest[0].resource[2].versioning = #versioned-update
* rest[0].resource[2].searchParam[0].name = "identifier"
* rest[0].resource[2].searchParam[0].definition = "http://hl7.org/fhir/SearchParameter/Organization-identifier"
* rest[0].resource[2].searchParam[0].type = #token
* rest[0].resource[2].searchParam[0].documentation = "Any identifier for the organization (not the accreditation issuer's identifier)"
* insert Expectation(rest[0].resource[2].searchParam[0], SHALL)
* rest[0].resource[2].searchParam[1].name = "partof"
* rest[0].resource[2].searchParam[1].definition = "http://hl7.org/fhir/SearchParameter/Organization-partof"
* rest[0].resource[2].searchParam[1].type = #reference
* rest[0].resource[2].searchParam[1].documentation = "An organization of which this organization forms a part"
* insert Expectation(rest[0].resource[2].searchParam[1], SHALL)
* rest[0].resource[2].searchParam[2].name = "address"
* rest[0].resource[2].searchParam[2].definition = "http://hl7.org/fhir/SearchParameter/Organization-address"
* rest[0].resource[2].searchParam[2].type = #string
* rest[0].resource[2].searchParam[2].documentation = "A server defined search that may match any of the string fields in the Address, including line, city, district, state, country, postalCode, and/or text"
* insert Expectation(rest[0].resource[2].searchParam[2], MAY)
* rest[0].resource[2].searchParam[3].name = "address-state"
* rest[0].resource[2].searchParam[3].definition = "http://hl7.org/fhir/SearchParameter/Organization-address-state"
* rest[0].resource[2].searchParam[3].type = #string
* rest[0].resource[2].searchParam[3].documentation = "A state specified in an address"
* insert Expectation(rest[0].resource[2].searchParam[3], MAY)
* rest[0].resource[2].searchParam[4].name = "active"
* rest[0].resource[2].searchParam[4].definition = "http://hl7.org/fhir/SearchParameter/Organization-active"
* rest[0].resource[2].searchParam[4].type = #token
* rest[0].resource[2].searchParam[4].documentation = "Is the Organization record active"
* insert Expectation(rest[0].resource[2].searchParam[4], SHALL)
* rest[0].resource[2].searchParam[5].name = "type"
* rest[0].resource[2].searchParam[5].definition = "http://hl7.org/fhir/SearchParameter/Organization-type"
* rest[0].resource[2].searchParam[5].type = #token
* rest[0].resource[2].searchParam[5].documentation = "A code for the type of organization"
* insert Expectation(rest[0].resource[2].searchParam[5], SHALL)
* rest[0].resource[2].searchParam[6].name = "address-postalcode"
* rest[0].resource[2].searchParam[6].definition = "http://hl7.org/fhir/SearchParameter/Organization-address-postalcode"
* rest[0].resource[2].searchParam[6].type = #string
* rest[0].resource[2].searchParam[6].documentation = "A postal code specified in an address"
* insert Expectation(rest[0].resource[2].searchParam[6], MAY)
* rest[0].resource[2].searchParam[7].name = "address-country"
* rest[0].resource[2].searchParam[7].definition = "http://hl7.org/fhir/SearchParameter/Organization-address-country"
* rest[0].resource[2].searchParam[7].type = #string
* rest[0].resource[2].searchParam[7].documentation = "A country specified in an address"
* insert Expectation(rest[0].resource[2].searchParam[7], MAY)
* rest[0].resource[2].searchParam[8].name = "endpoint"
* rest[0].resource[2].searchParam[8].definition = "http://hl7.org/fhir/SearchParameter/Organization-endpoint"
* rest[0].resource[2].searchParam[8].type = #reference
* rest[0].resource[2].searchParam[8].documentation = "Technical endpoints providing access to services operated for the organization"
* insert Expectation(rest[0].resource[2].searchParam[8], MAY)
* rest[0].resource[2].searchParam[9].name = "phonetic"
* rest[0].resource[2].searchParam[9].definition = "http://hl7.org/fhir/SearchParameter/Organization-phonetic"
* rest[0].resource[2].searchParam[9].type = #string
* rest[0].resource[2].searchParam[9].documentation = "A portion of the organization's name using some kind of phonetic matching algorithm"
* insert Expectation(rest[0].resource[2].searchParam[9], MAY)
* rest[0].resource[2].searchParam[10].name = "address-use"
* rest[0].resource[2].searchParam[10].definition = "http://hl7.org/fhir/SearchParameter/Organization-address-use"
* rest[0].resource[2].searchParam[10].type = #token
* rest[0].resource[2].searchParam[10].documentation = "A use code specified in an address"
* insert Expectation(rest[0].resource[2].searchParam[10], MAY)
* rest[0].resource[2].searchParam[11].name = "name"
* rest[0].resource[2].searchParam[11].definition = "http://hl7.org/fhir/SearchParameter/Organization-name"
* rest[0].resource[2].searchParam[11].type = #string
* rest[0].resource[2].searchParam[11].documentation = "A portion of the organization's name or alias"
* insert Expectation(rest[0].resource[2].searchParam[11], SHALL)
* rest[0].resource[2].searchParam[12].name = "_id"
* rest[0].resource[2].searchParam[12].definition = "http://hl7.org/fhir/SearchParameter/Resource-id"
* rest[0].resource[2].searchParam[12].type = #token
* rest[0].resource[2].searchParam[12].documentation = "Logical id of this artifact"
* insert Expectation(rest[0].resource[2].searchParam[12], SHALL)
* rest[0].resource[2].searchParam[13].name = "address-city"
* rest[0].resource[2].searchParam[13].definition = "http://hl7.org/fhir/SearchParameter/Organization-address-city"
* rest[0].resource[2].searchParam[13].type = #string
* rest[0].resource[2].searchParam[13].documentation = "A city specified in an address"
* insert Expectation(rest[0].resource[2].searchParam[13], MAY)
* rest[0].resource[2].searchInclude[0] = "Organization:partof"
* insert Expectation(rest[0].resource[2].searchInclude[0], SHALL)
* rest[0].resource[2].searchInclude[1] = "Organization:endpoint"
* insert Expectation(rest[0].resource[2].searchInclude[1], MAY)
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
* insert Expectation(rest[0].resource[2].operation[0], MAY)
* rest[0].resource[2].operation[1].name = "duplicate-check"
* rest[0].resource[2].operation[1].definition = "https://orgvz.ref.emiga-rki.de/fhir/OperationDefinition/Organization-t-duplicate-check"
* insert Expectation(rest[0].resource[2].operation[1], MAY)
* rest[0].resource[2].operation[2].name = "validate"
* rest[0].resource[2].operation[2].definition = "https://orgvz.ref.emiga-rki.de/fhir/OperationDefinition/Multi-it-validate"
* insert Expectation(rest[0].resource[2].operation[2], MAY)

// =============================================================================
// Practitioner
// =============================================================================
* rest[0].resource[3].type = #Practitioner
* insert Expectation(rest[0].resource[3], SHALL)
* rest[0].resource[3].supportedProfile[0] = "https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaPractitioner"
* insert Expectation(rest[0].resource[3].supportedProfile[0], SHALL)
* rest[0].resource[3].interaction[0].code = #read
* insert Expectation(rest[0].resource[3].interaction[0], SHALL)
* rest[0].resource[3].interaction[1].code = #search-type
* insert Expectation(rest[0].resource[3].interaction[1], SHALL)
* rest[0].resource[3].interaction[2].code = #create
* insert Expectation(rest[0].resource[3].interaction[2], SHALL)
* rest[0].resource[3].interaction[3].code = #update
* insert Expectation(rest[0].resource[3].interaction[3], SHALL)
* rest[0].resource[3].interaction[4].code = #patch
* insert Expectation(rest[0].resource[3].interaction[4], MAY)
* rest[0].resource[3].interaction[5].code = #delete
* insert Expectation(rest[0].resource[3].interaction[5], MAY)
* rest[0].resource[3].interaction[6].code = #vread
* insert Expectation(rest[0].resource[3].interaction[6], MAY)
* rest[0].resource[3].interaction[7].code = #history-instance
* insert Expectation(rest[0].resource[3].interaction[7], MAY)
* rest[0].resource[3].interaction[8].code = #history-type
* insert Expectation(rest[0].resource[3].interaction[8], MAY)
* rest[0].resource[3].versioning = #versioned-update
* rest[0].resource[3].searchParam[0].name = "address-state"
* rest[0].resource[3].searchParam[0].definition = "http://hl7.org/fhir/SearchParameter/individual-address-state"
* rest[0].resource[3].searchParam[0].type = #string
* insert Expectation(rest[0].resource[3].searchParam[0], MAY)
* rest[0].resource[3].searchParam[1].name = "gender"
* rest[0].resource[3].searchParam[1].definition = "http://hl7.org/fhir/SearchParameter/individual-gender"
* rest[0].resource[3].searchParam[1].type = #token
* insert Expectation(rest[0].resource[3].searchParam[1], MAY)
* rest[0].resource[3].searchParam[2].name = "address-country"
* rest[0].resource[3].searchParam[2].definition = "http://hl7.org/fhir/SearchParameter/individual-address-country"
* rest[0].resource[3].searchParam[2].type = #string
* insert Expectation(rest[0].resource[3].searchParam[2], MAY)
* rest[0].resource[3].searchParam[3].name = "phonetic"
* rest[0].resource[3].searchParam[3].definition = "http://hl7.org/fhir/SearchParameter/individual-phonetic"
* rest[0].resource[3].searchParam[3].type = #string
* insert Expectation(rest[0].resource[3].searchParam[3], MAY)
* rest[0].resource[3].searchParam[4].name = "telecom"
* rest[0].resource[3].searchParam[4].definition = "http://hl7.org/fhir/SearchParameter/individual-telecom"
* rest[0].resource[3].searchParam[4].type = #token
* insert Expectation(rest[0].resource[3].searchParam[4], MAY)
* rest[0].resource[3].searchParam[5].name = "address-city"
* rest[0].resource[3].searchParam[5].definition = "http://hl7.org/fhir/SearchParameter/individual-address-city"
* rest[0].resource[3].searchParam[5].type = #string
* insert Expectation(rest[0].resource[3].searchParam[5], MAY)
* rest[0].resource[3].searchParam[6].name = "communication"
* rest[0].resource[3].searchParam[6].definition = "http://hl7.org/fhir/SearchParameter/Practitioner-communication"
* rest[0].resource[3].searchParam[6].type = #token
* rest[0].resource[3].searchParam[6].documentation = "One of the languages that the practitioner can communicate with"
* insert Expectation(rest[0].resource[3].searchParam[6], MAY)
* rest[0].resource[3].searchParam[7].name = "email"
* rest[0].resource[3].searchParam[7].definition = "http://hl7.org/fhir/SearchParameter/individual-email"
* rest[0].resource[3].searchParam[7].type = #token
* insert Expectation(rest[0].resource[3].searchParam[7], MAY)
* rest[0].resource[3].searchParam[8].name = "given"
* rest[0].resource[3].searchParam[8].definition = "http://hl7.org/fhir/SearchParameter/individual-given"
* rest[0].resource[3].searchParam[8].type = #string
* insert Expectation(rest[0].resource[3].searchParam[8], SHALL)
* rest[0].resource[3].searchParam[9].name = "identifier"
* rest[0].resource[3].searchParam[9].definition = "http://hl7.org/fhir/SearchParameter/Practitioner-identifier"
* rest[0].resource[3].searchParam[9].type = #token
* rest[0].resource[3].searchParam[9].documentation = "A practitioner's Identifier"
* insert Expectation(rest[0].resource[3].searchParam[9], SHALL)
* rest[0].resource[3].searchParam[10].name = "address"
* rest[0].resource[3].searchParam[10].definition = "http://hl7.org/fhir/SearchParameter/individual-address"
* rest[0].resource[3].searchParam[10].type = #string
* insert Expectation(rest[0].resource[3].searchParam[10], MAY)
* rest[0].resource[3].searchParam[11].name = "active"
* rest[0].resource[3].searchParam[11].definition = "http://hl7.org/fhir/SearchParameter/Practitioner-active"
* rest[0].resource[3].searchParam[11].type = #token
* rest[0].resource[3].searchParam[11].documentation = "Whether the practitioner record is active"
* insert Expectation(rest[0].resource[3].searchParam[11], SHALL)
* rest[0].resource[3].searchParam[12].name = "address-postalcode"
* rest[0].resource[3].searchParam[12].definition = "http://hl7.org/fhir/SearchParameter/individual-address-postalcode"
* rest[0].resource[3].searchParam[12].type = #string
* insert Expectation(rest[0].resource[3].searchParam[12], MAY)
* rest[0].resource[3].searchParam[13].name = "phone"
* rest[0].resource[3].searchParam[13].definition = "http://hl7.org/fhir/SearchParameter/individual-phone"
* rest[0].resource[3].searchParam[13].type = #token
* insert Expectation(rest[0].resource[3].searchParam[13], MAY)
* rest[0].resource[3].searchParam[14].name = "address-use"
* rest[0].resource[3].searchParam[14].definition = "http://hl7.org/fhir/SearchParameter/individual-address-use"
* rest[0].resource[3].searchParam[14].type = #token
* insert Expectation(rest[0].resource[3].searchParam[14], MAY)
* rest[0].resource[3].searchParam[15].name = "name"
* rest[0].resource[3].searchParam[15].definition = "http://hl7.org/fhir/SearchParameter/Practitioner-name"
* rest[0].resource[3].searchParam[15].type = #string
* rest[0].resource[3].searchParam[15].documentation = "A server defined search that may match any of the string fields in the HumanName, including family, give, prefix, suffix, suffix, and/or text"
* insert Expectation(rest[0].resource[3].searchParam[15], SHALL)
* rest[0].resource[3].searchParam[16].name = "_id"
* rest[0].resource[3].searchParam[16].definition = "http://hl7.org/fhir/SearchParameter/Resource-id"
* rest[0].resource[3].searchParam[16].type = #token
* rest[0].resource[3].searchParam[16].documentation = "Logical id of this artifact"
* insert Expectation(rest[0].resource[3].searchParam[16], SHALL)
* rest[0].resource[3].searchParam[17].name = "family"
* rest[0].resource[3].searchParam[17].definition = "http://hl7.org/fhir/SearchParameter/individual-family"
* rest[0].resource[3].searchParam[17].type = #string
* insert Expectation(rest[0].resource[3].searchParam[17], SHALL)
* rest[0].resource[3].searchRevInclude[0] = "PractitionerRole:practitioner"
* insert Expectation(rest[0].resource[3].searchRevInclude[0], MAY)
* rest[0].resource[3].operation[0].name = "validate"
* rest[0].resource[3].operation[0].definition = "https://orgvz.ref.emiga-rki.de/fhir/OperationDefinition/Multi-it-validate"
* insert Expectation(rest[0].resource[3].operation[0], MAY)

// =============================================================================
// PractitionerRole
// =============================================================================
* rest[0].resource[4].type = #PractitionerRole
* insert Expectation(rest[0].resource[4], SHALL)
* rest[0].resource[4].supportedProfile[0] = "https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaPractitionerRole"
* insert Expectation(rest[0].resource[4].supportedProfile[0], SHALL)
* rest[0].resource[4].interaction[0].code = #read
* insert Expectation(rest[0].resource[4].interaction[0], SHALL)
* rest[0].resource[4].interaction[1].code = #search-type
* insert Expectation(rest[0].resource[4].interaction[1], SHALL)
* rest[0].resource[4].interaction[2].code = #create
* insert Expectation(rest[0].resource[4].interaction[2], SHALL)
* rest[0].resource[4].interaction[3].code = #update
* insert Expectation(rest[0].resource[4].interaction[3], SHALL)
* rest[0].resource[4].interaction[4].code = #patch
* insert Expectation(rest[0].resource[4].interaction[4], MAY)
* rest[0].resource[4].interaction[5].code = #delete
* insert Expectation(rest[0].resource[4].interaction[5], MAY)
* rest[0].resource[4].interaction[6].code = #vread
* insert Expectation(rest[0].resource[4].interaction[6], MAY)
* rest[0].resource[4].interaction[7].code = #history-instance
* insert Expectation(rest[0].resource[4].interaction[7], MAY)
* rest[0].resource[4].interaction[8].code = #history-type
* insert Expectation(rest[0].resource[4].interaction[8], MAY)
* rest[0].resource[4].versioning = #versioned-update
* rest[0].resource[4].searchParam[0].name = "date"
* rest[0].resource[4].searchParam[0].definition = "http://hl7.org/fhir/SearchParameter/PractitionerRole-date"
* rest[0].resource[4].searchParam[0].type = #date
* rest[0].resource[4].searchParam[0].documentation = "The period during which the practitioner is authorized to perform in these role(s)"
* insert Expectation(rest[0].resource[4].searchParam[0], MAY)
* rest[0].resource[4].searchParam[1].name = "identifier"
* rest[0].resource[4].searchParam[1].definition = "http://hl7.org/fhir/SearchParameter/PractitionerRole-identifier"
* rest[0].resource[4].searchParam[1].type = #token
* rest[0].resource[4].searchParam[1].documentation = "A practitioner's Identifier"
* insert Expectation(rest[0].resource[4].searchParam[1], SHALL)
* rest[0].resource[4].searchParam[2].name = "specialty"
* rest[0].resource[4].searchParam[2].definition = "http://hl7.org/fhir/SearchParameter/PractitionerRole-specialty"
* rest[0].resource[4].searchParam[2].type = #token
* rest[0].resource[4].searchParam[2].documentation = "The practitioner has this specialty at an organization"
* insert Expectation(rest[0].resource[4].searchParam[2], MAY)
* rest[0].resource[4].searchParam[3].name = "role"
* rest[0].resource[4].searchParam[3].definition = "http://hl7.org/fhir/SearchParameter/PractitionerRole-role"
* rest[0].resource[4].searchParam[3].type = #token
* rest[0].resource[4].searchParam[3].documentation = "The practitioner can perform this role at for the organization"
* insert Expectation(rest[0].resource[4].searchParam[3], MAY)
* rest[0].resource[4].searchParam[4].name = "practitioner"
* rest[0].resource[4].searchParam[4].definition = "http://hl7.org/fhir/SearchParameter/PractitionerRole-practitioner"
* rest[0].resource[4].searchParam[4].type = #reference
* rest[0].resource[4].searchParam[4].documentation = "Practitioner that is able to provide the defined services for the organization"
* insert Expectation(rest[0].resource[4].searchParam[4], SHALL)
* rest[0].resource[4].searchParam[5].name = "active"
* rest[0].resource[4].searchParam[5].definition = "http://hl7.org/fhir/SearchParameter/PractitionerRole-active"
* rest[0].resource[4].searchParam[5].type = #token
* rest[0].resource[4].searchParam[5].documentation = "Whether this practitioner role record is in active use"
* insert Expectation(rest[0].resource[4].searchParam[5], SHALL)
* rest[0].resource[4].searchParam[6].name = "endpoint"
* rest[0].resource[4].searchParam[6].definition = "http://hl7.org/fhir/SearchParameter/PractitionerRole-endpoint"
* rest[0].resource[4].searchParam[6].type = #reference
* rest[0].resource[4].searchParam[6].documentation = "Technical endpoints providing access to services operated for the practitioner with this role"
* insert Expectation(rest[0].resource[4].searchParam[6], MAY)
* rest[0].resource[4].searchParam[7].name = "phone"
* rest[0].resource[4].searchParam[7].definition = "http://hl7.org/fhir/SearchParameter/individual-phone"
* rest[0].resource[4].searchParam[7].type = #token
* insert Expectation(rest[0].resource[4].searchParam[7], MAY)
* rest[0].resource[4].searchParam[8].name = "service"
* rest[0].resource[4].searchParam[8].definition = "http://hl7.org/fhir/SearchParameter/PractitionerRole-service"
* rest[0].resource[4].searchParam[8].type = #reference
* rest[0].resource[4].searchParam[8].documentation = "The list of healthcare services that this worker provides for this role's Organization/Location(s)"
* insert Expectation(rest[0].resource[4].searchParam[8], MAY)
* rest[0].resource[4].searchParam[9].name = "organization"
* rest[0].resource[4].searchParam[9].definition = "http://hl7.org/fhir/SearchParameter/PractitionerRole-organization"
* rest[0].resource[4].searchParam[9].type = #reference
* rest[0].resource[4].searchParam[9].documentation = "The identity of the organization the practitioner represents / acts on behalf of"
* insert Expectation(rest[0].resource[4].searchParam[9], SHALL)
* rest[0].resource[4].searchParam[10].name = "telecom"
* rest[0].resource[4].searchParam[10].definition = "http://hl7.org/fhir/SearchParameter/individual-telecom"
* rest[0].resource[4].searchParam[10].type = #token
* insert Expectation(rest[0].resource[4].searchParam[10], MAY)
* rest[0].resource[4].searchParam[11].name = "location"
* rest[0].resource[4].searchParam[11].definition = "http://hl7.org/fhir/SearchParameter/PractitionerRole-location"
* rest[0].resource[4].searchParam[11].type = #reference
* rest[0].resource[4].searchParam[11].documentation = "One of the locations at which this practitioner provides care"
* insert Expectation(rest[0].resource[4].searchParam[11], MAY)
* rest[0].resource[4].searchParam[12].name = "_id"
* rest[0].resource[4].searchParam[12].definition = "http://hl7.org/fhir/SearchParameter/Resource-id"
* rest[0].resource[4].searchParam[12].type = #token
* rest[0].resource[4].searchParam[12].documentation = "Logical id of this artifact"
* insert Expectation(rest[0].resource[4].searchParam[12], SHALL)
* rest[0].resource[4].searchParam[13].name = "email"
* rest[0].resource[4].searchParam[13].definition = "http://hl7.org/fhir/SearchParameter/individual-email"
* rest[0].resource[4].searchParam[13].type = #token
* insert Expectation(rest[0].resource[4].searchParam[13], MAY)
* rest[0].resource[4].searchInclude[0] = "PractitionerRole:practitioner"
* insert Expectation(rest[0].resource[4].searchInclude[0], SHALL)
* rest[0].resource[4].searchInclude[1] = "PractitionerRole:organization"
* insert Expectation(rest[0].resource[4].searchInclude[1], SHALL)
* rest[0].resource[4].searchInclude[2] = "PractitionerRole:location"
* insert Expectation(rest[0].resource[4].searchInclude[2], MAY)
* rest[0].resource[4].searchInclude[3] = "PractitionerRole:service"
* insert Expectation(rest[0].resource[4].searchInclude[3], MAY)
* rest[0].resource[4].searchInclude[4] = "PractitionerRole:endpoint"
* insert Expectation(rest[0].resource[4].searchInclude[4], MAY)
* rest[0].resource[4].operation[0].name = "validate"
* rest[0].resource[4].operation[0].definition = "https://orgvz.ref.emiga-rki.de/fhir/OperationDefinition/Multi-it-validate"
* insert Expectation(rest[0].resource[4].operation[0], MAY)

// =============================================================================
// Bundle
// =============================================================================
* rest[0].resource[5].type = #Bundle
* insert Expectation(rest[0].resource[5], SHALL)
* rest[0].resource[5].supportedProfile[0] = "https://emiga.rki.de/fhir/vzd/StructureDefinition/OrgVBundle"
* insert Expectation(rest[0].resource[5].supportedProfile[0], SHALL)
* rest[0].resource[5].interaction[0].code = #read
* insert Expectation(rest[0].resource[5].interaction[0], MAY)
* rest[0].resource[5].interaction[1].code = #search-type
* insert Expectation(rest[0].resource[5].interaction[1], MAY)
* rest[0].resource[5].interaction[2].code = #create
* insert Expectation(rest[0].resource[5].interaction[2], MAY)
* rest[0].resource[5].interaction[3].code = #update
* insert Expectation(rest[0].resource[5].interaction[3], MAY)
* rest[0].resource[5].interaction[4].code = #vread
* insert Expectation(rest[0].resource[5].interaction[4], MAY)
* rest[0].resource[5].interaction[5].code = #history-instance
* insert Expectation(rest[0].resource[5].interaction[5], MAY)
* rest[0].resource[5].interaction[6].code = #history-type
* insert Expectation(rest[0].resource[5].interaction[6], MAY)
* rest[0].resource[5].versioning = #versioned-update
* rest[0].resource[5].searchParam[0].name = "identifier"
* rest[0].resource[5].searchParam[0].definition = "http://hl7.org/fhir/SearchParameter/Bundle-identifier"
* rest[0].resource[5].searchParam[0].type = #token
* rest[0].resource[5].searchParam[0].documentation = "Persistent identifier for the bundle"
* insert Expectation(rest[0].resource[5].searchParam[0], SHALL)
* rest[0].resource[5].searchParam[1].name = "message"
* rest[0].resource[5].searchParam[1].definition = "http://hl7.org/fhir/SearchParameter/Bundle-message"
* rest[0].resource[5].searchParam[1].type = #reference
* rest[0].resource[5].searchParam[1].documentation = "The first resource in the bundle, if the bundle type is \"message\" - this is a message header, and this parameter provides access to search its contents"
* insert Expectation(rest[0].resource[5].searchParam[1], MAY)
* rest[0].resource[5].searchParam[2].name = "type"
* rest[0].resource[5].searchParam[2].definition = "http://hl7.org/fhir/SearchParameter/Bundle-type"
* rest[0].resource[5].searchParam[2].type = #token
* rest[0].resource[5].searchParam[2].documentation = "document | message | transaction | transaction-response | batch | batch-response | history | searchset | collection"
* insert Expectation(rest[0].resource[5].searchParam[2], SHALL)
* rest[0].resource[5].searchParam[3].name = "composition"
* rest[0].resource[5].searchParam[3].definition = "http://hl7.org/fhir/SearchParameter/Bundle-composition"
* rest[0].resource[5].searchParam[3].type = #reference
* rest[0].resource[5].searchParam[3].documentation = "The first resource in the bundle, if the bundle type is \"document\" - this is a composition, and this parameter provides access to search its contents"
* insert Expectation(rest[0].resource[5].searchParam[3], MAY)
* rest[0].resource[5].searchParam[4].name = "_id"
* rest[0].resource[5].searchParam[4].definition = "http://hl7.org/fhir/SearchParameter/Resource-id"
* rest[0].resource[5].searchParam[4].type = #token
* rest[0].resource[5].searchParam[4].documentation = "Logical id of this artifact"
* insert Expectation(rest[0].resource[5].searchParam[4], SHALL)
* rest[0].resource[5].searchParam[5].name = "timestamp"
* rest[0].resource[5].searchParam[5].definition = "http://hl7.org/fhir/SearchParameter/Bundle-timestamp"
* rest[0].resource[5].searchParam[5].type = #date
* rest[0].resource[5].searchParam[5].documentation = "When the bundle was assembled"
* insert Expectation(rest[0].resource[5].searchParam[5], MAY)
* rest[0].resource[5].searchInclude[0] = "Bundle:composition"
* insert Expectation(rest[0].resource[5].searchInclude[0], MAY)
* rest[0].resource[5].searchInclude[1] = "Bundle:message"
* insert Expectation(rest[0].resource[5].searchInclude[1], MAY)
* rest[0].resource[5].operation[0].name = "validate"
* rest[0].resource[5].operation[0].definition = "https://orgvz.ref.emiga-rki.de/fhir/OperationDefinition/Multi-it-validate"
* insert Expectation(rest[0].resource[5].operation[0], MAY)
