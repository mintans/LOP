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
        <style>
            div.underline {
                border-bottom: 2px solid gray;
            }
        </style>
        <title>Language view</title>
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
                        <span class="breadcrumb-item active">language-ability</span>
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
                                <h4 class="panel-title">Language Ability</h4>
                            </div>
                            <div class="col-md-10" align="right">
                                <a href="<c:url value="/"/>main/language/editForm/${profileid}" class="btn btn-sm btn-warning">Edit</a>
                            </div>
                        </div>
                        <div class="panel-body">
                            <c:forEach var="languageItem" items="${profileList}">
                                <c:if test="${profileid == languageItem.id}">
                                    <div class="row">
                                        <label>

                                        </label>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <label>รหัสพนักงาน : ${languageItem.id}   
                                            <c:if test="${languageItem.title == 1}">นาย</c:if>
                                            <c:if test="${languageItem.title == 2}">นาง</c:if>
                                            <c:if test="${languageItem.title == 3}">นางสาว</c:if>
                                            ${languageItem.firstName}   ${languageItem.lastName}</label>
                                    </div>
                                    <div class="row">
                                        <label>

                                        </label>
                                    </div>
                                    <div class="row" id="languageGroup">
                                        <div>
                                            <div class="row col-md-offset-1">
                                                <div class="form-group col-md-4" align="right">
                                                    <label for="thaiLanguage" class="col-md-6"><u>Thai</u></label>
                                                </div>
                                            </div>
                                            <div class="row col-md-offset-2">
                                                <div class="form-group col-md-10 underline">
                                                    <label for="thaiSpeaking" class="col-md-2 control-label" align="right">Speaking</label>
                                                    <div class="col-md-10">
                                                        <c:if test="${languageItem.language.thaiSpeaking == 1}">
                                                            <div class="col-md-12">
                                                                <label class="radio-inline col-md-3" align="right"><input checked type="radio" name="thaiSpeaking" disabled="disabled">Good</label>
                                                                <label class="radio-inline col-md-3" align="right"><input type="radio" name="thaiSpeaking" disabled="disabled">Fair</label>
                                                                <label class="radio-inline col-md-3" align="right"><input type="radio" name="thaiSpeaking" disabled="disabled">Poor</label>
                                                            </div>
                                                        </c:if>
                                                        <c:if test="${languageItem.language.thaiSpeaking == 2}">
                                                            <div class="col-md-12">
                                                                <label class="radio-inline col-md-3" align="right"><input type="radio" name="thaiSpeaking" disabled="disabled">Good</label>
                                                                <label class="radio-inline col-md-3" align="right"><input checked type="radio" name="thaiSpeaking" disabled="disabled">Fair</label>
                                                                <label class="radio-inline col-md-3" align="right"><input type="radio" name="thaiSpeaking" disabled="disabled">Poor</label>
                                                            </div>
                                                        </c:if>
                                                        <c:if test="${languageItem.language.thaiSpeaking == 3}">
                                                            <div class="col-md-12">
                                                                <label class="radio-inline col-md-3" align="right"><input type="radio" name="thaiSpeaking" disabled="disabled">Good</label>
                                                                <label class="radio-inline col-md-3" align="right"><input type="radio" name="thaiSpeaking" disabled="disabled">Fair</label>
                                                                <label class="radio-inline col-md-3" align="right"><input checked type="radio" name="thaiSpeaking" disabled="disabled">Poor</label>
                                                            </div>
                                                        </c:if>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row col-md-offset-2">
                                                <div class="form-group col-md-10 underline">
                                                    <label for="thaiWriting" class="col-md-2 control-label" align="right">Writing</label>
                                                    <div class="col-md-10">
                                                        <c:if test="${languageItem.language.thaiWriting == 1}">
                                                            <div class="col-md-12">
                                                                <label class="radio-inline col-md-3" align="right"><input checked type="radio" name="thaiWriting" disabled="disabled">Good</label>
                                                                <label class="radio-inline col-md-3" align="right"><input type="radio" name="thaiWriting" disabled="disabled">Fair</label>
                                                                <label class="radio-inline col-md-3" align="right"><input type="radio" name="thaiWriting" disabled="disabled">Poor</label>
                                                            </div>
                                                        </c:if>
                                                        <c:if test="${languageItem.language.thaiWriting == 2}">
                                                            <div class="col-md-12">
                                                                <label class="radio-inline col-md-3" align="right"><input type="radio" name="thaiWriting" disabled="disabled">Good</label>
                                                                <label class="radio-inline col-md-3" align="right"><input checked type="radio" name="thaiWriting" disabled="disabled">Fair</label>
                                                                <label class="radio-inline col-md-3" align="right"><input type="radio" name="thaiWriting" disabled="disabled">Poor</label>
                                                            </div>
                                                        </c:if>
                                                        <c:if test="${languageItem.language.thaiWriting == 3}">
                                                            <div class="col-md-12">
                                                                <label class="radio-inline col-md-3" align="right"><input type="radio" name="thaiWriting" disabled="disabled">Good</label>
                                                                <label class="radio-inline col-md-3" align="right"><input type="radio" name="thaiWriting" disabled="disabled">Fair</label>
                                                                <label class="radio-inline col-md-3" align="right"><input checked type="radio" name="thaiWriting" disabled="disabled">Poor</label>
                                                            </div>
                                                        </c:if>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row col-md-offset-2">
                                                <div class="form-group col-md-10 underline">
                                                    <label for="thaiReading" class="col-md-2 control-label" align="right">Reading</label>
                                                    <div class="col-md-10">
                                                        <c:if test="${languageItem.language.thaiReading == 1}">
                                                            <div class="col-md-12">
                                                                <label class="radio-inline col-md-3" align="right"><input checked type="radio" name="thaiReading" disabled="disabled">Good</label>
                                                                <label class="radio-inline col-md-3" align="right"><input type="radio" name="thaiReading" disabled="disabled">Fair</label>
                                                                <label class="radio-inline col-md-3" align="right"><input type="radio" name="thaiReading" disabled="disabled">Poor</label>
                                                            </div>
                                                        </c:if>
                                                        <c:if test="${languageItem.language.thaiReading == 2}">
                                                            <div class="col-md-12">
                                                                <label class="radio-inline col-md-3" align="right"><input type="radio" name="thaiReading" disabled="disabled">Good</label>
                                                                <label class="radio-inline col-md-3" align="right"><input checked type="radio" name="thaiReading" disabled="disabled">Fair</label>
                                                                <label class="radio-inline col-md-3" align="right"><input type="radio" name="thaiReading" disabled="disabled">Poor</label>
                                                            </div>
                                                        </c:if>
                                                        <c:if test="${languageItem.language.thaiReading == 3}">
                                                            <div class="col-md-12">
                                                                <label class="radio-inline col-md-3" align="right"><input type="radio" name="thaiReading" disabled="disabled">Good</label>
                                                                <label class="radio-inline col-md-3" align="right"><input type="radio" name="thaiReading" disabled="disabled">Fair</label>
                                                                <label class="radio-inline col-md-3" align="right"><input checked type="radio" name="thaiReading" disabled="disabled">Poor</label>
                                                            </div>
                                                        </c:if>
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
                                                        <c:if test="${languageItem.language.englishSpeaking == 1}">
                                                            <div class="col-md-12">
                                                                <label class="radio-inline col-md-3" align="right"><input checked type="radio" name="englishSpeaking" disabled="disabled">Good</label>
                                                                <label class="radio-inline col-md-3" align="right"><input type="radio" name="englishSpeaking" disabled="disabled">Fair</label>
                                                                <label class="radio-inline col-md-3" align="right"><input type="radio" name="englishSpeaking" disabled="disabled">Poor</label>
                                                            </div>
                                                        </c:if>
                                                        <c:if test="${languageItem.language.englishSpeaking == 2}">
                                                            <div class="col-md-12">
                                                                <label class="radio-inline col-md-3" align="right"><input type="radio" name="englishSpeaking" disabled="disabled">Good</label>
                                                                <label class="radio-inline col-md-3" align="right"><input checked type="radio" name="englishSpeaking" disabled="disabled">Fair</label>
                                                                <label class="radio-inline col-md-3" align="right"><input type="radio" name="englishSpeaking" disabled="disabled">Poor</label>
                                                            </div>
                                                        </c:if>
                                                        <c:if test="${languageItem.language.englishSpeaking == 3}">
                                                            <div class="col-md-12">
                                                                <label class="radio-inline col-md-3" align="right"><input type="radio" name="englishSpeaking" disabled="disabled">Good</label>
                                                                <label class="radio-inline col-md-3" align="right"><input type="radio" name="englishSpeaking" disabled="disabled">Fair</label>
                                                                <label class="radio-inline col-md-3" align="right"><input checked type="radio" name="englishSpeaking" disabled="disabled">Poor</label>
                                                            </div>
                                                        </c:if>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row col-md-offset-2">
                                                <div class="form-group col-md-10 underline">
                                                    <label for="englishWriting" class="col-md-2 control-label" align="right">Writing</label>
                                                    <div class="col-md-10">
                                                        <c:if test="${languageItem.language.englishWriting == 1}">
                                                            <div class="col-md-12">
                                                                <label class="radio-inline col-md-3" align="right"><input checked type="radio" name="englishWriting" disabled="disabled">Good</label>
                                                                <label class="radio-inline col-md-3" align="right"><input type="radio" name="englishWriting" disabled="disabled">Fair</label>
                                                                <label class="radio-inline col-md-3" align="right"><input type="radio" name="englishWriting" disabled="disabled">Poor</label>
                                                            </div>
                                                        </c:if>
                                                        <c:if test="${languageItem.language.englishWriting == 2}">
                                                            <div class="col-md-12">
                                                                <label class="radio-inline col-md-3" align="right"><input type="radio" name="englishWriting" disabled="disabled">Good</label>
                                                                <label class="radio-inline col-md-3" align="right"><input checked type="radio" name="englishWriting" disabled="disabled">Fair</label>
                                                                <label class="radio-inline col-md-3" align="right"><input type="radio" name="englishWriting" disabled="disabled">Poor</label>
                                                            </div>
                                                        </c:if>
                                                        <c:if test="${languageItem.language.englishWriting == 3}">
                                                            <div class="col-md-12">
                                                                <label class="radio-inline col-md-3" align="right"><input type="radio" name="englishWriting" disabled="disabled">Good</label>
                                                                <label class="radio-inline col-md-3" align="right"><input type="radio" name="englishWriting" disabled="disabled">Fair</label>
                                                                <label class="radio-inline col-md-3" align="right"><input checked type="radio" name="englishWriting" disabled="disabled">Poor</label>
                                                            </div>
                                                        </c:if>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row col-md-offset-2">
                                                <div class="form-group col-md-10 underline">
                                                    <label for="englishReading" class="col-md-2 control-label" align="right">Reading</label>
                                                    <div class="col-md-10">
                                                        <c:if test="${languageItem.language.englishReading == 1}">
                                                            <div class="col-md-12">
                                                                <label class="radio-inline col-md-3" align="right"><input checked type="radio" name="englishReading" disabled="disabled">Good</label>
                                                                <label class="radio-inline col-md-3" align="right"><input type="radio" name="englishReading" disabled="disabled">Fair</label>
                                                                <label class="radio-inline col-md-3" align="right"><input type="radio" name="englishReading" disabled="disabled">Poor</label>
                                                            </div>
                                                        </c:if>
                                                        <c:if test="${languageItem.language.englishReading == 2}">
                                                            <div class="col-md-12">
                                                                <label class="radio-inline col-md-3" align="right"><input type="radio" name="englishReading" disabled="disabled">Good</label>
                                                                <label class="radio-inline col-md-3" align="right"><input checked type="radio" name="englishReading" disabled="disabled">Fair</label>
                                                                <label class="radio-inline col-md-3" align="right"><input type="radio" name="englishReading" disabled="disabled">Poor</label>
                                                            </div>
                                                        </c:if>
                                                        <c:if test="${languageItem.language.englishReading == 3}">
                                                            <div class="col-md-12">
                                                                <label class="radio-inline col-md-3" align="right"><input type="radio" name="englishReading" disabled="disabled">Good</label>
                                                                <label class="radio-inline col-md-3" align="right"><input type="radio" name="englishReading" disabled="disabled">Fair</label>
                                                                <label class="radio-inline col-md-3" align="right"><input checked type="radio" name="englishReading" disabled="disabled">Poor</label>
                                                            </div>
                                                        </c:if>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>


                                        <c:set var="count" value="0" scope="page"></c:set>
                                        <c:forEach var="otherLanguage" items="${languageItem.language.otherLanguage}">
                                            <c:if test="${otherLanguage.language != null}">
                                                <div>
                                                    <div class="row col-md-offset-1">
                                                        <div class="form-group col-md-4" align="right">
                                                            <label for="${otherLanguage.language}Language" class="col-md-6"><u>${otherLanguage.language}</u></label>
                                                        </div>
                                                    </div>
                                                    <div class="row col-md-offset-2">
                                                        <div class="form-group col-md-10 underline">
                                                            <label for="${otherLanguage.language}Speaking" class="col-md-2 control-label" align="right">Speaking</label>
                                                            <div class="col-md-10">
                                                                <c:if test="${otherLanguage.speaking == 1}">
                                                                    <div class="col-md-12">
                                                                        <label class="radio-inline col-md-3" align="right"><input checked type="radio" name="otherLanguage[${count}].speaking" disabled="disabled">Good</label>
                                                                        <label class="radio-inline col-md-3" align="right"><input type="radio" name="otherLanguage[${count}].speaking" disabled="disabled">Fair</label>
                                                                        <label class="radio-inline col-md-3" align="right"><input type="radio" name="otherLanguage[${count}].speaking" disabled="disabled">Poor</label>
                                                                    </div>
                                                                </c:if>
                                                                <c:if test="${otherLanguage.speaking == 2}">
                                                                    <div class="col-md-12">
                                                                        <label class="radio-inline col-md-3" align="right"><input type="radio" name="otherLanguage[${count}].speaking" disabled="disabled">Good</label>
                                                                        <label class="radio-inline col-md-3" align="right"><input checked type="radio" name="otherLanguage[${count}].speaking" disabled="disabled">Fair</label>
                                                                        <label class="radio-inline col-md-3" align="right"><input type="radio" name="otherLanguage[${count}].speaking" disabled="disabled">Poor</label>
                                                                    </div>
                                                                </c:if>
                                                                <c:if test="${otherLanguage.speaking == 3}">
                                                                    <div class="col-md-12">
                                                                        <label class="radio-inline col-md-3" align="right"><input type="radio" name="otherLanguage[${count}].speaking" disabled="disabled">Good</label>
                                                                        <label class="radio-inline col-md-3" align="right"><input type="radio" name="otherLanguage[${count}].speaking" disabled="disabled">Fair</label>
                                                                        <label class="radio-inline col-md-3" align="right"><input checked type="radio" name="otherLanguage[${count}].speaking" disabled="disabled">Poor</label>
                                                                    </div>
                                                                </c:if>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row col-md-offset-2">
                                                        <div class="form-group col-md-10 underline">
                                                            <label for="japanWriting" class="col-md-2 control-label" align="right">Writing</label>
                                                            <div class="col-md-10">
                                                                <c:if test="${otherLanguage.writing == 1}">
                                                                    <div class="col-md-12">
                                                                        <label class="radio-inline col-md-3" align="right"><input checked type="radio" name="otherLanguage[${count}].writing" disabled="disabled">Good</label>
                                                                        <label class="radio-inline col-md-3" align="right"><input type="radio" name="otherLanguage[${count}].writing" disabled="disabled">Fair</label>
                                                                        <label class="radio-inline col-md-3" align="right"><input type="radio" name="otherLanguage[${count}].writing" disabled="disabled">Poor</label>
                                                                    </div>
                                                                </c:if>
                                                                <c:if test="${otherLanguage.writing == 2}">
                                                                    <div class="col-md-12">
                                                                        <label class="radio-inline col-md-3" align="right"><input type="radio" name="otherLanguage[${count}].writing" disabled="disabled">Good</label>
                                                                        <label class="radio-inline col-md-3" align="right"><input checked type="radio" name="otherLanguage[${count}].writing" disabled="disabled">Fair</label>
                                                                        <label class="radio-inline col-md-3" align="right"><input type="radio" name="otherLanguage[${count}].writing" disabled="disabled">Poor</label>
                                                                    </div>
                                                                </c:if>
                                                                <c:if test="${otherLanguage.writing == 3}">
                                                                    <div class="col-md-12">
                                                                        <label class="radio-inline col-md-3" align="right"><input type="radio" name="otherLanguage[${count}].writing" disabled="disabled">Good</label>
                                                                        <label class="radio-inline col-md-3" align="right"><input type="radio" name="otherLanguage[${count}].writing" disabled="disabled">Fair</label>
                                                                        <label class="radio-inline col-md-3" align="right"><input checked type="radio" name="otherLanguage[${count}].writing" disabled="disabled">Poor</label>
                                                                    </div>
                                                                </c:if>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row col-md-offset-2">
                                                        <div class="form-group col-md-10 underline">
                                                            <label for="japanReading" class="col-md-2 control-label" align="right">Reading</label>
                                                            <div class="col-md-10">
                                                                <c:if test="${otherLanguage.reading == 1}">
                                                                    <div class="col-md-12">
                                                                        <label class="radio-inline col-md-3" align="right"><input checked type="radio" name="otherLanguage[${count}].reading" disabled="disabled">Good</label>
                                                                        <label class="radio-inline col-md-3" align="right"><input type="radio" name="otherLanguage[${count}].reading" disabled="disabled">Fair</label>
                                                                        <label class="radio-inline col-md-3" align="right"><input type="radio" name="otherLanguage[${count}].reading" disabled="disabled">Poor</label>
                                                                    </div>
                                                                </c:if>
                                                                <c:if test="${otherLanguage.reading == 2}">
                                                                    <div class="col-md-12">
                                                                        <label class="radio-inline col-md-3" align="right"><input type="radio" name="otherLanguage[${count}].reading" disabled="disabled">Good</label>
                                                                        <label class="radio-inline col-md-3" align="right"><input checked type="radio" name="otherLanguage[${count}].reading" disabled="disabled">Fair</label>
                                                                        <label class="radio-inline col-md-3" align="right"><input type="radio" name="otherLanguage[${count}].reading" disabled="disabled">Poor</label>
                                                                    </div>
                                                                </c:if>
                                                                <c:if test="${otherLanguage.reading == 3}">
                                                                    <div class="col-md-12">
                                                                        <label class="radio-inline col-md-3" align="right"><input type="radio" name="otherLanguage[${count}].reading" disabled="disabled">Good</label>
                                                                        <label class="radio-inline col-md-3" align="right"><input type="radio" name="otherLanguage[${count}].reading" disabled="disabled">Fair</label>
                                                                        <label class="radio-inline col-md-3" align="right"><input checked type="radio" name="otherLanguage[${count}].reading" disabled="disabled">Poor</label>
                                                                    </div>
                                                                </c:if>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <c:set var="count" value="${count+1}" scope="page"></c:set>
                                            </c:if>
                                        </c:forEach>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
    </body>
</html>
