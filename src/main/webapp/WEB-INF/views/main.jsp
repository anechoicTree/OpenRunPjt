<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url value="/resources/main/css/main.css" var="css" />
<c:url value="/resources/header.css" var="css2" />
<!-- <c:url value="/resources/main/js/main.js" var="js" /> -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Main</title>
<link rel="stylesheet" href="${css}">
<link rel="stylesheet" href="${css2}">

<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
	<%@ include file="./common/header.jsp" %>
	<%@ include file="./common/main_banner.jsp" %>
	<%@ include file="./common/footer.jsp" %>
	<%@ include file="./common/commonJs.jsp" %>
</body>
