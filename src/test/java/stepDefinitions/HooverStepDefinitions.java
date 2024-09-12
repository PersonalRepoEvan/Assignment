package stepDefinitions;

import io.cucumber.java.en.*;
import io.restassured.RestAssured;
import io.restassured.response.Response;
import org.junit.jupiter.api.Assertions;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class HooverStepDefinitions {

    private Map<String, Object> requestBody = new HashMap<>();
    private Response response;



    @Given("the room dimensions are \\({int}, {int})")
    public void the_room_dimensions_are(Integer x, Integer y) {
        requestBody.put("roomSize", new int[] {x, y});
    }

    @When("the hoover starts at coordinates \\({int}, {int})")
    public void the_hoover_starts_at_coordinates(Integer x, Integer y) {
        requestBody.put("coords", new int[] {x, y});
    }

    @When("there are dirt patches at the following coordinates:")
    public void there_are_dirt_patches_at_the_following_coordinates(io.cucumber.datatable.DataTable dataTable) {
        requestBody.put("patches", dataTable.asLists(Integer.class));
    }

    @When("there are no dirt patches")
    public void there_are_no_dirt_patches() {
        requestBody.put("patches", new ArrayList<>());
    }

    @Then("the system should return an error")
    public void the_system_should_return_an_error() {
        response.then()
                .statusCode(400);
    }

    @When("the hoover receives the instructions {string}")
    public void the_hoover_receives_the_instructions(String instructions) {
        requestBody.put("instructions", instructions);

        response = RestAssured.given()
                .contentType("application/json")
                .body(requestBody)
                .when()
                .post("http://localhost:8080/v1/cleaning-sessions");
        System.out.println("Response Body: " + response.getBody().asString());

    }

    @Then("the hoover should be at coordinates \\({int}, {int})")
    public void the_hoover_should_be_at_coordinates(Integer x, Integer y) {
        int[] finalCoords = response.jsonPath().getObject("coords", int[].class);
        Assertions.assertEquals(x, finalCoords[0]);
        Assertions.assertEquals(y, finalCoords[1]);

    }

    @Then("the hoover should have cleaned {int} patches of dirt")
    public void the_hoover_should_have_cleaned_patch_of_dirt(Integer cleanedPatches) {
        int patchesCleaned = response.jsonPath().getInt("patches");
        Assertions.assertEquals(cleanedPatches, patchesCleaned);
    }
}
