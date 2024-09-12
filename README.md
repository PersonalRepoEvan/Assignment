# Testing Framework for Platform Science SDET Assignment

## Overview
This project provides a comprehensive testing framework designed to validate and ensure the functionality of services deployed via Docker. The framework utilizes Maven to manage dependencies, compile code and run tests. It includes automated API testing using tools like JUnit, Cucumber, and RestAssured.

## Testing Framework Setup Instructions:

### Prerequisites
Ensure that the following tools are installed on your system:
* Java Development Kit (JDK 21).
* Apache Maven.
* Docker.
* IDE (optional).

### Building the service
1. Make sure you have Docker running. If not, start Docker.
2. From the root of the service repository, run the following commands:
   * `sudo chmod +x service/run.sh`
3. Build the docker image:
   * `docker build -t pltsci-sdet-assignment service`
4. Run the service container:
   * `docker run -d -p 8080:8080 --name pltsci-sdet-service pltsci-sdet-assignment`

### Setup instructions
1. Clone the repository 
   * `git clone`
   * `cd <repository_folder`
2. Install Dependencies
   * `mvn clean install -DskipTests`
3. Run the Tests
   * `mvn test`

## Explanation of the Project Structure:
   * `src/test`: Contains all test related resources.
     * `src/test/java/stepDefinitions`: Java classes that define step implementations for Cucumber tests.
     * `src/test/java/TestRunner.java`: The `TestRunner` class is the entry point for running the Cucumber tests. It sets up the Cucumber options and specifies where the feature files and step definitions are located.
     * `src/test/resources/features`: Feature files written in Gherkin syntax that describe the test scenarios.
   * `target/reports/` : This folder contains the generated test reports, as configured in the `TestRunner` class.
     * `cucumberReport.html`: HTML report that provides a visual representation of the test results.
     * `cucumberReport.json`: JSON report for further analysis or integration with other tools

## Explanation of Test Scenarios:

### Overview
Due to a known bug in the Hoover service, when the tests are run for the first time, 3 out of the 16 test cases will fail. The failures occur for the following reasons:
   * The Hoover does not clean the dirt patch where it starts, even if a dirt patch is present at the starting position.
   * The Hoover can incorrectly be given a start position outside the predefined room size, which should trigger an error but doesn't.

If the tests are run again without restarting the Hoover service, the stored dirt patch data will cause 5 additional test failures, resulting in a total of 8 failed tests and 8 successful tests. To ensure accurate results, the Hoover service must be restarted between test runs.

Note: Once this bug is fixed, all 16 test cases are expected to run successfully without any failures.

1. Scenario: Hoover moves within bounds without any dirt patches
   * Explanation: This scenario checks whether the Hoover can move within the room's boundaries without cleaning any dirt patches, as none exist. It tests movement commands and ensures the Hoover stays within the limits of the room.

2. Scenario: Hoover stays still with no instructions and no dirt patches
   * Explanation: This scenario tests that when no movement instructions are given, the Hoover remains stationary, and no cleaning occurs since there are no dirt patches.

3. Scenario: Hoover hits the boundary and doesn't go outside the room
   * Explanation: Verifies that when the Hoover receives movement instructions that would take it beyond the room's boundaries, it remains within the room, testing boundary restrictions.

4. Scenario: Hoover moves with long instructions and no dirt patches
   * Explanation: This scenario tests the Hoover's ability to follow a longer sequence of movement instructions without cleaning any patches in an empty room.

5. Scenario: Hoover moves through an empty room without any dirt patches
   * Explanation: This scenario simulates the Hoover moving through a large empty room using complex movement instructions, confirming that it stays within bounds and cleans no patches of dirt.

6. Scenario: Hoover receives invalid directions
   * Explanation: Tests how the Hoover handles invalid movement instructions, expecting the system to return an error.

7. Scenario: Hoover moves within bounds and doesn't clean any patches
   * Explanation: This scenario checks that the Hoover navigates without cleaning any dirt patches, even if they are present, as it doesn’t cross the patches.

8. Scenario: Hoover starts on a dirt patch and cleans it immediately
   * Explanation: Verifies that the Hoover correctly cleans a dirt patch if it starts on it and then moves according to the instructions.

9. Scenario: Hoover starts outside the room
   * Explanation: Tests how the system responds when the Hoover starts outside the room's dimensions, expecting the system to return an error.

10. Scenario: Hoover does not receive any movement instructions
    * Explanation: Verifies that the Hoover stays in its starting position and doesn’t clean any patches if no movement instructions are provided.

11. Scenario: Hoover receives a single instruction
    * Explanation: Tests the Hoover’s ability to follow a single movement command and clean a dirt patch if present in the destination coordinates.

12. Scenario: Hoover encounters multiple dirt patches at the same location but cleans only once
    * Explanation: Verifies that if multiple dirt patches are defined at the same coordinates, the Hoover cleans it only once when it reaches that position.

13. Scenario: Hoover starts on a dirt patch but doesn't clean it
    * Explanation: This tests that the Hoover doesn’t clean a patch unless explicitly commanded to move off and back onto the patch, simulating that it needs a command to trigger cleaning.

14. Scenario: Clean dirt patches and reach the final position
    * Explanation: Tests the Hoover's ability to clean dirt patches along the path and ensures it reaches the expected final coordinates.

15. Scenario: Hoover in a large room with many dirt patches
    * Explanation: This scenario checks the Hoover's movement through a larger room, ensuring it cleans multiple patches of dirt located at different positions.

16. Scenario: Hoover moves within bounds and cleans all patches
    * Explanation: Verifies that the Hoover can follow the given instructions, stay within bounds, and clean all the dirt patches present in the room.

## Summary of the Technology Stack

* Java 21: Main programming language.
* Apache Maven: Build and dependency management tool.
* Cucumber: For BDD testing and writing Gherkin-based scenarios.
* JUnit 5: For executing unit and integration tests, with assertions and validations in the tests.
* RestAssured: For API testing.
* Jackson and Gson: For JSON serialization and deserialization.
* Maven Compiler Plugin: Used to compile the Java code.
* Postman: Used for manual API testing of various scenarios.





