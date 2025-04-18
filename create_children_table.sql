-- Create children table
CREATE TABLE IF NOT EXISTS children (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INTEGER CHECK (age >= 0 AND age <= 18),
    grade VARCHAR(20),
    hobby VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert dummy data
INSERT INTO children (name, age, grade, hobby) VALUES
    ('John Smith', 7, '2nd Grade', 'Drawing'),
    ('Emma Johnson', 10, '5th Grade', 'Swimming'),
    ('Michael Brown', 5, 'Kindergarten', 'Lego building'),
    ('Sophia Williams', 12, '7th Grade', 'Piano'),
    ('James Davis', 8, '3rd Grade', 'Soccer'),
    ('Olivia Miller', 6, '1st Grade', 'Ballet'),
    ('William Wilson', 14, '9th Grade', 'Basketball'),
    ('Ava Moore', 9, '4th Grade', 'Reading'),
    ('Alexander Taylor', 16, '11th Grade', 'Coding'),
    ('Isabella Anderson', 11, '6th Grade', 'Singing'); 