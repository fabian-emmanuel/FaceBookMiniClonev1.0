package controllers;

import dao.PostDao;
import models.Comment;
import models.Post;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "ProfileServlet", value = "/ProfileServlet")
public class ProfileServlet extends HttpServlet {
    private PostDao postDao;

    public void init(){
        postDao = new PostDao();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        getServletContext()
                .getRequestDispatcher("/profile.jsp")
                .forward(request, response);
//        String route =  request.getServletPath();
//        System.out.println("user route " +  route);
//        switch (route){
//            case "/viewPosts":
//                showUserPosts(request, response);
//                break;
//            case "/like":
//                likeOrUnlikePost(request, response);
//                break;
//            case "/edit":
//                showEditPostPage(request, response);
//                break;
//            case "/delete":
//                deletePost(request, response);
//        }
    }

    private void deletePost(HttpServletRequest request, HttpServletResponse response) {
        try {
            int postId = Integer.parseInt(request.getParameter("postId"));
            boolean deletePost =  postDao.deletePost(postId);
            if (deletePost){
                System.out.println("Post Deleted");
            } else {
                System.out.println("Unable to delete post");
            }
            response.sendRedirect("./viewPosts");
        } catch (IOException throwables) {
            throwables.printStackTrace();
        }
    }

    private void showEditPostPage(HttpServletRequest request, HttpServletResponse response) {
        HttpSession httpSession =  request.getSession();
        int userId = (int) httpSession.getAttribute("userId");
        int postId  = Integer.parseInt(request.getParameter("postId"));
        String getPostContent =  postDao.getPostContentById(postId);
        try {
            RequestDispatcher requestDispatcher =  request.getRequestDispatcher("editPost.jsp");
            Post post =  new Post(postId, userId, getPostContent);
            request.setAttribute("postToEdit", post);
            requestDispatcher.forward(request, response);
        }  catch (ServletException  |IOException e) {
            e.printStackTrace();
        }
    }

    public void likeOrUnlikePost(HttpServletRequest request, HttpServletResponse response){
        int postId  =  Integer.parseInt(request.getParameter("postId"));
        HttpSession httpSession =  request.getSession();
        int userId = (int) httpSession.getAttribute("userId");
        try {
            postDao.likeOrUnlikeAPost(postId, userId);
            response.sendRedirect("./viewPosts");
        } catch (SQLException | IOException throwables) {
            throwables.printStackTrace();
        }
    }

    private void showUserPosts(HttpServletRequest request, HttpServletResponse response) {
        Map<Post, List<Comment>> userPosts;
        HttpSession httpSession =  request.getSession();
        int userId  =  (int) httpSession.getAttribute("userId");
        String userFirstName = (String)httpSession.getAttribute("userFirstName");
        System.out.println("UserId : " +  userId);
        System.out.println("userFirstName : " +  userFirstName);
        RequestDispatcher  requestDispatcher =  request.getRequestDispatcher("posts.jsp");
        try {
            userPosts = postDao.getAllPostOfAUser(userId);
            request.setAttribute("userPosts", userPosts);
            requestDispatcher.forward(request, response);
        } catch (SQLException | ServletException | IOException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response){
        String route = request.getServletPath();
        switch (route){
            case "/profile":
                createPost(request, response);
                break;
            case "/viewPosts":
                showUserPosts(request, response);
                break;
            case "/comment":
                createComment(request, response);
                break;
            case "/edit":
                updatePost(request, response);
        }
    }

    private void createPost(HttpServletRequest request, HttpServletResponse response) {
        HttpSession httpSession =  request.getSession();
        RequestDispatcher requestDispatcher =  request.getRequestDispatcher("posts.jsp");
        int  userID = (int) httpSession.getAttribute("userID");
        String message =  request.getParameter("postMessage");
        Post post = new Post(userID, message);
        boolean createPost;
        try {
            createPost = postDao.createPost(post);
            if(createPost){
                System.out.println("Post Created");
                response.sendRedirect("./viewPosts");
            } else {
                System.out.println("Unable to create your post");
            }
        } catch (IOException throwables) {
            throwables.printStackTrace();
        }
    }

    private void updatePost(HttpServletRequest request, HttpServletResponse response) {
        HttpSession httpSession =  request.getSession();
        int userId = (int) httpSession.getAttribute("userId");
        int postId =  Integer.parseInt(request.getParameter("postId"));
        String newPostContent =  request.getParameter("postMessage");
        Post editedPost =  new Post(postId, userId, newPostContent);
        boolean updatePost;
        updatePost = postDao.editPost(editedPost);
        if (updatePost) {
            System.out.println("post updated");
        } else {
            System.out.println("unable to  update post");
        }
        try {
            response.sendRedirect("./viewPosts");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void createComment(HttpServletRequest request, HttpServletResponse response) {
        try {
            HttpSession session = request.getSession();
            int userId = (int) session.getAttribute("userId");
            int postId = Integer.parseInt(request.getParameter("postId"));
            String _comment =  request.getParameter("comment");
            Comment comment =  new Comment(postId, userId, _comment);
            boolean createComment = postDao.createComment(comment);
            if (createComment){
                System.out.println("comment created");
            } else {
                System.out.println("Could not create comment");
            }
            response.sendRedirect("./viewPosts");
        }catch (IOException e) {
            e.printStackTrace();
        }
    }

}
