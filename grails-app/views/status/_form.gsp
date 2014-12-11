<%@ page import="warehouse.Status" %>



<div class="form-group ${hasErrors(bean: statusInstance, field: 'name', 'error')} required">
	<label for="name" class="control-label col-md-3">
		<g:message code="status.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-md-9">
		<g:textField name="name" required="" value="${statusInstance?.name}"/>
	</div>
</div>

<div class="form-group ${hasErrors(bean: statusInstance, field: 'value', 'error')} required">
	<label for="value" class="control-label col-md-3">
		<g:message code="status.value.label" default="Value" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-md-9">
		<g:field name="value" type="number" class="form-control" value="${statusInstance.value}" required=""/>
	</div>
</div>

