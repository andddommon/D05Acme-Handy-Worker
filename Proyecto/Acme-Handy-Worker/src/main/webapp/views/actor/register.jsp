<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>

<form:form action="actor/create.do" modelAttribute="actor">

	<form:hidden path="id" />
	<form:hidden path="version" />
	<form:label path="name">
		<spring:message code="actor.name"></spring:message>
	</form:label>
	<form:input path="name" />
	<br>

	<form:label path="name">
		<spring:message code="actor.middeName"></spring:message>
	</form:label>
	<form:input path="middeName" />
	<br>


	<form:label path="surname">
		<spring:message code="actor.surname"></spring:message>
	</form:label>
	<form:input path="surname" />
	<br>


	<form:label path="email">
		<spring:message code="actor.email"></spring:message>
	</form:label>
	<form:input path="email" />
	<br>

	<form:label path="photo">
		<spring:message code="actor.photo"></spring:message>
	</form:label>
	<form:input path="photo" />
	<br>

	<form:label path="phoneNumber">
		<spring:message code="actor.phoneNumber"></spring:message>
	</form:label>
	<form:input path="phoneNumber" />
	<br>

	<form:label path="address">
		<spring:message code="actor.address"></spring:message>
	</form:label>
	<form:input path="address" />
	<br>

	
	<input type="submit" name="save"
		value="<spring:message code="actor.save" />" />
	<input type="button" name="cancel"
		value="<spring:message code="actor.return" />" /> 
		

</form:form>