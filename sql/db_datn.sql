--create database DATN
--go 
--use DATN
--go 
--drop database DATN
create table nhan_vien(
	id INT IDENTITY(1,1) PRIMARY KEY,
	ma_nhan_vien NVARCHAR(255) UNIQUE,
	ho_ten NVARCHAR(255),
	ngay_sinh DATETIME,
	gioi_tinh NVARCHAR(5),
	dia_chi NVARCHAR(255),
	sdt VARCHAR(11),
	email VARCHAR(255),
	chuc_vu NVARCHAR(255),
	ngay_tao DATETIME,
	ngay_sua DATETIME,
	trang_thai NVARCHAR(255)
)
create table khach_hang(
	id INT IDENTITY(1,1) PRIMARY KEY,
	ho_ten NVARCHAR(255),
	ngay_sinh DATETIME,
	gioi_tinh NVARCHAR(5),
	dia_chi NVARCHAR(255),
	sdt VARCHAR(11),
	email VARCHAR(255),
	ngay_tao DATETIME,
	ngay_sua DATETIME,
	trang_thai NVARCHAR(255)
)

create table tai_khoan(
	id INT IDENTITY(1,1) PRIMARY KEY,
	id_nhan_vien INT ,
	ten_dang_nhap VARCHAR (255),
	mat_khau VARCHAR (255),
	trang_thai NVARCHAR(255),
	FOREIGN KEY (id_nhan_vien) REFERENCES nhan_vien(id)
)

create table tien_nghi(
	id INT IDENTITY(1,1) PRIMARY KEY,
	ma_tien_nghi VARCHAR(255) UNIQUE,
	ten_tien_nghi NVARCHAR(255),
	so_luong_ton INT,
	don_gia DECIMAL(18, 2),
	trang_thai NVARCHAR(255)
)

create table phong(
	id INT IDENTITY(1,1) PRIMARY KEY,
	ma_phong VARCHAR(255) UNIQUE,
	ten_phong NVARCHAR(255),
	hinh_anh VARCHAR(255),
	ngay_tao DATETIME,
	ngay_sua DATETIME,
	trang_thai NVARCHAR(255),
	tinh_trang NVARCHAR(255)
)

create table loai_phong(
	id INT IDENTITY(1,1) PRIMARY KEY,
	id_phong INT ,
	ma_loai_phong VARCHAR(255) UNIQUE,
	ten_loai_phong NVARCHAR(255),
	suc_chua INT,
	gia_theo_gio DECIMAL(18, 2),
	gia_qua_dem DECIMAL(18, 2),
	hinh_anh VARCHAR(255),
	ghi_chu VARCHAR(255),
	trang_thai NVARCHAR(255)
	FOREIGN KEY (id_phong) REFERENCES phong(id)
)

create table loai_phong_tien_nghi(
	id INT IDENTITY(1,1) PRIMARY KEY,
	id_loai_phong INT ,
	id_tien_nghi INT ,
	so_luong_cung_cap INT,
	FOREIGN KEY (id_loai_phong) REFERENCES loai_phong(id),
	FOREIGN KEY (id_tien_nghi) REFERENCES tien_nghi(id)
)

create table phieu_dat_phong(
	id INT IDENTITY(1,1) PRIMARY KEY,
	id_khach_hang INT ,
	id_loai_phong INT ,
	ma_dat_phong VARCHAR(255),
	thoi_gian_dat DATETIME,
	thoi_gian_vao_du_kien DATETIME,
	thoi_gian_ra_du_kien DATETIME,
	so_nguoi INT,
	so_phong INT,
	trang_thai NVARCHAR(255),
	FOREIGN KEY (id_khach_hang) REFERENCES khach_hang(id),
	FOREIGN KEY (id_loai_phong) REFERENCES loai_phong(id)
)

create table hoa_don(
	id INT IDENTITY(1,1) PRIMARY KEY,
	id_phieu_dat_phong INT ,
	id_tai_khoan INT ,
	id_khach_hang INT ,
	tong_tien DECIMAL(18,2),
	trang_thai NVARCHAR(255),
	FOREIGN KEY (id_phieu_dat_phong) REFERENCES phieu_dat_phong(id),
	FOREIGN KEY (id_tai_khoan) REFERENCES tai_khoan(id),
	FOREIGN KEY (id_khach_hang) REFERENCES khach_hang(id)
)


create table dich_vu(
	id INT IDENTITY(1,1) PRIMARY KEY,
	ten_dich_vu NVARCHAR(255),
	don_gia DECIMAL(18,2),
	mo_ta NVARCHAR(255),
	hinh_anh VARCHAR(255),
	trang_thai NVARCHAR(255),
)

create table phieu_dich_vu(
	id INT IDENTITY(1,1) PRIMARY KEY,
	id_dich_vu INT ,
	so_luong_su_dung INT,
	thanh_tien DECIMAL(18,2),
	FOREIGN KEY (id_dich_vu) REFERENCES dich_vu(id)


)


create table chi_tiet_hoa_don(
	id INT IDENTITY(1,1) PRIMARY KEY,
	id_phieu_dich_vu INT ,
	id_hoa_don INT ,
	id_phong INT ,
	hinh_thuc_thue NVARCHAR(255),
	thoi_gian_ra DATE,
	thoi_gian_thue DATE,
	tien_phong DECIMAL(18,2),
	tien_dich_vu DECIMAL(18,2),
	tong_tien DECIMAL(18,2),
	FOREIGN KEY (id_phieu_dich_vu) REFERENCES phieu_dich_vu(id),
	FOREIGN KEY (id_hoa_don) REFERENCES hoa_don(id),
	FOREIGN KEY (id_phong) REFERENCES phong(id)
)
create table danh_gia(
	id INT IDENTITY(1,1) PRIMARY KEY,
	id_khach_hang INT,
	id_phong INT NULL,
	stars INT,
	nhan_xet NVARCHAR(255),
	ngay_tao DATETIME,
	ngay_sua DATETIME,
	FOREIGN KEY (id_khach_hang) REFERENCES khach_hang(id),
	FOREIGN KEY (id_phong) REFERENCES phong(id)
)



insert into nhan_vien(ma_nhan_vien,ho_ten,ngay_sinh,gioi_tinh,dia_chi,sdt,email,chuc_vu,ngay_tao,ngay_sua,trang_thai)
values('NV001',N'Nguyễn Xuân Chiến','2001-01-01',N'Nam',N'Hà Nội','0974567728','abc@gmail.com',N'Nhân viên',GETDATE(),GETDATE(),N'Hoạt động'),
('NV002',N'Trần Xuân Dũng','2001-01-01',N'Nam',N'Hải Phòng','0974567728','abc@gmail.com',N'Nhân viên',GETDATE(),GETDATE(),N'Hoạt động'),
('NV003',N'Đỗ Xuân Hoàng','2001-01-01',N'Nam',N'Hà Nội','0974567728','abc@gmail.com',N'Nhân viên',GETDATE(),GETDATE(),N'Hoạt động'),
('NV004',N'Hoàng Lan Mai','2001-01-01',N'Nữ',N'Huế','0974567728','abc@gmail.com',N'Nhân viên',GETDATE(),GETDATE(),N'Hoạt động'),
('NV005',N'Nguyễn Khánh Linh','2001-01-01',N'Nữ',N'Hà Nội','0974567728','abc@gmail.com',N'Nhân viên',GETDATE(),GETDATE(),N'Hoạt động')


INSERT INTO khach_hang(ho_ten, ngay_sinh, gioi_tinh, dia_chi, sdt, email, ngay_tao, ngay_sua, trang_thai)
VALUES 
(N'Tran Van A', '1990-01-01', N'Nam', N'Hà Nội', '0912345678', 'a@gmail.com', GETDATE(), GETDATE(), N'Hoạt động'),
(N'Nguyen Thi B', '1992-02-02', N'Nữ', N'HCMC', '0912345679', 'b@gmail.com', GETDATE(), GETDATE(), N'Hoạt động'),
(N'Le Van C', '1994-03-03', N'Nam', N'Đà Nẵng', '0912345680', 'c@gmail.com', GETDATE(), GETDATE(), N'Hoạt động'),
(N'Pham Thi D', '1996-04-04', N'Nữ', N'Huế', '0912345681', 'd@gmail.com', GETDATE(), GETDATE(), N'Hoạt động'),
(N'Do Van E', '1998-05-05', N'Nam', N'Cần Thơ', '0912345682', 'e@gmail.com', GETDATE(), GETDATE(), N'Hoạt động');

-- Insert sample data into TaiKhoan
INSERT INTO tai_khoan(id_nhan_vien, ten_dang_nhap, mat_khau, trang_thai)
VALUES 
(1, 'user1', 'password1', N'Hoạt động'),
(2, 'user2', 'password2', N'Hoạt động'),
(3, 'user3', 'password3', N'Hoạt động'),
(4, 'user4', 'password4', N'Hoạt động'),
(5, 'user5', 'password5', N'Hoạt động');

-- Insert sample data into TienNghi
INSERT INTO tien_nghi (ma_tien_nghi, ten_tien_nghi, so_luong_ton, don_gia, trang_thai)
VALUES 
('TN001', N'TV', 10, 5000000, N'Hoạt động'),
('TN002', N'Máy lạnh', 15, 7000000, N'Hoạt động'),
('TN003', N'Tủ lạnh', 20, 3000000, N'Hoạt động'),
('TN004', N'Máy giặt', 5, 8000000, N'Hoạt động'),
('TN005', N'Lò vi sóng', 7, 2000000, N'Hoạt động');

-- Insert sample data into Phong
INSERT INTO phong (ma_phong, ten_phong, hinh_anh, ngay_tao, ngay_sua, trang_thai, tinh_trang)
VALUES 
('P001', N'Phòng 1', 'image1.jpg', GETDATE(), GETDATE(), N'Hoạt động', N'Trống'),
('P002', N'Phòng 2', 'image2.jpg', GETDATE(), GETDATE(), N'Hoạt động', N'Trống'),
('P003', N'Phòng 3', 'image3.jpg', GETDATE(), GETDATE(), N'Hoạt động', N'Trống'),
('P004', N'Phòng 4', 'image4.jpg', GETDATE(), GETDATE(), N'Hoạt động', N'Trống'),
('P005', N'Phòng 5', 'image5.jpg', GETDATE(), GETDATE(), N'Hoạt động', N'Trống');

-- Insert sample data into LoaiPhong
INSERT INTO loai_phong (id_phong, ma_loai_phong, ten_loai_phong, suc_chua, gia_theo_gio, gia_qua_dem, hinh_anh, ghi_chu, trang_thai)
VALUES 
(1, 'LP001', N'Loại 1', 2, 50000, 300000, 'loai1.jpg', N'Note 1', N'Hoạt động'),
(2, 'LP002', N'Loại 2', 3, 70000, 400000, 'loai2.jpg', N'Note 2', N'Hoạt động'),
(3, 'LP003', N'Loại 3', 4, 90000, 500000, 'loai3.jpg', N'Note 3', N'Hoạt động'),
(4, 'LP004', N'Loại 4', 2, 60000, 350000, 'loai4.jpg', N'Note 4', N'Hoạt động'),
(5, 'LP005', N'Loại 5', 3, 80000, 450000, 'loai5.jpg', N'Note 5', N'Hoạt động');

-- Insert sample data into LoaiPhong_TienNghi
INSERT INTO loai_phong_tien_nghi(id_loai_phong, id_tien_nghi, so_luong_cung_cap)
VALUES 
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 1);

-- Insert sample data into PhieuDatPhong
INSERT INTO phieu_dat_phong(id_khach_hang, id_loai_phong, ma_dat_phong, thoi_gian_dat, thoi_gian_vao_du_kien, thoi_gian_ra_du_kien, so_nguoi, so_phong, trang_thai)
VALUES 
(1, 1, 'DP001', GETDATE(), GETDATE(), GETDATE()+1, 2, 1, N'Đặt thành công'),
(2, 2, 'DP002', GETDATE(), GETDATE(), GETDATE()+1, 3, 1, N'Đặt thành công'),
(3, 3, 'DP003', GETDATE(), GETDATE(), GETDATE()+1, 4, 1, N'Đặt thành công'),
(4, 4, 'DP004', GETDATE(), GETDATE(), GETDATE()+1, 2, 1, N'Đặt thành công'),
(5, 5, 'DP005', GETDATE(), GETDATE(), GETDATE()+1, 3, 1, N'Đặt thành công');

-- Insert sample data into HoaDon
INSERT INTO hoa_don (id_phieu_dat_phong, id_tai_khoan, id_khach_hang, tong_tien, trang_thai)
VALUES 
(1, 1, 1, 300000, N'Đã thanh toán'),
(2, 2, 2, 400000, N'Đã thanh toán'),
(3, 3, 3, 500000, N'Đã thanh toán'),
(4, 4, 4, 350000, N'Đã thanh toán'),
(5, 5, 5, 450000, N'Đã thanh toán');

-- Insert sample data into DichVu
INSERT INTO dich_vu (ten_dich_vu, don_gia, mo_ta, hinh_anh, trang_thai)
VALUES 
(N'Dich Vu 1', 100000, N'Mo Ta 1', 'dichvu1.jpg', N'Hoạt động'),
(N'Dich Vu 2', 200000, N'Mo Ta 2', 'dichvu2.jpg', N'Hoạt động'),
(N'Dich Vu 3', 300000, N'Mo Ta 3', 'dichvu3.jpg', N'Hoạt động'),
(N'Dich Vu 4', 400000, N'Mo Ta 4', 'dichvu4.jpg', N'Hoạt động'),
(N'Dich Vu 5', 500000, N'Mo Ta 5', 'dichvu5.jpg', N'Hoạt động');

-- Insert sample data into PhieuDichVu
INSERT INTO phieu_dich_vu (id_dich_vu, so_luong_su_dung, thanh_tien)
VALUES 
(1, 1, 100000),
(2, 2, 400000),
(3, 3, 900000),
(4, 4, 1600000),
(5, 5, 2500000);

-- Insert sample data into ChiTietHoaDon
INSERT INTO chi_tiet_hoa_don(id_phieu_dich_vu, id_hoa_don, id_phong, hinh_thuc_thue, thoi_gian_ra, thoi_gian_thue, tien_phong, tien_dich_vu, tong_tien)
VALUES 
(1, 1, 1, N'Theo giờ', GETDATE(), GETDATE()-1, 300000, 100000, 400000),
(2, 2, 2, N'Qua đêm', GETDATE(), GETDATE()-1, 400000, 200000, 600000),
(3, 3, 3, N'Qua đêm', GETDATE(), GETDATE()-1, 500000, 300000, 800000),
(4, 4, 4, N'Theo giờ', GETDATE(), GETDATE()-1, 350000, 400000, 750000),
(5, 5, 5, N'Theo giờ', GETDATE(), GETDATE()-1, 450000, 500000, 950000);

-- Insert sample data into DanhGia
INSERT INTO danh_gia(id_khach_hang, id_phong, stars, nhan_xet, ngay_tao, ngay_sua)
VALUES 
(1, 1, 5, N'Tuyệt vời', GETDATE(), GETDATE()),
(2, 2, 4, N'Tốt', GETDATE(), GETDATE()),
(3, 3, 3, N'Tạm được', GETDATE(), GETDATE()),
(4, 4, 2, N'Không tốt', GETDATE(), GETDATE()),
(5, 5, 1, N'Rất tệ', GETDATE(), GETDATE());

select * FROM dich_vu
SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'dich_vu';
SELECT * FROM sys.database_principals;
SELECT DB_NAME() AS DatabaseName;
SELECT SCHEMA_NAME() AS SchemaName;
