/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  ducmi
 * Created: Mar 21, 2025
 */

create database gamevui2
use gamevui2

DROP TABLE IF EXISTS game;
CREATE TABLE game (
  id_game INT IDENTITY(1,1) PRIMARY KEY,
  tengame NVARCHAR(100) COLLATE Vietnamese_CI_AS NULL,
  hinhgame NVARCHAR(100) NULL,
  taptingame NVARCHAR(100) NULL,
  noidunggame NVARCHAR(MAX) NULL,
  luotchoi BIGINT NULL,
  luotyeuthich BIGINT NULL,
  hot TINYINT NULL,
  ngaycapnhat DATETIME NULL,
  kiemduyet TINYINT NULL,
  id_theloai INT NULL
);

INSERT INTO game (tengame, hinhgame, taptingame, noidunggame, luotchoi, luotyeuthich, hot, ngaycapnhat, kiemduyet, id_theloai)
VALUES 
(N'Trượt Pa-tanh', N'vinaphoneextremeskate_secure.jpg', N'vinaphoneextremeskate_secure.swf', N'<div class="textview instruction">...</div>', 5775, 422, 0, '2018-09-01 19:54:17', 1, 6), 
(N'Xe tải vượt địa hình', N'xe-tai-vuot-dia-hinh.jpg', N'xe-tai-vuot-dia-hinh.swf', N'<div class="textview instruction">...</div>', 6891, 345, 0, '2018-09-01 19:54:16', 1, 5), 
(N'Tranh tài World Cup', N'tranh-tai-wc.jpg', N'tranh-tai-wc.swf', N'<div class="textview instruction">...</div>', 4811, 345, 0, '2018-09-01 19:54:16', 1, 6), 
(N'Tennis 2', N'tennis2.jpg', N'tennis2.swf', N'<div class="textview instruction">...</div>', 9341, 432, 0, '2018-09-01 19:54:16', 1, 6), 
(N'Đá bóng đôi', N'one-on-one-soccer.jpg', N'one-on-one-soccer.swf', N'<div class="textview instruction">...</div>', 4521, 456, 0, '2018-09-01 19:54:16', 1, 6), 
(N'Ác mộng 4', N'nightmares4.jpg', N'nightmares4.swf', N'<div class="textview instruction">...</div>', 7641, 521, 0, '2018-09-01 19:54:16', 1, 10);

INSERT INTO game (tengame, hinhgame, taptingame, noidunggame, luotchoi, luotyeuthich, hot, ngaycapnhat, kiemduyet, id_theloai) 
VALUES 
(N'Thánh chiến huyền ảo 3', N'epic-battle-fantasy-3.jpg', N'epibic-battle-fantasy-3.swf', N'<div class="textview instruction">...</div>', 13425121, 12322, 1, '2018-09-01 19:52:52', 1, 2), 
(N'Sử thi chiến tranh 5', N'su-thi-chien-tranh-5.jpg', N'su-thi-chien-tranh-5.swf', N'<div class="textview instruction">...</div>', 1234511, 124322, 1, '2018-09-01 19:52:52', 1, 2), 
(N'Đại chiến Dragon Ball', N'Dai-chien-Dragon-Ball-Z.jpg', N'Dai-chien-Dragon-Ball-Z.swf', N'<div class="textview instruction">...</div>', 4124511, 1423322, 1, '2018-09-01 19:52:52', 1, 3), 
(N'Vương quốc lâm nguy 2', N'Vuong-quoc-lam-nguy-2.jpg', N'Vuong-quoc-lam-nguy-2.swf', N'<div class="textview instruction">...</div>', 125111, 2343322, 0, '2018-09-01 19:52:52', 1, 5), 
(N'Đế chế hùng mạnh', N'siegius.jpg', N'siegius.swf', N'<div class="textview instruction">...</div>', 97563411, 1241322, 1, '2018-09-01 19:52:52', 1, 2);

INSERT INTO game (tengame, hinhgame, taptingame, noidunggame, luotchoi, luotyeuthich, hot, ngaycapnhat, kiemduyet, id_theloai) 
VALUES 
(N'Cuộc chiến không gian', N'cuoc-chien-khong-gian.jpg', N'cuoc-chien-khong-gian.swf', N'<div class="textview instruction">...</div>', 5432123, 654321, 1, '2025-03-15 10:30:00', 1, 3),
(N'Chiến binh bóng tối', N'chien-binh-bong-toi.jpg', N'chien-binh-bong-toi.swf', N'<div class="textview instruction">...</div>', 3214567, 765432, 1, '2025-03-15 10:30:00', 1, 4),
(N'Bí ẩn hầm ngục', N'bi-an-ham-nguc.jpg', N'bi-an-ham-nguc.swf', N'<div class="textview instruction">...</div>', 7896541, 987654, 1, '2025-03-15 10:30:00', 1, 5),
(N'Cuộc chiến sinh tồn', N'cuoc-chien-sinh-ton.jpg', N'cuoc-chien-sinh-ton.swf', N'<div class="textview instruction">...</div>', 4561238, 852963, 0, '2025-03-15 10:30:00', 1, 3),
(N'Huyền thoại thần kiếm', N'huyen-thoai-than-kiem.jpg', N'huyen-thoai-than-kiem.swf', N'<div class="textview instruction">...</div>', 9638527, 741258, 1, '2025-03-15 10:30:00', 1, 5);

INSERT INTO game (tengame, hinhgame, taptingame, noidunggame, luotchoi, luotyeuthich, hot, ngaycapnhat, kiemduyet, id_theloai) 
VALUES 
(N'Xây tháp', N'xay-thap.jpg', N'xay-thap.swf', N'<div class="textview instruction">...</div>', 54612, 2352, 0, '2018-09-01 19:53:26', 1, 7),
(N'Tiểu Kim Quy', N'tieukimquy_secure.jpg', N'tieukimquy_secure.swf', N'<div class="textview instruction">...</div>', 61212, 6522, 0, '2018-09-01 19:53:26', 1, 7),
(N'Flash man', N'flashmanwm.jpg', N'flashmanwm.swf', N'<div class="textview instruction">...</div>', 63212, 6522, 0, '2018-09-01 19:53:26', 1, 7),
(N'Nhiệm vụ Ville', N'weirdville.jpg', N'weirdville.swf', N'<div class="textview instruction">...</div>', 43512, 4322, 0, '2018-09-01 19:53:26', 1, 7),
(N'Ben 10 vs Alien', N'Ben-10-vs-Alien.jpg', N'Ben-10-vs-Alien.swf', N'<div class="textview instruction">...</div>', 3411, 2562, 0, '2018-09-01 19:53:26', 1, 7),
(N'Đột kích 6', N'Dot-kich-6.jpg', N'Dot-kich-6.swf', N'<div class="textview instruction">...</div>', 3511, 2222, 0, '2018-09-01 19:53:26', 1, 7),
(N'SWAT đột kích', N'SWAT-dot-kich_Secure.jpg', N'SWAT-dot-kich_Secure.swf', N'<div class="textview instruction">...</div>', 663, 2222, 0, '2018-09-01 19:53:26', 1, 7);
INSERT INTO game (tengame, hinhgame, taptingame, noidunggame, luotchoi, luotyeuthich, hot, ngaycapnhat, kiemduyet, id_theloai) VALUES 
(N'Ác mộng 4', N'nightmares4.jpg', N'nightmares4.swf', N'<div class="textview instruction">...</div>', 4411, 212, 0, '2018-09-01 19:53:05', 1, 3),
(N'Người que vượt ngục', N'Nguoi-que-vuot-nguc.jpg', N'Nguoi-que-vuot-nguc.swf', N'<div class="textview instruction">...</div>', 1311, 933, 0, '2018-09-01 19:53:05', 1, 3),
(N'Người sói chạy trốn', N'Nguoi-Soi-chay-tron.jpg', N'Nguoi-Soi-chay-tron.swf', N'<div class="textview instruction">...</div>', 2344, 242, 0, '2018-09-01 19:53:05', 1, 3),
(N'Gumball thoát khỏi ác mộng', N'Gumball-thoat-khoi-ac-mong.jpg', N'Gumball-thoat-khoi-ac-mong.swf', N'<div class="textview instruction">...</div>', 7681, 345, 0, '2018-09-01 19:53:05', 1, 3),
(N'Pokemon phiêu lưu', N'pokemon-adventure.jpg', N'pokemon-adventure.swf', N'<div class="textview instruction">...</div>', 8411, 523, 0, '2018-09-01 19:53:05', 1, 3),
(N'Scooby lâu đài ghê rợn', N'scocreepycastle.jpg', N'scocreepycastle.swf', N'<div class="textview instruction">...</div>', 5775, 422, 0, '2018-09-01 19:53:05', 1, 3);
INSERT INTO game (tengame, hinhgame, taptingame, noidunggame, luotchoi, luotyeuthich, hot, ngaycapnhat, kiemduyet, id_theloai)
VALUES 
(N'Vườn hoa', N'vuonhoa.jpg', N'vuonhoa.swf', N'<div class="textview instruction">...</div>', 56612, 6522, 0, '2018-09-01 19:52:48', 1, 1),
(N'Cuộc chiến chó mèo', N'cuoc-chien-cho-meo.jpg', N'cuoc-chien-cho-meo.swf', N'<div class="textview instruction">...</div>', 76612, 6422, 0, '2018-09-01 19:52:48', 1, 1),
(N'Kiss trong phòng', N'gym-love.jpg', N'gym-love.swf', N'<div class="textview instruction">...</div>', 2414, 252, 0, '2018-09-01 19:52:49', 1, 1),
(N'Đánh bóng bàn', N'31.jpg', N'31.swf', N'<div class="textview instruction">...</div>', 6523, 346, 0, '2018-09-01 19:52:51', 1, 1);
INSERT INTO game (tengame, hinhgame, taptingame, noidunggame, luotchoi, luotyeuthich, hot, ngaycapnhat, kiemduyet, id_theloai) VALUES (N'Gunny mini', N'gunny-mini.jpg', N'gunny-mini.swf', N'<div class="textview instruction">...</div>', 32045, 3654, 1, '2018-09-01 19:52:45', 1, 1)
INSERT INTO game (tengame, hinhgame, taptingame, noidunggame, luotchoi, luotyeuthich, hot, ngaycapnhat, kiemduyet, id_theloai) VALUES (N'Đột kích 2', N'dot-kich-2_Secure1.jpg', N'dot-kich-2_Secure1.swf', N'<div class="textview instruction">...</div>', 26435, 4567, 0, '2018-09-01 19:52:45', 1, 1)
INSERT INTO game (tengame, hinhgame, taptingame, noidunggame, luotchoi, luotyeuthich, hot, ngaycapnhat, kiemduyet, id_theloai) VALUES (N'Hành tinh zoombie 2', N'Hanh-tinh-Zombie-2.jpg', N'Hanh-tinh-Zombie-2.swf', N'<div class="textview instruction">...</div>', 54678, 1250, 0, '2018-09-01 19:52:45', 1, 1)
INSERT INTO game (tengame, hinhgame, taptingame, noidunggame, luotchoi, luotyeuthich, hot, ngaycapnhat, kiemduyet, id_theloai) VALUES (N'Ben 10 psyphone cứu thế giới', N'ben-10-psyphon-cuu-the-gioi.jpg', N'ben-10-psyphon-cuu-the-gioi.swf', N'<div class="textview instruction">...</div>', 45201, 2752, 1, '2018-09-01 19:52:45', 1, 1)
INSERT INTO game (tengame, hinhgame, taptingame, noidunggame, luotchoi, luotyeuthich, hot, ngaycapnhat, kiemduyet, id_theloai) VALUES (N'Tăng chiến 5', N'tang-chien-5_secure.jpg', N'tang-chien-5_secure.swf', N'<div class="textview instruction">...</div>', 15611, 2568, 1, '2018-09-01 19:52:45', 1, 1)
INSERT INTO game (tengame, hinhgame, taptingame, noidunggame, luotchoi, luotyeuthich, hot, ngaycapnhat, kiemduyet, id_theloai) VALUES (N'Hành trình zoombie 3', N'Hanh-tinh-Zombie-3.jpg', N'Hanh-tinh-Zombie-3.swf', N'<div class="textview instruction">...</div>', 12311, 2242, 0, '2018-09-01 19:52:45', 1, 1)
INSERT INTO game (tengame, hinhgame, taptingame, noidunggame, luotchoi, luotyeuthich, hot, ngaycapnhat, kiemduyet, id_theloai) VALUES (N'Xâm nhập 2', N'Xam-nhap-2.jpg', N'Xam-nhap-2.swf', N'<div class="textview instruction">...</div>', 59943, 4922, 0, '2018-09-01 19:52:45', 1, 1)

INSERT INTO game (tengame, hinhgame, taptingame, noidunggame, luotchoi, luotyeuthich, hot, ngaycapnhat, kiemduyet, id_theloai) VALUES 
(N'Thế giới minecraft', N'the-gioi-minecraft.jpg', N'the-gioi-minecraft.swf', N'<div class="textview instruction">...</div>', 78294612, 653422, 1, '2018-09-01 19:53:33', 1, 8),
(N'Nông trại chăn nuôi', N'nong-trai-chan-nuoi.jpg', N'nong-trai-chan-nuoi.swf', N'<div class="textview instruction">...</div>', 23982, 4422, 0, '2018-09-01 19:53:33', 1, 8),
(N'Bể bơi vui nhộn', N'beboivuinhon.jpg', N'beboivuinhon.swf', N'<div class="textview instruction">...</div>', 68917, 6322, 0, '2018-09-01 19:53:33', 1, 8),
(N'Những chú cừu thông minh', N'nhung-chu-cuu-thong-minh.jpg', N'nhung-chu-cuu-thong-minh.swf', N'<div class="textview instruction">...</div>', 64512, 6422, 1, '2018-09-01 19:53:33', 1, 8),
(N'Oggy bắt trộm', N'Oggy-bat-trom.jpg', N'Oggy-bat-trom.swf', N'<div class="textview instruction">...</div>', 76345, 5321, 0, '2018-09-01 19:53:33', 1, 8);

-- ----------------------------
-- Table structure for [group]
-- ----------------------------
IF OBJECT_ID('[group]', 'U') IS NOT NULL
    DROP TABLE [group];
GO
CREATE TABLE [group] (
    [id_group] INT IDENTITY(1,1) PRIMARY KEY,
    [name] NVARCHAR(255) NOT NULL,
    [status] TINYINT NULL,
    [ordering] INT NULL
);
GO

-- ----------------------------
-- Records of [group]
-- ----------------------------
INSERT INTO [group] ([name], [status], [ordering]) VALUES
('Admin', 1, 1),
('Manager', 2, 2),
('Member', 3, 3),
('Guest', 4, 4);
GO

-- ----------------------------
-- Table structure for [quangcao]
-- ----------------------------
IF OBJECT_ID('[quangcao]', 'U') IS NOT NULL
    DROP TABLE [quangcao];
GO
CREATE TABLE [quangcao] (
    [id_quangcao] INT IDENTITY(1,1) PRIMARY KEY,
    [tieude] NVARCHAR(100) NULL,
    [taptin] NVARCHAR(255) NULL,
    [url] NVARCHAR(100) NULL,
    [target] NVARCHAR(20) NULL,
    [ordering] INT NULL,
    [visiable] TINYINT NULL,
    [fileflash] TINYINT NULL
);
GO

-- ----------------------------
-- Records of [quangcao]
-- ----------------------------
-- 1. Xóa toàn bộ dữ liệu trong bảng
DELETE FROM quangcao;

-- 2. Reset lại giá trị IDENTITY về 1
DBCC CHECKIDENT ('quangcao', RESEED, 0);

-- 3. Chèn lại dữ liệu
INSERT INTO quangcao (tieude, taptin, url, target, ordering, visiable, fileflash) 
VALUES 
(N'Quảng cáo 1', 'quangcao_1.gif', 'http://indogamersonline.blogspot.com/2011/05/game-untuk-nokia-2700-classic-cricket.html', '_blank', 1, 1, 0),
(N'Quảng cáo 2', 'quangcao_2.gif', 'http://www.gogglebob.com/tag/anime/page/2/', '_blank', 2, 1, 0),
(N'Quảng cáo 3', 'quangcao_3.gif', 'http://keowin.com/soi-keo/soi-keo-heidenheimer-vs-arminia-bielefeld-20h30-ngay-5-08-hang-2-duc/', '_blank', 3, 1, 0),
(N'Quảng cáo 4', 'quangcao_4.gif', 'https://quangcaoxebuytblog.wordpress.com/tag/quang-cao-tren-xe-buyt-tai-da-nang/', '_blank', 4, 1, 0),
(N'Quảng cáo 5', 'quangcao_5.gif', 'https://www.pinterest.at/pin/363102788679611802/', '_blank', 5, 1, 0),
(N'Quảng cáo 6', 'quangcao_6.gif', 'https://dulichsongson.com.vn/', '_blank', 6, 1, 0),
(N'Quảng cáo 7', 'quangcao_7.gif', 'https://sites.google.com/site/batdongsanminhminh/chung-cu-hot/chung-cu-vp5-linh-dham', '_blank', 7, 1, 0);

GO

-- ----------------------------
-- Table structure for [theloaigame]
-- ----------------------------
IF OBJECT_ID('[theloaigame]', 'U') IS NOT NULL
    DROP TABLE [theloaigame];
GO
CREATE TABLE [theloaigame] (
    [id_theloai] INT IDENTITY(1,1) PRIMARY KEY,
    [tentheloai] NVARCHAR(50) NULL,
    [visiable_menu] TINYINT NULL,
    [ordering] INT NULL,
    [visiable] TINYINT NULL
);
GO

-- ----------------------------
-- Records of [theloaigame]
-- ----------------------------
INSERT INTO [theloaigame] ([tentheloai], [visiable_menu], [ordering], [visiable]) VALUES
(N'Bắn súng', 1, 1, 1),
(N'Chiến thuật', 1, 2, 1),
(N'Hành động', 1, 3, 1),
(N'Bạn gái', 1, 4, 1),
(N'Phiêu lưu', 1, 5, 1),
(N'Thể thao', 1, 6, 1),
(N'Hoạt hình', 1, 7, 1),
(N'Kinh điển', 1, 8, 1),
(N'Trí tuệ', 0, 9, 1),
(N'Kinh dị', 0, 10, 1);
GO

-- ----------------------------
-- Table structure for [user]
-- ----------------------------
IF OBJECT_ID('[user]', 'U') IS NOT NULL
    DROP TABLE [user];
GO
CREATE TABLE [user] (
    [id] INT IDENTITY(1,1) PRIMARY KEY,
    [username] NVARCHAR(255) NULL,
    [password] NVARCHAR(255) NULL,
    [email] NVARCHAR(255) NULL,
    [fullname] NVARCHAR(255) NULL,
    [sex] NVARCHAR(10) NULL,
    [birthday] DATE NULL,
    [address] NVARCHAR(MAX) NULL,
    [randomkey] NVARCHAR(100) NULL,
    [active] TINYINT NULL,
    [id_group] INT NULL,
    FOREIGN KEY ([id_group]) REFERENCES [group]([id_group])
);
GO

INSERT INTO [user] ([username], [password], [email], [fullname], [sex], [birthday], [address], [randomkey], [active], [id_group]) VALUES
-- Admin Users (id_group = 1)
('admin1', 'AdminPass1', 'admin1@example.com', 'Alice Johnson', 'Female', '1985-06-10', '123 Admin St, New York', 'RANDOM1234', 1, 1),
('admin2', 'AdminPass2', 'admin2@example.com', 'Robert Smith', 'Male', '1988-09-25', '456 Admin Blvd, Chicago', 'RANDOM5678', 1, 1),

-- Manager Users (id_group = 2)
('manager1', 'ManagerPass1', 'manager1@example.com', 'John Manager', 'Male', '1990-02-15', '789 Manager Rd, Miami', 'MANAGERKEY1', 1, 2),
('manager2', 'ManagerPass2', 'manager2@example.com', 'Sarah Brown', 'Female', '1992-07-30', '321 Manager Ln, Houston', 'MANAGERKEY2', 1, 2),

-- Member Users (id_group = 3)
('member1', 'MemberPass1', 'member1@example.com', 'David Wilson', 'Male', '1995-11-20', '654 Member Ave, Los Angeles', 'MEMBERKEY1', 1, 3),
('member2', 'MemberPass2', 'member2@example.com', 'Sophia Martin', 'Female', '1997-04-12', '987 Member Blvd, Boston', 'MEMBERKEY2', 1, 3),

-- Guest Users (id_group = 4)
('guest1', 'GuestPass1', 'guest1@example.com', 'Olivia Guest', 'Female', '2000-01-05', '159 Guest St, San Francisco', 'GUESTKEY1', 1, 4),
('guest2', 'GuestPass2', 'guest2@example.com', 'Michael Guest', 'Male', '2001-03-18', '753 Guest Ln, Dallas', 'GUESTKEY2', 1, 4);
go