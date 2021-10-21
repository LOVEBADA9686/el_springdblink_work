<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학과 테이블</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

	function insertPopup(){
		alert("insertPopup() >>> : ");
		$("#deptid").val("");
		window.open("selectDepartment.k?deptid=", "", "width=500, height=280");
		$("#popupForm").attr("action", "");
		$("#popupForm").attr("target","pop");
		$("#popupForm").submit();		
	}
	
	function updatePopup(deptid){
		alert("updatePopup() >>> : deptid ::: " + deptid);		
		window.open("selectDepartment.k?deptid="+deptid, "", "width=500, height=280");
		$("#popupForm").attr("action", "");
		$("#popupForm").attr("target", "pop");
		$("#popupForm").submit();		
	}
	
	function listSearch(deptname){
		alert("listSearch() >>> : ");
		$("#searchForm").attr("action", "listDepartment.k");
		$("#searchForm").submit();		
	}
</script>
<!-- 
<style type="text/css">
	table{width=:570px}
	#searchForm table th{width:114px}
	#searchForm table td{width:104px; text-align:center;}
	#deptname{width:328px}
</style>
 -->
</head>
<body>
	<form id="popupForm" name="popupFrom" method="POST">
		<input type="hidden" name="deptid" id="deptid"/>
	</form>
	<div>
		<table>
			<tr><th><h4>학과테이블[Spring]</h4></th></tr>
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
					<th>학과코드</th>
					<th>학과명</th>
					<th>전화번호</th>
					<th>상세보기</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty departmentList}">
					<tr>
						<td colspan="5" align="center">
						 	등록된 학과 정보가 존재하지 않습니다.</td>
					</tr>
				</c:if>
				<c:forEach items="${departmentList}" var="row">
					<tr>
						<td align="center">${row.deptid}</td>
						<td align="left">${row.deptname}</td>
						<td align="center">${row.depttel}</td>
						<td align="center">
							<input type="button" value="[수정/삭제]"
							onclick="updatePopup('${row.deptid}')"/></td>
					</tr>
				</c:forEach>
					<tr>
						<td colspan="3" align="center">
						처리할 버튼을 선택하세요</td>
						<td align="center">
						<input type="button" onclick="insertPopup()" value="[등 록]" />
						</td>
					</tr>
			</tbody>
		
	<p></p>
	<div><!-- search -->
		<form id="searchForm" name="searchForm" method="POST">
				<table border="1" cellpadding="1" cellspacing="1">
					<tr>
						<th>학 과 명</th>
						<td><input type="text" id="deptname" name="deptname" /></td>
						<td><input type="button" onclick="listSearch()" value="검색" /></td>
					</tr>
				</table>	
		</form>
	</div>
</table>
</div>
</body>
</html>