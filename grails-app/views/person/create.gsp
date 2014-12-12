
<g:set var="entityName" value="${message(code: 'person.label', default: 'Person')}" />
<g:applyLayout name="main">

	<content tag="content">
		<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
		</g:if>
		<g:hasErrors bean="${personInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${personInstance}" var="error">
					<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
		</g:hasErrors>
		<g:form class="form-horizontal" role="form" url="[resource:personInstance, action:'save']">
			<fieldset class="form">
				<g:render template="form"/>
			</fieldset>
			<fieldset class="form-group">

				<g:submitButton name="create" class="btn btn-info btn-lg pull-right" value="${message(code: 'default.button.create.label', default: 'Create')}" />
			</fieldset>
		</g:form>
	</content>
</g:applyLayout>
