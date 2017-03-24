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

        <title>Employment View</title>
    </head>
    <body>
        <div class="container-fluid">            
            <div class="row">
                <%@ include file="/WEB-INF/jsp/header.jsp" %>               
            </div>
            <nav class="breadcrumb">
                <c:forEach var="profileItem" items="${profileList}">
                    <c:if test="${profileid == profileItem.id}">
                        <a class="breadcrumb-item" href="<c:url value="/main/profile"/>">Profile</a> / 
                        <a class="breadcrumb-item" href="<c:url value="/"/>main/profile/viewTH/${profileItem.id}"/>${profileItem.id}</a> / 
                        <span class="breadcrumb-item active">employment</span>
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
                                <h4 class="panel-title">Employment</h4>
                            </div>
                        </div>
                        <div class="panel-body">
                            <c:forEach var="profileItem" items="${profileList}">
                                <c:if test="${profileid == profileItem.id}">
                                    <div class="row">
                                        <div class="col-md-offset-1 col-md-8">
                                            <br>
                                            <label>รหัสพนักงาน : ${employmentItem.id}   
                                                <c:if test="${employmentItem.title == 1}">นาย</c:if>
                                                <c:if test="${employmentItem.title == 2}">นาง</c:if>
                                                <c:if test="${employmentItem.title == 3}">นางสาว</c:if>
                                                ${employmentItem.firstName}   ${employmentItem.lastName}
                                            </label>
                                        </div>
                                    </div>
                                    <br>
                                    <div class="panel panel-primary">
                                        <div class="panel-body">
                                            <div class="row">
                                                <div class="col-md-3" align="center">
                                                    <label>สถานะพนักงาน : ${employmentStatus}</label>
                                                </div>
                                                <div class="col-md-6">
                                                    <label>การจ้างงาน : ${userItem.employmentType}</label>
                                                </div>
                                                <div class="col-md-3" align="right">
                                                    <c:if test="${userInfo.user.permission == 'ADMIN'}">
                                                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">Add New Action</button>
                                                    </c:if>
                                                </div>

                                                <!-- Modal -->
                                                <div class="modal fade" id="myModal" role="dialog" data-keyboard="false" data-backdrop="static">
                                                    <div class="modal-dialog">

                                                        <!-- Modal content-->
                                                        <div class="modal-content">
                                                            <div class="form-horizontal">
                                                                <form method="POST" action="<c:url value="/main/employment/"/>save">
                                                                    <div class="modal-header">
                                                                        <button type="button" class="close" onclick="javascript:window.location.reload()" data-dismiss="modal">&times;</button>
                                                                        <h4 class="modal-title">Add New Action</h4>
                                                                    </div>
                                                                    <div class="modal-body">

                                                                        <div class="form-group">
                                                                            <label for="Action" class="col-md-3 control-label" align="right">Action : </label>
                                                                            <div class="col-md-7">
                                                                                <select id="action" name="action" class="form-control input-md" required="true">
                                                                                    <option value="">Please Select</option>
                                                                                    <option value="เริ่มงาน">เริ่มงาน</option>
                                                                                    <option value="เปลี่ยนสถานะ">เปลี่ยนสถานะ</option>
                                                                                    <option value="บริษัทส่งศึกษาต่อ">บริษัทส่งศึกษาต่อ</option>
                                                                                    <option value="ลาออก">ลาออก</option>
                                                                                    <option value="เลิกจ้าง">เลิกจ้าง</option>
                                                                                </select>
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label for="Type" class="col-md-3 control-label" align="right">Type : </label>
                                                                            <div class="col-md-7">
                                                                                <select id="type" name="type" class="form-control input-md" onchange="checkType()" required="true">
                                                                                    <option value="">Please Select</option>
                                                                                    <c:forEach var="employmentTypeList" items="${employmentTypeList}">
                                                                                        <option typeName="${employmentTypeList.typeName}" value="${employmentTypeList.employmentTypeName}">${employmentTypeList.employmentTypeName}</option>
                                                                                    </c:forEach>
                                                                                </select>
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group" id="dulationGroup">
                                                                            <label for="Dulation" class="col-md-3 control-label" align="right">Dulation : </label>
                                                                            <div class="col-md-7">
                                                                                <select id="dulation" name="dulation" class="form-control input-md">
                                                                                    <option value="">Please Select</option>
                                                                                    <option value="1">1</option>
                                                                                    <option value="2">2</option>
                                                                                    <option value="3">3</option>
                                                                                    <option value="4">4</option>
                                                                                    <option value="5">5</option>
                                                                                    <option value="6">6</option>
                                                                                </select>
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label for="Date" class="col-md-3 control-label" align="right">Date : </label>
                                                                            <div class="col-md-7">
                                                                                <input type="date" class="form-control" id="date" name="date" required="true">
                                                                            </div>
                                                                        </div>
                                                                        <input type="hidden" class="form-control" id="profileId" name="profileId" value="${employmentItem.id}">
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
                                                <table id="employmentTable" class="table table-bordered">
                                                    <thead>
                                                        <tr class="bg-primary">
                                                            <th><div align="center">No.</div></th>
                                                            <th><div align="center">Action</div></th>
                                                            <th><div align="center">Type</div></th>
                                                            <th><div align="center">Dulation</div></th>
                                                            <th><div align="center">Date</div></th>
                                                                <c:if test="${userInfo.user.permission == 'ADMIN'}">
                                                                <th><div align="center">Option</div></th>
                                                                </c:if>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:set var="countNo" value="1" scope="page"/>
                                                        <c:forEach var="employmentList" items="${employmentList}">
                                                            <c:if test="${employmentList.profileId == profileid}">
                                                                <tr>
                                                                    <td align="center">${countNo}</td>
                                                                    <td align="center">${employmentList.action}</td>
                                                                    <td align="center">${employmentList.type}</td>
                                                                    <td align="center">${employmentList.dulation}</td>
                                                                    <td align="center"></td>
                                                                    <c:if test="${userInfo.user.permission == 'ADMIN'}">
                                                                        <td align="center">
                                                                            <c:forEach var="employmentTypeList" items="${employmentTypeList}">
                                                                                <c:if test="${employmentList.type == employmentTypeList.employmentTypeName}">
                                                                                    <c:set var="typeName" value="${employmentTypeList.typeName}"></c:set>
                                                                                </c:if>
                                                                            </c:forEach>
                                                                            <button type="button" class="btn btn-warning" id="btnEdit" 
                                                                                    data-toggle="modal" data-target="#myModal"
                                                                                    data-index="${countNo}"
                                                                                    data-id="${employmentList.id}"
                                                                                    data-action="${employmentList.action}"
                                                                                    data-type="${employmentList.type}"
                                                                                    data-typeName="${typeName}"
                                                                                    data-dulation="${employmentList.dulation}"
                                                                                    data-date="${employmentList.date}"
                                                                                    >Edit</button>
                                                                            <a href="<c:url value="/"/>main/employment/delete/${employmentList.id}"class="btn btn-danger"> Delete</a>
                                                                        </td>
                                                                    </c:if>
                                                                </tr>
                                                            <script language="JavaScript" type="text/JavaScript">
                                                                addEventListener("load", function () {
                                                                changeDateFunction("${employmentList.date}","${countNo}");
                                                                }, true);
                                                            </script>
                                                            <c:set var="countNo" value="${countNo+1}" scope="page"/>
                                                        </c:if>
                                                    </c:forEach>
                                                    </tbody>
                                                </table>               
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
            <script>
                function changeDateFunction(date, row) {
                    var employmentDate = date;
                    var employmentDateDate = new Date(employmentDate);
                    var employmentDateMonth = employmentDateDate.getMonth();
                    var month = ["January", "February", "March", "April", "May", "June",
                        "July", "August", "September", "October", "November", "December"];

                    var employmentDateChange = employmentDateDate.getDate() + ' ' + month[employmentDateMonth] + ' ' + employmentDateDate.getFullYear();
                    document.getElementById("employmentTable").rows[parseInt(row)].cells[4].innerHTML = employmentDateChange;
                }
            </script>
            <script type="text/javascript">
                $('#employmentTable').find('#btnEdit').click(function () {
                    $(".modal-title").html("Edit Action");
                    $(".modal-footer").find('.btn-primary').html("Save");
                    $(".modal-footer").find('.btn-primary').attr('class', 'btn btn-success');
                    $('<input>').attr({
                        type: 'hidden',
                        class: 'form-control',
                        id: 'id',
                        name: 'id'
                    }).appendTo('.modal-body');
                    var employmentId = $(this).attr('data-id');
                    var employmentAction = $(this).attr('data-action');
                    var employmentType = $(this).attr('data-type');
                    var employmentTypeName = $(this).attr('data-typeName');
                    var employmentDulation = $(this).attr('data-dulation');
                    var employmentDate = $(this).attr('data-date');
                    if (employmentTypeName == "permanent") {
                        $(".modal-body").find('#dulation').attr('required', false);
                        $(".modal-body #dulation").val("");
                        $(".modal-body").find('#dulationGroup').hide();
                    } else if (employmentTypeName == "duration") {
                        $(".modal-body").find('#dulation').attr('required', true);
                        $(".modal-body #dulation").val(employmentDulation);
                        $(".modal-body").find('#dulationGroup').show();
                    }
                    $(".modal-body #id").val(employmentId);
                    $(".modal-body #action").val(employmentAction);
                    $(".modal-body #type").val(employmentType);
                    $(".modal-body #date").val(employmentDate);
                });
            </script>

            <script type="text/javascript">
                function checkType() {
                    var employmentSelect = document.getElementById("type");
                    var employmentSelectValue = employmentSelect.options[employmentSelect.selectedIndex].value;
                    var dulationSelect = document.getElementById("dulation");
                    var dulationSelectValue = dulationSelect.options[dulationSelect.selectedIndex].value;
                    var typeName = employmentSelect.options[employmentSelect.selectedIndex].getAttribute('typeName');
                    if (typeName == "permanent") {
                        $(".modal-body").find('#dulation').attr('required', false);
                        $(".modal-body").find('#dulationGroup').hide();
                        $(".modal-body #dulation").val("");
                    } else if (typeName == "duration") {
                        $(".modal-body").find('#dulation').attr('required', true);
                        $(".modal-body").find('#dulationGroup').show();
                        $(".modal-body #dulation").val(dulationSelectValue);
                    }
                }
            </script>
    </body>
</html>
