package my.solent.smartport;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class SmartportApplication {

    @RequestMapping(value = "/index")
    public String hello(Model model, @RequestParam(value="name") String name) {
        model.addAttribute("name", name);
        return "index";
    }

    public static void main(String[] args) {
        SpringApplication.run(SmartportApplication.class, args);
    }

}
