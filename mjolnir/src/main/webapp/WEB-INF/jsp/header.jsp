<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script src="<c:url value="/"/>js/header.js"></script>

<div class="col-md-12">
    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="<c:url value="/main/home"/>">Mjolnir</a>
            </div>
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <c:if test="${userInfo.user.permission == 'ADMIN'}">
                        <c:if test="${formhome == 'home'}">
                            <li class="nav-main"><a href="<c:url value="/main/notice"/>">Notice</a></li>
                            <li class="nav-main"><a href="<c:url value="/main/calendar"/>">Calendar</a></li>
                            <li class="nav-main"><a href="<c:url value="/main/user"/>">User</a></li>
                            <li class="nav-main"><a href="<c:url value="/main/profile"/>">Profile</a></li>
                            <li class="nav-main"><a href="<c:url value="/main/supplement/overtime"/>">Supplement</a></li>
                            <li class="nav-main"><a href="<c:url value="/main/benefits"/>">Benefits</a></li>
                            <li class="nav-main"><a href="<c:url value="/main/training"/>">Training</a></li>
                            <li class="nav-main"><a href="<c:url value="/main/position"/>">Position</a></li>
                            </c:if>
                            <c:if test="${formNotice == 'notice'}">
                            <li class="active"><a href="<c:url value="/main/notice"/>">Notice</a></li>
                            <li><a href="<c:url value="/main/calendar"/>">Calendar</a></li>
                            <li><a href="<c:url value="/main/user"/>">User</a></li>
                            <li><a href="<c:url value="/main/profile"/>">Profile</a></li>
                            <li><a href="<c:url value="/main/supplement"/>">Supplement</a></li>
                            <li><a href="<c:url value="/main/benefits"/>">Benefits</a></li>
                            <li><a href="<c:url value="/main/training"/>">Training</a></li>
                            <li><a href="<c:url value="/main/position"/>">Position</a></li>
                            </c:if>
                            <c:if test="${formCalendar == 'calendar'}">
                            <li><a href="<c:url value="/main/notice"/>">Notice</a></li>
                            <li class="active"><a href="<c:url value="/main/calendar"/>">Calendar</a></li>
                            <li><a href="<c:url value="/main/user"/>">User</a></li>
                            <li><a href="<c:url value="/main/profile"/>">Profile</a></li>
                            <li><a href="<c:url value="/main/supplement"/>">Supplement</a></li>
                            <li><a href="<c:url value="/main/benefits"/>">Benefits</a></li>
                            <li><a href="<c:url value="/main/training"/>">Training</a></li>
                            <li><a href="<c:url value="/main/position"/>">Position</a></li>
                            </c:if>
                            <c:if test="${formUser == 'user'}">
                            <li><a href="<c:url value="/main/notice"/>">Notice</a></li>
                            <li><a href="<c:url value="/main/calendar"/>">Calendar</a></li>
                            <li class="active"><a href="<c:url value="/main/user"/>">User</a></li>
                            <li><a href="<c:url value="/main/profile"/>">Profile</a></li>
                            <li><a href="<c:url value="/main/supplement"/>">Supplement</a></li>
                            <li><a href="<c:url value="/main/benefits"/>">Benefits</a></li>
                            <li><a href="<c:url value="/main/training"/>">Training</a></li>
                            <li><a href="<c:url value="/main/position"/>">Position</a></li>
                            </c:if>
                            <c:if test="${formProfile == 'profile'}">
                            <li><a href="<c:url value="/main/notice"/>">Notice</a></li>
                            <li><a href="<c:url value="/main/calendar"/>">Calendar</a></li>
                            <li><a href="<c:url value="/main/user"/>">User</a></li>
                            <li class="active"><a href="<c:url value="/main/profile"/>">Profile</a></li>
                            <li><a href="<c:url value="/main/supplement"/>">Supplement</a></li>
                            <li><a href="<c:url value="/main/benefits"/>">Benefits</a></li>
                            <li><a href="<c:url value="/main/training"/>">Training</a></li>
                            <li><a href="<c:url value="/main/position"/>">Position</a></li>
                            </c:if>
                            <c:if test="${formOverTime == 'overtime'}">
                            <li><a href="<c:url value="/main/notice"/>">Notice</a></li>
                            <li><a href="<c:url value="/main/calendar"/>">Calendar</a></li>
                            <li><a href="<c:url value="/main/user"/>">User</a></li>
                            <li><a href="<c:url value="/main/profile"/>">Profile</a></li>
                            <li class="active"><a href="<c:url value="/main/supplement"/>">Supplement</a></li>
                            <li><a href="<c:url value="/main/benefits"/>">Benefits</a></li>
                            <li><a href="<c:url value="/main/training"/>">Training</a></li>
                            <li><a href="<c:url value="/main/position"/>">Position</a></li>
                            </c:if>
                            <c:if test="${formLeave == 'leave'}">
                            <li><a href="<c:url value="/main/notice"/>">Notice</a></li>
                            <li><a href="<c:url value="/main/calendar"/>">Calendar</a></li>
                            <li><a href="<c:url value="/main/user"/>">User</a></li>
                            <li><a href="<c:url value="/main/profile"/>">Profile</a></li>
                            <li class="active"><a href="<c:url value="/main/supplement"/>">Supplement</a></li>
                            <li><a href="<c:url value="/main/benefits"/>">Benefits</a></li>
                            <li><a href="<c:url value="/main/training"/>">Training</a></li>
                            <li><a href="<c:url value="/main/position"/>">Position</a></li>
                            </c:if>
                            <c:if test="${formPayment == 'payment'}">
                            <li><a href="<c:url value="/main/notice"/>">Notice</a></li>
                            <li><a href="<c:url value="/main/calendar"/>">Calendar</a></li>
                            <li><a href="<c:url value="/main/user"/>">User</a></li>
                            <li><a href="<c:url value="/main/profile"/>">Profile</a></li>
                            <li class="active"><a href="<c:url value="/main/supplement"/>">Supplement</a></li>
                            <li><a href="<c:url value="/main/benefits"/>">Benefits</a></li>
                            <li><a href="<c:url value="/main/training"/>">Training</a></li>
                            <li><a href="<c:url value="/main/position"/>">Position</a></li>
                            </c:if>
                            <c:if test="${formSupplement == 'supplement'}">
                            <li><a href="<c:url value="/main/notice"/>">Notice</a></li>
                            <li><a href="<c:url value="/main/calendar"/>">Calendar</a></li>
                            <li><a href="<c:url value="/main/user"/>">User</a></li>
                            <li><a href="<c:url value="/main/profile"/>">Profile</a></li>
                            <li class="active"><a href="<c:url value="/main/supplement"/>">Supplement</a></li>
                            <li><a href="<c:url value="/main/benefits"/>">Benefits</a></li>
                            <li><a href="<c:url value="/main/training"/>">Training</a></li>
                            <li><a href="<c:url value="/main/position"/>">Position</a></li>
                            </c:if>
                            <c:if test="${formTraining == 'training'}">
                            <li><a href="<c:url value="/main/notice"/>">Notice</a></li>
                            <li><a href="<c:url value="/main/calendar"/>">Calendar</a></li>
                            <li><a href="<c:url value="/main/user"/>">User</a></li>
                            <li><a href="<c:url value="/main/profile"/>">Profile</a></li>
                            <li><a href="<c:url value="/main/supplement"/>">Supplement</a></li>
                            <li><a href="<c:url value="/main/benefits"/>">Benefits</a></li>
                            <li class="active"><a href="<c:url value="/main/training"/>">Training</a></li>
                            <li><a href="<c:url value="/main/position"/>">Position</a></li>
                            </c:if>
                            <c:if test="${formBenefits == 'benefits'}">
                            <li><a href="<c:url value="/main/notice"/>">Notice</a></li>
                            <li><a href="<c:url value="/main/calendar"/>">Calendar</a></li>
                            <li><a href="<c:url value="/main/user"/>">User</a></li>
                            <li><a href="<c:url value="/main/profile"/>">Profile</a></li>
                            <li><a href="<c:url value="/main/supplement"/>">Supplement</a></li>
                            <li class="active"><a href="<c:url value="/main/benefits"/>">Benefits</a></li>
                            <li><a href="<c:url value="/main/training"/>">Training</a></li>
                            <li><a href="<c:url value="/main/position"/>">Position</a></li>
                            </c:if>
                            <c:if test="${formPosition == 'position'}">
                            <li><a href="<c:url value="/main/notice"/>">Notice</a></li>
                            <li><a href="<c:url value="/main/calendar"/>">Calendar</a></li>
                            <li><a href="<c:url value="/main/user"/>">User</a></li>
                            <li><a href="<c:url value="/main/profile"/>">Profile</a></li>
                            <li><a href="<c:url value="/main/supplement"/>">Supplement</a></li>
                            <li><a href="<c:url value="/main/benefits"/>">Benefits</a></li>
                            <li><a href="<c:url value="/main/training"/>">Training</a></li>
                            <li class="active"><a href="<c:url value="/main/position"/>">Position</a></li>
                            </c:if>
                        </c:if>
                        <c:if test="${userInfo.user.permission == 'MANAGER'}">
                            <c:if test="${formhome == 'home'}">
                            <li class="nav-main"><a href="<c:url value="/main/information/view/${userInfo.user.id}"/>">Profile</a></li>
                            <li class="nav-main"><a href="<c:url value="/main/leave"/>">Leave</a></li>
                            <li class="nav-main"><a href="<c:url value="/main/payment"/>">Payment</a></li>
                            
                            <li class="nav-main"><a href="<c:url value="/main/structure"/>">Structure</a></li>
                            <li class="nav-main"><a href="<c:url value="/main/document"/>">Document</a></li>
                            </c:if>
                            <c:if test="${formProfile == 'profile'}">
                            <li class="active"><a href="<c:url value="/main/information/view/${userInfo.user.id}"/>">Profile</a></li>
                            <li><a href="<c:url value="/main/leave"/>">Leave</a></li>
                            <li><a href="<c:url value="/main/payment"/>">Payment</a></li>
                            
                            <li><a href="<c:url value="/main/structure"/>">Structure</a></li>
                            <li><a href="<c:url value="/main/document"/>">Document</a></li>
                            </c:if>                        
                            <c:if test="${formLeave == 'leave'}">
                            <li><a href="<c:url value="/main/information/view/${userInfo.user.id}"/>">Profile</a></li>
                            <li class="active"><a href="<c:url value="/main/leave"/>">Leave</a></li>
                            <li><a href="<c:url value="/main/payment"/>">Payment</a></li>
                            
                            <li><a href="<c:url value="/main/structure"/>">Structure</a></li>
                            <li><a href="<c:url value="/main/document"/>">Document</a></li>
                            </c:if>
                            <c:if test="${formPayment == 'payment'}">
                            <li><a href="<c:url value="/main/information/view/${userInfo.user.id}"/>">Profile</a></li>
                            <li><a href="<c:url value="/main/leave"/>">Leave</a></li>
                            <li class="active"><a href="<c:url value="/main/payment"/>">Payment</a></li>
                            
                            <li><a href="<c:url value="/main/structure"/>">Structure</a></li>
                            <li><a href="<c:url value="/main/document"/>">Document</a></li>
                            </c:if>
                            
                            <c:if test="${formStructure == 'structure'}">
                            <li><a href="<c:url value="/main/information/view/${userInfo.user.id}"/>">Profile</a></li>
                            <li><a href="<c:url value="/main/leave"/>">Leave</a></li>
                            <li><a href="<c:url value="/main/payment"/>">Payment</a></li>
                            
                            <li class="active"><a href="<c:url value="/main/structure"/>">Structure</a></li>
                            <li><a href="<c:url value="/main/document"/>">Document</a></li>
                            </c:if>
                            <c:if test="${formDocument == 'document'}">
                            <li><a href="<c:url value="/main/information/view/${userInfo.user.id}"/>">Profile</a></li>
                            <li><a href="<c:url value="/main/leave"/>">Leave</a></li>
                            <li><a href="<c:url value="/main/payment"/>">Payment</a></li>
                            
                            <li><a href="<c:url value="/main/structure"/>">Structure</a></li>
                            <li class="active"><a href="<c:url value="/main/document"/>">Document</a></li>
                            </c:if>

                    </c:if>
                    <c:if test="${userInfo.user.permission == 'EMPLOYEE'}">
                        <c:if test="${formhome == 'home'}">
                            <li class="nav-main"><a href="#">Notice</a></li>
                            <li class="nav-main"><a href="<c:url value="/main/information/view/${userInfo.user.id}"/>">Profile</a></li>                            
                            <li class="nav-main"><a href="<c:url value="/main/overtime"/>">Supplement</a></li>
                            <li class="nav-main"><a href="<c:url value="/main/document"/>">Document</a></li>
                            </c:if>
                            <c:if test="${formProfile == 'profile'}">
                            <li><a href="#">Notice</a></li>
                            <li class="active"><a href="<c:url value="/main/information/view/${userInfo.user.id}"/>">Profile</a></li>                            
                            <li><a href="<c:url value="/main/overtime"/>">Supplement</a></li>
                            <li><a href="<c:url value="/main/document"/>">Document</a></li>
                            </c:if>
                            <c:if test="${formOverTime == 'overtime' || formLeave == 'leave' || formPayment == 'payment'}">
                            <li><a href="#">Notice</a></li>
                            <li><a href="<c:url value="/main/information/view/${userInfo.user.id}"/>">Profile</a></li>                            
                            <li class="active"><a href="<c:url value="/main/overtime"/>">Supplement</a></li>
                            <li><a href="<c:url value="/main/document"/>">Document</a></li>
                            </c:if>                           
                            <c:if test="${formDocument == 'document'}">
                             <li><a href="#">Notice</a></li>
                            <li><a href="<c:url value="/main/information/view/${userInfo.user.id}"/>">Profile</a></li>                           
                            <li><a href="<c:url value="/main/overtime"/>">Supplement</a></li>
                            <li class="active"><a href="<c:url value="/main/document"/>">Document</a></li>
                            </c:if>
                        </c:if>

                </ul>

                <ul class="nav navbar-nav navbar-right">

                    <li class="dropdown">
                        <c:if test="${!userInfo.login}" >
                            <a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-user" aria-hidden="true"></span> <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="<c:url value="/main/login-form"/>">LOGIN</a></li>
                                <li><a href="#">Sign In</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a href="#">About</a></li>
                            </ul>
                        </c:if>
                        <c:if test="${userInfo.login}">
                            <a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                <span class="glyphicon glyphicon-off" aria-hidden="true"></span> 
                                <span class="caret"></span>
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="changePasswordForm">Change Password</a></li>
                                <li><a href="<c:url value="/main/logout"/>" onclick="alert('logout Bye.')">Logout</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a href="<c:url value="/main/about"/>">About</a></li>
                            </ul>
                        </c:if>
                    </li>

                </ul>
                <ul class="nav navbar-nav navbar-right">                    

                    <li><a>${userInfo.user.permission} : ${userInfo.user.username}</a></li>
                    <li class="dropdown" style="margin-bottom: -30px;width: 50px;height: 52px;">                        
                        <a class="dropdown-toggle" data-toggle="dropdown" style="margin-bottom: -23px"><span class="glyphicon glyphicon-globe" style="font-size: 20px"</span></a>
                        <ul class="dropdown-menu" style="width: 400px">
                            <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Notifications</b></li><br>    
                            <!--<input type="text" id="header"  class="form-control" readonly="true"/>-->
                            <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Birthday</b></li>                            
                            <li><a href="#">วันเกิดใครน่ะอิอิ</a></li>
                            <hr style="width: 100%;margin: 5px;"/>

                            <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Document Requests</b></li>                            
                            <li><a href="#">ใครๆ ใครขอเอกสารว่ามา</a></li>
                            <hr style="width: 100%;margin: 5px;"/>

                            <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Evaluation</b></li>                            
                            <li><a href="#">ไหนๆ ใครจะผ่านโปรแล้ว</a></li>
                            <hr style="width: 100%;margin: 5px;"/>

                            <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Insurance</b></li>                            
                            <li><a href="#">ดีๆ อยู่จะครบปี จัดประกันสังคมให้เบย</a></li>


                        </ul>                  
                        <!--<span class="badge badge-pill" style="margin-left: 20px;margin-top: 6px;">10</span></li>-->
                </ul>


            </div>
        </div>
    </nav>
</div>
<!--<script type="text/javascript">
    window.onload = headerFunction();
</script>-->
