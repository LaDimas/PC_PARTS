<%@ page contentType="text/html;charset=utf-8" language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link href="<c:url value="/res/style.css"/>" rel="stylesheet" type="text/css"/>
<link rel="icon" type="image/png" href="<c:url value="/res/icon.png"/>" />
<c:choose>
    <c:when test="${empty part.title}">
        <title>Добавить деталь</title>
    </c:when>
    <c:otherwise>
        <title>Редактировать</title>
    </c:otherwise>
</c:choose>
</head>
<body>
<c:url value="/add" var="addUrl"/>
<c:url value="/edit" var="editUrl"/>
<form class="style" action="${empty part.title ? addUrl : editUrl}" name="part" method="POST">
<c:choose>
    <c:when test="${!empty part.title}">
        <p class="heading">Редактировать</p>
        <input type="hidden" name="id" value="${part.id}">
    </c:when>
    <c:otherwise>
        <p class="heading">Добавить новую деталь</p>
    </c:otherwise>
</c:choose>
<p><input type="text" name="title" placeholder="название" value="${part.title}" maxlength="100" required autofocus
          pattern="^[^\s]+(\s.*)?$">
<p><input type="number" name="quantity" placeholder="количество" value="${part.quantity}" maxlength="7" required
          oninput="if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);">
<p class="checkbox">
    <label for="required">необходимость
        <c:if test="${part.required == true}">
            <input type="checkbox" name="required" id="required" value="${part.required}" checked>
        </c:if>
        <c:if test="${part.required != true}">
            <input type="checkbox" name="required" id="required">
        </c:if>
        <span class="checkbox-common checkbox-no">нет</span>
        <span class="checkbox-common checkbox-yes">да</span>
    </label>
</p>
<p>
    <c:set value="Добавить" var="add"/>
    <c:set value="Применить" var="edit"/>
    <input type="submit" value="${empty part.title ? add : edit}">
</p>
<p class="heading">${message}</p>
</form>
</body>
</html>
