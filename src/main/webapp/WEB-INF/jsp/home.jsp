<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">

    <script type="text/javascript">
        $(function() {
            $('[data-toggle="modal"]').click(function(e) {
                e.preventDefault();
                var href = $(this).attr('href');
                if (href.indexOf('#') == 0) {
                    $(href).modal('open');
                } else {
                    $.get(href, function(data) {
                        $('<div class="modal">' + data + '</div>').modal();
                    });
                }
            });
        });
    </script>

    <head>
        <meta charset="utf-8">
        <title>MovieCatalog</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="A new way of catalog">
        <meta name="author" content="disital@gmail.com - css by bootstrap">

        <!-- Le styles -->
        <link href="./resources/css/bootstrap.css" rel="stylesheet">
        <style type="text/css">
            body {
                padding-top: 60px;
                padding-bottom: 40px;
            }
        </style>
        <link href="./resources/css/bootstrap-responsive.css" rel="stylesheet">

        <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
          <script src="../assets/js/html5shiv.js"></script>
        <![endif]-->

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
                            <li><a href="#contact">Contact</a></li>
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

        <div class="container">

            <!-- Main showlet displaying info about -->
            <div class="hero-unit">
                <h1>MovieCatalog , a new idea of catalog!</h1>
                <p>This is a template for blablablablabla .</p>
                <p><a href="#" class="btn btn-primary btn-large">Learn more &raquo;</a></p>
            </div>

            <!-- Example row of columns -->
            <jsp:useBean id="homeMovie" scope="session" type="java.util.List"></jsp:useBean>
                <div class="row">
                <c:forEach items="${homeMovie}" var="movie" begin="0" end="10">
                    <div class="span4">
                        <h2><c:out value="${movie.titolo}"></c:out></h2>
                        <p><c:out value="${movie.trama}"></c:out></p>
                        <p><img src="./resources/img/${movie.titolo}.jpg" alt=""></p>
                        <p><a class="btn" href="rent/${movie.idfilm}.htm">Noleggia &raquo;</a></p>
                        <p><a class="btn" data-toggle="modal" href="MovieDetailModal/${movie.idfilm}">View details &raquo;</a></p>
                    </div>
                </c:forEach>
            </div>  

            <hr>

            <footer>
                <p>&copy; disital@gmail.com - 2013</p>
            </footer>

        </div> <!-- /container -->
        <div id="MovieDetailModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="ModalLabel" aria-hidden="true">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
                <h3 id="ModalLabel">Movie Detail</h3>
            </div>
            <div class="modal-body container">

                <div class="row">

                    <div class="span4">
                        <h2><c:out value="${movie.titolo}"></c:out></h2>
                        <p><c:out value="${movie.trama}"></c:out></p>
                        <p><c:out value="${movie.link}"></c:out></p>
                        <p><c:out value="${movie.genere}"></c:out></p>
                        <p><c:out value="${movie.rented}"></c:out></p>
                        <p><a class="btn" href="rent/${movie.idfilm}.htm">Noleggia &raquo;</a></p>
                    </div>

                </div>
            </div>
            <div class="modal-footer">
                <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
            </div>
        </form>
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

</body>
</html>
