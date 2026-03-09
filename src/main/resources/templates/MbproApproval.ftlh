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

.container{
    width:820px;
    margin:40px auto;
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
    padding:12px;
    text-align:left;
}

.table td{
    border:1px solid #e5e7eb;
    padding:12px;
}

.right{
    text-align:right;
}

.total-label{
    font-weight:bold;
}

.button-wrapper{
    margin-top:30px;
}

.btn{
    display:inline-block;
    padding:12px 22px;
    font-size:14px;
    font-weight:bold;
    text-decoration:none;
    border-radius:6px;
    margin-right:10px;
}

.btn-approve{
    background:#1f8f43;
    color:white;
}

.btn-reject{
    background:#dc2626;
    color:white;
}

.footer-text{
    margin-top:20px;
    font-size:14px;
}

</style>

</head>

<body>

<div class="container">

<p class="text">
Hi ${managerName!""},
</p>

<p class="text">
An order has been initiated by <b>${bdeName!""}</b> for the below customer, however both
<b>Selling Price (SP)</b> and <b>Minimum Selling Price (MSP)</b> are not defined in the system.
</p>

<p class="text">
As per policy, approval is required before proceeding.
</p>

<div class="heading">Order Details</div>

<div class="meta">
<b>Order ID:</b> ${salesOrder.incrementId!""}<br>
<b>Order Placed On:</b> ${salesOrder.createdAt!""}
</div>

<#assign currencySymbol = currencySymbol!"Rs.">
<#assign subtotal = 0>

<table class="table">

<tr>
<th style="width:30%">Items</th>
<th style="width:8%">UOM</th>
<th style="width:6%">Qty</th>
<th style="width:14%">Expected Delivery</th>
<th style="width:10%">Unit Price</th>
<th style="width:10%">Discount</th>
<th style="width:6%">GST</th>
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
<br><span style="color:#666;font-size:12px">Item Code: ${item.itemCode}</span>
</#if>
</td>

<td>${item.alternateUom!""}</td>

<td>${qty}</td>

<td>${item.deliveryDate!""}</td>

<td>${currencySymbol} ${item.price!""}</td>

<td>${currencySymbol} ${item.discountAmount!0}</td>

<td>${item.taxPercent!0}%</td>

<td>${currencySymbol} ${item.taxAmount!0}</td>

<td class="right">${rowtotal}</td>

</tr>

</#if>

</#list>

<tr>
<td colspan="7"></td>
<td class="total-label">Subtotal</td>
<td class="right">${currencySymbol}${subtotal}</td>
</tr>

<tr>
<td colspan="7"></td>
<td class="total-label">GST (Including Shipping Tax Charges)</td>
<td class="right">${currencySymbol}${salesOrder.taxAmount!0}</td>
</tr>

<tr>
<td colspan="7"></td>
<td class="total-label">Coupon</td>
<td class="right">
<#if salesOrder.couponCode??>
(coupon: ${salesOrder.couponCode})
</#if>
</td>
</tr>

<tr>
<td colspan="7"></td>
<td class="total-label">Applicable Discount</td>
<td class="right">${currencySymbol} ${salesOrder.discountAmount!0}</td>
</tr>

<tr>
<td colspan="7"></td>
<td class="total-label">Grand Total</td>
<td class="right"><b>${currencySymbol} ${salesOrder.grandTotal!0}</b></td>
</tr>

</table>

<div class="button-wrapper">

<a href="${approveUrl!""}" class="btn btn-approve">
Approve Order </a>

<a href="${rejectUrl!""}" class="btn btn-reject">
Reject Order </a>

</div>

<p class="footer-text">
Kindly review and approve/reject the order at the earliest to avoid delays in fulfillment.
</p>

</div>

</body>
</html>
