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
        <title>Document</title>
    </head>
    <body>
        <div class="container-fluid">            
            <div class="row">
                <%@ include file="/WEB-INF/jsp/header.jsp" %>               
            </div>

            <nav class="breadcrumb">
                <span class="breadcrumb-item active">Document</span>
            </nav>

            <div class="container" style="width: 70%">
                <div class="row">
                    <div class="col-md-12">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h3 class="panel-title">Document Request</h3>
                            </div>
                            <div class="panel-body">
                                <form method="post" action="document/addDocument">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group" style="margin-left: -80px">
                                                <label class="col-md-4" align = "right">Requested Documents :</label>
                                                <div class="col-md-8">
                                                    <div class="row" style="margin-left: 2px">
                                                        <input type="hidden" id="userId" name="userId" value="${userInfo.user.id}">                                                  
                                                        <input type="radio" name="RequestedDocuments" id="radioWorkCertificate" value="Work Certificate" checked> Work Certificate
                                                        <input type="radio" style="margin-left: 50px" name="RequestedDocuments" id="radioSalaryCertificate" value="Salary Certificate"> Salary Certificate<br>
                                                    </div>
                                                    <div class="row" style="margin-top: 10px;margin-left: 2px">
                                                        <div class="col-md-3" style="margin-left: -15px;margin-right: -80px;margin-top: 2px">
                                                            <input type="radio" name="RequestedDocuments" id="radioOther" value="Other"> Other
                                                        </div>
                                                        <div class="col-md-9">
                                                            <input type="text" name="other" id="other" class="form-control" style="width: 50%" disabled="true">
                                                        </div>
                                                    </div>  
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-10" style="margin-top: 20px;">
                                            <div class="form-group">
                                                <label class="col-md-4 control-label" align = "right">Amount :</label>
                                                <div class="col-md-2">
                                                    <select class="form-control" id="amount"  name ="amount">
                                                        <option>1</option>
                                                        <option>2</option>
                                                        <option>3</option>  
                                                        <option>4</option>
                                                        <option>5</option>
                                                        <option>6</option> 
                                                        <option>7</option>
                                                        <option>8</option>
                                                        <option>9</option> 
                                                        <option>10</option> 
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <input class="form-control" type="hidden" id="date" name="date" readonly="true">
                                    </div>
                                    <br>                                
                                    <div class="row">
                                        <div class="col-md-10">                                        
                                            <div class="form-group">
                                                <label for="text" class="col-md-4 control-label" align = "right">Objectivity :</label>
                                                <div class="col-md-8">
                                                    <textarea style="overflow:auto;resize:none;width: 460px"  class="form-control" name ="objectivity" id="objectivity" placeholder="Use for ..."></textarea>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <br>
                                    <div class="row">                                    
                                        <div class="col-md-2 col-md-offset-9">
                                            <button type="submit" class="btn btn-success">Submit</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script type="text/javascript">
            $(document).ready(function () {
                var now = new Date();
                var day = ("0" + now.getDate()).slice(-2);
                var month = ("0" + (now.getMonth() + 1)).slice(-2);
                var today = now.getFullYear() + "-" + (month) + "-" + (day);
                $('#date').val(today);
            });
        </script>
        <script type="text/javascript">
            $("#radioOther").click(function () {
                $('#other').prop('disabled', false);
            });
            $("#radioWorkCertificate").click(function () {
                $('#other').prop('disabled', true);
            });
            $("#radioSalaryCertificate").click(function () {
                $('#other').prop('disabled', true);
            });
        </script>
    </body>
</html>
