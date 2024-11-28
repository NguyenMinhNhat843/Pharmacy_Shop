CREATE DATABASE Pharmacy;
DROP DATABASE IF EXISTS Pharmacy;
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
    giaBan MONEY,
    image NVARCHAR(255),
    soLuong INT,
    soLuongDaBan INT,
    soLuongConLai INT,
	moTa NVARCHAR(MAX),           
    luuY NVARCHAR(255),         
    thanhPhan  NVARCHAR(MAX),             
    cachSuDung  NVARCHAR(MAX),
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
    tongTien MONEY NULL,
    FOREIGN KEY (idSanPham) REFERENCES SanPham(id),
    FOREIGN KEY (idPhieuThongTin) REFERENCES PhieuThongTin(id)
);

-- Bảng Chi Tiết Đơn Hàng
DROP TABLE IF EXISTS ChiTietDonHang;
CREATE TABLE ChiTietDonHang (
    idDonHang NVARCHAR(50),
    idSanPham NVARCHAR(50),
    soLuong INT NOT NULL,
    thanhTien MONEY  NOT NULL,
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
    giaBan MONEY NOT NULL,
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
(N'PT001', N'Nguyễn', N'Minh Nhật', N'123 Nguyễn Trãi, TP.HCM', N'0987654322', N'minhnhat@gmail.com', 1995, N'AC001'),
(N'PT002', N'Trần', N'Trọng Nhân', N'456 Lê Lai, TP.HCM', N'0912345679', N'trongnhan@gmail.com', 1990, N'AC002'),
(N'PT003', N'Lê', N'Phước Nguyên', N'789 Hồng Bàng, TP.HCM', N'0901234568', N'phuocnguyen@gmail.com', 1988, N'AC003'),
(N'PT004', N'Nguyễn', N'Tiến Đạt', N'101 Cầu Giấy, Hà Nội', N'0981234568', N'tiendat@gmail.com', 1992, N'AC004'),
(N'PT005', N'Đặng', N'Thị Mộng Thơ ', N'202 Phan Đình Phùng, Đà Nẵng', N'0912341235', N'mongtho@gmail.com', 1997, N'AC005'),
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
(N'TP004', N'Sản phẩm chăm sóc sức khỏe'),
(N'TP005', N'Tiểu đường'),
(N'TP006', N'Tim mạch'),
(N'TP007', N'Xương khớp'),
(N'TP008', N'Thuốc kê đơn'),
(N'TP009', N'Thuốc cho bé'),
(N'TP010', N'Mẹ và Bé');



INSERT INTO SanPham (id, tenSanPham, giaBan, image, soLuong, soLuongDaBan, soLuongConLai,moTa,luuY,thanhPhan,cachSuDung, Type) 
VALUES 
('SP001', N'Viên đông trùng hạ thảo Wellness Nutrition tăng cường sức khỏe (Hộp 90 viên)', 735000, 'https://production-cdn.pharmacity.io/digital/320x320/plain/e-com/images/ecommerce/20241031060619-1-P16618_1.png', 200, 120, 80,N'Viên uống Đông Trùng Hạ Thảo Wellness Nutrition được sản xuất và 
đóng gói tại Mỹ trên dây chuyền khép kín sử dụng công nghệ chiết xuất mới, tiên tiến đảm bảo duy trì 100% hoạt tính của Đông Trùng Hạ Thảo.Viên đông trùng hạ thảo Wellness Nutrition rất tốt cho sức khỏe
Đông trùng hạ thảo Wellness Nutrition là một loại nấm sống ký sinh trên ấu trùng',N'Tránh xa tầm tay trẻ em',
N'Thành phần chính: đông trùng hạ thảo (Cordycep Sinensis) Thành phần khác: Cám gạo, Gelatin, Magnesium Stearate vừa đủ 1 viên.',N'Uống 1 viên/lần cùng với bữa ăn',N'TP001'),
('SP002', N'Viên uống Nature Gift 15 Days Hỗ trợ giảm cân (Hộp 60 viên)', 405000, 'https://production-cdn.pharmacity.io/digital/828x828/plain/e-com/images/ecommerce/20240731095145-1-P21576_1.png', 200, 150, 50,N'sở hữu thành phần độc quyền Meratrim được đăng ký bảo hộ độc quyền tại Ấn Độ, kết hợp với chiết xuất trà xanh, 
caffeine và nhiều vitamin thiết yếu khác giúp hỗ trợ giảm cân an toàn chỉ sau 15 ngày sử dụng, cho bạn lấy lại vóc dáng hoàn hảo một cách nhanh chóng.',N'Sản phẩm này không phải là thuốc, không có tác dụng thay thế thuốc chữa bệnh.', N'Thành phần độc quyền Meratrim,Chiết xuất trà xanh và caffeine,Lutein',N'Liều lượng: 2 viên/ lần, 2 lần/ ngày.Mỗi lần nên uống viên hỗ trợ giảm cân Nature Gift 15 Days với 250ml nước và uống trước bữa ăn từ 30 phút đến 02 giờ.',N'TP001'),
('SP003', N'Nước uống đông trùng hạ thảo Welson Cordyceps giúp bồi bổ sức khỏe (Hộp 10 chai x 75ml)', 345000, 'https://production-cdn.pharmacity.io/digital/828x828/plain/e-com/images/ecommerce/20240630024959-1-P19038_1.png', 150, 90, 60,N'Nước uống Đông Trùng Hạ Thảo Welson Cordyceps là thực phẩm bảo vệ sức khỏe, cung cấp các dưỡng chất cần thiết giúp cải thiện chức năng tim mạch, bảo vệ gan và giải độc, đồng thời giúp bồi bổ sức khỏe, bồi bổ cơ thể.',
N'Sản phẩm này không phải là thuốc, không có tác dụng thay thế thuốc chữa bệnh.',N'chứa đông trùng hạ thảo và các thành phần thảo dược quý hiếm khác như Đặng Quy Hàn Quốc, Tàu Táo, Xa Sàng.',N'Uống 1 chai mỗi ngày, ngon hơn khi uống lạnh.',N'TP001'),
('SP004', N'Sữa bột dinh dưỡng GLUCERNA bổ sung dinh dưỡng đặc biệt cho người đái tháo đường hương vani (380g)	', 402000, 'https://production-cdn.pharmacity.io/digital/1080x1080/plain/e-com/images/ecommerce/P07243_11.jpg', 300, 200, 100, N'Glucerna là sản phẩm dinh dưỡng chuyên biệt với công thức đầy đủ và cân đối giúp kiểm soát đường huyết cho người đái tháo đường, tiền đái tháo đường và đái tháo đường thai kỳ.
',N'Đọc kỹ hướng dẫn sử dụng trước khi dùng',N'Maltodextrin, dầu đậu nành, dầu hướng dương, Canxi Caseinat,..',N'pha 1 ly 237ml, cho 200ml nước chín để nguội vào ly.',N'TP001'),
('SP005', N'Máy đo huyết áp bắp tay tự động OMRON HEM 7124 cho kết quả chính xác, nhanh chóng (hộp 1 cái)', 1290000, 'https://production-cdn.pharmacity.io/digital/828x828/plain/e-com/images/ecommerce/P26438_1.jpg', 450, 300, 150,N' là thiết bị y tế chuyên dùng để đo huyết áp và nhịp tim tại nhà. Sản phẩm này nổi bật với độ chính xác cao và thao tác dễ dàng',N'
Mọi thông tin trên đây chỉ mang tính chất tham khảo', N' Với màn hình LCD,Được thiết kế phù hợp với nhiều kích cỡ bắp tay',N'Quấn vòng bít quanh bắp tay, đảm bảo mép dưới của vòng bít cách khuỷu tay 1-2 cm',N'TP003'),
('SP006', N'Máy đo đường huyết cầm tay Accu-Chek Active giúp kiểm tra lượng đường trong máu chính xác, nhanh chóng', 850000, 'https://cdn.nhathuoclongchau.com.vn/unsafe/375x0/f…et_accuchek_active_6512_5b83_large_fed146d2f6.JPG', 450, 250, 200,N'Máy Đo Đường Huyết Accuchek Active giúp kiểm tra lượng đường trong máu một cách chính xác và nhanh chóng. Với cách đo đơn giản, lượng máu thử ít, thời gian cực nhanh,', N'Tiêu thụ năng lượng: 0,02 W (tối đa)
',N'10 kim lấy máu,Một bút máu,10 que thử đường huyết Accu-Chek Active Roche;',N'Xem hướng dẫn chi tiết trong bao bì sản phẩm.',N'TP003'),
('SP007', N'Kem dưỡng da trắng hồng tinh khiết ban đêm Ponds (50g)', 175000, 'https://production-cdn.pharmacity.io/digital/768x768/plain/e-com/images/ecommerce/P03354.png', 700, 400, 300,N'Kem dưỡng da trắng hồng tinh khiết ban đêm Pond',N'Mọi thông tin trên đây chỉ mang tính chất tham khảo',N'Water, Stearic Acid, Niacinamide, Isopropyl Myristate', N'Thoa lên mặt',N'TP004'),
('SP008', N'Nước uống Kolmar Tinh Nghệ Condition Curcumin Fast giúp giảm viêm loét dạ dày (100ml)', 320000, 'https://production-cdn.pharmacity.io/digital/768x768/plain/e-com/images/ecommerce/P18158_1.jpg', 300, 180, 120,N'là sản phẩm tiên phong dựa trên nano curcumin dưới dạng nước uống liền, giúp tăng khả năng hấp thụ so với các sản phẩm cùng loại.
',N'Sản phẩm này không phải là thuốc, không có tác dụng thay thế thuốc chữa bệnh.',N'Curcumin 12, Indigestion maltodextrin, siro đường bắp, FOS, natri citrat, chiết xuất thảo mộc, hương mật ong.
',N'Uống mỗi ngày 1 chai, uống trực tiếp, tốt nhất là uống lạnh.', N'TP001'),
('SP009', N'Bột uống FERROLIP bổ sung sắt (Hộp 20 gói)', 230000, 'https://production-cdn.pharmacity.io/digital/768x7…om/images/ecommerce/20240528064014-0-P28033_1.jpg', 900, 600, 300, N'bổ sung sắt',N'Ngày hết hạn để chỉ sản phẩm được bảo quản đúng cách, trong bao bì nguyên vẹn. Không sử dụng quá liều khuyến cáo.',N'chứa: Sắt (sắt pyrophosphate được bao vi nang) 30mg
Thành phần khác: tinh bột ngô; chất nhũ hóa:',N'Uống 1 gói mỗi ngày, nên dùng ngay sau bữa ăn. Uống trực tiếp mà không cần dùng nước',N'TP001'),
('SP010', N'Siro ho Annatop Pro giảm ho, giảm tiết đàm cho trẻ (Chai 120ml)', 75000, 'https://production-cdn.pharmacity.io/digital/768x768/plain/e-com/images/ecommerce/P17654.png', 1400, 900, 500,N'là thực phẩm bảo vệ sức  khỏe, giúp hỗ trợ thanh họng, hạn chế ho nhiều, giảm tăng tiết đờm dãi, giảm đau rát họng do ho kéo dài.',N'Đọc kỹ tờ hướng dẫn sử dụng trước khi dùng.',N'Cao lá thường xuân, chiết xuất cát cánh, chiết xuất xuyên bối mẫu, eucalyptol, chiết xuất ô mai, gừng, húng chanh…
',N'Trẻ 1-6 tuổi: 10ml/lần x 1 lần/ngày,Trẻ 7-10 tuổi: 10ml/lần x 2 lần/ngày', N'TP009'),
('SP011', N'Thuốc xịt mũi Mucome trị sung huyết mũi, nghẹt mũi, sổ mũi, hắt hơi (chai 10ml)', 120.000, 'https://production-cdn.pharmacity.io/digital/768x7…_1.png', 1200, 800, 400,N' là sản phẩm được thiết kế để giảm triệu chứng sung huyết mũi, nghẹt mũi, sổ mũi và hắt hơi. Với thành phần hoạt chất hiệu quả,',N'Vui lòng đọc kĩ thông tin chi tiết ở tờ hướng dẫn sử dẫn của sản phẩm.',N'Hoạt chất: Xylometazolin hydrochlorid 10mg.
Tá dược: Benzalkonium chlorid, dibasic natri phosphat heptahydrat,',N'Trước khi sử dụng lần đầu, xịt mồi vài lần vào không khí cho đến khi có một làn sương mịn.', N'TP002'),
('SP012', N'Viên uống Body Slim Premium hỗ trợ giảm cân (Hộp 30 viên)', 396650, 'https://production-cdn.pharmacity.io/digital/768x768/plain/e-com/images/ecommerce/P24856_1.jpg', 450, 150, 300,N'Viên uống Body Slim Premium là một thực phẩm chức năng hỗ trợ giảm cân. 
',N'Sản phẩm này không phải là thuốc, không có tác dụng thay thế thuốc chữa bệnh',N'Chiết xuất lá sen 220mg,Chiết xuất kim ngân hoa 100mg,Chiết xuất nấm linh chi 60mg',N'Uống 1-2 viên trước bữa ăn sáng 15 phút', N'TP001'),
('SP013', N'Dung dịch vệ sinh phụ nữ Dạ Hương', 120.000, 'https://production-cdn.pharmacity.io/digital/1080x1080/plain/e-com/images/ecommerce/P04087_11.jpg', 600, 500, 100,N'là sản phẩm chăm sóc vùng kín, giúp làm sạch và duy trì pH cân bằng tự nhiên.',N'Mọi thông tin trên đây chỉ mang tính chất tham khảo',N'Purified water, sodium laurth sulfat, propylen glycol, ethyl alcohol, sodium carboxyl methyl cellulose, lactic acid,...
',N'Chỉ dùng ngoài da như dung dịch rửa. Lấy một lượng dung dịch vừa đủ và rửa lại bằng nước sạch.', N'TP004'),
('SP014', N'Gel rửa tay khô Lifebuoy', 35000, 'https://production-cdn.pharmacity.io/digital/1080x1080/plain/e-com/images/ecommerce/20241107092025-0-P01547_1.png', 1000, 800, 200,N'Nước rửa tay Lifebouy là nhãn hiệu nước rửa tay sạch khuẩn số 1 thế giới. Nước rửa tay Lifebuoy bảo vệ vượt trội chai 177ml giúp diệt 99,9% vi khuẩn gây bệnh chỉ trong 10 giây, cung cấp thêm thành phần dưỡng ẩm cho đôi tay mềm mại hơn.
',N'Mọi thông tin trên đây chỉ mang tính chất tham khảo.',N'Water, Myristic Acid, Lauric Acid, Palmitic Acid, Glycerin, Citric Acid, Silver Oxide...
',N'Sản phẩm phù hợp cho hầu hết các đối tượng khách hàng, với thành phần tự nhiên, an toàn, cùng kết cấu ấn tượng phù hợp cho hầu hết các loại da tay.', N'TP004'),
('SP015', N'Kẹo dẻo Appeton A-Z Kids Vitamin C Pastilles bổ sung vitamin C cho trẻ em (Hộp 20 gói)', 170000, 'https://production-cdn.pharmacity.io/digital/1080x1080/plain/e-com/images/ecommerce/P25928_1.jpg', 2530, 300, 2230,N'bổ sung vitamin C cho trẻ em',N'Sản phẩm này không phải là thuốc, không có tác dụng thay thế thuốc chữa bệnh.',N'Siro Glucose, Đường, Nước, Gelatin (từ bò), Vitamin C, Chất làm ẩm: Sorbitol (E420), Chất tạo hương trái cây giống tự nhiên, ',N'Dùng ăn trực tiếp', N'TP001'),
('SP016', N'Viên uống Solgar bổ sung Vitamin D3 1000IU (Lọ 90 viên)', 332400, 'https://production-cdn.pharmacity.io/digital/1080x1080/plain/e-com/images/ecommerce/20241107092037-0-P17805_1.png', 350, 150, 200,N'bổ sung vitamin D, giúp hỗ trợ sức khỏe xương và hệ miễn dịch',N'Sản phẩm này không phải là thuốc, không có tác dụng thay thế thuốc chữa bệnh.',N'Vitamin D3 25mcg (1000IU)
',N'1 viên/lần , 1-2 lần/ngày cùng với bữa ăn hoặc theo hướng dẫn của chuyên gia y tế.', N'TP001'),
('SP017', N'Bột Hỗ Trợ Tẩy Trắng Răng EUCRYL Toothpowder hũ 50g', 150000, 'https://production-cdn.pharmacity.io/digital/1080x1080/plain/e-com/images/product/20240830024133-0-P19173.png', 500, 300, 200,N'Bột làm trắng răng Vị Bắc Hà Eucryl là sản phẩm chuyên dùng để làm trắng răng, giúp răng sáng bóng và sạch sẽ. Sản phẩm được sản xuất từ các thành phần tự nhiên, an toàn cho sức khỏe răng miệng.
',N'Mọi thông tin trên đây chỉ mang tính chất tham khảo.',N'Bột Eucryl,Bicarbonat natri,Chất tạo hương tự nhiên',N'Sử dụng bột làm trắng răng Vị Bắc Hà Eucryl cùng với bàn chải đánh răng. Lấy một lượng bột vừa đủ và chải răng như bình thường.', N'TP004'),
('SP018', N'Máy hút mụn mini', 200000, 'https://salt.tikicdn.com/cache/w1200/ts/product/5b/ca/7c/8e7a37f9451b217fd157be7e8fb1d97f.jpg', 400, 100, 300,N'Máy hút mụn đầu đen Enchen EBR001 chiếu LED trẻ hóa da thu nhỏ lỗ chân lông, máy chăm sóc da mặt cầm tay
',N'LƯU Ý: (bạn nên kiểm tra lực hút phù hợp trên cánh tay trước khi sử dụng trên da mặt)',N'Thương hiệu: Enchen,Công suất: 2W',N'Rửa sạch mặt, lau lại mặt bằng nước muối sinh lý,', N'TP003'),
('SP019', N'Miếng dán hạ sốt cho bé', 50000, 'https://production-cdn.pharmacity.io/digital/768x768/plain/e-com/images/ecommerce/P24074.png', 1500, 900, 600,N'Miếng dán hạ sốt cho bé Pharmacity tốt cho bé vì giúp hạ sốt và giúp trẻ cảm thấy dễ chịu hơn.
',N'Mọi thông tin trên đây chỉ mang tính chất tham khảo.',N'Clycerine, carbomer, EDTA-2Na, tartaric acid,',N'Đặt miếng dán vào tủ lạnh trước khi sử dụng để tăng hiệu quả làm mát. Không bảo quản trong tủ đá', N'TP002'),
('SP020', N'Kem Chống Nắng SUNPLAY Skin Aqua Silky White Gel Dưỡng Da Sáng (Tuýp 25g)', 150000, 'https://production-cdn.pharmacity.io/digital/768x768/plain/e-com/images/ecommerce/P03808_1.jpg', 800, 400, 400,N'Gel chống nắng dưỡng da trắng mịn. Giúp chống nắng tối ưu, bảo vệ và hạn chế mất nước',N'Mọi thông tin trên đây chỉ mang tính chất tham khảo. ',N'Water, Ethylhexyl Methoxycinnamate, Glycerin',N'Thoa kem đều lên da 10 - 15 phút trước khi ra nắng,', N'TP004'),
('SP021', N'Viên uống Wealthy Health tảo xoắn spirulina hữu cơ 1.000mg (Hộp 100 viên)', 890000, 'https://production-cdn.pharmacity.io/digital/1080x1080/plain/e-com/images/ecommerce/P21994_11.png', 300, 200, 100,N'
Bổ sung dinh dưỡng, chất xơ và khoáng chất cho phụ nữ mang thai',N'Sản phẩm này không phải là thuốc, không có tác dụng thay thế thuốc chữa bệnh',N'Tảo xoắn spirulina hữu cơ 100%',N'Từ 1 - 3 viên / ngày sử dụng cho mục đích bổ sung hàng ngày.', N'TP001'),
('SP022', N'Nước uống bổ sung collagen Alfe Beauty Conc giúp cải thiện nếp nhăn (10 chai x 50 ml)', 594000, 'https://production-cdn.pharmacity.io/digital/1080x1080/plain/e-com/images/ecommerce/P24362_1.jpg', 150, 100, 50,N'Alfe Beauty Conc là thực phẩm hỗ trợ làm đẹp',N'Sản phẩm này không phải là thuốc, không có tác dụng thay thế thuốc chữa bệnh.',N'Collagen Peptid: 5.000mg
Elastin peptid: 10mg,Acid Hyaluronic: 5mg',N'Uống một chai mỗi ngày.', N'TP001'),
('SP023', N'Máy đo nồng độ oxy bão hòa trong máu SpO2 CREATIVE MEDICAL PC-60F kết hợp đo nhịp tim (hộp 1 cái)', 750000, 'https://production-cdn.pharmacity.io/digital/1080x1080/plain/e-com/images/ecommerce/P22142.png', 220, 180, 40,N'Đo nồng độ oxy trong máu, tưới máu, nhịp tim.
',N' Đọc kỹ hướng dẫn sử dụng trước khi dùng',N'Sử dụng pin hay điện? Pin Lưu ý loại pin/ nguồn điện: 2 Pin AAA 1.5 V',N' Bấm kẹp mở máy, đặt và giữ ngón tay vào đúng vị trí như hình trong 10 giây. Nên đặt tay trên bàn để ổn định vị trí.', N'TP003'),
('SP024', N'Khẩu trang y tế PMC VN95 4 lớp, vải lọc cao cấp bảo vệ khỏi vi khuẩn, khói và bụi mịn (Hộp 10 cái)', 45000, 'https://production-cdn.pharmacity.io/digital/768x768/plain/e-com/images/ecommerce/P25369.png', 3000, 2000, 1000,N'Khẩu trang',N'Tránh xa nhiệt độ cao và hóa chất.
',N'Vải không dệt 100% PP, quai đeo và vải lọc cao cấp. Thanh nẹp mũi lõi kim loại giúp định hình tốt khi đeo.',N'Cầm khẩu trang, mặt có in logo hướng ra phía ngoài.', N'TP004'),
('SP025', N'Viên uống Pharmacity Omega – 3 Fish Oil (Chai 60 viên)', 320000, 'https://production-cdn.pharmacity.io/digital/1080x1080/plain/e-com/images/ecommerce/20241021101137-0-P28084_1.jpg', 500, 250, 250,N'Bạn xứng đáng có một bộ não minh mẫn, trái tim khỏe mạnh và đôi mắt sáng trong',N'Thực phẩm này không phải là thuốc, không có tác dụng thay thế thuốc chữa bệnh',N'Mỗi viên nang mềm có 600 mg dầu cá chứa 360 mg Omega-3, tương đương:
',N'Uống 1 viên/lần/ngày', N'TP001'),
('SP026', N'Băng dán cá nhân Pharmacity màu da (10 miếng/gói)', 25000, 'https://production-cdn.pharmacity.io/digital/768x768/plain/e-com/images/ecommerce/P09769.png', 4000, 3000, 1000,N'Băng dán cá nhân khoáng khí, giúp bảo vệ vết thương hiệu quả.
',N'Đọc kỹ hướng dẫn sử dụng trước khi dùng',N'Băng: Polyvinyl Chloride, màu da,Gạc: vải không dệt màu da,Được đựng trong mỗi bao, mỗi cái riêng biệt.',N'Bước 1: Mở bao bì ngoài,Bước 2: Dán lên vết thương,Bước 3: Hoàn thành việc dán băng', N'TP004'),
('SP027', N'Viên nén Paracetamol 325mg hạ sốt, giảm đau (chai 500 viên)', 175000, 'https://production-cdn.pharmacity.io/digital/768x768/plain/e-com/images/ecommerce/P25194_1.jpg', 6000, 5000, 1000,N'Thuốc có tác dụng giảm đau các cơn đau nhẹ đến vừa.',N'Vui lòng đọc kĩ thông tin chi tiết ở tờ hướng dẫn sử dẫn của sản phẩm.',N'Paracetamol',N'325 – 650 mg, 4 – 6 giờ một lần khi cần thiết, không quá 4 g một ngày; liều lớn hơn (ví dụ 1 g/lần) có thể dùng để giảm đau ở một số người bệnh.', N'TP002'),
('SP028', N'Siro bổ phế Bảo Thanh', 90000, 'https://production-cdn.pharmacity.io/digital/768x768/plain/e-com/images/ecommerce/P11035.png', 1100, 700, 400,N'Giúp bổ phế Hỗ trợ làm giảm các triệu chứng ho, đờm ở trẻ em
',N'Sản phẩm này không phải là thuốc, không có tác dụng thay thế thuốc chữa bệnh. ',N'Đường, sorbitol, nước và các thành phần khác vừa đủ 100ml',N'Trẻ sơ sinh đến dưới 2 tuổi: ngày 2-3 lần, mỗi lần 5ml', N'TP002'),
('SP029', N'Dung dịch Betadine antiseptic 10% sát khuẩn da và niêm mạc (chai 30ml)', 70000, 'https://production-cdn.pharmacity.io/digital/768x768/plain/e-com/images/ecommerce/P06066.png', 1000, 800, 200,N'Betadine Antiseptic Solution 30 ml của Công ty Mundipharma Pharmaceuticals Ltd, thành phần chính Povidon - Iod 10% kl/tt là một chế phẩm được sử dụng phổ biến để sát khuẩn trong phẫu thuật hoặc vệ sinh cá nhân.
',N'Vui lòng đọc kĩ thông tin chi tiết ở tờ hướng dẫn sử dẫn của sản phẩm.',N'Povidon Iod 10% w/v',N'Phết dung dịch mẹ (không pha loãng) dàn đều vào nơi cần điều trị. Sau khi để khô, sẽ tạo được một lớp phim thông khí, rất dễ rửa sạch bằng nước. Có thể bôi thuốc nhiều lần trong ngày.', N'TP004'),
('SP030', N'Máy xông khí dung Microlife NEB200 hỗ trợ các bệnh viêm mũi, viêm xoang', 950000, 'https://cdn.nhathuoclongchau.com.vn/unsafe/375x0/filters:quality(90)/https://cms-prod.s3-sgn09.fptcloud.com/00500441_may_xong_khi_dung_microlife_neb200_5181_629d_large_a1ffb82a94.jpg', 180, 120, 60,N'dùng để xông thuốc vào hệ hô hấp thông qua hơi sương, giúp hỗ trợ điều trị các bệnh liên quan đến đường hô hấp như viêm phế quản, hen suyễn, và các bệnh về phổi.',N'Đọc kỹ hướng dẫn sử dụng trước khi dùng',N'Máy xông khí dung., Mặt nạ xông, ống dẫn khí, bộ lọc, bộ chuyển đổi điện.
Chất liệu: Nhựa y tế không chứa BPA, các thành phần không độc hại.',N' Lắp ráp bộ máy phun sương, đảm bảo tất cả các bộ phận đã được kết nối chính xác.,Đổ đầy dung dịch hít vào máy phun sương theo hướng dẫn của bác sĩ, không vượt quá mức tối đa.', N'TP003'),
('SP031', N'Viên uống Blue Berry Plus Ojenvitamin bổ sung dưỡng chất cho mắt, hỗ trợ cải thiện thị lực (40 viên)', 370000, 'https://cdn.nhathuoclongchau.com.vn/unsafe/375x0/filters:quality(90)/https://cms-prod.s3-sgn09.fptcloud.com/00018993_blue_berry_plus_ojenvitamin_new_nordic_2x20v_2634_6327_large_00cb23abcf.jpg', 250, 150, 100,N'Blue Berry Plus Ojenvitamin giúp bổ sung dưỡng chất cho mắt, cải thiện thị lực, hạn chế khô giác mạc',N'Sản phẩm này không phải là thuốc và không có tác dụng thay thế thuốc chữa bệnh.
',N' Chứa một nhóm đặc biệt các chất chống oxy hóa mạnh như carotenoid (Zeaxanthin, lutein), flavonoid (resveritrol, rutin, quercetin), cũng như các vitamin A, C và E',N'Ngày uống 2 viên.', N'TP001'),
('SP032', N'Nước Súc Miệng LISTERINE Tartar Protection Giảm Mảng Bám (Chai 250ml)', 125000, 'https://production-cdn.pharmacity.io/digital/320x320/plain/e-com/images/ecommerce/20240528093602-0-P08888_1.jpg', 700, 500, 200,N'giúp bảo vệ răng miệng suốt 24h, loại bỏ vi khuẩn gây hại và ngăn ngừa sự hình thành mảng bám.',N'Đọc kỹ hướng dẫn sử dụng trước khi dùng',N'Công thức độc đáo với 4 tinh dầu
',N'Sau khi đánh răng, súc miệng với 20ml trong 30 giây rồi nhổ đi.', N'TP004'),
('SP033', N'Kem đánh răng than hoạt tính', 45000, 'https://production-cdn.pharmacity.io/digital/768x768/plain/e-com/images/ecommerce/P14248.png', 900, 600, 300,N'P/S Thiên Nhiên Than Hoạt Tính Trắng Răng Tự Nhiên với thành phần gốc tự nhiên kết hợp trong công thức P/S mang lại hiệu quả bảo vệ răng miệng vượt trội; an toàn và lành tính cho cả gia đình
',N'. Đọc kỹ hướng dẫn sử dụng trước khi dùng',N'Water, Sorbitol, Hydrated Silica, Zinc Citrate, Sodium Lauryl Sulfate, Sodium Fluoride,...
',N'Chải răng ít nhất ngày 2 lần hoặc theo hướng dẫn của nha sĩ.', N'TP004'),
('SP034', N'Viên uống Elevit bổ sung vitamin tổng hợp cho bà bầu (Hộp 30 viên)', 290000, 'https://production-cdn.pharmacity.io/digital/768x768/plain/e-com/images/ecommerce/20241031060616-1-P23715_1.jpg', 400, 200, 200,N'Thực phẩm Bayer HC Elevit để bảo vệ sức khỏe, nạp đủ vitamin, khoáng chất cần thiết cho cơ thể. ',N'
Sản phẩm này không phải là thuốc, không có tác dụng thay thế thuốc chữa bệnh',N'Vitamin khoáng chất cần thiết cho phụ nữ chuẩn bị mang thai, đang mang thai và cho con bú
',N'Nên uống mỗi ngày 1 viên trước, trong thai kỳ cho đến khi kết thúc thời kỳ cho con bú', N'TP001'),
('SP035', N'Cao dán Tiger Balm Plaster-RD 10X14cm giảm các triệu chứng mỏi cơ, giảm đau và nhức cơ (túi 3 miếng)', 80000, 'https://production-cdn.pharmacity.io/digital/768x768/plain/e-com/images/ecommerce/P21611.png', 800, 400, 400,
N'Cao dán Tiger Balm Plaster-RD 7x10cm là một loại cao dán giảm đau được sử dụng để làm giảm đau cơ, đau khớp, và các cơn đau do chấn thương nhẹ như bầm tím hoặc căng cơ.',N'ui lòng đọc kĩ thông tin chi tiết ở tờ hướng dẫn sử dẫn của sản phẩm.',N'Camphor (Camphora) 1,0%, Tinh dầu Bạc hà (Oleum menthae) 0,6%, Tinh dầu Khuynh diệp (Oleum Eucalypti) 0,5%, Menthol (Mentholum) 0,3%, Dịch chiết ớt (Capsicum extractum) 0,2%.',
N'Làm sạch và khô vùng dán thuốc. Gỡ bỏ lớp màng bảo vệ và dán miếng cao dán lên vùng bị đau.',
N'TP004'),
('SP036', N'Bông Tẩy Trang JOMI (Túi 120 miếng)', 30000, 'https://production-cdn.pharmacity.io/digital/320x320/plain/e-com/images/ecommerce/20241031155429-0-P18118.png', 2000, 1500, 500,N'
Giúp làm sạch nhẹ nhàng và không để lại xơ bông trên da và tiết kiệm tối da dung dịch dưỡng da, ',N'Đọc kỹ hướng dẫn sử dụng trước khi dùng',N'100% cotton thiên nhiên',N'Làm ướt miếng bông bằng nước sạch hoặc dung dịch tẩy trang, nước hoa hồng... rồi nhẹ nhàng lau sạch mặt.', N'TP004'),
('SP037', N'Máy massage Pangao PG-2601B51 xoa dịu đốt sống cổ, giúp thư giãn giảm căng thẳng', 1350000, 'https://cdn.nhathuoclongchau.com.vn/unsafe/375x0/filters:quality(90)/https://cms-prod.s3-sgn09.fptcloud.com/IMG_0310_bb7300afd1.jpg', 150, 100, 50,
N' Lúc này, xoa bóp bấm huyệt là một phương pháp Y học cổ truyền điều trị thay thế, giúp tăng cường lưu lượng máu đến các nhóm cơ đang căng cứng và có thể giúp giảm đau ở vùng vai, cột sống cổ, ngực cho đến thắt lưng hoặc xương cùng',N'Vui lòng đọc và hiểu kỹ tất cả nội dung của sách hướng dẫn trước khi sử dụng sản phẩm này.
',N'Hộp đựng bảo vệ máy',N'Vui lòng kiểm tra xem nguồn pin lithium tích hợp có đủ không, khi màn hình LCD hiển thị biểu tượng pin nhấp nháy, bạn cần phải sạc.Cắm đầu USB vào bộ sạc DC 5V (hoặc nguồn di động để đảm bảo điện áp DC 5V), sau đó cắm đầu cắm Micro USB của cáp kết nối vào cổng sạc của máy mát xa cổ', N'TP003'),
('SP038', N'Viên uống Kudos Digestive Enzymes bổ sung men tiêu hóa hỗ trợ tiêu hóa (Hộp 30 viên)', 240000, 'https://production-cdn.pharmacity.io/digital/144x144/plain/e-com/images/ecommerce/20240805085037-1-P25919_1.jpg',600, 300, 300,N'Viên uống Kudos Digestive Enzymes là thực phẩm chức năng giúp hỗ trợ tiêu hóa khỏe mạnh mỗi ngày.
',N'Sản phẩm này không phải là thuốc, không có tác dụng thay thế thuốc chữa bệnh.',N'Enzyme tụy: 51,4 mg (Lipase: 2313 FIP, Amylase: 2158 FIP, Chymotrypsin: 770 FIP, Trypsin: 185 FIP, Protease: 154 FIP)',N'Uống 1 viên mỗi ngày với nhiều nước.', N'TP001'),
('SP039', N'Thuốc nhỏ mắt Refresh Tears giảm khó chịu do khô mắt, dị vật (chai 15ml)', 100000, 'https://production-cdn.pharmacity.io/digital/768x768/plain/e-com/images/ecommerce/P00685.png', 700, 500, 200,
N'Thuốc nhỏ mắt Refresh Tears là một sản phẩm nhỏ mắt có tác dụng làm dịu cảm giác khô mắt, kích ứng và khó chịu do nhiều nguyên nhân khác nhau như gió, ánh nắng hay dị vật. 
',N'Vui lòng đọc kĩ thông tin chi tiết ở tờ hướng dẫn sử dẫn của sản phẩm.',N'Acid boric, calci clorid dihydrat, magnesi clorid hexahydrat, kali clorid, nước tinh khiết, PURITy (phức hợp oxydro ổn định), natri borat decahydrat, natri clorid, và natri hydroxid.',N'Nhỏ 1 hoặc 2 giọt vào mắt bị đau khi cần thiết.', N'TP004'),
('SP040', N'Viên uống Mỡ Máu Tâm Bình hỗ trợ giảm mỡ máu (Hộp 5 vỉ x 12 viên)', 330000, 'https://production-cdn.pharmacity.io/digital/768x768/plain/e-com/images/ecommerce/P21748_1.jpg', 300, 200, 100,
N'Viên uống Mỡ Máu Tâm Bình là một sản phẩm bổ sung thực phẩm được sản xuất bởi Công ty Dược phẩm Tâm Bình tại Việt Nam. Sản phẩm này được thiết kế để hỗ trợ giảm cholesterol và mỡ máu, giúp cải thiện sức khỏe tim mạch.
',N'Sản phẩm này không phải là thuốc, không có tác dụng thay thế thuốc chữa bệnh.',N'Lá sen (Nelumbo nucifera),Giảo cổ lam (Gynostemma pentaphyllum),Râu ngô (Zea mays)',N'Người lớn: Uống 2-3 viên mỗi lần, 2 lần mỗi ngày,Nên uống trước bữa ăn 30 phút hoặc sau bữa ăn 1 giờ để đạt hiệu quả tối đa.', N'TP001'),
('SP041', N'Biovagen Welkids Multivitamin ADKE bổ sung vitamin A, D3, K2, E cho trẻ (Chai 10ml)', 385000, 'https://production-cdn.pharmacity.io/digital/768x768/plain/e-com/images/ecommerce/20240930044533-1-P26082_1.jpg', 100, 50, 50,
N'Biovagen Welkids Multivitamin ADKE là một sản phẩm bổ sung dinh dưỡng dành cho trẻ em, cung cấp các vitamin thiết yếu như vitamin A, D, K và E. Sản phẩm này được thiết kế để hỗ trợ sự phát triển toàn diện của trẻ, bao gồm tăng cường hệ miễn dịch, hỗ trợ sự phát triển xương và thị lực, và cải thiện sức khỏe tổng thể.
',N'Sản phẩm này không phải là thuốc, không có tác dụng thay thế thuốc chữa bệnh',N'Mỗi 6 giọt chứa: Vitamin A (dưới dạng Retinyl palmitate) 400mcg,Vitamin D3 (dưới dạng Cholecalciferol) 400IU,Vitamin E (dưới dạng D-alpha-tocopherol) 4 mg,Vitamin K2 (dưới dạng MK-7 Menaquinone) 22.5mcg,Dầu olive hữu cơ',N'0 – 12 tháng tuổi: 6 giọt,1 – 3 tuổi: 6 – 8 giọt
,3 – 12 tuổi: 8 – 12 giọt,Trên 12 tuổi: 12 giọt"', N'TP004'),
('SP042', N'Bột Charz giúp bù nước và chất điện giải hương cam (Hộp 30 gói)', 260000, 'https://production-cdn.pharmacity.io/digital/768x768/plain/e-com/images/ecommerce/P16544.png', 80, 40, 40,
N'Bù nước và chất điện giải trong các trường hợp mất nước như tiêu chảy hay nôn ói Bù nước cho cơ thể do các nguyên nhân như: Chảy mồ hôi khi thời tiết nóng bức, nóng sốt, tập thể thao',N'Sản phẩm này không phải là thuốc, không có tác dụng thay thế thuốc chữa bệnh.',N'Glucose khan:2932.082mg,Axit citric khan:872.710mg,cung cấp Citrat 859mg
',N'Trẻ em từ 2-5 tuổi: 300ml/ngày,Trẻ em từ 6-9 tuổi: 400ml/ngày,Trẻ em từ 10 tuổi trở lên, thanh thiếu niên và người trưởng thành: 500ml/ngày, Cách pha: Hòa tan 1 gói bột (4.9g) vào 200ml nước, khuấy cho tan Cho trẻ uống từng ngụm nhỏ mỗi 15 phút. Dung dịch đã pha phải được dùng hết trong ngày, không bảo quản phần bột pha còn lại hoặc dung dịch thừa trong tủ lạnh quá 1 ngày  Không hòa tan bột trong dung dịch nước trái cây, nước uống có ga', N'TP004'),
('SP043', N'Cốm Probiotics Lactomin Plus Novarex bổ sung vi khuẩn có ích, giúp cân bằng hệ vi sinh đường ruột (30 gói)', 187000, 'https://production-cdn.pharmacity.io/digital/768x768/plain/e-com/images/ecommerce/20240906030301-0-P00280_1.jpg', 120, 30, 30,N'Lactomin Plus 3g là dòng sản phẩm có tác dụng bổ sung các loại vi khuẩn có ích, giúp tái lập cân bằng hệ vi sinh đường ruột, hạn chế sự xâm nhập của vi khuẩn có hại, từ đó giúp hỗ trợ phòng ngừa tình trạng rối loạn tiêu hóa như táo bón, tiêu chảy gây ra.
',N'Không sử dụng cho người mẫn cảm với bất cứ thành phần nào của sản phẩm. ',N'Bifidobacterium animalis subsp.lactis: 100.000.000CFU',N'Người lớn: Uống 1 - 2 gói/ ngày trong vòng 30 phút sau bữa ăn.Trẻ em trên 2 tuổi: Uống nửa liều của người lớn hoặc nhiều hơn khi cần thiết theo hướng dẫn của thầy thuốc.', N'TP004'),
('SP044', N'Trà Linh Chi Ladophar hỗ trợ tăng cường chức năng gan (Hộp 34g)', 84800, 'https://production-cdn.pharmacity.io/digital/768x768/plain/e-com/images/ecommerce/P26373_1.jpg', 150, 100, 50,
N'Hỗ trợ sức khỏe, tăng cường chức năng gan',N'Sản phẩm này không phải là thuốc, không có tác dụng thay thế thuốc chữa bệnh.',N'Trong 01 túi lọc 1,7g có chứa: Nấm Linh chi: 600mg, Đảng sâm: 150mg, Xuyên khung: 80mg, Cao đặc Actisô: 140mg,Cao Nấm linh chi: 60mg,Phụ liệu: Cỏ ngọt
',N'Nhúng túi lọc vào 150-200ml nước sôi trong vòng 3-5 phút. Có thể dùng nhiều lần bằng cách châm thêm nước sôi. Ngon hơn khi dùng nóng.', N'TP001'),
('SP045', N'Bột PROANTIOBIOPLUS hỗ trợ làm giảm các triệu chứng rối loạn tiêu hóa', 490000, 'https://production-cdn.pharmacity.io/digital/768x768/plain/e-com/images/ecommerce/P17599.png', 70, 25, 45,
N'Ngày nay, diễn biến các bệnh về đường tiêu hóa có xu hướng gia tăng. Chính vì vậy, thực phẩm bảo vệ sức khỏe PROANTIOBIOPLUS đã ra đời. Đây là một sản phẩm chăm sóc sức khỏe được nghiên cứu và phát triển bởi các chuyên gia hàng đầu trong lĩnh vực dinh dưỡng và y tế. Với thành phần từ thiên nhiên và công nghệ tiên tiến, PROANTIOBIOPLUS mang lại những lợi ích to lớn cho sức khỏe của con người.',
N'Sản phẩm này không phải là thuốc, không có tác dụng thay thế thuốc chữa bệnh. Đọc kỹ tờ hướng dẫn sử dụng trước khi dùng.
',N'PROANTIOBIOPLUS được chiết xuất từ các thành phần tự nhiên như: quả việt quất, tinh chất lúa mạch, tinh dầu oregano, tinh dầu bạc hà và các loại vitamin và khoáng chất cần thiết cho cơ thể. Các thành phần này đã được kiểm chứng là có tác dụng tích cực đối với sức khỏe con người.
',N'Để đạt được hiệu quả tốt nhất, bạn nên sử dụng PROANTIOBIOPLUS theo liều lượng và cách sử dụng được ghi trên bao bì sản phẩm hoặc theo chỉ dẫn của bác sĩ. Thông thường, liều lượng khuyến cáo là 1-2 viên/ngày, uống sau khi ăn. Ngoài ra, với các lứa tuổi khác nhau sẽ có những liều dùng khác nhau', N'TP001'),
('SP046', N'Bột hòa tan Infogos 3g IAP chứa chất xơ hỗ trợ chống táo bón (30 gói)', 120000, 'https://cdn.nhathuoclongchau.com.vn/unsafe/375x0/filters:quality(90)/https://cms-prod.s3-sgn09.fptcloud.com/DSC_06443_52db564d3c.jpg', 50, 15, 35,
N'Với các thành phần Inuline, FOS, GOS, Infogos cung cấp nguồn chất xơ tự nhiên giúp hỗ trợ điều trị rối loạn tiêu hóa, chống táo bón; đồng thời tăng cường sức đề kháng cho cơ thể khỏe mạnh, đẩy lùi bệnh vặt.',N'Không sử dụng cho người mẫn cảm với bất cứ thành phần nào của sản phẩm. 
',N'Trong mỗi gói 3g gồm có: Inuline 900mg, FOS (Fructo Oligosaccharide 900mg, GOS (Galacto Oligosaccharide) 900mg,Maltodextrin vừa đủ 1 gói 3g',N'Người lớn, phụ nữ mang thai cho con bú, trẻ nhỏ, trẻ sơ sinh bị táo bón.', N'TP001'),
('SP047', N'Bột pha uống Enzymax Kids giúp bé tăng cường hấp thu dinh dưỡng (30 gói)', 1200000, 'https://production-cdn.pharmacity.io/digital/768x768/plain/e-com/images/ecommerce/P27310_1.jpg', 120, 50, 70,
N'Bột Pha Uống ENZYMAX KIDS là thực phẩm chức năng có chứa các enzym tiêu hóa, giúp hỗ trợ tiêu hóa và hấp thu chất dinh dưỡng ở trẻ em, giúp làm giảm các triệu chứng ăn không tiêu, đi tiêu phân sống, biếng ăn chậm lớn, kém hấp thu dinh dưỡng…do thiếu men tiêu hóa.Sản phẩm được sản xuất bởi Indusen Tây Ban Nha và được nhập khẩu chính hãng về Việt Nam.
',N'Sản phẩm này không phải là thuốc, không có tác dụng thay thế thuốc chữa bệnh. Đọc kỹ tờ hướng dẫn sử dụng trước khi dùng.
',N'Mỗi gói 2g chứa: Lipase: 6.65mg, Amylase: 10.75mg,Glucoamylase: 3.75mg,Protease 3.0: 1.7mg,Protease 4.5: 1.7mg',N'Uống vào đầu bữa ăn chính. Pha vào ly nước 50ml, khuấy nhẹ đều trước khi uống.', N'TP001'),
('SP048', N'Nước uống NUCOS Collagen 7000mg & 300mg C hỗ trợ chống lão hóa, đẹp da (Hộp 10 chai x 30ml)', 1190000, 'https://production-cdn.pharmacity.io/digital/768x768/plain/e-com/images/product/20241031102105-0-P28150_1.jpg', 40, 10, 30,
N'Hỗ trợ bảo vệ da. Giảm quá trình lão hóa da. Giúp da mịn màng. Kích hoạt hương thơm tự thân',N'Thực phẩm này không phải là thuốc, không có tác dụng thay thế thuốc chữa bệnh. Đọc kỹ tờ hướng dẫn sử dụng trước khi dùng.
',N'Nước, collagen peptide từ cá 7000 mg, chiết xuất hoa anh đào, vitamin C (Acid L-ascorbic) 170 mg, Niacin (Niacinamide) 12 mg, vitamin B1 (Thiamin mononitrat) 1,8 mg, Calci pantothenat 1,8 mg, vitamin B6, Pyridoxin hydroclorid) 1,8 mg.',N'1 chai/ 1 ngày', N'TP004'),
('SP049', N'Viên uống Faroson Glutamax 1000 giúp làm tăng độ đàn hồi cho da, giảm lão hóa da (30 Viên)', 1215000, 'https://production-cdn.pharmacity.io/digital/768x768/plain/e-com/images/ecommerce/P23631.png', 20, 10, 10,N'Viên uống Faroson Glutamax 1000 là sản phẩm nhập khẩu từ Mỹ, được bào chế với công nghệ tiên tiến, chứa hàm lượng cao Glutathione. Sản phẩm này giúp làm sáng da và bảo vệ da khỏi tác hại của ánh nắng mặt trời một cách an toàn và hiệu quả.
',N'Sản phẩm này không phải là thuốc, không có tác dụng thay thế thuốc chữa bệnh. Đọc kỹ tờ hướng dẫn sử dụng trước khi dùng.',N'Trong 2 viên nén Faroson Glutamax 1000 có chứa:L-Glutathione 1000mg,Chiết xuất dương xỉ 480mg,Vitamin C (L-ascorbic acid) 200mg',N'Đối với người trưởng thành, uống 2 viên mỗi ngày với bữa ăn hoặc theo chỉ dẫn của các chuyên gia chăm sóc sức khỏe của bạn.', N'TP004'),
('SP050', N'Viên uống Kolmar Condition Woman Giúp bổ sung collagen cho da (Hộp 90 viên)', 490000, 'https://production-cdn.pharmacity.io/digital/768x768/plain/e-com/images/ecommerce/20240930044533-1-P17358_1.png', 60, 20, 40,N'Viên uống Kolmar Condition Woman là sản phẩm được nghiên cứu và phát triển bởi công ty Inno.N, với mục đích cung cấp collagen cho phụ nữ. Collagen là một loại protein quan trọng trong cơ thể, có vai trò quan trọng trong việc duy trì độ đàn hồi và độ ẩm của da. Vì vậy, việc bổ sung collagen thông qua viên uống Kolmar Condition Woman không chỉ giúp tăng cường sức khỏe mà còn giúp duy trì làn da trẻ trung và săn chắc.
',N'Sản phẩm này không phải là thuốc, không có tác dụng thay thế thuốc chữa bệnh. Đọc kỹ tờ hướng dẫn sử dụng trước khi dùng.
',N'Collagen từ cá (1000 mg), cellulose (434 mg), Axit hyaluronic (200 mg), canxi carboxymethylcellulose (140 mg), Vitamin E (11 mg anpha-TE), Hydroxypro-pylmethyl cellulose (58 mg), Magnesi sterat (30 mg), axit stearic (27,774 mg), Dioxyd silic (24 mg), Titan dioxyd (20 mg), este glycerin của các axit béo (5,8 mg), chiết xuất annato (0,02 mg), màu thực phẩm số 3 (0,006 mg).
',N'Viên uống Kolmar Condition Woman nên được sử dụng hàng ngày để đạt được hiệu quả tốt nhất. Liều lượng khuyến cáo là 2 viên mỗi ngày, uống vào buổi sáng hoặc buổi tối sau khi ăn. Để đạt được hiệu quả tốt nhất, nên sử dụng liên tục trong ít nhất 3 tháng.', N'TP004'),
('SP051', N'Dung Dịch Rơ Miệng DENICOL 20% Hỗ Trợ Tình Trạng Sưng Lợi, Lỡ Miệng (15ml)', 20000, 'https://production-cdn.pharmacity.io/digital/768x768/plain/e-com/images/ecommerce/20241107092030-0-P00599_1.png', 60, 30, 30,
N'Dung dịch rơ miệng DENICOL 20% là sản phẩm hỗ trợ điều trị các vấn đề về răng miệng như sưng lợi, lở miệng, nhiệt miệng, viêm nướu,... ở trẻ nhỏ và người lớn.
',N'Mọi thông tin trên đây chỉ mang tính chất tham khảo. Đọc kỹ hướng dẫn sử dụng trước khi dùng
',N'Natri borat, Glycerin, Acid benzoic, Nước tinh khiết.',N'Rửa sạch tay trước khi sử dụng.Dùng bông sạch thấm dung dịch rơ miệng, thoa đều lên vùng bị tổn thương trong khoang miệng.
Không ăn uống ngay sau khi rơ miệng.', N'TP010'),
('SP052', N'Dầu Mát-Xa Và Dưỡng Ẩm JOHNSON BABY OIL (200ml)', 92000, 'https://production-cdn.pharmacity.io/digital/768x768/plain/e-com/images/ecommerce/20240830061738-1-P00169_1.png', 80, 30, 50,
N'Dầu Mát-Xa Và Dưỡng Ẩm Johnson Baby Oil là sản phẩm dưỡng ẩm dành cho da nhạy cảm của trẻ em, giúp làm mềm và bảo vệ da khỏi khô ráp. Sản phẩm này cũng thích hợp cho người lớn để giữ ẩm cho da, đặc biệt là sau khi tắm. Johnson Baby Oil có thể được sử dụng để mát-xa, giúp thư giãn và cải thiện tuần hoàn máu. 
',N'Mọi thông tin trên đây chỉ mang tính chất tham khảo. Đọc kỹ hướng dẫn sử dụng trước khi dùng',N'Mineral Oil, Fragrance.',N'Mát-xa nhẹ nhàng toàn thân.', N'TP010'),
('SP053', N'Dầu gội trẻ em dạng sữa Cetaphil Baby Gentle Wash & Shampoo (200ml)', 172000, 'https://production-cdn.pharmacity.io/digital/320x320/plain/e-com/images/ecommerce/P09428_3.jpg', 150, 70, 80,
N'Dầu gội trẻ em dạng sữa Cetaphil Baby Gentle Wash & Shampoo cho bé giàu thành phần chiết xuất thiên nhiên có khả năng làm sạch nhẹ dịu và dưỡng ẩm cho da bé mềm mịn suốt cả ngày. Cetaphil Baby Gentle Wash & Shampoo không chứa xà phòng nên an toàn tuyệt đối khi tắm gội cho bé.
',N'Mọi thông tin trên đây chỉ mang tính chất tham khảo. Đọc kỹ hướng dẫn sử dụng trước khi dùng
',N'Aqua, Sorbitol, Cocamidopropyl Betaine, Lauryl Glucoside, Glycerin, Panthenol, Coco-Glucoside, Glyceryl Oleate, Acrylates/C10-30 Alkyl Acrylate Rosspolymer, Aloe Barbadensis Leaf Juice Powder, Chamomilla Recutita Flower Extract, Citric Acid, Heliotropine, Hydrogenated Palm Glycerides Citrate, Hydrolyzed Wheat Protein, Parfum, Sodium Hydroxide, Tocopherol, Zinc Sulfate.
',N'Cho 1 lượng sản phẩm vào tay.Xoa đều lên tóc và cơ thể của bé.Massage toàn thân để bé được thư giãn sau đó tắm lại bằng nước sạch.', N'TP010'),
('SP054', N'Kem dưỡng da cho da khô và nhạy cảm Aveeno Baby Soothing Relief Moisture Cream (227g)', 320000 , 'https://production-cdn.pharmacity.io/digital/144x144/plain/e-com/images/ecommerce/20240630025001-1-P23164_1.jpg' ,155, 25, 130,N'
Làm dịu da khô ngứa trong 60s. Công thức 3x phức hợp yến mạch giúp nuôi dưỡng da đến 72h, cho làn da luôn mêm mịn và chắc khỏe.',N'Mọi thông tin trên đây chỉ mang tính chất tham khảo. Đọc kỹ hướng dẫn sử dụng trước khi dùng
',N'Water, Glycerin, Petrolatum, Mineral Oil, Dimethicone, Cetyl Alcohol, Beeswax, Hydroxypropyl Starch Phosphate, Avena Sativa (Oat) Kernel Flour, Glyceryl Stearate SE, Carbomer, Caprylyl Glycol, Sodium Hydroxide, pHAdjuster, Butylene Glycol, Ethylhexylglycerin, Palmitic Acid, StearicAcid, Chlorphenesin, Sodium CitratepHAdjuster, Tetrasodium EDTA, Glycine Soja (Soybean) Oil, Citric Acid, Portulaca Oleracea Extract, p-Anisic Acid.
',N'Xịt gel trực tiếp lên da, xoa đều cho tới khi thấm đều lên da. Xịt và thoa nhắc lại sau vài giờ.', N'TP010'),
('SP055', N'Khăn hạ sốt Dr Papie 0+ (Hộp 5 túi x 5 khăn)', 150000, 'https://production-cdn.pharmacity.io/digital/768x768/plain/e-com/images/ecommerce/20241107092037-0-P21345_1.png', 250, 50, 200,
N'Khăn lau hạ sốt Dr.Papie 0+  là giải pháp hạ sốt vật lý nhanh, an toàn cho trẻ sơ sinh từ 0 tháng tuổi trở lên, đã được Bộ Y Tế cấp phép. Khăn hạ sốt Dr.Papie 0+ có thể sử dụng để hạ sốt cho mọi trường hợp sốt ở trẻ sơ sinh: sốt do vi khuẩn, virus, sốt mọc răng, sốt tiêm phòng,…
',N'Mọi thông tin trên đây chỉ mang tính chất tham khảo. Đọc kỹ hướng dẫn sử dụng trước khi dùng',N'Trong mỗi khăn lau hạ sốt Dr.Papie 0+ được tẩm gel hạ sốt, thành phần gồm: Chlorophyll (diệp lục thảo), Phenoxyethanol, Glycerin, Gôm Xanthan, Lô hội, dịch chiết Cỏ nhọ nồi, tinh dầu tía tô, tinh chất chanh, vitamin E, nước tinh khiết.
',N'Lau chườm toàn thân, giúp hạ sốt cho bé,Lau nhiều lần, đến khi hết ẩm thì thôi,Lau nhiều vào các vị trí có mạch máu lớn: nách, bẹn, cô', N'TP010'),
('SP056', N'Bột pha tiêm Solu-Medrol 40mg trị viêm thấp khớp, hen suyễn, lupus ban đỏ hệ thống (1 lọ x 1ml)', 50000, 'https://production-cdn.pharmacity.io/digital/768x768/plain/e-com/images/ecommerce/20240731062325-1-P04813_1.png', 250, 50, 200,
N'Solu-Medrol 40mg là một loại bột pha tiêm có thành phần chính là methylprednisolon natri succinat, được sử dụng trong các tình huống cấp cứu và điều trị nhiều loại bệnh lý nghiêm trọng như rối loạn thấp khớp, lupus ban đỏ hệ thống, xơ cứng nhiều chỗ, và viêm phổi do Pneumocystis carinii ở bệnh nhân AIDS.
',N'Sản phẩm này chỉ bán khi có chỉ định của bác sĩ, mọi thông tin trên đây chỉ mang tính chất tham khảo. Vui lòng đọc kĩ thông tin chi tiết ở tờ hướng dẫn sử dẫn của sản phẩm.
',N'Methylprednisolone 40mg',N'Bỏ nắp bảo vệ ra, vặn quanh 1/4 nút pit tông và ấn để đẩy dung môi vào khoang dưới. Lắc nhẹ để có dung dịch. Sử dụng dung dịch trong vòng 48 giờ.', N'TP008'),
('SP057', N'Bột pha dung dịch uống Basocholine 500mg điều trị các rối loạn trí nhớ và hành vi (20 gói x 2g)', 150000, 'https://production-cdn.pharmacity.io/digital/768x768/plain/e-com/images/ecommerce/P15674_1n.jpg', 250, 50, 200,
N'Điều trị các rối loạn trí nhớ và hành vi do đột quỵ, chấn thương ở đầu',N'Sản phẩm này chỉ bán khi có chỉ định của bác sĩ, mọi thông tin trên đây chỉ mang tính chất tham khảo. Vui lòng đọc kĩ thông tin chi tiết ở tờ hướng dẫn sử dẫn của sản phẩm.
',N'Mỗi 2 g chứa Citicolin natri tương đương với Citicolin 500mg.',N'Hòa tan gói thuốc trong khoảng 50 ml nước trước khi uống, có thể uống cùng với bữa ăn hoặc xa bữa ăn.', N'TP008'),
('SP058', N'Bột pha uống Cefdinir 125mg S.Pharm kháng sinh điều trị nhiễm khuẩn (30 gói x 1,5g)', 363000, 'https://production-cdn.pharmacity.io/digital/768x768/plain/e-com/images/ecommerce/P26151_1.jpg',
300, 55, 245,N'Bột pha uống Cefdinir 125-MV là sản phẩm của US Pharma USA, chứa dược chất chính là cefdinir – kháng sinh cephalosporin thế hệ thứ 3, được dùng để trị các trường hợp nhiễm khuẩn nhẹ đến vừa, gây ra bởi những vi khuẩn nhạy cảm.
',N'Sản phẩm này chỉ bán khi có chỉ định của bác sĩ, mọi thông tin trên đây chỉ mang tính chất tham khảo. Vui lòng đọc kĩ thông tin chi tiết ở tờ hướng dẫn sử dẫn của sản phẩm.
',N'Cefdinir 125mg',N'Trẻ em (từ 6 tháng đến 12 tuổi) dưới 43kg: Viêm tai giữa cấp tính, viêm họng, viêm amidan: Dùng một lượng 7mg/kg, 12 giờ một lần trong 5 – 10 ngày hay 14 mg/kg, 24 giờ một lần trong 10 ngày.', N'TP008'),
('SP059', N'Bột pha uống Efodyl Sac 250mg điều trị nhiễm khuẩn (20 gói x 3g)', 65000, 'https://production-cdn.pharmacity.io/digital/768x768/plain/e-com/images/ecommerce/P26148_1.jpg', 155, 55, 100,
N'Điều trị những nhiễm khuẩn do vi khuẩn nhạy cảm gây ra',N'Sản phẩm này chỉ bán khi có chỉ định của bác sĩ, mọi thông tin trên đây chỉ mang tính chất tham khảo. Vui lòng đọc kĩ thông tin chi tiết ở tờ hướng dẫn sử dẫn của sản phẩm.',N'Một viên nén bao phim chứa: Cefuroxim axetil 300,72mg tương đương với 250mg Cefuroxim. Tá dược: Sodium lauryl sulfate, microcrystalline cellulose, silicone dioxide, croscarmellose sodium, sodium starch glycolate, copovidone, magnesium stearat, opadry.
',N'Người lớn: Uống 250mg, 12 giờ một lần để trị viêm họng, viêm amidan hoặc viêm xong hàm do vi khuẩn nhạy cảm. Uống 250mg hoặc 500mg,Trẻ em: Viêm họng, viêm amidan: uống 20mg/kg/ ngày (tối đa 500mg/ngày) chia thành 2 liều nhỏ. Viêm tai giữa, chốc lở: 30mg/kg/ngày (tối đa 1g/ngày) chia làm 2 liều nhỏ', N'TP008'),
('SP060', N'Bột hít phân liều Trelegy Ellipta GSK điều trị bệnh phổi tắc nghẽn mạn tính (30 liều hít)', 790000, 'https://production-cdn.pharmacity.io/digital/768x768/plain/e-com/images/product/20240807083751-0-P27974_1.jpg', 130, 30, 100,
N'Trelegy Ellipta được chỉ định trong điều trị duy trì để phòng ngừa và làm giảm các triệu chứng có liên quan đến bệnh phổi tắc',N'Sản phẩm này chỉ bán khi có chỉ định của bác sĩ, mọi thông tin trên đây chỉ mang tính chất tham khảo. Vui lòng đọc kĩ thông tin chi tiết ở tờ hướng dẫn sử dẫn của sản phẩm.
',N'Mỗi liều chưa phóng thích chứa 100 microgam (mcg) fluticasone furoate; 62,5 mcg umeclidinium (tương đương với 74,2 mcg umeclidinium bromide) và 25 mcg vilanterol (dạng trifenatate). 
',N'Trelegy Ellipta chỉ dùng để hít qua miệng. Trelegy Ellipta nên dùng 1 lần mỗi ngày, vào cùng một thời điểm cố định buổi sáng hoặc buổi tối.', N'TP008'),
('SP061', N'Đường ăn kiêng MAISUGAR dành cho người ăn kiêng, người bệnh tiểu đường hộp (50 gói x 2g)', 55000, 'https://production-cdn.pharmacity.io/digital/768x768/plain/e-com/images/ecommerce/20240830061738-1-P00169_1.png', 80, 30, 50,
N'Đường Ăn Kiêng Maisugar là một sản phẩm hỗ trợ kiểm soát đường huyết, thường được sử dụng trong chế độ ăn uống của người bệnh tiểu đường hoặc những người cần kiểm soát lượng đường huyết.
',N'Mọi thông tin trên đây chỉ mang tính chất tham khảo. Đọc kỹ hướng dẫn sử dụng trước khi dùng
',N'Sản phẩm chứa các thành phần tự nhiên và thảo dược, bao gồm: Đường maltitol,Chiết xuất lá dương an,Chiết xuất hạt chia,Các thành phần khác tùy thuộc vào từng lô sản xuất.',N'Sản phẩm được dùng bằng cách hòa tan trong nước hoặc có thể sử dụng trực tiếp theo chỉ dẫn của nhà sản xuất.', N'TP005'),
('SP062', N'Trà LAVA dây thìa canh dùng cho người bệnh tiểu đường (5g x 30 túi‎)', 49000, 'https://production-cdn.pharmacity.io/digital/768x768/plain/e-com/images/ecommerce/P26370_1.jpg', 99, 29, 70,
N'Hỗ trợ điều trị tiểu đường tuýp I, tiểu đường tuýp II, người có lượng đường trong máu cao
',N'Mọi thông tin trên đây chỉ mang tính chất tham khảo. Đọc kỹ hướng dẫn sử dụng trước khi dùng',N'100% Chiết xuất dây thìa canh',N'Ngâm 3 túi lọc vào bình nước( 0,6- 1 lít nước) thật sôi.Chờ từ 7 - 10 phút sau đó lấy túi lọc ra, dùng làm nước uống hàng ngày.', N'TP005'),
('SP063', N'Viên uống Boni Diabet hỗ trợ phòng ngừa biến chứng tiểu đường (Hộp 60 viên)', 405000, 'https://production-cdn.pharmacity.io/digital/768x768/plain/e-com/images/ecommerce/P24936_1.jpg', 80, 30, 50,
N'Viên uống Boni Diabet hỗ trợ phòng ngừa biến chứng tiểu đường (Hộp 60 viên) là thực phẩm chức năng được thiết kế để hỗ trợ phòng ngừa biến chứng liên quan đến tiểu đường. Sản phẩm giúp duy trì mức đường huyết ổn định và cải thiện sức khỏe tổng thể cho người mắc bệnh tiểu đường.
',N'Sản phẩm này không phải là thuốc, không có tác dụng thay thế thuốc chữa bệnh. Đọc kỹ tờ hướng dẫn sử dụng trước khi dùng.
',N'Chromium: Hỗ trợ kiểm soát lượng đường trong máu và cải thiện độ nhạy insulin.Cinnamon Extract (Chiết xuất quế): Giúp điều hòa lượng đường trong máu và hỗ trợ chức năng insulin.',N'Uống 2 viên mỗi ngày, tốt nhất là sau bữa ăn. Nên sử dụng đều đặn và theo hướng dẫn của bác sĩ hoặc chuyên gia dinh dưỡng.', N'TP005'),
('SP064', N'Sữa bột dinh dưỡng GLUVITA GOLD cung cấp dinh dưỡng cho người bệnh tiểu đường (900g)', 496000, 'https://production-cdn.pharmacity.io/digital/768x768/plain/e-com/images/ecommerce/20241107092038-0-P19017_1.png', 100, 30, 70,
N'Sữa VitaDairy Gluvita Gold là sản phẩm dinh dưỡng chuyên biệt dành cho người đái tháo đường và tiền đái tháo đường. Sản phẩm này được nghiên cứu và phát triển để cung cấp một chế độ ăn lành mạnh, giúp kiểm soát và ổn định đường huyết, phòng ngừa các biến chứng và tăng cường sức khỏe cho người bệnh. Với công thức đặc chế, Gluvita Gold hỗ trợ người tiểu đường duy trì mức đường huyết ổn định và đảm bảo dinh dưỡng cần thiết cho cơ thể.
',N'Mọi thông tin trên đây chỉ mang tính chất tham khảo. Đọc kỹ hướng dẫn sử dụng trước khi dùng',N' VitaDairy Gluvita Gold:Isomaltulose (Palatinose),Polyols,Fructose,Vitamin và khoáng chất đa dạng (bao gồm vitamin A, C, D, E, K, B1, B2, B6, B12, folate, biotin, niacin, axit pantothenic, canxi, sắt, magiê, kẽm, đồng, mangan, selen, crom, molybdenum)',N'Pha 6 muỗng gạt (50g) sữa VitaDairy Gluvita Gold với 200ml nước chín ấm để được 1 ly khoảng 235ml. Uống 2-3 ly mỗi ngày như bữa ăn phụ hoặc theo hướng dẫn của cán bộ y tế.', N'TP005'),
('SP065', N'Hỗn dịch tiêm Mixtard 30 100IU/ml insulin trị đái tháo đường 0', 250000, 'https://production-cdn.pharmacity.io/digital/320x320/plain/e-com/images/ecommerce/P04237_1.jpg', 80, 27, 53,N'Điều trị bệnh đái tháo đường
',N' Vui lòng đọc kĩ thông tin chi tiết ở tờ hướng dẫn sử dẫn của sản phẩm.',N'Insulin người, rDNA (được sản xuất bằng kỹ thuật DNA tái tổ hợp trong tế bào Saccharomyces cerevisiae).
1ml chứa 100 IU insulin người.',N'Dùng tiêm dưới da. Hỗn dịch insulin không bao giờ được tiêm tĩnh mạch.Mixtard được dùng tiêm dưới da vào vùng đùi hoặc thành bụng. Nếu thuận tiện, vùng mông hoặc vùng cơ delta cũng có thể tiêm được.', N'TP005'),
('SP066', N'Viên nén bao đường Cynaphytol giải độc gan, thông mật, lợi tiểu, nhuận tràng (10 vỉ x 10 viên)', 4500, 'https://production-cdn.pharmacity.io/digital/144x144/plain/e-com/images/ecommerce/20241107092038-0-P15285_1.png', 300, 22, 178,
N'Viên nén bao đường Cynaphytol là một loại thuốc hoặc thực phẩm chức năng, thường được sử dụng trong các trường hợp cụ thể liên quan đến sức khỏe
',N'Vui lòng đọc kĩ thông tin chi tiết ở tờ hướng dẫn sử dẫn của sản phẩm.',N'Cao khô Actisô 0.16g (tương đương với 4g lá tươi Actisô)',N'Dùng thuốc Cynaphytol qua đường uống. Uống nguyên viên nang với nước.',N'TP005'),
('SP067', N'Viên uống Blackmores Cholesterol Health hỗ trợ giảm cholesterol (Hộp 60 viên)',548100 , 'https://production-cdn.pharmacity.io/digital/144x144/plain/e-com/images/product/20240716103455-0-P24909.png', 250, 30, 220,
N'Blackmores Cholesterol Health là sản phẩm chăm sóc sức khỏe đến từ thương hiệu Blackmores, nổi tiếng với các giải pháp tự nhiên cho sức khỏe và dinh dưỡng. Được thiết kế đặc biệt để hỗ trợ kiểm soát cholesterol trong máu, Blackmores Cholesterol Health không chỉ giúp duy trì sức khỏe tim mạch mà còn có thể giúp làm giảm mức độ cholesterol xấu LDL, từ đó giúp cải thiện chất lượng cuộc sống và hỗ trợ sự cân bằng dinh dưỡng tổng thể.
',N'Đọc kỹ tờ hướng dẫn sử dụng trước khi dùng.',N'Betacarotene:1.5mg,Dầu thực vật Phytosterol esters:1g',N'Người lớn: Uống 1 viên/1 lần, 2 lần/ngày hoặc theo chỉ định của chuyên viên y tế.,Trẻ em từ dưới 12 tuổi: Chỉ sử dụng nếu có chỉ định của bác sĩ.', N'TP006'),
('SP068', N'Viên uống Blackmores CoQ10 150mg hỗ trợ bảo vệ tim mạch (Chai 30 viên)', 436800 , 'https://production-cdn.pharmacity.io/digital/144x144/plain/e-com/images/product/20240716103701-0-P14461_8.png', 150, 30, 120,
N'Viên uống Blackmores CoQ10 giúp chống oxy hóa và tăng cường năng lượng cho tim, hỗ trợ duy trì sức khỏe tim mạch. Người trưởng thành cần bổ sung để duy trì sức khỏe tim và chống oxy hóa. Blackmores là công ty sức khỏe tự nhiên hàng đầu của Úc.
',N'Sản phẩm này không phải là thuốc, không có tác dụng thay thế thuốc chữa bệnh. Đọc kỹ tờ hướng dẫn sử dụng trước khi dùng.
',N'Ubidecareone (coenzyme Q10) 150mg.',N'Giúp chống oxy hóa và tăng cường năng lượng cho tim, hỗ trợ duy trì sức khỏe tim mạch và làm chậm quá trình lão hóa cơ thể.', N'TP006'),
('SP069', N'Viên uống Botania BoniVein hỗ trợ tăng sức bền của tĩnh mạch (30 viên)', 250000 , 'https://production-cdn.pharmacity.io/digital/768x768/plain/e-com/images/ecommerce/20241107092037-0-P11969_1.png', 250, 130, 120,
N'Viên uống hỗ trợ điều trị bệnh trĩ Bonivein giúp giảm các triệu chứng chảy máu, sa búi trĩ, sa trực tràng, đau rát, ngứa do bị trĩ; hỗ trợ giảm tê bì chân, nặng chân do phồng tĩnh mạch.
',N'Sản phẩm này không phải là thuốc, không có tác dụng thay thế thuốc chữa bệnh. Đọc kỹ tờ hướng dẫn sử dụng trước khi dùng.
',N'Diosmin,Hesperidin,Rutin,Horse chestnut ext. SE 20% AESCIN (Hạt dẻ ngựa)',N'Ngày uống 1 - 3 viên x 2 lần/ngày.', N'TP006'),
('SP070', N'Viên uống Costar Garlic Oil tinh dầu tỏi hỗ trợ tăng cường đề kháng (Lọ 60 viên)',190900 , 'https://production-cdn.pharmacity.io/digital/768x768/plain/e-com/images/ecommerce/P24263.png', 100, 50, 50,
N'Costar Garlic Oil là thực phẩm hỗ trợ sức khỏe được sản xuất bởi  STAR COMBO AUSTRALIA PTY LTD (Úc). Giúp tăng cường sức đề kháng. Hỗ trợ giảm các triệu chứng cảm cúm thông thường, người sức đề kháng kém, người bị cảm cúm thông thường. 
',N'Sản phẩm này không phải là thuốc, không có tác dụng thay thế thuốc chữa bệnh. Đọc kỹ tờ hướng dẫn sử dụng trước khi dùng.
',N'Dầu tỏi (1mg) (3000:1) (tương đương tỏi tươi 3000mg),',N'Uống mỗi lần 1 viên, 3 viên mỗi ngày', N'TP006'),
('SP071', N'Viên uống DHG NattoEnzym 1000 DHG hỗ trợ giảm nguy cơ tắc nghẽn mạch máu (Chai 60 viên)', 360000 , 'https://production-cdn.pharmacity.io/digital/768x768/plain/e-com/images/ecommerce/P18477_1.jpg', 50, 12, 38,
N'NattoEnzym 1000 DHG Pharma hỗ trợ giảm nguy cơ hình thành huyết khối, giảm nguy cơ tắc nghẽn mạch máu.',N'Sản phẩm này không phải là thuốc, không có tác dụng thay thế thuốc chữa bệnh. Đọc kỹ tờ hướng dẫn sử dụng trước khi dùng.
',N'Nattokinase 1000 FU, tá dược vừa đủ 1 viên.',N'Ngày uống 2 lần: sáng 1 viên, tối 1 viên.', N'TP006'),
('SP072', N'Viên uống Ecogreen Faz hỗ trợ giảm mỡ máu (Hộp 30 viên)', 300000, 'https://production-cdn.pharmacity.io/digital/768x768/plain/e-com/images/ecommerce/20240510100134-0-P24934_1.jpg', 250, 38, 212,
N'Viên uống Ecogreen Faz hỗ trợ giảm mỡ máu là một sản phẩm thực phẩm chức năng được thiết kế để giúp giảm mỡ máu và hỗ trợ sức khỏe tim mạch. Sản phẩm này giúp kiểm soát mức cholesterol và triglyceride trong máu, góp phần vào việc duy trì sức khỏe tim mạch tốt.
',N'Sản phẩm này không phải là thuốc, không có tác dụng thay thế thuốc chữa bệnh. Đọc kỹ tờ hướng dẫn sử dụng trước khi dùng.
',N'Policosanol (GDL-5): 100mg,Chiết xuất giấm táo (Apple Cider Vinegar Extract): 200mg,Chiết xuất Gynostemma: 150mg',N'Uống viên thuốc cùng với nước. Không nhai hoặc nghiền nát viên thuốc.', N'TP006'),
('SP073', N'Viên bổ sung khoáng chất Solgar Calcium Magnesium Plus Zinc giúp xương chắc khỏe (Chai 100 viên)', 648000 , 'https://production-cdn.pharmacity.io/digital/768x768/plain/e-com/images/ecommerce/P18053.png', 300, 50, 250,
N'Viên bổ sung khoáng chất Solgar Calcium Magnesium Plus Zinc là thực phẩm chức năng giúp hỗ trợ sức khỏe xương, cơ bắp, và hệ thần kinh nhờ vào sự kết hợp của Canxi, Magie và Kẽm.
',N'Sản phẩm này không phải là thuốc, không có tác dụng thay thế thuốc chữa bệnh. Đọc kỹ tờ hướng dẫn sử dụng trước khi dùng.',N'Calci (calcium carbonate, calcium gluconate, calcium citrate): 333,3 mg',N'Uống 3 viên/lần x 1 lần/ngày,Uống cùng với bữa ăn hoặc theo hướng dẫn của chuyên gia sức khỏe
', N'TP007'),
('SP074', N'Viên khớp Tâm Bình hỗ trợ giảm thoái hóa khớp, viêm khớp (Hộp 60 viên)', 96000, 'https://production-cdn.pharmacity.io/digital/768x768/plain/e-com/images/ecommerce/P00809.png', 100, 40, 60,
N'Viên khớp Tâm Bình là một thực phẩm bảo vệ sức khoẻ được chiết xuất hoàn toàn từ thảo dược thiên nhiên. Sản phẩm được khuyên dùng cho người bị đau nhức xương khớp, viêm khớp, thoái hóa khớp.',N'Sản phẩm này không phải là thuốc, không có tác dụng thay thế thuốc chữa bệnh. Đọc kỹ tờ hướng dẫn sử dụng trước khi dùng.
',N'Mỗi viên nang cứng 500mg chứa:Cao khô 360 mg tương đương với:Hy thiêm (400mg) , Đương quy (350mg), Đỗ trọng (350mg), Tục đoạn (350mg), Cẩu tích (350mg), Độc hoạt (350mg)',N'Ngày uống 2 lần, mỗi lần 3 viên, trước khi ăn 30 phút.Người có tiền sử dạ dày nên uống sau khi ăn.Mỗi đợt uống từ 2 - 3 tháng, bệnh mạn tính có thể uống lâu hơn.', N'TP007'),
('SP075', N'Viên sủi KUDOS Bone bổ sung Calcium D3 K2 hỗ trợ chắc khỏe xương (Tuýp 20 viên)',90400 , 'https://production-cdn.pharmacity.io/digital/768x768/plain/e-com/images/product/20240819033140-0-P25907.png', 150, 40, 110,
N'Viên sủi Kudos Bone Health Calcium, D3 & Vitamin K2 bổ sung các vitamin và khoáng chất thiết yếu cho xương và răng chắc khỏe, hỗ trợ ngăn ngừa sâu răng, giúp phát triển chiều cao tối ưu ở trẻ và phòng ngừa loãng xương ở người lớn tuổi. Sản phẩm không chứa lactose, gluten và dùng được cho người ăn chay.
',N'Đọc kỹ tờ hướng dẫn sử dụng trước khi dùng.',N'Calci (Calci carbonat) : 500mg, Chất điều chỉnh độ acid: acid citric, natri hydro carbonat; chất độn: sorbitol; maltodextrin; chất tạo ngọt tổng hợp: aspartam; hương liệu tổng hợp (hương cam); bột nước ép củ dền; chất tạo màu tổng hợp: riboflavin; chất tạo bọt: este của sucrose với các acid béo.',N'Dùng 1 viên mỗi ngày, hòa tan trong một cốc nước (200 ml).', N'TP007'),
('SP076', N'Viên sủi Pharmacity Calcium + Vitamin D3 hỗ trợ xương chắc khỏe (Tuýp 20 viên)', 92000 , 'https://production-cdn.pharmacity.io/digital/768x768/plain/e-com/images/ecommerce/P25837.png', 250, 32, 218,
N'Viên sủi Calcium + Vitamin D3 Effervescent Pharmacity với thành phần chính là canxi và vitamin D3 tạo nên bộ đôi dinh dưỡng tuyệt vời giúp xương chắc khỏe, ngăn ngừa loãng xương và gãy xương.',N'Sản phẩm này không phải là thuốc, không có tác dụng thay thế thuốc chữa bệnh.',N'Canxi Carbonat (Tương đương với Canxi 500 mg) 1250mg; Vitamin D3 (Cholecalciferol) 7,5mcg',N'Hòa tan viên sủi Calcium + Vitamin D3 Effervescent Pharmacity trong 200ml nước, sau khi viên sủi tan hoàn toàn là có thể uống:', N'TP007'),
('SP077', N'Viên uống JEX Ecogreen hỗ trợ giảm đau trong thoái hoá khớp, viêm khớp ( Hộp 30 viên)', 350000, 'https://production-cdn.pharmacity.io/digital/320x320/plain/e-com/images/ecommerce/P22686.png', 500, 250, 250,
N'Viên uống JEX Ecogreen là sản phẩm chăm sóc sức khỏe xương khớp với công thức từ thiên nhiên, giúp hỗ trợ giảm đau, viêm, và cải thiện sức khỏe xương khớp.
',N'Sản phẩm này không phải là thuốc, không có tác dụng thay thế thuốc chữa bệnh.',N'Collagen type II:40mg,Chondroitin sulfate:100mg,Turmeric Root Extract:60mg',N'Ngày uống 2 lần (sáng, tối), mỗi lần 1 viên.', N'TP007'),
('SP078', N'Viên uống ALPHA Green Sun Carlotta hỗ trợ xương khớp (Hộp 2 vỉ x 15 viên)', 360000, 'https://production-cdn.pharmacity.io/digital/768x768/plain/e-com/images/ecommerce/P26033_1.jpg', 300, 180, 120,
N'Viên uống ALPHA Green Sun Carlotta với thành phần chính là Canxi gluconat giúp bổ sung canxi, hỗ trợ giảm nguy cơ loãng xương đối với các đối tượng có nhu cầu canxi cao như: Phụ nữ mang thai, phụ nữ cho con bú, trẻ em đang lớn, người trong giai đoạn hồi phục, người bị gãy xương, trẻ em bị còi xương.',N'
Sản phẩm này không phải là thuốc, không có tác dụng thay thế thuốc chữa bệnh. ',N'Canxi gluconat: 1000mg (có chứa 93mg Canxi),Magie (Magie oxit): 200mg',N'Trẻ em trên 9 tuổi, người lớn: uống 1 - 2 viên/ngày.', N'TP007'),
('SP079', N'Dung Dịch Rơ Miệng DENICOL 20% Hỗ Trợ Tình Trạng Sưng Lợi, Lỡ Miệng (15ml)', 20000, 'https://production-cdn.pharmacity.io/digital/768x768/plain/e-com/images/ecommerce/20241107092030-0-P00599_1.png', 100, 30, 70,
N'Dung dịch rơ miệng DENICOL 20% là sản phẩm hỗ trợ điều trị các vấn đề về răng miệng như sưng lợi, lở miệng, nhiệt miệng, viêm nướu,... ở trẻ nhỏ và người lớn.
',N'Đọc kỹ hướng dẫn sử dụng trước khi dùng',N'Natri borat, Glycerin, Acid benzoic, Nước tinh khiết.',N'Rửa sạch tay trước khi sử dụng. Dùng bông sạch thấm dung dịch rơ miệng, thoa đều lên vùng bị tổn thương trong khoang miệng. Không ăn uống ngay sau khi rơ miệng.', N'TP009'),
('SP080', N'Gạc rơ lưỡi trẻ em Pharmacity (5 cái/hộp)', 5000, 'https://production-cdn.pharmacity.io/digital/768x768/plain/e-com/images/ecommerce/P11718.png', 150, 120, 30,N'Gạc rơ lưỡi trẻ em Pharmacity được sử dụng hàng ngày giúp hỗ trợ quá trình làm sạch răng miệng của bé, loại bỏ mảng bám và vi khuẩn có hại trên bề mặt lưỡi.
',N'Đọc kỹ hướng dẫn sử dụng trước khi dùng',N'100% polyester',N'Vệ sinh tay sạch sẽ trước khi rơ lưỡi cho trẻ. Dùng miếng gạc để rơ miệng cho trẻ cuốn vào ngón tay mẹ, sau đó chấm vào bát nước ấm để giúp miếng gạc được mềm. Rơ miệng cho trẻ từ 2 bên má, sau đó đến các vùng khác trong vòm miệng rồi bắt đầu rơ vùng lưỡi.', N'TP009'),
('SP081', N'Kem bôi dịu da cho bé dịu mẩn ngứa, ngừa thâm sẹo Kutieskin (30g)', 96000, 'https://production-cdn.pharmacity.io/digital/768x768/plain/e-com/images/ecommerce/P21378.png', 250, 50, 200,
N'Kem bôi dịu da cho bé dịu mẩn ngứa, ngừa thâm sẹo Kutieskin là sản phẩm chăm sóc sức khỏe cho bé, giúp giảm ngứa nhanh, dịu mẩn đỏ, làm mờ các vết sẹo và thâm do tổn thương da, côn trùng đốt, rôm sảy, và hăm tã.
',N'Đọc kỹ hướng dẫn sử dụng trước khi dùng',N'Dầu quả bơ,Phức hệ aquaxyl,Vitamin E,Chiết xuất Cam thảo',N'Làm sạch, lau khô, thoa đều kem lên vùng da bị tổn thương,Có thể dùng nhiều lần trong ngày', N'TP009'),
('SP082', N'Khăn hạ sốt Dr Papie 0+ (Hộp 5 túi x 5 khăn)', 150000, 'https://production-cdn.pharmacity.io/digital/768x768/plain/e-com/images/ecommerce/20241107092037-0-P21345_1.png', 300, 180, 120, 
N'Khăn lau hạ sốt Dr.Papie 0+  là giải pháp hạ sốt vật lý nhanh, an toàn cho trẻ sơ sinh từ 0 tháng tuổi trở lên, đã được Bộ Y Tế cấp phép. Khăn hạ sốt Dr.Papie 0+ có thể sử dụng để hạ sốt cho mọi trường hợp sốt ở trẻ sơ sinh: sốt do vi khuẩn, virus, sốt mọc răng, sốt tiêm phòng,…
',N'Đọc kỹ hướng dẫn sử dụng trước khi dùng',N'Chất liệu khăn được làm từ vải không dệt cotton mềm mại, được nhập khẩu 100% từ Mỹ.',N'Lau chườm toàn thân, giúp hạ sốt cho bé,Lau nhiều lần, đến khi hết ẩm thì thôi,Lau nhiều vào các vị trí có mạch máu lớn: nách, bẹn, cổ…',N'TP009'),
('SP083', N'Khăn ướt BOBBY không mùi cho bé (Gói 100 miếng)', 47400 , 'https://production-cdn.pharmacity.io/digital/768x768/plain/e-com/images/ecommerce/P13804.png', 180, 20, 160,
N'Khăn ướt BOBBY không mùi cho bé là sản phẩm chăm sóc da chuyên biệt dành cho trẻ sơ sinh và trẻ nhỏ, được thiết kế để mang lại sự sạch sẽ và an toàn tuyệt đối cho làn da nhạy cảm của bé. Sản phẩm này nổi bật với công thức không mùi, không chứa cồn và các chất gây kích ứng, giúp làm sạch da một cách nhẹ nhàng mà không gây khô hay kích ứng.
',N'Ứng dụng công nghệ Nano Silver với các hạt phân tử nano bạc giúp tăng cường khả năng chống vi khuẩn, hiệu quả với tụ cầu khuẩn vàng. đặc biệt thích hợp cho làn da nhạy cảm của bé. 
',N'Làm từ spunlace dày, mềm và mịn.Ứng dụng công nghệ Nano Silver với các hạt phân tử nano bạc giúp tăng cường khả năng chống vi khuẩn, hiệu quả với tụ cầu khuẩn vàng. đặc biệt thích hợp cho làn da nhạy cảm của bé. ',N'Mở nắp và rút từng tờ khăn ướt để sử dụng.,Sau khi sử dụng xong, đậy kín nắp để giữ ẩm cho khăn còn lại.
Khăn ướt có thể sử dụng nhiều lần trong ngày, đặc biệt là khi thay tã hoặc cần làm sạch nhanh chóng cho bé.
', N'TP009'),
('SP084', N'Khăn ướt dịu nhẹ Pharmacity Love Babe không mùi cho bé (80 tờ/gói)', 360000, 'https://production-cdn.pharmacity.io/digital/768x768/plain/e-com/images/ecommerce/P14567.png', 300, 180, 120,N'Với công thức được nghiên cứu từ chuyên gia, nguyên liệu được chọn lọc bởi đội ngũ quản lý chất lượng chuyên nghiệp, sản phẩm khăn ướt dịu nhẹ rất phù hợp cho làn da của bé. Cùng với thành phần chứa chiết xuất nha đam và dưỡng chất vitamin E tăng cường khả năng dưỡng ẩm và bảo vệ làn da, kết hợp chiết xuất hoa cúc la mã và yến mạch giúp hạn chế sự kích ứng da một cách hiệu quả. 
',N' Đọc kỹ hướng dẫn sử dụng trước khi dùng',N'Vải không dệt, nước tinh khiết, sodium benzoate, chiết xuất nha đam, chiết xuất yến mạch, chiết xuất hoa cúc la mã, vitamin E',N'Khăn ướt có thể sử dụng nhiều lần trong ngày, đặc biệt là khi thay tã hoặc cần làm sạch nhanh chóng cho bé', N'TP009');



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
    ('DH001', 'SP001', 'PT001', '2024-11-10', N'Thanh toán khi nhận hàng', 150000),
    ('DH002', 'SP002', 'PT002', '2024-11-11', N'Thanh toán qua thẻ', 200000),
    ('DH003', 'SP003', 'PT003', '2024-11-12', N'Thanh toán qua ví điện tử', 100000),
    ('DH004', 'SP004', 'PT004', '2024-11-13', N'Thanh toán khi nhận hàng', 0),
    ('DH005', 'SP005', 'PT005', '2024-11-14', N'Thanh toán qua thẻ', 50000),
    ('DH006', 'SP006', 'PT006', '2024-11-15', N'Thanh toán khi nhận hàng', 0),
    ('DH007', 'SP007', 'PT007', '2024-11-16', N'Thanh toán qua thẻ', 250000),
    ('DH008', 'SP008', 'PT008', '2024-11-17', N'Thanh toán qua ví điện tử', 180000),
    ('DH009', 'SP009', 'PT009', '2024-11-18', N'Thanh toán khi nhận hàng', 0),
    ('DH010', 'SP010', 'PT010', '2024-11-19', N'Thanh toán qua thẻ', 120000),
    ('DH011', 'SP011', 'PT011', '2024-11-20', N'Thanh toán khi nhận hàng', 300000),
    ('DH012', 'SP012', 'PT012', '2024-11-21', N'Thanh toán qua ví điện tử', 200000),
    ('DH013', 'SP013', 'PT013', '2024-11-22', N'Thanh toán qua thẻ', 170000),
    ('DH014', 'SP014', 'PT014', '2024-11-23', N'Thanh toán khi nhận hàng', 0),
    ('DH015', 'SP015', 'PT015', '2024-11-24', N'Thanh toán qua thẻ', 220000),
    ('DH016', 'SP016', 'PT016', '2024-11-25', N'Thanh toán qua ví điện tử', 0),
    ('DH017', 'SP017', 'PT017', '2024-11-26', N'Thanh toán khi nhận hàng', 110000),
    ('DH018', 'SP018', 'PT018', '2024-11-27', N'Thanh toán qua thẻ', 250000),
    ('DH019', 'SP019', 'PT019', '2024-11-28', N'Thanh toán qua ví điện tử', 130000),
    ('DH020', 'SP020', 'PT020', '2024-11-29', N'Thanh toán khi nhận hàng', 0);
INSERT INTO DonHang (id, idSanPham, idPhieuThongTin, phuongThucThanhToan, ngayTaoHoaDon, tongTien)
VALUES
    ('DH021', 'SP021', 'PT021', N'Thanh toán qua thẻ', '2024-11-30', 500000),
    ('DH022', 'SP022', 'PT022', N'Thanh toán qua ví điện tử', '2024-12-01', 350000),
    ('DH023', 'SP023', 'PT023', N'Thanh toán khi nhận hàng', '2024-12-02', 450000),
    ('DH024', 'SP024', 'PT024', N'Thanh toán qua thẻ', '2024-12-03', 200000),
    ('DH025', 'SP025', 'PT025', N'Thanh toán qua ví điện tử', '2024-12-04', 300000),
    ('DH026', 'SP026', 'PT001', N'Thanh toán khi nhận hàng', '2024-12-05', 150000),
    ('DH027', 'SP027', 'PT002', N'Thanh toán qua thẻ', '2024-12-06', 600000),
    ('DH028', 'SP028', 'PT003', N'Thanh toán qua ví điện tử', '2024-12-07', 250000),
    ('DH029', 'SP029', 'PT004', N'Thanh toán khi nhận hàng', '2024-12-08', 100000),
    ('DH030', 'SP030', 'PT005', N'Thanh toán qua thẻ', '2024-12-09', 700000);


SELECT id FROM DonHang;


INSERT INTO ChiTietDonHang (idDonHang, idSanPham, soLuong, thanhTien)
VALUES
    ('DH001', 'SP001', 1, 367500),
    ('DH002', 'SP002', 1, 405000),
    ('DH003', 'SP003', 2, 258500),
    ('DH004', 'SP004', 1, 450000),
    ('DH005', 'SP005', 4, 129000),
    ('DH006', 'SP006', 1, 85000),
    ('DH007', 'SP007', 1, 175000),
    ('DH008', 'SP008', 1, 320000),
    ('DH009', 'SP009', 1, 230000),
    ('DH010', 'SP010', 1, 75000),
    ('DH011', 'SP011', 1, 120000),
    ('DH012', 'SP012', 1, 299000),
    ('DH013', 'SP013', 1, 120000),
    ('DH014', 'SP014', 1, 75000),
    ('DH015', 'SP015', 1, 340000),
    ('DH016', 'SP016', 1, 250000),
    ('DH017', 'SP017', 1, 150000),
    ('DH018', 'SP018', 1, 200000),
    ('DH019', 'SP019', 1, 45000),
    ('DH020', 'SP020', 1, 150000),
    ('DH021', 'SP021', 1, 890000),
    ('DH022', 'SP022', 1, 580000),
    ('DH023', 'SP023', 1, 750000),
    ('DH024', 'SP024', 1, 45000),
    ('DH025', 'SP025', 1, 320000),
    ('DH026', 'SP026', 1, 250000),
    ('DH027', 'SP027', 1, 30000),
    ('DH028', 'SP028', 1, 90000),
    ('DH029', 'SP029', 1, 70000),
    ('DH030', 'SP030', 1, 950000);

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
    ('GH001', 'SP001', 2, 735000),
    ('GH002', 'SP002', 1, 405000),
    ('GH003', 'SP003', 3, 777000),
    ('GH004', 'SP004', 2, 900000)    ,
    ('GH005', 'SP005', 1, 1290000),
    ('GH006', 'SP006', 5, 4250000),
    ('GH007', 'SP007', 3, 525000),
    ('GH008', 'SP008', 4, 1280000),
    ('GH009', 'SP009', 2, 460000),
    ('GH010', 'SP010', 6, 450000),
    ('GH011', 'SP011', 1, 120000),
    ('GH012', 'SP012', 2, 598000),
    ('GH013', 'SP013', 3, 360000),
    ('GH014', 'SP014', 4, 300000),
    ('GH015', 'SP015', 1, 340000),
    ('GH016', 'SP016', 2, 500000),
    ('GH017', 'SP017', 5, 750000),
    ('GH018', 'SP018', 3, 600000),
    ('GH019', 'SP019', 4, 180000),
    ('GH020', 'SP020', 2, 300000);




