<%@ page import="domain.FlightDetails" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="apple-touch-icon" type="image/png" href=""/>
    <meta name="apple-mobile-web-app-title" content="CodePen">
    <link rel="shortcut icon" type="image/x-icon" href=""/>
    <link rel="mask-icon" type="" href="" color="#111"/>
    <title>Records | Flight Management System</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/css/bootstrap.css'>
    <link rel='stylesheet'
          href='https://cdnjs.cloudflare.com/ajax/libs/datatables/1.10.16/css/dataTables.bootstrap4.css'>
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css'>
    <style>
        html {
            position: relative;
            min-height: 100%;
        }

        body {
            overflow-x: hidden;
        }

        body.sticky-footer {
            margin-bottom: 56px;
        }

        body.sticky-footer .content-wrapper {
            min-height: calc(100vh - 56px - 56px);
        }

        body.fixed-nav {
            padding-top: 56px;
        }

        .content-wrapper {
            min-height: calc(100vh - 56px);
            padding-top: 1rem;
        }

        .scroll-to-top {
            position: fixed;
            right: 15px;
            bottom: 3px;
            display: none;
            width: 50px;
            height: 50px;
            text-align: center;
            color: white;
            background: rgba(52, 58, 64, 0.5);
            line-height: 45px;
        }

        .scroll-to-top:focus, .scroll-to-top:hover {
            color: white;
        }

        .scroll-to-top:hover {
            background: #343a40;
        }

        .scroll-to-top i {
            font-weight: 800;
        }

        .smaller {
            font-size: 0.7rem;
        }

        .o-hidden {
            overflow: hidden !important;
        }

        .z-0 {
            z-index: 0;
        }

        .z-1 {
            z-index: 1;
        }

        #mainNav .navbar-collapse {
            overflow: auto;
            max-height: 75vh;
        }

        #mainNav .navbar-collapse .navbar-nav .nav-item .nav-link {
            cursor: pointer;
        }

        #mainNav .navbar-collapse .navbar-sidenav .nav-link-collapse:after {
            float: right;
            content: '\f107';
            font-family: 'FontAwesome';
        }

        #mainNav .navbar-collapse .navbar-sidenav .nav-link-collapse.collapsed:after {
            content: '\f105';
        }

        #mainNav .navbar-collapse .navbar-sidenav .sidenav-second-level,
        #mainNav .navbar-collapse .navbar-sidenav .sidenav-third-level {
            padding-left: 0;
        }

        #mainNav .navbar-collapse .navbar-sidenav .sidenav-second-level > li > a,
        #mainNav .navbar-collapse .navbar-sidenav .sidenav-third-level > li > a {
            display: block;
            padding: 0.5em 0;
        }

        #mainNav .navbar-collapse .navbar-sidenav .sidenav-second-level > li > a:focus, #mainNav .navbar-collapse .navbar-sidenav .sidenav-second-level > li > a:hover,
        #mainNav .navbar-collapse .navbar-sidenav .sidenav-third-level > li > a:focus,
        #mainNav .navbar-collapse .navbar-sidenav .sidenav-third-level > li > a:hover {
            text-decoration: none;
        }

        #mainNav .navbar-collapse .navbar-sidenav .sidenav-second-level > li > a {
            padding-left: 1em;
        }

        #mainNav .navbar-collapse .navbar-sidenav .sidenav-third-level > li > a {
            padding-left: 2em;
        }

        #mainNav .navbar-collapse .sidenav-toggler {
            display: none;
        }

        #mainNav .navbar-collapse .navbar-nav > .nav-item.dropdown > .nav-link {
            position: relative;
            min-width: 45px;
        }

        #mainNav .navbar-collapse .navbar-nav > .nav-item.dropdown > .nav-link:after {
            float: right;
            width: auto;
            content: '\f105';
            border: none;
            font-family: 'FontAwesome';
        }

        #mainNav .navbar-collapse .navbar-nav > .nav-item.dropdown > .nav-link .indicator {
            position: absolute;
            top: 5px;
            left: 21px;
            font-size: 10px;
        }

        #mainNav .navbar-collapse .navbar-nav > .nav-item.dropdown.show > .nav-link:after {
            content: '\f107';
        }

        #mainNav .navbar-collapse .navbar-nav > .nav-item.dropdown .dropdown-menu > .dropdown-item > .dropdown-message {
            overflow: hidden;
            max-width: none;
            text-overflow: ellipsis;
        }

        @media (min-width: 992px) {
            #mainNav .navbar-brand {
                width: 250px;
            }
            #mainNav .navbar-collapse {
                overflow: visible;
                max-height: none;
            }
            #mainNav .navbar-collapse .navbar-sidenav {
                position: absolute;
                top: 0;
                left: 0;
                -webkit-flex-direction: column;
                -ms-flex-direction: column;
                flex-direction: column;
                margin-top: 56px;
            }
            #mainNav .navbar-collapse .navbar-sidenav > .nav-item {
                width: 250px;
                padding: 0;
            }
            #mainNav .navbar-collapse .navbar-sidenav > .nav-item > .nav-link {
                padding: 1em;
            }
            #mainNav .navbar-collapse .navbar-sidenav > .nav-item .sidenav-second-level,
            #mainNav .navbar-collapse .navbar-sidenav > .nav-item .sidenav-third-level {
                padding-left: 0;
                list-style: none;
            }
            #mainNav .navbar-collapse .navbar-sidenav > .nav-item .sidenav-second-level > li,
            #mainNav .navbar-collapse .navbar-sidenav > .nav-item .sidenav-third-level > li {
                width: 250px;
            }
            #mainNav .navbar-collapse .navbar-sidenav > .nav-item .sidenav-second-level > li > a,
            #mainNav .navbar-collapse .navbar-sidenav > .nav-item .sidenav-third-level > li > a {
                padding: 1em;
            }
            #mainNav .navbar-collapse .navbar-sidenav > .nav-item .sidenav-second-level > li > a {
                padding-left: 2.75em;
            }
            #mainNav .navbar-collapse .navbar-sidenav > .nav-item .sidenav-third-level > li > a {
                padding-left: 3.75em;
            }
            #mainNav .navbar-collapse .navbar-nav > .nav-item.dropdown > .nav-link {
                min-width: 0;
            }
            #mainNav .navbar-collapse .navbar-nav > .nav-item.dropdown > .nav-link:after {
                width: 24px;
                text-align: center;
            }
            #mainNav .navbar-collapse .navbar-nav > .nav-item.dropdown .dropdown-menu > .dropdown-item > .dropdown-message {
                max-width: 300px;
            }
        }

        #mainNav.fixed-top .sidenav-toggler {
            display: none;
        }

        @media (min-width: 992px) {
            #mainNav.fixed-top .navbar-sidenav {
                height: calc(100vh - 112px);
            }
            #mainNav.fixed-top .sidenav-toggler {
                position: absolute;
                top: 0;
                left: 0;
                display: flex;
                -webkit-flex-direction: column;
                -ms-flex-direction: column;
                flex-direction: column;
                margin-top: calc(100vh - 56px);
            }
            #mainNav.fixed-top .sidenav-toggler > .nav-item {
                width: 250px;
                padding: 0;
            }
            #mainNav.fixed-top .sidenav-toggler > .nav-item > .nav-link {
                padding: 1em;
            }
        }

        #mainNav.fixed-top.navbar-dark .sidenav-toggler {
            background-color: #212529;
        }

        #mainNav.fixed-top.navbar-dark .sidenav-toggler a i {
            color: #adb5bd;
        }

        #mainNav.fixed-top.navbar-light .sidenav-toggler {
            background-color: #dee2e6;
        }

        #mainNav.fixed-top.navbar-light .sidenav-toggler a i {
            color: rgba(0, 0, 0, 0.5);
        }

        body.sidenav-toggled #mainNav.fixed-top .sidenav-toggler {
            overflow-x: hidden;
            width: 55px;
        }

        body.sidenav-toggled #mainNav.fixed-top .sidenav-toggler .nav-item,
        body.sidenav-toggled #mainNav.fixed-top .sidenav-toggler .nav-link {
            width: 55px !important;
        }

        body.sidenav-toggled #mainNav.fixed-top #sidenavToggler i {
            -webkit-transform: scaleX(-1);
            -moz-transform: scaleX(-1);
            -o-transform: scaleX(-1);
            transform: scaleX(-1);
            -ms-filter: 'FlipH';
        }

        #mainNav.static-top .sidenav-toggler {
            display: none;
        }

        @media (min-width: 992px) {
            #mainNav.static-top .sidenav-toggler {
                display: flex;
            }
        }

        body.sidenav-toggled #mainNav.static-top #sidenavToggler i {
            -webkit-transform: scaleX(-1);
            -moz-transform: scaleX(-1);
            -o-transform: scaleX(-1);
            transform: scaleX(-1);
            filter: FlipH;
            -ms-filter: 'FlipH';
        }

        .content-wrapper {
            overflow-x: hidden;
            background: white;
        }

        @media (min-width: 992px) {
            .content-wrapper {
                margin-left: 250px;
            }
        }

        #sidenavToggler i {
            font-weight: 800;
        }

        .navbar-sidenav-tooltip.show {
            display: none;
        }

        @media (min-width: 992px) {
            body.sidenav-toggled .content-wrapper {
                margin-left: 55px;
            }
        }

        body.sidenav-toggled .navbar-sidenav {
            width: 55px;
        }

        body.sidenav-toggled .navbar-sidenav .nav-link-text {
            display: none;
        }

        body.sidenav-toggled .navbar-sidenav .nav-item,
        body.sidenav-toggled .navbar-sidenav .nav-link {
            width: 55px !important;
        }

        body.sidenav-toggled .navbar-sidenav .nav-item:after,
        body.sidenav-toggled .navbar-sidenav .nav-link:after {
            display: none;
        }

        body.sidenav-toggled .navbar-sidenav .nav-item {
            white-space: nowrap;
        }

        body.sidenav-toggled .navbar-sidenav-tooltip.show {
            display: flex;
        }

        #mainNav.navbar-dark .navbar-collapse .navbar-sidenav .nav-link-collapse:after {
            color: #868e96;
        }

        #mainNav.navbar-dark .navbar-collapse .navbar-sidenav > .nav-item > .nav-link {
            color: #868e96;
        }

        #mainNav.navbar-dark .navbar-collapse .navbar-sidenav > .nav-item > .nav-link:hover {
            color: #adb5bd;
        }

        #mainNav.navbar-dark .navbar-collapse .navbar-sidenav > .nav-item .sidenav-second-level > li > a,
        #mainNav.navbar-dark .navbar-collapse .navbar-sidenav > .nav-item .sidenav-third-level > li > a {
            color: #868e96;
        }

        #mainNav.navbar-dark .navbar-collapse .navbar-sidenav > .nav-item .sidenav-second-level > li > a:focus, #mainNav.navbar-dark .navbar-collapse .navbar-sidenav > .nav-item .sidenav-second-level > li > a:hover,
        #mainNav.navbar-dark .navbar-collapse .navbar-sidenav > .nav-item .sidenav-third-level > li > a:focus,
        #mainNav.navbar-dark .navbar-collapse .navbar-sidenav > .nav-item .sidenav-third-level > li > a:hover {
            color: #adb5bd;
        }

        #mainNav.navbar-dark .navbar-collapse .navbar-nav > .nav-item.dropdown > .nav-link:after {
            color: #adb5bd;
        }

        @media (min-width: 992px) {
            #mainNav.navbar-dark .navbar-collapse .navbar-sidenav {
                background: #343a40;
            }
            #mainNav.navbar-dark .navbar-collapse .navbar-sidenav li.active a {
                color: white !important;
                background-color: #495057;
            }
            #mainNav.navbar-dark .navbar-collapse .navbar-sidenav li.active a:focus, #mainNav.navbar-dark .navbar-collapse .navbar-sidenav li.active a:hover {
                color: white;
            }
            #mainNav.navbar-dark .navbar-collapse .navbar-sidenav > .nav-item .sidenav-second-level,
            #mainNav.navbar-dark .navbar-collapse .navbar-sidenav > .nav-item .sidenav-third-level {
                background: #343a40;
            }
        }

        #mainNav.navbar-light .navbar-collapse .navbar-sidenav .nav-link-collapse:after {
            color: rgba(0, 0, 0, 0.5);
        }

        #mainNav.navbar-light .navbar-collapse .navbar-sidenav > .nav-item > .nav-link {
            color: rgba(0, 0, 0, 0.5);
        }

        #mainNav.navbar-light .navbar-collapse .navbar-sidenav > .nav-item > .nav-link:hover {
            color: rgba(0, 0, 0, 0.7);
        }

        #mainNav.navbar-light .navbar-collapse .navbar-sidenav > .nav-item .sidenav-second-level > li > a,
        #mainNav.navbar-light .navbar-collapse .navbar-sidenav > .nav-item .sidenav-third-level > li > a {
            color: rgba(0, 0, 0, 0.5);
        }

        #mainNav.navbar-light .navbar-collapse .navbar-sidenav > .nav-item .sidenav-second-level > li > a:focus, #mainNav.navbar-light .navbar-collapse .navbar-sidenav > .nav-item .sidenav-second-level > li > a:hover,
        #mainNav.navbar-light .navbar-collapse .navbar-sidenav > .nav-item .sidenav-third-level > li > a:focus,
        #mainNav.navbar-light .navbar-collapse .navbar-sidenav > .nav-item .sidenav-third-level > li > a:hover {
            color: rgba(0, 0, 0, 0.7);
        }

        #mainNav.navbar-light .navbar-collapse .navbar-nav > .nav-item.dropdown > .nav-link:after {
            color: rgba(0, 0, 0, 0.5);
        }

        @media (min-width: 992px) {
            #mainNav.navbar-light .navbar-collapse .navbar-sidenav {
                background: #f8f9fa;
            }
            #mainNav.navbar-light .navbar-collapse .navbar-sidenav li.active a {
                color: #000 !important;
                background-color: #e9ecef;
            }
            #mainNav.navbar-light .navbar-collapse .navbar-sidenav li.active a:focus, #mainNav.navbar-light .navbar-collapse .navbar-sidenav li.active a:hover {
                color: #000;
            }
            #mainNav.navbar-light .navbar-collapse .navbar-sidenav > .nav-item .sidenav-second-level,
            #mainNav.navbar-light .navbar-collapse .navbar-sidenav > .nav-item .sidenav-third-level {
                background: #f8f9fa;
            }
        }

        .card-body-icon {
            position: absolute;
            z-index: 0;
            top: -25px;
            right: -25px;
            font-size: 5rem;
            -webkit-transform: rotate(15deg);
            -ms-transform: rotate(15deg);
            transform: rotate(15deg);
        }

        @media (min-width: 576px) {
            .card-columns {
                column-count: 1;
            }
        }

        @media (min-width: 768px) {
            .card-columns {
                column-count: 2;
            }
        }

        @media (min-width: 1200px) {
            .card-columns {
                column-count: 2;
            }
        }

        .card-login {
            max-width: 25rem;
        }

        .card-register {
            max-width: 40rem;
        }

        footer.sticky-footer {
            position: absolute;
            right: 0;
            bottom: 0;
            width: 100%;
            height: 56px;
            background-color: #e9ecef;
            line-height: 55px;
        }

        @media (min-width: 992px) {
            footer.sticky-footer {
                width: calc(100% - 250px);
            }
        }

        @media (min-width: 992px) {
            body.sidenav-toggled footer.sticky-footer {
                width: calc(100% - 55px);
            }
        }
        body {
            font-family: 'Montserrat', 'Lato', 'Open Sans', 'Helvetica Neue', Helvetica, Calibri, Arial, sans-serif;
            color: #6b7381;
            background: #f2f2f2;
        }
        .jumbotron h1 {
            color: #fff;
        }
    </style>

</head>

<body class="fixed-nav sticky-footer bg-dark" id="page-top">
<!-- Navigation-->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
    <a class="navbar-brand" href="dashboard?pageRequest=list">Flight Management System</a>
    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse"
            data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false"
            aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Dashboard">
                <a class="nav-link" href="dashboard?pageRequest=list">
                    <i class="fa fa-fw fa-dashboard"></i>
                    <span class="nav-link-text">Dashboard</span>
                </a>
            </li>
            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Create Record">
                <a class="nav-link" href="dashboard?pageRequest=create">
                    <i class="fa fa-fw fa-plane"></i>
                    <span class="nav-link-text">Create Flight Record</span>
                </a>
            </li>

            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="List">
                <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseComponents"
                   data-parent="#exampleAccordion">
                    <i class="fa fa-fw fa-credit-card-alt"></i>
                    <span class="nav-link-text">Paid and Unpaid Records</span>
                </a>
                <ul class="sidenav-second-level collapse" id="collapseComponents">
                    <li>
                        <a href="dashboard?pageRequest=paidList">Paid</a>
                    </li>
                    <li>
                        <a href="dashboard?pageRequest=unpaidList">Unpaid</a>
                    </li>
                </ul>
            </li>

        </ul>

        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="nav-link" data-toggle="modal" data-target="#exampleModal">
                    <i class="fa fa-fw fa-sign-out"></i>Logout</a>
            </li>
        </ul>
    </div>
</nav>
<div class="content-wrapper">
    <div class="container-fluid">
        <!-- Breadcrumbs-->
        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a href="#">Dashboard</a>
            </li>
            <li class="breadcrumb-item active">My Dashboard</li>
        </ol>
        <!-- Example DataTables Card-->
        <div class="card mb-3">
            <div class="card-header">
                <i class="fa fa-table"></i>My General Dashboard
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered" id="dataTable" >
                        <thead>
                        <tr>
                            <th>S.N</th>
                            <th>Name</th>
                            <th>Phone</th>
                            <th>Email</th>
                            <th>Destination</th>
                            <th>Date</th>
                            <th>Amount</th>
                            <th>Paid/Unpaid</th>
                            <th>Action</th>
                        </tr>
                        </thead>
                        <tfoot>
                        <tr>
                            <th>S.N</th>
                            <th>Name</th>
                            <th>Phone</th>
                            <th>Email</th>
                            <th>Destination</th>
                            <th>Date</th>
                            <th>Amount</th>
                            <th>Paid/Unpaid</th>
                            <th>Action</th>
                        </tr>
                        </tfoot>
                        <tbody>
                        <c:forEach var="flight" items="${flights }" varStatus="theCount">
                            <tr>
                                <td>${theCount.count}</td>
                                <td>${flight.name }</td>
                                <td>${flight.phone }</td>
                                <td>${flight.email }</td>
                                <td>${flight.destination }</td>
                                <td>${flight.date.toString() }</td>
                                <td>${flight.price }</td>
                                <td>
                                    <c:set var="status" value="${flight.paymentStatus}"/>
                                    <jsp:useBean id="status"  type="java.lang.String"/>
                                    <select class="dropdown_change" data-id="${flight.d_id}">
                                        <option value="paid" <c:if test='<%=status.equalsIgnoreCase("paid")%>'>selected</c:if>>Paid</option>
                                        <option value="unpaid" <c:if test='<%=status.equalsIgnoreCase("unpaid")%>'>selected</c:if>>Unpaid</option>
                                    </select>
                                </td>
                                <td>
                                    <a href="dashboard?pageRequest=edit&id=${flight.d_id}"
                                       class="btn btn-primary btn-xs dt-edit" style="margin-right:16px;">
                                        <span class="fa fa-fw fa-pencil" aria-hidden="true"></span>
                                    </a>
                                    <a href="dashboard?pageRequest=delete&id=${flight.d_id}"
                                       class="btn btn-danger btn-xs dt-delete">
                                        <span class="fa fa-fw fa-trash" aria-hidden="true"></span>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>

                        </tbody>
                    </table>
                </div>
            </div>
            <div class="card-footer small text-muted"></div>
        </div>
    </div>
    <!-- /.container-fluid-->
    <!-- /.content-wrapper-->
    <footer class="sticky-footer">
        <div class="container">
            <div class="text-center">
                <small>Copyright© 2020</small>
            </div>
        </div>
    </footer>
    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fa fa-angle-up"></i>
    </a>
    <!-- Logout Modal-->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <form method="get" action="logout">
                        <input type="submit" class="btn btn-primary" value="Logout"/>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>

<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.5/umd/popper.js'></script>
<script src='https://cdn.datatables.net/1.10.16/js/jquery.dataTables.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/js/bootstrap.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/datatables/1.10.16/js/dataTables.bootstrap4.js'></script>

<script>
    // (function($) {
        $(".dropdown_change").change(function () {
            window.location.href = "dashboard?pageRequest=update&id=" + $(this).attr('data-id') + "&status=" + $(this).val();
        });
        $(document).ready(function () {
            $('#dataTable').DataTable();
        });
    // })(jQuery);
</script>


</body>

</html>

