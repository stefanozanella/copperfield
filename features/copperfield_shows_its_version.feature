Feature: Checking Copperfield version
  As a Copperfield user
  I want to check the installed version from command line
  So that I know if I can upgrade

  Scenario: Invoking from command line with "version" subcommand
    Given Copperfield version is defined
    When I run "copperfield version" on the command line
    Then I see a message containing a SemVer version number
