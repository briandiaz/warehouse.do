<%@ page import="warehouse.Image" %>



<div class="fieldcontain ${hasErrors(bean: imageInstance, field: 'photo', 'error')} ">
	<label for="photo">
		<g:message code="image.photo.label" default="Photo" />
		
	</label>
	<input type="file" id="photo" name="photo" />

</div>

<div class="fieldcontain ${hasErrors(bean: imageInstance, field: 'photoType', 'error')} ">
	<label for="photoType">
		<g:message code="image.photoType.label" default="Photo Type" />
		
	</label>
	<g:textField name="photoType" value="${imageInstance?.photoType}"/>

</div>

