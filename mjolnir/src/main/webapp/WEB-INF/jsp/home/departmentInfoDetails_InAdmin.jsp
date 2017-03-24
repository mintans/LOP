<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>

<html>
    <head>
        <title>Department Info</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous"/>
        <script src=https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
        <script src="<c:url value="/"/>js/app.js"></script>
        <script src="//cdn.ckeditor.com/4.6.1/full/ckeditor.js"></script>
    </head>
    <body>

        <div class="container-fluid">

            <div class="row">
                <%@ include file="/WEB-INF/jsp/header.jsp" %>
            </div>
            <nav class="breadcrumb">
                <a class="breadcrumb-item" href="home">Mjolnir</a> / 
                <a class="breadcrumb-item" href="<c:url value="/main/companyInfo"/>">Company Info</a> / 
                <span class="breadcrumb-item active">CompanyInfo Details</span>
            </nav>

            <div class="container" style="width: 100%">
                <div class="row">
                    <div class="col-md-2">
                        <div class="panel panel-default">
                            <!--<div class="panel-heading"></div>-->
                            <div class="panel-body">
                                <ul class="nav nav-pills nav-stacked">
                                    <li role="presentation" ><a href="<c:url value="/main/home"/>">News Info</a></li>
                                    <li role="presentation"><a href="<c:url value="/main/companyInfo"/>">Company Info</a></li>
                                    <li role="presentation" class="active"><a href="<c:url value="/main/departmentInfo"/>">Department Info</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-10">                        
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h3 class="panel-title">DepartmentInfo Details</h3>
                            </div>
                            <div class="panel-body">
                                <c:if test="${departmentInfoID != null}">
                                    <c:forEach var="departmentsInformationItem" items="${departmentsInformationList}">                                        
                                        <c:if test="${departmentsInformationItem.id == departmentInfoID}">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <label>Posted ${departmentsInformationItem.date}</label>  
                                                </div>

                                            </div>
                                            <br>
                                            <div class="row">
                                                <div class="col-md-8 col-md-offset-2">
                                                    <div class="thumbnail">
                                                        <c:url var="getPhoto" value="/main/getPhoto/${departmentsInformationItem.img}" />
                                                        <img id="imagePreview" src="${getPhoto}" alt="Profile Photo" style="width:620px ;height:330px"/>
                                                    </div>
                                                    <center>
                                                        <label>Title : ${departmentsInformationItem.title}</label>
                                                    </center>
                                                </div>
                                                <div class="col-md-10 col-md-offset-1">

                                                    <p>${departmentsInformationItem.details}</p>  
                                                    <center>
                                                        <a href="<c:url value="/main/departmentInfo"/>" class="btn btn-info">Back </a>
                                                    </center>
                                                </div>

                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </c:if>
                            </div>  
                        </div>
                    </div>



                </div>
            </div> 
        </div> 
    </body>
</html>

