DROP TABLE IF EXISTS building CASCADE;
DROP SEQUENCE IF EXISTS building_id_seq;
CREATE TABLE building
(
    id long auto_increment NOT NULL PRIMARY KEY,
    name varchar(50)
);

DROP TABLE IF EXISTS picture CASCADE;
DROP SEQUENCE IF EXISTS picture_id_seq;
CREATE TABLE picture
(
    id          long auto_increment NOT NULL PRIMARY KEY,
    name        varchar(50),
    building_id long
);


ALTER TABLE picture
    ADD FOREIGN KEY (building_id)
        REFERENCES building (id)
        ON DELETE SET NULL;


DROP TABLE IF EXISTS room CASCADE;
DROP SEQUENCE IF EXISTS room_id_seq;
CREATE TABLE room
(
    id          long auto_increment                                         NOT NULL PRIMARY KEY,
    building_id long,
    house_type  ENUM ('GRYFFINDOR', 'HUFFLEPUFF', 'RAVENCLAW', 'SLYTHERIN') NOT NULL,
    places      integer                                                     NOT NULL,
    is_messy    BOOLEAN DEFAULT TRUE
);

ALTER TABLE room
    ADD FOREIGN KEY (building_id)
        REFERENCES building (id)
        ON DELETE SET NULL;

DROP TABLE IF EXISTS student CASCADE;
DROP SEQUENCE IF EXISTS student_id_seq;
CREATE TABLE student
(
    id         long auto_increment                                         NOT NULL PRIMARY KEY,
    name       varchar(50),
    house_type ENUM ('GRYFFINDOR', 'HUFFLEPUFF', 'RAVENCLAW', 'SLYTHERIN') NOT NULL,
    pet_type   ENUM ('CAT', 'RAT', 'OWL', 'NONE')                          NOT NULL
);

DROP TABLE IF EXISTS resident CASCADE;
CREATE TABLE resident
(
    student_id long NOT NULL,
    room_id    long NOT NULL
);

ALTER TABLE resident
    ADD FOREIGN KEY (student_id)
        REFERENCES student (id)
        ON DELETE SET NULL;

ALTER TABLE resident
    ADD FOREIGN KEY (room_id)
        REFERENCES room (id)
        ON DELETE SET NULL;

DROP TABLE IF EXISTS recipe CASCADE;
DROP SEQUENCE IF EXISTS recipe_id_seq;
CREATE TABLE recipe
(
    id   long auto_increment NOT NULL PRIMARY KEY,
    name varchar(255)
);

DROP TABLE IF EXISTS ingredients CASCADE;
DROP SEQUENCE IF EXISTS ingredients_id_seq;
CREATE TABLE ingredients
(
    id          long auto_increment NOT NULL PRIMARY KEY,
    name        enum('ANJELICA', 'CATERPILLAR', 'EYEBALL', 'SLOTH_BRAIN', 'RAT_HAIR', 'WITCH_MUMMY', 'FLUXWEED', 'KNOTGRASS', 'LACEWING_FLIES', 'LEECHES', 'HORN_OF_BICORN', 'BOOMSLANG_SKIN', 'PHILOSOPHERS_STONE', 'UNICORN_HAIR', 'FAIRY_WINGS', 'ROSE_PETALS', 'MORNING_DEW', 'GINGER_ROOTS'),
    recipe_id   long
);


ALTER TABLE ingredients
    ADD FOREIGN KEY (recipe_id)
        REFERENCES recipe (id)
        ON DELETE SET NULL;


DROP TABLE IF EXISTS studentrecipes CASCADE;
CREATE TABLE studentrecipes
(
    student_id long NOT NULL,
    recipe_id    long NOT NULL
);

ALTER TABLE studentrecipes
    ADD FOREIGN KEY (student_id)
        REFERENCES student (id)
        ON DELETE SET NULL;

ALTER TABLE studentrecipes
    ADD FOREIGN KEY (recipe_id)
        REFERENCES recipe (id)
        ON DELETE SET NULL;


