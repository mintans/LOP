<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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

        <title>Employee Benefits View</title>
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
                        <span class="breadcrumb-item active">benefits</span>
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
                                <h4 class="panel-title">Employee Benefits</h4>
                            </div>
                        </div>
                        <div class="panel-body">
                            <c:forEach var="profileItem" items="${profileList}">
                                <c:if test="${profileid == profileItem.id}">
                                    <div class="row">
                                        <div class="col-md-offset-1 col-md-8">
                                            <br>
                                            <label>รหัสพนักงาน : ${profileBenefitsItem.id}   
                                                <c:if test="${profileBenefitsItem.title == 1}">นาย</c:if>
                                                <c:if test="${profileBenefitsItem.title == 2}">นาง</c:if>
                                                <c:if test="${profileBenefitsItem.title == 3}">นางสาว</c:if>
                                                ${profileBenefitsItem.firstName}   ${profileBenefitsItem.lastName}
                                            </label>
                                        </div>
                                        <div class="col-md-3" align="right">
                                            <br>
                                            <c:if test="${userInfo.user.permission == 'ADMIN'}">
                                                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">Add Benefits</button>
                                            </c:if>
                                        </div>

                                        <!-- Modal -->
                                        <div class="modal fade" id="myModal" role="dialog" data-keyboard="false" data-backdrop="static">
                                            <div class="modal-dialog">

                                                <!-- Modal content-->
                                                <div class="modal-content">
                                                    <div class="form-horizontal">
                                                        <form method="POST" action="<c:url value="/main/profileBenefits/"/>save">
                                                            <div class="modal-header">
                                                                <button type="button" class="close" onclick="javascript:window.location.reload()" data-dismiss="modal">&times;</button>
                                                                <h4 class="modal-title">Add Benefits</h4>
                                                            </div>
                                                            <div class="modal-body">
                                                                <c:set var="countbenefits" value="${fn:length(employmentTypeList.benefits)}" scope="page"/>
                                                                <div class="form-group">
                                                                    <label for="Benefits" class="col-md-3 control-label" align="right">Benefits : </label>
                                                                    <div class="col-md-7">
                                                                        <select id="benefits" name="benefits" onchange="getDescription()" class="form-control input-md"  required="true">
                                                                            <option value="">Please Select</option>
                                                                            <c:forEach var="mapListBenefits" items="${mapListBenefits}">
                                                                                <option description="${mapListBenefits.value.description}" benefitsId="${mapListBenefits.key}" value="${mapListBenefits.value.benefitsName}">${mapListBenefits.value.benefitsName}</option>
                                                                            </c:forEach>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="Description" class="col-md-3 control-label" align="right">Description :</label>
                                                                    <div class="col-md-7">
                                                                        <textarea style="overflow:auto;resize:none" rows="5" cols="5" class="form-control" id="description" name="description" readonly="true"></textarea>
                                                                    </div>
                                                                </div>
                                                                <input type="hidden" class="form-control" id="profileId" name="profileId" value="${profileBenefitsItem.id}">
                                                                <input type="hidden" class="form-control" id="benefitsId" name="benefitsId">
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
                                    <div>
                                        <table id="profileBenefitsTable" class="table table-bordered">
                                            <thead>
                                                <tr class="bg-primary">
                                                    <th><div align="center">No.</div></th>
                                                    <th><div align="center">Benefits</div></th>
                                                    <th><div align="center">Description</div></th>
                                                        <c:if test="${userInfo.user.permission == 'ADMIN'}">
                                                        <th><div align="center">Option</div></th>
                                                        </c:if>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:set var="countNo" value="1" scope="page"/>
                                                <c:forEach var="benefitsList" items="${benefitsList}">
                                                    <c:forEach var="i" begin="0" end="${countbenefits-1}">
                                                        <c:if test="${employmentTypeList.benefits[i] == benefitsList.id}">
                                                            <tr>
                                                                <td align="center" style="width: 10%">${countNo}</td>
                                                                <td align="center" style="width: 20%">${benefitsList.benefitsName}</td>
                                                                <td align="center" style="width: 50%">${benefitsList.description}</td>
                                                                <c:if test="${userInfo.user.permission == 'ADMIN'}">
                                                                    <td align="center" style="width: 20%"></td>
                                                                </c:if>
                                                            </tr>
                                                            <c:set var="countNo" value="${countNo+1}" scope="page"/>
                                                        </c:if>
                                                    </c:forEach>
                                                </c:forEach>

                                                <c:forEach var="profileBenefitsList" items="${profileBenefitsList}">
                                                    <c:if test="${profileBenefitsList.profileId == profileid}">
                                                        <tr>
                                                            <td align="center">${countNo}</td>
                                                            <td align="center">${profileBenefitsList.benefits}</td>
                                                            <td align="center">${profileBenefitsList.description}</td>
                                                            <c:if test="${userInfo.user.permission == 'ADMIN'}">
                                                                <td align="center">
                                                                    <button type="button" class="btn btn-warning" id="btnEdit" 
                                                                            data-toggle="modal" data-target="#myModal"
                                                                            data-index="${countNo}"
                                                                            data-id="${profileBenefitsList.id}"
                                                                            data-benefitsId="${profileBenefitsList.benefitsId}"
                                                                            data-benefits="${profileBenefitsList.benefits}"
                                                                            data-description="${profileBenefitsList.description}"
                                                                            >Edit</button>
                                                                    <a href="<c:url value="/"/>main/profileBenefits/delete/${profileBenefitsList.id}"class="btn btn-danger"> Delete</a>
                                                                </td>
                                                            </c:if>
                                                        </tr>
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
            <script type="text/javascript">
                function getDescription() {
                    var benefits = document.getElementById("benefits");
                    var benefitsValue = benefits.options[benefits.selectedIndex].value;
                    var description = benefits.options[benefits.selectedIndex].getAttribute('description');
                    var benefitsId = benefits.options[benefits.selectedIndex].getAttribute('benefitsId');
                    $(".modal-body #description").val(description);
                    $(".modal-body #benefitsId").val(benefitsId);
                }
            </script>
            <script type="text/javascript">
                $('#profileBenefitsTable').find('#btnEdit').click(function () {
                    $(".modal-title").html("Edit Benefits");
                    $(".modal-footer").find('.btn-primary').html("Save");
                    $(".modal-footer").find('.btn-primary').attr('class', 'btn btn-success');
                    $('<input>').attr({
                        type: 'hidden',
                        class: 'form-control',
                        id: 'id',
                        name: 'id'
                    }).appendTo('.modal-body');
                    var id = $(this).attr('data-id');
                    var benefitsId = $(this).attr('data-benefitsId');
                    var benefitsBenefits = $(this).attr('data-benefits');
                    var benefitsDescription = $(this).attr('data-description');
                    $(".modal-body #benefits").append('<option description="' + benefitsDescription + '" benefitsId="' + benefitsId + '" value="' + benefitsBenefits + '">' + benefitsBenefits + '</option>');
                    $(".modal-body #id").val(id);
                    $(".modal-body #benefitsId").val(benefitsId);
                    $(".modal-body #benefits").val(benefitsBenefits);
                    $(".modal-body #description").val(benefitsDescription);
                });
            </script>
    </body>
</html>
