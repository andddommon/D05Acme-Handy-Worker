<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>

<form:form action="handyWorker/create.do" modelAttribute="handyWorker">

	<form:hidden path="id" />
	<form:hidden path="version" />
	<form:label path="name">
		<spring:message code="handyWorker.name"></spring:message>
	</form:label>
	<form:input path="name" />
	<br>

	<form:label path="middeName">
		<spring:message code="handyWorker.middeName"></spring:message>
	</form:label>
	<form:input path="middeName" />
	<br>


	<form:label path="surname">
		<spring:message code="handyWorker.surname"></spring:message>
	</form:label>
	<form:input path="surname" />
	<br>


	<form:label path="email">
		<spring:message code="handyWorker.email"></spring:message>
	</form:label>
	<form:input path="email" />
	<br>

	<form:label path="photo">
		<spring:message code="handyWorker.photo"></spring:message>
	</form:label>
	<form:input path="photo" />
	<br>

	<form:label path="phoneNumber">
		<spring:message code="handyWorker.phoneNumber"></spring:message>
	</form:label>
	<form:input path="phoneNumber" />
	<br>

	<form:label path="address">
		<spring:message code="handyWorker.address"></spring:message>
	</form:label>
	<form:input path="address" />
	<br>

	<form:label path="make">
		<spring:message code="handyWorker.make"></spring:message>
	</form:label>
	<form:input path="make" />
	<br>
	
	
	<input type="submit" name="save"
		value="<spring:message code="handyWorker.save" />" />
	<input type="button" name="cancel"
		value="<spring:message code="handyWorker.cancel" />" /> 
		

</form:form>