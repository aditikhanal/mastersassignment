--PART B SOLUTION

--Table creation

CREATE TABLE User (
    userId VARCHAR(10) PRIMARY KEY,
    name VARCHAR(50),
    emailAddress VARCHAR(100)
);

CREATE TABLE Music (
    musicId VARCHAR(10) PRIMARY KEY,
    title VARCHAR(100),
    categoryCode VARCHAR(5),
    costPerDownload DECIMAL(10, 2),
    FOREIGN KEY (categoryCode) REFERENCES Category(categoryCode)
);


CREATE TABLE DownloadMusic (
    userId VARCHAR(10),
    musicId VARCHAR(10),
    downloadDate DATE,
    FOREIGN KEY (userId) REFERENCES User(userId),
    FOREIGN KEY (musicId) REFERENCES Music(musicId),
    PRIMARY KEY (userId, musicId)
);

CREATE TABLE Category (
    categoryCode VARCHAR(5) PRIMARY KEY,
    title VARCHAR(50)
);

---Table insertion

INSERT ALL
    INTO User (userId, name, emailAddress) VALUES ('wayne10', 'Wayne, R', 'wayne@hotmail.co.uk')
    INTO User (userId, name, emailAddress) VALUES ('santos17', 'Santos, C', 'santos@ntl.co.uk')
    INTO User (userId, name, emailAddress) VALUES ('hary05', 'Hary, M', 'hary@freeserve.co.uk')
    INTO User (userId, name, emailAddress) VALUES ('margot9', 'Margot, C', 'margot9@msn.co.uk')
    INTO User (userId, name, emailAddress) VALUES ('mount77', 'Mount, M', 'mount@hotmail.co.uk')
    INTO User (userId, name, emailAddress) VALUES ('nancy91', 'Nancy, L', 'nancy91@tesco.co.uk')
SELECT * FROM dual;

INSERT ALL
    INTO Music (musicId, title, categoryCode, costPerDownload) VALUES ('M001', 'Born to run', 'MO13', 0.99)
    INTO Music (musicId, title, categoryCode, costPerDownload) VALUES ('M002', 'Crawling', 'MO13', 1.99)
    INTO Music (musicId, title, categoryCode, costPerDownload) VALUES ('M003', 'You’re Beautiful', 'MO11', 1.49)
    INTO Music (musicId, title, categoryCode, costPerDownload) VALUES ('M004', 'Summer of 69', 'MO11', 1.79)
    INTO Music (musicId, title, categoryCode, costPerDownload) VALUES ('M005', 'Crazy Train', 'MO13', 1.50)
    INTO Music (musicId, title, categoryCode, costPerDownload) VALUES ('M006', 'Yellow Submarine', 'MO12', 1.10)
    INTO Music (musicId, title, categoryCode, costPerDownload) VALUES ('M007', 'Got to be there', 'MO12', 0.89)
SELECT * FROM dual;

INSERT ALL
    INTO DownloadMusic (userId, musicId, downloadDate) VALUES ('wayne10', 'M002', TO_DATE('2021-05-03', 'YYYY-MM-DD'))
    INTO DownloadMusic (userId, musicId, downloadDate) VALUES ('margot9', 'M005', TO_DATE('2022-05-01', 'YYYY-MM-DD'))
    INTO DownloadMusic (userId, musicId, downloadDate) VALUES ('santos17', 'M002', TO_DATE('2021-05-06', 'YYYY-MM-DD'))
    INTO DownloadMusic (userId, musicId, downloadDate) VALUES ('margot9', 'M001', TO_DATE('2022-05-06', 'YYYY-MM-DD'))
    INTO DownloadMusic (userId, musicId, downloadDate) VALUES ('wayne10', 'M003', TO_DATE('2022-08-01', 'YYYY-MM-DD'))
    INTO DownloadMusic (userId, musicId, downloadDate) VALUES ('mount77', 'M004', TO_DATE('2022-08-02', 'YYYY-MM-DD'))
    INTO DownloadMusic (userId, musicId, downloadDate) VALUES ('nancy91', 'M007', TO_DATE('2021-09-05', 'YYYY-MM-DD'))
SELECT * FROM dual;

INSERT ALL
    INTO Category (categoryCode, title) VALUES ('MO11', 'Love')
    INTO Category (categoryCode, title) VALUES ('MO12', 'Pop')
    INTO Category (categoryCode, title) VALUES ('MO13', 'Rock')
SELECT * FROM dual;

--Query 1

SELECT musicId, title, categoryCode
FROM Music
ORDER BY title;

--Query 2

SELECT COUNT(DISTINCT dm.userId) AS num_users_downloaded
FROM DownloadMusic dm
JOIN Music m 
ON dm.musicId = m.musicId
JOIN Category c 
ON m.categoryCode = c.categoryCode
WHERE c.title = 'Pop-Rock';

--Query 3

SELECT c.title AS category_title, COUNT(dm.musicId) AS num_downloads
FROM DownloadMusic dm
JOIN Music m 
ON dm.musicId = m.musicId
JOIN Category c 
ON m.categoryCode = c.categoryCode
GROUP BY c.title;


--Query 4

SELECT c.title AS category_title
FROM DownloadMusic dm
JOIN Music m 
ON dm.musicId = m.musicId
JOIN Category c 
ON m.categoryCode = c.categoryCode
GROUP BY c.title
HAVING COUNT(dm.musicId) > 1;






