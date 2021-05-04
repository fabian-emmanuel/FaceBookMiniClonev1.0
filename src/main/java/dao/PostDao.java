package dao;

import models.Comment;
import models.Post;
import java.sql.*;
import java.util.*;

import static driver.DBConnection.*;

public class PostDao {
    //Posts
    String createPostMysql = "INSERT INTO posts (userId, message) VALUES (?,?);";
    String getUserPostMySql = "SELECT posts.postId, posts.userId, posts.message, posts.date, " +
            "count(likes.likesId) as totalLikes \n" +
            "FROM posts \n" +
            "LEFT JOIN likes ON \n" +
            "posts.postId = likes.postId " +
            "WHERE posts.deleted = 'false' " +
            "AND posts.userId = ? \n" +
            "GROUP BY postId \n" +
            "AND posts.date DESC;";
    String likePostMySQl = "INSERT INTO likes (postId, userId) VALUES(?, ?)";
    String unlikePostMySql = "DELETE  FROM likes  WHERE postId = ? AND userId = ?";
    String getPostLikesMySQL = "SELECT * FROM  likes WHERE postId = ? AND userId = ?";
    String getPostContentByIdMySql = "SELECT message from  posts WHERE postID = ?";

    String editPostMySql  = "UPDATE posts SET message = ? WHERE postId = ?";
    String deletePostMySql = "UPDATE posts SET deleted = ?  WHERE postId = ?";

    //comments
    String createCommentMySql = "INSERT INTO comments (commentId, userId, comment) VALUES (?, ?, ?)";
    String likeCommentMySql = "INSERT INTO likes (commentId, userId, comment) VALUES(?, ?, ?)";
    String unlikeCommentMySql = "DELETE  FROM likes  WHERE commentId = ? AND userId = ?";
    String getCommentLikesMySql = "SELECT * FROM likes WHERE commentId = ? AND userId = ?";
    String getCommentsMySql = "SELECT comments.postId, comments.userId, comments.commentId, comments.comment, comments.date,"+
            "count(likes.likesId) as totalLikes \n" +
            "FROM comments \n" +
            "LEFT JOIN likes ON \n" +
            "comments.commentid = likes.commentId " +
            "WHERE comments.deleted = 'false'"+
            "AND comments.postId = ? \n" +
            "GROUP BY commentId \n" +
            "AND comments.date DESC;";

    String editCommentMySql = "UPDATE comments SET comment = ? WHERE commentId = ?";
    String deleteCommentMySql = "UPDATE comments SET deleted = ? WHERE commentId = ?";

    public boolean createPost(Post post){
        boolean verbose = false;
        PreparedStatement statement;
        try (Connection connection = getConnection()) {
            statement = connection.prepareStatement(createPostMysql);
            statement.setInt(1, post.getUserId());
            statement.setString(2, post.getMessage());
            statement.execute();
            verbose = true;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return verbose;
    }

    public boolean editPost(Post post){
        boolean verbose = false;
        PreparedStatement statement;
        try (Connection connection = getConnection()) {
            statement = connection.prepareStatement(editPostMySql);
            statement.setString(1, post.getMessage());
            statement.setInt(2, post.getPostId());
            statement.execute();
            verbose = true;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return verbose;
    }

    public boolean deletePost(int postId){
        boolean successful =  false;
        PreparedStatement statement;
        try (Connection connection = getConnection()) {
            statement = connection.prepareStatement(deletePostMySql);
            statement.setString(1, "true");
            statement.setInt(2, postId);
            boolean deletePost = statement.execute();
            if(deletePost) successful = true;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return successful;
    }

    public void likeOrUnlikeAPost(int postId, int userId) throws SQLException {
        Connection connection = getConnection();
        PreparedStatement statement = connection.prepareStatement(getPostLikesMySQL);
        statement.setInt(1, postId);
        statement.setInt(2, userId);
        ResultSet resultSet = statement.executeQuery();
        if (!resultSet.next()){
            PreparedStatement _statement = connection.prepareStatement(likePostMySQl);
            _statement.setInt(1, postId);
            _statement.setInt(2, userId);
            _statement.execute();
        }
        else{
            PreparedStatement _statement = connection.prepareStatement(unlikePostMySql);
            _statement.setInt(1, postId);
            _statement.setInt(2, userId);
            _statement.execute();
        }
    }

    public Map<Post, List<Comment>> getAllPostOfAUser(int userId) throws SQLException {
        Map<Post, List<Comment>> userAllPosts = new LinkedHashMap<>();
        Connection connection = getConnection();
        PreparedStatement statement = connection.prepareStatement(getUserPostMySql);
        statement.setInt(1, userId);
        ResultSet resultSet = statement.executeQuery();

        while(resultSet.next()){
            int postId = resultSet.getInt("postId");
            String message = resultSet.getString("message");
            int totalLikes = resultSet.getInt("totalLikes");
            Timestamp date = resultSet.getTimestamp("date");
            Post post =  new Post(postId, userId, message, date, totalLikes, "No" );
            List<Comment> postComment = getComments(postId);
            userAllPosts.put(post, postComment);
        }
        return userAllPosts;
    }

    public String getPostContentById(int postId)  {
        String postContent = "";
        try(Connection connection  = getConnection()) {
            PreparedStatement statement =  connection.prepareStatement(getPostContentByIdMySql);
            statement.setInt(1, postId);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()){
                postContent =  resultSet.getString("message");
                System.out.println("Post Content = " + postContent);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Unable to get post Content");
        }
        return postContent;
    }

    public boolean createComment(Comment comment){
        boolean verbose = false;
        PreparedStatement statement;
        try (Connection connection = getConnection()) {
            statement = connection.prepareStatement(createCommentMySql);
            statement.setInt(1, comment.getPostId());
            statement.setInt(2, comment.getUserId());
            statement.setString(3, comment.getComment());
            statement.execute();
            verbose = true;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return verbose;
    }

    public void editComment(Comment comment) throws SQLException {
        Connection connection = getConnection();
        PreparedStatement statement = connection.prepareStatement(editCommentMySql);
        statement.setString(1, comment.getComment());
        statement.setInt(2, comment.getCommentId());
        statement.execute();
    }

    public void deleteComment(Comment comment) throws SQLException {
        Connection connection = getConnection();
        PreparedStatement statement = connection.prepareStatement(deleteCommentMySql);
        statement.setString(1, "true");
        statement.setInt(2, comment.getCommentId());
        statement.execute();
    }

    public void likeOrUnlikeAComment(int commentId, int userId) throws SQLException {
        Connection connection = getConnection();
        PreparedStatement statement = connection.prepareStatement(getCommentLikesMySql);
        statement.setInt(1, commentId);
        statement.setInt(2, userId);
        ResultSet resultSet = statement.executeQuery();
        if(!resultSet.next()){
            PreparedStatement _statement = connection.prepareStatement(likeCommentMySql);
            _statement.setInt(1, commentId);
            _statement.setInt(2, userId);
            _statement.execute();
        }
        else {
            PreparedStatement _statement = connection.prepareStatement(unlikeCommentMySql);
            _statement.setInt(1, commentId);
            _statement.setInt(2, userId);
            _statement.execute();
        }
    }

    public List<Comment> getComments(int postId) throws SQLException {
        List<Comment> commentList = new ArrayList<>();
        Connection connection = getConnection();
        PreparedStatement statement = connection.prepareStatement(getCommentsMySql);
        statement.setInt(1, postId);
        ResultSet resultSet = statement.executeQuery();
        while (resultSet.next()){
            int commentId = resultSet.getInt("commentId");
            int _postId = resultSet.getInt("postId");
            int userId = resultSet.getInt("userId");
            String _comment = resultSet.getString("comment");
            int totalLikes = resultSet.getInt("totalLikes");
            Timestamp date = resultSet.getTimestamp("date");
            Comment comment = new Comment(commentId, _postId, userId, _comment, date, totalLikes, "No");
            commentList.add(comment);
        }
        return commentList;
    }
}
