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
        <title>Special Ability view</title>
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
                        <span class="breadcrumb-item active">special-ability</span>
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
                                <h4 class="panel-title">Special Ability</h4>
                            </div>
                            <div class="col-md-10" align="right">
                                <a href="<c:url value="/"/>main/specialability/editForm/${profileid}" class="btn btn-sm btn-warning">Edit</a>
                            </div>
                        </div>
                        <div class="panel-body">
                            <c:forEach var="specialabilityItem" items="${profileList}">
                                <c:if test="${profileid == specialabilityItem.id}">
                                    <div class="row">
                                        <label>

                                        </label>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <label>รหัสพนักงาน : ${specialAbilityItem.id}   
                                            <c:if test="${specialAbilityItem.title == 1}">นาย</c:if>
                                            <c:if test="${specialAbilityItem.title == 2}">นาง</c:if>
                                            <c:if test="${specialAbilityItem.title == 3}">นางสาว</c:if>
                                            ${specialAbilityItem.firstName}   ${specialAbilityItem.lastName}</label>
                                    </div>
                                    <div class="row">
                                        <label>

                                        </label>
                                    </div>
                                    <div class="form-horizontal col-md-12">
                                        <div class="row col-md-offset-1">
                                            <div class="form-group col-md-3">
                                                <label for="Typing" class="col-md-2 control-label" align="right">Typing</label>
                                                <div class="col-md-10">
                                                    <c:if test="${specialabilityItem.specialAbility.typing == true}">
                                                        <div class="col-md-12" align="right">
                                                            <label class="radio-inline"><input checked type="radio" name="typing" disabled="disabled">Yes</label>
                                                            <label class="radio-inline"><input type="radio" name="typing" disabled="disabled">No</label>
                                                        </div>
                                                    </c:if>
                                                    <c:if test="${specialabilityItem.specialAbility.typing == false}">
                                                        <div class="col-md-12" align="right">
                                                            <label class="radio-inline"><input type="radio" name="typing" disabled="disabled">Yes</label>
                                                            <label class="radio-inline"><input checked type="radio" name="typing" disabled="disabled">No</label>
                                                        </div>
                                                    </c:if>
                                                </div>
                                            </div>

                                            <div class="form-group col-md-4">
                                                <label class="control-label col-md-3">Thai</label>
                                                <div class="col-md-4">
                                                    <input type="text" class="form-control" value="${specialabilityItem.specialAbility.typingThai}" readonly="true">
                                                </div>
                                                <label class="control-label">Words/Minute</label>
                                            </div>
                                            <div class="form-group col-md-4">
                                                <label class="control-label col-md-3">English</label>
                                                <div class="col-md-4">
                                                    <input type="text" class="form-control" value="${specialabilityItem.specialAbility.typingEnglish}" readonly="true">
                                                </div>
                                                <label class="control-label">Words/Minute</label>
                                            </div>
                                        </div>

                                        <div class="row col-md-offset-1">
                                            <div class="form-group col-md-3">
                                                <label for="Computer" class="col-md-2 control-label" align="right">Computer</label>
                                                <div class="col-md-10">
                                                    <c:if test="${specialabilityItem.specialAbility.computer == true}">
                                                        <div class="col-md-12" align="right">
                                                            <label class="radio-inline"><input checked type="radio" name="computer" disabled="disabled">Yes</label>
                                                            <label class="radio-inline"><input type="radio" name="computer" disabled="disabled">No</label>
                                                        </div>
                                                    </c:if>
                                                    <c:if test="${specialabilityItem.specialAbility.computer == false}">
                                                        <div class="col-md-12" align="right">
                                                            <label class="radio-inline"><input type="radio" name="computer" disabled="disabled">Yes</label>
                                                            <label class="radio-inline"><input checked type="radio" name="computer" disabled="disabled">No</label>
                                                        </div>
                                                    </c:if>
                                                </div>
                                            </div>

                                            <div class="form-group col-md-4">
                                                <label class="control-label col-md-3">Mention</label>
                                                <div class="col-md-9">
                                                    <input type="text" class="form-control" value="${specialabilityItem.specialAbility.computerMention}" readonly="true">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row col-md-offset-1">
                                            <div class="form-group col-md-3">
                                                <label for="Driving" class="col-md-2 control-label" align="right">Driving</label>
                                                <div class="col-md-10">
                                                    <c:if test="${specialabilityItem.specialAbility.driving == true}">
                                                        <div class="col-md-12" align="right">
                                                            <label class="radio-inline"><input checked type="radio" name="driving" disabled="disabled">Yes</label>
                                                            <label class="radio-inline"><input type="radio" name="driving" disabled="disabled">No</label>
                                                        </div>
                                                    </c:if>
                                                    <c:if test="${specialabilityItem.specialAbility.driving == false}">
                                                        <div class="col-md-12" align="right">
                                                            <label class="radio-inline"><input type="radio" name="driving" disabled="disabled">Yes</label>
                                                            <label class="radio-inline"><input checked type="radio" name="driving" disabled="disabled">No</label>
                                                        </div>
                                                    </c:if>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="form-group col-md-6">
                                                <label for="officeMachine" class="control-label col-md-4">Office machine</label>
                                                <div class="col-md-7">
                                                    <input type="text" class="form-control" value="${specialabilityItem.specialAbility.officeMachine}" readonly="true">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="form-group col-md-6">
                                                <label for="Hobbies" class="control-label col-md-4">Hobbies</label>
                                                <div class="col-md-7">
                                                    <input type="text" class="form-control" value="${specialabilityItem.specialAbility.hobbies}" readonly="true">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="form-group col-md-6">
                                                <label for="favouriteSport" class="control-label col-md-4">Favorite sport</label>
                                                <div class="col-md-7">
                                                    <input type="text" class="form-control" value="${specialabilityItem.specialAbility.favouriteSport}" readonly="true">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="form-group col-md-6">
                                                <label for="specialKnowledge" class="control-label col-md-4">Special knowledge</label>
                                                <div class="col-md-7">
                                                    <input type="text" class="form-control" value="${specialabilityItem.specialAbility.specialKnowledge}" readonly="true">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="form-group col-md-6">
                                                <label for="Others" class="control-label col-md-4">Others</label>
                                                <div class="col-md-7">
                                                    <input type="text" class="form-control" value="${specialabilityItem.specialAbility.others}" readonly="true">
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
