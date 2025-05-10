import sqlite3
from datetime import datetime

# Connect to SQLite database (this will create the database 'student' in your working directory)
conn = sqlite3.connect('student')
cursor = conn.cursor()

# Create tables

# Create students table
cursor.execute('''
CREATE TABLE IF NOT EXISTS students (
    student_id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    date_of_birth TEXT NOT NULL,
    email TEXT NOT NULL,
    phone_number TEXT NOT NULL
);
''')

# Create courses table
cursor.execute('''
CREATE TABLE IF NOT EXISTS courses (
    course_id INTEGER PRIMARY KEY AUTOINCREMENT,
    course_name TEXT NOT NULL,
    course_description TEXT NOT NULL,
    course_code TEXT NOT NULL
);
''')

# Create enrollments table (many-to-many relationship resolver)
cursor.execute('''
CREATE TABLE IF NOT EXISTS enrollments (
    enrollment_id INTEGER PRIMARY KEY AUTOINCREMENT,
    student_id INTEGER,
    course_id INTEGER,
    enrollment_date TEXT NOT NULL,
    FOREIGN KEY (student_id) REFERENCES students (student_id),
    FOREIGN KEY (course_id) REFERENCES courses (course_id)
);
''')

# Insert sample data into students table
cursor.execute('''
INSERT INTO students (first_name, last_name, date_of_birth, email, phone_number)
VALUES ('John', 'Doe', '1995-06-15', 'john.doe@email.com', '1234567890');
''')

cursor.execute('''
INSERT INTO students (first_name, last_name, date_of_birth, email, phone_number)
VALUES ('Jane', 'Smith', '1997-08-22', 'jane.smith@email.com', '0987654321');
''')

# Insert sample data into courses table
cursor.execute('''
INSERT INTO courses (course_name, course_description, course_code)
VALUES ('Mathematics 101', 'Introduction to basic Mathematics', 'MATH101');
''')

cursor.execute('''
INSERT INTO courses (course_name, course_description, course_code)
VALUES ('Physics 101', 'Introduction to basic Physics', 'PHYS101');
''')

# Insert sample data into enrollments table
cursor.execute('''
INSERT INTO enrollments (student_id, course_id, enrollment_date)
VALUES (1, 1, ?);
''', (datetime.now(),))

cursor.execute('''
INSERT INTO enrollments (student_id, course_id, enrollment_date)
VALUES (1, 2, ?);
''', (datetime.now(),))

cursor.execute('''
INSERT INTO enrollments (student_id, course_id, enrollment_date)
VALUES (2, 1, ?);
''', (datetime.now(),))

# Commit the changes to the database
conn.commit()

# Query to fetch all students
cursor.execute('SELECT * FROM students')
students = cursor.fetchall()
print("Students:")
for student in students:
    print(student)

# Query to fetch all courses
cursor.execute('SELECT * FROM courses')
courses = cursor.fetchall()
print("\nCourses:")
for course in courses:
    print(course)

# Query to fetch all enrollments
cursor.execute('SELECT * FROM enrollments')
enrollments = cursor.fetchall()
print("\nEnrollments:")
for enrollment in enrollments:
    print(enrollment)

# Close the connection to the database
conn.close()
