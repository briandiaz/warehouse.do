<%@ page import="warehouse.User; warehouse.Department; warehouse.Item" %>

<div class="form-group ${hasErrors(bean: itemInstance, field: 'name', 'error')} required">
	<label for="name" class="control-label col-md-3">
		<g:message code="item.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
<div class="col-md-9">
	<g:textField name="name"  class="form-control" required="" value="${itemInstance?.name}"/>
</div>
</div>

<div class="form-group ${hasErrors(bean: itemInstance, field: 'description', 'error')} required">
	<label for="description" class="control-label col-md-3">
		<g:message code="item.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-md-9">
	<g:textArea name="description" class="form-control" required="" value="${itemInstance?.description}"/>
	</div>
</div>

<div class="form-group ${hasErrors(bean: itemInstance, field: 'price', 'error')} required">
	<label for="price" class="control-label col-md-3">
		<g:message code="item.price.label" default="Price" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-md-9">
	<g:field name="price" class="form-control" value="${fieldValue(bean: itemInstance, field: 'price')}" required=""/>
	</div>
</div>

<div class="form-group ${hasErrors(bean: itemInstance, field: 'reorder', 'error')} required">
	<label for="reorder" class="control-label col-md-3">
		<g:message code="item.reorder.label" default="Reorder" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-md-9">
	<g:field name="reorder" class="form-control" type="number" value="${itemInstance.reorder}" required=""/>
	</div>
</div>

<div class="form-group ${hasErrors(bean: itemInstance, field: 'department', 'error')} required">
	<label for="department" class="control-label col-md-3">
		<g:message code="item.department.label" default="Department" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-md-9">
	<g:select id="department" class="form-control" name="department.id" from="${warehouse.Department.list()}" optionKey="id" required="" value="${itemInstance?.department?.id}" />
	</div>
</div>

<div class="form-group ${hasErrors(bean: itemInstance, field: 'photo1', 'error')} required">
	<label for="photo1" class="control-label col-md-3">
		<g:message code="item.photo1.label" default="Photo1" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-md-9">
	<input type="file" id="photo1" class="form-control" name="photo1" />
	<g:field name="photo1Type" class="form-control" type="text" value=".jpg"/>
	</div>
</div>

<div class="form-group ${hasErrors(bean: itemInstance, field: 'photo2', 'error')} ">
	<label for="photo2" class="control-label col-md-3">
		<g:message code="item.photo2.label" default="Photo2" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-md-9">
	<input type="file" id="photo2" class="form-control" name="photo2" />
		<g:field name="photo2Type" class="form-control" type="text" value=".jpg"/>
	</div>
</div>

<div class="form-group ${hasErrors(bean: itemInstance, field: 'photo3', 'error')} ">
	<label for="photo3" class="control-label col-md-3">
		<g:message code="item.photo3.label" default="Photo3" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-md-9">
		<input type="file" id="photo3" class="form-control" name="photo3" />
		<g:field name="photo3Type" class="form-control" type="text" value=".jpg"/>
	</div>
</div>

<div class="form-group ${hasErrors(bean: itemInstance, field: 'photo4', 'error')} ">
	<label for="photo4" class="control-label col-md-3">
		<g:message code="item.photo4.label" default="Photo4" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-md-9">
	<input type="file" id="photo4" class="form-control" name="photo4" />
		<g:field name="photo4Type" class="form-control" type="text" value=".jpg"/>

</div>

<div class="form-group ${hasErrors(bean: itemInstance, field: 'photo5', 'error')} ">
	<label for="photo5" class="control-label col-md-3">
		<g:message code="item.photo5.label" default="Photo5" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-md-9">
		<input type="file" id="photo5" class="form-control" name="photo5" />

		<g:field name="photo5Type" class="form-control" type="text" value=".jpg"/>
	</div>
</div>

