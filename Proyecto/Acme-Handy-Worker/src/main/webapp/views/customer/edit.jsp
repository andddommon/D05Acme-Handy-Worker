<%--
 * edit.jsp
 *
 * Copyright (C) 2013 Universidad de Sevilla
 * 
 * The use of this project is hereby constrained to the conditions of the 
 * TDG Licence, a copy of which you may download from 
 * http://www.tdg-seville.info/License.html
 --%>

<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl"	uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>

<form:form action="${requestURI}" modelAttribute="customer">
	<form:hidden path="id"/>
	<form:hidden path="version"/>
	<form:hidden path="userAccount.authorities"/>
	<form:hidden path="userAccount.id"/>
	<form:hidden path="userAccount.version"/>
	
	
<table style="border: medium solid blue; border-collapse: collapse;">
	
	<tr>
	<td>
	<br />
	<br>
	<form:label path="userAccount.username" >
		<spring:message code="customer.userName"/>
	</form:label>
	<form:input path="userAccount.username"/>
	<form:errors cssClass="error" path="userAccount.username" />
	<br /><br />
	
	</td>
	<td>
	<br />
	<br>
	
	<form:label path="userAccount.password">
		<spring:message code="customer.password" />:
	</form:label>
	<form:password path="userAccount.password" />
	<form:errors cssClass="error" path="userAccount.password" />
	<br /><br />
	
	</td>
	</tr>
	
	<tr>
	<td>
		
	<form:label path="name">
		<spring:message code="customer.name"/>
	</form:label>:&nbsp;&nbsp;&nbsp;
	<form:input path="name"/>
	<form:errors cssClass="error" path="name"/>
	<br /><br />
	
	</td>
	
		<td>
		
	<form:label path="surname">
		<spring:message code="customer.surname"/>
	</form:label>:&nbsp;&nbsp;&nbsp;
	<form:input path="surname"/>
	<form:errors cssClass="error" path="name"/>
	<br /><br />
	
	</td>
	
	<tr>
			<td>
		
	<form:label path="middleName">
		<spring:message code="customer.middleName"/>
	</form:label>:&nbsp;&nbsp;&nbsp;
	<form:input path="middleName"/>
	<form:errors cssClass="error" path="middleName"/>
	<br /><br />
	
	</td>
	
				<td>
		
	<form:label path="email">
		<spring:message code="customer.email"/>
	</form:label>:&nbsp;&nbsp;&nbsp;
	<form:input path="email"/>
	<form:errors cssClass="error" path="email"/>
	<br /><br />
	
	</td>
	
	</tr>
	
		<tr>
			<td>
		
	<form:label path="photo">
		<spring:message code="customer.photo"/>
	</form:label>:&nbsp;&nbsp;&nbsp;
	<form:input path="photo"/>
	<form:errors cssClass="error" path="photo"/>
	<br /><br />
	
	</td>
	
				<td>
		
	<form:label path="phoneNumber">
		<spring:message code="customer.phoneNumber"/>
	</form:label>:&nbsp;&nbsp;&nbsp;
	<form:input path="phoneNumber"/>
	<form:errors cssClass="error" path="phoneNumber"/>
	<br /><br />
	
	</td>
					<td>
		
	<form:label path="address">
		<spring:message code="customer.address"/>
	</form:label>:&nbsp;&nbsp;&nbsp;
	<form:input path="address"/>
	<form:errors cssClass="error" path="address"/>
	<br /><br />
	
	</td>
	
	</tr>
	
	

	
</table>

<table style="border: medium solid blue; border-collapse: collapse;">

		<tr>
			<td>
		
	<form:label path="creditCard.holderName">
		<spring:message code="customer.creditCard.holderName"/>
	</form:label>:&nbsp;&nbsp;&nbsp;
	<form:input path="creditCard.holderName"/>
	<form:errors cssClass="error" path="creditCard.holderName"/>
	<br /><br />
	
	</td>
	
				<td>
		
	<form:label path="creditCard.brandName">
		<spring:message code="customer.creditCard.brandName"/>
	</form:label>:&nbsp;&nbsp;&nbsp;
	<form:input path="creditCard.brandName"/>
	<form:errors cssClass="error" path="creditCard.brandName"/>
	<br /><br />
	
	</td>
					<td>
		
	<form:label path="creditCard.cardNumber">
		<spring:message code="customer.creditCard.cardNumber"/>
	</form:label>:&nbsp;&nbsp;&nbsp;
	<form:input path="creditCard.cardNumber"/>
	<form:errors cssClass="error" path="creditCard.cardNumber"/>
	<br /><br />
	
	</td>
	
	</tr>
	
			<tr>
			<td>
		
	<form:label path="creditCard.expirationMonth">
		<spring:message code="customer.creditCard.expirationMonth"/>
	</form:label>:&nbsp;&nbsp;&nbsp;
	<form:input path="creditCard.expirationMonth"/>
	<form:errors cssClass="error" path="creditCard.expirationMonth"/>
	<br /><br />
	
	</td>
	
				<td>
		
	<form:label path="creditCard.expirationYear">
		<spring:message code="customer.creditCard.expirationYear"/>
	</form:label>:&nbsp;&nbsp;&nbsp;
	<form:input path="creditCard.expirationYear"/>
	<form:errors cssClass="error" path="creditCard.expirationYear"/>
	<br /><br />
	
	</td>
					<td>
		
	<form:label path="creditCard.CVV">
		<spring:message code="customer.creditCard.CVV"/>
	</form:label>:&nbsp;&nbsp;&nbsp;
	<form:input path="creditCard.CVV"/>
	<form:errors cssClass="error" path="creditCard.CVV"/>
	<br /><br />
	
	</td>
	
	</tr>

</table>

	
	<input type="submit" name="save"
		   value="<spring:message code="customer.save"/>" />
	&nbsp;	
	<input type="button" name="cancel" 
		   value="<spring:message code="customer.cancel"/>" 
		   onclick="javascript: window.location.replace('welcome.do');" />
	<br />
</form:form>