Feature: As a Statistician, I want these stats to return the correct values

  Scenario: Batting Average
    Given the seed module
    And a hash with some stats
    Then the batting average method should give the correct average
    
  Scenario: On Base %
    Given the seed module
    And a hash with some stats
    Then the on base percentage method should give the correct percentage
    
  Scenario: Slugging %
    Given the seed module
    And a hash with some stats
    Then the slugging percentage method should give the correct percentage
    
  Scenario: On Base Plus Slugging
    Given the seed module
    And a hash with some stats
    Then the on base plus slugging method should give the correct percentage

  Scenario: Runs Created
    Given the seed module
    And a hash with some stats
    Then runs created method should give the correct value
    
  Scenario: ERA
    Given the seed module
    And a hash with some pitching stats
    Then the earned run average method should give the correct average
    
  Scenario: WHIP
    Given the seed module
    And a hash with some pitching stats
    Then the whip method should give the correct value