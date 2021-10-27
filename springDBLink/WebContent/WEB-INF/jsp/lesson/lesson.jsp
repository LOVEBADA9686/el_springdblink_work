<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>과목 테이블</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	function insertPopup(){
		$("#no").val(0);
		window.open("", "pop", "width=480, height=250");
		$("#popupForm").attr("action", "/lesson/selectLesson.k");
		$("#popupForm").attr("target", "pop");
		$("#popupForm").submit();	
	}
	
	function updatePopup(no){
		$("#no").val(no);
		window.open("", "pop", "width=480, height=250");
		$("#popupForm").attr("action", "/lesson/selectLesson.k");
		$("#popupForm").attr("target", "pop");
		$("#popupForm").submit();	
	}
	
	function listSearch() {
			$("#searchForm").attr("action", "/lesson/listLesson.k");
			$("#searchForm").submit();
	}
</script>
<style type="text/css">

	table{width:570px}
	#searchForm table th{width:114px}
	#searchForm tavle td{width:104px; text-align:center;}
	#lname{width:328px}
</style>
</head>
<body>
	<form id="popupForm" name="popupForm" method="POST">
		<input type="hidden" id="no" name="no" />
	</form>
	<div>
		<table border="0" cellpadding="1" cellspacing="1">
			<tr>
				<th width="650"><h4>과목 테이블[Spring]</h4></th>
			</tr>
		</table>
	</div>
	<div>
		<table border="1">
			<colgroup>
				<col width="120px" />
				<col width="220px" />
				<col width="120px" />
				<col width="110px" />
			</colgroup>
			<thead>
			<tr>
				<th>번호</th>
				<th>과목코드</th>
				<th>과목명</th>
				<th>상세보기</th>
			</tr>
			</thead>
		<tbody>
			<c:if test="${empty lessonList}">
				<tr>
					<td colspan="5" align="center">
					등록된 과목 데이터가 존재하지 않습니다.</td>
				</tr>
			</c:if>
			<c:forEach items="${lessonList}" var="row">
				<tr align="center">
					<td>${row.no}</td>
					<td>${row.lnum}</td>
					<td>${row.lname}</td>
					<td><input type="button" value="[수정/삭제]" onclick="updatePopup(${row.no});"/></td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="3" align="center">
				처리할 버튼을 선택하세요.</td>
				<td align="center">
					<input type="button" value="[등록]" onclick="insertPopup()"/></td>
			</tr>
		</tbody>
	</table>
	</div>
	<p></p>
	<div><!-- search -->
		<form id="searchForm" name="searchForm" method="post">
			<div>
				<table border="1" cellpadding="1" cellspacing="1">
				<tr>
					<th width="100px">과 목 명</th>
					<td><input type="text" id="lname" name="lname"/></td>
					<td><input type="button" value="검색" onclick="listSearch()"/></td>
				</tr>
				</table>
			</div>
		</form>
	</div>
</body>
</html>