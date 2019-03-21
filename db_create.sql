CREATE TABLE USER_CREDENTIALS (
	USERNAME VARCHAR NOT NULL,
	EMAIL VARCHAR NOT NULL,
	PASSWORD VARCHAR NOT NULL,
	IS_CONFIRMED BOOL NOT NULL,
	PRIMARY KEY(USERNAME)
);

CREATE TABLE PROFILE(
	USERNAME VARCHAR NOT NULL,
	SCREEN_NAME VARCHAR NOT NULL,
	PROFILE_IMAGE_URL VARCHAR NOT NULL,
	PROFILE_BANNER_URL	VARCHAR NOT NULL,
	BIO TEXT NOT NULL,
	BIRTH_DATE DATE NOT NULL,
	CREATED_AT	TIMESTAMP NOT NULL,
	PRIMARY KEY(USERNAME),
	FOREIGN KEY(USERNAME) REFERENCES USER_CREDENTIALS
);

CREATE TABLE KWEEK (
	ID	SERIAL NOT NULL,
	CREATED_AT TIMESTAMP NOT NULL,
	TEXT TEXT NOT NULL,
	MEDIA_URL VARCHAR,
	USERNAME VARCHAR NOT NULL,
	REPLY_TO INT,
	PRIMARY KEY(ID),
	FOREIGN KEY(USERNAME) REFERENCES USER_CREDENTIALS,
  FOREIGN KEY(REPLY_TO) REFERENCES KWEEK ON DELETE CASCADE
);

CREATE TABLE REKWEEK(
	USERNAME VARCHAR NOT NULL,
	KWEEK_ID INT NOT NULL,
	CREATED_AT TIMESTAMP NOT NULL,
	PRIMARY KEY(USERNAME, KWEEK_ID),
	FOREIGN KEY(USERNAME) REFERENCES USER_CREDENTIALS,
	FOREIGN KEY(KWEEK_ID) REFERENCES KWEEK ON DELETE CASCADE
);

CREATE TABLE FAVORITE(
	USERNAME VARCHAR NOT NULL,
	KWEEK_ID INT NOT NULL,
	CREATED_AT TIMESTAMP NOT NULL,
	PRIMARY KEY(USERNAME, KWEEK_ID),
	FOREIGN KEY(USERNAME) REFERENCES USER_CREDENTIALS,
	FOREIGN KEY(KWEEK_ID) REFERENCES KWEEK ON DELETE CASCADE
);

CREATE TABLE HASHTAG(
	ID SERIAL NOT NULL,
	TEXT TEXT NOT NULL,
	PRIMARY KEY(ID)
);

CREATE TABLE KWEEK_HASHTAG(
	KWEEK_ID INT NOT NULL,
	HASHTAG_ID INT NOT NULL,
	STARTING_INDEX	INT NOT NULL,
	ENDING_INDEX INT NOT NULL,
	PRIMARY KEY(KWEEK_ID, HASHTAG_ID, STARTING_INDEX),
	FOREIGN KEY(KWEEK_ID) REFERENCES KWEEK ON DELETE CASCADE,
	FOREIGN KEY(HASHTAG_ID) REFERENCES HASHTAG
);

CREATE TABLE MENTION(
	KWEEK_ID INT NOT NULL,
	USERNAME VARCHAR NOT NULL,
	STARTING_INDEX INT NOT NULL,
	ENDING_INDEX INT NOT NULL,
	PRIMARY KEY(KWEEK_ID, USERNAME, STARTING_INDEX),
	FOREIGN KEY(KWEEK_ID) REFERENCES KWEEK ON DELETE CASCADE,
	FOREIGN KEY(USERNAME) REFERENCES USER_CREDENTIALS
);

CREATE TABLE FOLLOW(
	FOLLOWER_USERNAME VARCHAR NOT NULL,
	FOLLOWED_USERNAME VARCHAR NOT NULL,
	PRIMARY KEY(FOLLOWER_USERNAME, FOLLOWED_USERNAME),
	FOREIGN KEY(FOLLOWER_USERNAME) REFERENCES USER_CREDENTIALS,
	FOREIGN KEY(FOLLOWED_USERNAME) REFERENCES USER_CREDENTIALS
);

CREATE TABLE MUTE(
	MUTER_USERNAME VARCHAR NOT NULL,
	MUTED_USERNAME VARCHAR NOT NULL,
	PRIMARY KEY(MUTER_USERNAME, MUTED_USERNAME),
	FOREIGN KEY(MUTER_USERNAME) REFERENCES USER_CREDENTIALS,
	FOREIGN KEY(MUTED_USERNAME) REFERENCES USER_CREDENTIALS
);

CREATE TABLE BLOCK(
	BLOCKER_USERNAME VARCHAR NOT NULL,
	BLOCKED_USERNAME VARCHAR NOT NULL,
	PRIMARY KEY(BLOCKER_USERNAME, BLOCKED_USERNAME),
	FOREIGN KEY(BLOCKER_USERNAME) REFERENCES USER_CREDENTIALS,
	FOREIGN KEY(BLOCKED_USERNAME) REFERENCES USER_CREDENTIALS
);

CREATE TYPE NOTIFICATION_TYPE AS ENUM (
	'FOLLOW', 'REKWEEK', 'LIKE'
);

CREATE TABLE NOTIFICATION(
	ID SERIAL NOT NULL,
	CREATED_AT TIMESTAMP NOT NULL,
	NOTIFIED_USERNAME VARCHAR NOT NULL,
	INVOLVED_USERNAME VARCHAR NOT NULL,
	TYPE NOTIFICATION_TYPE NOT NULL,
	INVOLVED_KWEEK_ID INT,
	IS_SEEN BOOL NOT NULL,
	PRIMARY KEY(ID),
	FOREIGN KEY(NOTIFIED_USERNAME) REFERENCES USER_CREDENTIALS,
	FOREIGN KEY(INVOLVED_USERNAME) REFERENCES USER_CREDENTIALS,
	FOREIGN KEY(INVOLVED_KWEEK_ID) REFERENCES KWEEK
);

CREATE TABLE MESSAGE(
	ID SERIAL NOT NULL,
	FROM_USERNAME VARCHAR NOT NULL,
	TO_USERNAME VARCHAR NOT NULL,
	CREATED_AT TIMESTAMP NOT NULL,
	TEXT TEXT NOT NULL,
	MEDIA_URL VARCHAR,
	PRIMARY KEY(ID),
	FOREIGN KEY(FROM_USERNAME) REFERENCES USER_CREDENTIALS,
	FOREIGN KEY(TO_USERNAME) REFERENCES USER_CREDENTIALS
)