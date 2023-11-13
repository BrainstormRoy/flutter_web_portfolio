// You can create a set of MySQL tables for the given data using the following schema. I've provided a professional and understandable table structure with the specified foreign keys, and I've also made some assumptions about data types and keys.

// ! 1. User Table:
// ```sql
// CREATE TABLE Users (
//     username VARCHAR(255) PRIMARY KEY,
//     name VARCHAR(255) NOT NULL,
//     designation VARCHAR(255),
//     location VARCHAR(255),
//     about TEXT,
//     youtube_id VARCHAR(255)
// );
// ```

// ! 2. Contact Table:
// ```sql
//  CREATE TABLE Phone (
//      id INT AUTO_INCREMENT PRIMARY KEY,
//      user_username VARCHAR(255),
//      value_name VARCHAR(255),
//      contact_value VARCHAR(255),
//      FOREIGN KEY (user_username) REFERENCES Users(username) ON UPDATE CASCADE ON DELETE CASCADE
//  );

//   CREATE TABLE Email (
//      id INT AUTO_INCREMENT PRIMARY KEY,
//      user_username VARCHAR(255),
//      value_name VARCHAR(255),
//      contact_value VARCHAR(255),
//      FOREIGN KEY (user_username) REFERENCES Users(username) ON UPDATE CASCADE ON DELETE CASCADE
//  );
// ```

// ! 3. Website & Social Links Table:
// ```sql
// CREATE TABLE WebsiteSocialLinks (
//     id INT AUTO_INCREMENT PRIMARY KEY,
//     user_username VARCHAR(255),
//     svg VARCHAR(255),
//     value VARCHAR(255),
//     value_name VARCHAR(255),
//     FOREIGN KEY (user_username) REFERENCES Users(username) ON UPDATE CASCADE ON DELETE CASCADE
// );
// ```

// ! 4. Education Table:
// ```sql
// CREATE TABLE Education (
//     id INT AUTO_INCREMENT PRIMARY KEY,
//     user_username VARCHAR(255),
//     university_name VARCHAR(255),
//     degree VARCHAR(255),
//     year_start INT,
//     year_end INT,
//     grade VARCHAR(255),
//     Field_of_study VARCHAR(255),
//     FOREIGN KEY (user_username) REFERENCES Users(username) ON UPDATE CASCADE ON DELETE CASCADE
// );
// ```

