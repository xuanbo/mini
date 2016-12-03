<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#sidebar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#"><span>Mini</span></a>
            <ul class="user-menu">
                <li class="dropdown pull-right">
                    <c:if test="${pageContext.request.userPrincipal.name != null}">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            欢迎 : ${pageContext.request.userPrincipal.name}
                            <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="/">Action</a></li>
                            <li><a href="#">Another action</a></li>
                            <li><a href="#">Something else here</a></li>
                            <li class="divider"></li>
                            <li><a href="/logout">退出</a></li>
                        </ul>
                    </c:if>
                    <c:if test="${pageContext.request.userPrincipal.name == null}">
                        <a href="<c:url value="/login" />" class="dropdown-toggle" data-toggle="dropdown">
                            欢迎 : 游客
                            <span class="caret"></span>
                        </a>
                    </c:if>
                </li>
            </ul>
        </div>
    </div><!-- /.container-fluid -->
</nav>

