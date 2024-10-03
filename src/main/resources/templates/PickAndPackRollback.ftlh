<#assign firstPickAndPackLogDetail = pickAndPackLog?first>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Pick And Pack Rollback</title>
</head>
<body style="font-size:12px;margin:0;width:100%!important;font-size: 12px;line-height: 1;background-color: #d9d9d9;margin: 0;padding: 0;-webkit-font-smoothing: antialiased;font-family: 'Open Sans', sans-serif;-webkit-text-size-adjust: 100%;-ms-text-size-adjust: 100%;">
<div style="max-width: 850px; margin: 0 auto;background-color:#fff;border:1px solid #e0e0e0;" class="email-container">
    <table class="wrapper" width="90%" border="0" cellspacing="0" cellpadding="0" align="center" style="background-color: #fff;border-collapse: collapse;">
        <tr>
            <td width="40%" style="padding:15px 15px 15px 0;">
                <img src="${asset('images/logo.png')}" />
            </td>
        </tr>
    </table>
    <table align="center" role="presentation" cellspacing="0" cellpadding="0" border="0" width="100%" style="margin: auto;border-collapse: collapse;">
        <tr>
            <td class="bg_white logo" style="padding:0.5em;height:125px;text-align: left;vertical-align: middle;background-color:#2a4689;width: 40%;"> </td>
        </tr>
    </table>
    <table class="wrapper" width="90%" border="0" cellspacing="0" cellpadding="0" align="center" style="background-color: #fff;margin: 0 auto; margin-top: -90px;border: 1px solid #e0e0e0;border-bottom: 0;">
        <tr>
            <td style="background-color: #fff;padding:35px 20px 0;text-align:center;">
                <div style="font-size:16px;color:#222;font-weight:bold;">Pick And Pack Rolled Back</div>
                <hr style="border-top: 3px solid #FF812D;width: 60px;border-radius: 100px;" />
            </td>
        </tr>
        <tr>
            <td style="background-color: #fff;padding:15px 20px;text-align:center;">
                <img src="${asset('images/order_dispatched.png')}" />
            </td>
        </tr>
    </table>

    <table class="wrapper" width="90%" border="0" cellspacing="0" cellpadding="0" align="center" style="border-collapse: collapse;">
        <tr style="background-color: #fff;">
            <td width="50%" style="border:1px solid #e0e0e0;padding:10px 20px;vertical-align:top;color:#333;">
                <p style="font-size: 13px;"><b>Pick and Pack ID</b></p>
                <p>${firstPickAndPackLogDetail.transaction_number!}</p>
            </td>
            <td width="50%" style="border:1px solid #e0e0e0;padding:10px 20px;vertical-align:top;color:#333;">
                <p style="font-size: 13px;"><b>Fulfillment Center</b></p>
                <p>${firstPickAndPackLogDetail.warehouse_name!}</p>
            </td>
        </tr>
    </table>
<#list pickAndPackLog?groupBy('sales_order_id') as groupPickAndPackLog>
    <#list groupPickAndPackLog?uniqueBy('product_id') as uniquePickAndPackLog>
        <#assign skuWisePickAndPackLogs = groupPickAndPackLog?filter(it -> it.product_id == uniquePickAndPackLog.product_id)>
        <#assign totalSchemeQty = skuWisePickAndPackLogs?sum('scheme_qty_transacted')?round />
        <#assign totalQty = skuWisePickAndPackLogs?sum('qty_transacted')?round />
        <#assign conversionFactor = (skuWisePickAndPackLogs[0].conversion_factor > 0) ? skuWisePickAndPackLogs[0].conversion_factor : 1 />

        <table class="wrapper" width="90%" border="0" cellspacing="0" cellpadding="0" align="center" style="margin-top:8px;border-collapse: collapse;">
            <thead>
                <tr style="background-color:#fff">
                    <th style="text-align: center; border:1px solid #e0e0e0;padding: 10px 10px;vertical-align:top;color:#333;">
                        Name
                    </th>
                    <th style="text-align: center; border:1px solid #e0e0e0;padding: 10px 10px;vertical-align:top;color:#333;">
                        Order ID
                    </th>
                    <th style="text-align: center; border:1px solid #e0e0e0;padding: 10px 10px;vertical-align:top;color:#333;">
                        SKU
                    </th>
                    <th style="text-align: center; border:1px solid #e0e0e0;padding: 10px 10px;vertical-align:top;color:#333;">
                        Quantity
                    </th>
                    <th style="text-align: center; border:1px solid #e0e0e0;padding: 10px 10px;vertical-align:top;color:#333;">
                        Free Qty
                    </th>
                    <th style="text-align: center; border:1px solid #e0e0e0;padding: 10px 10px;vertical-align:top;color:#333;">
                        Total Pick And Pack Qty
                    </th>
                </tr>
            </thead>
            <tbody>
                <tr style="background-color:#fff">
                    <td style="text-align: center; border:1px solid #e0e0e0;padding: 10px 10px;vertical-align:top;color:#333;">
                        ${uniquePickAndPackLog.product_name!}
                    </td>
                    <td style="text-align: center; border:1px solid #e0e0e0;padding: 10px 10px;vertical-align:top;color:#333;">
                        ${uniquePickAndPackLog.order_number!}
                    </td>
                    <td style="text-align: center; border:1px solid #e0e0e0;padding: 10px 10px;vertical-align:top;color:#333;">
                        ${uniquePickAndPackLog.product_id!}
                    </td>
                    <td style="text-align: center; border:1px solid #e0e0e0;padding: 10px 10px;vertical-align:top;color:#333;">
                        ${totalQty}
                    </td>
                    <td style="text-align: center; border:1px solid #e0e0e0;padding: 10px 10px;vertical-align:top;color:#333;">
                        ${totalSchemeQty}
                    </td>
                    <td style="text-align: center; border:1px solid #e0e0e0;padding: 10px 10px;vertical-align:top;color:#333;">
                        ${totalQty + totalSchemeQty}
                    </td>
                </tr>
            </tbody>
        </table>

        <table class="wrapper" width="90%" border="0" cellspacing="0" cellpadding="0" align="center" style="margin-top:8px;border-collapse: collapse;">
            <thead>
                <tr style="background-color:#fff">
                    <th style="text-align: center; border:1px solid #e0e0e0;padding: 10px 10px;vertical-align:top;color:#333;">
                        Total Selected Stock
                    </th>

                    <#list allCFList as cf>
                        <th style="text-align: center; border:1px solid #e0e0e0;padding: 10px 10px;vertical-align:top;color:#333;">
                            ${cf.cf_name}
                        </th>
                    </#list>
                </tr>
            </thead>
            <tbody>
                <#list skuWisePickAndPackLogs as skuWisePickAndPackLog>
                    <tr style="background-color:#fff">
                        <td style="text-align: center; border:1px solid #e0e0e0;padding: 10px 10px;vertical-align:top;color:#333;">
                            ${skuWisePickAndPackLog.qty_transacted + skuWisePickAndPackLog.scheme_qty_transacted}
                        </td>

                        <#list allCFList as cf>
                            <#assign cfName = 'cf_' + cf.cf_id>
                            <td style="text-align: center; border:1px solid #e0e0e0;padding: 10px 10px;vertical-align:top;color:#333;">
                                ${skuWisePickAndPackLog[cfName]!}
                            </td>
                        </#list>
                    </tr>
                </#list>
            </tbody>
        </table>
    </#list>
</#list>

<table class="wrapper" width="90%" border="0" cellspacing="0" cellpadding="0" align="center" style="margin-top:8px;border-collapse: collapse;">
    <tr>
        <td>
            <p style="margin-top: 13px;margin-bottom:20px;">If you have questions about your order, you can email us at <a href="mailto:support@medikabazaar.com" style="color: #2a4689;font-weight: 700;text-decoration: underline;">support@medikabazaar.com</a> or call us at <a href="tel:${constants.support_number}" style="color: #2a4689;font-weight: 700;text-decoration: underline;">${constants.support_number}</a>.</p>
            <b>Working Hours</b>
            <p>Mon to Sat: 8 am to 8 pm | Sunday: 9.30 am to 6.30 pm</p>
        </td>
    </tr>
</table>
<table align="center" role="presentation" cellspacing="0" cellpadding="0" border="0" width="100%" style="margin: auto;background-color:#2a4689;margin-top:30px;border-collapse: collapse;">
    <tr>
        <td valign="middle" class="footer email-section" style="padding:10px 0;">
            <table style="width:90%;margin: 0 auto;">
                <tr>
                    <td valign="center" style="text-align:left;width: 50%;">
                        <p style="margin:0;font-size:11px;color:#fff;">2020 Medikabazaar.com. All rights reserved.</p>
                    </td>
                    <td valign="center" style="text-align:right;padding-right:0;width: 50%;">
                        <p style="margin:0;">
                            <a href="https://twitter.com/MedikaBazaar"><img src="${asset('images/twitter.png')}" style="width: 20px;margin-right: 3px;" /></a>
                            <a href="https://www.facebook.com/Medikabazaar"><img src="${asset('images/facebook.png')}" style="width: 20px;margin-right: 3px;" /></a>
                            <a href="https://www.instagram.com/medikabazaar"><img src="${asset('images/instagram.png')}" style="width: 20px;margin-right: 3px;" /></a>
                            <a href="https://www.linkedin.com/company/medikabazaar"><img src="${asset('images/linkedin.png')}" style="width: 20px;margin-right: 3px;" /></a>
                            <a href="https://www.youtube.com/channel/UC-it53M8_v-58PJckJ5hN5Q"><img src="${asset('images/youtube.png')}" style="width: 20px;" /></a>
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