package com.freemarkertester.controller;

import com.freemarkertester.service.MyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.text.ParseException;
import java.util.Map;

@Controller
public class MyController {

    @Autowired
    MyService myService;

    @GetMapping("/orderAcknowledgementPdf")
    public String orderAcknowledgementPdf(Model model) throws ParseException {
        Map<String, Object> orderDetails = myService.createOrderAcknowledgement();
        model.addAllAttributes(orderDetails);
        return "OrderAcknowledgementPdf";
    }

    @GetMapping("/pickAndPackRollback")
    public String pickAndPackRollback(Model model) {
        Map<String, Object> dataModel = myService.buildPickAndPackRollbackDataModel();
        model.addAllAttributes(dataModel);
        return "PickAndPackRollback";
    }
}
