PRAGMA foreign_keys=OFF;

BEGIN TRANSACTION;

CREATE TABLE language
(
	id int not null
		constraint language_pk
			primary key,
	long_form varchar(255) not null,
	short_form varchar(255) not null);

CREATE TABLE synset
(
	id int not null

		constraint synset_pk

			primary key,

	description varchar(255) default NULL

);

CREATE TABLE term
(
	id int not null

		constraint term_pk

			primary key,

	language_id int not null,

	synset_id int not null,

	word varchar(255) not null

);
CREATE INDEX idx_language__index
	on language (id);
CREATE UNIQUE INDEX language_long_form_uindex
	on language (long_form);
CREATE UNIQUE INDEX language_short_form_uindex
	on language (short_form);
CREATE UNIQUE INDEX synset_id_uindex
	on synset (id);
CREATE UNIQUE INDEX term_id_uindex
	on term (id);
CREATE INDEX term_synset_id_uindex
	on term (synset_id);

COMMIT;