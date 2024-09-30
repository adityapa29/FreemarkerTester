<#-- Order Acknowledgement Template -->
<html>
<head>
    <title>Order Acknowledgement</title>
</head>
<body style="font-size: 12px;line-height: 1;background-color: #fff;margin: 0;padding: 0;-webkit-font-smoothing: antialiased;font-family: 'Open Sans', sans-serif;-webkit-text-size-adjust: 100%;-ms-text-size-adjust: 100%;font-size:12px;margin:0;width:100%!important;height:100%;">
<div style="max-width: 850px; margin: 0 auto;background-color:#fff;border:1px solid #e0e0e0;" class="email-container">
    <table class="wrapper" width="95%" border="0" cellspacing="0" cellpadding="0" align="center" style='border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;border-spacing: 0;-webkit-text-size-adjust: 100%;-ms-text-size-adjust: 100%;'>
        <tr style='background-color: #fff;'>
            <td width="40%" style='font-size: 12px;line-height: 1;padding: 0;padding:15px 15px 15px 0;'>
              TODO <#-- <img src="${asset('images/logo.png')}" style='border: none;outline: none;text-decoration: none;display: inline-block;height: auto;' /> -->
            </td>
            <td width="40%" style='font-size: 12px;line-height: 1;padding: 0;padding:15px 15px 15px 0;text-align:right;'>
                Customer Care: ${support_number}
            </td>
        </tr>
    </table>
    <table align="center" role="presentation" cellspacing="0" cellpadding="0" border="0" width="100%" style="border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;border-spacing: 0;-webkit-text-size-adjust: 100%;-ms-text-size-adjust: 100%;margin: auto;">
        <tr>
            <td class="bg_white logo" style="font-size: 12px;line-height: 1;padding: 0;padding:0.5em;height:125px;text-align: left;vertical-align: middle;background-color:#2a4689;width: 40%;"> </td>
        </tr>
    </table>
    <table class="wrapper" width="95%" border="0" cellspacing="0" cellpadding="0" align="center" style='border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;border-spacing: 0;-webkit-text-size-adjust: 100%;-ms-text-size-adjust: 100%;background-color: #fff;margin:-90px auto 0px auto;border: 1px solid #e0e0e0;border-bottom: 0;'>
        <tr>
            <td style='font-size: 12px;line-height: 1;padding: 0;padding:15px 20px 0;font-size: 13px;'>
                <b>Dear
                    <#if emailType?exists && (emailType == 'rejectedByFinance' || emailType == 'approvedByFinance' || emailType == 'rejectedByProcurement' || emailType == 'approvedByProcurement' || emailType == 'pendingForProcurement')>
                    ${customername}
                    <#else>
                    ${salesorder.customer_firstname} ${salesorder.customer_lastname}
                </#if>
                ,</b>
            </td>
        </tr>
        <tr>
            <td style='font-size: 12px;line-height: 1;padding: 0;padding:15px 20px;'>
                <p style='margin: 8px 0;padding: 0;line-height: 17px;'>
                    Thank you for ordering from Medikabazaar. Your order details are given below. Once your package is shipped, we will share the tracking number with you. You may <a href='${url}/login' style="color: #2a4689;font-weight: 700;text-decoration: underline;">Login</a> to your account and check the status of your order.
                </p>
            </td>
        </tr>
    </table>
    <table class="wrapper" width="95%" border="0" cellspacing="0" cellpadding="0" align="center" style='border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;border-spacing: 0;-webkit-text-size-adjust: 100%;-ms-text-size-adjust: 100%;'>
        <tr style='background-color:#fff;border-top:1px solid #e0e0e0;'>
            <td colspan='2' style='text-align:right;width:100%;line-height: 1;padding: 0;padding:15px 20px;font-size: 14px;'>
                <b>Order Acknowledgement / Bill Of Supply / Cash Memo</b>
            </td>
        </tr>
    </table>
    <table class="wrapper" width="95%" border="0" cellspacing="0" cellpadding="0" align="center" style='border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;border-spacing: 0;-webkit-text-size-adjust: 100%;-ms-text-size-adjust: 100%;'>
        <#if salesorder.order_from == 0 && salesorder.finance_status == "" && (emailType?contains("orderConfirmation") || emailType?contains("orderAcknowledgement"))>
        <tr>
            <td colspan="2" style='font-size: 12px;line-height: 1;padding: 0;padding:15px 20px 15px 0;font-size: 14px;color:#F00;'>
                This Order Acknowledgement is for Internal Reference only and should not be sent to the Customer
            </td>
        </tr>
    </#if>
    <tr style='background-color:#F5FBFF;border:1px solid #e0e0e0;'>
        <td style='font-size: 12px;line-height: 1;padding: 0;padding:15px 20px;font-size: 14px;'>
            Your Order<b> #${salesorder.increment_id}</b>
        </td>
        <#assign created_at = salesorder.created_at />
        <#assign currentCreatedDateFlag = true>
        <#if isResendOrderAcknowledgement?exists && isResendOrderAcknowledgement == true>
        <#assign currentCreatedDateFlag = false>
    </#if>
    <td style='font-size: 12px;line-height: 1;padding: 0;padding:15px 20px;text-align:right;line-height: 18px;'>
        <#if salesorder.order_from == 0 && (emailType?contains("orderConfirmation") || emailType?contains("orderAcknowledgement")) && currentCreatedDateFlag>
        Order Placed on <b>${"?" + "date('M d, Y, h:i A')"?string}</b>
        <#else>
        Order Placed on <b>${created_at?string("MMMM d, yyyy, h:mm a")}</b>
    </#if>
    </div>
    </body>
    <tr style='background-color: #fff;'>
        <td width='50%' style='font-size: 12px;line-height: 1;padding: 0;border:1px solid #e0e0e0;padding:10px 20px;vertical-align:top;color:#333;'>
            <p style="margin: 8px 0;padding: 0;line-height: 17px;font-size: 13px;margin-bottom: 0;"><b>From,</b></p>
            <p style='margin: 8px 0;padding: 0;line-height: 20px;'> Boston Ivy Healthcare Solutions Pvt Ltd.  <br/> Technopolis Knowledge Park, C Wing, Ground Floor, <br/>  Unit No. 17/18/19/21, Mahakali Caves Road, Opp. Holy Family High School, <br/> Andheri (East), Mumbai - 400093, Maharashtra, India.</p>
            <p style='margin: 8px 0;padding: 0;line-height: 17px;'><b>GSTN</b>: 27AAFCB5524J1ZM</p>
        </td>
        <td width='50%' style='font-size: 12px;line-height: 1;padding: 0;border:1px solid #e0e0e0;padding:10px 20px;vertical-align:middle;color:#333;'>
            <p style="margin: 8px 0;padding: 0;line-height: 17px;font-size: 13px;"><strong>Customer Care</strong></p>
            <p style="margin: 8px 0;padding: 0;line-height: 17px;font-size: 13px;"><strong>Mobile Number</strong>: ${support_number}</p>
            <p style="margin: 8px 0;padding: 0;line-height: 17px;font-size: 13px;"><strong>Email</strong>: <a href='mailto:support@medikabazaar.com' style="color: #2a4689;font-weight: 700;text-decoration: none;"> support@medikabazaar.com </a></p>
        </td>
    </tr>
    <tr style='background-color: #fff;'>
        <td width='50%' style='font-size: 12px;line-height: 1;padding: 0;border:1px solid #e0e0e0;padding:10px 20px;vertical-align:top;color:#333;'>
            <p style="margin: 8px 0;padding: 0;line-height: 17px;font-size: 13px;"><b>Payment Method</b></p>
            <p style='margin: 8px 0;padding: 0;line-height: 17px;'>
                <#if payment_method.method == "checkmo">
                NEFT/Cheque
                <#elseif payment_method.method == "directpay">
                Credit Wallet
                <#else>
                ${payment_method.method?cap_first}
            </#if>
            </td>
            <#if salesorder.reference_order_no?exists && salesorder.reference_order_no?has_content>
            <p style='margin: 8px 0;padding: 0;line-height: 17px;'><b>Reference Order No.</b> : ${salesorder.reference_order_no} </p>
            </#if>
        <td width='50%' style='font-size: 12px;line-height: 1;padding: 0;border:1px solid #e0e0e0;padding:10px 20px;vertical-align:top;color:#333;'>
            <p style="margin: 8px 0;padding: 0;line-height: 17px;font-size: 13px;"><b>Shipping Method</b></p>
            <p style='margin: 8px 0;padding: 0;line-height: 17px;'>Flat Rate</p>
        </td>
    </tr>
    <tr style='background-color: #f8f8f8;'>
        <td width='50%' style='font-size: 12px;line-height: 1;padding: 0;border:1px solid #e0e0e0;padding:10px 20px;vertical-align:top;color:#333;'>
            <p style="margin: 8px 0;padding: 0;line-height: 17px;font-size: 13px;">
                <b>${addressbilling.address_type?cap_first} Info</b>
            </p>
            <p style='margin: 8px 0;padding: 0;line-height: 20px;'>${addressbilling.firstname} ${addressbilling.lastname}, ${addressbilling.street}, ${addressbilling.city}, <#if addressbilling.region?exists> ${addressbilling.region}, </#if> ${addressbilling.postcode}</td>
            <p style='margin: 8px 0;padding: 0;line-height: 17px;'>${addressbilling.country_name}</p>
            <p style='margin: 8px 0;padding: 0;line-height: 17px;'><b>Mobile Number:</b> ${addressbilling.telephone}</p>
            <p style='margin: 8px 0;padding: 0;line-height: 17px;'><b>GSTN:</b> ${gstnumber}</p>
            <#if drugLicenseNumber?exists && drugLicenseNumber?length > 1>
            <p style='margin: 8px 0;padding: 0;line-height: 17px;'><b>Drug Licence Number:</b> ${drugLicenseNumber}</p>
        </#if>
        </td>
        <td width='50%' style='font-size: 12px;line-height: 1;padding: 0;border:1px solid #e0e0e0;padding:10px 20px;vertical-align:top;color:#333;'>
            <p style="margin: 8px 0;padding: 0;line-height: 17px;font-size: 13px;"><b>${addressshipping.address_type?cap_first} Info</b></p>
            <p style='margin: 8px 0;padding: 0;line-height: 20px;'>${addressshipping.firstname} ${addressshipping.lastname}, ${addressshipping.street}, ${addressshipping.city}, <#if addressshipping.region?exists> ${addressshipping.region}, </#if> ${addressshipping.postcode}</p>
            <p style='margin: 8px 0;padding: 0;line-height: 17px;'>${addressshipping.country_name} </p>
            <p style='margin: 8px 0;padding: 0;line-height: 17px;'><b>Mobile Number:</b> ${addressshipping.telephone}</p>
        </td>
    </tr>
    </html>
    <table class="wrapper" width="95%" border="0" cellspacing="0" cellpadding="0" align="center" style='border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;border-spacing: 0;-webkit-text-size-adjust: 100%;-ms-text-size-adjust: 100%;margin-top:8px;'>
        <tr style='background-color:#fff;'>
            <td style='border:1px solid #e0e0e0;padding:10px 5px;vertical-align:top;color:#333;text-align:left;width:30%;font-weight:bold;'>Products</td>
            <td style='border:1px solid #e0e0e0;padding:10px 5px;vertical-align:top;color:#333;text-align:left;width:30%;font-weight:bold;'>UOM</td>
            <td style='border:1px solid #e0e0e0;padding:10px 5px;vertical-align:top;color:#333;text-align:right;font-weight:bold;width:10%;'>Qty</td>
            <td style='border:1px solid #e0e0e0;padding:10px 5px;vertical-align:top;color:#333;text-align:right;font-weight:bold;width:7%;'>Free Qty</td>
            <td style='border:1px solid #e0e0e0;padding:10px 5px;vertical-align:top;color:#333;text-align:right;font-weight:bold;width:15%;'>Unit Price</td>
            <td style='border:1px solid #e0e0e0;padding:10px 5px;vertical-align:top;color:#333;text-align:right;font-weight:bold;width:13%;'>Discount Amt</td>
            <td style='border:1px solid #e0e0e0;padding:10px 5px;vertical-align:top;color:#333;text-align:right;font-weight:bold;width:15%;'>${tax_title} Amt</td>
            <td style='border:1px solid #e0e0e0;padding:10px 5px;vertical-align:top;color:#333;text-align:right;font-weight:bold;width:20%;'>Total Excl. GST</td>
        </tr>
        <#assign subtotal = 0 />
        <#assign currency_symbol = currency_symbol />
        <#list orderitem as item>
        <#assign qty = item.qty_ordered - item.qty_canceled />
        <#assign discount_amt = item.discount_amount />
        <#assign subtotal = subtotal + (item.price * qty) />
        <#assign rowtotal = (item.price * qty) - discount_amt />
        <tr style='background-color:#fff;'>
            <td style='border:1px solid #e0e0e0;padding:15px 5px;vertical-align:middle;color:#333;text-align:left;width:23%;margin-top:0;'>
                <p style='margin-top:0;'><b>${item.name}</b></p>
                <p> SKU : ${item.sku} </p>
            <#if item.item_code?exists>
                <p> Item Code : ${item.item_code} </p>
            </#if>
            </td>
            <td style='border:1px solid #e0e0e0;padding:15px 5px;vertical-align:middle;color:#333;text-align:right;width:8%;'>${item.alternate_uom}</td>
            <td style='border:1px solid #e0e0e0;padding:15px 5px;vertical-align:middle;color:#333;text-align:right;width:8%;'>${item.qty_ordered?number}</td>
            <td style='border:1px solid #e0e0e0;padding:15px 5px;vertical-align:middle;color:#333;text-align:right;width:8%;'>${item.freeqty_order?number}</td>
            <td style='border:1px solid #e0e0e0;padding:15px 5px;vertical-align:middle;color:#333;text-align:right;width:21%;'> <span style="font-family: DejaVu Sans; sans-serif;">${currency_symbol}</span> ${item.price}</td>
            <td style='border:1px solid #e0e0e0;padding:15px 5px;vertical-align:middle;color:#333;text-align:right;width:18%;'>
                <span style="font-family: DejaVu Sans; sans-serif;">${currency_symbol}</span> ${item.discount_amount} <br />
                <#if item.discount_percent??>
                (${item.discount_percent} %)
            </#if>
            </td>
            <td style='border:1px solid #e0e0e0;padding:15px 5px;vertical-align:middle;color:#333;text-align:right;width:7%;'>
                <p><span style="font-family: DejaVu Sans; sans-serif;">${currency_symbol}</span> ${item.tax_amount - item.tax_canceled} <br /> ( ${item.tax_percent} %)</p>
            </td>
            <td style='border:1px solid #e0e0e0;padding:15px 5px;vertical-align:middle;color:#333;text-align:right;width:17%;'>
                <p><span style="font-family: DejaVu Sans; sans-serif;">${currency_symbol}</span>${rowtotal}</p>
            </td>
        </tr>
    </#list>
    </table>
    <#-- End of order items loop -->
<tr style='background-color:#fff;'>
    <td rowspan='9' colspan='4' style='font-size: 12px;line-height: 1;padding: 0;border:1px solid #e0e0e0;padding:10px 15px;vertical-align:top;color:#333;text-align:left;'>
        <b>Disclaimer:</b> <br>
        <p style="padding:0;line-height:15px;margin:8px 0;">1. Any receipt of electronic or other forms of order confirmation do not signify the Company's acceptance or confirmation of User's Order.</p>
        <p style="padding:0;line-height:15px;margin:8px 0;">2. The Company reserves the right to accept, modify or cancel the Order at any time before dispatching the Order. The Company may require additional verifications or information before accepting any order.</p>
        <p style="padding:0;line-height:15px;margin:8px 0;">3. Any change in order quantity shall be confirmed with the user before dispatch.</p>
        <p style="padding:0;line-height:15px;margin:8px 0;">4. User shall be entitled to cancel an order by calling the helpline from the registered mobile number or by sending an email from the registered email id.</p>
        <p style="padding:0;line-height:15px;margin:8px 0;">5. "Cancel Order" request can be placed any time after booking of order but before the order shipping.</p>
        <p style="padding:0;line-height:15px;margin:8px 0;">Additional Note: This disclaimer applies to general terms and conditions. Specific products or services may have additional terms that can be found on their respective product pages or communicated separately.</p>
        <#if salesorder.total_canceled??>
        <p style="background:aqua;padding:0;line-height:15px;margin:8px 0;">Cancellation Note – </br></br></p>
        <#assign i = 0 />
        <#list orderitem as item>
        <#if item.qty_canceled??>
        <#assign i = i + 1 />
        <p style="background:aqua;padding:0;line-height:15px;margin:8px 0;">
            ${i}) ${item.name}, Qty - ${item.qty_canceled?int} Cancelled - ${item.cancelReason!}
        </p>
    </#if>
</#list>
</#if>
</td>
<td colspan='3'>
    <table style='border:1px solid #e0e0e0;border-collapse: collapse; width:100%;'>
        <tr style='background-color:#fff;'>
            <td style='font-size: 12px;line-height: 1;padding: 0;border:1px solid #e0e0e0;padding:10px 15px;vertical-align:top;color:#333;text-align:right; width: 50%;'>Subtotal</td>
            <td style='font-size: 12px;line-height: 1;padding: 0;border:1px solid #e0e0e0;padding:10px 15px;vertical-align:top;color:#333;text-align:right; width: 50%;'>
                <span style="font-family: DejaVu Sans; sans-serif;">${currency_symbol}</span> ${subtotal}
            </td>
        </tr>
        <tr style='background-color:#fff;'>
            <td style='border:1px solid #e0e0e0;padding:10px;vertical-align:middle;color:#333;text-align:right;font-size: 12px;line-height: 1;'>Shipping & Handling</td>
            <td style='border:1px solid #e0e0e0;padding:10px;vertical-align:middle;color:#333;text-align:right;font-size: 12px;line-height: 1;'>
                <span style="font-family: DejaVu Sans; sans-serif;">${currency_symbol}</span> ${salesorder.shipping_amount - salesorder.shipping_canceled}
            </td>
        </tr>
        <#if salesorder.cod_handling_fees??>
        <tr style='background-color:#fff;'>
            <td style='border:1px solid #e0e0e0;padding:10px;vertical-align:middle;color:#333;text-align:right;font-size: 12px;line-height: 1;'>COD Convenience Fee</td>
            <td style='border:1px solid #e0e0e0;padding:10px;vertical-align:middle;color:#333;text-align:right;font-size: 12px;line-height: 1;'>
                <span style="font-family: DejaVu Sans; sans-serif;">${currency_symbol}</span> ${salesorder.cod_handling_fees - salesorder.shipping_canceled}
            </td>
        </tr>
    </#if>
    <#if salesorder.platform_fees??>
    <tr style='background-color:#fff;'>
<td style='border:1px solid #e0e0e0;padding:10px;vertical-align:middle;color:#333;text-align:right;font-size: 12px;line-height: 1;'>Platform Fee</td>
<td style='border:1px solid #e0e0e0;padding:10px;vertical-align:middle;color:#333;text-align:right;font-size: 12px;line-height: 1;'>
    <span style="font-family: DejaVu Sans; sans-serif;">${currency_symbol}</span> ${salesorder.platform_fees - salesorder.shipping_canceled}
</td>
</tr>
</#if>
<tr style='background-color:#fff;'>
    <td style='border:1px solid #e0e0e0;padding:10px;vertical-align:middle;color:#333;text-align:right;font-size: 12px;line-height: 1;'>${tax_title}</td>
    <td style='border:1px solid #e0e0e0;padding:10px;vertical-align:middle;color:#333;text-align:right;font-size: 12px;line-height: 1;'>
        <span style="font-family: DejaVu Sans; sans-serif;">${currency_symbol}</span> ${salesorder.tax_amount}
    </td>
</tr>
<#if custome_duty?exists && custome_duty == true>
<tr style='background-color:#fff;'>
    <td style='border:1px solid #e0e0e0;padding:10px;vertical-align:middle;color:#333;text-align:right;font-size: 12px;line-height: 1;'>Custom Duty</td>
    <td style='border:1px solid #e0e0e0;padding:10px;vertical-align:middle;color:#333;text-align:right;font-size: 12px;line-height: 1;'>
        <span style="font-family: DejaVu Sans; sans-serif;">${currency_symbol}</span> ${salesorder.custom_duty_amount}
    </td>
</tr>
</#if>
<tr style='background-color:#fff;'>
    <td style='border:1px solid #e0e0e0;padding:10px;vertical-align:middle;color:#333;text-align:right;font-size: 12px;line-height: 1;'>Net Total</td>
    <td style='border:1px solid #e0e0e0;padding:10px;vertical-align:middle;color:#333;text-align:right;font-size: 12px;line-height: 1;'>
        <span style="font-family: DejaVu Sans; sans-serif;">${currency_symbol}</span> ${(subtotal + salesorder.tax_amount + salesorder.shipping_amount - salesorder.tax_canceled - salesorder.shipping_canceled)}
    </td>
</tr>
<tr style='background-color:#fff;'>
    <td style='border:1px solid #e0e0e0;padding:10px;vertical-align:middle;color:#333;text-align:right;font-size: 12px;line-height: 1;'>Applicable Discount <br/>${salesorder.coupon_code!""?replace("","(" + salesorder.coupon_code + ")")}</td>
    <td style='border:1px solid #e0e0e0;padding:10px;vertical-align:middle;color:#333;text-align:right;font-size: 12px;line-height: 1;'>
        <span style="font-family: DejaVu Sans; sans-serif;">${currency_symbol}</span>${salesorder.discount_amount - salesorder.discount_canceled}
    </td>
</tr>
<tr style='background-color:#fff;'>
    <td style='border:1px solid #e0e0e0;padding:0 10px;vertical-align:middle;color:#333;text-align:right;line-height:18px;font-size: 12px;'>Reward Amount</td>
    <td style='border:1px solid #e0e0e0;padding:10px;vertical-align:middle;color:#333;text-align:right;font-size: 12px;line-height: 1;'>
        <span style="font-family: DejaVu Sans; sans-serif;">${currency_symbol}</span>- ${salesorder.spend_amount}
    </td>
</tr>
<tr style='background-color:#f8f8f8;'>
    <td style='border:1px solid #e0e0e0;padding:10px;vertical-align:middle;color:#333;text-align:right;font-weight:bold;font-size: 12px;line-height: 1;'>Grand Total</td>
    <td style='border:1px solid #e0e0e0;padding:10px;vertical-align:middle;color:#333;text-align:right;font-size: 12px;line-height: 1;'>
        <b><span style="font-family: DejaVu Sans; sans-serif;">${currency_symbol}</span>&nbsp;${salesorder.grand_total - salesorder.total_canceled}</b>
    </td>
</tr>
</table>
</td>
</tr>
<table class="wrapper" width="95%" border="0" cellspacing="0" cellpadding="0" align="center" style='border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;border-spacing: 0;-webkit-text-size-adjust: 100%;-ms-text-size-adjust: 100%;margin-top:8px;'>
    <tr>
        <td style='font-size: 12px;line-height: 1;padding: 0;'>
            <p style="margin: 8px 0 3px;padding: 0;line-height: 17px;margin-top: 13px;">
                <b>NOTE: </b>If you have questions about your order, you can email us at
                <a href="mailto:support@medikabazaar.com" style="color: #2a4689;font-weight: 700;text-decoration: underline;">support@medikabazaar.com</a>
                or call us at
                <a href="tel:${support_number}" style="color: #2a4689;font-weight: 700;text-decoration: underline;">${support_number}</a>.
            </p>
            <p style="margin: 8px 0;padding: 0;line-height: 17px;margin-top: 0;">
                Our working hours are from 8 am to 8 pm (Mon to Sat) and 9.30 am to 6.30 pm (Sunday).
            </p>
        </td>
    </tr>
    TODO: Require orders/mib/annexure.ftl
    <#if isIncludeAnnexure?? && isIncludeAnnexure == true>
    <tr>
        <td>
            <#include "orders/mib/annexure.ftl" />
        </td>
    </tr>
    </#if>
</table>
<table align="center" role="presentation" cellspacing="0" cellpadding="0" border="0" width="100%" style="border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;border-spacing: 0;-webkit-text-size-adjust: 100%;-ms-text-size-adjust: 100%;margin: auto;background-color:#2a4689;margin-top:30px;">
    <tr>
        <td valign="middle" class="footer email-section" style='font-size: 12px;line-height: 1;padding: 0;padding:10px 0;'>
            <table style='border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;border-spacing: 0;-webkit-text-size-adjust: 100%;-ms-text-size-adjust: 100%;width:95%;margin: 0 auto;'>
                <tr>
                    <td valign="center" style='font-size: 12px;line-height: 1;padding: 0;text-align:left;'>
                        <p style='margin: 8px 0;padding: 0;line-height: 17px;margin:0;font-size:11px;color:#fff;'>2020 Medikabazaar.com. All rights reserved.</p>
                    </td>
                    <td valign="center" style='font-size: 12px;line-height: 1;padding: 0;text-align:right;padding-right:0;'>
                        <p style='margin: 8px 0;padding: 0;line-height: 17px;margin:0;'>
                            <a href="https://twitter.com/MedikaBazaar" style='text-decoration: none;'>
                            TODO     <#-- <img src='${asset("assets/images/twitter.png")}' style='border: none;outline: none;text-decoration: none;display: inline-block;height: auto;width: 20px;margin-right: 3px;' /> -->
                            </a>
                            <a href="https://www.facebook.com/Medikabazaar" style='text-decoration: none;'>
                            TODO    <#-- <img src='${asset("assets/images/facebook.png")}' style='border: none;outline: none;text-decoration: none;display: inline-block;height: auto;width: 20px;margin-right: 3px;' /> -->
                            </a>
                            <a href="https://www.instagram.com/medikabazaar" style='text-decoration: none;'>
                            TODO     <#--  <img src='${asset("assets/images/instagram.png")}' style='border: none;outline: none;text-decoration: none;display: inline-block;height: auto;width: 20px;margin-right: 3px;' /> -->
                            </a>
                            <a href="https://www.linkedin.com/company/medikabazaar" style='text-decoration: none;'>
                            TODO     <#--  <img src='${asset("assets/images/linkedin.png")}' style='border: none;outline: none;text-decoration: none;display: inline-block;height: auto;width: 20px;margin-right: 3px;' /> -->
                            </a>
                            <a href="https://www.youtube.com/channel/UC-it53M8_v-58PJckJ5hN5Q" style='text-decoration: none;'>
                            TODO     <#-- <img src='${asset("assets/images/youtube.png")}' style='border: none;outline: none;text-decoration: none;display: inline-block;height: auto;width: 20px;' /> -->
                            </a>
                        </p>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
</div>
</body>
</html>