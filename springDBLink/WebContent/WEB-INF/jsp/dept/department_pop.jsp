<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>학과 테이블 팝업</title>
<style type="text/css">
	.required{color:red;}
	table{width:400px;}
	table th{width:120px; text-align:left;}
	input[type="text"] {width:300px;}
</style>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		
		
			var mode = "${mode}";
			console.log(mode);
			if(mode == "insert"){
				$("#insertData").attr('disabled', false);
				$("#updateData").attr('disabled',true);
				$("#deleteData").attr('disabled', true);
			}else if(mode == "update"){
				$("#insertData").attr('disabled', true);
				$("#updateData").attr('disabled', false);
				
				$("#deleteData").attr('disabled', false);
			}
			
			$("#insertData").click(function(){
				if(!validateForm()) return;
				if(confirm('등록을 진행할까요?')){
					$("#deptForm").attr("action", "insertDepartment.k");
					
					$("#deptForm").submit();
				}
			});
			
			$("#updateData").click(function(){
				if(!validateForm()) return;
				
				if(confirm('수정을 진행할까요?')){
					$("#deptForm").attr("action", "updateDepartment.k");
					
					$("#deptForm").submit();
					
				}
				console.log("aaaaaaaaaaaaaaaaaaaaaaaa");
			});
			
			$("#deleteData").click(function(){
				// fi(!validateForm()) return;
				if(confirm('삭제를 진행할까요?')){
					$("#deptForm").attr("action", "deleteDepartment.k");
					$("#deptForm").submit();
				}
			});
			
			$("#closeWindow").click(function(){
				window.close();
			});
	});
	
	function validateForm(){
		if($("#deptid").val().replace(/\s/g,"")==""){
			alert('학과코드를 입력하세요.');
			return false;
		}
		if($("#deptname").val().replace(/\s/g,"")==""){
			alert('학과명을 입력하세요.');
			return false;
		}
		return true;
	}

</script>
</head>
<body>
<p></p>
<div>
<form id="deptForm" name="deptForm" method="GET">
<table board="1">
<thead>
	<tr>
		<td colspan="2" align="center">
			<h4>학과 테이블 팝업창 [Spring]</h4>
		</td>
	</tr>
</thead>
<tbody>
	<tr>
		<th><span class="required">*</span>학과코드</th>
		<td>
			<input type="text" id="deptid" name="deptid" value="${DeptVO.deptid}">
		</td>
	</tr>
	<tr>
		<th><span class="required">*</span>학과명</th>
		<td>
			<input type="text" id="deptname" name="deptname" value="${DeptVO.deptname}">
		</td>
	</tr>
	<tr>
		<th><span class="required">*</span>전화번호</th>
		<td>
			<input type="text" id="depttel" name="depttel" value="${DeptVO.depttel}">
		</td>
	</tr>
</tbody>
</table>
</form>
</div>
<div>
<p></p>
<table boarder="0">
	<tr align="center">
		<td><input type="button" id="insertData" value="등록" /></td>
		<td><input type="button" id="updateData" value="수정" /></td>
		<td><input type="button" id="deleteData" value="삭제" /></td>
		<td><input type="button" id="closeWindow" value="닫기" /></td>
	</tr>
</table>
</div>
</body>
</html>