import io.cucumber.junit.Cucumber;
import io.cucumber.junit.CucumberOptions;
import org.junit.runner.RunWith;


@RunWith(Cucumber.class)
@CucumberOptions(
        plugin = {"html:target/reports/cucumberReport.html", "json:target/reports/cucumberReport.json"},
        glue = "stepDefinitions",
        features = "src/test/resources/features",
        tags = "@smoke",
        dryRun = false

)
public class TestRunner {

}
