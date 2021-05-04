<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="models.Post" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="models.Comment" %>
<%@ page import="java.util.Map" %>
<%--
  Created by IntelliJ IDEA.
  User: decagon
  Date: 03/05/2021
  Time: 4:07 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%
    Map<Post, List<Comment>> posts = (Map<Post, List<Comment>>) request.getAttribute("userPosts");
    pageContext.setAttribute("posts", posts);
%>
<html>
<head>
    <title>My Profile - Posts</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            margin-top:20px;
            background:#eee !important;
        }
        img{
            margin-left: 7rem;
        }
        .navbar-nav {
            margin-left: 7rem;
        }
        .nav-item a{
            color: white !important;

        }

        #navbarTogglerDemo01 {
            background-color: #3B5998;
        }

        #searchBar, #searchBar button{
            float: left !important;
            margin-right: 7rem;
            height: 2rem;
        }
        #searchBar input{
            float: left !important;
            margin-right: 7rem;
            width: 20rem;
            height: 2rem;
        }

        #myfriends-right-hand {
            float: right;
            height: 100%;
            background-color: #F0F2F5;
        }
        #postSection {
            width: 50%;
            margin: 10% auto 0;
            margin-top: 1%;
            margin-right: 30%;
            background-color: #F0F2F5;
        }

        /*styling for the show posts and comment section*/
        /*-- Global Selectors --*/
        a{
            color:#47649F;
        }

        /*-- Bootstrap Override Style --*/


        /*-- Content Style --*/
        .post-footer-option li{
            float:left;
            margin-right:50px;
            padding-bottom:15px;
        }

        .post-footer-option li a{
            color:#AFB4BD;
            font-weight:500;
            font-size:1.3rem;
        }

        .photo-profile{
            border:1px solid #DDD;
        }

        .anchor-username h4{
            font-weight:bold;
        }

        .anchor-time{
            color:#ADB2BB;
            font-size:1.2rem;
        }

        .post-footer-comment-wrapper{
            background-color:#F6F7F8;
        }

        /*post and comment session*/
        .timeline {
            list-style-type: none;
            margin: 0;
            padding: 0;
            position: relative
        }


        .timeline>li {
            position: relative;
            min-height: 50px;
            padding: 20px 0
        }

        .timeline .timeline-time {
            position: absolute;
            left: 0;
            width: 18%;
            text-align: right;
            top: 30px
        }

        .timeline .timeline-time .date,
        .timeline .timeline-time .time {
            display: block;
            font-weight: 600
        }

        .timeline .timeline-time .date {
            line-height: 16px;
            font-size: 12px
        }

        .timeline .timeline-time .time {
            line-height: 24px;
            font-size: 20px;
            color: #242a30
        }

        .timeline .timeline-icon {
            left: 15%;
            position: absolute;
            width: 10%;
            text-align: center;
            top: 40px;
        }

        .timeline .timeline-icon a {
            text-decoration: none;
            width: 20px;
            height: 20px;
            display: inline-block;
            border-radius: 20px;
            background: #d9e0e7;
            line-height: 10px;
            color: #fff;
            font-size: 14px;
            border: 5px solid #2d353c;
            transition: border-color .2s linear;
            background-color: red;
        }

        .timeline .timeline-body {
            /*margin-left: 10%;*/
            /*margin-right: 17%;*/
            margin-left:90px;
            margin-right: 180px;
            width: 750px;
            /*margin: 10% auto 0;*/
            background: #fff;
            position: relative;
            padding: 20px 25px;
            border-radius: 6px;

        }

        .timeline .timeline-body:before {
            content: '';
            display: block;
            position: absolute;
            border: 10px solid transparent;
            border-right-color: #fff;
            left: -20px;
            top: 20px
        }

        .timeline .timeline-body>div+div {
            margin-top: 15px
        }

        .timeline .timeline-body>div+div:last-child {
            margin-bottom: -20px;
            padding-bottom: 20px;
            border-radius: 0 0 6px 6px
        }

        .timeline-header {
            padding-bottom: 10px;
            border-bottom: 1px solid #e2e7eb;
            line-height: 30px
        }

        .timeline-header .userimage {
            float: left;
            width: 34px;
            height: 34px;
            border-radius: 40px;
            overflow: hidden;
            margin: -2px 10px -2px 0
        }

        .timeline-header .username {
            font-size: 16px;
            font-weight: 600
        }

        .timeline-header .username,
        .timeline-header .username a {
            color: #2d353c
        }

        .timeline img {
            max-width: 100%;
            display: block
        }

        .timeline-content {
            letter-spacing: .25px;
            line-height: 18px;
            font-size: 13px
        }

        .timeline-content:after,
        .timeline-content:before {
            content: '';
            display: table;
            clear: both
        }

        .timeline-title {
            margin-top: 0
        }

        .timeline-footer {
            background: #fff;
            border-top: 1px solid #e2e7ec;
            padding-top: 15px
        }

        .timeline-footer a:not(.btn) {
            color: #575d63
        }

        .timeline-footer a:not(.btn):focus,
        .timeline-footer a:not(.btn):hover {
            color: #2d353c
        }

        .timeline-likes {
            color: #6d767f;
            font-weight: 600;
            font-size: 12px
        }

        .timeline-likes .stats-right {
            float: right
        }

        .timeline-likes .stats-total {
            display: inline-block;
            line-height: 20px
        }

        .timeline-likes .stats-icon {
            float: left;
            margin-right: 5px;
            font-size: 9px;
        }

        .timeline-likes .stats-icon+.stats-icon {
            margin-left: -2px
        }

        .timeline-likes .stats-text {
            line-height: 20px
        }

        .timeline-likes .stats-text+.stats-text {
            margin-left: 15px
        }

        .timeline-comment-box {
            background: #f2f3f4;
            margin-left: -25px;
            margin-right: -25px;
            padding: 20px 25px
        }

        .timeline-comment-box .user {
            float: left;
            width: 34px;
            height: 34px;
            overflow: hidden;
            border-radius: 30px
        }

        .timeline-comment-box .user img {
            max-width: 100%;
            max-height: 100%
        }

        .timeline-comment-box .user+.input {
            margin-left: 44px
        }

        .lead {
            margin-bottom: 20px;
            font-size: 21px;
            font-weight: 300;
            line-height: 1.4;
        }

        .text-danger, .text-red {
            color: #ff5b57!important;
        }
        /*view comments section styling*/
        #comment {
            float: right;
            margin-right: 200px;
            width: 500px;
            height: 150px;
            margin-bottom: 15px;
            margin-top: 15px;
            overflow: scroll;
            border-radius: 50px 50px 50px 50px;
        }
        .iconbtn {
            padding: 0.2rem;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01"
            aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
        <a class="navbar-brand" href="#"><img
                src="https://www.freeiconspng.com/uploads/facebook-f-logo-white-background-21.jpg" width="40"
                height="30" alt="facebook f logo white background"></a>

        <form id="searchBar" class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form>

        <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
            <li class="nav-item active">
                <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Messages</a>
            </li>
            <li class="nav-item">
                <a class="nav-link " href="#" tabindex="-1">My Profile</a>
            </li>
            <li class="nav-item">
                <a class="nav-link " href="#" tabindex="-1">Friends</a>
            </li>
        </ul>
    </div>
</nav>

<div id="myfriends-right-hand" class="card" style="width: 18rem;">
    <img src="" class="card-img-top" alt="myfriends">
    <div class="card-body">
        <h5 class="card-title">My Friends</h5>
        <ul class="list-group list-group-flush">
            <li class="list-group-item">Cras justo odio <a href="#">view</a></li>
            <li class="list-group-item">Dapibus ac facilisis in <a href="#">view</a></li>
            <li class="list-group-item">Vestibulum at eros <a href="#">view</a></li>
            <li class="list-group-item">Cras justo odio <a href="#">view</a></li>
            <li class="list-group-item">Dapibus ac facilisis in <a href="#">view</a></li>
            <li class="list-group-item">Vestibulum at eros <a href="#">view</a></li>
            <li class="list-group-item">Cras justo odio <a href="#">view</a></li>
            <li class="list-group-item">Dapibus ac facilisis in <a href="#">view</a></li>
            <li class="list-group-item">Vestibulum at eros <a href="#">view</a></li>
        </ul>
    </div>
</div>

<div id="postSection">
    <div class="form-group shadow-textarea">
        <form action="./profile" method="POST">
            <label for="exampleFormControlTextarea6">Create a Post</label>
            <textarea class="form-control z-depth-1" id="exampleFormControlTextarea6" rows="3" name="postMessage"
                      placeholder="Whats On Your Mind?" required></textarea>
            <button type="submit" class="btn btn-secondary btn-sm">Post</button>
        </form>
    </div>
</div>


<div class="container">
    <%--for loop to display use posts--%>
    <c:forEach var="post" items="${posts}">
        <div class="row">
            <div class="col-md-12">
                <div id="content" class="content content-full-width">
                    <div class="profile-content">
                        <!-- begin tab-content -->
                        <div class="tab-content p-0">
                            <!-- begin #profile-post tab -->
                            <!-- begin timeline -->
                            <ul class="timeline">
                                <div class="timeline-body">
                                    <div class="timeline-header">
                                            <span class="userimage"><img
                                                    src="https://bootdey.com/img/Content/avatar/avatar3.png"
                                                    alt=""></span>
                                        <span class="username"><a
                                                href="javascript:;">Sean Ngu</a> <small></small></span>
                                        <span class="pull-right text-muted">Date: ${ post.key.date}</span>
                                    </div>
                                    <div class="timeline-content">
                                        <p>${post.key.message}</p>
                                    </div>
                                    <div class="timeline-likes">
                                        <div class="stats">
                                        <span class="fa-stack fa-fw stats-icon">
                                        <i class="fa fa-circle fa-stack-2x text-danger"></i>
                                        <i class="fa fa-heart fa-stack-1x fa-inverse t-plus-1"></i>
                                        </span>
                                            <span class="fa-stack fa-fw stats-icon">
                                        <i class="fa fa-circle fa-stack-2x text-primary"></i>
                                        <i class="fa fa-thumbs-up fa-stack-1x fa-inverse"></i>
                                        </span>
                                            <span class="stats-total">${post.key.totalLikes}</span>
                                        </div>
                                    </div>
                                    <div class="timeline-footer">
                                        <a href="javascript:" class="m-r-15 text-inverse-lighter">
                                            <i class="fa fa-thumbs-up fa-fw fa-lg m-r-3"></i>
                                            <a href="./like?postID=${post.key.postID}">Like</a>
                                        </a>
                                        <a href="javascript:" class="m-r-15 text-inverse-lighter">
                                            <i class="fa fa-comments fa-fw fa-lg m-r-3"></i>
                                            <a href="#comment">Comment</a>
                                        </a>
                                        <a href="javascript:" class="m-r-15 text-inverse-lighter">
                                            <i class=" iconbtn fa fa-pencil-square-o" aria-hidden="true"></i>
                                            <a href="./edit?postID=${post.key.postID}"> Edit </a>
                                        </a>
                                        <a href="javascript:" class="m-r-15 text-inverse-lighter">
                                            <i class=" iconbtn fa fa-pencil-square-o" aria-hidden="true"></i>
                                            <a href="./delete?postID=${post.key.postID}"> Delete </a>
                                        </a>
                                    </div>
                                    <div class="timeline-comment-box">
                                        <div class="user"><img src="https://bootdey.com/img/Content/avatar/avatar3.png" alt="">
                                        </div>
                                        <div class="input" required>
                                            <form action="./comment?postID=${post.key.postID}" method="POST">

                                                <div class="input-group">
                                                    <input required name="comment" type="text" class="form-control rounded-corner"
                                                           placeholder="Write a comment...">
                                                    <span class="input-group-btn p-l-10">
                                              <button class="btn btn-primary f-s-12 rounded-corner"
                                                      type="submit">Comment</button>
                                              </span>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>

                                <c:forEach var ="comment" items="${post.value}">

                                <div id="comment" class="card">
                                    <div class="card-header">
                                        Comment
                                        <h6>Date:${comment.date}</h6>
                                    </div>
                                    <div class="card-body">
                                        <blockquote class="blockquote mb-0">
                                            <p>${comment.comment}</p>
                                            <footer class="blockquote-footer">Powered By  <cite title="Source Title">Mondris</cite></footer>
                                        </blockquote>
                                    </div>
                                </div>
                                </c:forEach>
                                <!-- end timeline-body -->
                                <!-- end #profile-post tab -->
                        </div>
                        <!-- end tab-content -->
                    </div>
                    <!-- end profile-content -->
                </div>
            </div>
        </div>

    </c:forEach>
    <br>
    <br>
    <%--show posts and comment section--%>

</div>


<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
        integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
        integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
        crossorigin="anonymous"></script>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">

<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="https://netdna.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>


</body>
</html>
