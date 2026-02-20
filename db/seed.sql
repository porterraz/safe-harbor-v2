-- Seed data for Safe Harbor schema
-- Insert order respects FK dependencies.

-- Optional reset for repeatable local seeding
DELETE FROM `Interactions`;
DELETE FROM `Mood_Entry`;
DELETE FROM `Contacts`;
DELETE FROM `Session`;
DELETE FROM `Testimonials`;
DELETE FROM `Resources`;
DELETE FROM `User`;

INSERT INTO `User` (
  user_id,
  passcode_hash,
  created_at,
  is_student,
  notification_pref,
  email
) VALUES
  (1001, '$2b$10$k9A4mD2v3jQf1x7L0nR5OuQ6j8dY7tP2mV1rS4eN9hT3wC5bZ0aUe', '2026-02-10 09:12:00', TRUE, TRUE, 'maya.chen@campusmail.edu'),
  (1002, '$2b$10$J3pN8sR2vL5dQ1mT9xH4WeY7uK6cF0aB3nP8tR5mL2qV1xD7sH9z', '2026-01-28 14:47:00', TRUE, FALSE, 'jordan.rivera@campusmail.edu'),
  (1003, '$2b$10$W7dK3pM9vR1xT5nQ2sL8CeU4hY6bF0jP3aD9mV2tL7qN1rS5xB8c', '2026-02-02 20:05:00', FALSE, TRUE, 'alex.torres@gmail.com'),
  (1004, '$2b$10$R4nT1vM8qD6sL2xP9hK3WeY5uC7bF0jA2mN8tR6pL1qV5dS9xH3z', '2026-02-14 07:30:00', TRUE, TRUE, 'sam.patel@campusmail.edu');

INSERT INTO `Session` (
  session_id,
  user_id,
  login_time,
  device_type,
  interaction_count
) VALUES
  (5001, 1001, '2026-02-18 08:02:00', 'iPhone 15 / iOS', 11),
  (5002, 1001, '2026-02-19 21:18:00', 'MacBook Air / Chrome', 7),
  (5003, 1002, '2026-02-17 22:41:00', 'Android / Chrome', 9),
  (5004, 1003, '2026-02-19 06:55:00', 'Windows Laptop / Edge', 6),
  (5005, 1004, '2026-02-19 12:33:00', 'iPad / Safari', 8);

INSERT INTO `Mood_Entry` (
  entry_id,
  user_id,
  mood_rating,
  primary_emotion,
  entry_date
) VALUES
  (7001, 1001, 4, 'Hopeful', '2026-02-17 20:10:00'),
  (7002, 1001, 3, 'Overwhelmed', '2026-02-18 22:03:00'),
  (7003, 1002, 2, 'Anxious', '2026-02-17 23:01:00'),
  (7004, 1002, 3, 'Calm', '2026-02-19 09:24:00'),
  (7005, 1003, 5, 'Grateful', '2026-02-19 07:11:00'),
  (7006, 1004, 1, 'Lonely', '2026-02-18 23:48:00');

INSERT INTO `Interactions` (
  interaction_id,
  user_id,
  action_type,
  action_value,
  `timestamp`
) VALUES
  (9001, 1001, 'MOOD_LOG_SUBMIT', 'mood=4;sleep=7.5;tags=Hopeful,Focused', '2026-02-17 20:11:00'),
  (9002, 1001, 'RESOURCE_VIEW', 'resource=988 Suicide & Crisis Lifeline', '2026-02-18 22:07:00'),
  (9003, 1002, 'FILTER_CHANGE', 'filter=24_7', '2026-02-17 23:05:00'),
  (9004, 1002, 'CONTACT_ADDED', 'name=Mom;relationship=Family', '2026-02-18 10:26:00'),
  (9005, 1003, 'MOOD_LOG_SUBMIT', 'mood=5;sleep=8;tags=Grateful,Content', '2026-02-19 07:12:00'),
  (9006, 1004, 'CRISIS_OVERLAY_OPEN', 'source=dashboard_nav', '2026-02-18 23:50:00'),
  (9007, 1004, 'RESOURCE_CALL_TAP', 'phone=988', '2026-02-18 23:51:00');

INSERT INTO `Contacts` (
  contact_id,
  user_id,
  name,
  phone_number,
  relationship,
  is_active
) VALUES
  (3001, 1001, 'Lena Chen', '555-201-8843', 'Sister', TRUE),
  (3002, 1001, 'Campus Counseling Front Desk', '555-310-4421', 'Counselor', TRUE),
  (3003, 1002, 'Marisol Rivera', '555-778-9912', 'Mother', TRUE),
  (3004, 1003, 'Kai Torres', '555-113-6650', 'Partner', TRUE),
  (3005, 1004, 'Resident Advisor - Priya', '555-904-2286', 'Resident Advisor', FALSE);

INSERT INTO `Resources` (
  resource_id,
  title,
  category,
  target_url,
  icon_asset
) VALUES
  (2001, '988 Suicide & Crisis Lifeline', 'Crisis', 'https://988lifeline.org', 'phone'),
  (2002, 'Crisis Text Line', 'Crisis', 'https://www.crisistextline.org', 'message-circle'),
  (2003, 'NAMI HelpLine', 'Information', 'https://www.nami.org/support-education/nami-helpline', 'brain'),
  (2004, 'Student Counseling Center', 'Counseling', 'https://wellness.university.edu/counseling', 'graduation-cap'),
  (2005, 'Headspace for Students', 'Self-Help', 'https://www.headspace.com/studentplan', 'globe'),
  (2006, 'BetterHelp', 'Therapy', 'https://www.betterhelp.com', 'heart');

INSERT INTO `Testimonials` (
  testimonial_id,
  author_name,
  content,
  profile_pic,
  date_posted,
  is_verified
) VALUES
  (4001, 'Ari, 2nd-year student', 'Logging my mood each evening helped me notice stress patterns before exams.', '/images/testimonials/ari.jpg', '2026-02-01 16:20:00', TRUE),
  (4002, 'Nina, graduate student', 'I used the resource list to find support fast when I felt isolated.', '/images/testimonials/nina.jpg', '2026-02-06 11:05:00', TRUE),
  (4003, 'Marcus, alumni', 'The app feels private and simple, which made it easier to actually use.', '/images/testimonials/marcus.jpg', '2026-02-12 09:45:00', FALSE);
