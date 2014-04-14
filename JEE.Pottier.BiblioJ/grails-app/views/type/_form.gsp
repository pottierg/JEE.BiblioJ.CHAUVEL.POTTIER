<%@ page import="jee.pottier.biblioj.Type" %>



<div class="fieldcontain ${hasErrors(bean: typeInstance, field: 'intitule', 'error')} required">
	<label for="intitule">
		<g:message code="type.intitule.label" default="Intitule" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="intitule" required="" value="${typeInstance?.intitule}"/>
</div>

