<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="<c:url value="/"/>view/template/css/bootstrap.min.css" />
        <link rel="stylesheet" href="<c:url value="/"/>view/template/css/bootstrap-theme.min.css" />
        <script src=https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js></script>
        <script src="<c:url value="/"/>view/template/js/bootstrap.min.js" ></script>
        <script src="<c:url value="/"/>js/app.js"></script>
        <title>Work-Experience view</title>
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
                        <span class="breadcrumb-item active">work-experience</span>
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
                            <div class="col-md-4" align="left" style="margin-top: 5px">
                                <h4 class="panel-title">${action}</h4>
                            </div>
                            <div class="col-md-8" align="right">
                                <a href="<c:url value="/"/>main/workexperience/editForm/${profileid}" class="btn btn-sm btn-warning">Edit</a>
                            </div>
                        </div>
                        <div class="panel-body">
                            <c:forEach var="workexperienceItem" items="${profileList}">
                                <c:if test="${profileid == workexperienceItem.id}">
                                    <div class="row">
                                        <label>

                                        </label>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <label>รหัสพนักงาน : ${workExperienceItem.id}   
                                            <c:if test="${workExperienceItem.title == 1}">นาย</c:if>
                                            <c:if test="${workExperienceItem.title == 2}">นาง</c:if>
                                            <c:if test="${workExperienceItem.title == 3}">นางสาว</c:if>
                                            ${workExperienceItem.firstName}   ${workExperienceItem.lastName}</label>
                                    </div>
                                    <div class="row">
                                        <label>

                                        </label>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="panel panel-default">
                                                <table class="table table-bordered">
                                                    <thead>
                                                        <tr class="bg-primary">
                                                            <th><div align="center">Company</div></th>
                                                            <th><div align="center">From</div></th>
                                                            <th><div align="center">To</div></th>
                                                            <th><div align="center">Position</div></th>
                                                            <th><div align="center">Job description</div></th>
                                                            <th><div align="center">Salary</div></th>
                                                            <th><div align="center">Reasons of resignation</div></th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>  
                                                        <c:forEach var="workinginfoItem" items="${workexperienceItem.workExperiences.workingInfo}">
                                                            <c:if test="${workinginfoItem.company != null}">
                                                                <tr>
                                                                    <td align="center">${workinginfoItem.company}</td>
                                                                    <td align="center">${workinginfoItem.from}</td>
                                                                    <td align="center">${workinginfoItem.to}</td>
                                                                    <td align="center">${workinginfoItem.position}</td>
                                                                    <td align="center">${workinginfoItem.jobDescription}</td>
                                                                    <td align="center">${workinginfoItem.salary}</td>
                                                                    <td align="center">${workinginfoItem.reasonsResignation}</td>
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
                        </div>
                    </div>
                </div>
            </div>
        </div>    
    </body>
</html>
