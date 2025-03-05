Create database StartupProjectManagement;

use StartupProjectManagement;

-- Create Users Table (tblUsers)
CREATE TABLE tblUsers (
    Username VARCHAR(50) PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Password VARCHAR(255) NOT NULL,
    Role VARCHAR(20) NOT NULL CHECK (Role IN ('Founder', 'Team Member'))
);

-- Create Startup Projects Table (tblStartupProjects)
CREATE TABLE tblStartupProjects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100) NOT NULL,
    Description TEXT,
    Status VARCHAR(20) NOT NULL CHECK (Status IN ('Ideation', 'Development', 'Launch', 'Scaling')),
    estimated_launch DATE NOT NULL
);

-- Insert Users into tblUsers Table
INSERT INTO tblUsers (Username, Name, Password, Role) VALUES
('founder1', 'Steve Jobs', 'andro1dsuck', 'Founder'),
('founder2', 'Elon Musk', 'theXman', 'Founder'),
('founder3', 'Jensen Huang', '1m0nteamgreen', 'Founder'),
('founder4', 'Mark Zuckerberg', 'metababy', 'Founder'),
('founder5', 'John Disney', 'democrat', 'Founder'),
('teammember1', 'Xi Jinping', 'imnotaD0bear', 'Team Member'),
('teammember10', 'Nick Fury', 'lostaneyeincombat', 'Team Member'),
('teammember2', 'Donald Trump', '4mer1c4', 'Team Member'),
('teammember3', 'Vladimir Putin', 'irideadBEAR', 'Team Member'),
('teammember4', 'Michal Jackson', 'heehee', 'Team Member'),
('teammember5', 'Tony Stark', 'iseeaVisiOn', 'Team Member'),
('teammember6', 'Steve Roger', 'welldoittogetherethero', 'Team Member'),
('teammember7', 'Natasha Romanoff', 'switchedsidesagain', 'Team Member'),
('teammember8', 'Bruce Banner', 'udontwantmemad', 'Team Member'),
('teammember9', 'Peter Parker', 'unpaiddintern', 'Team Member');

-- Insert Startup Projects into tblStartupProjects Table
INSERT INTO tblStartupProjects (project_id, project_name, Description, Status, estimated_launch) VALUES
(1, 'Project Apple', 'Making communication devices more portable.', 'Launch', '1976-04-01'),
(2, 'Project SpaceX', 'Space exploration, space internet.', 'Development', '2024-09-15'),
(3, 'Project Chips', 'Become the biggest chip maker on Earth.', 'Development', '2020-01-20'),
(4, 'Project Meta', 'A social media platform with AI profiles.', 'Ideation', '2025-05-14'),
(5, 'Project Disney', 'A subscription service for Movies, exclusive on...', 'Scaling', '2019-07-25'),
(6, 'Project BigAI', 'Lead the AI Industry.', 'Development', '2022-11-05'),
(7, 'Project X', 'Biggest media outlet', 'Ideation', '2020-02-14'),
(8, 'Project Theta', 'A marketplace for handmade crafts.', 'Scaling', '2024-04-30');