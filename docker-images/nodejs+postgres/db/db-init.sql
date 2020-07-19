CREATE TABLE accounts_tbl(
  account_id BIGSERIAL PRIMARY KEY,
  first_name VARCHAR(64) NOT NULL,
  last_name VARCHAR(64) NOT NULL, 
  email_address VARCHAR(256) NOT NULL UNIQUE,
  password_hash VARCHAR(512) NOT NULL,
  account_created_time_utc TIMESTAMPTZ DEFAULT NOW()
);

INSERT INTO accounts_tbl(first_name, last_name, email_address, password_hash) VALUES(
  'John',
  'Doe',
  'john.doe@email.com',
  '$2b$08$f8v.elIjKkbBdeBvCKX66ej/svbBcexo28.gfplFH8K4hyKtFkM0C'
);