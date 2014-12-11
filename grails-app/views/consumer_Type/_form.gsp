<%@ page import="warehouse.Consumer_Type" %>



<div class="fieldcontain ${hasErrors(bean: consumer_TypeInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="consumer_Type.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${consumer_TypeInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: consumer_TypeInstance, field: 'value', 'error')} required">
	<label for="value">
		<g:message code="consumer_Type.value.label" default="Value" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="value" type="number" value="${consumer_TypeInstance.value}" required=""/>

</div>

