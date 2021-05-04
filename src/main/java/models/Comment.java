package models;

import java.sql.Timestamp;

public class Comment {
    private int commentId;
    private int postId;
    private int userId;
    private String comment;

    private int totalLikes;

    private String deleted;
    private Timestamp date;
    public Comment(int commentId, int postId, int userId, String comment, Timestamp date, int totalLikes, String deleted) {
        this.commentId = commentId;
        this.postId = postId;
        this.userId = userId;
        this.comment = comment;
        this.date = date;
        this.totalLikes = totalLikes;
        this.deleted = deleted;
    }

    public Comment(int postId, int userId, String comment, Timestamp date) {
        this.postId = postId;
        this.userId = userId;
        this.comment = comment;
        this.date = date;
    }

    public Comment(int postId, int userId, String comment) {
        this.postId = postId;
        this.userId = userId;
        this.comment = comment;
    }

    public int getCommentId() {
        return commentId;
    }

    public void setCommentId(int commentId) {
        this.commentId = commentId;
    }

    public int getTotalLikes() {
        return totalLikes;
    }

    public String getDeleted() {
        return deleted;
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

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "commentId=" + commentId +
                ", postId=" + postId +
                ", userId=" + userId +
                ", comment='" + comment + '\'' +
                ", date=" + date +
                '}';
    }
}
