<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">

<style>

body{
    margin:0;
    padding:0;
    background:#f5f6f7;
    font-family: Arial, Helvetica, sans-serif;
    color:#333;
}

.outer-wrapper{
    padding:40px 0;
}

.container{
    width:820px;
    margin:auto;
}

.text{
    font-size:14px;
    line-height:22px;
}

.heading{
    color:#2f4f9f;
    font-size:20px;
    font-weight:bold;
    margin-top:20px;
}

.meta{
    margin-top:10px;
    font-size:14px;
}

.meta b{
    font-weight:bold;
}

.table{
    width:100%;
    border-collapse:collapse;
    margin-top:20px;
    font-size:14px;
}

.table th{
    background:#f3f4f6;
    border:1px solid #d1d5db;
    padding:14px 12px;
    text-align:left;
}

.table td{
    border:1px solid #e5e7eb;
    padding:14px 12px;
}

.right{
    text-align:right;
}

.total-label{
    font-weight:bold;
}

.footer-text{
    margin-top:18px;
    font-size:14px;
}

.signature{
    margin-top:28px;
    font-size:14px;
}

.item-code{
    color:#777;
    font-size:12px;
}

.rejection-box{
    margin-top:20px;
    padding:14px;
    background:#fdecea;
    border-left:4px solid #d93025;
    font-size:14px;
}

</style>

</head>

<body>

<div class="outer-wrapper">

<div class="container">

<p class="text">
Hi ${bdeName!""},
</p>

<p class="text">
The order initiated by you for <b>${customerName!""}</b>
(Order ID: <b>${salesOrder.incrementId!""}</b>) has been reviewed by the Manager and has been rejected.
</p>

<div class="heading">Rejection Details</div>

<div class="meta">
<b>Order ID:</b> ${salesOrder.incrementId!""}<br>
<b>Order Placed On:</b> ${salesOrder.createdAt!""}
</div>

<#assign currencySymbol = currencySymbol!"Rs.">
<#assign subtotal = 0>

<table class="table">

<tr>
<th style="width:34%">Items</th>
<th style="width:10%">UOM</th>
<th style="width:8%">Qty</th>
<th style="width:12%">Unit Price</th>
<th style="width:12%">Discount</th>
<th style="width:8%">GST</th>
<th style="width:8%">GST Amt</th>
<th style="width:8%">Total Excl. GST</th>
</tr>

<#list orderItems as item>

<#if !item.parentItemId?exists>

<#assign qty = item.qtyOrdered!0>
<#assign rowtotal = (item.price * qty) - item.discountAmount - item.additionalDiscountAmount>
<#assign subtotal = subtotal + (item.price * qty)>

<tr
<#if item.isMspMissing?? && item.isMspMissing == true>
style="background-color:#FFF6E5;border-left:4px solid #F5C26B;"
</#if>
>

<td>
<b>${item.name!""}</b>
<#if item.itemCode??>
<br><span class="item-code">Item Code: ${item.itemCode}</span>
</#if>
</td>

<td>${item.alternateUom!""}</td>

<td>${qty}</td>

<td>${currencySymbol} ${item.price!""}</td>

<td>${currencySymbol} ${item.discountAmount!0}</td>

<td>${item.taxPercent!0}%</td>

<td>${currencySymbol} ${item.taxAmount!0}</td>

<td class="right">${rowtotal}</td>

</tr>

</#if>

</#list>

<tr>
<td colspan="6"></td>
<td class="total-label">Subtotal</td>
<td class="right">${currencySymbol}${subtotal}</td>
</tr>

<tr>
<td colspan="6"></td>
<td class="total-label">GST (Including Shipping Tax Charges)</td>
<td class="right">${currencySymbol}${salesOrder.taxAmount!0}</td>
</tr>

<tr>
<td colspan="6"></td>
<td class="total-label">Coupon</td>
<td class="right">
<#if salesOrder.couponCode??>
(coupon: ${salesOrder.couponCode})
</#if>
</td>
</tr>

<tr>
<td colspan="6"></td>
<td class="total-label">Applicable Discount</td>
<td class="right">${currencySymbol} ${salesOrder.discountAmount!0}</td>
</tr>

<tr>
<td colspan="6"></td>
<td class="total-label">Grand Total</td>
<td class="right"><b>${currencySymbol} ${salesOrder.grandTotal!0}</b></td>
</tr>

</table>

<div class="rejection-box">
<b>Reason for Rejection:</b><br>
${managerComments!""}
</div>

<p class="footer-text">
Please review the feedback shared above and connect with the manager if any clarification is required.
</p>

<p class="footer-text">
Let us know if any support is required.
</p>

<div class="signature">
Regards,<br><br>
MBPro Sales App
</div>

</div>

</div>

</body>
</html>
