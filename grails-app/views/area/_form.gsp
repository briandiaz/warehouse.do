<%@ page import="warehouse.Area" %>



<div class="fieldcontain ${hasErrors(bean: areaInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="area.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${areaInstance?.name}"/>

</div>

