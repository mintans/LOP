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
        <style>
            .error {
                padding: 15px;
                margin-bottom: 20px;
                border: 1px solid transparent;
                border-radius: 4px;
                color: #a94442;
                background-color: #f2dede;
                border-color: #ebccd1;
            }
        </style>
        <title>Login</title>        
    </head>
    <body>
        <div class="container" style="width: 40%">
            <div class="row">
                <div class="col-md-12" align="center">
                    <div class="login-panel panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">Please Login</h3>
                        </div>
                        <div class="panel-body">
                            <form:form class="form-horizontal" method="POST" action="login" commandName="loginForm">
                                <c:if test="${errorMsg != null}">
                                    <div class="error">${errorMsg}</div>
                                </c:if>
                                <fieldset>
                                    <div class="form-group">
                                        <label class="col-md-3 control-label" for="textinput">
                                            <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
                                        </label>
                                        <div class="col-md-6">
                                            <form:input class="form-control input-md" path="username" placeholder="Username"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-3 control-label" for="textinput">
                                            <span class="glyphicon glyphicon-lock"  aria-hidden="true"></span>
                                        </label>
                                        <div class="col-md-6">
                                            <form:password class="form-control input-md" path="password" placeholder="Password"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-md-12" align="center">
                                            <input class="btn btn-success btn-group" type="submit" value="Login">
                                            <input class="btn btn-danger btn-group" type="reset" value="Cancel">
                                        </div>
                                    </div>
                                </fieldset>                                
                            </form:form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
