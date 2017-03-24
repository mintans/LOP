<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<ul class="nav nav-pills nav-stacked">
    <c:forEach var="profileItem" items="${profileList}">
        <c:if test="${profileid == profileItem.id}">
            <li class="nav-main"><a href="<c:url value="/"/>main/information/view/${profileItem.id}">Information</a></li>
            <li class="nav-main"><a href="<c:url value="/"/>main/profile/viewTH/${profileItem.id}">Profile(Thai)</a></li>
            <li class="nav-main"><a href="<c:url value="/"/>main/profile/viewEN/${profileItem.id}">Profile(English)</a></li>
                <c:if test="${family != null}">
                <li class="nav-main"><a href="<c:url value="/"/>main/familyinfo/view/${profileItem.id}">Family</a></li>
                </c:if>
                <c:if test="${family == null}">
                <li class="nav-main"><a href="<c:url value="/"/>main/familyinfo/addForm/${profileItem.id}">Family</a></li>
                </c:if>
                <c:if test="${education != null}">
                <li class="nav-main"><a href="<c:url value="/"/>main/education/view/${profileItem.id}">Education</a></li>    
                </c:if>
                <c:if test="${education == null}">
                <li class="nav-main"><a href="<c:url value="/"/>main/education/educationForm/${profileItem.id}">Education</a></li>
                </c:if>
                <c:if test="${work != null}">
                <li class="nav-main"><a href="<c:url value="/"/>main/workexperience/view/${profileItem.id}">Work Experience</a></li>
                </c:if>
                <c:if test="${work == null}">
                <li class="nav-main"><a href="<c:url value="/"/>main/workexperience/addForm/${profileItem.id}">Work Experience</a></li>
                </c:if>
                <c:if test="${language != null}">
                <li class="nav-main"><a href="<c:url value="/"/>main/language/view/${profileItem.id}">Language Ability</a></li>
                </c:if>
                <c:if test="${language == null}">
                <li class="nav-main"><a href="<c:url value="/"/>main/language/languageForm/${profileItem.id}">Language Ability</a></li>
                </c:if>
                <c:if test="${special != null}">
                <li class="nav-main"><a href="<c:url value="/"/>main/specialability/view/${profileItem.id}">Special Ability</a></li>        
                </c:if>
                <c:if test="${special == null}">
                <li class="nav-main"><a href="<c:url value="/"/>main/specialability/addForm/${profileItem.id}">Special Ability</a></li>  
                </c:if>
            <li class="nav-main"><a href="<c:url value="/"/>main/salary_bonus/view/${profileItem.id}">Salary&Bonus</a></li>
            <li class="nav-main"><a href="<c:url value="/"/>main/profileBenefits/view/${profileItem.id}">Benefits</a></li>
            <li class="nav-main"><a href="<c:url value="/"/>main/admonition/view/${profileItem.id}">Admonition</a></li>
            <li class="nav-main"><a href="<c:url value="/"/>main/trainingrecord/view/${profileItem.id}">Training</a></li>
            <li class="nav-main"><a href="<c:url value="/"/>main/employment/view/${profileItem.id}">Employment</a></li>
            <li class="nav-main"><a href="<c:url value="/"/>main/transfer/view/${profileItem.id}">Transfer</a></li>
            <li class="nav-main"><a href="<c:url value="/"/>main/documentinfo/view/${profileItem.id}">Document</a></li>
            <li class="nav-main"><a href="<c:url value="/"/>main/history/view/${profileItem.id}">History</a></li>
                <c:if test="${userInfo.user.permission == 'ADMIN'}">
                <li class="btn-default"><a href="<c:url value="/"/>main/profile">back to profile list</a></li>
                </c:if>
            </c:if>
        </c:forEach>
        <c:if test="${formtype == 'add'}">
        <li class="nav-main disabled"><a>Information</a></li>
        <li class="nav-main"><a href="<c:url value="/"/>main/profile/addFormTH">Profile(Thai)</a></li>
        <li class="nav-main disabled"><a>Profile(English)</a></li>
        <li class="nav-main disabled"><a>Family</a></li>
        <li class="nav-main disabled"><a>Education</a></li>    
        <li class="nav-main disabled"><a>Work Experience</a></li>
        <li class="nav-main disabled"><a>Language Ability</a></li>
        <li class="nav-main disabled"><a>Special Ability</a></li>
        <li class="nav-main disabled"><a>Salary&Bonus</a></li>
        <li class="nav-main disabled"><a>Benefits</a></li>
        <li class="nav-main disabled"><a>Admonition</a></li>
        <li class="nav-main disabled"><a>Training</a></li>
        <li class="nav-main disabled"><a>Employment</a></li>
        <li class="nav-main disabled"><a>Transfer</a></li>
        <li class="nav-main disabled"><a>Document</a></li>
        <li class="nav-main disabled"><a>History</a></li>
            <c:if test="${userInfo.user.permission == 'ADMIN'}">
            <li class="btn-default"><a href="<c:url value="/"/>main/profile">back to profile list</a></li>
            </c:if>
        </c:if>
        <c:if test="${formtype == 'edit'}">
        <li class="nav-main"><a href="<c:url value="/"/>main/information/view/${id}">Information</a></li>
        <li class="nav-main"><a href="<c:url value="/"/>main/profile/editFormTH/${id}">Profile(Thai)</a></li>
        <li class="nav-main"><a href="<c:url value="/"/>main/profile/editFormEN/${id}">Profile(English)</a></li>
            <c:if test="${family == null}">
            <li class="nav-main"><a href="<c:url value="/"/>main/familyinfo/addForm/${id}">Family</a></li>
            </c:if>
            <c:if test="${family != null}">
            <li class="nav-main"><a href="<c:url value="/"/>main/familyinfo/editForm/${id}">Family</a></li>
            </c:if>
            <c:if test="${education == null}">
            <li class="nav-main"><a href="<c:url value="/"/>main/education/educationForm/${id}">Education</a></li>
            </c:if>
            <c:if test="${education != null}">
            <li class="nav-main"><a href="<c:url value="/"/>main/education/editForm/${id}">Education</a></li>
            </c:if>
            <c:if test="${work == null}">
            <li class="nav-main"><a href="<c:url value="/"/>main/workexperience/addForm/${id}">Work Experience</a></li>
            </c:if>
            <c:if test="${work != null}">
            <li class="nav-main"><a href="<c:url value="/"/>main/workexperience/editForm/${id}">Work Experience</a></li>
            </c:if>
            <c:if test="${language == null}">
            <li class="nav-main"><a href="<c:url value="/"/>main/language/languageForm/${id}">Language Ability</a></li>
            </c:if>
            <c:if test="${language != null}">
            <li class="nav-main"><a href="<c:url value="/"/>main/language/editForm/${id}">Language Ability</a></li>
            </c:if>
            <c:if test="${special == null}">
            <li class="nav-main"><a href="<c:url value="/"/>main/specialability/addForm/${id}">Special Ability</a></li>
            </c:if>
            <c:if test="${special != null}">
            <li class="nav-main"><a href="<c:url value="/"/>main/specialability/editForm/${id}">Special Ability</a></li>
            </c:if>
        <li class="nav-main"><a href="<c:url value="/"/>main/salary_bonus/view/${id}">Salary&Bonus</a></li>
        <li class="nav-main"><a href="<c:url value="/"/>main/profileBenefits/view/${id}">Benefits</a></li>
        <li class="nav-main"><a href="<c:url value="/"/>main/admonition/view/${id}">Admonition</a></li>
        <li class="nav-main"><a href="<c:url value="/"/>main/trainingrecord/view/${id}">Training</a></li>
        <li class="nav-main"><a href="<c:url value="/"/>main/employment/view/${id}">Employment</a></li>
        <li class="nav-main"><a href="<c:url value="/"/>main/transfer/view/${id}">Transfer</a></li>
        <li class="nav-main"><a href="<c:url value="/"/>main/documentinfo/view/${id}">Document</a></li>
        <li class="nav-main"><a href="<c:url value="/"/>main/history/view/${id}">History</a></li>
            <c:if test="${userInfo.user.permission == 'ADMIN'}">
            <li class="btn-default"><a href="<c:url value="/"/>main/profile">back to profile list</a></li>
            </c:if>

    </c:if>
</ul>
