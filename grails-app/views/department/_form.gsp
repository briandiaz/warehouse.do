<%@ page import="warehouse.Department" %>

<div class="form-group ${hasErrors(bean: departmentInstance, field: 'name', 'error')} required">
	<label for="name" class="control-label col-md-3">
		<g:message code="department.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-md-9">
		<g:textField name="name" class="form-control" required="" value="${departmentInstance?.name}"/>
	</div>
</div>

<div class="form-group ${hasErrors(bean: departmentInstance, field: 'description', 'error')} required">
	<label for="description" class="control-label col-md-3">
		<g:message code="department.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-md-9">
		<g:textArea name="description" class="form-control" required="" value="${departmentInstance?.description}"/>
	</div>

</div>

<div class="form-group ${hasErrors(bean: departmentInstance, field: 'icon', 'error')} required">
	<label for="icon" class="control-label col-md-3">
		<g:message code="department.icon.label" default="Icon" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-md-9">
		<g:select name="icon" from="${['fa-desktop','fa-mobile','fa-camera','fa-headphones','fa-gamepad', 'fa-car', 'fa-film','fa-book','fa-user','fa-child', 'fa-suitcase','fa-soccer-ball-o']}" noSelection="['Icon': 'Select the Icon']"/>
	</div>
</div>

