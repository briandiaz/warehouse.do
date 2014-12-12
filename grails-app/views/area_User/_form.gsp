<%@ page import="warehouse.Area_User" %>


<div class="form-group ${hasErrors(bean: area_UserInstance, field: 'area', 'error')} required">
	<label for="area" class="control-label col-md-3">
		<g:message code="area_User.area.label" default="Area" />
		<span class="required-indicator">*</span>
	</label>

	<div class="col-md-9">
		<g:select id="area" name="area.id" from="${warehouse.Area.list()}" optionKey="id" required="" value="${area_UserInstance?.area?.id}" class="form-control"/>
	</div>
</div>

<div class="form-group ${hasErrors(bean: area_UserInstance, field: 'user', 'error')} required">
	<label for="user" class="control-label col-md-3">
		<g:message code="area_User.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-md-9">
		<g:select id="user" name="user.id" from="${warehouse.User.list()}" optionKey="id" required="" value="${area_UserInstance?.user?.id}" class="form-control"/>
	</div>

</div>

