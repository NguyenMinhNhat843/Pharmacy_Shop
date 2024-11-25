DROP DATABASE IF EXISTS Pharmacy;
CREATE DATABASE Pharmacy;
USE Pharmacy;

-- Bảng Account
DROP TABLE IF EXISTS Account;
CREATE TABLE Account (
    id NVARCHAR(50) PRIMARY KEY,
    username NVARCHAR(100) NOT NULL,
    password NVARCHAR(100) NOT NULL,
    type NVARCHAR(20) NOT NULL
);

-- Bảng Phiếu Thông Tin 
DROP TABLE IF EXISTS PhieuThongTin;
CREATE TABLE PhieuThongTin (
    id NVARCHAR(50) PRIMARY KEY,
    firstName NVARCHAR(100) NOT NULL,
    lastName NVARCHAR(100) NOT NULL,
    diaChi NVARCHAR(255),
    soDienThoai NVARCHAR(15) NOT NULL,
    email NVARCHAR(100),
    namSinh INT,
    accountId NVARCHAR(50) NULL,
    FOREIGN KEY (accountId) REFERENCES Account(id) ON DELETE SET NULL
);

-- Bảng Khuyến Mãi
DROP TABLE IF EXISTS KhuyenMai;
CREATE TABLE KhuyenMai (
    id NVARCHAR(50) PRIMARY KEY,
    name NVARCHAR(100),
    moTa NVARCHAR(MAX),
    ngayBatDau DATETIME,
    ngayKetThuc DATETIME,
    phanTramGiamGia FLOAT,
    giaTriGiamToiThieu FLOAT
);

-- Bảng Loại Sản Phẩm (Type_Product)
DROP TABLE IF EXISTS Type_Product;
CREATE TABLE Type_Product (
    id NVARCHAR(50) PRIMARY KEY,
    name NVARCHAR(100) NOT NULL
);

-- Bảng Sản Phẩm
DROP TABLE IF EXISTS SanPham;

CREATE TABLE SanPham (
    id NVARCHAR(50) PRIMARY KEY,
    tenSanPham NVARCHAR(255),
    giaBan FLOAT,
    image NVARCHAR(255),
    soLuong INT,
    soLuongDaBan INT,
    soLuongConLai INT,
    Type NVARCHAR(50),
    FOREIGN KEY (Type) REFERENCES Type_Product(id)
);

-- Bảng sanpham_khuyenmai: Lưu trữ quan hệ giữa sản phẩm và khuyến mãi
DROP TABLE IF EXISTS Sanpham_Khuyenmai;
CREATE TABLE Sanpham_Khuyenmai (
    idSanPham NVARCHAR(50),
    idKhuyenMai NVARCHAR(50),
    PRIMARY KEY (idSanPham, idKhuyenMai),
    FOREIGN KEY (idSanPham) REFERENCES SanPham(id),
    FOREIGN KEY (idKhuyenMai) REFERENCES KhuyenMai(id)
);

-- Bảng Đơn Hàng
DROP TABLE IF EXISTS DonHang;
CREATE TABLE DonHang (
    id NVARCHAR(50) PRIMARY KEY,
    idSanPham NVARCHAR(50) NOT NULL,
    idPhieuThongTin NVARCHAR(50),
    phuongThucThanhToan NVARCHAR(100) NOT NULL,
    ngayTaoHoaDon DATETIME NOT NULL,
    tongTien DECIMAL(10, 2) NULL,
    FOREIGN KEY (idSanPham) REFERENCES SanPham(id),
    FOREIGN KEY (idPhieuThongTin) REFERENCES PhieuThongTin(id)
);

-- Bảng Chi Tiết Đơn Hàng
DROP TABLE IF EXISTS ChiTietDonHang;
CREATE TABLE ChiTietDonHang (
    idDonHang NVARCHAR(50),
    idSanPham NVARCHAR(50),
    soLuong INT NOT NULL,
    thanhTien DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (idDonHang, idSanPham),
    FOREIGN KEY (idDonHang) REFERENCES DonHang(id),
    FOREIGN KEY (idSanPham) REFERENCES SanPham(id)
);

-- Bảng Giỏ Hàng
DROP TABLE IF EXISTS GioHang;

CREATE TABLE GioHang (
    id NVARCHAR(50) PRIMARY KEY,
    idPhieuThongTin NVARCHAR(50) NOT NULL,
    ngayTao DATETIME NOT NULL,
    FOREIGN KEY (idPhieuThongTin) REFERENCES PhieuThongTin(id)
);

-- Bảng Chi Tiết Giỏ Hàng
DROP TABLE IF EXISTS ChiTietGioHang;
CREATE TABLE ChiTietGioHang (
    idGioHang NVARCHAR(50),
    idSanPham NVARCHAR(50),
    soLuong INT NOT NULL,
    giaBan DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (idGioHang, idSanPham),
    FOREIGN KEY (idGioHang) REFERENCES GioHang(id),
    FOREIGN KEY (idSanPham) REFERENCES SanPham(id)
);

INSERT INTO Account (id, username, password, type) 
VALUES
('AC001', N'nguyenminhnhat', N'nguyenminhnhat1', N'admin'),
('AC002', N'trantrongnhan', N'trantrongnhan1', N'admin'),
('AC003', N'lephuocnguyen', 'lephuocnguyen1', 'admin'),
('AC004', N'nguyentiendat', 'nguyentiendat1', 'admin'),
('AC005', N'dangthimongtho', 'dangthimongtho1', 'admin'),
('AC006', 'nguyenhaif', 'nguyenhaif303', 'custom'),
('AC007', 'lemaig', 'lemaig404', 'custom'),
('AC008', 'tranquangh', 'tranquangh505', 'custom'),
('AC009', 'phamthaoi', 'phamthaoi606', 'custom'),
('AC010', 'doquyj', 'doquyj707', 'custom'),
('AC011', 'nguyenmink', 'nguyenmink808', 'custom'),
('AC012', 'lethil', 'lethil909', 'custom'),
('AC013', 'tranhai', 'tranhai1010', 'custom'),
('AC014', 'phamlann', 'phamlann1111', 'custom'),
('AC015', 'doquango', 'doquango1212', 'custom'),
('AC016', 'nguyenminhp', 'nguyenminhp1313', 'custom'),
('AC017', 'lethiq', 'lethiq1414', 'custom'),
('AC018', 'tranhoangr', 'tranhoangr1515', 'custom'),
('AC019', 'nguyenhoangt', 'nguyenhoangt1616', 'custom'),
('AC020', 'lequangv', 'lequangv1717', 'custom'),
('AC021', 'phamthinhw', 'phamthinhw1818', 'custom'),
('AC022', 'nguyenquocx', 'nguyenquocx1919', 'custom'),
('AC023', 'lehongy', 'lehongy2020', 'custom'),
('AC024', 'tranthantz', 'tranthantz2121', 'custom'),
('AC025', 'phamthun', 'phamthun2222', 'custom');


INSERT INTO PhieuThongTin (id, firstName, lastName, diaChi, soDienThoai, email, namSinh, accountId)
VALUES
(N'PT001', N'Nguyễn', N'Minh Nhật', N'123 Nguyễn Trãi, TP.HCM', N'0987654322', N'nguyenvana1@example.com', 1995, N'AC001'),
(N'PT002', N'Trần', N'Trọng Nhân', N'456 Lê Lai, TP.HCM', N'0912345679', N'tranthib1@example.com', 1990, N'AC002'),
(N'PT003', N'Lê', N'Phước Nguyên', N'789 Hồng Bàng, TP.HCM', N'0901234568', N'leminhc1@example.com', 1988, N'AC003'),
(N'PT004', N'Nguyễn', N'Tiến Đạt', N'101 Cầu Giấy, Hà Nội', N'0981234568', N'phamhoangd1@example.com', 1992, N'AC004'),
(N'PT005', N'Đặng', N'Thị Mộng Thơ ', N'202 Phan Đình Phùng, Đà Nẵng', N'0912341235', N'dolan1@example.com', 1997, N'AC005'),
(N'PT006', N'Nguyễn', N'Hải Dương', N'303 Nguyễn Thiên Thuật, TP.HCM', N'0987656780', N'nguyenhaif1@example.com', 1994, NULL),
(N'PT007', N'Lê', N'Mai Giang', N'404 Trần Hưng Đạo, Hà Nội', N'0912342346', N'lemaig1@example.com', 1993, N'AC007'),
(N'PT008', N'Trần', N'Quang Hùng', N'505 Lê Duẩn, Đà Nẵng', N'0908765433', N'tranquangh1@example.com', 1991, NULL),
(N'PT009', N'Phạm', N'Thảo I', N'606 Võ Thị Sáu, TP.HCM', N'0934567891', N'phamthaoi1@example.com', 1996, N'AC009'),
(N'PT010', N'Đỗ', N'Quý Quý', N'707 Thanh Đa, TP.HCM', N'0905678902', N'doquyj1@example.com', 1994, NULL),
(N'PT011', N'Nguyễn', N'Minh KHải', N'808 Lý Tự Trọng, Đà Nẵng', N'0923456780', N'nguyenmink1@example.com', 1987, N'AC011'),
(N'PT012', N'Lê', N'Thị Lan', N'909 Bảo Sơn, Hà Nội', N'0915678902', N'lethil1@example.com', 1989, N'AC012'),
(N'PT013', N'Trần', N'Hải', N'1010 Lê Thanh Tôn, TP.HCM', N'0908765433', N'tranhai1@example.com', 1992, NULL),
(N'PT014', N'Phạm', N'Lân', N'1111 Phạm Ngọc Thạch, Đà Nẵng', N'0934567892', N'phamlann1@example.com', 1993, N'AC014'),
(N'PT015', N'Đỗ', N'Quang O', N'1212 Đồng Khởi, TP.HCM', N'0901122335', N'doquango1@example.com', 1985, NULL),
(N'PT016', N'Nguyễn', N'Minh P', N'1313 Tân Bình, TP.HCM', N'0911222335', N'nguyenminhp1@example.com', 1988, NULL),
(N'PT017', N'Lê', N'Thị Quan', N'1414 Nguyễn Thị Minh Khai, Đà Nẵng', N'0922334456', N'lethiq1@example.com', 1992,NULL),
(N'PT018', N'Trần', N'Hoàng Hải', N'1515 Lê Quang Diệu, TP.HCM', N'0933445567', N'tranhoangr1@example.com', 1990, N'AC018'),
(N'PT019', N'Nguyễn', N'Hoàng Thành', N'1616 An Dương Vương, Đà Nẵng', N'0944556678', N'nguyenhoangt1@example.com', 1994,NULL),
(N'PT020', N'Lê', N'Quang Vinh', N'1717 Bạch Đằng, Hà Nội', N'0901239877', N'lequangv1@example.com', 1995, N'AC020'),
(N'PT021', N'Phạm', N'Thịnh ', N'1818 Lê Lợi, TP.HCM', N'0935678903', N'phamthinhw1@example.com', 1991, NULL),
(N'PT022', N'Nguyễn', N'Quốc ', N'1919 Trần Cao Văn, TP.HCM', N'0909876544', N'nguyenquocx1@example.com', 1989, N'AC022'),
(N'PT023', N'Lê', N'Hồng ', N'2020 Hai Bà Trưng, Đà Nẵng', N'0911234568', N'lehongy1@example.com', 1990, N'AC023'),
(N'PT024', N'Trần', N'Thanh ', N'2121 Nguyễn Du, TP.HCM', N'0923459877', N'tranthantz1@example.com', 1993, N'AC024'),
(N'PT025', N'Phạm', N'Thu ', N'2222 Tân Sơn Nhất, Đà Nẵng', N'0934561235', N'phamthun1@example.com', 1997, NULL);

INSERT INTO Type_Product (id, name)
VALUES
(N'TP001', N'Thực phẩm chức năng'),
(N'TP002', N'Thuốc không kê đơn'),
(N'TP003', N'Dụng cụ y tế'),
(N'TP004', N'Sản phẩm chăm sóc sức khỏe');

INSERT INTO SanPham (id, tenSanPham, giaBan, image, soLuong, soLuongDaBan, soLuongConLai, Type) 
VALUES 
('SP001', N'Wellness Nutrition', 367.500, 'https://production-cdn.pharmacity.io/digital/320x320/plain/e-com/images/ecommerce/20241031060619-1-P16618_1.png?versionId=.NzvaXpVp3I7JJokqItqfZjJGFquLsSi', 200, 120, 80, N'TP001'),
('SP002', N'Viên uống Nature Gift', 405.000, 'https://production-cdn.pharmacity.io/digital/828x828/plain/e-com/images/ecommerce/20240731095145-1-P21576_1.png', 200, 150, 50, N'TP001'),
('SP003', N'Nước uống đông trùng hạ thảo Welson Cordyceps giúp bồi bổ sức khỏe (Hộp 10 chai x 75ml)', 258.500, 'https://production-cdn.pharmacity.io/digital/828x828/plain/e-com/images/ecommerce/20240630024959-1-P19038_1.png', 150, 90, 60, N'TP001'),
('SP004', N'Sữa bột dinh dưỡng ABBOTT PROSURE bổ sung dinh dưỡng đặc biệt cho người sụt cân , suy kiệt (380g)', 450.000, 'https://production-cdn.pharmacity.io/digital/828x828/plain/e-com/images/ecommerce/P17817_1_l.webp', 300, 200, 100, N'TP001'),
('SP005', N'Máy đo huyết áp bắp tay tự động OMRON HEM 7124 cho kết quả chính xác, nhanh chóng (hộp 1 cái)', 1290.000, 'https://production-cdn.pharmacity.io/digital/828x828/plain/e-com/images/ecommerce/P26438_1.jpg', 450, 300, 150, N'TP003'),
('SP006', N'Máy đo đường huyết cầm tay Accu-Chek Active giúp kiểm tra lượng đường trong máu chính xác, nhanh chóng', 850.000, 'https://cdn.nhathuoclongchau.com.vn/unsafe/375x0/f…et_accuchek_active_6512_5b83_large_fed146d2f6.JPG', 450, 250, 200, N'TP003'),
('SP007', N'Kem dưỡng da trắng hồng tinh khiết ban đêm Ponds (50g)', 175.000, 'https://production-cdn.pharmacity.io/digital/768x768/plain/e-com/images/ecommerce/P03354.png', 700, 400, 300, N'TP004'),
('SP008', N'Nước uống Kolmar Tinh Nghệ Condition Curcumin Fast giúp giảm viêm loét dạ dày (100ml)', 320.000, 'https://production-cdn.pharmacity.io/digital/768x768/plain/e-com/images/ecommerce/P18158_1.jpg', 300, 180, 120, N'TP001'),
('SP009', N'Bột uống FERROLIP bổ sung sắt (Hộp 20 gói)', 230.000, 'https://production-cdn.pharmacity.io/digital/768x7…om/images/ecommerce/20240528064014-0-P28033_1.jpg', 900, 600, 300, N'TP001'),
('SP010', N'Siro ho Annatop Pro giảm ho, giảm tiết đàm cho trẻ (Chai 120ml)', 75.000, 'https://production-cdn.pharmacity.io/digital/768x768/plain/e-com/images/ecommerce/P17654.png', 1400, 900, 500, N'TP002'),
('SP011', N'Thuốc xịt mũi Mucome trị sung huyết mũi, nghẹt mũi, sổ mũi, hắt hơi (chai 10ml)', 120.000, 'https://production-cdn.pharmacity.io/digital/768x7…_1.png?versionId=BdHAnOxdM.XOm3GvxHBdcd5GmxF8qgvC', 1200, 800, 400, N'TP002'),
('SP012', N'Viên uống Body Slim Premium hỗ trợ giảm cân (Hộp 30 viên)', 299.000, 'https://production-cdn.pharmacity.io/digital/768x768/plain/e-com/images/ecommerce/P24856_1.jpg', 450, 150, 300, N'TP001'),
('SP013', N'Dung dịch vệ sinh phụ nữ Dạ Hương', 120.000, 'https://production-cdn.pharmacity.io/digital/1080x1080/plain/e-com/images/ecommerce/P04087_11.jpg', 600, 500, 100, N'TP004'),
('SP014', N'Gel rửa tay khô Lifebuoy', 75.000, 'https://production-cdn.pharmacity.io/digital/1080x1080/plain/e-com/images/ecommerce/20241107092025-0-P01547_1.png', 1000, 800, 200, N'TP004'),
('SP015', N'Kẹo dẻo Appeton A-Z Kids Vitamin C Pastilles bổ sung vitamin C cho trẻ em (Hộp 20 gói)', 340.000, 'https://production-cdn.pharmacity.io/digital/1080x1080/plain/e-com/images/ecommerce/P25928_1.jpg', 700, 300, 400, N'TP001'),
('SP016', N'Viên uống Solgar bổ sung Vitamin D3 1000IU (Lọ 90 viên)', 250.000, 'https://production-cdn.pharmacity.io/digital/1080x1080/plain/e-com/images/ecommerce/20241107092037-0-P17805_1.png', 350, 150, 200, N'TP001'),
('SP017', N'Bột Hỗ Trợ Tẩy Trắng Răng EUCRYL Toothpowder hũ 50g', 150.000, 'https://production-cdn.pharmacity.io/digital/768x7…/e-com/images/product/20240830024133-0-P19173.png', 500, 300, 200, N'TP004'),
('SP018', N'Máy hút mụn mini', 200.000, 'https://salt.tikicdn.com/cache/w1200/ts/product/5b/ca/7c/8e7a37f9451b217fd157be7e8fb1d97f.jpg', 400, 100, 300, N'TP003'),
('SP019', N'Miếng dán hạ sốt cho bé', 45.000, 'https://production-cdn.pharmacity.io/digital/768x768/plain/e-com/images/ecommerce/P24074.png', 1500, 900, 600, N'TP002'),
('SP020', N'Kem Chống Nắng SUNPLAY Skin Aqua Silky White Gel Dưỡng Da Sáng (Tuýp 25g)', 150.000, 'https://production-cdn.pharmacity.io/digital/768x768/plain/e-com/images/ecommerce/P03808_1.jpg', 800, 400, 400, N'TP004'),
('SP021', N'Viên uống Wealthy Health tảo xoắn spirulina hữu cơ 1.000mg (Hộp 100 viên)', 890.000, 'https://production-cdn.pharmacity.io/digital/1080x1080/plain/e-com/images/ecommerce/P21994_11.png', 300, 200, 100, N'TP001'),
('SP022', N'Nước uống bổ sung collagen Alfe Beauty Conc giúp cải thiện nếp nhăn (10 chai x 50 ml)', 580.000, 'https://production-cdn.pharmacity.io/digital/1080x1080/plain/e-com/images/ecommerce/P24362_1.jpg', 150, 100, 50, N'TP001'),
('SP023', N'Máy đo nồng độ oxy bão hòa trong máu SpO2 CREATIVE MEDICAL PC-60F kết hợp đo nhịp tim (hộp 1 cái)', 750.000, 'https://production-cdn.pharmacity.io/digital/1080x1080/plain/e-com/images/ecommerce/P22142.png', 220, 180, 40, N'TP003'),
('SP024', N'Khẩu trang y tế PMC VN95 4 lớp, vải lọc cao cấp bảo vệ khỏi vi khuẩn, khói và bụi mịn (Hộp 10 cái)', 45.000, 'https://production-cdn.pharmacity.io/digital/768x768/plain/e-com/images/ecommerce/P25369.png', 3000, 2000, 1000, N'TP004'),
('SP025', N'Viên uống Pharmacity Omega – 3 Fish Oil (Chai 60 viên)', 320.000, 'https://production-cdn.pharmacity.io/digital/1080x1080/plain/e-com/images/ecommerce/20241021101137-0-P28084_1.jpg', 500, 250, 250, N'TP001'),
('SP026', N'Băng dán cá nhân Pharmacity màu da (10 miếng/gói)', 25.000, 'https://production-cdn.pharmacity.io/digital/768x768/plain/e-com/images/ecommerce/P09769.png', 4000, 3000, 1000, N'TP004'),
('SP027', N'Viên nén Paracetamol 325mg hạ sốt, giảm đau (chai 500 viên)', 150.000, 'https://production-cdn.pharmacity.io/digital/768x768/plain/e-com/images/ecommerce/P25194_1.jpg', 6000, 5000, 1000, N'TP002'),
('SP028', N'Siro bổ phế Bảo Thanh', 90.000, 'https://production-cdn.pharmacity.io/digital/768x768/plain/e-com/images/ecommerce/P11035.png', 1100, 700, 400, N'TP002'),
('SP029', N'Dung dịch Betadine antiseptic 10% sát khuẩn da và niêm mạc (chai 30ml)', 70.000, 'https://production-cdn.pharmacity.io/digital/768x768/plain/e-com/images/ecommerce/P06066.png', 1000, 800, 200, N'TP004'),
('SP030', N'Máy xông khí dung Microlife NEB200 hỗ trợ các bệnh viêm mũi, viêm xoang', 950.000, 'https://cdn.nhathuoclongchau.com.vn/unsafe/375x0/filters:quality(90)/https://cms-prod.s3-sgn09.fptcloud.com/00500441_may_xong_khi_dung_microlife_neb200_5181_629d_large_a1ffb82a94.jpg', 180, 120, 60, N'TP003'),
('SP031', N'Viên uống Blue Berry Plus Ojenvitamin bổ sung dưỡng chất cho mắt, hỗ trợ cải thiện thị lực (40 viên)', 370.000, 'https://cdn.nhathuoclongchau.com.vn/unsafe/375x0/filters:quality(90)/https://cms-prod.s3-sgn09.fptcloud.com/00018993_blue_berry_plus_ojenvitamin_new_nordic_2x20v_2634_6327_large_00cb23abcf.jpg', 250, 150, 100, N'TP001'),
('SP032', N'Nước Súc Miệng LISTERINE Tartar Protection Giảm Mảng Bám (Chai 250ml)', 125.000, 'https://production-cdn.pharmacity.io/digital/320x320/plain/e-com/images/ecommerce/20240528093602-0-P08888_1.jpg', 700, 500, 200, N'TP004'),
('SP033', N'Kem đánh răng than hoạt tính', 45.000, 'https://production-cdn.pharmacity.io/digital/768x768/plain/e-com/images/ecommerce/P14248.png', 900, 600, 300, N'TP004'),
('SP034', N'Viên uống Elevit bổ sung vitamin tổng hợp cho bà bầu (Hộp 30 viên)', 290.000, 'https://production-cdn.pharmacity.io/digital/768x768/plain/e-com/images/ecommerce/20241031060616-1-P23715_1.jpg', 400, 200, 200, N'TP001'),
('SP035', N'Cao dán Tiger Balm Plaster-RD 10X14cm giảm các triệu chứng mỏi cơ, giảm đau và nhức cơ (túi 3 miếng)', 80.000, 'https://production-cdn.pharmacity.io/digital/768x768/plain/e-com/images/ecommerce/P21611.png', 800, 400, 400, N'TP004'),
('SP036', N'Bông Tẩy Trang JOMI (Túi 120 miếng)', 30000, 'https://production-cdn.pharmacity.io/digital/320x320/plain/e-com/images/ecommerce/20241031155429-0-P18118.png', 2000, 1500, 500, N'TP004'),
('SP037', N'Máy massage Pangao PG-2601B51 xoa dịu đốt sống cổ, giúp thư giãn giảm căng thẳng', 1350000, 'https://cdn.nhathuoclongchau.com.vn/unsafe/375x0/filters:quality(90)/https://cms-prod.s3-sgn09.fptcloud.com/IMG_0310_bb7300afd1.jpg', 150, 100, 50, N'TP003'),
('SP038', N'Viên uống Kudos Digestive Enzymes bổ sung men tiêu hóa hỗ trợ tiêu hóa (Hộp 30 viên)', 240.000, 'https://production-cdn.pharmacity.io/digital/144x144/plain/e-com/images/ecommerce/20240805085037-1-P25919_1.jpg', 600, 300, 300, N'TP001'),
('SP039', N'Thuốc nhỏ mắt Refresh Tears giảm khó chịu do khô mắt, dị vật (chai 15ml)', 100.000, 'https://production-cdn.pharmacity.io/digital/768x768/plain/e-com/images/ecommerce/P00685.png', 700, 500, 200, N'TP004'),
('SP040', N'Viên uống Mỡ Máu Tâm Bình hỗ trợ giảm mỡ máu (Hộp 5 vỉ x 12 viên)', 330000, 'https://production-cdn.pharmacity.io/digital/768x768/plain/e-com/images/ecommerce/P21748_1.jpg', 300, 200, 100, N'TP001'),
('SP041', N'Biovagen Welkids Multivitamin ADKE bổ sung vitamin A, D3, K2, E cho trẻ (Chai 10ml)', 385.000, 'https://production-cdn.pharmacity.io/digital/768x768/plain/e-com/images/ecommerce/20240930044533-1-P26082_1.jpg', 100, 50, 50, N'TP004'),
('SP042', N'Bột Charz giúp bù nước và chất điện giải hương cam (Hộp 30 gói)', 266.000, 'https://production-cdn.pharmacity.io/digital/768x768/plain/e-com/images/ecommerce/P16544.png', 80, 40, 40, N'TP004'),
('SP043', N'Cốm Probiotics Lactomin Plus Novarex bổ sung vi khuẩn có ích, giúp cân bằng hệ vi sinh đường ruột (30 gói)', 187.000, 'https://production-cdn.pharmacity.io/digital/768x768/plain/e-com/images/ecommerce/20240906030301-0-P00280_1.jpg', 120, 30, 30, N'TP004'),
('SP044', N'Trà Linh Chi Ladophar hỗ trợ tăng cường chức năng gan (Hộp 34g)', 84.800, 'https://production-cdn.pharmacity.io/digital/768x768/plain/e-com/images/ecommerce/P26373_1.jpg', 150, 100, 100, N'TP001'),
('SP045', N'Bột PROANTIOBIOPLUS hỗ trợ làm giảm các triệu chứng rối loạn tiêu hóa', 490.000, 'https://production-cdn.pharmacity.io/digital/768x768/plain/e-com/images/ecommerce/P17599.png', 70, 25, 25, N'TP001'),
('SP046', N'Bột hòa tan Infogos 3g IAP chứa chất xơ hỗ trợ chống táo bón (30 gói)', 120.000, 'https://cdn.nhathuoclongchau.com.vn/unsafe/375x0/filters:quality(90)/https://cms-prod.s3-sgn09.fptcloud.com/DSC_06443_52db564d3c.jpg', 50, 35, 35, N'TP001'),
('SP047', N'Bột pha uống Enzymax Kids giúp bé tăng cường hấp thu dinh dưỡng (30 gói)', 1200.000, 'https://production-cdn.pharmacity.io/digital/768x768/plain/e-com/images/ecommerce/P27310_1.jpg', 30, 10, 10, N'TP001'),
('SP048', N'Nước uống NUCOS Collagen 7000mg & 300mg C hỗ trợ chống lão hóa, đẹp da (Hộp 10 chai x 30ml)', 1190.000, 'https://production-cdn.pharmacity.io/digital/768x768/plain/e-com/images/product/20241031102105-0-P28150_1.jpg', 40, 10, 10, N'TP004'),
('SP049', N'Viên uống Faroson Glutamax 1000 giúp làm tăng độ đàn hồi cho da, giảm lão hóa da (30 Viên)', 1215.000, 'https://production-cdn.pharmacity.io/digital/768x768/plain/e-com/images/ecommerce/P23631.png', 20, 10, 10, N'TP004'),
('SP050', N'Viên uống Kolmar Condition Woman Giúp bổ sung collagen cho da (Hộp 90 viên)', 490.000, 'https://production-cdn.pharmacity.io/digital/768x768/plain/e-com/images/ecommerce/20240930044533-1-P17358_1.png', 60, 10, 10, N'TP004');




INSERT INTO KhuyenMai (id, name, moTa, ngayBatDau, ngayKetThuc, phanTramGiamGia, giaTriGiamToiThieu)
VALUES
('KM001', N'Khuyến mãi Wellness', N'Giảm giá 10% cho sản phẩm Wellness Nutrition', '2024-11-01', '2024-11-30', 10, 100000),
('KM002', N'Khuyến mãi Nature Gift', N'Giảm giá 15% cho viên uống Nature Gift', '2024-11-01', '2024-11-30', 15, 120000),
('KM003', N'Khuyến mãi Đông Trùng', N'Giảm giá 20% cho Nước uống đông trùng hạ thảo', '2024-11-01', '2024-11-30', 20, 80000),
('KM004', N'Khuyến mãi Tăng Cân', N'Giảm giá 10% cho Bột dinh dưỡng tăng cân', '2024-11-01', '2024-11-30', 10, 100000),
('KM005', N'Khuyến mãi Accu-Chek', N'Giảm giá 15% cho Máy đo đường huyết Accu-Chek', '2024-11-01', '2024-11-30', 15, 50000),
('KM006', N'Khuyến mãi Nano Curcumin', N'Giảm giá 10% cho Tinh chất nghệ Nano Curcumin', '2024-11-01', '2024-11-30', 10, 60000),
('KM007', N'Khuyến mãi bổ sung sắt', N'Giảm giá 5% cho Viên uống bổ sung sắt', '2024-11-01', '2024-11-30', 5, 50000),
('KM008', N'Khuyến mãi Siro Ho', N'Giảm giá 20% cho Siro ho trẻ em', '2024-11-01', '2024-11-30', 20, 30000),
('KM009', N'Khuyến mãi Green Tea', N'Giảm giá 15% cho Viên uống giảm cân Green Tea', '2024-11-01', '2024-11-30', 15, 120000),
('KM010', N'Khuyến mãi Dạ Hương', N'Giảm giá 10% cho Dung dịch vệ sinh phụ nữ Dạ Hương', '2024-11-01', '2024-11-30', 10, 50000),
('KM011', N'Khuyến mãi Vitamin cho trẻ', N'Giảm giá 15% cho Vitamin tổng hợp cho trẻ em', '2024-11-01', '2024-11-30', 15, 100000),
('KM012', N'Khuyến mãi Vitamin D3', N'Giảm giá 10% cho Viên bổ sung Vitamin D3', '2024-11-01', '2024-11-30', 10, 70000),
('KM013', N'Khuyến mãi máy hút mụn', N'Giảm giá 20% cho Máy hút mụn mini', '2024-11-01', '2024-11-30', 20, 50000),
('KM014', N'Khuyến mãi hạ sốt', N'Giảm giá 10% cho Miếng dán hạ sốt cho bé', '2024-11-01', '2024-11-30', 10, 30000),
('KM015', N'Khuyến mãi chống nắng', N'Giảm giá 15% cho Kem chống nắng Sunplay', '2024-11-01', '2024-11-30', 15, 40000),
('KM016', N'Khuyến mãi Tảo Xoắn', N'Giảm giá 20% cho Tảo xoắn Spirulina', '2024-11-01', '2024-11-30', 20, 120000),
('KM017', N'Khuyến mãi Collagen', N'Giảm giá 10% cho Collagen Beauty Drink', '2024-11-01', '2024-11-30', 10, 80000),
('KM018', N'Khuyến mãi Omega-3', N'Giảm giá 15% cho Viên uống Omega-3 Fish Oil', '2024-11-01', '2024-11-30', 15, 50000),
('KM019', N'Khuyến mãi Bảo Thanh', N'Giảm giá 10% cho Siro bổ phế Bảo Thanh', '2024-11-01', '2024-11-30', 10, 40000),
('KM020', N'Khuyến mãi Betadine', N'Giảm giá 15% cho Dung dịch sát khuẩn Betadine', '2024-11-01', '2024-11-30', 15, 70000);

INSERT INTO Sanpham_Khuyenmai (idSanPham, idKhuyenMai)
VALUES
('SP001', 'KM001'),
('SP002', 'KM002'),
('SP003', 'KM003'),
('SP004', 'KM004'),
('SP005', 'KM005'),
('SP006', 'KM006'),
('SP007', 'KM007'),
('SP008', 'KM008'),
('SP009', 'KM009'),
('SP010', 'KM010');



INSERT INTO DonHang (id, idSanPham, idPhieuThongTin, ngayTaoHoaDon, phuongThucThanhToan, tongTien)
VALUES
('DH001', 'SP001', 'PT001', '2024-11-10', N'Thanh toán khi nhận hàng', 150.00),
('DH002', 'SP002', 'PT002', '2024-11-11', N'Thanh toán qua thẻ', 200.00),
('DH003', 'SP003', 'PT003', '2024-11-12', N'Thanh toán qua ví điện tử', 100.00),
('DH004', 'SP004', 'PT004', '2024-11-13', N'Thanh toán khi nhận hàng', 0.00),
('DH005', 'SP005', 'PT005', '2024-11-14', N'Thanh toán qua thẻ', 50.00),
('DH006', 'SP006', 'PT006', '2024-11-15', N'Thanh toán khi nhận hàng', 0.00),
('DH007', 'SP007', 'PT007', '2024-11-16', N'Thanh toán qua thẻ', 250.00),
('DH008', 'SP008', 'PT008', '2024-11-17', N'Thanh toán qua ví điện tử', 180.00),
('DH009', 'SP009', 'PT009', '2024-11-18', N'Thanh toán khi nhận hàng', 0.00),
('DH010', 'SP010', 'PT010', '2024-11-19', N'Thanh toán qua thẻ', 120.00),
('DH011', 'SP011', 'PT011', '2024-11-20', N'Thanh toán khi nhận hàng', 300.00),
('DH012', 'SP012', 'PT012', '2024-11-21', N'Thanh toán qua ví điện tử', 200.00),
('DH013', 'SP013', 'PT013', '2024-11-22', N'Thanh toán qua thẻ', 170.00),
('DH014', 'SP014', 'PT014', '2024-11-23', N'Thanh toán khi nhận hàng', 0.00),
('DH015', 'SP015', 'PT015', '2024-11-24', N'Thanh toán qua thẻ', 220.00),
('DH016', 'SP016', 'PT016', '2024-11-25', N'Thanh toán qua ví điện tử', 0.00),
('DH017', 'SP017', 'PT017', '2024-11-26', N'Thanh toán khi nhận hàng', 110.00),
('DH018', 'SP018', 'PT018', '2024-11-27', N'Thanh toán qua thẻ', 250.00),
('DH019', 'SP019', 'PT019', '2024-11-28', N'Thanh toán qua ví điện tử', 130.00),
('DH020', 'SP020', 'PT020', '2024-11-29', N'Thanh toán khi nhận hàng', 0.00);
INSERT INTO DonHang (id, idSanPham, idPhieuThongTin, phuongThucThanhToan, ngayTaoHoaDon, tongTien)
VALUES
('DH021', 'SP021', 'PT021', N'Thanh toán qua thẻ', '2024-11-30', 500.00),
('DH022', 'SP022', 'PT022', N'Thanh toán qua ví điện tử', '2024-12-01', 350.00),
('DH023', 'SP023', 'PT023', N'Thanh toán khi nhận hàng', '2024-12-02', 450.00),
('DH024', 'SP024', 'PT024', N'Thanh toán qua thẻ', '2024-12-03', 200.00),
('DH025', 'SP025', 'PT025', N'Thanh toán qua ví điện tử', '2024-12-04', 300.00),
('DH026', 'SP026', 'PT001', N'Thanh toán khi nhận hàng', '2024-12-05', 150.00),
('DH027', 'SP027', 'PT002', N'Thanh toán qua thẻ', '2024-12-06', 600.00),
('DH028', 'SP028', 'PT003', N'Thanh toán qua ví điện tử', '2024-12-07', 250.00),
('DH029', 'SP029', 'PT004', N'Thanh toán khi nhận hàng', '2024-12-08', 100.00),
('DH030', 'SP030', 'PT005', N'Thanh toán qua thẻ', '2024-12-09', 700.00);

INSERT INTO ChiTietDonHang (idDonHang, idSanPham, soLuong, thanhTien)
VALUES
('DH001', 'SP001', 1, 367.50),
('DH002', 'SP002', 1, 405.00),
('DH003', 'SP003', 2, 258.50),
('DH004', 'SP004', 1, 450.00),
('DH005', 'SP005', 4, 1290.00),
('DH006', 'SP006', 1, 850.00),
('DH007', 'SP007', 1, 175.00),
('DH008', 'SP008', 1, 320.00),
('DH009', 'SP009', 1, 230.00),
('DH010', 'SP010', 1, 75.00),
('DH011', 'SP011', 1, 120.00),
('DH012', 'SP012', 1, 299.00),
('DH013', 'SP013', 1, 120.00),
('DH014', 'SP014', 1, 75.00),
('DH015', 'SP015', 1, 340.00),
('DH016', 'SP016', 1, 250.00),
('DH017', 'SP017', 1, 150.00),
('DH018', 'SP018', 1, 200.00),
('DH019', 'SP019', 1, 45.00),
('DH020', 'SP020', 1, 150.00),
('DH021', 'SP021', 1, 890.00),
('DH022', 'SP022', 1, 580.00),
('DH023', 'SP023', 1, 750.00),
('DH024', 'SP024', 1, 45.00),
('DH025', 'SP025', 1, 320.00),
('DH026', 'SP026', 1, 25.00),
('DH027', 'SP027', 1, 30.00),
('DH028', 'SP028', 1, 90.00),
('DH029', 'SP029', 1, 70.00),
('DH030', 'SP030', 1, 950.000);

INSERT INTO GioHang (id, idPhieuThongTin, ngayTao)
VALUES
('GH001', 'PT001', '2024-11-01'),
('GH002', 'PT002', '2024-11-02'),
('GH003', 'PT003', '2024-11-03'),
('GH004', 'PT004', '2024-11-04'),
('GH005', 'PT005', '2024-11-05'),
('GH006', 'PT006', '2024-11-06'),
('GH007', 'PT007', '2024-11-07'),
('GH008', 'PT008', '2024-11-08'),
('GH009', 'PT009', '2024-11-09'),
('GH010', 'PT010', '2024-11-10'),
('GH011', 'PT011', '2024-11-11'),
('GH012', 'PT012', '2024-11-12'),
('GH013', 'PT013', '2024-11-13'),
('GH014', 'PT014', '2024-11-14'),
('GH015', 'PT015', '2024-11-15'),
('GH016', 'PT016', '2024-11-16'),
('GH017', 'PT017', '2024-11-17'),
('GH018', 'PT018', '2024-11-18'),
('GH019', 'PT019', '2024-11-19'),
('GH020', 'PT020', '2024-11-20');

INSERT INTO ChiTietGioHang (idGioHang, idSanPham, soLuong, giaBan)
VALUES
('GH001', 'SP001', 2, 735.000),
('GH002', 'SP002', 1, 405.00),
('GH003', 'SP003', 3, 777.00),
('GH004', 'SP004', 2, 900.00),
('GH005', 'SP005', 1, 1290.00),
('GH006', 'SP006', 5, 4250.00),
('GH007', 'SP007', 3, 525.00),
('GH008', 'SP008', 4, 1280.00),
('GH009', 'SP009', 2, 460.00),
('GH010', 'SP010', 6, 450.00),
('GH011', 'SP011', 1, 120.00),
('GH012', 'SP012', 2, 598.00),
('GH013', 'SP013', 3, 360.00),
('GH014', 'SP014', 4, 300.00),
('GH015', 'SP015', 1, 340.00),
('GH016', 'SP016', 2, 500.00),
('GH017', 'SP017', 5, 750.00),
('GH018', 'SP018', 3, 600.00),
('GH019', 'SP019', 4, 180.00),
('GH020', 'SP020', 2, 300.00);




