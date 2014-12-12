<%@ page import="warehouse.Person" %>

<div class="form-group">
	<h1>Detalles Personales</h1>
</div>
<div class="form-group ${hasErrors(bean: personInstance, field: 'first_name', 'error')} required">
	<label for="first_name" class="col-md-3 control-label">
		<g:message code="person.first_name.label" default="Firstname" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-md-9">
	<g:textField name="first_name" required="" value="${personInstance?.first_name}"/>
</div>
</div>

<div class="form-group ${hasErrors(bean: personInstance, field: 'last_name', 'error')} required">
	<label for="last_name" class="col-md-3 control-label">
		<g:message code="person.last_name.label" default="Lastname" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-md-9">
		<g:textField name="last_name" required="" value="${personInstance?.last_name}"/>
	</div>
</div>

<div class="form-group ${hasErrors(bean: personInstance, field: 'phone', 'error')} ">
	<label for="phone" class="col-md-3 control-label">
		<g:message code="person.phone.label" default="Phone" />
		
	</label>
	<div class="col-md-9">
	<g:textField name="phone" value="${personInstance?.phone}"/>
</div>
</div>

<div class="form-group ${hasErrors(bean: personInstance, field: 'mobile', 'error')} ">
	<label for="mobile" class="col-md-3 control-label">
		<g:message code="person.mobile.label" default="Mobile" />
		
	</label>
	<div class="col-md-9">
	<g:textField name="mobile" value="${personInstance?.mobile}"/>
</div>
</div>

<div class="form-group ${hasErrors(bean: personInstance, field: 'consumerType', 'error')} required">
	<label for="consumerType" class="col-md-3 control-label">
		<g:message code="person.consumerType.label" default="Consumer Type" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-md-9">
	<g:select id="consumerType" name="consumerType.id" from="${warehouse.Consumer_Type.list()}" optionKey="id" required="" value="${personInstance?.consumerType?.id}" class="many-to-one"/>
</div>
</div>


<div class="form-group ${hasErrors(bean: personInstance, field: 'company', 'error')} ">
	<label for="company" class="col-md-3 control-label">
		<g:message code="person.company.label" default="Company" />
		
	</label>
	<div class="col-md-9">
	<g:textField name="company" value="${personInstance?.company}"/>
</div>
</div>

<div class="form-group ${hasErrors(bean: personInstance, field: 'country', 'error')} ">
	<label for="country" class="col-md-3 control-label">
		<g:message code="person.country.label" default="Country" />
		
	</label>
	<div class="col-md-9">
	<g:select id="country" name="country.id" from="${warehouse.Country.list()}" optionKey="id" value="${personInstance?.country?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>
</div>

<div class="form-group ${hasErrors(bean: personInstance, field: 'city', 'error')} ">
	<label for="city" class="col-md-3 control-label">
		<g:message code="person.city.label" default="City" />
		
	</label>
<div class="col-md-9">
	<g:textField name="city" value="${personInstance?.city}"/>
</div>
</div>

<div class="form-group ${hasErrors(bean: personInstance, field: 'address1', 'error')} required">
	<label for="address1" class="col-md-3 control-label">
		<g:message code="person.address1.label" default="Address1" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-md-9">
	<g:textField name="address1" required="" value="${personInstance?.address1}"/>
	</div>
</div>

<div class="form-group ${hasErrors(bean: personInstance, field: 'address2', 'error')} ">
	<label for="address2" class="col-md-3 control-label">
		<g:message code="person.address2.label" default="Address2" />
		
	</label>
	<div class="col-md-9">
	<g:textField name="address2" value="${personInstance?.address2}"/>
	</div>
</div>

<div class="form-group">
	<h1>Cuenta de Usuario</h1>
</div>
<div class="form-group">
	<label for="email" class="col-md-3 control-label">
		Email
		<span class="required-indicator">*</span>
	</label>
	<div class="col-md-9">
		<g:textField id="email" name="email" required="required" placeholder="Email"/>
	</div>
</div>
<div class="form-group">
	<label for="username" class="col-md-3 control-label">
		UserName
		<span class="required-indicator">*</span>
	</label>
	<div class="col-md-9">
		<g:textField id="username" name="username" required="required" placeholder="UserName"/>
	</div>
</div>

<div class="form-group">
	<label for="password" class="col-md-3 control-label">
		Password
		<span class="required-indicator">*</span>
	</label>
	<div class="col-md-9">
		<g:passwordField id="password" name="password" required="required" placeholder="Password"/>
	</div>
</div>


