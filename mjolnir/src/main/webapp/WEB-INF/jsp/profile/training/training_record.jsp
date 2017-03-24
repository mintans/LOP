<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="<c:url value="/"/>view/template/css/bootstrap.min.css" />
        <link rel="stylesheet" href="<c:url value="/"/>view/template/css/bootstrap-theme.min.css" />
        <script src=https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js></script>
        <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery.tablesorter/2.9.1/jquery.tablesorter.min.js"></script>

        <script src="<c:url value="/"/>view/template/js/bootstrap.min.js" ></script>
        <script src="<c:url value="/"/>js/app.js"></script>

        <script src="<c:url value="/"/>js/sortTable/jquery-latest.js" type="text/javascript"></script>
        <script src="<c:url value="/"/>js/sortTable/jquery.tablesorter.js" type="text/javascript"></script>
        <link href="<c:url value="/"/>js/sortTable/themes/blue/style.css" rel="stylesheet" type="text/css"/>
        <script type="text/javascript">
            $(function () {
                $("table").tablesorter({debug: true});
            });
        </script>

        <title>Training View</title>
    </head>
    <body onload="autoID('${trainingRecordId}')">
        <div class="container-fluid">            
            <div class="row">
                <%@ include file="/WEB-INF/jsp/header.jsp" %>               
            </div>
            <nav class="breadcrumb">
                <c:forEach var="profileItem" items="${profileList}">
                    <c:if test="${profileid == profileItem.id}">
                        <a class="breadcrumb-item" href="<c:url value="/main/profile"/>">Profile</a> / 
                        <a class="breadcrumb-item" href="<c:url value="/"/>main/profile/viewTH/${profileItem.id}"/>${profileItem.id}</a> / 
                        <span class="breadcrumb-item active">training</span>
                    </c:if>
                </c:forEach>
            </nav>


            <div class="row">
                <div class="col-md-2">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <%@ include file="/WEB-INF/jsp/profile/sidebar.jsp" %>
                        </div>
                    </div>
                </div>
                <div class="col-md-10">
                    <div class="panel panel-primary">
                        <div class="panel-heading col-md-12">
                            <div class="col-md-12" align="left" style="margin-top: 5px;margin-bottom: 7px">
                                <h4 class="panel-title">Training Record</h4>
                            </div>
                        </div>
                        <div class="panel-body">
                            <c:forEach var="profileItem" items="${profileList}">
                                <c:if test="${profileid == profileItem.id}">
                                    <div class="row">
                                        <div class="col-md-offset-1 col-md-8">
                                            <br>
                                            <label>รหัสพนักงาน : ${trainingItem.id}   
                                                <c:if test="${trainingItem.title == 1}">นาย</c:if>
                                                <c:if test="${trainingItem.title == 2}">นาง</c:if>
                                                <c:if test="${trainingItem.title == 3}">นางสาว</c:if>
                                                ${trainingItem.firstName}   ${trainingItem.lastName}
                                            </label>
                                        </div>
                                        <div class="col-md-3" align="right">
                                            <br>
                                            <c:if test="${userInfo.user.permission == 'ADMIN'}">
                                                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">Add New Training</button>
                                            </c:if>
                                        </div>

                                        <!-- Modal -->
                                        <div class="modal fade" id="myModal" role="dialog" data-keyboard="false" data-backdrop="static">
                                            <div class="modal-dialog">

                                                <!-- Modal content-->
                                                <div class="modal-content">
                                                    <div class="form-horizontal">
                                                        <form method="POST" action="<c:url value="/main/trainingrecord/"/>save">
                                                            <div class="modal-header">
                                                                <button type="button" class="close" onclick="javascript:window.location.reload()" data-dismiss="modal">&times;</button>
                                                                <h4 class="modal-title">Add New Training</h4>
                                                            </div>
                                                            <div class="modal-body">

                                                                <div class="form-group">
                                                                    <label for="Subject" class="col-md-3 control-label" align="right">Subject : </label>
                                                                    <div class="col-md-7">
                                                                        <select id="subject" name="subject" onchange="getTrainingId()" class="form-control input-md" required="true">
                                                                            <option value="">Please Select</option>
                                                                            <c:forEach var="trainingList" items="${trainingList}">
                                                                                <option trainingId="${trainingList.id}" value="${trainingList.subject}">${trainingList.subject}</option>
                                                                            </c:forEach>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="Training Date" class="col-md-3 control-label" align="right">Training Date : </label>
                                                                    <div class="col-md-7">
                                                                        <input type="date" class="form-control" id="trainingDate" name="trainingDate" required="true">
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="Description" class="col-md-3 control-label" align="right">Description :</label>
                                                                    <div class="col-md-7">
                                                                        <textarea style="overflow:auto;resize:none" rows="5" cols="5" class="form-control" id="description" name="description"></textarea>
                                                                    </div>
                                                                </div>
                                                                <input type="hidden" class="form-control" id="profileId" name="profileId" value="${trainingItem.id}">
                                                                <input type="hidden" class="form-control" id="trainingId" name="trainingId">
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="submit" class="btn btn-primary">Add</button>
                                                                <button type="button" class="btn btn-default" data-dismiss="modal" onclick="javascript:window.location.reload()">Cancel</button>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <br>
                                    <c:if test="${empty profileList}">
                                        <p align="center">ยังไม่มีการเพิ่มข้อมูล</p>
                                    </c:if>
                                    <div style="height:291px;overflow:auto;">
                                        <table id="trainingTable" class="table table-bordered">
                                            <thead>
                                                <tr class="bg-primary">
                                                    <th><div align="center">No.</div></th>
                                                    <th><div align="center">ID</div></th>
                                                    <th><div align="center">Subject</div></th>
                                                    <th><div align="center">Description</div></th>
                                                    <th><div align="center">Date</div></th>
                                                        <c:if test="${userInfo.user.permission == 'ADMIN'}">
                                                        <th><div align="center">Option</div></th>
                                                        </c:if>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:set var="countNo" value="1" scope="page"/>
                                                <c:forEach var="trainingRecordList" items="${trainingRecordList}">
                                                    <c:if test="${trainingRecordList.profileId == profileid}">
                                                        <tr>
                                                            <td align="center">${countNo}</td>
                                                            <td align="center">${trainingRecordList.trainingId}</td>
                                                            <td align="center">${trainingRecordList.subject}</td>
                                                            <td align="center">${trainingRecordList.description}</td>
                                                            <td align="center"></td>
                                                            <c:if test="${userInfo.user.permission == 'ADMIN'}">
                                                                <td align="center"><a href="<c:url value="/"/>main/trainingrecord/delete/${trainingRecordList.id}"class="btn btn-danger">Delete</a></td>
                                                            </c:if>
                                                        </tr>
                                                    <script language="JavaScript" type="text/JavaScript">
                                                        addEventListener("load", function () {
                                                        changeDateFunction("${trainingRecordList.trainingDate}","${countNo}");
                                                        }, true);
                                                    </script>
                                                    <c:set var="countNo" value="${countNo+1}" scope="page"/>
                                                </c:if>

                                            </c:forEach>
                                            </tbody>
                                        </table>               
                                    </div>
                                </c:if>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
            <script>
                function changeDateFunction(date, row) {
                    var trainingDate = date;
                    var trainingDateDate = new Date(trainingDate);
                    var trainingDateMonth = trainingDateDate.getMonth();
                    var month = ["January", "February", "March", "April", "May", "June",
                        "July", "August", "September", "October", "November", "December"];

                    var trainingDateChange = trainingDateDate.getDate() + ' ' + month[trainingDateMonth] + ' ' + trainingDateDate.getFullYear();
                    document.getElementById("trainingTable").rows[parseInt(row)].cells[4].innerHTML = trainingDateChange;
                }
            </script>

            <script type="text/javascript">
                function getTrainingId() {
                    var trainingSelect = document.getElementById("subject");
                    var trainingSelectValue = trainingSelect.options[trainingSelect.selectedIndex].value;
                    var trainingId = trainingSelect.options[trainingSelect.selectedIndex].getAttribute('trainingId');
                    $(".modal-body #trainingId").val(trainingId);
                }
            </script>
    </body>
</html>
