<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<header style="background-color:#dfe2e6" class="d-flex justify-content-between align-items-center">
			<h1 class="pt-2 pl-3">Pingstagram</h1>
			<c:if test="${not empty userId }">
				<div class="mr-3"> ${userName }님<a href="/user/signout">로그아웃</a></div>
			</c:if>
		</header>