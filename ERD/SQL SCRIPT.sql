Create database DuAnCuoiKy ; 
GO 
USE DuAnCuoiKy;
GO
CREATE TABLE TaiKhoan (
    MaTaiKhoan VARCHAR(30) PRIMARY KEY,
    SDT INTEGER,
    MatKhau VARCHAR(50)
);

Create TABLE NguoiDung (
    MaNguoiDung CHAR(5) PRIMARY KEY,
    MaTaiKhoan VARCHAR(30),
    Ten NVARCHAR(50),
	 GioiTinh bit ,
    CCCD INTEGER,
    foreign key  (MaTaiKhoan) REFERENCES TaiKhoan(MaTaiKhoan)
);

CREATE TABLE NhanVienShopee (
    MaNhanVienShopee CHAR(10) PRIMARY KEY,
    MaNguoiDung CHAR(5),
    PhongBan NVARCHAR(50),
    FOREIGN KEY (MaNguoiDung) REFERENCES NguoiDung(MaNguoiDung)
);

CREATE TABLE NhanVienNganHang (
    MaNhanVienNganHang CHAR(10) PRIMARY KEY,
    MaNguoiDung CHAR(5),
    PhongBan NVARCHAR(50),
    FOREIGN KEY (MaNguoiDung) REFERENCES NguoiDung(MaNguoiDung)
);

CREATE TABLE KhachHang (
    MaKhachHang CHAR(5) PRIMARY KEY,
    MaNguoiDung CHAR(5),
    DiemTinDung INT,
    HangThanhVien NVARCHAR(50),
    FOREIGN KEY (MaNguoiDung) REFERENCES NguoiDung(MaNguoiDung)
);

CREATE TABLE DonHang (
    MaDonHang CHAR(10) PRIMARY KEY,
    MaKhachHang CHAR(5),
	 DiaChiGiaoHang NVARCHAR(100),
    GiaTriDonHang float ,
    TrangThai NVARCHAR(50),
    NgayDatHang DATE,
    NgayGiaoHang DATE,
    FOREIGN KEY (MaKhachHang) REFERENCES KhachHang(MaKhachHang)
);
CREATE TABLE SanPham (
    MaSanPham CHAR(6) PRIMARY KEY,
    TenSanPham NVARCHAR(50),
    GiaSanPham float,
    TonKho INTEGER,
    MoTa NVARCHAR(300)
);

CREATE TABLE MaUuDai (
    MaSoUuDai CHAR(5) PRIMARY KEY,
    TenMa NVARCHAR(50)
);

create TABLE GiaTri (
    MaSanPham CHAR(6),
    MaSoUuDai CHAR(5),
    KhauTru FLOAT,
    PRIMARY KEY (MaSanPham, MaSoUuDai),
    FOREIGN KEY (MaSanPham) REFERENCES SanPham(MaSanPham), 
	 FOREIGN KEY (MaSoUuDai) REFERENCES MaUuDai(MaSoUuDai)
);
CREATE TABLE HoaDon (
 MaHoaDon CHAR(10) PRIMARY KEY,
    MaSanPham CHAR(6),
    MaDonHang CHAR(10),
    NgayPhatHanh DATETIME,
    MoTa VARCHAR(50),
    PhuongThucGui NVARCHAR(50),
    FOREIGN KEY (MaSanPham) REFERENCES SanPham(MaSanPham),
    FOREIGN KEY (MaDonHang) REFERENCES DonHang(MaDonHang)
);

CREATE TABLE PhieuHoTroKH (
    MaPhieuHoTro CHAR(10) PRIMARY KEY,
    MaNhanVienShopee CHAR(10),
    MaKhachHang CHAR(5),
    TrangThai NVARCHAR(50),
    MoTa NVARCHAR(50),
    Ngay DATETIME,
    FOREIGN KEY (MaNhanVienShopee) REFERENCES      NhanVienShopee(MaNhanVienShopee),
    FOREIGN KEY (MaKhachHang) REFERENCES KhachHang(MaKhachHang)
);

CREATE TABLE NganHang (
    MaNganHang CHAR(10) PRIMARY KEY,
    TenNganHang NVARCHAR(50)
);

CREATE TABLE LichSuLienKet (
    MaLienKet CHAR(5) PRIMARY KEY,
    NgayLienKet DATE,
	 MaNganHang CHAR(10),
    MaKhachHang CHAR(5),
    FOREIGN KEY (MaNganHang) REFERENCES NganHang(MaNganHang),
    FOREIGN KEY (MaKhachHang) REFERENCES KhachHang(MaKhachHang)
);

CREATE TABLE KyHan (
    MaKyHan CHAR(5) PRIMARY KEY,
    Thang INT,
    ChiPhi float
);

CREATE TABLE KhoanVay (
    MaKhoanVay CHAR(5) PRIMARY KEY,
    MaKhachHang CHAR(5),
    MaKyHan CHAR(5),
    SoLuong INTEGER,
    FOREIGN KEY (MaKhachHang) REFERENCES KhachHang(MaKhachHang),
    FOREIGN KEY (MaKyHan) REFERENCES KyHan(MaKyHan)
);

CREATE TABLE HoSoTinDung (
    MaHoSoKhachHang CHAR(5) PRIMARY KEY,
    MaKhachHang CHAR(5),
    MaNhanVienNganHang CHAR(10),
    DiemTinDung INTEGER,
    HanMucTinDung INTEGER,
   LichSuTraNo DATE,
    FOREIGN KEY (MaKhachHang) REFERENCES KhachHang(MaKhachHang),
    FOREIGN KEY ( MaNhanVienNganHang ) REFERENCES  
	NhanVienNganHang(  MaNhanVienNganHang)
);


