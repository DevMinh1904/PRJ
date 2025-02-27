CREATE DATABASE prj301_assignment
GO

-- Sử dụng database vừa tạo
USE prj301_assignment
GO

-- Tạo bảng tblUsers
CREATE TABLE tblUsers (
    userID varchar(50) PRIMARY KEY,
	email nvarchar(100) NOT NULL,
    fullName nvarchar(100) NOT NULL,
    roleID char(2) NOT NULL,
    password varchar(50) NOT NULL
);
GO

-- Thêm 3 người dùng mẫu với tên tiếng Việt
INSERT INTO tblUsers (userID, fullName, roleID, password) VALUES
('adminlord', N'dangducminh0362@gmail.com', N'Quản Trị Viên', 'AD', 'admin1904'),
('user001', N'Nguyễn Văn Anh', 'US', 'user123'),
('user002', N'Trần Thị Bình', 'US', 'user456');
GO