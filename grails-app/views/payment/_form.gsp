<%@ page import="warehouse.Payment" %>



<div class="fieldcontain ${hasErrors(bean: paymentInstance, field: 'purchase', 'error')} required">
	<label for="purchase">
		<g:message code="payment.purchase.label" default="Purchase" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="purchase" name="purchase.id" from="${warehouse.Purchase.list()}" optionKey="id" required="" value="${paymentInstance?.purchase?.id}" class="many-to-one"/>

</div>

