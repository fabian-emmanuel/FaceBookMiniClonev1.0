<%--
  Created by IntelliJ IDEA.
  User: decagon
  Date: 04/05/2021
  Time: 12:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!-- Icon used in this project are from https://www.iconfinder.com -->
<html lang="en" dir="ltr">
<head>
  <meta charset="utf-8">
  <title>FaceBook</title>
  <link rel="stylesheet" href="styles/bootstrap.min.css">
  <link rel="stylesheet" href="styles/style.css">
</head>
<body>
<nav class="navbar mb-5 navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="userpage.jsp"><b class="facebook">Java</b>Book</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">

      </ul>
      <div class="d-flex">
        <img class="profile-pic-icon mt-2" src="images/edema.jpeg" alt="">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="profile.jsp">@Username</a>
          </li>
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="#">
              <img class="create-post-icon" src="images/iconfinder_plus_4115237.png" alt=""></a>
          </li>
          <li class="nav-item">
            <a class="nav-link" aria-current="page" href="index.jsp">Logout</a>
          </li>

        </ul>
      </div>
    </div>
  </div>
</nav>
<div class="container">

  <div class="row">
    <div class="col-lg-3">
      <div class="shadow p-3 mb-5 bg-body rounded text-center">
        <img class="profile-pic-icon-three mt-4" src="images/edema.jpeg" alt="">
        <h5 class="mt-3">Edema 🚀 (_Lucid)</h5>
        <p>
          Web & UI/ UX Designer & WordPress Developer
        <p><img class="profile-info" src="images/iconfinder_link_227581.png" alt=""><a href="https://www.behance.net/the1edema" target="_blank">behance.net/the1edema</a></p>
        <p><img class="profile-info" src="images/iconfinder_calender_2944882.png" alt="">Born September 17</p>
        <p><img class="profile-info" src="images/iconfinder_user-alt_285645.png" alt=""> Joined May 2020</p>
      </div>
    </div>
    <div class="col-lg-6">

      <div class="shadow p-3 mb-5 bg-body rounded">
        <div class="row">
          <div class="col-lg-1">
            <img class="profile-pic-icon-two" src="images/edema.jpeg" alt="">
          </div>
          <div class="col-lg-11 text-right">
            <textarea class="form-control drag" placeholder="What's on your mind?"></textarea>
            <button class="btn btn-primary btn-md mt-3 btn-block">Post</button>
          </div>
        </div>
      </div>

      <div class="row">
        <div><h4 class="mb-4">Posts</h4></div>
      </div>
      <div id="section-one" class="shadow p-3 mb-5 bg-body rounded">
        <div class="row">
          <div class="post">
            <p><b>@Username1</b></p>
            <p>Learning  #SoftWareEngineering #Java @DecagonIns</p>
            Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
            Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
            <hr class="solid">
            <div class="row text-center">
              <div class="col-lg-6">
                <div class="">
                  <img class="like" src="images/iconfinder_Like_1417635.png" alt=""><span class="like-post">Like Post</span>
                </div>
              </div>
              <div class="col-lg-6">
                <div class="">
                  <img class="like" src="images/iconfinder___Message_1904663.png" alt=""><span class="comment">Comment</span>
                </div>
              </div>
            </div>
            <hr class="solid">
            <div class="row">
              <div class="col-md-11">

              </div>
              <div class="col-md-1">
                <a class="removepost" onclick="removesection_one()"><img class ="delete" src="images/iconfinder_delete_216170.png" alt=""></a>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div id ="section-two" class="shadow p-3 mb-5 bg-body rounded">
        <div class="row">
          <div class="post">
            <p><b>@UsernameTwo</b></p>
            <p>#Checkout one of my designs #Webdesigner</p>
            <img class="post-image" src="images/mywork-raiseyourbanner.png" alt="design">
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
              Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
            <hr class="solid">
            <div class="row text-center mb-3">
              <div class="col-lg-6">
                <div class="">
                  <img class="like" src="images/iconfinder_Like_1417635.png" alt=""><span class="like-post">Like Post</span>
                </div>
              </div>
              <div class="col-lg-6">
                <div class="">
                  <img class="like" src="images/iconfinder___Message_1904663.png" alt=""><span class="comment">Comment</span>
                </div>
              </div>

            </div>
            <hr class="solid">
            <div class="row">
              <div class="col-md-11">

              </div>
              <div class="col-md-1">
                <a on class="removepost" onclick="removesection_two()"><img class ="delete" src="images/iconfinder_delete_216170.png" alt=""></a>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div id ="section-three" class="shadow p-3 mb-5 bg-body rounded">
        <div class="row">
          <div class="post">
            <p><b>@UsernameThree</b></p>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
            </p>
            <p>#designthinking #agile</p>
            <hr class="solid">
            <div class="row text-center">
              <div class="col-lg-6">
                <div class="">
                  <img class="like" src="images/iconfinder_Like_1417635.png" alt=""><span class="like-post">Like Post</span>
                </div>
              </div>
              <div class="col-lg-6">
                <div class="">
                  <img class="like" src="images/iconfinder___Message_1904663.png" alt=""><span class="comment">Comment</span>
                </div>
              </div>
            </div>
            <hr class="solid">
            <div class="row">
              <div class="col-md-11">

              </div>
              <div class="col-md-1">
                <a class="removepost" onclick="removesection_three()"><img class ="delete" src="images/iconfinder_delete_216170.png" alt=""></a>
              </div>
            </div>
          </div>
        </div>
      </div>

    </div>
    <div class="col-lg-3">
      <div class="shadow p-3 mb-5 bg-body rounded">
        <h4>Activity</h4>
      </div>
    </div>
  </div>
</div>
<div class="container">
  <div class="row">
    <nav aria-label="...">
      <ul class="pagination justify-content-center">
        <li class="page-item">
          <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
        </li>
        <li class="page-item active"><a class="page-link" href="#">1</a></li>
        <li class="page-item" aria-current="page">
          <a class="page-link" href="#">2</a>
        </li>
        <li class="page-item"><a class="page-link" href="#">3</a></li>
        <li class="page-item">
          <a class="page-link" href="#">Next</a>
        </li>
      </ul>
    </nav>
  </div>
</div>
<footer class="text-center mt-5 mb-5">Java Book - 2021</footer>
<script type="text/javascript">

  function removesection_one(){
    document.getElementById('section-one').remove();
  }
  function removesection_two(){
    document.getElementById('section-two').remove();
  }
  function removesection_three(){
    document.getElementById('section-three').remove();
  }
</script>
</body>
</html>
