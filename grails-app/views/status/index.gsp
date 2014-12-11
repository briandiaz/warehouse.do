
<%@ page import="warehouse.Status" %>
<g:set var="entityName" value="${message(code: 'status.label', default: 'Status')}" />
<g:applyLayout name="main">

	<content tag="content">
		<div class="nav" role="navigation">
		<ul>
			<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
			<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
		</ul>
	</div>
		<div id="list-status" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
				<tr>

					<g:sortableColumn property="name" title="${message(code: 'status.name.label', default: 'Name')}" />

					<g:sortableColumn property="value" title="${message(code: 'status.value.label', default: 'Value')}" />

				</tr>
				</thead>
				<tbody>
				<g:each in="${statusInstanceList}" status="i" var="statusInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

						<td><g:link action="show" id="${statusInstance.id}">${fieldValue(bean: statusInstance, field: "name")}</g:link></td>

						<td>${fieldValue(bean: statusInstance, field: "value")}</td>

					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${statusInstanceCount ?: 0}" />
			</div>
		</div>
	</content>
</g:applyLayout>