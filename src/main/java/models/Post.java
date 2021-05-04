package models;

import java.sql.Timestamp;

public class Post {
    private int postId;
    private int userId;
    private String message;
    private Timestamp date;
    private int totalLikes;
    private String delete;

    public Post(int postId, int userId, String message, Timestamp date, int totalLikes, String delete) {
        this.postId = postId;
        this.userId = userId;
        this.message = message;
        this.date = date;
        this.totalLikes = totalLikes;
        this.delete = delete;
    }

    public Post(int postId, int userId, String message) {
        this.postId = postId;
        this.userId = userId;
        this.message = message;
    }

    public Post(int userId, String message) {
        this.userId = userId;
        this.message = message;
    }

    public int getPostId() {
        return postId;
    }

    public void setPostId(int postId) {
        this.postId = postId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    public int getTotalLikes() {
        return totalLikes;
    }

    public void setTotalLikes(int totalLikes) {
        this.totalLikes = totalLikes;
    }

    public String getDelete() {
        return delete;
    }

    public void setDelete(String delete) {
        this.delete = delete;
    }

    @Override
    public String toString() {
        return "Post{" +
                "postId=" + postId +
                ", userId=" + userId +
                ", message='" + message + '\'' +
                ", date=" + date +
                ", totalLikes=" + totalLikes +
                ", delete='" + delete + '\'' +
                '}';
    }
}
