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
        <script src="<c:url value="/"/>view/template/js/bootstrap.min.js" ></script>
        <script src="<c:url value="/"/>js/app.js"></script>
        <style>
            p.normal {
                border-bottom: 2px solid gray;
            }
        </style>
        <title>Family view</title>
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
                        <span class="breadcrumb-item active">family</span>
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
                            <div class="col-md-2" align="left" style="margin-top: 5px">
                                <h4 class="panel-title">Family</h4>
                            </div>
                            <div class="col-md-10" align="right">
                                <a href="<c:url value="/"/>main/familyinfo/editForm/${profileid}" class="btn btn-sm btn-warning">Edit</a>
                            </div>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <label>

                                </label>
                            </div>
                            <div class="form-horizontal col-md-12">
                                <form>
                                    <div class="row col-md-offset-1">
                                        <label>รหัสพนักงาน : ${familyItem.id}   
                                            <c:if test="${familyItem.title == 1}">นาย</c:if>
                                            <c:if test="${familyItem.title == 2}">นาง</c:if>
                                            <c:if test="${familyItem.title == 3}">นางสาว</c:if>
                                            ${familyItem.firstName}   ${familyItem.lastName}</label>
                                    </div>
                                    <div class="row">
                                        <label>

                                        </label>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-8" align="right">
                                            <label for="FatherData" class="col-md-6"><u>Father</u></label>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-8">
                                            <label for="fatherFirstname" class="col-md-6 control-label">Firstname</label>
                                            <div class="col-md-6">
                                                <input type="text" class="form-control" value="${familyItem.familyinfo.fatherFirstname}" readonly="true">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-8">
                                            <label for="fatherLastname" class="col-md-6 control-label">Lastname</label>
                                            <div class="col-md-6">
                                                <input type="text" class="form-control" value="${familyItem.familyinfo.fatherLastname}"  readonly="true">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-8">
                                            <label for="fatherAge" class="col-md-6 control-label">Age</label>
                                            <div class="col-md-6">
                                                <input type="text" class="form-control" value="${familyItem.familyinfo.fatherAge}" readonly="true">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-8">
                                            <label for="fatherOccupation" class="col-md-6 control-label">Occupation</label>
                                            <div class="col-md-6">
                                                <input type="text" class="form-control" value="${familyItem.familyinfo.fatherOccupation}"  readonly="true">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-8" align="right">
                                            <label for="MotherData" class="col-md-6"><u>Mother</u></label>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-8">
                                            <label for="motherFirstname" class="col-md-6 control-label">Firstname</label>
                                            <div class="col-md-6">
                                                <input type="text" class="form-control" value="${familyItem.familyinfo.motherFirstname}" readonly="true">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-8">
                                            <label for="motherLastname" class="col-md-6 control-label">Lastname</label>
                                            <div class="col-md-6">
                                                <input type="text" class="form-control" value="${familyItem.familyinfo.motherLastname}"  readonly="true">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-8">
                                            <label for="motherAge" class="col-md-6 control-label">Age</label>
                                            <div class="col-md-6">
                                                <input type="text" class="form-control" value="${familyItem.familyinfo.motherAge}" readonly="true">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-8">
                                            <label for="motherOccupation" class="col-md-6 control-label">Occupation</label>
                                            <div class="col-md-6">
                                                <input type="text" class="form-control" value="${familyItem.familyinfo.motherOccupation}"  readonly="true">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-8" align="right">
                                            <label for="spouseData" class="col-md-6"><u>Wife/Husband</u></label>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-8">
                                            <label for="spouseFirstname" class="col-md-6 control-label">Firstname</label>
                                            <div class="col-md-6">
                                                <input type="text" class="form-control" value="${familyItem.familyinfo.spouseFirstname}" readonly="true">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-8">
                                            <label for="spouseLastname" class="col-md-6 control-label">Lastname</label>
                                            <div class="col-md-6">
                                                <input type="text" class="form-control" value="${familyItem.familyinfo.spouseLastname}"  readonly="true">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-8">
                                            <label for="spouseAge" class="col-md-6 control-label">Age</label>
                                            <div class="col-md-6">
                                                <input type="text" class="form-control" value="${familyItem.familyinfo.spouseAge}" readonly="true">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-8">
                                            <label for="spouseOccupation" class="col-md-6 control-label">Occupation</label>
                                            <div class="col-md-6">
                                                <input type="text" class="form-control" value="${familyItem.familyinfo.spouseOccupation}"  readonly="true">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-8">
                                            <label for="numberChildren" class="col-md-6 control-label">No. of Children</label>
                                            <div class="col-md-6">
                                                <input type="text" class="form-control" value="${familyItem.familyinfo.numberChildren}"  readonly="true">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-8" align="right">
                                            <label for="spouseData" class="col-md-6"><u>Brethren</u></label>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-8">
                                            <label for="numberFamily" class="col-md-6 control-label">Number of Members</label>
                                            <div class="col-md-6">
                                                <input type="text" class="form-control" value="${familyItem.familyinfo.numberFamily}"  readonly="true">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-2">
                                        <div class="form-group col-md-5">
                                            <label for="numberBrother" class="col-md-8 control-label">Male</label>
                                            <div class="col-md-4">
                                                <input type="text" class="form-control" value="${familyItem.familyinfo.numberBrother}"  readonly="true">
                                            </div>
                                        </div>
                                        <div class="form-group col-md-5">
                                            <label for="numberSister" class="col-md-3 control-label">Female</label>
                                            <div class="col-md-4">
                                                <input type="text" class="form-control" value="${familyItem.familyinfo.numberSister}"  readonly="true">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-2">
                                        <div class="form-group col-md-5">
                                            <label for="noFamily" class="col-md-8 control-label">Birth Order</label>
                                            <div class="col-md-4">
                                                <input type="text" class="form-control" value="${familyItem.familyinfo.noFamily}"  readonly="true">
                                            </div>
                                        </div>
                                    </div>
                                    <c:forEach var="familyItem2" items="${familyItem.familyinfo.brethrenInfo}">
                                    <c:if test="${familyItem2.name != null}">        
                                    <div class="row col-md-offset-2">
                                        <div class="form-group col-md-9">
                                            <div style="height:224px;overflow:auto;">
                                                <table class="table table-bordered">
                                                    <thead>
                                                        <tr class="bg-primary">
                                                            <th><div align="center">Firstname-Lastname</div></th>
                                                            <th><div align="center">Age</div></th>
                                                            <th><div align="center">Occupation</div></th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>                                                        
                                                        <c:forEach var="familyItem2" items="${familyItem.familyinfo.brethrenInfo}">
                                                            <c:if test="${familyItem2.name != null}">
                                                                <tr>
                                                                    <td align="center">${familyItem2.name}</td>
                                                                    <td align="center">${familyItem2.age}</td>
                                                                    <td align="center">${familyItem2.occupation}</td>

                                                                </tr>
                                                            </c:if>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                   </c:if>
                                 </c:forEach>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
