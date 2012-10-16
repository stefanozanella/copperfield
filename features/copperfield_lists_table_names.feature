Feature: Listing names of tables in database
  As a Copperfield user
  I want to print the list of defined tables
  So that I know if I need to add/remove tables in the migration

  @database_hit
  Scenario: Invoking from command line with "list" subcommand
    Given a database in "features/fixtures/test.db" with the following tables:
      | Name  |
      | one   |
      | two   |
      | three |
    When I run "copperfield list --database sqlite://features/fixtures/test.db" on the command line
    Then I see 
      """
      Tables found in database 'test.db':
      
      one
      two
      three

      """
