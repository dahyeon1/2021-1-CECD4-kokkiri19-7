package Controller;

import org.json.simple.JSONObject;

import org.springframework.web.bind.annotation.*;


import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@RestController
public class DialogFlowWebhookController {

    @RequestMapping(value = "/pentode", method = {RequestMethod.GET, RequestMethod.POST})
    public @ResponseBody JSONObject webhook(HttpServletRequest request, @RequestBody Map<String, Object> map) {
        System.out.println("webhook=====" + map);

        JSONObject jsonObject = new JSONObject();
        JSONObject payloadObject = new JSONObject();
        JSONObject googleObject = new JSONObject();
        googleObject.put("expectUserResponse", false);
        payloadObject.put("google", googleObject);

        return jsonObject;
    }
}