<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>Hello Strust 2 </h1>
<s:form action="addDeparts">
<s:textfield label="Name Departs" name="nameDeparts"></s:textfield>
<s:submit value="Submit"></s:submit>
</s:form>
</body>
</html>