CREATE DATABASE IF NOT EXISTS blog;
USE blog;

-- Table: blog.Users   
CREATE TABLE Users(
    id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(255) NOT NULL Unique,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


-- Table: blog.posts
CREATE TABLE Posts(
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    user_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(id) ON DELETE CASCADE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Table: blog.comments
CREATE TABLE Comments(
    id INT PRIMARY KEY AUTO_INCREMENT,
    post_id INT NOT NULL,
    user_id INT NOT NULL,
    comment TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (post_id) REFERENCES Posts(id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES Users(id) ON DELETE CASCADE
);


-- Insert some sample data into Users table

INSERT INTO Users(email,password) values ('natharka55@gmail.com','arka');


-- Insert some sample data into Posts table
INSERT INTO Posts(title,content,user_id) values ('My First Post','This is the content of my first post',1);


-- Insert some sample data into Comments table
INSERT INTO Comments(post_id,user_id,comment) values (1,1,'This is a comment on the first post');


-- -- Get all posts with user information
-- SELECT  u.id AS user_id, u.email as user_email,
--         p.id AS post_id, p.title as post_title,
--         c.id as comment_id,c.comment as comment

-- FROM Users as u
-- JOIN Posts as p ON p.user_id = u.id
-- JOIN Comments as c ON p.id = c.post_id
-- where c.user_id = u.id;

