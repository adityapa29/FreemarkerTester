package com.freemarkertester.service;

import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Service
public class MyServiceImpl implements MyService {
    @Override
    public Map<String, Object> createOrderAcknowledgement() throws ParseException {
        // Create a map to hold order details
        Map<String, Object> orderDetails = new HashMap<>();

        // Set common details
        orderDetails.put("customername", "John Doe");
        orderDetails.put("support_number", "123-456-7890");
        orderDetails.put("url", "https://accountsdev.medikabazaar.com/");
        orderDetails.put("emailType", "test");
        orderDetails.put("created_at", "Sep 18, 2024, 02:50 PM");
        orderDetails.put("gstnumber", "test");
        orderDetails.put("tax_title", "GST");
        orderDetails.put("currency_symbol", "Rs");
        orderDetails.put("custome_duty", true);


        Map<String, Object> salesOrder = new HashMap<>();
        salesOrder.put("increment_id", "ORD123456");
        Date testDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse("2024-09-30 14:45:00");
        salesOrder.put("created_at", testDate);
        salesOrder.put("order_from", 0);
        salesOrder.put("customer_firstname", "test");
        salesOrder.put("customer_lastname", "test");
        salesOrder.put("reference_order_no", "test");
        salesOrder.put("coupon_code", "test");
        salesOrder.put("finance_status", "test");
        salesOrder.put("total_canceled", 0);
        salesOrder.put("shipping_amount", 0);
        salesOrder.put("shipping_canceled", 0);
        salesOrder.put("cod_handling_fees", 0);
        salesOrder.put("platform_fees", 0);
        salesOrder.put("tax_amount", 0);
        salesOrder.put("custom_duty_amount", 0);
        salesOrder.put("discount_amount", 0);
        salesOrder.put("discount_canceled", 0);
        salesOrder.put("spend_amount", 0);
        salesOrder.put("grand_total", 0);
        salesOrder.put("tax_canceled", 0);
        salesOrder.put("isIncludeAnnexure", true);
        orderDetails.put("salesorder", salesOrder);

        // Set billing address
        Map<String, Object> billingAddress = new HashMap<>();
        billingAddress.put("address_type", "Billing");
        billingAddress.put("firstname", "John");
        billingAddress.put("lastname", "Doe");
        billingAddress.put("street", "123 Main St");
        billingAddress.put("city", "Mumbai");
        billingAddress.put("region", "Maharashtra");
        billingAddress.put("postcode", "400001");
        billingAddress.put("country_name", "India");
        billingAddress.put("telephone", "9876543210");
        orderDetails.put("addressbilling", billingAddress);

        // Set shipping address (similar to billing)
        Map<String, Object> shippingAddress = new HashMap<>();
        shippingAddress.put("address_type", "Shipping");
        shippingAddress.put("firstname", "John");
        shippingAddress.put("lastname", "Doe");
        shippingAddress.put("street", "123 Main St");
        shippingAddress.put("city", "Mumbai");
        shippingAddress.put("region", "Maharashtra");
        shippingAddress.put("postcode", "400001");
        shippingAddress.put("country_name", "India");
        shippingAddress.put("telephone", "9876543210");
        orderDetails.put("addressshipping", shippingAddress);

        // Set payment method
        Map<String, Object> paymentMethod = new HashMap<>();
        paymentMethod.put("method", "Credit Card");
        orderDetails.put("payment_method", paymentMethod);

        List<Map<String, Object>> orderItems = new ArrayList<>();
        // Example order item 1
        Map<String, Object> item1 = new HashMap<>();
        item1.put("name", "Product A");
        item1.put("sku", "SKU12345");
        item1.put("item_code", "TESTITEM1");
        item1.put("alternate_uom", "pcs");
        item1.put("qty_ordered", 10);
        item1.put("freeqty_order", 2);
        item1.put("price", 99.99);
        item1.put("discount_amount", 5.00);
        item1.put("discount_percent", 5.00);
        item1.put("tax_amount", 15.00);
        item1.put("tax_canceled", 0.00);
        item1.put("qty_canceled", 0);
        item1.put("tax_percent", 5.00);
        item1.put("cancelReason", ""); // No cancellation reason
        orderItems.add(item1);
        orderDetails.put("orderitem", orderItems);

        return orderDetails;
    }
}
