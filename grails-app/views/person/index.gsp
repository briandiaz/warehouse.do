
<%@ page import="warehouse.Person" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'person.label', default: 'Person')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-person" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-person" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="first_name" title="${message(code: 'person.first_name.label', default: 'Firstname')}" />
					
						<g:sortableColumn property="last_name" title="${message(code: 'person.last_name.label', default: 'Lastname')}" />
					
						<g:sortableColumn property="phone" title="${message(code: 'person.phone.label', default: 'Phone')}" />
					
						<g:sortableColumn property="mobile" title="${message(code: 'person.mobile.label', default: 'Mobile')}" />
					
						<th><g:message code="person.consumerType.label" default="Consumer Type" /></th>
					
						<th><g:message code="person.user.label" default="User" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${personInstanceList}" status="i" var="personInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${personInstance.id}">${fieldValue(bean: personInstance, field: "first_name")}</g:link></td>
					
						<td>${fieldValue(bean: personInstance, field: "last_name")}</td>
					
						<td>${fieldValue(bean: personInstance, field: "phone")}</td>
					
						<td>${fieldValue(bean: personInstance, field: "mobile")}</td>
					
						<td>${fieldValue(bean: personInstance, field: "consumerType")}</td>
					
						<td>${fieldValue(bean: personInstance, field: "user")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${personInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
