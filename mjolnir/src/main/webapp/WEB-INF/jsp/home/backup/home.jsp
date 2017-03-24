<!--index.html -->
<!DOCTYPE html>
<html ng-app="myApp">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Single page AngularJS + Bootstrap </title>

    <!-- Bootstrap Core CSS -->
    <link href="../view/template/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="../view/template/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

    <!-- Timeline CSS -->
    <link href="../view/css/timeline.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../view/css/sb-admin-2.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="../view/template/morrisjs/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="../view/template/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>



<body> 
    <nav class="navbar navbar-inverse">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-2">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#/">Home</a>
            </div>

            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-2">
                <ul class="nav navbar-nav">
                    <li><a href="#/about">About </a></li>
                    <li><a href="#/contact">Contact</a></li>                
                </ul>                                
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="#/login">Login</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <div ng-view></div>

    <script src="../view/template/jquery/dist/jquery.min.js"></script>
    <script src="../ngjs/angular.min.js"></script>
    <script src="../ngjs/angular-route.min.js"></script>    
    <script src="../app/app.js"></script>
    <script src="../app/controllers/controllers.js"></script>


</body>
</html>    

