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
        <title>Change Password</title>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <%@ include file="/WEB-INF/jsp/header.jsp" %>  
            </div>  
            <nav class="breadcrumb">
                <span class="breadcrumb-item active">Change Password</span> /
            </nav>

            <div class="container" style="width: 50%">
                <div class="row">
                    <div class="col-md-12">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h4 class="panel-title">Change Password</h4>
                            </div>
                            <div class="panel-body">
                                <form:form class="form-horizontal" method="POST" action="changePassword" commandName="userForm">            
                                    <fieldset>
                                        <div class="form-group">
                                            <label class="col-md-5 control-label" for="textinput">Old Password:</label>  
                                            <div class="col-md-5">
                                                <form:password class="form-control input-md" path="oldPassword" required="password" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-5 control-label" for="textinput">New Password:</label>  
                                            <div class="col-md-5">
                                                <form:password class="form-control input-md" path="newPassword" required="password" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-5 control-label" for="textinput">Confirm New Password:</label>  
                                            <div class="col-md-5">
                                                <form:password class="form-control input-md" path="confirmPassword" required="password" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-md-offset-6 col-md-4" align="right">
                                                <button type="submit" class="btn btn-success">
                                                    <span class="glyphicon glyphicon-ok" aria-hidden="true"></span> Submit</button>
                                                <a href="<c:url value="/"/>main/home" class="btn btn-danger">
                                                    <span class="glyphicon glyphicon-remove" aria-hidden="true"></span> Cancel</a>

                                            </div>
                                        </div>
                                    </fieldset>
                                </form:form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
