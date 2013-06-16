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
        <!--        <link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.1/css/bootstrap-combined.no-icons.min.css" rel="stylesheet">
                <link href="//netdna.bootstrapcdn.com/font-awesome/3.1.1/css/font-awesome.css" rel="stylesheet">-->
        <link href="./resources/css/font-awesome/css/font-awesome.min.css" rel="stylesheet">
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

    <body class="titolo">

        <div class="navbar navbar-inverse navbar-fixed-top">
            <div class="navbar-inner">
                <div class="container">
                    <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="brand" href="index.htm">MovieCatalog</a>
                    <div class="nav-collapse collapse ">
                        <ul class="nav">
                            <li class="active"><a href="index.htm"><i class="icon-home icon-white" ></i> Home</a></li>
                            <li><a data-toggle="modal" href="#moreInfo"><i class="icon-bookmark icon-white" ></i>About</a></li>
                            <li><a data-toggle="modal" href="#webpageDialog"><i class="icon-envelope icon-white" ></i> Contact</a></li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="icon-wrench icon-white"></i> Manage <b class="caret"></b></a>
                                <ul class="dropdown-menu" >
                                    <li><a data-toggle="modal" href="#addMovieModal"><i class="icon-plus-sign" ></i> New Movie</a></li>
                                    <li><a href="myMovie.htm"><i class="icon-star-empty" ></i> MyMovies</a></li>
                                    <li class="divider"></li>
                                    <li class="nav-header">AskFor</li>
                                    <li><a href="#"><i class="icon-bullhorn" ></i> Ask for Movie</a></li>
                                    <li><a href="#"><i class="icon-thumbs-up" ></i> Suggest a Movie</a></li>
                                </ul>
                            </li>
                            <form action="search.htm" class="navbar-search pull-left"><i class="icon-search icon-white"></i>
                                <input type="text" name="word" class="search-query" placeholder="Search" >
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
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle pull-right" data-toggle="dropdown"><i class="icon-user icon-white"></i> <%= request.getSession().getAttribute("username")%> <b class="caret"></b></a>
                                <ul class="dropdown-menu" >
                                    <li class="divider"></li>
                                    <li class="nav-header">Account Settings</li>
                                    <li><a href="profile.htm"><i class="icon-user"></i> Profile</a></li>
                                    <li><a href="logout.htm"><i class="icon-off" ></i> Logout</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div><!--/.nav-collapse -->
                </div> 
            </div>
        </div>

        <div id="myCarousel" class="carousel slide">
            <div class="carousel-inner">
                <div class="item active">
                    <img src="./resources/img/1.jpg" alt="">
                    <div class="container">
                        <div class="carousel-caption">
                            <h1>MovieCatalog.</h1>
                            <p class="lead">MovieCatalog , a new way of catalog your movies! Keep your library always up to date and invite friends join this community to increase number of review and movie's details.</p>
                            <a class="btn btn-large btn-primary" data-toggle="modal" href="#moreInfo">More Info</a>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <img src="./resources/img/2.jpg" alt="">
                    <div class="container">
                        <div class="carousel-caption">
                            <h1>The Simpson.</h1>
                            <p class="lead">After Homer accidentally pollutes the town's water supply, Springfield is encased in a gigantic dome by the EPA and the Simpsons family are declared fugitives..</p>
                            <a class="btn btn-primary btn-small" href="rent/7.htm">Noleggia &raquo;</a>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <img src="./resources/img/3.jpg" alt="">
                    <div class="container">
                        <div class="carousel-caption">
                            <h1>Iron-Man.</h1>
                            <p class="lead">When wealthy industrialist Tony Stark is forced to build an armored suit after a life-threatening incident, he ultimately decides to use its technology to fight against evil..</p>
                            <a class="btn btn-large btn-primary" href="myMovie.htm">My Movies</a>
                        </div>
                    </div>
                </div>
            </div>
            <a class="left carousel-control" href="#myCarousel" data-slide="prev">&lsaquo;</a>
            <a class="right carousel-control" href="#myCarousel" data-slide="next">&rsaquo;</a>
        </div><!-- /.carousel -->
        <div class="container">
            <!-- Example row of columns -->
            <jsp:useBean id="homeMovie" scope="session" type="java.util.List"></jsp:useBean>
                <div class=\"row">
                <c:forEach items="${homeMovie}" varStatus="row" var="movie" begin="0" end="11">
                    <c:choose>
                        <c:when test="${row.count % 3 == 0}">
                        </div><div class=\"row">
                        </c:when>

                    </c:choose>
                    <div class="span4 hero-unit">
                        <h2><c:out value="${movie.titolo}"></c:out></h2>
                        <p><c:out value="${movie.trama}"></c:out></p>
                        <p><img class="img-polaroid" src="./resources/img/${movie.titolo}.jpg" alt=""></p>
                        <p><a class="btn btn-primary btn-small" data-loading-text="Loading..." data-toggle="button" href="rent/${movie.idfilm}.htm">Noleggia &raquo;</a></p>
                        <p><a class="btn btn-primary btn-large" data-toggle="modal" data-target="#MovieDetailModal" >View details &raquo;</a></p>
                    </div>
                </c:forEach>
            </div>  
        </div>
        <hr>

        <footer>
            <p>&copy; disital@gmail.com - 2013</p>
        </footer>


    </div>
    <!-- /container -->
    <div class="divWebpageDialog">
        <div id="webpageDialog" class="modal hide fade">
            <div class="modal-header">
                <a href="#" class="close" data-dismiss="modal">&times;</a>
                <h3 id="prompt">About me</h3>
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
    <div id="moreInfo" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="ModalLabel" aria-hidden="true">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
            <h3 id="ModalLabel">More Info</h3>
        </div>
        <div class="modal-body">

            <p>MovieCatalog , a new way of catalog your movies! Keep your library always up to date and invite friends join this community to increase number of review and movie's details.</p>

        </div>
        <div class="modal-footer">
            <button class="btn btn-primary" data-dismiss="modal" aria-hidden="true">Close</button>
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
            <button class="btn" data-dismiss="modal" data-loading-text="Loading..."aria-hidden="true">Close</button>
            <input type="submit" value="Add" class="btn btn-primary">
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
