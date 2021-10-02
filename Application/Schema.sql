-- Your database schema. Use the Schema Designer at http://localhost:8001/ to add some tables.
CREATE TYPE bid_status AS ENUM ('accepted', 'rejected');
CREATE TYPE bid_type AS ENUM ('mail', 'auto_mail', 'internet', 'agent', 'auto_agent');
CREATE TYPE item_status AS ENUM ('active', 'inactive');
CREATE TABLE users (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    email TEXT NOT NULL,
    password_hash TEXT NOT NULL,
    locked_at TIMESTAMP WITH TIME ZONE DEFAULT NULL,
    failed_login_attempts INT DEFAULT 0 NOT NULL
);
CREATE TABLE items (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    title TEXT NOT NULL,
    status item_status NOT NULL,
    bis_steps_id UUID[] DEFAULT '{}' NOT NULL
);
CREATE TABLE bids (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    item_id UUID NOT NULL,
    status bid_status NOT NULL,
    price INT NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL,
    bid_type bid_type NOT NULL
);
CREATE INDEX bids_item_id_index ON bids (item_id);
CREATE TABLE bid_steps (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    min INT NOT NULL,
    max INT NOT NULL,
    step INT NOT NULL
);
ALTER TABLE bids ADD CONSTRAINT bids_ref_item_id FOREIGN KEY (item_id) REFERENCES items (id) ON DELETE NO ACTION;
