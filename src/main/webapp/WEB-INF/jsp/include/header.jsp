<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<header class="d-flex justify-content-between align-items-center">
			<h1 class="pt-2 pl-3">Pingstagram</h1>
			<c:if test="${not empty userId }">
				<div class="d-flex justify-content-end">
					<div class="ml-2"><b>${loginId}</b></div>
					<a href="/post/create/view" class="ml-2 mr-3"><i class="bi bi-plus-square"></i></a>
				</div>
			</c:if>
		</header>