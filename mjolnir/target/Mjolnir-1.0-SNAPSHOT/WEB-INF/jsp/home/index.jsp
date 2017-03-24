<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
    <head>
        <title>Entronica Mjolnir</title>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous"/>
        <link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.16/themes/base/jquery-ui.css" type="text/css" media="all">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous"/>
        <script src=https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <%@ include file="/WEB-INF/jsp/header.jsp" %>
            </div>
            <nav class="breadcrumb">
                <a class="breadcrumb-item" href="home">Mjolnir</a> / 
                <span class="breadcrumb-item active">News Info</span>
            </nav>

            <div class="container" style="width: 100%">
                <div class="row">
                    <div class="col-md-2">
                        <div class="panel panel-default">
                            <!--<div class="panel-heading"></div>-->
                            <div class="panel-body">
                                <ul class="nav nav-pills nav-stacked">
                                    <li role="presentation" class="active"><a href="<c:url value="/main/home"/>">News Info</a></li>
                                    <li role="presentation"><a href="<c:url value="/main/companyInfo"/>">Company Info</a></li>
                                    <li role="presentation"><a href="<c:url value="/main/departmentInfo"/>">Department Info</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-10">                      
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h3 class="panel-title">News Info</h3>
                            </div>
                            <div class="panel-body">                               
                                <div class="row">
                                    <c:forEach var="CompanyInformationItem" items="${CompanyInformationList}">
                                        <div class="col-md-4">
                                            <div class="panel panel-default">
                                                <div class="thumbnail">
                                                    <c:url var="getPhoto" value="/main/getPhoto/${CompanyInformationItem.img}" />
                                                    <img id="imagePreview" src="${getPhoto}" alt="Profile Photo" style="width:280px ;height:130px"/>
                                                </div>
                                                <p><b>&nbsp;&nbsp;&nbsp;&nbsp;Title : </b>
                                                    <a href="<c:url value="/"/>main/showdetails/${CompanyInformationItem.id}"> ${CompanyInformationItem.title}</a></p>
                                                <p><b>&nbsp;&nbsp;&nbsp;&nbsp;Company : </b>${CompanyInformationItem.date}</p>
                                                <p style="width: 250px;white-space: nowrap;overflow: hidden;text-overflow: ellipsis;">
                                                    <b>&nbsp;&nbsp;&nbsp;&nbsp;Details : </b>${CompanyInformationItem.details}</p>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                                <div class="row">
                                    <c:forEach var="DepartmentsInformationItem" items="${DepartmentsInformationList}">                                    
                                        <div class="col-md-4">
                                            <div class="panel panel-default">
                                                <div class="thumbnail">
                                                    <c:url var="getPhoto" value="/main/getPhoto/${DepartmentsInformationItem.img}" />
                                                    <img id="imagePreview" src="${getPhoto}" alt="Profile Photo" style="width:280px ;height:130px"/>
                                                </div>
                                                <p><b>Title : </b>
                                                    <a href="<c:url value="/"/>main/showdetails/${DepartmentsInformationItem.id}"> ${DepartmentsInformationItem.title}</a></p>
                                                <p><b>Department : </b>${DepartmentsInformationItem.date}</p>
                                                <p style="width: 250px;white-space: nowrap;overflow: hidden;text-overflow: ellipsis;">
                                                    <b>Details : </b>${DepartmentsInformationItem.details}</p>
                                            </div>
                                        </div>                                    
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>                
    </body>
</html>
