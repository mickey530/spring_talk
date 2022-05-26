<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--c태그 라이브러리 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>쪽지</h1>
	<table border="1">
		<thead>
			<tr>
				<th>쪽지번호</th>
				<th>받는사람</th>
				<th>보낸사람</th>
				<th>내용</th>
				<th>날짜</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="note" items="${noteList}">
				<tr>
					<td>${note.note_num}</td>
					<td>${note.note_recipient}</td>
					<td>${note.note_sender}</td>
					<td><a href="http://localhost:8181/user/noteDetail/${note.note_num}">${note.note_content}</a></td>
					<td>${note.regdate}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<a href="http://localhost:8181/user/noteInsert/${note_recipient}" class="btn btn-success">쪽지쓰기</a>
	
	
	
	
	
	
	
	
	
	
</body>
