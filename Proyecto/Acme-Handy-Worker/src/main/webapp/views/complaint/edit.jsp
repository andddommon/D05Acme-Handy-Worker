<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>

<security:authorize access= "hasRole('CUSTOMER')">
<form:form action="complaint/create.do" modelAttribute="complaint">

	<form:hidden path="id" />
	<form:hidden path="version" />
	<form:label path="description">
		<spring:message code="complaint.description"></spring:message>
	</form:label>
	<form:input path="description" />
	<br>

	<form:label path="attachments">
		<spring:message code="complaint.attachments"></spring:message>
	</form:label>
	<form:input path="attachments" />
	<br>

	
	<input type="submit" name="save"
		value="<spring:message code="actor.save" />" />
	<input type="button" name="cancel"
		value="<spring:message code="actor.return" />" /> 
		

</form:form>
</security:authorize>