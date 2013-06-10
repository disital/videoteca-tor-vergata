<%-- 
Document   : myMovie
Created on : 15-mag-2013, 21.16.43
Author     : lorenzo
--%>


<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>MovieCatalog</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="A new way of catalog">
        <meta name="author" content="disital@gmail.com - css by bootstrap">

        <!-- Le styles -->
        <link href="./resources/css/bootstrap.css" rel="stylesheet">
        <link href="./resources/css/custom.css" rel="stylesheet">
        <link href="./resources/css/bootstrap-responsive.css" rel="stylesheet">
        <style type="text/css">
            body {
                padding-top: 60px;
                padding-bottom: 40px;
            }

        </style>

        <!-- Fav and touch icons -->
        <!--        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../assets/ico/apple-touch-icon-144-precomposed.png">
                <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../assets/ico/apple-touch-icon-114-precomposed.png">
                <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../assets/ico/apple-touch-icon-72-precomposed.png">
                <link rel="apple-touch-icon-precomposed" href="../assets/ico/apple-touch-icon-57-precomposed.png">
                <link rel="shortcut icon" href="../assets/ico/favicon.png">-->
    </head>

    <body>

        <div class="navbar navbar-inverse navbar-fixed-top">
            <div class="navbar-inner">
                <div class="container">
                    <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="brand" href="#">MovieCatalog</a>
                    <div class="nav-collapse collapse ">
                        <ul class="nav">
                            <li class="active"><a href="index.htm">Home</a></li>
                            <li><a href="#about">About</a></li>
                            <li><a data-toggle="modal" href="#webpageDialog">Contact</a></li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" >Manage <b class="caret"></b></a>
                                <ul class="dropdown-menu" >
                                    <li><a data-toggle="modal" href="#addMovieModal">New Movie</a></li>
                                    <li><a href="myMovie.htm">MyMovies</a></li>
                                    <li class="divider"></li>
                                    <li class="nav-header">AskFor</li>
                                    <li><a href="#">Ask for Movie</a></li>
                                    <li><a href="#">Suggest a Movie</a></li>
                                </ul>
                            </li>
                            <form action="search.htm" class="navbar-search pull-left">
                                <input type="text" name="word" class="search-query" placeholder="Search">
                            </form>
                            <li><a></a></li>
                            <li><a></a></li>
                            <li><a></a></li>
                            <li><a></a></li>
                            <li><a></a></li>
                            <li><a></a></li>
                            <li><a></a></li>
                            <li><a></a></li>
                            <li><a></a></li>
                            <li><a></a></li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle pull-right" data-toggle="dropdown"><%= request.getSession().getAttribute("username")%> <b class="caret"></b></a>
                                <ul class="dropdown-menu" >
                                    <li class="divider"></li>
                                    <li class="nav-header">Account Settings</li>
                                    <li><a href="#">Profile</a></li>
                                    <li><a href="logout.htm">Logout</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div><!--/.nav-collapse -->
                </div> 
            </div>
        </div>

        <!-- Creo per ogni film presente un riquadro DIV SPAN4 , visualizzo solo locandina  -->
        <jsp:useBean id="resultList" scope="session" type="java.util.List"></jsp:useBean>
            <div class="container hero-unit">
            <%= request.getAttribute("message")%>
            <div class="row">
                <c:forEach items="${resultList}" var="result" begin="0" end="10">
                    <div class="span3">
                        <h2><c:out value="${result.titolo}"></c:out></h2>
                        <p><c:out value="${result.trama}"></c:out></p>
                        <p><img src="./resources/img/${result.titolo}.jpg" alt=""></p>
                        <p><a class="btn" href="rent/${result.idfilm}.htm">Noleggia &raquo;</a></p>
                        <p><a class="btn" data-toggle="modal" data-target="#MovieDetailModal" >View details &raquo;</a></p>
                        </div>
                </c:forEach>
            </div>
        </div>

        <div class="divWebpageDialog">
            <div id="webpageDialog" class="modal hide fade">
                <div class="modal-header">
                    <a href="#" class="close" data-dismiss="modal">&times;</a>
                    <h3 id="prompt">Presentation preview</h3>
                </div>
                <div class="modal-body">
                    <iframe src="http://localhost/VideotecaPHP/index.php" frameborder="0"></iframe>
                </div>
                <div class="modal-footer">
                    <a href="#" class="btn btn-primary" onclick="okWebpageDialog()">OK</a>
                </div>
            </div>
        </div>
        <div id="MovieDetailModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="ModalLabel" aria-hidden="true">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
                <h3 id="ModalLabel">Movie Detail</h3>
            </div>
            <div class="modal-body container">

                <div class="row">


                </div>
            </div>
            <div class="modal-footer">
                <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
            </div>
        </div>

        <div id="addMovieModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="ModalLabel" aria-hidden="true">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
                <h3 id="ModalLabel">Add Movie</h3>
            </div>
            <div class="modal-body container">
                <form action="addMovie.htm" method="post" styleClass="form-horizontal">

                    <div class="control-group">
                        <div class="controls">
                            <input type="text" name="titolo" styleClass="control-label"></html:text>
                        </div>
                    </div>
            </div>
            <div class="modal-footer">
                <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
                <input type="submit" value="Add" class="btn btn-primary"></html:submit>
            </div>
        </form>
    </div>
</body>
<!-- Le javascript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="./resources/js/jquery.js"></script>
<script src="./resources/js/bootstrap-transition.js"></script>
<script src="./resources/js/bootstrap-alert.js"></script>
<script src="./resources/js/bootstrap-modal.js"></script>
<script src="./resources/js/bootstrap-dropdown.js"></script>
<script src="./resources/js/bootstrap-scrollspy.js"></script>
<script src="./resources/js/bootstrap-tab.js"></script>
<script src="./resources/js/bootstrap-tooltip.js"></script>
<script src="./resources/js/bootstrap-popover.js"></script>
<script src="./resources/js/bootstrap-button.js"></script>
<script src="./resources/js/bootstrap-collapse.js"></script>
<script src="./resources/js/bootstrap-carousel.js"></script>
<script src="./resources/js/bootstrap-typeahead.js"></script>
<script src="./resources/js/contact.js"></script>    <!-- JS per la gestione dei miei contatti -->
<script src="./resources/js/html5shiv.js"></script>  <!-- Plugin per html5 -->


</html>
