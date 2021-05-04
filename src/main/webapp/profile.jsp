<%--
  Created by IntelliJ IDEA.
  User: Fabian
  Date: 30/04/2021
  Time: 9:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
  <title>My Profile</title>
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
      margin: 1% 30% 0 auto;
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
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
    <a class="navbar-brand" href="#"><img src="https://www.freeiconspng.com/uploads/facebook-f-logo-white-background-21.jpg" width="40"  height="30" alt="facebook f logo white background" /></a>

    <form id="searchBar" class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
    <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
      <li class="nav-item active">
        <a class="nav-link" href="#"> Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#"> Messages </a>
      </li>
      <li class="nav-item">
        <a class="nav-link " href="#" tabindex="-1" > My Profile </a>
      </li>
      <li class="nav-item">
        <a class="nav-link " href="#" tabindex="-1" > Friends </a>
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
    <form action="./profile.jsp" method="POST">
      <label for="exampleFormControlTextarea6">Create a Post</label>
      <textarea class="form-control z-depth-1" id="exampleFormControlTextarea6" rows="3" name="postMessage" placeholder="Whats On Your Mind?"></textarea>
      <button type="submit" class="btn btn-secondary btn-sm">Post</button>
    </form>
  </div>
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

</body>
</html>
