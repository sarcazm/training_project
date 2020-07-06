
CREATE TABLE IF NOT EXISTS Organization (
    id         INTEGER              COMMENT 'Уникальный идентификатор' PRIMARY KEY AUTO_INCREMENT ,
    name VARCHAR(50) NOT NULL COMMENT 'Имя',
    full_name VARCHAR(50) NOT NULL COMMENT 'Полное имя',
    inn    VARCHAR(10) NOT NULL     COMMENT 'ИНН',
    kpp    VARCHAR(9) NULL     COMMENT 'КПП',
    address VARCHAR(100) NOT NULL COMMENT 'Адрес',
    phone VARCHAR(10) NOT NULL COMMENT 'Телефон',
    is_active BOOLEAN NOT NULL COMMENT 'Активность'
);
COMMENT ON TABLE Organization IS 'Организация';

CREATE TABLE IF NOT EXISTS Office (
    id         INTEGER              COMMENT 'Уникальный идентификатор' PRIMARY KEY AUTO_INCREMENT ,
    organization_id INTEGER NOT NULL COMMENT 'Организация',
    name VARCHAR(50) NOT NULL COMMENT 'Полное имя',
    address VARCHAR(100) NOT NULL COMMENT 'Адрес',
    phone VARCHAR(10) NOT NULL COMMENT 'Телефон',
    is_active BOOLEAN NOT NULL COMMENT 'Активность'
);
COMMENT ON TABLE Office IS 'Офис';

CREATE INDEX IX_Office_Id ON Office (organization_id) ;
ALTER TABLE Office ADD FOREIGN KEY (organization_id) REFERENCES Organization(id);

CREATE TABLE IF NOT EXISTS Doc (
    id         INTEGER              COMMENT 'Уникальный идентификатор' PRIMARY KEY AUTO_INCREMENT ,
    name VARCHAR(50) NOT NULL COMMENT 'Имя',
    code VARCHAR(50) NOT NULL COMMENT 'Код'
);
COMMENT ON TABLE Doc IS 'Документ удостоверяющий личность';

CREATE TABLE IF NOT EXISTS Country (
    id         INTEGER              COMMENT 'Уникальный идентификатор' PRIMARY KEY AUTO_INCREMENT ,
    name VARCHAR(50) NOT NULL COMMENT 'Имя',
    code VARCHAR(50) NOT NULL COMMENT 'Код'
);
COMMENT ON TABLE Country IS 'Страна';

CREATE TABLE IF NOT EXISTS User (
    id         INTEGER              COMMENT 'Уникальный идентификатор' PRIMARY KEY AUTO_INCREMENT ,
    office_id VARCHAR(50) NOT NULL COMMENT 'Офис',
    first_name VARCHAR(50) NOT NULL COMMENT 'Имя',
    second_name VARCHAR(50) NOT NULL COMMENT 'Отчество',
    last_name VARCHAR(50) NOT NULL COMMENT 'Фамилия',
    middle_name VARCHAR(50) NOT NULL COMMENT 'Имя',
    position VARCHAR(50) NOT NULL COMMENT 'Должность',
    phone VARCHAR(10) NOT NULL COMMENT 'Телефон',
    is_identified BOOLEAN NOT NULL COMMENT 'Идентификация',
    doc_id INTEGER NOT NULL COMMENT 'Документ',
    doc_number VARCHAR(50) NOT NULL COMMENT 'Номер документа',
    doc_date DATE NOT NULL COMMENT 'Дата документа',
    country_id INTEGER NOT NULL COMMENT 'Страна'
);
COMMENT ON TABLE User IS 'Пользователь';

CREATE INDEX IX_Doc_Id ON User (doc_id) ;
ALTER TABLE User ADD FOREIGN KEY (doc_id) REFERENCES Doc(id);

CREATE INDEX IX_Country_Id ON User (country_id) ;
ALTER TABLE User ADD FOREIGN KEY (country_id) REFERENCES Country(id);