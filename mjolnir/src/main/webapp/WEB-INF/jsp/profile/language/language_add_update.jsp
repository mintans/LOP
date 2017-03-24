<%-- 
    Document   : profile_form
    Created on : Jan 27, 2016, 2:54:10 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="<c:url value="/"/>view/template/css/bootstrap.min.css" />
        <link rel="stylesheet" href="<c:url value="/"/>view/template/css/bootstrap-theme.min.css" />
        <script src=https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js></script>
        <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery.tablesorter/2.9.1/jquery.tablesorter.min.js"></script>
        <script src="<c:url value="/"/>view/template/js/bootstrap.min.js" ></script>
        <script src="<c:url value="/"/>js/app.js" type="text/javascript"></script>
        <c:if test="${action == 'save'}">
            <title>Language ADD</title>
        </c:if>
        <c:if test="${action == 'update'}">
            <title>Language Update</title>
        </c:if>
        <style>
            div.underline {
                border-bottom: 2px solid gray;
            }
        </style>
    </head>
    <body>


        <div class="container-fluid">


            <div class="row">  <%@ include file="/WEB-INF/jsp/header.jsp" %>
                <!-- Latest compiled and minified JavaScript -->
            </div>

            <nav class="breadcrumb">
                <a class="breadcrumb-item" href="<c:url value="/main/profile"/>">Profile</a> / 
                <c:if test="${action == 'update'}">
                    <a class="breadcrumb-item" href="<c:url value="/"/>main/profile/viewTH/${id}"/>${id}</a> / 
                </c:if>
                <span class="breadcrumb-item active">language-${action}</span>
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
                                <h4 class="panel-title">Language Ability ${action}</h4>
                            </div>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <label>

                                </label>
                            </div>
                            <div class="form-horizontal col-md-12">    
                                <form:form method="POST" action="${action}" commandName="languageForm">
                                    <div class="row col-md-offset-1">
                                        <label>รหัสพนักงาน : ${languageItem.id}   
                                            <c:if test="${languageItem.title == 1}">นาย</c:if>
                                            <c:if test="${languageItem.title == 2}">นาง</c:if>
                                            <c:if test="${languageItem.title == 3}">นางสาว</c:if>
                                            ${languageItem.firstName}   ${languageItem.lastName}</label>
                                    </div>

                                    <c:if test="${action == 'save'}">
                                        <div class="row">
                                            <label>
                                                <form:input class="form-control" path="profileId" value="${languageItem.id}" type="hidden"/>
                                            </label>
                                        </div>
                                    </c:if>
                                    <c:if test="${action == 'update'}">
                                        <div class="row">
                                            <label>
                                                <form:input class="form-control" path="id" value="" type="hidden"/>
                                                <form:input class="form-control" path="profileId" value="" type="hidden"/>
                                            </label>
                                        </div>
                                    </c:if>
                                    <div class="row col-md-offset-9">
                                        <button type="button" onclick="duplicate()" class="btn btn-primary">เพิ่มภาษาอื่น/Other</button>
                                    </div>
                                    <div class="row" id="languageGroup">
                                        <div id=languageClone>
                                            <div class="row col-md-offset-1" id="languageName">
                                                <div class="form-group col-md-4" align="right">
                                                    <label for="thaiLanguage" class="col-md-6"><u>Thai</u></label>
                                                </div>
                                            </div>
                                            <div class="row col-md-offset-2">
                                                <div class="form-group col-md-10 underline">
                                                    <label for="thaiSpeaking" class="col-md-2 control-label" align="right">Speaking</label>
                                                    <div class="col-md-10">
                                                        <div class="col-md-12">
                                                            <label class="radio-inline col-md-3" align="right"><form:radiobutton path="thaiSpeaking" value="1"/>Good</label>
                                                            <label class="radio-inline col-md-3" align="right"><form:radiobutton path="thaiSpeaking" value="2"/>Fair</label>
                                                            <label class="radio-inline col-md-3" align="right"><form:radiobutton path="thaiSpeaking" value="3"/>Poor</label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row col-md-offset-2">
                                                <div class="form-group col-md-10 underline">
                                                    <label for="thaiWriting" class="col-md-2 control-label" align="right">Writing</label>
                                                    <div class="col-md-10">
                                                        <div class="col-md-12">
                                                            <label class="radio-inline col-md-3" align="right"><form:radiobutton path="thaiWriting" value="1"/>Good</label>
                                                            <label class="radio-inline col-md-3" align="right"><form:radiobutton path="thaiWriting" value="2"/>Fair</label>
                                                            <label class="radio-inline col-md-3" align="right"><form:radiobutton path="thaiWriting" value="3"/>Poor</label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row col-md-offset-2">
                                                <div class="form-group col-md-10 underline">
                                                    <label for="thaiReading" class="col-md-2 control-label" align="right">Reading</label>
                                                    <div class="col-md-10">
                                                        <div class="col-md-12">
                                                            <label class="radio-inline col-md-3" align="right"><form:radiobutton path="thaiReading" value="1"/>Good</label>
                                                            <label class="radio-inline col-md-3" align="right"><form:radiobutton path="thaiReading" value="2"/>Fair</label>
                                                            <label class="radio-inline col-md-3" align="right"><form:radiobutton path="thaiReading" value="3"/>Poor</label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div>
                                            <div class="row col-md-offset-1">
                                                <div class="form-group col-md-4" align="right">
                                                    <label for="englishLanguage" class="col-md-6"><u>English</u></label>
                                                </div>
                                            </div>
                                            <div class="row col-md-offset-2">
                                                <div class="form-group col-md-10 underline">
                                                    <label for="englishSpeaking" class="col-md-2 control-label" align="right">Speaking</label>
                                                    <div class="col-md-10">
                                                        <div class="col-md-12">
                                                            <label class="radio-inline col-md-3" align="right"><form:radiobutton path="englishSpeaking" value="1"/>Good</label>
                                                            <label class="radio-inline col-md-3" align="right"><form:radiobutton path="englishSpeaking" value="2"/>Fair</label>
                                                            <label class="radio-inline col-md-3" align="right"><form:radiobutton path="englishSpeaking" value="3"/>Poor</label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row col-md-offset-2">
                                                <div class="form-group col-md-10 underline">
                                                    <label for="englishWriting" class="col-md-2 control-label" align="right">Writing</label>
                                                    <div class="col-md-10">
                                                        <div class="col-md-12">
                                                            <label class="radio-inline col-md-3" align="right"><form:radiobutton path="englishWriting" value="1"/>Good</label>
                                                            <label class="radio-inline col-md-3" align="right"><form:radiobutton path="englishWriting" value="2"/>Fair</label>
                                                            <label class="radio-inline col-md-3" align="right"><form:radiobutton path="englishWriting" value="3"/>Poor</label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row col-md-offset-2">
                                                <div class="form-group col-md-10 underline">
                                                    <label for="englishReading" class="col-md-2 control-label" align="right">Reading</label>
                                                    <div class="col-md-10">
                                                        <div class="col-md-12">
                                                            <label class="radio-inline col-md-3" align="right"><form:radiobutton path="englishReading" value="1"/>Good</label>
                                                            <label class="radio-inline col-md-3" align="right"><form:radiobutton path="englishReading" value="2"/>Fair</label>
                                                            <label class="radio-inline col-md-3" align="right"><form:radiobutton path="englishReading" value="3"/>Poor</label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <c:set var="count" value="0" scope="page"></c:set>
                                        <c:forEach var="otherLanguage" items="${languageItem.language.otherLanguage}">
                                            <c:if test="${otherLanguage.language != null}">
                                                <div id="languageClone${count}">
                                                    <div class="row col-md-offset-1">
                                                        <div class="form-group col-md-7" style="margin-left: 55px">
                                                            <label for="language" class="col-md-3">
                                                                <u><form:input type="text" class="form-control" path="otherLanguage[${count}].language" name="otherLanguage[${count}].language" value="" readonly="true" style="text-align:center"/></u>
                                                            </label>
                                                        </div>
                                                        <div class="form-group col-md-3" style="margin-left: 130px">
                                                            <a href="<c:url value="/"/>main/language/deleteOtherLanguage/${languageItem.id}&${otherLanguage.language}" class="btn btn-danger col-md-3">ลบ</a>
                                                        </div>
                                                    </div>
                                                    <div class="row col-md-offset-2">
                                                        <div class="form-group col-md-10 underline">
                                                            <label for="${otherLanguage.language}Speaking" class="col-md-2 control-label" align="right">Speaking</label>
                                                            <div class="col-md-10">
                                                                <div class="col-md-12">
                                                                    <label class="radio-inline col-md-3" align="right"><form:radiobutton path="otherLanguage[${count}].speaking" value="1"/>Good</label>
                                                                    <label class="radio-inline col-md-3" align="right"><form:radiobutton path="otherLanguage[${count}].speaking" value="2"/>Fair</label>
                                                                    <label class="radio-inline col-md-3" align="right"><form:radiobutton path="otherLanguage[${count}].speaking" value="3"/>Poor</label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row col-md-offset-2">
                                                        <div class="form-group col-md-10 underline">
                                                            <label for="${otherLanguage.language}Writing" class="col-md-2 control-label" align="right">Writing</label>
                                                            <div class="col-md-10">
                                                                <div class="col-md-12">
                                                                    <label class="radio-inline col-md-3" align="right"><form:radiobutton path="otherLanguage[${count}].writing" value="1"/>Good</label>
                                                                    <label class="radio-inline col-md-3" align="right"><form:radiobutton path="otherLanguage[${count}].writing" value="2"/>Fair</label>
                                                                    <label class="radio-inline col-md-3" align="right"><form:radiobutton path="otherLanguage[${count}].writing" value="3"/>Poor</label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row col-md-offset-2">
                                                        <div class="form-group col-md-10 underline">
                                                            <label for="${otherLanguage.language}Reading" class="col-md-2 control-label" align="right">Reading</label>
                                                            <div class="col-md-10">
                                                                <div class="col-md-12">
                                                                    <label class="radio-inline col-md-3" align="right"><form:radiobutton path="otherLanguage[${count}].reading" value="1"/>Good</label>
                                                                    <label class="radio-inline col-md-3" align="right"><form:radiobutton path="otherLanguage[${count}].reading" value="2"/>Fair</label>
                                                                    <label class="radio-inline col-md-3" align="right"><form:radiobutton path="otherLanguage[${count}].reading" value="3"/>Poor</label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <c:set var="count" value="${count+1}" scope="page"></c:set>
                                            </c:if>
                                        </c:forEach>
                                    </div>
                                    <br><br>
                                    <div class="row col-md-offset-1">
                                        <label class="col-md-4"></label>
                                        <div class="col-md-6">
                                            <input type="submit" value="Save" class="btn btn-success">
                                            <input type="reset" value="Cancel" class="btn btn-group btn-danger">
                                        </div>
                                    </div>
                                </form:form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>        
        <script type="text/javascript">
            var i = ${sizeOtherLanguage} - 1;
            var original = document.getElementById('languageClone');

            function duplicate() {
                var clone = original.cloneNode(true);
                clone.id = "languageClone" + ++i;
                original.parentNode.appendChild(clone);
                changeDataInDiv();
                checkedOriginal();
            }

            function changeDataInDiv() {
                $("#languageClone" + i).find("#languageName").empty().append("<div class=\"form-group col-md-7\" style=\"margin-left: 55px\"><label for=\"language\" class=\"col-md-3\"><u><input type=\"text\" class=\"form-control\" id=\"otherLanguage[" + i + "].language\" name=\"otherLanguage[" + i + "].language\" value=\"\" required=\"true\"/></u></label></div>");
                $("#languageClone" + i).find("#languageName").append("<div class=\"form-group col-md-3\" style=\"margin-left: 130px\"><button type=\"button\" class=\"btn btn-danger col-md-3\" onclick=\"deleteLanguage()\">ลบ</button></div>");
                $("#languageClone" + i).find("#thaiSpeaking1").attr({id: "otherLanguage[" + i + "].speaking1", name: "otherLanguage[" + i + "].speaking", checked: false});
                $("#languageClone" + i).find("#thaiSpeaking2").attr({id: "otherLanguage[" + i + "].speaking2", name: "otherLanguage[" + i + "].speaking", checked: true});
                $("#languageClone" + i).find("#thaiSpeaking3").attr({id: "otherLanguage[" + i + "].speaking3", name: "otherLanguage[" + i + "].speaking", checked: false});

                $("#languageClone" + i).find("#thaiWriting1").attr({id: "otherLanguage[" + i + "].writing1", name: "otherLanguage[" + i + "].writing", checked: false});
                $("#languageClone" + i).find("#thaiWriting2").attr({id: "otherLanguage[" + i + "].writing2", name: "otherLanguage[" + i + "].writing", checked: true});
                $("#languageClone" + i).find("#thaiWriting3").attr({id: "otherLanguage[" + i + "].writing3", name: "otherLanguage[" + i + "].writing", checked: false});

                $("#languageClone" + i).find("#thaiReading1").attr({id: "otherLanguage[" + i + "].reading1", name: "otherLanguage[" + i + "].reading", checked: false});
                $("#languageClone" + i).find("#thaiReading2").attr({id: "otherLanguage[" + i + "].reading2", name: "otherLanguage[" + i + "].reading", checked: true});
                $("#languageClone" + i).find("#thaiReading3").attr({id: "otherLanguage[" + i + "].reading3", name: "otherLanguage[" + i + "].reading", checked: false});
            }

            function checkedOriginal() {
                if (${languageItem.language.thaiSpeaking == 1}) {
                    $("#languageClone").find("#thaiSpeaking1").prop('checked', 'checked');
                }
                if (${languageItem.language.thaiSpeaking == 2}) {
                    $("#languageClone").find("#thaiSpeaking2").prop('checked', 'checked');
                }
                if (${languageItem.language.thaiSpeaking == 3}) {
                    $("#languageClone").find("#thaiSpeaking3").prop('checked', 'checked');
                }

                if (${languageItem.language.thaiWriting == 1}) {
                    $("#languageClone").find("#thaiWriting1").prop('checked', 'checked');
                }
                if (${languageItem.language.thaiWriting == 2}) {
                    $("#languageClone").find("#thaiWriting2").prop('checked', 'checked');
                }
                if (${languageItem.language.thaiWriting == 3}) {
                    $("#languageClone").find("#thaiWriting3").prop('checked', 'checked');
                }

                if (${languageItem.language.thaiReading == 1}) {
                    $("#languageClone").find("#thaiReading1").prop('checked', 'checked');
                }
                if (${languageItem.language.thaiReading == 2}) {
                    $("#languageClone").find("#thaiReading2").prop('checked', 'checked');
                }
                if (${languageItem.language.thaiReading == 3}) {
                    $("#languageClone").find("#thaiReading3").prop('checked', 'checked');
                }
            }


            function deleteLanguage() {
                $("#languageClone" + i + "").remove();
                i--;
            }
        </script>
    </body>
</html>
