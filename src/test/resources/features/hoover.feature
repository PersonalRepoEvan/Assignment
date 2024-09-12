Feature: Hoover Room Navigation and Dirt Cleaning


  @smoke @noDirtPatches
  Scenario: Hoover moves within bounds without any dirt patches
    Given the room dimensions are (5, 5)
    When the hoover starts at coordinates (2, 2)
    And there are no dirt patches
    When the hoover receives the instructions "NNEESS"
    Then the hoover should be at coordinates (4, 2)
    And the hoover should have cleaned 0 patches of dirt

  @smoke @noDirtPatches
  Scenario: Hoover stays still with no instructions and no dirt patches
    Given the room dimensions are (5, 5)
    When the hoover starts at coordinates (1, 1)
    And there are no dirt patches
    When the hoover receives the instructions ""
    Then the hoover should be at coordinates (1, 1)
    And the hoover should have cleaned 0 patches of dirt

  @smoke @noDirtPatches
  Scenario: Hoover hits the boundary and doesn't go outside the room
    Given the room dimensions are (3, 3)
    When the hoover starts at coordinates (2, 2)
    And there are no dirt patches
    When the hoover receives the instructions "EENN"
    Then the hoover should be at coordinates (2, 2)
    And the hoover should have cleaned 0 patches of dirt

  @smoke @noDirtPatches
  Scenario: Hoover moves with long instructions and no dirt patches
    Given the room dimensions are (10, 10)
    When the hoover starts at coordinates (5, 5)
    And there are no dirt patches
    When the hoover receives the instructions "NNWWEESS"
    Then the hoover should be at coordinates (5, 5)
    And the hoover should have cleaned 0 patches of dirt

  @smoke @noDirtPatches
  Scenario: Hoover moves through an empty room without any dirt patches
    Given the room dimensions are (5, 5)
    When the hoover starts at coordinates (0, 0)
    And there are no dirt patches
    When the hoover receives the instructions "SNNNNEEEESSSSWWWNNNEESSWN"
    Then the hoover should be at coordinates (2, 2)
    And the hoover should have cleaned 0 patches of dirt

  @smoke @noDirtPatches
  Scenario: Hoover receives invalid directions
    Given the room dimensions are (5, 5)
    When the hoover starts at coordinates (2, 2)
    And there are no dirt patches
    When the hoover receives the instructions "NZZ"
    Then the system should return an error

  @smoke @withDirtPatches
  Scenario: Hoover moves within bounds and doesn't clean any patches
    Given the room dimensions are (3, 3)
    When the hoover starts at coordinates (1, 1)
    And there are dirt patches at the following coordinates:
      | 0 | 0 |
      | 2 | 2 |
    When the hoover receives the instructions "NNSS"
    Then the hoover should be at coordinates (1, 0)
    And the hoover should have cleaned 0 patches of dirt

  @smoke @withDirtPatches
  Scenario: Hoover starts on a dirt patch and cleans it immediately
    Given the room dimensions are (4, 4)
    When the hoover starts at coordinates (2, 2)
    And there are dirt patches at the following coordinates:
      | 2 | 2 |
    When the hoover receives the instructions "N"
    Then the hoover should be at coordinates (2, 3)
    And the hoover should have cleaned 1 patches of dirt

  @smoke @withDirtPatches
  Scenario: Hoover starts outside the room
    Given the room dimensions are (5, 5)
    When the hoover starts at coordinates (6, 6)
    And there are dirt patches at the following coordinates:
      | 1 | 1 |
    When the hoover receives the instructions "NNEE"
    Then the system should return an error

  @smoke @withDirtPatches
  Scenario: Hoover does not receive any movement instructions
    Given the room dimensions are (5, 5)
    When the hoover starts at coordinates (1, 1)
    And there are dirt patches at the following coordinates:
      | 1 | 1 |
    When the hoover receives the instructions ""
    Then the hoover should be at coordinates (1, 1)
    And the hoover should have cleaned 0 patches of dirt

  @smoke @withDirtPatches
  Scenario: Hoover receives a single instruction
    Given the room dimensions are (5, 5)
    When the hoover starts at coordinates (2, 2)
    And there are dirt patches at the following coordinates:
      | 2 | 3 |
    When the hoover receives the instructions "N"
    Then the hoover should be at coordinates (2, 3)
    And the hoover should have cleaned 1 patches of dirt

  @smoke @withDirtPatches
  Scenario: Hoover encounters multiple dirt patches at the same location but cleans only once
    Given the room dimensions are (5, 5)
    When the hoover starts at coordinates (0, 0)
    And there are dirt patches at the following coordinates:
      | 1 | 1 |
      | 1 | 1 |
      | 1 | 1 |
    When the hoover receives the instructions "NE"
    Then the hoover should be at coordinates (1, 1)
    And the hoover should have cleaned 1 patches of dirt

  @smoke @withDirtPatches
  Scenario: Hoover starts on a dirt patch but doesn't clean it
    Given the room dimensions are (5, 5)
    When the hoover starts at coordinates (1, 1)
    And there are dirt patches at the following coordinates:
      | 1 | 1 |
      | 2 | 2 |
    When the hoover receives the instructions "N"
    Then the hoover should be at coordinates (1, 2)
    And the hoover should have cleaned 0 patches of dirt

  @smoke @withDirtPatches
  Scenario: Clean dirt patches and reach the final position
    Given the room dimensions are (5, 5)
    When the hoover starts at coordinates (1, 2)
    And there are dirt patches at the following coordinates:
      | 1 | 0 |
      | 2 | 2 |
      | 2 | 3 |
    When the hoover receives the instructions "NNESEESWNWW"
    Then the hoover should be at coordinates (1, 3)
    And the hoover should have cleaned 1 patches of dirt

  @smoke @withDirtPatches
  Scenario: Hoover in a large room with many dirt patches
    Given the room dimensions are (10, 10)
    When the hoover starts at coordinates (5, 5)
    And there are dirt patches at the following coordinates:
      | 6 | 6 |
      | 7 | 7 |
      | 8 | 8 |
    When the hoover receives the instructions "NENENE"
    Then the hoover should be at coordinates (8, 8)
    And the hoover should have cleaned 3 patches of dirt

  @smoke @withDirtPatches
  Scenario: Hoover moves within bounds and clean all patches
    Given the room dimensions are (3, 3)
    When the hoover starts at coordinates (0, 0)
    And there are dirt patches at the following coordinates:
      | 0 | 0 |
      | 1 | 0 |
      | 2 | 0 |
      | 0 | 1 |
      | 1 | 1 |
      | 2 | 1 |
      | 0 | 2 |
      | 1 | 2 |
      | 2 | 2 |
    When the hoover receives the instructions "EENWWNEE"
    Then the hoover should be at coordinates (2, 2)
    And the hoover should have cleaned 9 patches of dirt

