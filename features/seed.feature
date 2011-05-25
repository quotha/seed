Feature: As a Statistician, I want these stats to return the correct values

  Scenario: Batting Average
    Given the seed module
    And a hash with some stats
    Then the batting average method should give the correct average
    
  Scenario: On Base %
    Given the seed module
    And a hash with some more stats
    Then the on base percentage method should give the correct percentage
    
  Scenario: Slugging %
    Given the seed module
    And a hash with some more stats
    Then the slugging percentage method should give the correct percentage