
<g:set var="entityName" value="${message(code: 'status.label', default: 'Status')}" />
<title><g:message code="default.create.label" args="[entityName]" /></title>

<g:applyLayout name="main">

	<content tag="content">
		<h1><g:message code="default.create.label" args="[entityName]" /></h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
		</g:if>
		<g:hasErrors bean="${statusInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${statusInstance}" var="error">
					<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
		</g:hasErrors>
		<g:form class="form-horizontal" role="form" url="[resource:statusInstance, action:'save']" >
			<fieldset class="form">
				<g:render template="form"/>
			</fieldset>
			<fieldset class="form-group">
				<g:submitButton name="create" class="btn btn-info btn-lg pull-right" value="${message(code: 'default.button.create.label', default: 'Create')}" />
			</fieldset>
		</g:form>
	</content>
</g:applyLayout>