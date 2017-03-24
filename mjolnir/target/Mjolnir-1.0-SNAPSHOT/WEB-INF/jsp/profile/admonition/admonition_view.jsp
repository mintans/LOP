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

        <title>Admonition View</title>
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
                        <span class="breadcrumb-item active">admonition</span>
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
                                <h4 class="panel-title">Admonition Record</h4>
                            </div>
                        </div>
                        <div class="panel-body">
                            <c:forEach var="profileItem" items="${profileList}">
                                <c:if test="${profileid == profileItem.id}">
                                    <div class="row">
                                        <div class="col-md-offset-1 col-md-8">
                                            <br>
                                            <label>รหัสพนักงาน : ${admonitionItem.id}   
                                                <c:if test="${admonitionItem.title == 1}">นาย</c:if>
                                                <c:if test="${admonitionItem.title == 2}">นาง</c:if>
                                                <c:if test="${admonitionItem.title == 3}">นางสาว</c:if>
                                                ${admonitionItem.firstName}   ${admonitionItem.lastName}
                                            </label>
                                        </div>
                                        <div class="col-md-3" align="right">
                                            <br>
                                            <c:if test="${userInfo.user.permission == 'ADMIN'}">
                                                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">Add New Admonition</button>
                                            </c:if>
                                        </div>

                                        <!-- Modal -->
                                        <div class="modal fade" id="myModal" role="dialog" data-keyboard="false" data-backdrop="static">
                                            <div class="modal-dialog">

                                                <!-- Modal content-->
                                                <div class="modal-content">
                                                    <div class="form-horizontal">
                                                        <form method="POST" action="<c:url value="/main/admonition/"/>save">
                                                            <div class="modal-header">
                                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                                <h4 class="modal-title">Add New Subject</h4>
                                                            </div>
                                                            <div class="modal-body">

                                                                <div class="form-group">
                                                                    <label for="Subject" class="col-md-3 control-label" align="right">Subject : </label>
                                                                    <div class="col-md-7">
                                                                        <select id="subject" name="subject" class="form-control input-md" required="true">
                                                                            <option value="">Please Select</option>
                                                                            <option value="เข้างานสาย">เข้างานสาย</option>
                                                                            <option value="ไม่ตั้งใจทำงาน">ไม่ตั้งใจทำงาน</option>
                                                                            <option value="อื่นๆ">อื่นๆ</option>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="Warning Date" class="col-md-3 control-label" align="right">Warning Date : </label>
                                                                    <div class="col-md-7">
                                                                        <input type="date" class="form-control" id="warningDate" name="warningDate" required="true">
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="Counselor" class="col-md-3 control-label" align="right">Counselor : </label>
                                                                    <div class="col-md-7">
                                                                        <input type="text" class="form-control" id="counselor" name="counselor" required="true">
                                                                    </div>
                                                                </div>

                                                                <div class="form-group">
                                                                    <label for="warningBy" class="col-md-3 control-label" align="right">By :</label>
                                                                    <div class="col-md-7">
                                                                        <select id="warningBy" name="warningBy" class="form-control input-md" required="true">
                                                                            <option value="">Please Select</option>
                                                                            <option value="speech">Speech</option>
                                                                            <option value="letter">Letter</option>
                                                                        </select>
                                                                    </div>
                                                                </div>

                                                                <div class="form-group">
                                                                    <label for="detail" class="col-md-3 control-label" align="right">Detail :</label>
                                                                    <div class="col-md-7">
                                                                        <textarea style="overflow:auto;resize:none" rows="5" cols="5" class="form-control" id="detail" name="detail"  required="true"></textarea>
                                                                    </div>
                                                                </div>
                                                                <input type="hidden" class="form-control" id="profileId" name="profileId" value="${admonitionItem.id}">

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
                                        <table id="admonitionTable" class="table table-bordered">
                                            <thead>
                                                <tr class="bg-primary">
                                                    <th><div align="center">No.</div></th>
                                                    <th><div align="center">Subject</div></th>
                                                    <th><div align="center">Warning Date</div></th>
                                                    <th><div align="center">Counselor</div></th>
                                                    <th><div align="center">By</div></th>
                                                    <th><div align="center">Detail</div></th>
                                                        <c:if test="${userInfo.user.permission == 'ADMIN'}">
                                                        <th><div align="center">Option</div></th>
                                                        </c:if>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:set var="countNo" value="1" scope="page"/>
                                                <c:forEach var="admonitionList" items="${admonitionList}">
                                                    <c:if test="${admonitionList.profileId == profileid}">
                                                        <tr>
                                                            <td align="center">${countNo}</td>
                                                            <td align="center">${admonitionList.subject}</td>
                                                            <td align="center"></td>
                                                            <td align="center">${admonitionList.counselor}</td>
                                                            <td align="center">${admonitionList.warningBy}</td>
                                                            <td align="center">${admonitionList.detail}</td>
                                                            <c:if test="${userInfo.user.permission == 'ADMIN'}">
                                                                <td align="center">
                                                                    <button type="button" class="btn btn-warning" id="btnEdit" 
                                                                            data-toggle="modal" data-target="#myModal"
                                                                            data-index="${countNo}"
                                                                            data-id="${admonitionList.id}"
                                                                            data-subject="${admonitionList.subject}"
                                                                            data-warningDate="${admonitionList.warningDate}"
                                                                            data-counselor="${admonitionList.counselor}"
                                                                            data-warningBy="${admonitionList.warningBy}"
                                                                            data-detail="${admonitionList.detail}"
                                                                            >Edit</button>
                                                                    <a href="<c:url value="/"/>main/admonition/delete/${admonitionList.id}"class="btn btn-danger"> Delete</a>
                                                                </td>
                                                            </c:if>
                                                        </tr>
                                                    <script language="JavaScript" type="text/JavaScript">
                                                        addEventListener("load", function () {
                                                        changeDateFunction("${admonitionList.warningDate}","${countNo}");
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
                    var warningDate = date;
                    var warningDateDate = new Date(warningDate);
                    var warningDateMonth = warningDateDate.getMonth();
                    var month = ["January", "February", "March", "April", "May", "June",
                        "July", "August", "September", "October", "November", "December"];

                    var warningDateChange = warningDateDate.getDate() + ' ' + month[warningDateMonth] + ' ' + warningDateDate.getFullYear();
                    document.getElementById("admonitionTable").rows[parseInt(row)].cells[2].innerHTML = warningDateChange;
                }
            </script>
            <script type="text/javascript">
                $('#admonitionTable').find('#btnEdit').click(function () {
                    $(".modal-title").html("Edit Subject");
                    $(".modal-footer").find('.btn-primary').html("Save");
                    $(".modal-footer").find('.btn-primary').attr('class', 'btn btn-success');
                    $('<input>').attr({
                        type: 'hidden',
                        class: 'form-control',
                        id: 'id',
                        name: 'id'
                    }).appendTo('.modal-body');
                    var admonitionId = $(this).attr('data-id');
                    var admonitionSubject = $(this).attr('data-subject');
                    var admonitionWarningDate = $(this).attr('data-warningDate');
                    var admonitionCounselor = $(this).attr('data-counselor');
                    var admonitionWarningBy = $(this).attr('data-warningBy');
                    var admonitionDetail = $(this).attr('data-detail');
                    $(".modal-body #id").val(admonitionId);
                    $(".modal-body #subject").val(admonitionSubject);
                    $(".modal-body #counselor").val(admonitionCounselor);
                    $(".modal-body #warningDate").val(admonitionWarningDate);
                    $(".modal-body #warningBy").val(admonitionWarningBy);
                    $(".modal-body #detail").val(admonitionDetail);

                });

            </script>
    </body>
</html>
