
// Metadaten-Elemente, die sich alle Profile teilen
RuleSet: MetadataProfile
* ^status = #active
* ^experimental = false
* ^publisher = "Robert Koch-Institut"

// Metadaten-Elemente, die sich alle Terminologie-Ressourcen teilen
RuleSet: MetadataTerminology
* ^language = #de-DE
* ^status = #active
* ^experimental = false
* ^publisher = "Robert Koch-Institut"
* ^contact.name = "Robert Koch-Institut"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "https://rki.de"

// Profil-Regeln, die für alle Ressourcen gelten
RuleSet: ProfileResourceCommon
* id 0..1
* implicitRules 0..0
* language 0..1 

// Profil-Regeln, die für alle Domain-Ressourcen gelten
RuleSet: ProfileDomainResourceCommon
* text 0..0
* contained 0..0
* modifierExtension 0..0

// Profil-Regeln, die für alle Ressourcen, die sicherheitstechnisch eingestuft werden müssen, gelten
RuleSet: ProfileSecurityTags
* meta MS
  * security 2.. MS
    * ^slicing.discriminator.type = #value
    * ^slicing.discriminator.path = "system"
    * ^slicing.rules = #open
    * ^slicing.description = "Slicing security attribute by coding system"
    * ^slicing.ordered = false
  * security contains
      visibility 1..1 MS and
      responsibility 1..1 MS
  * security[visibility] from $ResourceVisibilityTypeVS
    * system 1..1 MS
    * system = $ResourceVisibilityType
    * code 1..1 MS
  * security[responsibility] from $ResourceResponsibilityVS
    * system 1..1 MS
    * system = $ResourceResponsibility
    * code 1..1 MS

RuleSet: ProfileMetaTags
* meta.tag MS
* meta.tag ^slicing.discriminator.type = #pattern
* meta.tag ^slicing.discriminator.path = "system"
* meta.tag ^slicing.rules = #open
* meta.tag contains relevance 0..* MS and 
    orgvBundleId 0..1 MS and orgvBundleVersion 0..1 MS
* meta.tag[relevance] from $RelevanceVS (required)
* meta.tag[relevance].system 1.. MS
* meta.tag[relevance].system = $RelevanceCS
* meta.tag[relevance].code 1.. MS
* meta.tag[relevance].display MS
* meta.tag[orgvBundleId] from $BundleIdVS (preferred)
* meta.tag[orgvBundleId].system 1.. MS
* meta.tag[orgvBundleId].system = $BundleIdCS
* meta.tag[orgvBundleId].code MS 
* meta.tag[orgvBundleId].display MS
* meta.tag[orgvBundleVersion] from $BundleVersionVS (preferred)
* meta.tag[orgvBundleVersion].system 1.. MS
* meta.tag[orgvBundleVersion].system = $BundleVersionCS 
* meta.tag[orgvBundleVersion].code MS
* meta.tag[orgvBundleVersion].display MS

RuleSet: MetaTagOrgVBundle
* meta.tag MS
* meta.tag ^slicing.discriminator.type = #pattern
* meta.tag ^slicing.discriminator.path = "system"
* meta.tag ^slicing.rules = #open
* meta.tag contains orgvBundleId 0..1 MS and orgvBundleVersion 0..1 MS
* meta.tag[orgvBundleId] from $BundleIdVS (preferred)
* meta.tag[orgvBundleId].system 1.. MS
* meta.tag[orgvBundleId].system = $BundleIdCS
* meta.tag[orgvBundleId].code MS 
* meta.tag[orgvBundleId].display MS
* meta.tag[orgvBundleVersion] from $BundleVersionVS (preferred)
* meta.tag[orgvBundleVersion].system 1.. MS
* meta.tag[orgvBundleVersion].system = $BundleVersionCS 
* meta.tag[orgvBundleVersion].code MS
* meta.tag[orgvBundleVersion].display MS

RuleSet: ProfileMetaProfileTags
* meta.profile MS
* meta.profile ^slicing.discriminator.type = #value
* meta.profile ^slicing.discriminator.path = "$this"
* meta.profile ^slicing.rules = #open
* meta.profile contains emigaprofile 0..* MS



// Standardprofil für die strikte Ausgestaltung von CodableConcepts, die lediglich ein Coding-Element zulässt
RuleSet: StrictCodableConcept
* coding 1..1 MS
  * system 1..1 MS
  * version 0..1 MS
  * code 1..1 MS
  * display 0..1 MS
* text 0..0

// Standardprofil für die strikte Ausgestaltung von Codings (system + code sind verpflichtend)
RuleSet: StrictCoding
* system 1..1 MS
* version 0..1 MS
* code 1..1 MS
* display 0..1 MS
