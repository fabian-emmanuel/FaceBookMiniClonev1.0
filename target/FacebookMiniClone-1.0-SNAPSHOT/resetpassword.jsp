<%--
  Created by IntelliJ IDEA.
  User: decagon
  Date: 04/05/2021
  Time: 12:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta charset="utf-8">
    <title>FaceBook - Forgotten Password</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .container img {
            width: 18rem;
            height: 6rem;
            margin-left: -38px;
        }
        .container p {
            margin-top: 0.5rem;
            FONT-FAMILY:SFProDisplay-Regular, Helvetica, Arial, sans-serif;
            FONT-SIZE: 28px;
            LINE-HEIGHT : 32px;
        }
    </style>
</head>
<body>
<main role="main" class="flex-shrink-0" id="left">
    <div class="container">
        <h1 class="mt-5"><img src="https://static.xx.fbcdn.net/rsrc.php/y8/r/dF5SId3UHWd.svg" alt="facebook"></h1>
        <p class="lead">Facebook helps you connect and share<br> with the people in your life.</p>
    </div>
</main>

<div class="container mt-5">
    <div class="row welcome">
        <div class="col-lg-5">
            <div class="shadow p-3 mb-5 bg-body rounded">

                <form class="" action="index.jsp" method="post">
                    <h4 class="mt-3 mb-4">Reset Password</h4>
                    <p>Please enter your email address to reset your account password.</p>
                    <label>
                        <input class="form-control mb-3" type="text" name="" value="" placeholder="Email Address">
                    </label>
                    <div class="d-grid gap-2 mt-3">
                        <a href="profile.jsp" class="btn btn-primary btn-lg">Reset Password</a>
                        <div class="divider"></div>
                        <a href ="index.jsp" class="btn btn-green btn-lg mt-3 mb-3">Login</a>

                    </div>
                </form>

            </div>

        </div>

    </div>

</div>

</body>
</html>
