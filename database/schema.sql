CREATE TABLE account (
    id BIGINT(20) PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    address1 VARCHAR(255),
    address2 VARCHAR(255),
    city VARCHAR(255),
    state VARCHAR(255),
    postal_code VARCHAR(255),
    phone_number VARCHAR(255)
);

CREATE TABLE authority (
    account_id BIGINT(20) NOT NULL,
    authority varchar(255) NOT NULL,
    constraint authority_account_id_fk
        foreign key (account_id) references account (id)
);

CREATE UNIQUE INDEX ix_authority_account_id ON authority (account_id, authority);

CREATE TABLE product (
    id BIGINT(20) PRIMARY KEY AUTO_INCREMENT,
    slug VARCHAR(255) NOT NULL UNIQUE,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(1000)
);

CREATE TABLE item (
    id BIGINT(20) PRIMARY KEY AUTO_INCREMENT,
    product_id BIGINT(20) NOT NULL,
    price INT(11) NOT NULL,
    stock INT(11) NOT NULL
);

CREATE SEQUENCE order_sequence;

CREATE TABLE orders (
    id BIGINT(20) PRIMARY KEY,
    account_id BIGINT(20) NOT NULL,
    order_date DATETIME(6) NOT NULL,
    total_price INT(11) NOT NULL,
    status VARCHAR(255) NOT NULL,
    address1 VARCHAR(255),
    address2 VARCHAR(255),
    city VARCHAR(255),
    state VARCHAR(255),
    postal_code VARCHAR(255)
);

CREATE TABLE orderline (
    id BIGINT(20) PRIMARY KEY AUTO_INCREMENT,
    order_id BIGINT(20) NOT NULL,
    item_id BIGINT(20) NOT NULL,
    line_number INT(11),
    price INT(11),
    quantity INT(11)
);