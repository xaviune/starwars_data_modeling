-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE `Users` (
    `user_id` int  NOT NULL ,
    `user_nickname` varchar(20)  NOT NULL ,
    `user_password` varchar(60)  NOT NULL ,
    `user_email` varchar(50)  NOT NULL ,
    `user_name` varchar(30)  NOT NULL ,
    `user_lastname` varchar(30)  NOT NULL ,
    `user_datecreated` date  NOT NULL ,
    PRIMARY KEY (
        `user_id`
    ),
    CONSTRAINT `uc_Users_user_nickname` UNIQUE (
        `user_nickname`
    )
);

CREATE TABLE `Characters` (
    `char_id` int  NOT NULL ,
    `char_name` varchar(20)  NOT NULL ,
    `char_url` varchar(512)  NOT NULL ,
    PRIMARY KEY (
        `char_id`
    )
);

CREATE TABLE `Planets` (
    `planet_id` int  NOT NULL ,
    `planet_name` varchar(20)  NOT NULL ,
    `planet_url` varchar(512)  NOT NULL ,
    PRIMARY KEY (
        `planet_id`
    )
);

CREATE TABLE `Favorite_Characters` (
    `id` int  NOT NULL ,
    `user_id` int  NOT NULL ,
    `char_id` int  NOT NULL ,
    PRIMARY KEY (
        `id`
    )
);

CREATE TABLE `Favorite_Planets` (
    `id` int  NOT NULL ,
    `user_id` int  NOT NULL ,
    `planet_id` int  NOT NULL ,
    PRIMARY KEY (
        `id`
    )
);

ALTER TABLE `Favorite_Characters` ADD CONSTRAINT `fk_Favorite_Characters_user_id` FOREIGN KEY(`user_id`)
REFERENCES `Users` (`user_id`);

ALTER TABLE `Favorite_Characters` ADD CONSTRAINT `fk_Favorite_Characters_char_id` FOREIGN KEY(`char_id`)
REFERENCES `Characters` (`char_id`);

ALTER TABLE `Favorite_Planets` ADD CONSTRAINT `fk_Favorite_Planets_user_id` FOREIGN KEY(`user_id`)
REFERENCES `Users` (`user_id`);

ALTER TABLE `Favorite_Planets` ADD CONSTRAINT `fk_Favorite_Planets_planet_id` FOREIGN KEY(`planet_id`)
REFERENCES `Planets` (`planet_id`);

