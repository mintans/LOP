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
        <title>Education view</title>
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
                        <span class="breadcrumb-item active">education</span>
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
                                <h4 class="panel-title">Education</h4>
                            </div>
                            <div class="col-md-10" align="right">
                                <a href="<c:url value="/"/>main/education/editForm/${profileid}" class="btn btn-sm btn-warning">Edit</a>
                            </div>
                        </div>
                        <div class="panel-body">
                            <c:forEach var="profileItem" items="${profileList}">
                                <c:if test="${profileid == profileItem.id}">
                                    <div class="row">
                                        <label>

                                        </label>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <label>รหัสพนักงาน : ${profileItem.id}   
                                            <c:if test="${profileItem.title == 1}">นาย</c:if>
                                            <c:if test="${profileItem.title == 2}">นาง</c:if>
                                            <c:if test="${profileItem.title == 3}">นางสาว</c:if>
                                            ${profileItem.firstName}   ${profileItem.lastName}</label>
                                    </div>
                                    <div class="row">
                                        <label>

                                        </label>
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-md-12">
                                            <table class="table table-bordered">
                                                <thead>
                                                    <tr class="bg-primary">
                                                        <th style="width: 25%"><div align="center">Education level</div></th>
                                                        <th style="width: 25%"><div align="center">institution</div></th>
                                                        <th style="width: 20%"><div align="center">Major</div></th>
                                                        <th style="width: 10%"><div align="center">From</div></th>
                                                        <th style="width: 10%"><div align="center">To</div></th>
                                                        <th style="width: 10%"><div align="center">GPA.</div></th>
                                                    </tr>
                                                </thead>
                                                <tbody>                                                        
                                                    <c:forEach var="educationItem2" items="${profileItem1.education.educationInfo}">
                                                        <c:if test="${educationItem2.institution != null}">
                                                            <tr>
                                                                <td align="center">${educationItem2.educationLevel}</td>
                                                                <td align="center">${educationItem2.institution}</td>
                                                                <td align="center">${educationItem2.major}</td>
                                                                <td align="center">${educationItem2.from}</td>
                                                                <td align="center">${educationItem2.to}</td>
                                                                <td align="center">${educationItem2.gpa}</td>
                                                            </tr>
                                                        </c:if>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
    </body>
</html>
