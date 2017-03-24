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
                                <h4 class="panel-title">Profile (English) ${action}</h4>
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
                                        <label class="control-label col-md-12"><h4><p class="normal" align="left">&nbsp;&nbsp;&nbsp;Personal Information</p></h4></label>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="id" class="col-md-6 control-label">Employee ID</label>
                                            <div class="col-md-6">
                                                <form:input class="form-control" path="id" value="${uId}" readonly="true"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="startWorking" class="col-md-6 control-label">Start date</label>
                                            <div class="col-md-6">
                                                <form:input type="date" class="form-control" path="startWorking" value="${startWorkDate}" required="true"/>
                                            </div>                
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="Title" class="col-md-6 control-label">Title</label>
                                            <div class="col-md-6">
                                                <form:select class="form-control" path="title" required="true">
                                                    <form:option value="" label="Please Select"/>
                                                    <form:option value="1" label="Mr."/>
                                                    <form:option value="2" label="Mrs."/>
                                                    <form:option value="3" label="Miss"/>
                                                </form:select>
                                            </div>                
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="Firstname" class="col-md-6 control-label">Firstname</label>
                                            <div class="col-md-6">
                                                <form:input class="form-control" path="firstNameEN" required="firstNameEN" value=""/>
                                            </div>                
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="Lastname" class="col-md-6 control-label">Lastname</label>
                                            <div class="col-md-6">
                                                <form:input class="form-control" path="lastNameEN" required="lastNameEN" value=""/>
                                            </div>                
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="Nick name" class="col-md-6 control-label">Nick name</label>
                                            <div class="col-md-6">
                                                <form:input class="form-control" path="nickNameEN" required="nickNameEN" value=""/>
                                            </div>                
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="birthDay" class="col-md-6 control-label">Date of birth</label>
                                            <div class="col-md-6">
                                                <form:input type="date" class="form-control" path="birth" onchange="calAge(this);" required="true"/>
                                            </div>
                                        </div>
                                        <div class="form-group col-md-3">
                                            <label for="age" class="col-md-3 control-label">Age</label>
                                            <div class="col-md-6">
                                                <form:input type="text" class="form-control" path="age" required="age" value=""/>
                                            </div>
                                            <label class="col-md-1 control-label">Yrs.</label>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="cardno" class="col-md-6 control-label">Identity card no.</label>
                                            <div class="col-md-6">
                                                <form:input class="form-control" path="cardno" required="cardno" onkeyup="autoTab2(this,1)" value=""/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="cardnoExpiration" class="col-md-6 control-label">Expiration date</label>
                                            <div class="col-md-6">
                                                <form:input type="date" class="form-control" path="cardnoExpiration" required="true"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-md-6">
                                            <label for="height" class="col-md-9 control-label">Height</label>
                                            <div class="col-md-3">
                                                <form:input class="form-control" path="height" required="height" value="" placeholder="180cm"/>
                                            </div>
                                        </div>
                                        <div class="form-group col-md-3">
                                            <label for="weight" class="col-md-4 control-label">Weight</label>
                                            <div class="col-md-7">
                                                <form:input class="form-control" path="weight" required="weight" value="" placeholder="70kg"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-md-6">
                                            <label for="race" class="col-md-9 control-label">Race</label>
                                            <div class="col-md-3">
                                                <form:input class="form-control" path="raceEN" required="raceEN" value=""/>
                                            </div>
                                        </div>
                                        <div class="form-group col-md-3">
                                            <label for="nationality" class="col-md-4 control-label">Nationality</label>
                                            <div class="col-md-7">
                                                <form:input class="form-control" path="nationalityEN" required="nationalityEN" value=""/>
                                            </div>
                                        </div>
                                        <div class="form-group col-md-3">
                                            <label for="religion" class="col-md-4 control-label">Religion</label>
                                            <div class="col-md-7">
                                                <form:input class="form-control" path="religionEN" required="religionEN" value=""/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="bankAccount" class="col-md-6 control-label">Bank Accout</label>
                                            <div class="col-md-6">
                                                <form:select class="form-control" path="bankAccount" required="true">
                                                    <form:option value="" label="Please Select"/>
                                                    <form:option value="1" label="The Siam Commercial Bank"/>
                                                    <form:option value="2" label="Krung Thai Bank"/>
                                                    <form:option value="3" label="Bangkok Bank"/>
                                                    <form:option value="4" label="Kasikorn Bank"/>
                                                    <form:option value="5" label="Thai Military Bank"/>
                                                    <form:option value="6" label="Bank of Ayudhya"/>
                                                </form:select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="bankAccountNo" class="col-md-6 control-label">Accout Number</label>
                                            <div class="col-md-6">
                                                <form:input class="form-control" path="bankAccountNo" required="bankAccountNo" onkeyup="autoTab2(this,4)" value=""/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <label class="control-label col-md-12"><h4><p class="normal" align="left">&nbsp;&nbsp;&nbsp;Contact Info</p></h4></label>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7" align="right">
                                            <label for="registeredAddress" class="col-md-6"><u>Permanent Address</u></label>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="houseNoRegistration" class="col-md-6 control-label">Address</label>
                                            <div class="col-md-6">
                                                <form:input class="form-control" path="houseNoRegistration" required="houseNoRegistration" value=""/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="roadRegistration" class="col-md-6 control-label">Road</label>
                                            <div class="col-md-6">
                                                <form:input class="form-control" path="roadRegistrationEN" required="roadRegistrationEN" value=""/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="subDistrictRegistration" class="col-md-6 control-label">Sub-District</label>
                                            <div class="col-md-6">
                                                <form:input class="form-control" path="subDistrictRegistrationEN" required="subDistrictRegistrationEN" value=""/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="districtRegistration" class="col-md-6 control-label">District</label>
                                            <div class="col-md-6">
                                                <form:input class="form-control" path="districtRegistrationEN" required="districtRegistrationEN" value=""/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="provinceRegistration" class="col-md-6 control-label">Province</label>
                                            <div class="col-md-6">
                                                <form:select class="form-control" path="provinceRegistration" required="true">
                                                    <form:option value="" label="Please Select"/>
                                                    <c:set var="index" value="1" scope="page"/>
                                                    <c:forEach var="provinceEN" items="${provinceEN}">
                                                        <form:option value="${index}" label="${provinceEN}"/>
                                                        <c:set var="index" value="${index+1}" scope="page"/>
                                                    </c:forEach>
                                                </form:select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="postCodeRegistration" class="col-md-6 control-label">Post Code</label>
                                            <div class="col-md-6">
                                                <form:input class="form-control" path="postCodeRegistration" required="postCodeRegistration" value=""/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <br>
                                        <div class="form-group col-md-7" align="right">
                                            <label for="currentAddress" class="col-md-6"><u>Present address</u></label>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="houseNoCurrent" class="col-md-6 control-label">Address</label>
                                            <div class="col-md-6">
                                                <form:input class="form-control" path="houseNoCurrent" required="houseNoCurrent" value=""/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="roadCurrent" class="col-md-6 control-label">Road</label>
                                            <div class="col-md-6">
                                                <form:input class="form-control" path="roadCurrentEN" required="roadCurrentEN" value=""/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="subDistrictCurrent" class="col-md-6 control-label">Sub-District</label>
                                            <div class="col-md-6">
                                                <form:input class="form-control" path="subDistrictCurrentEN" required="subDistrictCurrentEN" value=""/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="districtCurrent" class="col-md-6 control-label">District</label>
                                            <div class="col-md-6">
                                                <form:input class="form-control" path="districtCurrentEN" required="districtCurrentEN" value=""/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="provinceCurrent" class="col-md-6 control-label">Province</label>
                                            <div class="col-md-6">
                                                <form:select class="form-control" path="provinceCurrent" required="true">
                                                    <form:option value="" label="Please Select"/>
                                                    <c:set var="index2" value="1" scope="page"/>
                                                    <c:forEach var="provinceEN" items="${provinceEN}">
                                                        <form:option value="${index2}" label="${provinceEN}"/>
                                                        <c:set var="index2" value="${index2+1}" scope="page"/>
                                                    </c:forEach>
                                                </form:select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="postCodeCurrent" class="col-md-6 control-label">Post Code</label>
                                            <div class="col-md-6">
                                                <form:input class="form-control" path="postCodeCurrent" required="postCodeCurrent" value=""/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="tel" class="col-md-6 control-label" align="right">Telephone</label>
                                            <div class="col-md-6">
                                                <form:input class="form-control" path="tel" required="tel" onkeyup="autoTab2(this,3)" value=""/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="mobile" class="col-md-6 control-label" align="right">Mobile</label>
                                            <div class="col-md-6">
                                                <form:input class="form-control" path="mobile" required="mobile" onkeyup="autoTab2(this,2)" value=""/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="Email" class="col-md-6 control-label" align="right">E-mail</label>
                                            <div class="col-md-6">
                                                <form:input class="form-control" path="email" required="email" value=""/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <label class="control-label col-md-12"><h4><p class="normal" align="left">&nbsp;&nbsp;&nbsp;Additional features</p></h4></label>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="habitationType" class="col-md-6 control-label" align="right">Type of home</label>
                                            <div class="col-md-6">
                                                <form:select class="form-control" path="habitationType" required="true">
                                                    <form:option value="" label="Please Select"/>
                                                    <form:option value="1" label="Living with parent"/>
                                                    <form:option value="2" label="Own home"/>
                                                    <form:option value="3" label="Hired house"/>
                                                    <form:option value="4" label="Hiredflat/Hostel"/>
                                                </form:select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="militaryStatus" class="col-md-6 control-label" align="right">Milatary status</label>
                                            <div class="col-md-6">
                                                <form:select class="form-control" path="militaryStatus" required="true">
                                                    <form:option value="" label="Please Select"/>
                                                    <form:option value="1" label="Exempted"/>
                                                    <form:option value="2" label="Served"/>
                                                    <form:option value="3" label="Not yet served"/>
                                                </form:select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="marital" class="col-md-6 control-label" align="right">Marital status</label>
                                            <div class="col-md-6">
                                                <form:select class="form-control" path="marital" required="true">
                                                    <form:option value="" label="Please Select"/>
                                                    <form:option value="1" label="Single"/>
                                                    <form:option value="2" label="Married"/>
                                                    <form:option value="3" label="Widowed"/>
                                                    <form:option value="3" label="Separated"/>
                                                </form:select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="car" class="col-md-6 control-label" align="right">Car</label>
                                            <div class="col-md-6">
                                                <label class="radio-inline"><form:radiobutton path="car" value="true"/>Yes</label>
                                                <label class="radio-inline"><form:radiobutton path="car" value="false"/>No</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="carDrivingNo" class="col-md-6 control-label" align="right">Driving Licences No.</label>
                                            <div class="col-md-6">
                                                <form:input class="form-control" path="carDrivingNo" value="" required="true"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="motorcycle" class="col-md-6 control-label" align="right">Motorcycles</label>
                                            <div class="col-md-6">
                                                <label class="radio-inline"><form:radiobutton path="motorcycle" value="true"/>Yes</label>
                                                <label class="radio-inline"><form:radiobutton path="motorcycle" value="false"/>No</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="motorcycleDrivingNo" class="col-md-6 control-label" align="right">Driving Licences No.</label>
                                            <div class="col-md-6">
                                                <form:input class="form-control" path="motorcycleDrivingNo" required="motorcycleDrivingNo" value=""/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-10">
                                            <label for="workUpCountry" class="col-md-4 control-label" align="right">Work up country</label>
                                            <div class="col-md-8">
                                                <div class="col-md-7">
                                                    <label class="radio-inline"><form:radiobutton path="workUpCountry" value="1"/>Yes</label>
                                                    <label class="radio-inline"><form:radiobutton path="workUpCountry" value="2"/>No</label>
                                                    <label class="radio-inline"><form:radiobutton path="workUpCountry" value="3"/>Others</label>
                                                </div>
                                                <div class="col-md-5">
                                                    <form:input class="form-control" path="workUpCountryMentionEN" required="workUpCountryMentionEN" value=""/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-10">
                                            <label for="contagiousDisease" class="col-md-4 control-label" align="right">Have you ever been sick ?</label>
                                            <div class="col-md-8">
                                                <div class="col-md-7">
                                                    <label class="radio-inline"><form:radiobutton path="contagiousDisease" value="true"/>Yes</label>
                                                    <label class="radio-inline"><form:radiobutton path="contagiousDisease" value="false"/>No</label>
                                                    <label class="radio-inline control-label" align="right">Disease name</label>
                                                </div>
                                                <div class="col-md-5">
                                                    <form:input class="form-control" path="nameContagiousDiseaseEN" required="nameContagiousDiseaseEN" value=""/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <label class="control-label col-md-12"><h4><p class="normal" align="left">&nbsp;&nbsp;&nbsp;Emergency contact</p></h4></label>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="personCaseEmergencyFirstname" class="col-md-6 control-label" align="right">Firstname</label>
                                            <div class="col-md-6">
                                                <form:input class="form-control" path="personCaseEmergencyFirstnameEN" required="personCaseEmergencyFirstnameEN" value=""/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="personCaseEmergencyLastname" class="col-md-6 control-label" align="right">Lastname</label>
                                            <div class="col-md-6">
                                                <form:input class="form-control" path="personCaseEmergencyLastnameEN" required="personCaseEmergencyLastnameEN" value=""/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="relatedApplicant" class="col-md-6 control-label" align="right">Related to applicant as</label>
                                            <div class="col-md-6">
                                                <form:input class="form-control" path="relatedApplicantEN" required="relatedApplicantEN" value=""/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="personCaseEmergencyAddress" class="col-md-6 control-label" align="right">Address</label>
                                            <div class="col-md-6">
                                                <form:textarea class="form-control" style="overflow:auto;resize:none" rows="5" cols="5" path="relatedApplicantAddressEN" required="relatedApplicantAddressEN"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="personCaseEmergencyPhone" class="col-md-6 control-label" align="right">Tel.</label>
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

