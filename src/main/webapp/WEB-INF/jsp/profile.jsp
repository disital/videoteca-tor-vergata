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
                padding-top: 40px;
                padding-bottom: 40px;
                background-color: #f5f5f5;
            }

            .form-signin {
                max-width: 300px;
                padding: 19px 29px 29px;
                margin: 0 auto 20px;
                background-color: #fff;
                border: 1px solid #e5e5e5;
                -webkit-border-radius: 5px;
                -moz-border-radius: 5px;
                border-radius: 5px;
                -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.05);
                -moz-box-shadow: 0 1px 2px rgba(0,0,0,.05);
                box-shadow: 0 1px 2px rgba(0,0,0,.05);
            }
            .form-signin input[type="text"],
            .form-signin input[type="password"] {
                font-size: 16px;
                height: auto;
                margin-bottom: 15px;
                padding: 7px 9px;

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



        <div class="container-fluid">      
            <form class="form-horizontal">
                <legend>Person Form</legend>
                <div class="row-fluid">
                    <div class="span8">
                        <div class="row-fluid">
                            <div class="span6">
                                <div class="control-group">
                                    <label class="control-label" for="username">Username</label>
                                    <div class="controls">
                                        <input type="text" id="username" placeholder="<%= request.getSession().getAttribute("username")%>">
                                    </div>
                                </div>
                            </div><!--/span-->
                            <div class="span6">
                                <div class="control-group">
                                    <label class="control-label" for="avatar">Avatar</label>
                                    <div class="controls">
                                        <img class="featurette-image pull-right" src="./resources/img/norbit.jpg">
                                        <form action="" method="post"
                                              enctype="multipart/form-data">
                                            <input type="file" name="file" size="50" />
                                            <br />
                                            <input type="submit" value="Upload File" />
                                        </form>
                                    </div>
                                </div>
                            </div><!--/span-->
                        </div><!--/row-->
                        <div class="row-fluid">
                            <div class="span6">
                                <div class="control-group">
                                    <label class="control-label" for="name">Name</label>
                                    <div class="controls">
                                        <input type="text" id="name" placeholder="">
                                    </div>
                                </div>
                            </div><!--/span-->
                            <div class="span6 bgcolor">
                                <div class="control-group">
                                    <label class="control-label" for="dateOfBirth">Date of Birth</label>
                                    <div class="controls">
                                        <input type="text" id="dateOfBirth" placeholder="dd/mm/yyyy">
                                    </div>
                                </div>
                            </div><!--/span-->
                        </div><!--/row-->

                        <fieldset>
                            <legend>Address</legend>
                            <div class="row-fluid">
                                <div class="span12 bgcolor">
                                    <div class="control-group">
                                        <label class="control-label" for="street">Street</label>
                                        <div class="controls">
                                            <input type="text" class="input-xxlarge" id="street">
                                        </div>
                                    </div>             
                                </div>
                            </div>
                            <div class="row-fluid">
                                <div class="span6 bgcolor">
                                    <div class="control-group">
                                        <label class="control-label" for="city">City</label>
                                        <div class="controls">
                                            <input type="text" id="city"> 
                                        </div>
                                    </div>
                                </div><!--/span-->
                                <div class="span6 bgcolor">
                                    <div class="control-group">
                                        <label class="control-label" for="state">State</label>
                                        <div class="controls">
                                            <input type="text" id="state"> 
                                        </div>
                                    </div>
                                </div><!--/span-->
                            </div><!--/row-->           
                            <div class="row-fluid">
                                <div class="span6 bgcolor">
                                    <div class="control-group">
                                        <label class="control-label" for="postCode">Post Code</label>
                                        <div class="controls">
                                            <input type="text" id="postCode"> 
                                        </div>
                                    </div>
                                </div><!--/span-->
                                <div class="span6 bgcolor">
                                    <div class="control-group">
                                        <label class="control-label" for="country">Country</label>
                                        <div class="controls">
                                            <select id="country"></select>
                                        </div>
                                    </div>            

                                </div><!--/span-->
                            </div><!--/row-->
                        </fieldset>                        
                    </div><!--/span-->

                    <div class="span4">

                    </div><!--/span-->       
                </div><!--/row-->
            </form>

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