
INSERT INTO USER_CREDENTIALS(USERNAME, PASSWORD, EMAIL, IS_CONFIRMED) VALUES
('user1', '$2b$12$/naY78xtO3Za9yefRig8Ueh/6qHIUt5wXSrFaHd96pwhZgRoWTiVm', 'test_user1@test.com', TRUE),
('user2', '$2b$12$/naY78xtO3Za9yefRig8Ueh/6qHIUt5wXSrFaHd96pwhZgRoWTiVm', 'test_user3@test.com', TRUE),
('user3', '$2b$12$/naY78xtO3Za9yefRig8Ueh/6qHIUt5wXSrFaHd96pwhZgRoWTiVm', 'test_user3@test.com', TRUE);

INSERT INTO PROFILE(USERNAME, SCREEN_NAME, PROFILE_IMAGE_URL, PROFILE_BANNER_URL, BIO, CREATED_AT, BIRTH_DATE)
VALUES
('user1', 'test1', 'image_url', 'banner_url', 'bio', '01-01-2019', '01-01-1999'),
('user2', 'test2', 'image_url', 'banner_url', 'bio', '01-01-2019', '01-01-1999'),
('user3', 'test3', 'image_url', 'banner_url', 'bio', '01-01-2019', '01-01-1999'),
('hagar', 'test1', 'image_url', 'banner_url', 'bio', '01-01-2019', '01-01-1999');


INSERT INTO FOLLOW VALUES
('user1', 'user3'),
('user2', 'user3'),
('user3', 'user1');

INSERT INTO MUTE VALUES
('user1', 'user3');

INSERT INTO BLOCK VALUES
('user2', 'user1');

INSERT INTO KWEEK(CREATED_AT, TEXT, USERNAME, REPLY_TO) VALUES
('01-01-2010', 'spare test', 'user1', null)

