
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
   <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous"/>
        <script src=https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
        <script src="<c:url value="/"/>js/app.js"></script>
        <script src="<c:url value="/"/>js/user/user.js"></script>
        <title>Structure</title>
    </head>
    <body>
        <div class="container-fluid">            
            <div class="row">
                <%@ include file="/WEB-INF/jsp/header.jsp" %>               
            </div>

            <nav class="breadcrumb">
                <a class="breadcrumb-item" href="structure">Structure</a> / 
                <span class="breadcrumb-item active">Overview</span>
            </nav>
            
            <div class="container" style="width: 100%">
                <div class="row">
                    <div class="col-md-2">
                        <div class="panel panel-default">
                            <!--<div class="panel-heading"></div>-->
                            <div class="panel-body">
                                <ul class="nav nav-pills nav-stacked">
                                    <li role="presentation" class="active"><a href="overview">Overview</a></li>
                                    <li role="presentation"><a href="<c:url value="/"/>main/group">Groups</a></li>
                                    <li role="presentation"><a href="<c:url value="/"/>main/team">Teams</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-10">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h4 class="panel-title">Overview</h4>
                            </div>
                            <div class="panel-body">
                                <br>
                                
                                    <table class="table table-bordered" id="myTable" >
                                        <c:set var="count" value="0" scope="page" />
                                    </table>
                               
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
