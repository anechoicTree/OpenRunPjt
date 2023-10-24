<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Search Results</title>
</head>
<body>


<h2>Search Results</h2>

<!-- 검색된 결과가 없을 경우의 메시지 -->
<c:if test="${empty searchResults}">
    <p>No notices found for the given search keyword.</p>
</c:if>

<!-- 검색된 결과를 나열합니다 -->
<c:if test="${!empty searchResults}">
    <table border="1">
        <thead>
            <tr>
                <th>Number</th>
                <th>Category</th>
                <th>Title</th>
                <th>Body</th>
                <th>Date</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${searchResults}" var="search">
                <tr>
                    <td>${search.cno}</td>
                    <td>${search.title}</td>
                      <td>${search.rsvStart}</td>
                    <td>${search.rsvEnd}</td>
                    <td>${search.pfmDate}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</c:if>
</body>
</html>
