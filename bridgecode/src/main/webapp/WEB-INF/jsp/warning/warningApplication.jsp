<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비매너 신고 현황</title>
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css">
<script>
	$(function() {
		$("#warningListTable").DataTable({
			"columns" : [ {
				"data" : "WARNING_ID"
			}, {
				"data" : "WARNING_FROM_ID"
			}, {
				"data" : "WARNING_TO_ID"
			}, {
				"data" : "WARNING_TIME"
			}, {
				"data" : "WARNING_REASON"
			}, {
				"data" : "신고정황 보기"
			}, {
				"data" : "경고"
			}, {
				"data" : "기각"
			} ]
		});
		//모달 창 cashe 삭제
		$('body').on('hidden.bs.modal', '.modal', function() {
			$(this).removeData('bs.modal');
		});
	})
</script>
<style>
.appth th {
	text-align: center;
}

.apptd td {
	text-align: center;
}

a {
	cursor: pointer;
}
</style>
<style>
.modal-backdrop {
	z-index: -1;
}
</style>
</head>
<body>
	<div class="col-md-12">
		<div class="card card-plain">
			<div class="card-header" data-background-color="purple">
				<h4 class="title">비매너 신고 현황</h4>
				<p class="category">신고 처리를 기다리는 채팅 내역입니다.</p>
			</div>
			<div class="card-content table-responsive">
				<table id="warningListTable" class="table table-hover">
					<thead class="appth">
						<tr>
							<th>순서</th>
							<th>신고 회원</th>
							<th>신고 당한 회원</th>
							<th>신고일</th>
							<th>신고사유</th>
							<th>신고정황 보기</th>
							<th>경고</th>
							<th>기각</th>
						</tr>
					</thead>
					<tbody class="apptd">
						<c:forEach items="${warningList}" var="warnList">
							<tr>
								<td>${warnList.WARNING_ID}</td>
								<td>${warnList.WARNING_FROM_ID}</td>
								<td>${warnList.WARNING_TO_ID}</td>
								<td>${warnList.WARNING_TIME}</td>
								<td>${warnList.WARNING_REASON}</td>
								<td><a
									href="selChatContext.do?warningId=${warnList.WARNING_ID}&warningFromId=${warnList.WARNING_FROM_ID}&warningToId=${warnList.WARNING_TO_ID}"
									data-toggle="modal" data-target="#userSelModal">상세보기</a> <!-- Modal -->
									<div class="modal fade" id="userSelModal"
										style="padding: 50px 35px;" role="dialog">
										<div class="modal-dialog">
											<!-- Modal content -->
											<div class="modal-content"></div>
										</div>
									</div></td>
								<td><a
									onClick="if(confirm('해당 회원에게 경고하시겠습니까?')) location.href='updateWarningApplication.do?warningId=${warnList.WARNING_ID}'">승인</a></td>
								<td><a
									onClick="if(confirm('신고를 기각하시겠습니까?')) location.href='updateWarningReject.do?warningId=${warnList.WARNING_ID}'">기각</a></td>



							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>


</body>
</html>