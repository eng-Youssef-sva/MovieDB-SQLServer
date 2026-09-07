CREATE DATABASE MovieDB;
GO

USE MovieDB;
GO
CREATE TABLE actor
(
act_id int primary key,
act_fname char(20),
act_lname char(20),
act_gender char(1),
) 
CREATE TABLE director
(
dir_id int primary key,
dir_fname char(20),
dir_lname char(20),
) 

CREATE TABLE movie (
    mov_id INT PRIMARY KEY,
    mov_title VARCHAR(50),
    mov_year INT,
    mov_time INT,
    mov_lang VARCHAR(50),
    mov_dt_rel DATE,
    mov_rel_country VARCHAR(5)
);

CREATE TABLE genres (
    gen_id INT PRIMARY KEY,
    gen_title VARCHAR(20)
);

CREATE TABLE reviewer (
    rev_id INT PRIMARY KEY,
    rev_name VARCHAR(30)
);

-- 3. إنشاء جداول الربط والعلاقات (Junction / Related Tables)

CREATE TABLE movie_cast (
    act_id INT,
    mov_id INT,
    role VARCHAR(30),
    FOREIGN KEY (act_id) REFERENCES actor(act_id),
    FOREIGN KEY (mov_id) REFERENCES movie(mov_id)
);

CREATE TABLE movie_direction (
    dir_id INT,
    mov_id INT,
    FOREIGN KEY (dir_id) REFERENCES director(dir_id),
    FOREIGN KEY (mov_id) REFERENCES movie(mov_id)
);

CREATE TABLE movie_genres (
    mov_id INT,
    gen_id INT,
    FOREIGN KEY (mov_id) REFERENCES movie(mov_id),
    FOREIGN KEY (gen_id) REFERENCES genres(gen_id)
);

CREATE TABLE rating (
    mov_id INT,
    rev_id INT,
    rev_stars INT,
    num_o_ratings INT,
    FOREIGN KEY (mov_id) REFERENCES movie(mov_id),
    FOREIGN KEY (rev_id) REFERENCES reviewer(rev_id)
);

















