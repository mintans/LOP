<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>

<html>
    <head>        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="<c:url value="/"/>view/template/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="<c:url value="/"/>view/template/css/bootstrap-theme.min.css" />
        <script src=https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js></script>
        <script src="<c:url value="/"/>view/template/js/bootstrap.min.js" ></script>
        <script type="text/javascript"
                src="http://tarruda.github.com/bootstrap-datetimepicker/assets/js/bootstrap-datetimepicker.min.js">
        </script>
        <script type="text/javascript"
                src="http://tarruda.github.com/bootstrap-datetimepicker/assets/js/bootstrap-datetimepicker.pt-BR.js">
        </script>
        <link rel="stylesheet" type="text/css" media="screen"
              href="http://tarruda.github.com/bootstrap-datetimepicker/assets/css/bootstrap-datetimepicker.min.css">
        <link rel="stylesheet" type="text/css" media="screen"
              href="<c:url value="/"/>css/datepicker.css">
        <script type="text/javascript" src="<c:url value="/"/>js/bootstrap-datepicker.js"></script>
        <!-- thai extension -->
        <script type="text/javascript" src="<c:url value="/"/>js/bootstrap-datepicker-thai.js"></script>
        <script type="text/javascript" src="<c:url value="/"/>js/locales/bootstrap-datepicker.th.js"></script>
        <c:if test="${action == 'save'}">
            <title>Profile ADD</title></c:if>
        <c:if test="${action == 'update'}">
            <title>Profile Update</title></c:if>     
            <style>
                p.normal {
                    border-bottom: 2px solid gray;
                }
            </style>
            <script language="javascript">
                    function calAge(o) {
                        var tmp = o.value.split("-");
                        var current = new Date();
                        var current_year = current.getFullYear();
                        document.getElementById("age").value = current_year - tmp[0];
                    }
            </script>
            <script type="text/javascript">
                function autoTab2(obj, typeCheck) {
                    if (typeCheck == 1) {
                        var pattern = new String("_-____-_____-_-__");
                        var pattern_ex = new String("-");
                    } else if (typeCheck == 2) {
                        var pattern = new String("__-____-____");
                        var pattern_ex = new String("-");
                    } else if (typeCheck == 3) {
                        var pattern = new String("_-____-____");
                        var pattern_ex = new String("-");
                    } else {
                        var pattern = new String("___-_-_____-_");
                        var pattern_ex = new String("-");
                    }
                    var returnText = new String("");
                    var obj_l = obj.value.length;
                    var obj_l2 = obj_l - 1;
                    for (i = 0; i < pattern.length; i++) {
                        if (obj_l2 == i && pattern.charAt(i + 1) == pattern_ex) {
                            returnText += obj.value + pattern_ex;
                            obj.value = returnText;
                        }
                    }
                    if (obj_l >= pattern.length) {
                        obj.value = obj.value.substr(0, pattern.length);
                    }
                }
            </script>
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
                <span class="breadcrumb-item active">profile-${action}</span>
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
                                <h4 class="panel-title">Profile (Thai) ${action}</h4>
                            </div>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <label>

                                </label>
                            </div>
                            <div class="form-horizontal col-md-12">
                                <form:form  method="POST" action="${action}" commandName="profileForm">
                                    <div class="row">
                                        <label class="control-label col-md-12"><h4><p class="normal" align="left">&nbsp;&nbsp;&nbsp;ข้อมูลบุคคล</p></h4></label>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="id" class="col-md-6 control-label">รหัสพนักงาน</label>
                                            <div class="col-md-6">
                                                <form:input class="form-control" path="id" value="${uId}" readonly="true"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="startWorking" class="col-md-6 control-label">วันเริ่มทำงาน</label>
                                            <div class="col-md-6">
                                                <form:input type="date" class="form-control"  path="startWorking" value="${startWorkDate}" required="true"/>
                                            </div>                
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="title" class="col-md-6 control-label">คำนำหน้า</label>
                                            <div class="col-md-6">
                                                <form:select class="form-control" path="title" required="true">
                                                    <form:option value="" label="กรุณาเลือก"/>
                                                    <form:option value="1" label="นาย"/>
                                                    <form:option value="2" label="นาง"/>
                                                    <form:option value="3" label="นางสาว"/>
                                                </form:select>
                                            </div>                
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="firstName" class="col-md-6 control-label">ชื่อ</label>
                                            <div class="col-md-6">
                                                <form:input class="form-control" path="firstName" required="firstName" value=""/>
                                            </div>                
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="lastName" class="col-md-6 control-label">นามสกุล</label>
                                            <div class="col-md-6">
                                                <form:input class="form-control" path="lastName" required="lastName" value=""/>
                                            </div>                
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="nickName" class="col-md-6 control-label">ชื่อเล่น</label>
                                            <div class="col-md-6">
                                                <form:input class="form-control" path="nickName" required="nickName" value=""/>
                                            </div>                
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="birthDay" class="col-md-6 control-label">วัน/เดือน/ปีเกิด</label>
                                            <div class="col-md-6">
                                                <form:input type="date" class="form-control" path="birth" onchange="calAge(this);" required="true"/>
                                            </div>
                                        </div>
                                        <div class="form-group col-md-3">
                                            <label for="age" class="col-md-3 control-label">อายุ</label>
                                            <div class="col-md-6">
                                                <form:input type="text" class="form-control" path="age" required="age" value=""/>
                                            </div>
                                            <label class="col-md-1 control-label">ปี</label>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="cardno" class="col-md-6 control-label">บัตรประชาชนเลขที่</label>
                                            <div class="col-md-6">
                                                <form:input class="form-control" path="cardno" required="cardno" onkeyup="autoTab2(this,1)" value=""/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="cardnoExpiration" class="col-md-6 control-label">วันบัตรหมดอายุ</label>
                                            <div class="col-md-6">
                                                <form:input type="date" class="form-control" path="cardnoExpiration" required="true"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-md-6">
                                            <label for="height" class="col-md-9 control-label">ส่วนสูง</label>
                                            <div class="col-md-3">
                                                <form:input class="form-control" path="height" required="height" value="" placeholder="180cm"/>
                                            </div>
                                        </div>
                                        <div class="form-group col-md-3">
                                            <label for="weight" class="col-md-4 control-label">น้ำหนัก</label>
                                            <div class="col-md-7">
                                                <form:input class="form-control" path="weight" required="weight" value="" placeholder="70kg"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-md-6">
                                            <label for="race" class="col-md-9 control-label">เชื้อชาติ</label>
                                            <div class="col-md-3">
                                                <form:input class="form-control" path="race" required="race" value=""/>
                                            </div>
                                        </div>
                                        <div class="form-group col-md-3">
                                            <label for="nationality" class="col-md-4 control-label">สัญชาติ</label>
                                            <div class="col-md-7">
                                                <form:input class="form-control" path="nationality" required="nationality" value=""/>
                                            </div>
                                        </div>
                                        <div class="form-group col-md-3">
                                            <label for="religion" class="col-md-4 control-label">ศาสนา</label>
                                            <div class="col-md-7">
                                                <form:input class="form-control" path="religion" required="religion" value=""/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="bankAccount" class="col-md-6 control-label">บัญชีธนาคาร</label>
                                            <div class="col-md-6">
                                                <form:select class="form-control" path="bankAccount" required="true">
                                                    <form:option value="" label="กรุณาเลือก"/>
                                                    <form:option value="1" label="ธนาคารไทยพาณิชย์"/>
                                                    <form:option value="2" label="ธนาคารกรุงไทย"/>
                                                    <form:option value="3" label="ธนาคารกรุงเทพ"/>
                                                    <form:option value="4" label="ธนาคารกสิกร"/>
                                                    <form:option value="5" label="ธนาคารทหารไทย"/>
                                                    <form:option value="6" label="ธนาคารกรุงศรีอยุธยา"/>
                                                </form:select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="bankAccountNo" class="col-md-6 control-label">เลขที่บัญชี</label>
                                            <div class="col-md-6">
                                                <form:input class="form-control" path="bankAccountNo" required="bankAccountNo" onkeyup="autoTab2(this,4)" value=""/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <label class="control-label col-md-12"><h4><p class="normal" align="left">&nbsp;&nbsp;&nbsp;ข้อมูลติดต่อ</p></h4></label>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7" align="right">
                                            <label for="registeredAddress" class="col-md-6"><u>ที่อยู่ตามทะเบียนบ้าน</u></label>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="houseNoRegistration" class="col-md-6 control-label">บ้านเลขที่</label>
                                            <div class="col-md-6">
                                                <form:input class="form-control" path="houseNoRegistration" required="houseNoRegistration" value=""/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="roadRegistration" class="col-md-6 control-label">ถนน</label>
                                            <div class="col-md-6">
                                                <form:input class="form-control" path="roadRegistration" required="roadRegistration" value=""/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="subDistrictRegistration" class="col-md-6 control-label">ตำบล/แขวง</label>
                                            <div class="col-md-6">
                                                <form:input class="form-control" path="subDistrictRegistration" required="subDistrictRegistration" value=""/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="districtRegistration" class="col-md-6 control-label">อำเภอ/เขต</label>
                                            <div class="col-md-6">
                                                <form:input class="form-control" path="districtRegistration" required="districtRegistration" value=""/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="provinceRegistration" class="col-md-6 control-label">จังหวัด</label>
                                            <div class="col-md-6">
                                                <form:select class="form-control" path="provinceRegistration" required="true">
                                                    <form:option value="" label="กรุณาเลือก"/>
                                                    <c:set var="index" value="1" scope="page"/>
                                                    <c:forEach var="provinceTH" items="${provinceTH}">
                                                        <form:option value="${index}" label="${provinceTH}"/>
                                                        <c:set var="index" value="${index+1}" scope="page"/>
                                                    </c:forEach>
                                                </form:select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="postCodeRegistration" class="col-md-6 control-label">รหัสไปรษณีย์</label>
                                            <div class="col-md-6">
                                                <form:input class="form-control" path="postCodeRegistration" required="postCodeRegistration" value=""/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <br>
                                        <div class="form-group col-md-7" align="right">
                                            <label for="currentAddress" class="col-md-6"><u>ที่อยู่ปัจจุบัน</u></label>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="houseNoCurrent" class="col-md-6 control-label">บ้านเลขที่</label>
                                            <div class="col-md-6">
                                                <form:input class="form-control" path="houseNoCurrent" required="houseNoCurrent" value=""/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="roadCurrent" class="col-md-6 control-label">ถนน</label>
                                            <div class="col-md-6">
                                                <form:input class="form-control" path="roadCurrent" required="roadCurrent" value=""/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="subDistrictCurrent" class="col-md-6 control-label">ตำบล/แขวง</label>
                                            <div class="col-md-6">
                                                <form:input class="form-control" path="subDistrictCurrent" required="subDistrictCurrent" value=""/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="districtCurrent" class="col-md-6 control-label">อำเภอ/เขต</label>
                                            <div class="col-md-6">
                                                <form:input class="form-control" path="districtCurrent" required="districtCurrent" value=""/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="provinceCurrent" class="col-md-6 control-label">จังหวัด</label>
                                            <div class="col-md-6">
                                                <form:select class="form-control" path="provinceCurrent" required="true">
                                                    <form:option value="" label="กรุณาเลือก"/>
                                                    <c:set var="index2" value="1" scope="page"/>
                                                    <c:forEach var="provinceTH" items="${provinceTH}">
                                                        <form:option value="${index2}" label="${provinceTH}"/>
                                                        <c:set var="index2" value="${index2+1}" scope="page"/>
                                                    </c:forEach>
                                                </form:select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="postCodeCurrent" class="col-md-6 control-label">รหัสไปรษณีย์</label>
                                            <div class="col-md-6">
                                                <form:input class="form-control" path="postCodeCurrent" required="postCodeCurrent" value=""/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="tel" class="col-md-6 control-label" align="right">โทรศัพท์</label>
                                            <div class="col-md-6">
                                                <form:input class="form-control" path="tel" required="tel" onkeyup="autoTab2(this,3)" value=""/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="mobile" class="col-md-6 control-label" align="right">มือถือ</label>
                                            <div class="col-md-6">
                                                <form:input class="form-control" path="mobile" required="mobile" onkeyup="autoTab2(this,2)" value=""/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="Email" class="col-md-6 control-label" align="right">อีเมล์</label>
                                            <div class="col-md-6">
                                                <form:input class="form-control" path="email" required="email" value=""/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <label class="control-label col-md-12"><h4><p class="normal" align="left">&nbsp;&nbsp;&nbsp;คุณสมบัติเพิ่มเติม</p></h4></label>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="habitationType" class="col-md-6 control-label" align="right">ประเภทที่พัก</label>
                                            <div class="col-md-6">
                                                <form:select class="form-control" path="habitationType" required="true">
                                                    <form:option value="" label="กรุณาเลือก"/>
                                                    <form:option value="1" label="อาศัยกับครอบครัว"/>
                                                    <form:option value="2" label="บ้านตัวเอง"/>
                                                    <form:option value="3" label="บ้านเช่า"/>
                                                    <form:option value="4" label="หอพัก"/>
                                                </form:select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="militaryStatus" class="col-md-6 control-label" align="right">สภาวะทางทหาร</label>
                                            <div class="col-md-6">
                                                <form:select class="form-control" path="militaryStatus" required="true">
                                                    <form:option value="" label="กรุณาเลือก"/>
                                                    <form:option value="1" label="ได้รับการยกเว้น"/>
                                                    <form:option value="2" label="ปลดเป็นทหารกองหนุน"/>
                                                    <form:option value="3" label="ยังไม่ได้รับการเกณฑ์"/>
                                                </form:select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="marital" class="col-md-6 control-label" align="right">สถานะสมรส</label>
                                            <div class="col-md-6">
                                                <form:select class="form-control" path="marital" required="true">
                                                    <form:option value="" label="กรุณาเลือก"/>
                                                    <form:option value="1" label="โสด"/>
                                                    <form:option value="2" label="แต่งงานแล้ว"/>
                                                    <form:option value="3" label="หม้าย"/>
                                                    <form:option value="3" label="แยกกัน"/>
                                                </form:select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="car" class="col-md-6 control-label" align="right">รถยนต์ส่วนตัว</label>
                                            <div class="col-md-6">
                                                <label class="radio-inline"><form:radiobutton path="car" value="true"/>มี</label>
                                                <label class="radio-inline"><form:radiobutton path="car" value="false"/>ไม่มี</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="carDrivingNo" class="col-md-6 control-label" align="right">ใบขับขี่เลขที่</label>
                                            <div class="col-md-6">
                                                <form:input class="form-control" path="carDrivingNo" required="true" value=""/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="motorcycle" class="col-md-6 control-label" align="right">รถจักรยานยนต์ส่วนตัว</label>
                                            <div class="col-md-6">
                                                <label class="radio-inline"><form:radiobutton path="motorcycle" value="true"/>มี</label>
                                                <label class="radio-inline"><form:radiobutton path="motorcycle" value="false"/>ไม่มี</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="motorcycleDrivingNo" class="col-md-6 control-label" align="right">ใบขับขี่เลขที่</label>
                                            <div class="col-md-6">
                                                <form:input class="form-control" path="motorcycleDrivingNo" required="motorcycleDrivingNo" value=""/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-10">
                                            <label for="workUpCountry" class="col-md-4 control-label" align="right">ปฏิบัติงานต่างจังหวัด</label>
                                            <div class="col-md-8">
                                                <div class="col-md-7">
                                                    <c:if test="${action == 'save'}">
                                                    <label class="radio-inline"><form:radiobutton path="workUpCountry" value="1"/>ได้</label>
                                                    <label class="radio-inline"><form:radiobutton path="workUpCountry" value="2" checked="checked"/>ไม่ได้</label>
                                                    <label class="radio-inline"><form:radiobutton path="workUpCountry" value="3"/>อื่นๆ ระบุ</label>
                                                    </c:if>
                                                    <c:if test="${action == 'update'}">
                                                    <label class="radio-inline"><form:radiobutton path="workUpCountry" value="1"/>ได้</label>
                                                    <label class="radio-inline"><form:radiobutton path="workUpCountry" value="2"/>ไม่ได้</label>
                                                    <label class="radio-inline"><form:radiobutton path="workUpCountry" value="3"/>อื่นๆ ระบุ</label>
                                                    </c:if>
                                                </div>
                                                <div class="col-md-5">
                                                    <form:input class="form-control" path="workUpCountryMention" required="workUpCountryMention" value=""/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-10">
                                            <label for="contagiousDisease" class="col-md-4 control-label" align="right">เคยป่วยหรือเป็นโรคร้ายแรง</label>
                                            <div class="col-md-8">
                                                <div class="col-md-7">
                                                    <label class="radio-inline"><form:radiobutton path="contagiousDisease" value="true"/>เคย</label>
                                                    <label class="radio-inline"><form:radiobutton path="contagiousDisease" value="false"/>ไม่เคย</label>
                                                    <label class="radio-inline control-label" align="right">ชื่อโรคที่เป็น</label>
                                                </div>
                                                <div class="col-md-5">
                                                    <form:input class="form-control" path="nameContagiousDisease" required="nameContagiousDisease" value=""/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <label class="control-label col-md-12"><h4><p class="normal" align="left">&nbsp;&nbsp;&nbsp;กรณีฉุกเฉินบุคคลที่ติดต่อได้</p></h4></label>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="personCaseEmergencyFirstname" class="col-md-6 control-label" align="right">ชื่อ</label>
                                            <div class="col-md-6">
                                                <form:input class="form-control" path="personCaseEmergencyFirstname" required="personCaseEmergencyFirstname" value=""/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="personCaseEmergencyLastname" class="col-md-6 control-label" align="right">นามสกุล</label>
                                            <div class="col-md-6">
                                                <form:input class="form-control" path="personCaseEmergencyLastname" required="personCaseEmergencyLastname" value=""/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="relatedApplicant" class="col-md-6 control-label" align="right">เกี่ยวข้องกับผู้สมัคร</label>
                                            <div class="col-md-6">
                                                <form:input class="form-control" path="relatedApplicant" required="relatedApplicant" value=""/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="personCaseEmergencyAddress" class="col-md-6 control-label" align="right">ที่อยู่</label>
                                            <div class="col-md-6">
                                                <form:textarea class="form-control" style="overflow:auto;resize:none" rows="5" cols="5" path="relatedApplicantAddress" required="relatedApplicantAddress"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="personCaseEmergencyPhone" class="col-md-6 control-label" align="right">โทร</label>
                                            <div class="col-md-6">
                                                <form:input class="form-control" path="relatedApplicantTel" required="relatedApplicantTel" onkeyup="autoTab2(this,2)" value=""/>
                                            </div>
                                        </div>
                                    </div>    
                                    <div class="row col-md-offset-1" align="center">
                                        <div class="form-group col-md-9">
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

        <script src="<c:url value="/"/>js/app.js"></script>
    </body>
</html>

