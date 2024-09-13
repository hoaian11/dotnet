Create database Eshopper
use Eshopper
-- Tạo bảng tChatLieu
CREATE TABLE tChatLieu (
    MaChatLieu INT PRIMARY KEY,
    ChatLieu NVARCHAR(50)
);

-- Tạo bảng tLoaiSP
CREATE TABLE tLoaiSP (
    MaLoai INT PRIMARY KEY,
    Loai NVARCHAR(50)
);

-- Tạo bảng tLoaiDT
CREATE TABLE tLoaiDT (
    MaDT INT PRIMARY KEY,
    TenLoai NVARCHAR(50)
);

-- Tạo bảng tHangSX
CREATE TABLE tHangSX (
    MaHangSX INT PRIMARY KEY,
    HangSX NVARCHAR(50),
    MaNuocThuongHieu INT
);

-- Tạo bảng tQuocGia
CREATE TABLE tQuocGia (
    MaNuoc INT PRIMARY KEY,
    TenNuoc NVARCHAR(50)
);

-- Tạo bảng tAnhSP
CREATE TABLE tAnhSP (
    MaSP INT,
    TenFileAnh NVARCHAR(255),
    ViTri NVARCHAR(255),
    PRIMARY KEY (MaSP, TenFileAnh)
);

-- Tạo bảng tDanhMucSP
CREATE TABLE tDanhMucSP (
    MaSP INT PRIMARY KEY,
    TenSP NVARCHAR(255),
    MaChatLieu INT,
    NganLapTop NVARCHAR(255),
    Model NVARCHAR(50),
    CanNang FLOAT,
    DoNoi NVARCHAR(255),
    MaHangSX INT,
    MaNuocSX INT,
    MaDacTinh INT,
    Website NVARCHAR(255),
    ThoiGianBaoHanh NVARCHAR(50),
    GioiThieuSP NVARCHAR(MAX),
    ChietKhau FLOAT,
    MaLoai INT,
    MaDT INT,
    AnhDaiDien NVARCHAR(255),
    GiaNhoNhat FLOAT,
    GiaLonNhat FLOAT,
    FOREIGN KEY (MaChatLieu) REFERENCES tChatLieu(MaChatLieu),
    FOREIGN KEY (MaHangSX) REFERENCES tHangSX(MaHangSX),
    FOREIGN KEY (MaNuocSX) REFERENCES tQuocGia(MaNuoc),
    FOREIGN KEY (MaLoai) REFERENCES tLoaiSP(MaLoai),
    FOREIGN KEY (MaDT) REFERENCES tLoaiDT(MaDT)
);

-- Tạo bảng tMauSac
CREATE TABLE tMauSac (
    MaMauSac INT PRIMARY KEY,
    TenMauSac NVARCHAR(50)
);

-- Tạo bảng tKichThuoc
CREATE TABLE tKichThuoc (
    MaKichThuoc INT PRIMARY KEY,
    KichThuoc NVARCHAR(50)
);

-- Tạo bảng tChiTietSanPham
CREATE TABLE tChiTietSanPham (
    MaChiTietSP INT PRIMARY KEY,
    MaSP INT,
    MaKichThuoc INT,
    MaMauSac INT,
    AnhDaiDien NVARCHAR(255),
    Video NVARCHAR(255),
    DonGiaBan FLOAT,
    GiamGia FLOAT,
    SLTon INT,
    FOREIGN KEY (MaSP) REFERENCES tDanhMucSP(MaSP),
    FOREIGN KEY (MaKichThuoc) REFERENCES tKichThuoc(MaKichThuoc),
    FOREIGN KEY (MaMauSac) REFERENCES tMauSac(MaMauSac)
);

-- Tạo bảng tAnhChiTietSP
CREATE TABLE tAnhChiTietSP (
    MaChiTietSP INT,
    TenFileAnh NVARCHAR(255),
    ViTri NVARCHAR(255),
    PRIMARY KEY (MaChiTietSP, TenFileAnh),
    FOREIGN KEY (MaChiTietSP) REFERENCES tChiTietSanPham(MaChiTietSP)
);

-- Tạo bảng tUser
CREATE TABLE tUser (
    username NVARCHAR(50) PRIMARY KEY,
    password NVARCHAR(255),
    LoaiUser NVARCHAR(50)
);

-- Tạo bảng tKhachHang
CREATE TABLE tKhachHang (
    MaKhachHang INT PRIMARY KEY,
    username NVARCHAR(50),
    TenKhachHang NVARCHAR(255),
    NgaySinh DATE,
    SoDienThoai NVARCHAR(20),
    DiaChi NVARCHAR(255),
    LoaiKhachHang NVARCHAR(50),
    AnhDaiDien NVARCHAR(255),
    GhiChu NVARCHAR(MAX),
    FOREIGN KEY (username) REFERENCES tUser(username)
);

-- Tạo bảng tNhanVien
CREATE TABLE tNhanVien (
    MaNhanVien INT PRIMARY KEY,
    username NVARCHAR(50),
    TenNhanVien NVARCHAR(255),
    NgaySinh DATE,
    SoDienThoai1 NVARCHAR(20),
    SoDienThoai2 NVARCHAR(20),
    DiaChi NVARCHAR(255),
    ChucVu NVARCHAR(50),
    AnhDaiDien NVARCHAR(255),
    GhiChu NVARCHAR(MAX),
    FOREIGN KEY (username) REFERENCES tUser(username)
);

-- Tạo bảng tHoaDonBan
CREATE TABLE tHoaDonBan (
    MaHoaDon INT PRIMARY KEY,
    NgayHoaDon DATE,
    MaKhachHang INT,
    MaNhanVien INT,
    TongTienHD FLOAT,
    GiamGiaHD FLOAT,
    PhuongThucThanhToan NVARCHAR(50),
    MaSoThue NVARCHAR(50),
    ThongTinThue NVARCHAR(255),
    GhiChu NVARCHAR(MAX),
    FOREIGN KEY (MaKhachHang) REFERENCES tKhachHang(MaKhachHang),
    FOREIGN KEY (MaNhanVien) REFERENCES tNhanVien(MaNhanVien)
);

-- Tạo bảng tChiTietHDB
CREATE TABLE tChiTietHDB (
    MaHoaDon INT,
    MaChiTietSP INT,
    SoLuongBan INT,
    DonGiaBan FLOAT,
    GiamGia FLOAT,
    GhiChu NVARCHAR(MAX),
    PRIMARY KEY (MaHoaDon, MaChiTietSP),
    FOREIGN KEY (MaHoaDon) REFERENCES tHoaDonBan(MaHoaDon),
    FOREIGN KEY (MaChiTietSP) REFERENCES tChiTietSanPham(MaChiTietSP)
);
