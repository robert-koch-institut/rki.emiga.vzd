
RuleSet: Meta
* ^status = #active
* ^experimental = false
* ^publisher = "Robert Koch-Institut"


RuleSet: Security
* meta
  * security
    * ^slicing.discriminator.type = #value
    * ^slicing.discriminator.path = "system"
    * ^slicing.rules = #open
    * ^slicing.description = "Slicing security attribute by coding system"
    * ^slicing.ordered = false
  * security contains
      visibility 0..1 and
      responsibility 0..1
  * security[visibility] from ResourceVisibilityType
    * system = $ResourceVisibilityType
  * security[responsibility] from ResourceResponsibility
    * system = $ResourceResponsibility


RuleSet: ResourceCommon
* implicitRules 0..0


RuleSet: DomainResourceCommon
* text 0..0
* contained 0..0
* modifierExtension 0..0