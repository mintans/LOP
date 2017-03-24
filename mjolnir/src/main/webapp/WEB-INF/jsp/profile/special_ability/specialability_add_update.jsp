<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="<c:url value="/"/>view/template/css/bootstrap.min.css" />
        <link rel="stylesheet" href="<c:url value="/"/>view/template/css/bootstrap-theme.min.css"/>
        <script src=https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js></script>
        <script src="<c:url value="/"/>view/template/js/bootstrap.min.js" ></script>
        <script src="<c:url value="/"/>js/app.js"></script>
        <c:if test="${action == 'save'}">
            <title>SpecialAbility ADD</title>
        </c:if>
        <c:if test="${action == 'update'}">
            <title>SpecialAbility Update</title>
        </c:if>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <%@ include file="/WEB-INF/jsp/header.jsp" %>  
            </div>

            <nav class="breadcrumb">
                <a class="breadcrumb-item" href="<c:url value="/main/profile"/>">Profile</a> / 
                <c:if test="${action == 'update'}">
                    <a class="breadcrumb-item" href="<c:url value="/"/>main/profile/viewTH/${id}"/>${id}</a> / 
                </c:if>
                <span class="breadcrumb-item active">special-ability-${action}</span>
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
                                <h4 class="panel-title">Special Ability ${action}</h4>
                            </div>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <label>

                                </label>
                            </div>
                            <div class="form-horizontal col-md-12">                        
                                <form:form  method="POST" action="${action}" commandName="specialabilityForm">     
                                    <div class="row col-md-offset-1">
                                        <label>รหัสพนักงาน : ${specialAbilityItem.id}   
                                            <c:if test="${specialAbilityItem.title == 1}">นาย</c:if>
                                            <c:if test="${specialAbilityItem.title == 2}">นาง</c:if>
                                            <c:if test="${specialAbilityItem.title == 3}">นางสาว</c:if>
                                            ${specialAbilityItem.firstName}   ${specialAbilityItem.lastName}</label>
                                    </div>
                                    <c:if test="${action == 'save'}">
                                        <div class="row">
                                            <label>
                                                <form:input class="form-control" path="profileId" value="${specialAbilityItem.id}" type="hidden"/>
                                            </label>
                                        </div>
                                    </c:if>
                                    <c:if test="${action == 'update'}">
                                        <div class="row">
                                            <label>
                                                <form:input class="form-control" path="id" value="" type="hidden"/>
                                            </label>
                                        </div>
                                        <div class="row">
                                            <label>
                                                <form:input class="form-control" path="profileId" value="" type="hidden"/>
                                            </label>
                                        </div>
                                    </c:if>

                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-3">
                                            <label for="Typing" class="col-md-2 control-label" align="right">Typing</label>
                                            <div class="col-md-10">
                                                <div class="col-md-12" align="right">
                                                    <label class="radio-inline"><form:radiobutton path="typing" value="true"/>Yes</label>
                                                    <label class="radio-inline"><form:radiobutton path="typing" value="False"/>No</label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group col-md-4">
                                            <label class="control-label col-md-3">Thai</label>
                                            <div class="col-md-4">
                                                <form:input class="form-control" path="typingThai" required="typingThai" value=""/>
                                            </div>
                                            <label class="control-label">Words/Minute</label>
                                        </div>
                                        <div class="form-group col-md-4">
                                            <label class="control-label col-md-3">English</label>
                                            <div class="col-md-4">
                                                <form:input class="form-control" path="typingEnglish" required="typingEnglish" value=""/>
                                            </div>
                                            <label class="control-label">Words/Minute</label>
                                        </div>
                                    </div>

                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-3">
                                            <label for="Computer" class="col-md-2 control-label" align="right">Computer</label>
                                            <div class="col-md-10">
                                                <div class="col-md-12" align="right">
                                                    <label class="radio-inline"><form:radiobutton path="computer" value="true"/>Yes</label>
                                                    <label class="radio-inline"><form:radiobutton path="computer" value="False"/>No</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group col-md-4">
                                            <label class="control-label col-md-3">Mention</label>
                                            <div class="col-md-9">
                                                <form:input class="form-control" path="computerMention" required="computerMention" value=""/>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-3">
                                            <label for="driving" class="col-md-2 control-label" align="right">Driving</label>
                                            <div class="col-md-10">
                                                <div class="col-md-12" align="right">
                                                    <label class="radio-inline"><form:radiobutton path="driving" value="true"/>Yes</label>
                                                    <label class="radio-inline"><form:radiobutton path="driving" value="False"/>No</label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="form-group col-md-6">
                                            <label for="officeMachine" class="control-label col-md-4">Office machine</label>
                                            <div class="col-md-7">
                                                <form:input class="form-control" path="officeMachine" required="officeMachine" value=""/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-md-6">
                                            <label for="Hobbies" class="control-label col-md-4">Hobbies</label>
                                            <div class="col-md-7">
                                                <form:input class="form-control" path="hobbies" required="hobbies" value=""/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-md-6">
                                            <label for="favouriteSport" class="control-label col-md-4">Favorite sport</label>
                                            <div class="col-md-7">
                                                <form:input class="form-control" path="favouriteSport" required="favouriteSport" value=""/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-md-6">
                                            <label for="specialKnowledge" class="control-label col-md-4">Special knowledge</label>
                                            <div class="col-md-7">
                                                <form:input class="form-control" path="specialKnowledge" required="specialKnowledge" value=""/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-md-6">
                                            <label for="Others" class="control-label col-md-4">Others</label>
                                            <div class="col-md-7">
                                                <form:input class="form-control" path="others" required="others" value=""/>
                                            </div>
                                        </div>
                                    </div>                        
                                    <div class="row">
                                        <label class="col-md-4"></label>
                                        <div class="col-md-4">
                                            <input type="submit" value="Save" class="btn btn-success">
                                            <input type="reset" value="Cancel" class="btn btn-danger">
                                        </div>
                                    </div>
                                </form:form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
