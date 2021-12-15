CREATE DATABASE QuanLySanBong
GO
USE QuanLySanBong
GO

--Khách hàng
CREATE TABLE KhachHang
(
	Ma_KhachHang VARCHAR(100) PRIMARY KEY,
	Ten_KhachHang NVARCHAR(100) NOT NULL DEFAULT N'Chưa nhập!',
	DiaChi_KhachHang NVARCHAR(150) NOT NULL DEFAULT N'Chưa nhập!',
	Sdt_KhachHang VARCHAR(100)  NOT NULL DEFAULT 0123456789,	
)
GO

--Loại Sân
CREATE TABLE LoaiSan
(
	Loai_San VARCHAR(100) PRIMARY KEY,
	Ten_Loai NVARCHAR(100) NOT NULL,	
	GiaLoai_San FLOAT,
)
--Sân
CREATE TABLE San
(
	Ma_San VARCHAR(100) PRIMARY KEY,
	Loai_San VARCHAR(100) NOT NULL,
	Ten_San NVARCHAR(100) NOT NULL,
	FOREIGN KEY(Loai_San) REFERENCES dbo.LoaiSan(Loai_San)
)
--Thuê Sân bóng
CREATE TABLE ThueSan
(
	[Ma_ThueSan] INT IDENTITY PRIMARY KEY,
	Ma_San VARCHAR(100),
	Ma_KhachHang VARCHAR(100),
	[ThoiGianBatDau] [datetime] NULL,
	[ThoiGianKetThuc] [datetime] NULL,
	[LoaiThue] [nvarchar](50) NULL,
	[DonGia] [FLOAT] NULL,
	[ThanhTien] [nchar](10) NULL,
	FOREIGN KEY(Ma_San) REFERENCES dbo.San(Ma_San),
	FOREIGN KEY(Ma_KhachHang) REFERENCES dbo.KhachHang(Ma_KhachHang),
)
--Hóa đơn
CREATE TABLE HoaDon
(	
	Ma_HD INT IDENTITY PRIMARY KEY,	
	Ma_KhachHang VARCHAR(100),
	Ma_San VARCHAR(100) NOT NULL,	
	NgayLap_HD [date] NOT NULL,
	TongPhut_Da INT NOT NULL,
	DonGia [FLOAT] NULL,
	TongTien_HD FLOAT NULL,
	FOREIGN KEY(Ma_KhachHang) REFERENCES dbo.KhachHang(Ma_KhachHang)
)	
GO
--Account
CREATE TABLE Account
(	
	UserName VARCHAR(100) PRIMARY KEY,
	DisplayName NVARCHAR(100) NOT NULL,	 
	PassWord VARCHAR(1000) NOT NULL,
	Quyen NVARCHAR(100) NOT NULL,
) 

-------INSERT
SET DATEFORMAT DMY
GO

INSERT Account(UserName, DisplayName, PassWord, Quyen) VALUES
('longbi', N'Đinh Thành Long', '123',N'Admin'),
('bilong', N'Đinh Thành A', '123',N'User'),
('along', N'Đinh Thành B', '123',N'User'),
('tlong', N'Đinh Thành C', '123',N'User');
GO

INSERT KhachHang(Ma_KhachHang,Ten_KhachHang, DiaChi_KhachHang, Sdt_KhachHang) VALUES
('KH1',N'Lê Văn A', N'Hà Tĩnh', '0689712942'),
('KH2',N'Nguyễn Văn B', N'Bình Dương', '0623452314'),
('KH3',N'Nguyễn Văn C', N'Thanh Hóa', '0786583521'),
('KH4',N'Nguyễn Văn D', N'Đồng Nai', '0987234224'),
('KH5',N'Nguyễn Văn E', N'Tp.HCM', '0978943634'),
('KH6',N'Trần Văn A', N'Đà Nẵng', '0272352342');
GO

INSERT LoaiSan(Loai_San,Ten_Loai,GiaLoai_San) VALUES
('Loai1',N'Sân 6 người',20000),
('Loai2',N'Sân 10 người',40000),
('Loai3',N'Sân 14 người',80000);
GO

INSERT San(Ma_San,Loai_San,Ten_San) VALUES
('SAN1','Loai1',N'Sân 1'),
('SAN2','Loai2',N'Sân 2'),
('SAN3','Loai3',N'Sân 3'),
('SAN4','Loai1',N'Sân 4'),
('SAN5','Loai2',N'Sân 5'),
('SAN6','Loai3',N'Sân 6');
GO

INSERT ThueSan(Ma_San,Ma_KhachHang,ThoiGianBatDau,ThoiGianKetThuc,LoaiThue,DonGia,ThanhTien) VALUES
('SAN1','KH1','23-11-2021 17:00','23-11-2021 18:00', N'Trực tiếp',20000,N'120000'),
('SAN2','KH3','24-11-2021 18:00','24-11-2021 19:00', N'Đặt trước',40000,N'240000'),
('SAN3','KH4','25-11-2021 19:00','25-11-2021 20:00', N'Đặt trước',80000,N'480000'),
('SAN4','KH2','26-11-2021 18:00','26-11-2021 19:00', N'Trực tiếp',20000,N'120000'),
('SAN5','KH5','27-11-2021 17:00','27-11-2021 18:00', N'Đặt trước',40000,N'240000'),
('SAN6','KH6','28-11-2021 19:00','28-11-2021 20:00', N'Trực tiếp',80000,N'480000');
GO

INSERT HoaDon(Ma_KhachHang,Ma_San,NgayLap_HD,TongPhut_Da,DonGia,TongTien_HD) VALUES
('KH1','SAN1','23/11/2021', 60,20000,120000),
('KH3','SAN2','24/11/2021', 60,40000,240000),
('KH4','SAN3','25/11/2021', 60,80000,480000),
('KH2','SAN4','26/11/2021', 60,20000,120000),
('KH5','SAN5','27/11/2021', 60,40000,240000),
('KH6','SAN6','28/11/2021', 60,80000,480000);
GO

SELECT GiaLoai_San
FROM San, LoaiSan
WHERE San.Loai_San=LoaiSan.Loai_San and San.Ma_San='SAN1'

SELECT San.Ma_San,San.Loai_San,San.Ten_San, LoaiSan.Ten_Loai,LoaiSan.GiaLoai_San
FROM San, LoaiSan
WHERE San.Loai_San=LoaiSan.Loai_San

INSERT HoaDon(Ma_KhachHang,Ma_San,NgayLap_HD,TongPhut_Da,DonGia,TongTien_HD) VALUES
('KH5','SAN6','29/11/2021', 60,2000,120000)

SELECT SUM(TongTien_HD)
FROM HoaDon

select * from hoadon where ma_hd = '1'

CREATE PROCEDURE spDSKH
(
@Ma_KhachHang VARCHAR(100)
)
AS 
BEGIN
SELECT KhachHang.*,HoaDon.NgayLap_HD,HoaDon.TongTien_HD
FROM KhachHang INNER JOIN HoaDon ON KhachHang.Ma_KhachHang=HoaDon.Ma_KhachHang
WHERE KhachHang.Ma_KhachHang=@Ma_KhachHang
END

spDSKH'KH1'

SELECT KhachHang.*,HoaDon.NgayLap_HD,HoaDon.TongTien_HD
FROM KhachHang INNER JOIN HoaDon ON KhachHang.Ma_KhachHang=HoaDon.Ma_KhachHang
WHERE KhachHang.Ma_KhachHang='KH1'

CREATE PROCEDURE spDSHD
(
@Ma_HD INT
)
AS 
BEGIN
SELECT HoaDon.*
FROM HoaDon 
WHERE HoaDon.Ma_HD=@Ma_HD
END
