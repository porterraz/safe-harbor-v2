-- Safe Harbor database schema
-- Source of truth: ERD.png in repo root.
-- Matches the ERD table names, columns, and data types.
-- Implementation note: ERD lists VARCHAR without length; this SQL uses
-- VARCHAR(255) as a practical default where length was unspecified.
-- Implementation note: `User`, `Session`, and `timestamp` are quoted because
-- they can collide with reserved words in some SQL dialects.

CREATE TABLE `User` (
  user_id INT PRIMARY KEY,
  passcode_hash VARCHAR(255),
  created_at DATETIME,
  is_student BOOLEAN,
  notification_pref BOOLEAN,
  email VARCHAR(255)
);

CREATE TABLE `Session` (
  session_id INT PRIMARY KEY,
  user_id INT,
  login_time DATETIME,
  device_type VARCHAR(255),
  interaction_count INT,
  CONSTRAINT fk_session_user
    FOREIGN KEY (user_id) REFERENCES `User`(user_id)
);

CREATE TABLE `Mood_Entry` (
  entry_id INT PRIMARY KEY,
  user_id INT,
  mood_rating INT,
  primary_emotion VARCHAR(255),
  entry_date DATETIME,
  CONSTRAINT fk_mood_entry_user
    FOREIGN KEY (user_id) REFERENCES `User`(user_id)
);

CREATE TABLE `Interactions` (
  interaction_id INT PRIMARY KEY,
  user_id INT,
  action_type VARCHAR(255),
  action_value VARCHAR(255),
  `timestamp` DATETIME,
  CONSTRAINT fk_interactions_user
    FOREIGN KEY (user_id) REFERENCES `User`(user_id)
);

CREATE TABLE `Contacts` (
  contact_id INT PRIMARY KEY,
  user_id INT,
  name VARCHAR(255),
  phone_number VARCHAR(255),
  relationship VARCHAR(255),
  is_active BOOLEAN,
  CONSTRAINT fk_contacts_user
    FOREIGN KEY (user_id) REFERENCES `User`(user_id)
);

CREATE TABLE `Resources` (
  resource_id INT PRIMARY KEY,
  title VARCHAR(255),
  category VARCHAR(255),
  target_url VARCHAR(255),
  icon_asset VARCHAR(255)
);

CREATE TABLE `Testimonials` (
  testimonial_id INT PRIMARY KEY,
  author_name VARCHAR(255),
  content TEXT,
  profile_pic VARCHAR(255),
  date_posted DATETIME,
  is_verified BOOLEAN
);
