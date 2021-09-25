-- Your database schema. Use the Schema Designer at http://localhost:8001/ to add some tables.
CREATE TYPE bid_status AS ENUM ('accepted', 'rejected');
CREATE TABLE items (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    title TEXT NOT NULL,
    price INT NOT NULL
);
CREATE TABLE bids (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    item_id UUID NOT NULL,
    status bid_status NOT NULL,
    price INT NOT NULL
);
CREATE INDEX bids_item_id_index ON bids (item_id);
ALTER TABLE bids ADD CONSTRAINT bids_ref_item_id FOREIGN KEY (item_id) REFERENCES items (id) ON DELETE NO ACTION;
