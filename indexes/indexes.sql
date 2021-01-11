------------------------------ALBUMS_INDEXES------------------------------------
CREATE INDEX ALBUMS_USER_ID_INDEX ON ALBUMS(USER_ID);
------------------------------PHOTOS_INDEXES------------------------------------
CREATE INDEX PHOTOS_ALBUM_ID_INDEX ON PHOTOS(ALBUM_ID);
------------------------------COMMENTS_INDEXES----------------------------------
CREATE INDEX COMMENTS_PHOTO_ID_INDEX ON COMMENTS(PHOTO_ID);
------------------------------MESSAGES_INDEXES----------------------------------
CREATE INDEX MESSAGES_DIALOG_ID_INDEX ON MESSAGES(DIALOG_ID);
------------------------------USERS_INDEXES-------------------------------------
CREATE INDEX USERS_NAME_INDEX ON USERS(FIRST_NAME,LAST_NAME);
--------------------------------------------------------------------------------
DROP INDEX ALBUMS_USER_ID_INDEX;
DROP INDEX PHOTOS_ALBUM_ID_INDEX;
DROP INDEX COMMENTS_PHOTO_ID_INDEX;
DROP INDEX MESSAGES_DIALOG_ID_INDEX;
DROP INDEX USERS_NAME_INDEX;
--------------------------------------------------------------------------------
SELECT * FROM USER_INDEXES;






