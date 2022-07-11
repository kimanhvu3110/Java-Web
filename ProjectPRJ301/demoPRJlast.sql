
/****** Object:  Table [dbo].[Categories] ******/
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryTypeID] [int] NOT NULL,
	[CategoryName] [nvarchar](50) NOT NULL,
	[CategoryDescription] [nvarchar](500) NULL,
	[DateCreated] [datetime] NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
))
INSERT [dbo].[Categories] (  [CategoryTypeID],[CategoryName], [CategoryDescription], [DateCreated]) VALUES (  1,N'Thời trang', NULL, '2022-03-01')
INSERT [dbo].[Categories] (  [CategoryTypeID],[CategoryName], [CategoryDescription], [DateCreated]) VALUES (  1,N'Thể thao nữ', NULL, '2022-03-01')
INSERT [dbo].[Categories] (  [CategoryTypeID],[CategoryName], [CategoryDescription], [DateCreated]) VALUES (  1,N'Sức khỏe phái đẹp', NULL, '2022-03-01')
INSERT [dbo].[Categories] (  [CategoryTypeID],[CategoryName], [CategoryDescription], [DateCreated]) VALUES (  1,N'1000 tips xử chồng', NULL, '2022-03-01')
INSERT [dbo].[Categories] (  [CategoryTypeID],[CategoryName], [CategoryDescription], [DateCreated]) VALUES (  2,N'Da mặt', NULL, '2022-03-01')
INSERT [dbo].[Categories] (  [CategoryTypeID],[CategoryName], [CategoryDescription], [DateCreated]) VALUES (  2,N'Toàn thân', NULL, '2022-03-01')
INSERT [dbo].[Categories] (  [CategoryTypeID],[CategoryName], [CategoryDescription], [DateCreated]) VALUES (  2,N'Vùng Eva', NULL,'2022-03-01');


/****** Object:  Table [dbo].[News] ******/

CREATE TABLE [dbo].[News](
	[NewsID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryID] [int] NOT NULL,	
	[Title] [nvarchar](500) NOT NULL,
	[ImageF] [nvarchar](50) NULL,
	[ImageC] [nvarchar](50) NULL,
	[NewsDescription] [ntext] NOT NULL,
	[NewsContent] [ntext] NOT NULL,
	[DateCreated] [datetime] NOT NULL,	
FOREIGN KEY(CategoryID) REFERENCES Categories (CategoryID),
 CONSTRAINT [PK_NewsID] PRIMARY KEY CLUSTERED 
(
	[NewsID] ASC
))

INSERT [dbo].[News] ( [CategoryID], [Title], [ImageF], [ImageC], [NewsDescription], [NewsContent], [DateCreated]) VALUES 
( 1, N'Ralph Lauren gợi nhớ đến sự tự do trong bộ sưu tập Xuân Hè 2022','image1.png','image1,2.png', N'Bộ sưu tập Xuân/Hè 2022 của nhà thiết kế thời trang người Mỹ Ralph Lauren được dẫn dắt bởi sự thèm muốn du lịch và khao khát phiêu lưu.',
N'Nóng bỏng trên một bãi biển đầy đá với nước biển vỗ vào bờ tung bọt trắng xoá, bộ sưu tập Xuân/Hè 2022 của nhà 
thiết kế thời trang người Mỹ Ralph Lauren được dẫn dắt bởi sự thèm muốn du lịch và khao khát phiêu lưu. 
Đưa chúng ta đến một nơi nghỉ ngơi thư giãn ven biển với dòng sản phẩm mới nhất của nhà mốt.

 Là sự kết hợp đầy nghệ thuật giữa các họa tiết in đậm và màu sắc ấm áp, bộ sưu tập pha trộn giữa phong cách Mỹ
đặc trưng của Lauren với phong cách miền biển thoải mái.
 Kiểu dáng thứ hai của buổi trình diễn gói gọn điều này một cách đặc biệt với một chiếc sarong đầy màu sắc được 
in với hoa văn Ikat đậm được đặt cạnh nhau với một tấm vải flannel màu xanh đậm chảy. Có nguồn gốc từ Đông Nam Á,
Ikat (một từ của Indonesia) là một kỹ thuật nhuộm vải, trong đó sợi được nhuộm trước khi chúng được dệt lại với nhau, 
tạo ra hoa văn rực rỡ và nhiều màu sắc. 

  Loại vải phức tạp được sử dụng cho BST Xuân/Hè 2022 của Ralph Lauren được làm thủ công cẩn thận tại Uzbekistan.
Trong bộ sưu tập này, nhà mốt đã kết hợp những kiểu dáng phương Tây đặc trưng của Ralph Lauren với phong cách cho khu 
nghỉ dưỡng để tạo ra một cái gì đó độc đáo và cá tính cho thương hiệu. Tất cả đều có mặt trong suốt dòng sản phẩm này. 
  Chất liệu denim được sơn vẽ cẩn thận và kết cườm bằng tay sequin tinh tế tạo thêm nét nghệ thuật, với tay nghề thủ công 
 là trung tâm của trang phục. Trong một bài đăng trên Instagram,Ralph Lauren nói rằng bộ sưu tập được lấy cảm hứng từ 
 “sự sáng tạo của vẻ đẹp và phong cách”, thiên về thể hiện bản thân, tự do và độc đáo.

 Nhà mốt sang trọng gọi lại quá khứ của mình cho bộ áo liền quần lụa Corrine Ikat-Print, tái hiện một kiểu dáng lưu trữ 
 với hoa văn Ikat vẽ tay trên lụa shantung. Bộ sưu tập mới nhất của Ralph Lauren là sự lựa chọn hoàn hảo cho những ngày 
 vô tư mà tất cả chúng ta hy vọng sẽ được tận hưởng trong những tháng tới. Từ quần chinos thanh lịch đến áo cánh mỏng manh,
 không thiếu những món đồ thoải mái để bạn lựa chọn trong thời tiết ấm hơn sắp tới.' , '2022-03-01'),

( 1, N'Muốn mặc đồ bơi đẹp phải biết 5 cách mix phụ kiện cực chất này', 'image2.png','image2,2.png', N'Muốn trở nên thu hút và sành điệu hơn khi mặc đồ bơi, ngoài yếu tố chọn trang phục hợp vóc dáng bạn cần chú ý đến các phụ kiện đi kèm như mũ, kính, vòng cổ, khuyên tai.
',N'Đồ bơi là một trong những trang phục không thể thiếu khi đi biển, đặc biệt là vào mùa hè. Để chọn được bộ bikini hay monokini 
đẹp, chị em cần quan tâm đến yếu tố phù hợp vóc dáng, ví dụ nếu bạn có vòng 2 kém thon nên chọn đồ bơi một mảnh hoặc dạng cạp cao 
để giấu mỡ hiệu quả, nếu nàng có phần vai to nên ưu tiên đồ bơi có tay, nếu phái đẹp có phần mông chảy xệ hãy chọn bikini dáng váy... 

 Bên cạnh đó, một yếu tố giúp bạn nổi bật hơn khi diện những bộ đồ bơi chính là phụ kiện đi kèm. 
 Dưới đây là một số cách phối phụ kiện cực chất và sành cho nàng khi mặc đồ bơi:

  * Đồ bơi màu cam
Màu cam là một trong những tone nổi bật, giúp chị em càng thêm quyến rũ. Với những người có làn da sáng màu có thể chọn tone 
cam neon, cam sáng; bạn gái sở hữu nước da ngăm nên ưu tiên đồ bơi màu cam đậm, cam đất.Với một bộ bikini rực rỡ như thế này, 
nàng nên chọn phụ kiện có tone màu tiết chế như vòng cổ màu bạc hoặc trắng, kính đen và sandal màu sắc thiên trầm như hình.

  * Đồ bơi màu xanh Cobalt
Màu xanh cobalt cũng được rất nhiều người lựa chọn trong mùa hè năm nay vì đem lại cảm giác mát mắt. Bạn có thể diện một bộ 
monokini có dây bèo đan chéo như thế này nhằm tạo điểm nhấn nữ tính. Màu này cũng không quá kén da nên có thể phù hợp với
nhiều người. Chú ý nếu da bạn càng tối màu hãy mặc màu xanh cobalt đậm để tạo sự hài hòa.Với bộ đồ bơi sắc xanh như thế này, 
chị em nên chọn hoa tai, kính mắt và vòng tay có màu sắc nữ tính như sắc hồng nhẹ nhàng. Tránh chọn các tông hồng neon vì nó 
quá chói, tạo sự tương phản lớn với trang phục.

  * Đồ bơi màu đen
Đồ bơi màu đen là lựa chọn ưu tiên của rất nhiều người vì nó đem lại sự bí ẩn. Nếu sở hữu vóc dáng đẫy đà cùng vòng eo 
"bánh mì",nàng hãy chọn bikini cạp cao màu đen như hình.Một cách phối phụ kiện rất chất với đồ bơi màu đen là phong cách 
ton-sur-ton cùng kính râm, sandal có màu sắc đồng điệu. Ngoài ra, một đôi khuyên tai sắc trắng sẽ là điểm nhấn nhẹ nhàng
cho set đồ.', '2022-03-27'),

(1, N' Nữ CEO thành công nhờ những chiếc váy năng lượng', 'image3.png','image3,2.png', N'Loan Trần, nữ CEO trẻ ngành may mặc gặt hái nhiều thành công với phương châm tạo ra những trang phục mang năng lượng cao.', 
N'Từ một cô sinh viên trường Đại học Kinh Tế, không biết gì về thế giới phù hoa của thời trang. Loan Trần nghe theo trái tim 
lẫn tâm thức để học tập và tìm hiểu về ngành thời trang mà khởi đầu là những điểm chạm từ việc cung cấp chất liệu vải đa dạng 
cho các cửa hàng, công ty thời trang nhỏ lẻ. 

  Những tưởng con đường cô đi với váy áo lụa là không dài lâu vì những thất bại liên tiếp, có lúc tưởng chừng cô không thể 
đứng dậy. Thế nhưng, Loan Trần dần tìm ra được con đường riêng dẫn cô đến thành công lâu dài mãi mãi nhờ vào tìm về bên trong, 
lắng nghe tâm thức để trao yêu thương, năng lượng tích cực lẫn sự biết ơn đến những mảnh vải, sợi chỉ, chiếc nút, các nhân viên 
và cả những khách hàng của cô, từ đó thành lập một đế chế may mặc thời trang ứng dụng nổi danh khắp cả nước. Giờ đây không chỉ 
những doanh nhân, tín đồ thời trang mà các ngôi sao cũng tìm đến Loan Trần để được cô tư vấn thời trang.


  Chia sẻ về câu chuyện những chiếc váy năng lượng, Loan Trần cho biết: “Trước đây Loan từng nhiều lần thất bại, khi cứ dồn nén 
công việc lẫn cảm xúc vào những món đồ mình làm ra, Loan nghĩ chính vì vậy thành công càng đi xa khỏi tầm tay của mình. 
Sau những cú ngã, Loan tìm về bên trong và học cách nâng cao năng lượng tích cực của bản thân, Loan không nghĩ những khách hàng 
của mình chỉ đơn thuần là làm ăn qua lại, thay vào đó Loan biết yêu thương và muốn gắn kết với mọi người như bạn bè người thân 
để cùng nhau lan tỏa những điều tốt đẹp vào từng bộ trang phục được tạo ra.

   Loan luôn biết ơn những thất bại đã là chất xúc tác để Loan có thể truyền năng lượng và nâng niu những tấm vải nhỏ, chiếc 
 kim mũi chỉ để cấu thành một bộ đồ thời trang và gửi đến khách hàng. Loan muốn trang phục mình và các khách hàng tạo nên 
 không đơn thuần chỉ làm đẹp và mang lại sự phong cách cho mọi người, mà rộng lớn hơn trang phục làm cho người mặc họ hạnh phúc, 
 nhiều niềm vui và năng lượng tích cực từ đó họ làm việc tốt hơn và gắn kết hơn với mọi người xung quanh. Loan đã và đang làm 
 được điều này và sẽ phụng sự mọi người nhiều hơn nữa trên hành trình mang đến những bộ cánh có nhiều năng lượng làm ai cũng 
 vui vẻ tươi trẻ và ngập tràn hạnh phúc”

    Giờ đây, Loan Trần đã thoát xác từ một cô sinh viên ĐH Kinh Tế thành nữ CEO lẫn fashionista đúng điệu, luôn mang lại những 
 làn gió thời trang mới mẻ và không ngừng khai phá giới hạn của bản thân trong làng mốt. Loan cũng rất biết cách cập nhật 
 những xu hướng thời trang, là một tín đồ hàng hiệu đúng nghĩa để nạp cho mình nhiều kiến thức từ đó truyền tải rộng rãi 
 hơn đến tất cả mọi người. Dẫu có là người mang đến những tấm vải đẹp mắt, những bộ trang phục mà hằng ngày chị em phụ nữ 
 vẫn khoác lên người để thêm tự tin và tràn đầy năng lượng, Loan Trần vẫn không tự nhận mình là một nhà thiết kế, cô cho rằng 
 mình là một người phụng sự nhân sinh mang lại cái đẹp thiện mỹ cho mọi chị em bằng những sản phẩm đầy năng lượng tích cực 
 và lòng biết ơn mà thôi!', '2022-03-01'),

(1, N'"Ma nữ đẹp nhất Thái Lan" chuộng đồ cut-out', 'image4.png','image4,2.png',N'Mai Davika - biệt danh "Ma nữ đẹp nhất Thái Lan" - theo đuổi phong cách gợi cảm
với các thiết kế cắt xẻ táo bạo.', 
N'  Trong sự kiện ở Bangkok, Thái Lan cuối tháng 1, Mai Davika khoe cơ thể với đầm satin cut-out của hãng mốt Datt. 
Trên Instagram, nhiều khán giả cho rằng trang phục kén người mặc, khiến diễn viên lộ khuyết điểm gầy, ngực lép. Số fan 
khác khen sao Thái gợi cảm, sang trọng. Nhiều mỹ nhân Việt từng lăng xê thiết kế tương tự như Hồ Ngọc Hà, Thanh Hằng, 
Ngọc Trinh, Diễm My 9x, Phạm Quỳnh Anh...

  Người đẹp 30 tuổi phối túi xách mini với giày biểu tượng hàm thiếc ngựa của Gucci khi mặc đầm cắt xẻ hiệu For Love & Lemons. 
Hình ảnh thu hút 444.000 lượt thích cùng hàng trăm lời khen.Cô dự tiệc ở trung tâm thương mại, văn hóa Bangkok Metropolis, Thái Lan 
với đầm cut-out hình thoi thuộc bộ sưu tập Xuân Hè 2022 của thương hiệu Mônot. Mai Davika trung thành với mái tóc đen dài, 
lối trang điểm tự nhiên.
  Thiết kế cut-out, hở lưng của hãng mốt Jacquemus được nhiều chuyên trang thời trang Thái Lan đánh giá táo bạo, 
  "không phải ai cũng dám mặc". Mai Davika chuộng mốt áo cắt xẻ Gucci vì tôn eo, kết hợp ăn ý với quần bóng và túi xách 
  hobo Jackie 1961. Tại lễ trao giải Howe Awards 2020, cô tạo dáng với đầm tôn vòng hai của hãng thời trang David Koma. 
  Bên cạnh lời khen eo "con kiến", một bộ phận khán giả phàn nàn diễn viên quá gầy.
  Diễn viên cũng chuộng trang phục xuyên thấu, crop-top, bra-top... tôn đường nét cơ thể.

  Mai Davika tên thật Davika Hoorne, sinh năm 1992, mang hai dòng máu Thái Lan - Bỉ. Từ sau phim Tình người duyên ma, 
  cô được mệnh danh "Ma nữ đẹp nhất Thái Lan". Diễn viên còn ghi dấu với loạt phim Vết sẹo cũ, Trở lại tuổi 20, Nhân cách 
  trong em, Hẹn ước tình yêu... Cô và ngôi sao tài năng Ter Chantavit yêu nhau gần 5 năm, được các nghệ sĩ bình chọn là 
  "Cặp tình nhân đẹp nhất" trong cuộc khảo sát của Thairaith đầu tháng 1.', '2022-03-01'),

(2, N'Bóng đá nữ Việt Nam dự World Cup 2023: Quả ngọt từ "vườn ươm" Tao Đàn', 'image5.png','image5,2.png',N'TTO - Chiến tích giành vé dự World Cup 2023 của đội tuyển nữ Việt Nam có sự đóng góp không nhỏ từ "vườn ươm" Tao Đàn - nơi được xem là cái nôi của bóng đá nữ TP.HCM và liên tục cung cấp nhiều tuyển thủ giỏi cho bóng đá nữ Việt Nam.',
N'  Không chỉ đóng góp nhiều tuyển thủ nhất (9 cầu thủ) trong hành trình đáng nhớ tại Ấn Độ, 8 cầu thủ nữ TP.HCM còn 
ra sân ở đội hình xuất phát trong hai trận play-off thắng Thái Lan 2-0 và Đài Loan 2-1. Trong đó, đội trưởng Huỳnh Như, 
Chương Thị Kiều và Bích Thùy còn ghi 3/4 bàn trong hai trận thắng kể trên.

                                                     -- "Vườn ươm" Tao Đàn --
  7 năm qua, CLB nữ TP.HCM luôn vô đối ở sân chơi quốc nội với 6 lần vô địch quốc gia và 1 ngôi á quân. Bên cạnh đó, 
đội còn giành HCV ở Đại hội TDTT toàn quốc 2018.
  Ngoài tài cầm quân của cựu tuyển thủ Đoàn Thị Kim Chi và hiện là trợ lý số 1 của HLV Mai Đức Chung ở đội tuyển quốc gia, 
việc xây dựng chiến lược tuyển chọn hợp lý đã giúp CLB nữ TP.HCM liên tục tạo nên lớp cầu thủ kế thừa.
Ông Trần Anh Tuấn - HLV CLB nữ TP.HCM giai đoạn 1998 - 2003 và từng là trợ lý đầu tiên cho HLV Mai Đức Chung ở SEA Games 1997 
- kể: "Ở Giải vô địch quốc gia năm 2002, lứa cầu thủ đầu tiên bắt đầu lớn tuổi, vì thế chúng tôi phải đi tuyển chọn ở các 
trường đại học TDTT rồi đi đến các địa phương khác để tìm kiếm nhân tài. Điều này do tìm cầu thủ nữ ở TP.HCM là không dễ dàng,
vì các phụ huynh đều không muốn cho con mình theo thể thao chuyên nghiệp, đặc biệt là bóng đá nữ".Nhưng qua đào tạo tại 
"vườn ươm" Tao Đàn, Kim Chi đã dần trở thành cầu thủ nổi tiếng của quốc gia và giờ vẫn đang giữ kỷ lục 4 lần giành 
"Quả bóng vàng Việt Nam". Thông qua mối quan hệ giữa các HLV, việc tuyển chọn cầu thủ nữ và sau đó tiến hành đào tạo của 
"vườn ươm" Tao Đàn tập trung chủ yếu ở các tỉnh miền Trung đến Cà Mau.

                                              -- Muôn nẻo đường tìm kiếm "ngọc thô" --
  Thành công của "vườn ươm" Tao Đàn là điều nhiều người thấy. Nhưng ít ai biết đến sự đam mê lẫn vất vả của những người làm 
 nghề ở đây. Do "vườn ươm" chủ yếu chọn cầu thủ từ các tỉnh, nên chỉ cần nghe đồng nghiệp báo ở đâu có nhân tố hứa hẹn là 
 HLV ở Tao Đàn lại khăn gói lên xe đò đến địa phương để tìm "ngọc thô".
  HLV Lê Hữu Đức là một trong những tuyển trạch viên của Tao Đàn. Nghe báo ngày hôm trước là hôm sau anh đi đến tận nơi để 
tuyển chọn. Năm nay thì đỡ hơn, khi việc tuyển trạch được phân công cụ thể theo khu vực. Theo đó, miền Tây là trách nhiệm 
của cựu tuyển thủ Lưu Ngọc Mai, miền Đông là HLV Lê Hữu Đức và miền Trung là HLV Nguyễn Hữu Thắng.
  Ông Mai Bá Hùng, phó giám đốc Sở VH-TT TP.HCM và từng là giám đốc Trung tâm TDTT quận 1, chia sẻ: "Khi tôi còn làm ở quận 1, 
kinh phí mỗi năm để duy trì cho bóng đá nữ lên đến 4 - 5 tỉ đồng.
  Dù đó là một số tiền rất lớn nhưng phải cắn răng mà chi để duy trì sự phát triển cái nôi của bóng đá nữ TP.HCM. Khi tôi 
chuyển sang sở, tôi cũng chỉ đạo cũng như xin hỗ trợ từ nhiều nguồn giúp quận 1 đầu tư cho bóng đá nữ. Và quả thật, tôi thấy 
mừng khi bóng đá nữ TP.HCM đạt thành công và đóng góp lớn cho chiếc vé dự World Cup 2023".
  Nhưng giấc mơ của "vườn ươm" không chỉ là đào tạo cầu thủ cho mình, mà còn là cho bóng đá nữ Việt Nam. Và muốn vậy, Tao Đàn 
  cần nhiều sự đầu tư hơn.
  Giờ đây tôi hy vọng thành công của CLB nữ TP.HCM nói riêng và sự cống hiến cho đội tuyển nữ Việt Nam cho thấy sự hiệu quả 
 của mô hình đào tạo tại sân Tao Đàn để có thể triển khai như chúng tôi đã đề xuất với VFF.
  Theo đó, nguồn tiền FIFA hỗ trợ cho bóng đá Việt Nam có thể được chi hỗ trợ thêm trung tâm mở tại đây. Chúng tôi cũng có 
 ba sân cỏ để đáp ứngviệc huấn luyện là sân Hoa Lư, Thống Nhất và Phú Thọ".','2022-02-11'),

(2, N'Người đẹp 18 tuổi lập kì tích US Open, tennis Mỹ khủng hoảng sau 140 năm', 'image6.png','image6,2.png', N'Emma Raducanu, nữ tay vợt xinh đẹp người Anh 
khiến người hâm mộ đi từ bất ngờ này tới bất ngờ khác trong năm 2021.',
N'  Tại Wimbledon, cô gái 18 tuổi gây sốc với thành tích lọt vào vòng 4, và ở US Open 2021 đang diễn ra, 
cô nàng 18 tuổi cũng tạo dấu mốc mới trong sự nghiệp, khi lần đầu tiên vào tới tứ kết một Grand Slam. Ngoài Raducanu, tại US Open 
có 2 nhân vật 18 tuổi khác giành quyền vào chơi tứ kết. 

  Đơn nữ có Leylah Fernandez (Canada, vừa bước sang tuổi 19 hôm 6/9) và đơn nam có tay vợt được mệnh danh "hậu duệ Nadal" 
Carlos Alcaraz, người hạ cả hạt giống số 3 Stefanos Tsitsipas trên con đường tiến vào tứ kết. 
  Ba tay vợt 18 tuổi "làm mưa làm gió" trở thành hiện tượng đặc biệt tại US Open, còn ở giải đấu này các tay vợt đánh đơn của 
 chủ nhà đã lập kỉ lục rất buồn. Kể từ khi US Open diễn ra vào năm 1881, mỗi năm đều có tay vợt nước chủ nhà vào tứ kết, 
 nhưng năm nay thì không có ai cả. 
  Một phần nguyên nhân dẫn tới kỉ lục buồn này là việc chị em nhà Serena không thi đấu, tuy nhiên người Mỹ vẫn đặt hy vọng vào 
 những John Isner, Reilly Opelka, Danielle Collins và Jessica Pegula.... Nhưng tất cả đều gây thất vọng. Novak Djokovic,
 tay vợt hạt giống số 1 là người đã loại niềm hy vọng cuối cùng cuối cùng nội dung đơn nam của Mỹ. Ở vòng 4, Nole hạ để thua set 
 đầu tiên trước Jenson Brooksby (Mỹ), nhưng ngược dòng 3 set sau đó để vào tứ kết. 

  Đơn nữ, niềm hy vọng Shelby Rogers, 28 tuổi của Mỹ cũng không thể thắng tay vợt xinh đẹp Emma Raducanu. Tay vợt hạng 43 thế giới 
để thua trước tay vợt 18 tuổi đang giữ hạng 150 thế giới 0-2 (2-6, 1-6). 
Trực tiếp khiến tennis Mỹ rơi cảnh khốn đốn sau 140 năm, Raducanu giành vé vào tứ kết gặp hạt giống 11 Belinda Bencic (Thụy Sĩ). 
Nhà đương kim vô địch Olympic Tokyo sẽ là liều thuốc thử cực mạnh với tay vợt 18 tuổi người Anh. ','2021-12-24'),

(2,N'Bóng rổ nữ Việt Nam: Đam mê và thử thách!', 'image7.png','image7,2.png', N'Tình yêu mà những cô gái dành cho trái bóng cam không thua kém gì cánh mày râu, 
tuy nhiên có rất nhiều bài toán hóc búa dành cho họ.',
N'  Như đa số môn thể thao khác, bóng rổ dành cho phái yếu không thực sự được quan tâm tại Việt Nam vì rất nhiều lý do khác nhau, 
nhưng không vì thế tình yêu trái bóng cam của các cô gái bị mờ nhạt. Trên khắp dải đất hình chữ S phong trào bóng rổ nữ cũng đang 
phát triển từng ngày.

  * Sự phát triển của bóng rổ nữ tại Việt Nam
  Khi VBA ra đời vào năm 2016, phong trào chơi bóng rổ tại Việt Nam bắt đầu sôi động lên từng ngày. Không chỉ dành cho nam, 
trái bóng cam cũng len lỏi vào suy nghĩ của các cô gái.
 Có rất nhiều lý do để các bóng hồng lựa chọn bóng rổ thay vì các môn thể thao khác, thứ nhất đó là môn thể thao vừa bộc lộ 
được cá tính của bản thân vừa đề cao tinh thần đồng đội. Hơn nữa phong cách thời trang, sự hiện đại của bóng rổ cũng phù hợp 
với các bạn nữ đang ở độ tuổi trưởng thành.

  Đó là lý do các sân chơi bóng rổ phong trào từ những thành phố lớn như Tp.Hồ Chí Minh, Hà Nội, Đà Nẵng cho tới những địa 
 phương nhỏ hơn như Yên Bái, Cần Thơ, Thái Bình,... đều chứng kiến sự phát triển ổn định của bóng rổ nữ.
 Các giải đấu học sinh cũng chứng kiến số lượng đội bóng nữ tăng vượt bậc hàng năm, đó là tín hiệu tích cực cho thấy bóng rổ 
phong trào nữ tại Việt Nam có những tính hiệu tích cực.

  * Những khó khăn và thách thức
  Dù phát triển rất tốt về mặt phong trào tuy nhiên việc tiếp nối lên chuyên nghiệp của bóng rổ nữ lại gặp rất nhiều khó khăn. 
  Đầu tiên phải kể đến tư duy của các bậc phụ huynh không muốn con mình, nhất là con gái theo thể thao chuyên nghiệp.
  Đối với cha mẹ việc cho con chơi bóng rổ chỉ là để tập luyện thể dục thể thao nâng cao sức khoẻ, còn việc thi đấu chuyên nghiệp 
 vẫn tiềm ẩn những rủi ro rất lớn như chấn thương, mức thu nhập không đảm bảo,...Cũng vì vậy các đội bóng nữ chỉ hoạt động đa phần 
 theo mô hình không chuyên, tự bỏ tiền túi tập luyện và thi đấu với nhau, điều các cô gái cần là sân chơi nhưng gần như không có.

  Nếu nhẩm đếm, giải đấu dành cho nữ chưa đầy số ngón trên một bàn tay. Các giải đấu chính thức của Liên đoàn bóng rổ Việt Nam chỉ
 có giải Vô địch Quốc gia, giải Trẻ Quốc gia, ngoài ra 4 năm một lần có Đại hội Thể dục thể thao toàn quốc. Audi Cup mà tiền thân 
 là giải miền Bắc mở rộng cũng đã bỏ nội dung nữ trong lần tổ chức gần nhất.
 Tại SEA Games 30 Philippines đội tuyển Việt Nam cũng chỉ có đội tuyển 3x3 dành cho nữ. Những điều trên cho thấy mức độ quan tâm 
 và đầu tư cho bóng rổ nữ vẫn còn nhiều hạn chế.Tuy nhiên để đầu tư cho bóng rổ nhất là bóng rổ nữ cần một chặng đường dài hơi 
 và quan trọng hơn là việc phát triển trẻ để tìm kiếm sự kế thừa. Để làm được điều đó cần hơn hết các giải đấu từ không chuyên 
 tới chuyên nghiệp giúp họ cọ xát và theo đuổi đến cùng trái bóng cam.','2021-12-30'),

(3, N'Bật mí 5 cách phòng ngừa ung thư cổ tử cung đơn giản hiệu quả', 'image8.png','image8,2.png', N'Cổ tử cung là phần hẹp dưới tử cung, có vai trò nối liền cơ quan này với âm đạo. Theo thống kê mỗi ngày ở Việt Nam lại có khoảng 9 phụ nữ tử vong vì căn bệnh này. Phòng ngừa ung thư cổ tử cung một cách chủ động sẽ giảm thiểu tối đa nguy cơ mắc bệnh.'
,N'  1. Những cách đơn giản giúp phòng ngừa ung thư cổ tử cung
Nguyên nhân chủ yếu dẫn tới ung thư cổ tử cung là do virus HPV. Ngoài ra còn 1 số yếu tố nguy cơ khác làm tăng khả năng mắc bệnh 
như: Quan hệ tình dục thiếu an toàn, dinh dưỡng kém, sức khỏe và hệ miễn dịch yếu, vệ sinh vùng kín không đúng cách, bảo vệ sức 
khỏe sinh sản chưa tốt,… Mỗi ngày Việt Nam ghi nhận đến 9 trường hợp tử vong vì ung thư cổ tử cung
Từ những nguyên nhân và yếu tố nguy cơ này, chúng ta có thể chủ động phòng ngừa bệnh ung thư cổ tử cung như sau:

   1.1. Tiêm phòng vắc xin HPV
Con đường lây nhiễm chủ yếu của virus HPV là quan hệ tình dục, tiếp xúc của niêm mạc miệng, hầu họng với dương vật hoặc âm đạo. 
Do đó, không chỉ quan hệ tình dục thông thường, việc tiếp xúc hôn, chạm vào bộ phận sinh dục của bạn tình hoặc quan hệ tình dục 
qua lỗ hậu cũng có thể gây lây nhiễm virus này.
Hiện nay, đã có vắc xin ngừa virus này. Phụ nữ được khuyến cáo nên tiêm vắc xin HPV từ 11 - 12 tuổi đến tối đa 26 tuổi. Đây là 
khoảng thời gian tiêm phòng vắc xin có hiệu quả nhất, lứa tuổi 26 trở lên chưa nhiễm HPV vẫn có thể tiêm phòng song hiệu quả 
không cao. Vắc xin có thể làm giảm nguy cơ nhiễm virus HPV, song một số người vẫn có thể lây nhiễm virus nên ngoài tiêm phòng, 
vẫn cần khám, sàng lọc ung thư cổ tử cung định kì.

   1.2. Quan hệ tình dục an toàn
HPV rất dễ lây truyền qua đường tình dục khi người lành tiếp xúc da với người nhiễm bệnh. Vì thế hãy thực hiện lối sống lành mạnh, 
một vợ một chồng, sử dụng các công cụ bảo vệ như bao cao su để hạn chế lây truyền bệnh. 
Đặc biệt ở lứa tuổi vị thành niên, khi hệ miễn dịch của bạn gái chưa đủ khả năng bảo vệ cơ thể trước tác nhân gây bệnh tốt nhất 
và cũng chưa được giáo dục đầy đủ về việc quan hệ tình dục an toàn, tự bảo vệ sức khỏe bản thân trước mầm bệnh lây truyền. 

Do vậy, không nên quan hệ tình dục sớm, không dùng biện pháp bảo vệ bản thân.

   1.3. Vệ sinh âm đạo đúng cách
Việc âm đạo không được vệ sinh sạch sẽ làm cho phụ nữ có nguy cơ mắc các bệnh phụ khoa cũng như ung thư cổ tử cung cao hơn.
Hãy chú ý vệ sinh âm đạo đúng cách như sau:
    - Vệ sinh 2 lần mỗi ngày với nước sạch, hãy tham khảo hướng dẫn của bác sĩ
    - Tuyệt đối không dùng tay hoặc vòi hoa sen thụt rửa sâu vào âm đạo, nó khiến môi trường cân bằng của âm đạo bị phá hủy, 
	vi khuẩn xấu cũng dễ gây bệnh hơn.
    - Chú ý đến vấn đề vệ sinh trong thời kỳ hành kinh, không quan hệ tình dục trong khoảng thời gian này bởi hệ sinh dục đang
	yếu và dễ bị viêm nhiễm.
    - Không mặc quần lót quá chật, chọn vải cotton mềm, thông thoáng, thấm ướt mồ hôi tốt.
    - Khi có triệu chứng bất thường như: ra máu bất thường, dịch tiết vàng hoặc xanh, có lẫn màu, có mùi hôi, kinh nguyệt 
	không đều,… nên sớm đi khám phụ khoa và điều trị dứt điểm tránh bệnh tiến triển nặng.

  1.4. Chế độ ăn uống, nghỉ ngơi khoa học
 Tăng cường sức khỏe chung chính là cách để mỗi chúng ta tự củng cố hàng rào bảo vệ sức khỏe trước tác nhân gây bệnh, phòng ngừa 
 ung thư cổ tử cung nói riêng và nhiều bệnh lý khác. 
 Bạn cần chú ý thực hiện:
  - Chế độ dinh dưỡng khoa học, cân bằng, đầy đủ, đặc biệt là các thực phẩm giàu chất chống oxy hóa, vitamin A, C, E, canxi,…
  bảo vệ tế bào khỏi hoạt động của gốc tự do, ngăn ngừa ung thư.
  - Chế độ nghỉ ngơi hợp lý, đảm bảo giấc ngủ từ 7 - 8 giờ mỗi ngày, đi ngủ trước 11 giờ và nên cố định thời gian ngủ. 
  Thể dục thể thao đều đặn, tăng cường sức khỏe.
  - Giữ tinh thần khỏe mạnh, hạn chế stress căng thẳng, đây được đánh giá là một trong những yếu tố nguy hiểm khiến mầm bệnh 
  dễ hình thành, phát triển nhanh.

  1.5. Không nên lạm dụng thuốc tránh thai
  Nhiều cặp vợ chồng lựa chọn dùng thuốc tránh thai để kế hoạch hóa gia đình, tránh mang thai không mong muốn. Song sử dụng 
  thuốc tránh thai kéo dài, đặc biệt là thuốc tránh thai khẩn cấp sẽ gây ra những tác dụng phụ không mong muốn. 
  Các nghiên cứu khoa học đã chỉ ra, phụ nữ dùng thuốc tránh thai thường xuyên và kéo dài trên 5 năm có nguy cơ mắc ung thư cổ 
  tử cung cao hơn.


2. Sàng lọc định kỳ là cách phòng chống ung thư cổ tử cung hiệu quả
  Một số phụ nữ đã tiêm phòng vắc xin HPV vẫn có nguy cơ nhiễm virus và mắc ung thư cổ tử cung. Hơn nữa căn bệnh này hầu như không 
  gây triệu chứng gì giai đoạn đầu, khi bệnh tiến triển triệu chứng cũng rất mờ nhạt, dễ nhầm lẫn. Vì thế sàng lọc định kỳ để phát 
  hiện sớm bất thường là cách tốt nhất để bảo vệ sức khỏe khỏe khỏi căn bệnh này. Xét nghiệm sàng lọc ung thư cổ tử cung hiện nay 
  thường áp dụng là xét nghiệm Pap, phân tích tìm kiếm tế bào cổ tử cung bất thường. Bạn sẽ cần thực hiện một thủ thuật nhỏ với 
  dụng cụ đặc biệt để lấy mẫu tế bào trong cổ tử cung qua âm đạo. Sau đó mẫu sẽ được phân tích, nếu tìm thấy tế bào bất thường, 
  tiền ung thư hoặc ung thư thì xét nghiệm chẩn đoán sẽ thực hiện để kiểm tra sâu hơn.

  Hãy áp dụng những biện pháp phòng ngừa ung thư cổ tử cung trên đây để bảo vệ bản thân khỏi căn bệnh nguy hiểm này !!! ', '2021-12-09'),

(3, N'Tuổi 30 và 5 điều không thể bỏ qua khi chăm sóc sức khỏe', 'image9.png','image9,2.png',N'
30 là cột mốc quan trọng trong cuộc sống, sự nghiệp và sức khỏe của mỗi người, đặc biệt là phụ nữ. Ở giai đoạn này, người phụ nữ đạt được sự chín chắn trong suy nghĩ, ổn định trong công việc nhưng cơ thể cũng chính thức bước vào giai đoạn lão hóa. Hãy cùng điểm qua 5 điều không được bỏ qua trong quá trình chăm sóc sức khỏe, để nâng cao chất lượng cuộc sống, tạo tiền đề vững chắc cho thành công nhé!',
N' 1. Các dấu hiệu lão hóa

  Khi cơ thể chạm ngưỡng 30 tuổi, quá trình trao đổi chất diễn ra chậm lại do nội tiết tố thay đổi, dẫn đến vóc dáng kém thon gọn
hơn trước, làn da dễ sạm màu, đau nhức xương khớp hoặc vùng thắt lưng, vai, cổ, gáy - nhất là đối với nhân viên văn phòng phải 
thường xuyên ngồi lâu, ít vận động. 
  Những dấu hiệu đó càng dễ nhận biết hơn khi thay đổi thời tiết, những cơn đau nhức đột ngột, làn da xuất hiện nếp nhăn, 
đốm nâu nhiều hơn. 
  Do đó, chị em phụ nữ cần xây dựng chế độ ăn uống, tập luyện, chăm sóc da riêng biệt càng sớm càng tốt. Đừng đợi đến tuổi 40, 
khi các dấu hiệu lão hóathể hiện rõ rệt mới bắt đầu chăm sóc sức khỏe thì rất khó để đạt kết quả.

   * Kiểm tra sức khỏe định kỳ
 Theo thống kê từ các bệnh viện cho thấy tỉ lệ mắc bệnh ung thư vú, đái tháo đường, cao huyết áp... tại Việt Nam đang ngày càng 
trẻ hóa và phổ biến hơn. 
 Do đó, chúng ta cần chú ý khám sức khỏe định kỳ để có thể phát hiện sớm các bệnh nguy hiểm hoặc có biện pháp ngăn ngừa các nhóm 
bệnh lý tiềm ẩn.

 Ngoài lý do bận rộn, sự chủ quan khiến chúng ta dễ dàng bỏ qua việc tầm soát sức khỏe định kỳ. Hơn nữa, nhiều chị em vẫn chưa 
có thói quen tự theo dõi những triệu bất thường của cơ thể nên khi phát hiện bệnh thường đã vào giai đoạn diễn biến nặng, 
khó chữa trị, tốn kém chi phí, gây ảnh hưởng không nhỏ đến tinh thần, sức khỏe bản nhân và gia đình.

  Để vững tâm sống khỏe mạnh và hưởng cuộc sống, chị em nên khám sức khỏe định kỳ đều đặn 6 tháng một lần hoặc ít nhất là mỗi 
 năm một lần, nhất là những người có nguy cơ mắc bệnh cao như làm việc trong môi trường độc hại, trong gia đình có người 
 mắc ung thư.

   * Bình thường hóa các dấu hiệu của căng thẳng
  Ở độ tuổi càng có nhiều vấn đề phải bận tâm như áp lực công việc, chăm sóc gia đình, con cái, cha mẹ… phụ nữ càng có nguy cơ 
 đối mặt với căng thẳng nhiều hơn. Vì vậy, việc duy trì một sức khỏe tinh thần tốt là “trợ lực” giúp bạn vượt qua những khó khăn 
 và chinh phục các cột mốc thành công.

  Tuy nhiên, không ít chị em nghĩ rằng căng thẳng chỉ thể hiện qua tâm trạng vui, buồn và bỏ qua các dấu hiệu cơ thể lên tiếng 
 khi đối mặt với stress như tóc rụng, mất ngủ, tăng giảm cân đột ngột, thường xuyên đau nhức đầu. Thay vì điều chỉnh thói quen 
 ăn uống, nghỉ ngơi, luyện tập để giảm bớt dấu hiệu căng thẳng, nhiều người ăn uống thoải mái, thậm chí còn lạm dụng rượu bia để 
 giải quyết vấn đề. Từ đó sức khỏe thể chất và tinh thần bị ảnh hưởng trầm trọng, cần tốn nhiều chi phí và thời gian để điều trị
 dứt điểm. Khi cảm thấy bị căng thẳng, bạn có thể tập môn thể dục yêu thích, ngắm hoa, đọc sách, trang trí nhà cửa, hạn chế ăn 
 chất béo, sản phẩm có chất kích thích và dành thời gian cho bạn bè, người thân nhiều hơn. Nếu được, hãy thử tập ngồi thiền, 
 hít thở sâu giúp bạn kiểm soát cảm xúc và nhận biết mình rõ hơn.

   * Chủ quan với tình trạng sức khỏe
 Đa phần chúng ta thường có thói quen… tự làm bác sĩ. Khi cơ thể gặp những chứng bệnh thông thường, phản ứng đầu tiên sẽ là ra 
hiệu thuốc, mô tả triệu chứng và mua thuốc cơ bản, thậm chí tự ý cắt giảm liều lượng khi thấy triệu chứng bệnh giảm. Hoặc, tự tin 
vào sức khỏe có thể tự lướt qua cơn bệnh mà không thực hiện bất cứ điều trị nào khác. Khi thấy cơ thể có những triệu chứng khác lạ, 
đừng chủ quan mà hãy mau chóng “trò chuyện” với cơ thể, đến gặp bác sĩ nhờ tư vấn dù đó chỉ là những dấu hiệu bất thường nhỏ nhất.

  * Chưa có nhật ký sức khỏe
  Người Việt Nam thường không có thói quen theo dõi, ghi nhận tình trạng sức khỏe của cơ thể. Việc ghi nhật ký sức khỏe cũng như 
 tiền sử bệnh của gia đình sẽ giúp bác sĩ dễ dàng xác định bệnh lý cũng như đề xuất chế độ chăm sóc sức khỏe phù hợp với mỗi người.
  Các bệnh lý tiềm ẩn trong cơ thể thường không dễ phát hiện, đến lúc bộc phát ra thì bệnh đã đến giai đoạn nghiêm trọng, cần dùng 
đến thuốc để điều trị. Càng lớn tuổi, cơ thể càng khó thích nghi với các loại thuốc hơn nên việc chú trọng vào tình trạng sức khỏe 
giúp việc ngăn chặn bệnh kịp thời, sớm phát hiện và xác suất điều trị thành công nhiều chứng bệnh nguy hiểm sẽ cao hơn, đảm bảo 
chất lượng cuộc sống. Hãy tập thói quen ghi lại những triệu chứng của cơ thể trong ngày vào nhật ký hoặc dễ dàng nhập thông tin vào 
các ứng dụng chăm sóc sức khỏe trên điện thoại mỗi ngày. Đây là một phương pháp theo dõi tình trạng sức khỏe dễ dàng và rất tiện dụng.

  Thấu hiểu nhu cầu chăm sóc sức khỏe của phụ nữ hiện đại, ứng dụng Pulse by Prudential luôn sẵn sàng đồng hành cùng bạn trong 
3 giai đoạn chăm sóc sức khỏe: 
   - Ngăn ngừa, Trì hoãn, Bảo vệ. Điểm khác biệt của Pulse là khả năng “cá nhân hóa” lời khuyên sức khỏe cho riêng cho mỗi người dùng.
  Khi sử dụng tính năng Kiểm tra sức khỏe của Pulse by Prudential, bạn sẽ hoàn thành bảng khảo sát sức khỏe tổng quát khi trò chuyện
với chatbot được xây dựng trên nền tảng Trí thông minh nhân tạo (AI). Sau khi hoàn tất, bạn sẽ nhận được kết quả Bản song sinh điện tử, 
thể hiện rõ trạng thái của các cơ quan trong cơ thể, xác định các dấu hiệu lão hóa và nhận thêm những đề xuất cho chế độ ăn uống, sinh hoạt, 
tập luyện để cải thiện tình trạng sức khỏe hiện tại.

  Ngoài những buổi thăm khám sức khẻo định kỳ tốn nhiều thời gian và chi phí, bạn có thể Kiểm tra triệu chứng cơ thể ngay trên ứng dụng 
 Pulse by Prudential để theo dõi sức khỏe 24/7. Được xây dựng trên nền tảng kiến thức chuyên môn của Babylon Health – nhà phát triển 
 dịch vụ theo dõi sức khỏe và hỗ trợ y tế trực tuyến tại Anh, Pulse by Prudential sẽ phân tích nguyên nhân gây ra triệu chứng đề xuất 
 xử lý nhanh nếu phát hiện ra các triệu chứng bệnh lý nguy hiểm. Với khả năng cập nhật dữ liệu theo thời gian thực, Pulse sẽ cảnh báo 
 bạn các nguy cơ bệnh lý tiềm ẩn do di truyền hoặc do lối sống, cũng như đề xuất chế độ chăm sóc sức khỏe phù hợp với tình trạng sức khỏe
 riêng biệt của mỗi cá nhân. Tính năng Đo chỉ số khối cơ thể (BMI) và Đo chỉ số nếp nhăn của Pulse phản ánh tình trạng tuổi thật của làn da 
 cũng như giúp chị em hiểu rõ quá trình lão hóa của mình đang ở mức nào.
   Vì một tương lai khỏe mạnh và bền vững, hãy hành động vì sức khỏe ngay hôm nay. Pulse by Prudential luôn đồng hành cùng bạn, giúp bạn 
 chủ động chăm sóc bản thân tốt hơn, chuẩn bị kỹ càng cho mình hành trang hướng về phía trước!
', '2022-02-28'),

(3, N'Khắc phục nỗi ám ảnh mang tên “tóc rụng thành từng mảng”', 'image10.png','image10,2.png',N'
Đối với người trưởng thành, rụng tóc là hiện tượng bình thường của cơ thể khi tóc đến giai đoạn thoái triển và rụng để bắt đầu một chu kỳ mới. Tuy nhiên, tóc rụng quá nhiều sẽ trở thành nỗi ám ảnh cho bạn, gây nên sự căng thẳng, tự ti không nhỏ. Cùng Prudential tìm hiểu về bệnh lý rụng tóc và cách cải thiện tình trạng này.',
N'  Rụng tóc như thế nào gọi là nhiều?

   Bình thường, tóc bạn sẽ trải qua 3 giai đoạn: giai đoạn anagen - hay còn gọi là giai đoạn tăng trưởng, thường kéo dài
 khoảng vài năm; giai đoạn catagen (biến đổi); và giai đoạn telogen (nghỉ ngơi), thường kéo dài 2-3 tháng.
  Ở giai đoạn telogen, tóc bắt đầu thoái triển và rụng để bắt đầu một chu kỳ mới. Vì có giai đoạn telogen, tóc bạn có thể 
 rụng hàng ngày, và đây cũng là hiện tượng bình thường của cơ thể. Theo các chuyên gia, mỗi ngày cơ thể bạn có thể rụng 
 100-150 sợi, và tóc mới sẽ mọc trở lại theo đúng quy luật nên bạn không cần phải quá lo lắng khi nhìn thấy tóc rụng.

  Tuy nhiên, nếu số lượng tóc rụng nhiều hơn mức 100-150 sợi mỗi ngày và không có dấu hiệu mọc trở lại (như da đầu xuất hiện 
 những mảng hói, không thấy tóc con mọc lại, hoặc tóc trở nên mỏng và ít đi) thì có thể bạn đang gặp bệnh lý về tóc và cần 
 được điều trị. 
 
  * Nguyên nhân phổ biến gây rụng tóc

 Để cải thiện bệnh lý rụng tóc, bạn cần lắng nghe cơ thể để tìm ra nguyên nhân gây ra hiện tượng tóc rụng quá nhiều. Dưới đây 
là những nguyên nhân phổ biến:
  - Di truyền
  Nghiên cứu chỉ ra rằng 80% khuynh hướng rụng tóc có nguyên nhân từ di truyền. Thông thường, nam giới bắt đầu nhận thấy chứng 
 rụng tóc do di truyền từ độ tuổi 20-30, còn nữ giới sẽ không bị triệu chứng này cho đến giai đoạn mãn kinh. Song song sự tiến bộ 
 của khoa học, bạn có thể điều trị rụng tóc gây hói đầu do di truyền bằng cách cấy tế bào mầm tóc. Trong trường hợp muốn cải thiện 
 rụng tóc do di truyền, bạn nên đến cơ sở y tế để được các bác sỹ có chuyên môn tư vấn cách điều trị tốt nhất.

  - Áp lực, căng thẳng
 Yếu tố tâm lý là một trong những nguyên nhân thường gặp gây rụng tóc. Hiện tượng rụng tóc do căng thẳng được gọi là telogen
effluvium. Cường độ áp lực lớn làm thay đổi tỷ lệ phần trăm của tóc trong giai đoạn sinh trưởng và chuyển chúng đến thẳng giai 
đoạn ngừng phát triển. Khi đó, tóc bắt đầu rụng nhiều và ít mọc tóc con, thậm chí một số khu vực như đỉnh đầu có thể bị trọc. 
Tin tốt là telogen effluvium không phải lúc nào cũng gây hói đầu vĩnh viễn. Tuy nhiên, vì quá trình này diễn ra âm thầm nên bạn 
thường không nhận ra cho đến khi rụng tóc gây hậu quả nghiêm trọng trong thời gian dài.

  - Thiếu hụt dinh dưỡng
 Vitamin H (Biotin) và vitamin B5 (axit pantothenic) là hai yếu tố không thể thiếu giúp tóc phát triển chắc khỏe. Thực tế cho 
thấy, những người áp dụng chế độ ăn kiêng,ăn chay, hay vừa trải qua một trận ốm nặng,… dễ bị rụng tóc hơn. Do vậy, để cải thiện 
tình trạng rụng tóc, bạn nên bổ sung đầy đủ chất dinh dưỡng, đặc biệt là vitamin,cystein, sắt,… từ thực phẩm sử dụng hàng ngày. 
Ngoài ra, bạn có thể cung cấp thêm dưỡng chất cho tóc bằng viên uống bổ sung vitamin.

  - Một số bệnh tiềm ẩn
 Một số bệnh như tiểu đường, tuyến giáp,… sẽ gây ra hiện tượng rụng tóc. Khi mắc bệnh tiểu đường, mạch máu dễ bị tổn thương do 
lượng đường trong máu tăng cao. Lúc đó, lượng oxy đến các nang tóc bị ức chế, kìm hãm sự phát triển của nang tóc dẫn đến tình 
trạng tóc rụng. Ngoài ra, một trong những nguyên nhân gây rụng tóc phổ biến hơn là bệnh tuyến giáp vì các hormone tuyến giáp 
có tác động trực tiếp đến các nang tóc. Sự mất cân bằng hormone tuyến giáp là nguyên nhân chính gây ra rụng tóc.
  - Các biện pháp cải thiện tóc rụng
  

Để khắc phục tình trạng tóc rụng, bạn có thể tham khảo những gợi ý dưới đây:
 + Bổ sung đầy đủ dinh dưỡng
 + Để có mái tóc chắc khỏe thì không thể bỏ qua việc chăm sóc cơ thể từ bên trong: ăn uống cân đối các chất dinh dưỡng, 
uống đủ nước. Do chứa dồi dào biotin, silicas, vitamin B… nên các loại ngũ cốc, cá hồi, lòng đỏ trứng, xoài, dâu tây,… 
là những thực phẩm rất có lợi cho sự phát triển của tóc.
 + Luyện tập các thói quen lành mạnh
 + Không nên quá lo lắng, căng thẳng: Stress có thể làm tăng nồng độ cortisol, là một trong những “thủ phạm” chính gây 
rụng tóc. Vì thế, hãy cố gắng kiểm soát căng thẳng bằng các bài tập thể dục như yoga, thiền hoặc những hoạt động giải 
trí mà bạn thích.
 + Không gội đầu quá nhiều: Gội đầu quá nhiều sẽ khiến lượng dầu tự nhiên trên da đầu mất đi, khiến cho tóc khô, xơ và 
 rụng nhiều hơn. Theo khuyến cáo của chuyên gia, bạn chỉ nên gội đầu cách ngày, tối đa 3 lần/tuần.
 + Hạn chế hút thuốc và sử dụng chất kích thích: Thuốc lá và chất kích thích làm giảm lượng máu nuôi dưỡng nang tóc của bạn, 
 dẫn đến gián đoạn quá trình sản xuất protein và collagen cho tóc. Do đó, để giữ cho mái tóc óng mượt, bạn nên từ bỏ thói 
 quen hút thuốc và hạn chế rượu bia.
 + Tránh thức khuya: Thức khuya, ngủ không đủ giấc gây tăng sinh các gốc tự do có hại và rối loạn nội tiết tố, làm cản trở 
 nguồn dinh dưỡng đến tóc, khiến tóc yếu và rụng dần. Hãy cố gắng đi ngủ trước 11 giờ tối và ngủ ít nhất 8 tiếng mỗi đêm 
 bạn nhé.
 Rụng tóc hoàn toàn có thể được cải thiện nếu bạn tìm ra nguyên nhân và có phương pháp chăm sóc tóc phù hợp. Hy vọng với 
những gợi ý trên đây, bạn đã hiểu hơn về mái tóc của mình, từ đó xây dựng thói quen chăm sóc tóc hợp lý.','2022-01-24'),

(3,N'Thiếu máu, thiếu sắt ở bà bầu và hệ lụy','image11.png','image11,2.png',N'SKĐS - Khi mang thai, nếu chủ quan và không coi trọng chăm sóc và theo dõi thai kỳ, bà bầu có thể gặp hệ lụy 
là bị thiếu máu, thiếu sắt.',
N' 
I. Vì sao phụ nữ mang thai cần phòng ngừa thiếu máu, thiếu sắt
 Phụ nữ mang thai cần có hiểu biết để phòng ngừa thiếu máu, thiếu sắt giúp cho thai nhi khỏe mạnh.

 * NỘI DUNG:
 1. Vì sao phụ nữ mang thai cần phòng ngừa thiếu máu, thiếu sắt
 2. Nguyên nhân thiếu máu, thiếu sắt khi mang thai
 3. Dấu hiệu khi bị thiếu máu, thiếu sắt khi mang thai
 4. Hệ lụy của việc phụ nữ mang thai thiếu máu, thiếu sắt
 Đối với bà bầu, nhu cầu các chất dinh dưỡng tăng cao nhằm đáp ứng cho sự phát triển của bào thai, nhau thai và tăng khối lượng 
hồng cầu ở mẹ.
 Sắt tham gia vào quá trình tạo ra huyết sắc tố Hemoglobin - sắc tố trong tế bào hồng cầu có vai trò vận chuyển oxy đến tất cả 
các mô và cơ quan trong cơ thể. Ở phụ nữ có thai, bổ sung sắt là để tạo thêm máu cho cả mẹ và thai nhi. Lúc này, sắt là yếu tố 
cần thiết để đảm bảo quá trình vận chuyển oxy từ phổi đến các phần còn lại của cơ thể và chuyển qua nhau thai đến em bé.
Trong quá trình mang thai, tim của người mẹ phải hoạt động nhiều hơn bình thường để cung cấp máu nuôi dưỡng thai nhi. Kéo theo 
đó là thể tích máu cũng tăng 30 – 50% so với bình thường. Sự tăng thể tích máu này đòi hỏi cơ thể phải được nạp thêm lượng sắt 
và acid folic để tạo ra nhiều máu hơn cung cấp cho nhu cầu của cơ thể. Nếu không cung cấp đủ sắt, lượng huyết sắc tố cũng giảm 
theo. Điều này có thể làm giảm việc cung cấp oxy cho các tế bào và các cơ quan, từ đó có thể gây ra nhiều vấn đề cho sức khỏe 
của mẹ và thai nhi.

II. Nguyên nhân thiếu máu, thiếu sắt khi mang thai
 Khi mang thai bà bầu bị nghén, mệt mỏi cũng dẫn đến tình trạng thiếu máu. Nguyên nhân chủ yếu là do ăn uống hằng ngày không 
cung cấp đủ nhu cầu. Thiếu máu khi mang thai xảy ra nhiều với thai phụ ở vùng nông thôn, vùng miền núi do điều kiện kinh tế
còn khó khăn.
 Phụ nữ bị suy dinh dưỡng trước khi mang thai cũng gây thiếu máu khi mang thai nhiều hơn.

III. Dấu hiệu khi bị thiếu máu, thiếu sắt khi mang thai
 Bệnh nhân bị thiếu máu thiếu sắt khi xét nghiệm máu thấy hemoglobin (Hb) dưới 10,5g/dl, serum ferritin dưới 30g/dl, độ bão 
hòa transferrin dưới 20%. Bà bầu nên đi thăm 
 khám bác sĩ chuyên khoa sản để kịp thời bổ sung thuốc, điều chỉnh chế độ ăn uống khi có các dấu hiệu sau:
   -Hay mệt mỏi, đau đầu, chóng mặt.
   -Cảm giác tim đập nhanh hơn bình thường mặc dù không gắng sức.
   -Tóc bị rụng không nguyên nhân. Móng tay chân nhợt nhạt dễ bong, gãy.
   -Da nhợt nhạt hoặc vàng.
   -Khó thở.
   -Hay bồn chồn, hồi hộp.
   -Thèm ăn những đồ lạ mà trước đây không ăn.

IV. Hệ lụy của việc phụ nữ mang thai thiếu máu, thiếu sắt
 Như đã cảnh báo, thai phụ thiếu máu thiếu sắt nếu không được điều trị, bổ sung kịp thời thì ảnh hưởng rất lớn tới sức khỏe 
 cả mẹ và con. Với bà bầu sẽ bị sảy thai, bong nhau, tăng huyết áp thai kỳ, tiểu đường thai kỳ , tiền sản giật, băng huyết…
 khi thiếu máu, thiếu sắt.
 
 * Cảnh báo các triệu chứng thiếu sắt
   Cách ngừa thiếu máu do thiếu sắt ở trẻ
   Với thai nhi, trẻ sinh ra sẽ bị nhẹ cân, yếu. Thai nhi sinh non tháng. Khi điều trị bệnh thì bị kéo dài thời gian, dễ mắc 
  bệnh hơn so với trẻ mà mẹ không bị thiếu máu, thiếu sắt. Trẻ sơ sinh thiếu máu do thiếu sắt có thể gây ra ảnh hưởng đến
  trí não, làm suy giảm khả năng học tập của trẻ sau này. Con của những bà bầu bị thiếu máu giai đoạn sớm thai kỳ có nguy cơ 
  bệnh tim mạch cao hơn trẻ khác khi đến tuổi trưởng thành.

V. Phòng ngừa thiếu máu, thiếu sắt
Để hạn chế thiếu máu, thiếu sắt ở bà bầu, không có giải pháp nào tối ưu hơn là phải đáp ứng đủ nhu cầu nặng lượng, các chất
dinh dưỡng và chú trọng vào bữa ăn hằng ngày trong suốt  thai kỳ. Để hạn chế thiếu máu, thiếu sắt ở bà bầu, không có giải pháp 
nào tối ưu hơn là phải đáp ứng đủ nhu cầu nặng lượng, các chất dinh dưỡng và chú trọng vào bữa ăn hằng ngày trong suốt  thai kỳ.','2022-01-09'),

(4,N'5 cách xử lý chồng ngoại tình khôn ngoan phụ nữ nên học tập','image12.png','image11,2.png',N'Đàn bà sau khi bị chồng phản bội thường hay đau khổ và dằn vặt bản thân, mà quên đi rằng trong cuộc tình này, mình mới là người đáng được trân trọng.',
N' Vì thế phụ nữ thay vì ghen tuông thì hãy yêu thương bản thân nhiều hơn và dung thứ cho những người đã làm tổn thương mình 
trong đó có cả “con giáp thứ 13”.
  Vấn đề ngoại tình không phải chỉ liên quan đến một người mà là vấn đề của tất cả những người trong cuộc. Là một người phụ nữ 
 khôn khéo, bạn cần biết mình nên đối xử với mỗi người liên quan như chồng mình và người thứ 3 như thế nào cho đúng đắn là một 
 việc không hề đơn giản.

  Theo chuyên gia tâm lý Vera Hà Anh, sau khi phát hiện chồng ngoại tình, một người phụ nữ khôn ngoan thường có những cách 
 ứng xử như sau:
   1. Bình tĩnh
  Bản thân bạn có lẽ rất đau khổ khi rơi vào tình huống này, bởi bạn rất yêu chồng và gia đình nhỏ của mình. Sự ghen tuông và 
 tính sở hữu không cho phép để người phụ nữ khác cướp mất chồng mình.
  Nhưng trong tình huống này, sự giận dữ chẳng giải quyết được gì. Bản thân bạn cần hơn hết là một sự yên tĩnh để suy xét 
 bản thân và cũng là để làm dịu sự đau đơn tổn thương trong mình. Khi ấy mới có thể bình tĩnh, suy nghĩ nến làm gì tiếp theo.

   2. Nói chuyện thẳng thắn
 Thay vì đánh ghen hay chửi bới, bạn hãy thể hiện mình là người đáng được trân trọng bởi hành động này. Không cần phải tỏ ra 
 mình là “người chiếu trên”, bởi bạn thật sự là như vậy.
Với chồng và với cả người phụ nữ thứ 3, bạn đều nên đối mặt thẳng thắn. Để dành được hạnh phúc cho riêng mình, chị em cần biết 
nói gì và không nên nói gì để bản thân người trong cuộc tự động buông bỏ mối quan hệ đáng xấu hổ này.
  Để phòng trường hợp xấu có thể xảy ra hậu ngoại tình, ví dụ như chàng để lại con rơi bên ngoài, hay mắc bệnh lây nhiễm do 
 quan hệ tình dục, bạn cũng có quyền đưa ra yêu cầu kiểm tra sức khỏe.
  Một người đàn ông đã cố ý ngoại tình thì họ đã không cần để tâm đến thể diện, vì vậy đừng vì sợ chồng mất mặt mà hãy quan tâm 
đến sức khỏe của mình.

   3. Đừng để chuyện gia đình ảnh hưởng đến con cái
 Đối với tụi nhỏ, tốt hơn hết hãy để chúng tránh xa những chuyện xích mích vợ chồng này. Chẳng ai muốn nhìn thấy bố mẹ mình cãi 
nhau cả và càng đáng sợ hơn khi sự việc này có thể khiến chúng phải sống rời xa bố hoặc mẹ của mình. Chị em hãy giải quyết mọi 
chuyện thật yên lặng và bình tĩnh.

   4. Tha thứ khi chồng quay lại
Một vấn đề của hậu ngoại tình đó là ứng xử thế nào khi chồng chấm dứt mối quan hệ với người thứ 3 và quay về với vợ? Câu hỏi 
đầu tiên đối với chị em là "Nên tha thứ hay không thể tha thứ?"
 Câu trả lời là: Nên tha thứ cho chàng. Bởi vì dù cho chồng có khiến các nàng đau khổ như thế nào, bản thân họ và cả người 
thứ ba cũng đã phải chịu một phần tổn thương khi sự việc vỡ lở. Và, sẽ như thế nào khi những đứa trẻ của bạn phải chịu sự 
tổn thương tinh thần vì bố mẹ ly hôn?
 Cho chàng một lời tha thứ, cũng giống như đang cho bản thân một cơ hội một lần nữa sống vui vẻ hạnh phúc. Nếu anh ta tái 
phạm hành vi này lần nữa, tức là chàng đã không biết trân trọng vợ mình, thì khi đó dứt áo ra đi cũng chưa muộn.

   5. Yêu thương bản thân nhiều hơn và dung thứ cho kẻ thứ 3
  Đối với bản thân: Đàn bà sau khi bị chồng phản bội thường hay đau khổ và dẵn vặt bản thân, mà quên đi rằng trong cuộc tình này, 
mình mới là người đáng được trân trọng. Nếu chồng đã một lần phụ bạc không biết yêu thương người vợ bên cạnh mình, hà cớ gì chị 
em cũng đối xử với bản thân mình như vậy. Vì vậy hãy yêu thương mình nhiều hơn, tự chăm sóc bản thân và cho phép bản thân mình 
làm những điều mình mong muốn.
  Đối với đàn ông: Bạn tha thứ cho chàng không có nghĩa rằng chàng không phải nhận bất kỳ hình phạt nào. Mà hình phạt bạn dành 
 cho chồng mình lại không thể mang ý nghĩa tiêu cực và bạo lực, điều đó chỉ càng đẩy hạnh phúc của mình đi xa hơn mà thôi.
  Hãy nghiêm khắc với chàng, cho chàng tự nhận thấy lỗi lầm của mình. Và khiến bản thân mình hấp dẫn hơn trong mắt chồng. 
  Các nàng có thể làm được chứ?
  Dung thứ cho người thứ ba: Bản thân người phụ nữ ấy cũng là người chịu tổn thương. Nếu cô ta chỉ là người qua đường lợi dụng
chồng bạn để thỏa mãn nhu cầu của bản thân, thì cô ấy kỳ thực chẳng phải là điều gì ghê gớm để so sánh với bạn cả, chàng nhất 
định dù có ham muốn của ngon vật lạ vẫn sẽ về với gia đình mà thôi. Còn nếu cô ấy thật sự dành tình yêu cho chồng bạn, thì trong 
cuộc tình này cô ấy thật đáng thương vì vừa là người thua cuộc, vừa mất đi tình yêu của mình, đã vậy còn mang danh tiếng xấu mà 
chẳng ai muốn có. Dung thứ cho người thứ ba là cách mà bạn khẳng định sự khoan dung và sự cao thượng của mình dành cho chồng.
','2021-09-01')

INSERT [dbo].[News] ( [CategoryID], [Title], [ImageF], [ImageC], [NewsDescription], [NewsContent], [DateCreated]) VALUES 
(4,N'Bài chia sẻ: Cả nhà tôi á khẩu vì "quái chiêu" dằn mặt chồng khi giận dỗi của chị dâu','image13.png','image13,2.png',N'Tôi và bố mẹ đều ngã ngửa trước sự thản nhiên của chị dâu. Còn anh trai tôi thì chỉ thở dài như chấp nhận.
',
N'  Anh trai và chị dâu tôi yêu nhau gần ba năm mới cưới, chị ấy là con nhà gia giáo, tuy không có điều kiện như nhà tôi nhưng chị 
sống rất thoáng với mọi người. Hơn nữa, chị lại hiền lành, nhẫn nhịn, đảm đang. Chính người khó tính như mẹ tôi còn phải khen chị 
ấy là mẫu người của gia đình. Bố mẹ nhiều khi còn nói mong tôi được một phần như chị để khi về nhà chồng chẳng bị người ta chê 
trách, hay có điều tiếng gì.
  Dù ở riêng nhà nhưng mỗi khi nhà tôi có giỗ, đám tiệc, chị dâu đều về, xông xáo lo toan sớm nhất. Có khi còn xin nghỉ việc để lo 
cho nhà chồng nữa. Tính chị dâu cũng cởi mở, dễ gần, thu nhập khá cao, rất “thoáng” với họ hàng nên ai cũng hết lời khen ngợi. Nói 
chung nhắc tới chị dâu, ai cũng khen chứ chẳng ai tìm ra một điểm nào để chê trách. Còn tôi là người trong nhà nên biết chị có một 
đặc tính mà ai cũng phải nể và sợ.

  Tính chị dâu luôn nhẫn nhịn chồng nhưng lại để bụng những chuyện nhỏ nhặt mà không bao giờ nói ra. Vì thế cứ vài tháng anh chị lại 
  cãi nhau một trận. Mỗi lần vợ chồng giận nhau, chị ấy sẵn sàng tiêu đến đồng tiền cuối cùng, thậm chí vay nợ để xả stress. 
  Nhớ cách đây 5 năm, khi đó anh chị mới cưới được vài tháng, chẳng hiểu vì lý do gì anh trai một mình về nhà với bố mẹ. Đến khi bố mẹ 
  tôi gọi điện cho chị thì chị nói anh chị giận nhau, chị đang đi du lịch cho khuây khỏa.
  Sau đó khoảng nửa tháng thì chị dâu về, xin lỗi anh trai nên vợ chồng làm lành. Nhưng đồng thời, chị thú thực đã mang hết số tiền mừng 
cưới và tiết kiệm sau đám cưới của hai vợ chồng để đi du lịch. Vì bố mẹ tôi suy nghĩ khá thoáng nên chỉ khuyên vợ chồng nên nhường nhịn 
nhau, làm việc gì cũng nên nghĩ kỹ.
  Tưởng sau lần đó, chị dâu tôi hối cải, tu chí làm ăn và không giận dỗi kiểu “tiêu tiền” dằn mặt chồng như vậy nữa.
  Nhưng chẳng lâu sau lại có lần thứ hai. Đó là khi chị dâu đang mang bầu 6 tháng. Không hiểu sao từ lúc có bầu chị khó chịu kinh khủng. 
  Anh chị cãi nhau thường xuyên và lần nào buồn chán chị cũng đi mua sắm, du lịch. Sợ ảnh hưởng đến con nên anh trai tôi vẫn phải nhịn vợ 
  hết mức có thể. Chị giận chồng nhiều đến độ, khi trở dạ vào viện đẻ, tài khoản của anh chị chẳng còn xu nào. Phải dùng đến tiền ông bà 
  hai bên cho cháu bé mới trả được viện phí.
  Cũng còn vài vụ nữa nhưng không căng thẳng như lần này. Chẳng là anh chị ấy đang cãi nhau chuyện chọn trường học cho con. Chị thì muốn cho 
cháu học trường quốc tế, học phí lên cả chục triệu một kỳ, còn anh thì muốn cho cháu học trường tư thục gần nhà, đưa đón cũng tiện. Trong 
lúc tức giận, anh trai có nói chị dâu bằng những từ như sĩ diện, thích hoành tráng, hoang phí…
Cãi nhau rồi anh tôi bực tức bỏ đi làm, chị dâu cũng bực mang cháu sang gửi bố mẹ tôi rồi đi đâu đó. Dù ai gọi điện chị cũng không nghe máy. 
  Bẵng đi 5-6 hôm, chị dâu về sang nhà tôi đón anh trai và cháu về còn mang sang bao nhiêu là đồ đạc, quà cáp toàn những thứ đắt tiền cho mọi 
người. Chị nói mới đi du lịch cho khuây khỏa. Như hiểu được tính vợ, anh trai tôi hỏi tiền ở đâu mà chị mua nhiều đồ vậy. Chẳng ngại ngùng, 
chị ấy nói “Bực quá em tiêu hết tiền trong thẻ tín dụng của nhà mình rồi. Vì đi nước ngoài nên hơi tốn kém, em phải vay thêm cái Mai (bạn của 
anh chị) 30 triệu nữa đấy”.
  Tôi và bố mẹ đều ngã ngửa trước sự thản nhiên của chị dâu. Còn anh trai tôi thì chỉ thở dài như chấp nhận. Bất bình trước thái độ của chị dâu 
và sự nhu nhược của anh trai, bố mẹ tôi có chỉ trích về cách tiêu hoang phí của chị thì chị nói: “Tiền để chăm lo cho con cái và những nhu 
cầu của mình, của người thân. Số tiền đáng lẽ để giành cho cháu học trường quốc tế nhưng mọi người phản đối thì con mang dùng vào việc có ý 
nghĩa khác. Con đi chơi cho khuây khỏa, mua quà cáp cho mọi người đó cũng là việc có nghĩa mà”.
  Anh trai tôi thấy không khí căng thẳng thì nói: “Không sao cả, lần sau vợ con rút kinh nghiệm, mong bố mẹ bỏ qua. Thôi thì cô ấy tiêu hết 
tiền, lại nợ thêm cả trăm triệu như thế thì từ giờ cháu cũng được học gần nhà rồi”. Bố mẹ tôi thì như chẳng còn gì để nói nên chỉ thở dài 
ngán ngẩm.
  Còn tôi, cũng là phụ nữ, một phần tôi hiểu chị cũng có những bực bội, phiền lòng cần giải tỏa. Tôi cũng biết, dù nợ nần thì anh chị cũng 
tự lo trả chứ không phiền đến bố mẹ hay tôi trả giúp. Nhưng có người phụ nữ nào giận chồng mà tiêu bằng hết số tiền tích cóp của gia đình,
thậm chí vay nợ để giải tỏa bực tức không? Chị dâu tôi cái gì cũng được ngoại trừ cái "quái chiêu" này mọi người ạ. Tôi phải khuyên như thế 
nào để anh trai quyết đoán hơn, để chị dâu thôi cái tính này đây mọi người?
','2021-12-23'),

(4,N'Lần đầu ra mắt có cần rửa bát? Việc tuy nhỏ nhưng lại giúp nhiều cô gái nhận ra đối phương xứng đáng để trao thân gửi phận hay không','image14.png','image14,2.png',N'Ra mắt nhà trai cũng là cơ hội bạn đánh giá người đàn ông này có xứng đáng để kết hôn hay không, chứ không phải đến cầu xin anh ta cưới, càng không phải cầu xin người nhà anh ta cưới mình. Thế nên, nhất định phải biết "giữ giá" bản thân.
',
N' 
  Mấy ngày gần đây, trên mạng xã hội đang xôn xao câu chuyện thế này. Cô gái lần đầu về ra mắt nhà người yêu bị mọi người sai 
đi rửa 8 mâm bát.
  Cuộc hội thoại ngăn ngắn diễn ra như sau:
- Em ơi, tí xong thì em rửa bát giúp anh nhé.
- Anh điên à, 8 mâm rửa kiểu gì, 1 mình em rửa à?
- Không, có 2 cô rửa cùng.
- Vâng. Chả hiểu sao là khách đến chơi mà phải rửa mâm.
- Khách đâu mà khách, coi như là người nhà mới vậy chứ.
  Và cuối cùng, cô gái quạu quạu không hài lòng nhưng chẳng cãi nữa, coi như là chấp nhận việc cùng 2 cô họ đi rửa bát. Nhưng sau đó, 
  anh chàng phát hiện ra 2 cô thì cặm cụi làm, còn bạn gái thì lại hí hoáy ngồi bấm điện thoại.
  Hỏi ra mới hay cô nàng tinh ranh đã thuê cô họ rửa bát cho với giá 300k. Đương nhiên, anh chàng này cáu kỉnh, nạt nộ bạn gái: "Em đừng 
tưởng mọi việc có thể giải quyết được bằng tiền."
  Cái kết là cô nàng bắt xe về thẳng, chàng trai cũng bực mình chẳng thèm dỗ. Không rõ sau đó cặp đôi thế nào, chứ tính tới thời điểm câu 
chuyện được chàng trai chia sẻ lên MXH thì họ vẫn chưa nói chuyện lại với nhau.
Việc rửa bát hay không rửa bát trong lần đầu ra mắt gia đình đối phương vẫn luôn là câu chuyện khiến dân mạng tranh cãi không ngớt. Rất 
nhiều người cho rằng, mình chưa được cưới hỏi về thì vẫn là khách, không cần nấu nướng, dọn dẹp gì hết. Trong khi đó, một số lại nhận định, 
trước sau gì cũng là người một nhà, rửa vài cái bát không nặng nhọc gì. Chưa kể, gia đình người ta thết đãi mình một bữa thịnh soạn rồi, 
giờ mình dọn dẹp cho phải phép chứ.

  Quả thật, việc rửa bát chẳng nặng nhọc gì, thậm chí rất đơn giản, nhưng qua đó lại giúp các chị em biết được nhiều điều về quan điểm, 
thái độ của bạn trai và gia đình anh ấy.
  
  1.Rửa bát hay không rửa cũng nói lên nhiều điều, giống như nhận lì xì vậy!
  Ngày Tết, người họ hàng móc bao lì xì ra nhét vào túi bạn, bạn từ chối "thôi cháu lớn rồi", bác lại nhét tiếp. Cuối cùng bạn đành 
 "miễn cưỡng" nhận trong sự vui vẻ. Đây mới là quy trình bình thường.
  Tiền lì xì tới tay, bạn cảm ơn và nhét thẳng luôn vào túi, điều này chứng tỏ bạn không hiểu chuyện.
  Bạn từ chối một câu, bác rút phắt lại và nhét vào túi mình, đây là người lớn không hiểu chuyện.
  Năm mới đến, vừa bước vào cửa, bác họ nói thẳng năm nay không có tiền lì xì nha con ơi (bạn vẫn còn trẻ trung phơi phới, chưa kiếm 
  được tiền và đang nhận học bổng u-ta-chi), này gọi là cực kỳ không hiểu chuyện luôn.
 Có thể nói, với việc nhận lì xì bạn thật lòng muốn nhưng "nghiện phải tỏ ra ngại". Cũng tương tự như vấn đề rửa chén bát trong lần đầu 
ra mắt. Dù bạn không muốn, nhưng cũng phải chủ động để thể hiện thành ý.
 Bạn chủ động đi rửa bát, phụ huynh đối phương khước từ. Sau vài lần đưa đẩy, bạn trai bạn cùng bạn xem TV, bố mẹ người yêu rửa bát hoặc 
bố mẹ người yêu cùng bạn xem TV, còn anh người yêu đi rửa bát. Đây gọi là quy trình bình thường.
  Phụ huynh không thể lay chuyển được bạn, nhưng anh người yêu rửa bát chung với bạn, đây là bạn không hiểu chuyện rồi, nhưng phụ huynh vẫn 
hỗ trợ diễn tròn vai.
  Bạn chủ động đi rửa bát, phụ huynh người yêu đồng ý cái rụp, nhưng cũng để bạn trai phụ bạn rửa bát, trường hợp này phụ huynh không tinh 
tế, nhưng người yêu bạn hiểu chuyện.
  Phụ huynh đối phương thẳng thừng nhờ bạn rửa bát, rõ ràng họ cực kỳ không hiểu chuyện.

 Nào, phân tích tiếp nhé.
  - Trường hợp 1: Bạn trai cùng phụ bạn rửa bát, sau này kết hôn nếu như không nhất thiết phải sống chung với bố mẹ chồng thì vẫn ổn. 
  - Trường hợp 2: Nếu bạn phải tự một mình lụi cụi đi rửa bát, còn gia đình bạn trai ngồi thảnh thơi nghỉ ngơi, ăn hoa quả thì nhìn 
  dưới đất kìa, não của bạn đó!!! Quay xe ngay còn kịp.
Tương tự, các chàng trai lần đầu tiên đến nhà vợ thấy bố mẹ vợ bận tới bận lui, người nhà bên vợ chăm trà rót nước hỏi han ân cần, 
chuẩn bị cả một bàn cỗ ngon là chuyện thường ở huyện. Còn nguyên một nhà ngồi vắt chân xem vô tuyến, cắn hạt dưa, ngó bạn bận bù đầu 
bù cổ, toát mồ hôi hột thịt gà, làm vịt, thì "sự thật mất lòng" là cuộc hôn nhân này không cần thiết nữa đâu!
Các cô gái ơi, có thể phụ huynh nhà trai còn đắn đo, lo nghĩ hơn cả các con nữa đó!
Con trai đưa bạn gái đến nhà, sau khi ăn cơm xong con bé tỏ ý muốn rửa bát, tôi biết con bé chỉ là đang lễ phép khách sáo mà thôi. 
Tất nhiên không thể nào để con gái nhà người ta rửa bát được, lần đầu tiên đường sá xa xôi đến làm khách, không có lý gì lại để cho 
khách phụ việc nhà được.
Trong nhà tôi đã chuẩn bị sẵn rất nhiều trái cây, sau bữa cơm, tôi lấy máy ép trái cây cho hai đứa nhỏ tự ép lấy nước uống, hai đứa 
phân công, hiệp lực rất ăn ý.
Sau đó, ông xã nhỏ trách tôi không nên bắt con gái nhà người ta làm việc nhà. Tôi ngẫm nghĩ một hồi vẫn không nghĩ ra là tôi đã bắt 
con bé làm việc nhà gì, ông ấy mới nói là tôi bắt con bé ép nước trái cây đó!
Kỳ thực là tôi sợ con bé lần đầu tiên đến nhà chơi hãy còn xa lạ, chưa kịp thích ứng, chúng tôi là trưởng bối cũng không thể cứ huyên 
thuyên không ngừng nói chuyện với con bé, nói sai câu nào là phiền phức liền.
Cũng sợ con bé thấy phiền, nên tôi để cho hai đứa nhỏ cùng nhau ép nước trái cây, cùng nhau làm chút việc, hai đứa nói qua nói lại rất 
là hài hòa, chúng tôi cũng không dám chen lời. Tôi quả thật không muốn bắt con bé làm việc nhà gì cả, nước ép ép ra cũng để bọn nhỏ uống 
thôi mà.
Cho nên, làm ba mẹ chồng người ta cũng có thấp thỏm riêng, chẳng thể nói quá nhiều, cũng chẳng thể không nói, nói dài thành ra nói dại, 
nói ít thì lại có vẻ không nhiệt tình, lạnh lùng.
Con dâu nhà người ta ơi hãy rộng lượng một chút với những "người già" như chúng tôi nhé! Chúng tôi cũng đang học cách làm sao có thể 
khiến con cái cũng vui lòng. Có chuyện gì bản thân chúng tôi không ý thức được làm không đúng có thể khiến tụi nhỏ vạch lá tìm sâu, 
nhưng rất nhiều người trong chúng tôi hoàn toàn không cố ý làm khó con dâu lần đầu tiên bước vào cửa.
Dù sao thì hy vọng con cái của mình được hạnh phúc là mong ước của hầu hết người làm bố làm mẹ, làm khó con gái nhà người ta, thì hai 
đứa nhỏ sẽ nảy sinh mâu thuẫn, thì có hại chứ chẳng lợi lộc gì cho bản thân chúng tôi đâu.
Vì vậy các con gái sắp sửa ra mắt nhà bạn trai ơi các con đừng quá băn khoăn lo lắng quá nhiều, vì thật ra có thể phụ huynh nhà trai còn 
đắn đo lo nghĩ hơn cả các con nữa.
Đến ra mắt là để đánh giá người đàn ông này có xứng đáng để kết hôn hay không, chứ không phải đến cầu xin anh ta cưới mình
Ba mẹ tôi dặn kỹ tôi rằng, lần đầu tiên đến nhà trai, phải biết quan sát. Một là quan sát trạng thái của bạn trai khi ở nhà ảnh, nhất là 
thái độ của ảnh khi người nhà ảnh đối diện với tôi; hai là quan sát thái độ của phụ huynh ảnh; ba là quan sát thái độ của những người 
thân khác có thể xuất hiện ở nhà ảnh; thứ tư là quan sát nếp sinh hoạt của ba mẹ ảnh.
Và còn dặn tôi phải đặc biệt chú ý đến hai điểm. Thứ nhất là bất luận đối phương có nhiệt tình đến thế nào, chuẩn bị chu đáo đến như 
thế nào, không được phép ngủ lại nhà đối phương, nhất định phải về khách sạn ở; thứ hai, không cần tranh làm việc nhà, phải biết "giữ 
giá" bản thân một chút. Nếu như ba mẹ bạn trai để bạn làm, thì bạn nhắc khéo bạn trai làm, nhất định không được để bản thân bị ăn hiếp.
Chắc chắn sẽ có người hỏi rằng tôi không chủ động hòa nhập như vậy: "Rốt cuộc là có tính toán gì? Chẳng nhẽ là chưa kết hôn đã muốn ly hôn?"
Tôi xin bổ sung thêm một quan điểm riêng của bản thân: Con gái lần đầu tiên đến nhà bạn trai, thực chất là phải làm rõ bản thân muốn gì?
Lần đầu tiên đến nhà bạn trai là để đưa ra quyết định chính xác hơn rằng liệu bản thân đã chắc chắn muốn ký vào giấy kết hôn với người 
đàn ông này không?
Tôi muốn tìm hiểu rõ ảnh hưởng của hoàn cảnh gia đình lên anh ấy; quan sát anh ấy có thể độc lập, tự chủ hay không; quan sát mức độ ảnh 
hưởng của gia đình nơi sinh ra anh ấy đối với gia đình riêng trong tương lai của chúng tôi.
Tôi đến là đến để đánh giá người đàn ông này có xứng đáng để kết hôn hay không, chứ không phải đến cầu xin anh ta cưới mình, chứ đừng nói 
đến cầu xin người nhà anh ta cưới.
Tôi nói phải biết coi trọng và giữ giá bản thân chính là như vậy. Là người đàn ông này muốn cưới tôi, dẫn tôi về nhà anh ấy chơi chứ không 
phải dẫn tôi về để rửa chén. Chén bát nhà anh, anh không biết tự rửa à?
Nói theo lời của bố mẹ tôi là đứa con gái như tôi ở nhà bố mẹ nuôi hơn 20 năm, chưa từng để nó đụng tay vào việc nhà. Đến nhà anh làm khách 
lại bắt tôi rửa chén bát cho cả nhà anh? Thậm chí là quét tước nhà cửa? Để bố mẹ tôi biết thì họ sẽ nghĩ như thế nào? Tay anh có vấn đề sao? 
Nhà anh cần tìm người giúp việc hả? Tại sao anh mời con gái chúng tôi đến nhà anh chơi bộ trong lòng không biết nghĩ hả?
Người đàn ông này ở nhà bố mẹ anh ta có tiếng nói hay không, có chủ kiến riêng hay không, có tôn trọng bạn hay không, những chuyện đều có 
thể trực tiếp nhìn thấy được. Thái độ của ba mẹ và người nhà anh ấy đối với bạn chính là phản ánh trực tiếp thái độ của họ bình thường lúc 
anh ấy nhắc đến bạn khi ở nhà. Hoàn cảnh sinh hoạt thường ngày của ba mẹ anh ấy có thể nói lên thói quen sinh hoạt của một gia đình.
Kết hôn là chuyện của hai gia đình, nhất là sau này khi có con, có nhà riêng, hai gia đình ban đầu, sẽ va chạm nhiều hơn khi sinh sống cùng 
nhau. Nhất là những lúc như thế này cần quan sát hai người có thể đảm đương trách nhiệm được hay không, nữ giới hay nam giới đều phải tự 
gánh vác trách nhiệm.
Nếu như người đàn ông này không có tiếng nói gì ngay cả trước mặt ba mẹ ruột của anh ấy, cũng không có chủ kiến riêng, không biết đứng ra 
bảo vệ bạn, thậm chí ba mẹ của anh ta còn xem thường bạn, vậy con đường sau này ắt sẽ vô cũng khó đi. Nếu như người phụ nữ này không có chủ 
kiến riêng ngay cả trước mặt ba mẹ ruột của cô ấy, không bảo vệ được gia đình của mình, ngay cả tính cách của bản thân cũng hoàn toàn không 
thể tiết chế nổi vậy thì cuộc sống sau này sẽ rất là đáng sợ.
Về phần anh ấy nhận định việc người phụ nữ như tôi có hợp để kết hôn hay không, thì trước khi anh ấy đưa tôi về nhà, khi anh ấy cầu hôn tôi, 
khi anh ấy gặp mặt bố mẹ tôi, chắc hẳn bản thân anh ấy đã có quyết định rồi.
','2022-02-04');

INSERT [dbo].[News] ( [CategoryID], [Title], [ImageF],[ImageC], [NewsDescription], [NewsContent], [DateCreated]) VALUES 
(5,N'TOP 9 kem dưỡng trắng da mặt tốt nhất, da sáng hồng bật tone','image15.png','image15,2.png',N'Kem dưỡng trắng da mặt là sản phẩm giúp cải thiện làn da xỉn màu, thâm nám, nhiều mụn,… Để lựa chọn sản phẩm phù hợp cho thói quen chăm sóc da của mình, bạn có thể tham khảo top 8 loại kem này. làm trắng da mặt tốt nhất trong bài viết sau đây.',
N'
Nguyên tắc chọn kem dưỡng trắng da mặt phù hợp
Kem dưỡng là sản phẩm quen thuộc trong quy trình chăm sóc da bên cạnh sữa rửa mặt, toner và kem chống nắng. Tác dụng chính của kem 
là cung cấp độ ẩm cần thiết giúp làm dịu và phục hồi các tế bào da cũ. Bên cạnh đó, các dưỡng chất có trong sản phẩm còn tạo lớp màng 
chắn bảo vệ da khỏi các tác động từ môi trường.

Hiện nay, ngoài các loại kem dưỡng cơ bản, nhiều thương hiệu mỹ phẩm đã nghiên cứu và phát triển thêm các sản phẩm tích hợp nhiều 
công dụng như dưỡng ẩm, làm mờ vết thâm, giảm thâm, dưỡng trắng, kiềm dầu. , chống lão hóa,… Đối với phụ nữ Á Đông, làn da trắng sáng 
được coi là tiêu chuẩn vẻ đẹp bên cạnh những đường nét hài hòa, cân đối. Đó là lý do tại sao các loại kem làm trắng da mặt rất được 
ưa chuộng trên thị trường.

 Một vấn đề thường gặp ở các chị em là lựa chọn sản phẩm theo cảm tính, dẫn đến sử dụng sản phẩm không phù hợp, da mặt không cải thiện, 
thậm chí còn bị kích ứng và tắc nghẽn lỗ chân lông. 
 Để chọn được loại kem dưỡng trắng da mặt phù hợp, bạn cần tuân thủ những nguyên tắc sau:
Chọn sản phẩm của các thương hiệu uy tín: Quy tắc khi chọn kem dưỡng da mặt là chọn sản phẩm của các thương hiệu uy tín. Tránh sử dụng 
hàng giả, hàng nhái, kem trộn không rõ nguồn gốc. Hầu hết các sản phẩm này đều có chứa corticoid giúp da trắng sáng nhanh chóng nhưng 
đi kèm với đó là nhiều hệ lụy như da mỏng, teo, giãn mao mạch,… Sau một thời gian, hệ miễn dịch của da bị suy giảm mạnh, khiến vi khuẩn 
P. acnes bùng phát trên diện rộng. mụn viêm.
Chú ý đến danh sách thành phần của sản phẩm:  Có rất nhiều hoạt chất có tác dụng làm trắng da, mờ vết thâm, nám hiệu quả. Tuy nhiên, 
hiệu quả và mức độ kích ứng của các hoạt chất này khác nhau. Nếu bạn có làn da nhạy cảm, bạn nên sử dụng các sản phẩm chứa tinh chất làm 
trắng da tự nhiên như cam, quýt, lựu đỏ hoặc Niacinamide (vitamin B3). Trong trường hợp da khỏe hơn, có thể sử dụng các dẫn xuất của 
vitamin C, AHA, Azelaic acid, Retinol, Tretinoin, v.v.
Chọn kem có kết cấu phù hợp :  Có nhiều loại kem có kết cấu khác nhau. Đặc biệt, gel và kem sữa có khả năng thẩm thấu tốt nhất. Nếu bạn 
có làn da dầu, bạn nên chọn sản phẩm có kết cấu này để tránh gây bít lỗ chân lông. Đối với những người có làn da khô và bong tróc, nên 
sử dụng loại kem có kết cấu đặc hơn để dưỡng ẩm và làm mềm da.
Sản phẩm có mức giá hợp lý “túi tiền”: Các loại kem làm trắng da hầu như không có tác dụng tức thì mà cần sử dụng lâu dài (khoảng 3-6 tháng). 
Vì vậy, việc lựa chọn sản phẩm phù hợp với khả năng tài chính là vô cùng quan trọng. Vì nếu sử dụng ngắt quãng thì sản phẩm sẽ không phát 
huy được hiệu quả cao nhất.
Sản phẩm phải phù hợp với chu trình chăm sóc da: Các sản phẩm trong chu trình chăm sóc da sẽ bổ sung cho nhau để nâng cao tác dụng và 
hiệu quả của nhau. Vì vậy, bạn nên chọn sản phẩm phù hợp với thói quen chăm sóc da hiện tại của mình. Tránh chọn những loại kem có 
chứa thành phần không tương thích với sản phẩm bạn đang sử dụng. Tình trạng này có thể khiến da bị kích ứng, mẩn đỏ và bong tróc dữ dội.
Dựa trên những nguyên tắc này, chị em có thể lựa chọn sản phẩm phù hợp với làn da, nhu cầu và điều kiện kinh tế của mình. Tuy nhiên, 
hiệu quả của mỗi sản phẩm sẽ khác nhau tùy cơ địa mỗi người. Nếu không chọn được sản phẩm phù hợp, bạn có thể đến gặp bác sĩ da liễu 
để được tư vấn cụ thể hơn.
Trên thị trường có rất nhiều loại kem làm trắng da. Điều này khiến chị em gặp khó khăn trong việc lựa chọn sản phẩm phù hợp với nhu 
cầu và túi tiền của mình. Danh sách 7 sản phẩm được đánh giá tốt nhất hiện nay sẽ giúp bạn lựa chọn dễ dàng hơn:
1. Kem dưỡng trắng da V7 Toning Light của Hàn Quốc
Là loại kem dưỡng trắng da bán chạy nhất tại thị trường Hàn Quốc trong thời gian qua. Và hiện nay, sản phẩm như một cơn lốc trong 
ngành làm đẹp tại Việt Nam. Hầu như cô gái nào cũng ao ước và mong muốn sở hữu nó để chăm sóc da và muốn da mình đẹp mịn màng như 
các cô gái Hàn Quốc.
Sản phẩm được sản xuất trên dây chuyền công nghệ hiện nay dựa trên sự nghiên cứu của hai nền công nghiệp mỹ phẩm hàng đầu thế giới 
là Hàn Quốc và Mỹ.
2. Kem dưỡng trắng da mặt Hada Labo Perfect White Arbutin Cream 
Kem dưỡng trắng da mặt Hada Labo Perfect White Arbutin Cream là sản phẩm giá rẻ, rất phù hợp với túi tiền của học sinh - sinh viên. 
Sản phẩm này được nghiên cứu và sản xuất bởi thương hiệu Hada Labo - một thương hiệu con của Rohto Mentholatum. Sản phẩm của Hada Labo 
dành riêng cho phụ nữ từ 16-30 tuổi với công thức an toàn, lành tính và dịu nhẹ cho làn da.
Thành phần chính của sản phẩm là Hyaluronic acid và Nano Hyaluronic acid có khả năng dưỡng ẩm tốt, hỗ trợ làm mềm da, phục hồi 
những vùng da bị khô và bong tróc. Đặc biệt, các phân tử Nano Hyaluronic acid có thể dễ dàng thẩm thấu vào tầng sâu nhất giúp 
làn da trở nên căng mọng, ẩm mịn chỉ trong “tích tắc”.
3. Kem chống lão hóa và dưỡng trắng da mặt Dakami cho phụ nữ trên 30 tuổi
Kem Dakami hay còn gọi là kem chống lão hóa Dakami, đây là sản phẩm có xuất xứ trong nước, thuộc dòng mỹ phẩm chăm sóc da chuyên dụng
có tác dụng chống lão hóa, giúp chị em sở hữu làn da căng mịn. tràn đầy sức sống như xưa.
Có nhiều trang đánh giá cho rằng kem Dakami là của Hàn Quốc và thường dán nhãn nhầm là Dakami Hàn Quốc. Thực tế không phải vậy!
Đây là sản phẩm thuần Việt, do Công ty TNHH Công nghệ Sinh học Dược Mỹ phẩm SJK sản xuất, tuy nhiên nguyên liệu tạo nên sản phẩm 
đều được nhập khẩu 100% từ Hàn Quốc.
4. Kem dưỡng trắng da mặt Innisfree Whitening Pore Cream của Hàn Quốc
5. Kem dưỡng trắng da mặt The Ordinary Vitamin C Suspension + HA
6. Kem dưỡng trắng da mặt dành cho học sinh Senka White Beauty Glow Gel Cream
7. Kem dưỡng trắng da mặt Hatomugi The Milky Cream của Nhật Bản
8. Kem đặc trị nám và làm trắng da Obagi Nu-Derm Blend Fx
9. Kem dưỡng trắng da cao cấp SK-ii Cellumination Deep Surge EX
Kem dưỡng trắng da mặt là sản phẩm không thể thiếu đối với những chị em sở hữu làn da đen sạm. Ngoài ra, nhiều người có làn da 
trắng vẫn muốn sử dụng các sản phẩm này để duy trì vẻ đẹp của làn da và ngăn ngừa các rối loạn sắc tố do tuổi tác.
','2022-03-04'),
(5, N'Cách trị mụn ẩn an toàn hiệu quả tại nhà ai cũng nên biết','image16.png','image16,2.png', N'Mụn ẩn là loại mụn dưới da, rất khó nhận biết vì ít gây sưng, viêm. Vì thế mà điều trị mụn ẩn cũng khá khó khăn. Mặt khác, việc chữa trị không đúng cách còn có thể để lại hậu quả xấu cho làn da. Bài viết hôm nay của Mình Đẹp sẽ hướng dẫn bạn cách trị mụn ẩn an toàn mà hiệu quả nhất ngay tại nhà. Cùng tham khảo nhé.

',N'
 1. Nguyên nhân nào dẫn đến mụn ẩn
mụn ẩn là một trong số những loại mụn để lại hậu quả khá nghiêm trọng cho da. Loại mụn này không mọc hẳn lên bề mặt mà chỉ hiện 
diện ở trong các lớp biểu bì, không lộ rõ đầu nhân và cũng không gây bất kỳ phản ứng sưng, viêm cục bộ nào. Chính vì thế mà rất 
khó để phát hiện trong thời gian đầu. Nhiều khi mụn ẩn mọc nhiều, thành từng đám dày đặc, làm cho da trở nên sần sùi và thiếu 
sức sống.
Nguyên nhân:
Có rất nhiều nguyên nhân gây nên tình trạng này. Trong đó, có thể lược ra một số tác nhân chính như sau:
Rối loạn nội tiết: Sự rối loạn nội tiết, mất cân bằng hormone trong cơ thể rất dễ dẫn đến tình trạng nổi mụn nói chung. 
Chăm sóc da không đúng cách: rửa mặt không sạch, không tẩy tế bào chết định kỳ khiến các lỗ chân lông bị bít lại; dùng mỹ phẩm 
không phù hợp với da mặt, vệ sinh làn da chưa đúng cách,… là những nguyên nhân dễ gây ra mụn ẩn.
Không bảo vệ làn da: Khi tiếp xúc với ánh nắng mặt trời, làn da rất dễ bị tổn thương và tạo điều kiện cho sự hình thành mụn. 
Không che chắn, bôi kem chống nắng khi đi ra nắng có thể gây ra mụn ẩn, mụn thâm, mụn bọc trên da.
Dinh dưỡng chưa phù hợp: Các loại thực phẩm có tính cay, nóng gây ảnh hưởng không tốt đến gan, hạn chế giải độc, gây nóng trong 
người dẫn đến nổi mụn.
Thói quen sống thiếu khoa học: Thường xuyên thức khuya, sờ tay bẩn lên mặt,…
Dấu hiệu nhận biết:
Vậy làm thế nào để nhận biết mụn ẩn? Dưới đây là những dấu hiệu của làn da bị mụn ẩn:
Vùng da không sưng viêm, sờ vào có cảm giác sần sùi, thô ráp.
Mụn mờ nhạt trên da, không có đầu nhân, kích thước thường nhỏ hơn so với mụn bọc.
Mụn thường mọc thành từng đám như rôm sảy, rất ít khi thấy mọc riêng lẻ.
Nhận biết và phát hiện sớm mụn ẩn là một bước quan trọng để việc điều trị mụn được hiệu quả tốt nhất. Nếu mụn ẩn phát triển 
lâu dưới da sẽ khiến da sần sùi, thiếu sức sống, làm cho da bị lão hóa nhanh hơn, dễ để lại thâm sẹo rất khó điều trị sau này.
2. Nguyên tắc cần nắm để điều trị mụn ẩn hiệu quả
Để đề phòng mụn ẩn “tấn công” da mặt cũng như điều trị mụn ẩn mang lại hiệu quả cao thì bạn cần thực hiện tốt các nguyên tắc dưới đây.

#1. Vệ sinh da mặt đúng cách
Vệ sinh da mặt là bước chăm sóc da cơ bản, và cũng là cách trị mụn ẩn đơn giản. hữu hiệu nhất. Quá trình này sẽ giúp loại bỏ 
bã nhờn, chất bẩn bám trên da, giúp thông thoáng lỗ chân lông, ngăn cản vi khuẩn cư trú và xâm nhập gây nên mụn. Bạn có thể 
vệ sinh da mặt bằng nước mát kết hợp với sữa rửa mặt. Chú ý nên chọn sữa rửa mặt phù hợp với da mình, tránh gây kích ứng.
Việc tẩy trang cũng có vai trò quan trọng giống như vệ sinh da mặt. Bạn có thể sử dụng các loại nước tẩy trang để giúp tẩy sạch 
mỹ phẩm, bụi bặm trên da.
Vệ sinh da đơn thuần không thể loại bỏ hoàn toàn các tế bào chết trên và sâu trong da. Vì thế bạn cần tẩy tế bào chết đều đặn 
2 - 3 lần/tuần để giúp khơi thông lỗ chân lông, ngăn ngừa mụn, giúp da thông thoáng và dễ dàng hấp thu các dưỡng chất khi sử dụng 
các sản phẩm trị mụn hơn.
#2 Bảo vệ da
Tia UV có trong ánh nắng mặt trời là kẻ thù hàng đầu cho da. Nó làm cho da bị tổn thương, thâm sạm và dễ hình thành mụn ẩn. Vì thế 
bạn cần sử dụng kem chống nắng và che chắn cho da khi phải hoạt động dưới thời tiết nắng gắt.
#3 Dưỡng ẩm cho da
Da khi được cung cấp ẩm sẽ trở nên mịn màng, thúc đẩy trao đổi chất và đào thải mụn dưới da. Cung cấp ẩm cho da bằng cách uống 
nhiều nước hoặc sử dụng các sản phẩm xịt khoáng, kem dưỡng ẩm,…
','2022-01-14'),
(5,N'Làm gì khi bị dị ứng mỹ phẩm? Cách xử trí và phòng tránh hiệu quả','image17.png','image17,2.png',N'Làm gì khi bị dị ứng mỹ phẩm 
là câu hỏi của nhiều chị em và không ít cánh mày râu khi sở hữu làn da quá mỏng manh, nhạy cảm. Đặc biệt, sau khi đã bị dị ứng, nếu
phương pháp điều trị không phù hợp còn có thể khiến tình trạng nặng thêm. Vì vậy, đừng bỏ qua những thông tin hữu ích trong bài viết 
để có thể giải quyết tình trạng này.',N'1. Nhận biết các dấu hiệu dị ứng
Trước khi đi vào giải đáp câu hỏi “làm gì khi bị dị ứng mỹ phẩm”, bạn cần nắm rõ cách nhận biết các dấu hiệu dị ứng. Tùy theo cơ địa 
của mỗi người và nồng độ hoạt chất mà các triệu chứng sẽ có biểu hiện và mức độ khác nhau. Nhưng thông thường làn da khi bị dị ứng sẽ 
có những dấu hiệu như sau:

Nổi mụn: những nốt mụn có thể xuất hiện sau vài phút hoặc vài giờ dưới dạng hạt li ti. Nếu không được can thiệp kịp thời, vết mụn có 
thể lan rộng khắp khuôn mặt gây mất thẩm mỹ nghiêm trọng.

Cảm giác khó chịu: đa số người bị dị ứng mỹ phẩm đều sẽ có những cảm giác như châm chích, ngứa ngáy, bỏng rát,… Trong tình huống này, 
bạn không nên cố gắng tác động mạnh vào da, tránh gây thêm tổn thương. 

Khô da hoặc da quá nhờn: da khô căng, kết vảy, bong tróc,… cũng là một tình trạng thường xuất hiện khi bị dị ứng mỹ phẩm. Tuy nhiên, 
một số trường hợp khác có thể bị tiết nhờn nhiều hơn bình thường, kèm theo lỗ chân lông to.

Sạm da: đối với những mỹ phẩm nhạy cảm với ánh nắng nếu bạn không che chắn kĩ khi ra ngoài có thể sẽ gặp tình trạng sạm da hoặc nám da.
2. Nên làm gì khi bị dị ứng mỹ phẩm?
Làn da bị tổn thương cần phải chăm sóc đúng cách mới có thể chữa lành hiệu quả. Nhưng triệu chứng thường xuất hiện đột ngột khiến người 
bị dị ứng không tránh khỏi lo lắng. Vì vậy, trước hết bạn cần bình tĩnh và thực hiện một số biện pháp như gợi ý sau:

Rửa sạch lớp mỹ phẩm
Để hạn chế những tác động dị ứng, bạn nên rửa thật sạch vùng da đã được dùng mỹ phẩm khi nhận thấy những dấu hiệu kích ứng với nước ấm 
hoặc nước muối sinh lý 0,9%. Không nên dùng nước tẩy trang, sữa rửa mặt, xà phòng,… để làm sạch, tránh làm xuất hiện thêm phản ứng mẫn 
cảm.

Ngưng sử dụng 
Ngay khi nhận thấy những dấu hiệu đầu tiên, bạn cần làm sạch da và ngừng sử dụng ngay lập tức. Đừng tiếc loại sản phẩm không 
phù hợp với cơ địa của bạn, tránh gặp phải những tổn thương và di chứng không mong muốn.

Một số biện pháp chăm sóc
Bởi làn da khi bị dị ứng đang trong tình trạng rất nhạy cảm, vì vậy khi chăm sóc da bạn không nên tự mua thuốc uống hay bôi để 
tránh làm cho vùng tổn thương thêm nghiêm trọng. Bạn nên cho làn da được “nghỉ ngơi”, tránh xa các loại mỹ phẩm hay thuốc bôi 
và thực hiện một số biện pháp chăm sóc như sau:

Chườm lạnh: để làm dịu cảm giác ngứa ngáy, châm chích, bạn nên dùng khăn sạch nhúng qua nước lạnh đắp lên vùng da tổn thương. 
Không nên gãi tránh cho da bị trầy xước.

Uống nhiều nước: nước có vai trò thúc đẩy quá trình chuyển hóa, giúp cơ thể nhanh chóng loại bỏ yếu tố gây kích ứng và làn da 
được hỗ trợ phục hồi tốt hơn.

Hạn chế tiếp xúc với ánh nắng: tia cực tím (hay tia UV) từ ánh nắng mặt trời có thể khiến vùng da tổn thương thêm nghiêm trọng. 
Vì vậy bạn nên tránh ra ngoài vào lúc nắng gắt, sử dụng kem chống nắng dịu nhẹ với độ SPF/PA thích hợp, che chắn cẩn thận với 
mũ, khẩu trang, áo khoác,… 

Thăm khám
Để được áp dụng biện pháp điều trị thích hợp, an toàn, đảm bảo mang lại hiệu quả như mong đợi, bạn nên đi thăm khám trong thời 
gian sớm nhất có thể, tại những cơ sở y tế đảm bảo uy tín và chất lượng. 
3. Phòng tránh hiện tượng này như thế nào?
Để ngăn ngừa và tránh tái diễn tình trạng dị ứng với mỹ phẩm, bạn cần ghi nhớ và thực hiện theo những gợi ý như sau:

Chọn lọc kỹ lưỡng: bạn nên xem qua một số bài viết mô tả trải nghiệm sử dụng từ mạng xã hội hay những website uy tín và xem xét 
kỹ trước khi lựa chọn.

Dùng sản phẩm đúng loại da: xác định đúng loại da của mình là da dầu, khô, hay hỗn hợp (gồm hỗn hợp thiên dầu và hỗn hợp thiên khô) 
và nên chọn sản phẩm có tác dụng phù hợp với tình trạng da của bạn.

Loại bỏ những sản phẩm dễ gây kích ứng: chất tạo mùi, tạo bọt, alcohol,… là những thành phần dễ gây dị ứng với làn da nhạy cảm. 
Bạn nên đọc kỹ thông tin về sản phẩm và cân nhắc trước khi quyết định sử dụng.

Dùng thử: bạn có thể dùng thử một ít sản phẩm lên vùng da cánh tay trước khi dùng cho mặt, giữ nguyên trong khoảng 24 - 48 giờ 
để theo dõi. Nếu những dấu hiệu kích ứng xuất hiện, hãy loại sản phẩm đó ra khỏi chu trình chăm sóc da của bạn ngay và luôn.

Thăm khám sức khỏe: kiểm tra sức khỏe định kỳ tối thiểu 6 tháng/lần sẽ giúp bạn phát hiện và can thiệp kịp thời với những dấu 
hiệu bất thường với sức khỏe, bao gồm cả tình trạng da của bạn.','2022-02-13'),

(5,N'10 kem nền cho da dầu mụn, da nhạy cảm cực hiệu quả 2022','image18.png','image18,2.png',N'Kem nền kiềm dầu cho da dầu mụn, da nhạy cảm nào tốt? Kem nền bật tone da diệu kỳ, che phủ tuyệt đối mọi khuyết điểm lại không ảnh hưởng đến da. Giải pháp trang điểm dành cho các nàng da mụn, da dầu mụn.',
N' Nhiều người nhầm lẫn kem nền với kem lót và kem che khuyết điểm và thắc mắc Kem nền là gì?

Kem nền có kết cấu đặc, có nhiều tông màu hơn so với kem lót thường dạng lỏng, chỉ có một màu. Kem nền là bước trang điểm 
sau kem lót và trước bước thoa kem che khuyết điểm.

Nếu kem lót có tác dụng se khít lỗ chân lông, giúp cho lớp nền và che khuyết điểm có độ bám tốt hơn thì lớp kem nền giúp che 
phủ những khuyết điểm cho da, giúp da sáng bật tone. Với làn da mụn, dầu mụn, kem nền có tác dụng kiềm dầu, làm mờ những nốt 
mụn, thâm mụn cho lớp trang điểm tự nhiên, không tì vết.

Hiện nay, ngoài tác dụng giúp che phủ những khuyết điểm, nhiều dòng thương hiệu bổ sung thêm những chức năng hoàn hảo cho kem 
nền như dưỡng da, chống nắng, trị mụn, ngừa mụn,...
Với làn da mụn, da dầu mụn nhạy cảm, chịu tổn thương do mụn gây ra, việc lựa chọn kem nền cần kỹ lưỡng hơn. Nếu chọn kem nền 
nhiều dầu, dày đậm có thể ảnh hưởng gây bức bí lỗ chân lông, tổn thương mụn và phá vỡ cấu trúc da.

Nhưng nếu chọn kem nền quá mỏng thì lại không đủ độ che phủ những khuyết điểm trên da hay những vết thâm, mụn. Vì vậy việc 
lựa chọn kem nền cho da mụn cần được thực hiện cẩn thận. 
 Một số lưu ý trước khi bạn lựa chọn kem nền nếu sở hữu làn da dầu mụn, nhạy cảm:

Kem nền kiềm dầu, se khít lỗ chân lông
Với làn da mụn, dầu mụn, dầu nhờn khiến cho da luôn bóng nhờn, gây mất tự tin khi tiếp xúc với người đối diện. Dầu nhờn 
cũng khiến cho lớp trang điểm cầu kỳ mau trôi, nhất là vùng chữ T. Chỉ chưa đầy một tiếng thì lớp trang điểm đã bị nhoà 
mờ bởi lớp dầu, mồ hôi.

Lựa chọn một loại kem nền có tác dụng kiềm dầu vô cùng quan trọng cố định lớp trang điểm cũng như se khít lỗ chân lông 
rất quan trọng. Một trong những vấn đề bắt gặp với làn da mụn chính là lỗ chân lông to.

Sử dụng một loại kem nền có khả năng se khít lỗ chân lông để giữ độ mềm mại và mịn màng cho da.Không cần bôi trét quá nhiều, 
e ngại khi sử dụng kem nền cho da mà vẫn sở hữu làn da đáng mơ ước. Những nốt mụn chình ình, ngoan cố nhanh chóng được che phủ.

Không chứa dầu
Sử dụng một loại kem nền không chứa dầu có sức mạnh giữ độ khô thoáng cho làn da. Làn da mụn rất dễ bị kích ứng với cồn, 
Paraben, hoặc hương thơm nên đây là một trong những lưu ý để bạn lựa chọn kem nền. 

Trị mụn
Không dừng lại ở khả năng che phủ mọi khuyết điểm, nhiều kem nền hiện nay còn được bổ sung thành phần giúp ngừa mụn, trị 
mụn hiệu quả cho làn da.

Thành phần Salycilic Acid giúp loại bỏ dầu thừa, tẩy tế bào chết cực hiệu quả cũng như giúp se khít lỗ chân lông được 
thông thoáng. Một trong những thương hiệu được biết đến là Laneige, Loreal, kem nền Shiseido đáng để bạn tham khảo.

Dưỡng da
Nhờ có bổ sung thành phần dưỡng da, lớp trang điểm trông tự nhiên như thật, đầy sức sống và không bị "đơ". Lối xu hướng 
trang điểm như không trang điểm đang lên ngôi để bạn theo đuổi, thu hút mọi ánh nhìn, toả sáng và hút hồn bao người mỗi 
lần xuất hiện. 

Chống nắng
Chống nắng là một trong những bước quan trọng cho làn da. Hiện nay, nhiều kem nền có bổ sung thành phần chống nắng bảo vệ 
làn da khỏi ánh nắng mặt trời.

Nếu thông thường bạn phải thoa thêm một lớp chống nắng trước khi trang điểm. Thì kem nền được tích hợp thành phần chống 
nắng hoàn hảo nhất cho làn da. Đây thực sự là một trong những cải tiến vượt trội cho làn da mụn, dầu mụn.

Chống nắng quan trọng bậc nhất trong các bước chăm sóc và bảo vệ da, bạn lưu ý nhé !','2022-02-18'),
(6,N'Cách xử lý viêm nang lông tại nhà hiệu quả nhanh','image19.png','image19,2.png', N'“Do chân bị viêm nang lông nặng nên mình tự ti nhiều lắm. Quanh năm suốt tháng chẳng bao giờ dám mặc váy, nhìn chị em xúng xính khoe chân mà mình tủi thân.” – Tâm sự của chị Hà cũng chính là nỗi buồn chung mà nhiều người đang gặp phải. Mong muốn lớn nhất của chị lúc này là tìm ra cách xử lý viêm nang lông tại nhà dứt điểm, hiệu quả nhanh nhất. ',
N'
  I.Hiểu rõ nguyên nhân gây viêm nang lông là gì
  Để loại bỏ viêm nang lông, chị em cần hiểu rõ nguyên nhân gây bệnh. Đúng như tên gọi, viêm nang lông là tình trạng lỗ chân lông 
  bị viêm do các vi sinh vật ngoại lai chiếm đóng. Xét nghiệm vi sinh tại chỗ chỉ ra hai vi khuẩn gây viêm thường gặp nhất là tụ 
  cầu vàng và trực khuẩn mủ xanh. Ngoài ra, nấm và virus cũng là hai tác nhân phổ biến gây bệnh:

  - Nấm: Trichophyton rubrum hoặc Malassezia folliculitis (Pityrosporum folliculitis).
  - Virus Herpes simplex: gây viêm nang lông vùng quanh miệng.
   Tuy vậy, nhiều người lại có thắc mắc rằng: Tại sao mình vệ sinh cơ thể sạch sẽ, vi sinh vật hoàn toàn không có cơ hội tấn công 
   nhưng vẫn bị viêm nang lông mãi không khỏi? Lý giải cho điều này, các nghiên cứu y học đã chỉ ra nhiều dạng viêm nang lông 
   không phải do vi sinh vật: 

Giả viêm nang lông: Do tình trạng cạo râu, lông, gây tình trạng lông chọc thịt. Dạng viêm nang lông này thường gặp ở vùng cằm của 
nam giới. Ngoài ra, nó cũng xuất hiện trên chân, tay của những người có thói quen cạo lông dài ngày. 
Viêm nang lông tăng bạch cầu ái toan: Đây là dạng viêm nang lông bệnh lý, xuất hiện trên người bệnh suy giảm miễn dịch. 
Viêm nang lông tiếp xúc: Phổ biến trong cộng đồng người tiếp xúc nhiều với dầu nhớt như thợ máy móc, thợ sửa chữa… 
Viêm nang lông Decalvans: chưa rõ nguyên nhân chính xác, thường để lại triệu chứng viêm vùng da đầu và làm tóc rụng vĩnh viễn. 
Viêm nang lông do vi sinh vật có thể xử lý dễ dàng thông qua làm sạch, sát khuẩn. Viêm nang lông do các nguyên nhân khác thường 
khó tác động hơn, đòi hỏi kết hợp điều trị để đạt hiệu quả tốt nhất. 

II. Các yếu tố thúc đẩy viêm nang lông thêm nặng 
Bên cạnh các nguyên nhân chính ở trên, viêm nang lông còn có thể nặng thêm bởi rất nhiều yếu tố như: mặc quần áo quá chật; cạo, 
nhổ lông; ra mồ hôi nhiều; dùng mỹ phẩm chứa corticoid hay chất gây kích ứng…Đây là những sai lầm thường gặp của nhiều chị em 
trong quá trình chăm sóc sắc đẹp. Muốn loại bỏ được viêm nang lông, cần khắc phục triệt để các sai lầm đó. 
Nhiều bệnh lý cũng là thủ phạm thúc đẩy tình trạng viêm nang lông phát triển. Bộ Y tế chỉ ra 5 bệnh nền thường gặp nhất ở người 
bị viêm nang lông: 

Béo phì
Tiểu đường
Suy giảm miễn dịch bẩm sinh hay mắc phải
Suy thận, chạy thận nhân tạo
Thiếu máu do thiếu sắt (với những trường hợp viêm nang lông mạn tính).
Trước quá nhiều yếu tố tác động như vậy, viêm nang lông luôn là bài toán khó có lời giải. Năm 2015, Bộ Y tế đã ban hành hướng 
dẫn điều trị viêm nang lông. Theo đó, hy vọng trị viêm nang lông tại nhà triệt để không còn là mong ước xa vời. 

III. Ba bước xử lý viêm nang lông tại nhà hiệu quả nhanh 
1. Làm sạch vùng da bị viêm bằng dung dịch sát khuẩn 
Làm sạch da là nguyên tắc cơ bản nhất trong điều trị viêm nang lông. Khi tiêu diệt các vi sinh vật, nguyên nhân gây viêm được 
loại bỏ, giúp da phục hồi nhanh chóng. Theo khuyến cáo của Bộ Y tế, vùng da bị viêm nang lông nên được làm sạch bằng dung dịch 
sát khuẩn chuyên dụng. Dung dịch được lựa chọn cần đáp ứng đủ các yêu cầu: 

Sát khuẩn mạnh: hiệu quả trên cả các chủng vi khuẩn, virus và nấm.
Hiệu quả nhanh: giúp mau chóng cải thiện được tình trạng viêm. 
Có khả năng thấm sâu: xâm nhập tốt vào vùng lỗ chân lông bị viêm để phát huy tác dụng. 
Không gây khô rát, kích ứng: không chứa cồn, không làm mẩn đỏ, nổi thêm mụn mủ trên da. 
An toàn: Không gây tác động có hại khi sử dụng lâu dài, trên diện tích da rộng.
Cách xử lý viêm nang lông tại nhà hiệu quả nhanh
Tác giả: Dược sĩ Ngọc MinhNgày đăng: 11/11/2020
“Do chân bị viêm nang lông nặng nên mình tự ti nhiều lắm. Quanh năm suốt tháng chẳng bao giờ dám mặc váy, nhìn chị em xúng 
xính khoe chân mà mình tủi thân.” – Tâm sự của chị Hà cũng chính là nỗi buồn chung mà nhiều người đang gặp phải. Mong muốn 
lớn nhất của chị lúc này là tìm ra cách xử lý viêm nang lông tại nhà dứt điểm, hiệu quả nhanh nhất. 

Mục lục bài viết [Ẩn]

I. Hiểu rõ nguyên nhân gây viêm nang lông 
II. Các yếu tố thúc đẩy viêm nang lông thêm nặng 
III. Ba bước xử lý viêm nang lông tại nhà hiệu quả nhanh 
1. Làm sạch vùng da bị viêm bằng dung dịch sát khuẩn 
2. Dùng thuốc kháng sinh 
3. Loại bỏ nguyên nhân và yếu tố nguy cơ gây viêm nang lông 
I. Hiểu rõ nguyên nhân gây viêm nang lông 
nguyen-nhan-viem-nang-long nguyên nhân viêm nang lông

Để loại bỏ viêm nang lông, chị em cần hiểu rõ nguyên nhân gây bệnh. Đúng như tên gọi, viêm nang lông là tình trạng lỗ chân 
lông bị viêm do các vi sinh vật ngoại lai chiếm đóng. Xét nghiệm vi sinh tại chỗ chỉ ra hai vi khuẩn gây viêm thường gặp nhất 
là tụ cầu vàng và trực khuẩn mủ xanh. Ngoài ra, nấm và virus cũng là hai tác nhân phổ biến gây bệnh:

Nấm: Trichophyton rubrum hoặc Malassezia folliculitis (Pityrosporum folliculitis).
Virus Herpes simplex: gây viêm nang lông vùng quanh miệng.
Tuy vậy, nhiều người lại có thắc mắc rằng: Tại sao mình vệ sinh cơ thể sạch sẽ, vi sinh vật hoàn toàn không có cơ hội tấn 
công nhưng vẫn bị viêm nang lông mãi không khỏi? Lý giải cho điều này, các nghiên cứu y học đã chỉ ra nhiều dạng viêm nang 
lông không phải do vi sinh vật: 

Giả viêm nang lông: Do tình trạng cạo râu, lông, gây tình trạng lông chọc thịt. Dạng viêm nang lông này thường gặp ở vùng cằm 
của nam giới. Ngoài ra, nó cũng xuất hiện trên chân, tay của những người có thói quen cạo lông dài ngày. 
Viêm nang lông tăng bạch cầu ái toan: Đây là dạng viêm nang lông bệnh lý, xuất hiện trên người bệnh suy giảm miễn dịch. 
Viêm nang lông tiếp xúc: Phổ biến trong cộng đồng người tiếp xúc nhiều với dầu nhớt như thợ máy móc, thợ sửa chữa… 
Viêm nang lông Decalvans: chưa rõ nguyên nhân chính xác, thường để lại triệu chứng viêm vùng da đầu và làm tóc rụng vĩnh viễn. 
Viêm nang lông do vi sinh vật có thể xử lý dễ dàng thông qua làm sạch, sát khuẩn. Viêm nang lông do các nguyên nhân khác thường 
khó tác động hơn, đòi hỏi kết hợp điều trị để đạt hiệu quả tốt nhất. 

II. Các yếu tố thúc đẩy viêm nang lông thêm nặng 
Bên cạnh các nguyên nhân chính ở trên, viêm nang lông còn có thể nặng thêm bởi rất nhiều yếu tố như: mặc quần áo quá chật; cạo, 
nhổ lông; ra mồ hôi nhiều; dùng mỹ phẩm chứa corticoid hay chất gây kích ứng…Đây là những sai lầm thường gặp của nhiều chị em 
trong quá trình chăm sóc sắc đẹp. Muốn loại bỏ được viêm nang lông, cần khắc phục triệt để các sai lầm đó.  

tri_viem_nang_long_tai_nha trị viêm nang lông tại nhà

Nhiều bệnh lý cũng là thủ phạm thúc đẩy tình trạng viêm nang lông phát triển. Bộ Y tế chỉ ra 5 bệnh nền thường gặp nhất ở 
người bị viêm nang lông: 

  + Béo phì
  + Tiểu đường
  + Suy giảm miễn dịch bẩm sinh hay mắc phải
  + Suy thận, chạy thận nhân tạo
  + Thiếu máu do thiếu sắt (với những trường hợp viêm nang lông mạn tính).
  Trước quá nhiều yếu tố tác động như vậy, viêm nang lông luôn là bài toán khó có lời giải. Năm 2015, Bộ Y tế đã ban hành 
  hướng dẫn điều trị viêm nang lông. Theo đó, hy vọng trị viêm nang lông tại nhà triệt để không còn là mong ước xa vời. 

III. Ba bước xử lý viêm nang lông tại nhà hiệu quả nhanh 
1. Làm sạch vùng da bị viêm bằng dung dịch sát khuẩn 
Làm sạch da là nguyên tắc cơ bản nhất trong điều trị viêm nang lông. Khi tiêu diệt các vi sinh vật, nguyên nhân gây viêm được 
loại bỏ, giúp da phục hồi nhanh chóng. Theo khuyến cáo của Bộ Y tế, vùng da bị viêm nang lông nên được làm sạch bằng dung dịch 
sát khuẩn chuyên dụng. Dung dịch được lựa chọn cần đáp ứng đủ các yêu cầu: 

Sát khuẩn mạnh: hiệu quả trên cả các chủng vi khuẩn, virus và nấm.
Hiệu quả nhanh: giúp mau chóng cải thiện được tình trạng viêm. 
Có khả năng thấm sâu: xâm nhập tốt vào vùng lỗ chân lông bị viêm để phát huy tác dụng. 
Không gây khô rát, kích ứng: không chứa cồn, không làm mẩn đỏ, nổi thêm mụn mủ trên da. 
An toàn: Không gây tác động có hại khi sử dụng lâu dài, trên diện tích da rộng. 
viêm nang lông

Hầu hết dung dịch sát khuẩn thường gặp hiện nay không đạt được hết các yêu cầu đó. Tại các bệnh viện, phòng khám da liễu, 
sản phẩm được dùng nhiều nhất là dung dịch chứa acid hypochlorous. Đây được coi là chất sát khuẩn tự nhiên vì hoạt động 
tương tự cách hệ miễn dịch bảo vệ cơ thể. Nó cho hiệu quả sát khuẩn nhanh và mạnh nhưng vẫn an toàn tuyệt đối cho da. Với 
làn da nhạy cảm của người bị viêm nang lông, dung dịch chứa acid hypochlorous là lựa chọn tối ưu nhất. Tại Việt Nam, Dizigone 
là đại diện duy nhất của dòng sản phẩm này. 

Cách làm sạch da bằng dung dịch sát khuẩn Dizigone: 

Lau/rửa/xịt vùng da bị viêm nang lông bằng dung dịch Dizigone 3-4 lần/ngày. 
Giữ dung dịch trên da tối thiểu 30 giây, không cần rửa lại bằng nước.

2. Dùng thuốc kháng sinh 
Kháng sinh được dùng kết hợp sau bước sát khuẩn để tiêu diệt sạch sẽ vi khuẩn gây viêm. Ưu điểm của kháng sinh là duy trì 
được tác dụng diệt khuẩn kéo dài. Tuy nhiên, liệu trình sử dụng phải được thông qua chỉ định của bác sĩ. Bạn không nên tự ý 
mua thuốc về dùng để tránh gặp phải tác dụng phụ. 

Khi viêm nang lông ở mức độ nhẹ – trung bình, kháng sinh chỉ cần dùng theo đường bôi tại chỗ. Một số kem/thuốc mỡ kháng sinh 
thường được chỉ định cho viêm nang lông là: 

 - Kem hoặc mỡ axit fusidic, bôi 1- 2 lần/ngày 
 - Mỡ mupirocin 2%, bôi 3 lần/ngày 
 - Mỡ neomycin, bôi 2- 3 lần/ngày. 
 - Kem silver sulfadiazine 1%, bôi 1-2 lần/ngày 
 - Dung dịch erythromycin, bôi 1-2 lần/ngày 
 - Dung dịch clindamycin, bôi 1-2 lần/ngày
  Với người có viêm nang lông mức độ nặng, việc bôi kháng sinh ngoài da là chưa đủ. Hiệu quả diệt khuẩn chỉ đạt được triệt 
để khi người bệnh dùng thuốc theo đường toàn thân. Các kháng sinh toàn thân phổ biến nhất là: Cloxacillin, Amoxicillin/ clavulanic, 
Clindamycin, Vancomycin… Các thuốc này sẽ được đưa vào cơ thể qua đường uống, tiêm bắp hoặc tiêm tĩnh mạch. Thời gian điều trị cho 
kháng sinh kéo dài khoảng 7 – 10 ngày. ','2022-01-09'),

(6,N'Bí kíp "thần thánh" giúp làm đẹp sau sinh mổ dễ dàng hơn bao giờ hết','image20.png','image20,2.png', N'Chắc hẳn, ai cũng muốn có một làn da mịn màng sau khi sinh, đặc biệt là các mẹ sinh mổ. Sau đây là những bí kíp thần thánh mà các mẹ bỉm sữa nhất định phải biết.',
N' 
  Từ trước đến nay trong làm đẹp dầu dừa được lựa chọn sử dụng rất nhiều bởi nó có khả năng giữ ẩm, ngăn ngừa lão hóa da, 
  giảm thiểu nếp nhăn và tái tạo lại làn da tươi trẻ, đầy sức sống.

Ngoài ra, do chứa nhiều a xít lauric nên dầu dừa còn có khả năng kháng khuẩn, kháng nấm và chống vi rút hiệu quả. Xóa mờ nám, 
tàn nhang cho phụ nữ sau sinh bằng dầu dừa
Làm đẹp da sau sinh với dầu dừa trong việc giảm tàn nhang, nám da thực sự rất hiệu quả bởi nó thẩm thấu sâu vào da, tác động 
đến từng cấu trúc tế bào từ đó tăng khả năng bảo vệ da trước ánh nắng mặt trời.

Cách thực hiện rất đơn giản: Bạn lấy một muỗng dầu dừa sau đó thoa lên mặt, chú ý những vùng da nhiều tàn nhang và nám nhé. 
Bạn massage nhẹ nhàng làn da, sau đó rửa lại bằng sữa rửa mặt.

Chữa các vết rạn da sau sinh mổ bằng dầu dừa
Thông thường sau khi sinh con, làn da của chị em có dấu hiệu rạn nứt do trong thời gian mang thai bụng, mông và ngực của chị 
em tăng nhanh về kích thước. Đến lúc sinh con xong thì tạo thành các vết nứt, rạn khiến chị em không khỏi đau đầu.

Xóa nhăn, chống lão hóa làm đẹp sau sinh với dầu dừa
Da bị nhăn chùng, chảy xệ – nhất là vùng da bụng vốn là nỗi ám ảnh của các mẹ sau sinh. Lấy một ít dầu dừa cho lên bàn tay, 
xoa nóng rồi thoa lên khắp mặt, massage nhẹ nhàng trong 3 – 5 phút, những nếp nhăn sẽ mờ dần và biến mất.

Để đạt hiệu quả tối ưu, các mẹ nhớ áp dụng cách này trước khi đi ngủ và để lớp dầu dừa qua đêm như một loại mặt nạ ngủ và làm 
sạch bằng nước ấm vào sáng hôm sau thức dậy.

Làm trắng da sau sinh bằng dầu dừa
Để làm bật tone da, cải thiện tình trạng da xám xỉn màu, thiếu sức sống, các mẹ trộn 2 thìa dầu dừa với 1 thìa sữa chua không 
đường, sau đó đắp mặt khoảng 15 – 20 phút. Cuối cùng rửa mặt bằng nước ấm, da sẽ sáng đều màu và bật tone rõ rệt.

Làm đẹp sau sinh với nghệ và mật ong
Trị nám sau sinh bằng nghệ và bột gạo
Trị nám sau sinh bằng nghệ và bột gạo phương pháp làm đẹp hiệu quả được nhiều bà mẹ bỉm sữa lựa chọn.

Chúng ta chỉ cần trộn hỗn hợp bột nghệ và bột gạo, sau đó cho vào một ít nước để tạo thành hỗn hợp sền sệt. Đắp hỗn hợp này 
lên mặt và để khoảng 15 -20 phút rồi rửa lại bằng nước ấm.

Làm da trắng sáng sau sinh bằng nghệ tươi, sữa chua và mật ong
Trong tất cả các loại mặt nạ, đây là loại mặt nạ làm đẹp da sau sinh bằng nghệ hoàn hảo nhất, đặc biệt là đối với các bà mẹ 
bỉm sữa da dầu.

Cách làm rất đơn giản bạn giã nhỏ nhuyễn 1 củ nghệ tươi sau đó trộn với 3 thìa sữa chua và 1 thìa mật ong. Bạn đánh đều tất 
cả, tạo thành một hỗn hợp sền sệt.

Sau khi xong bạn thoa đều lên mặt rồi massage nhẹ nhàng cho các dưỡng chất thấm sâu vào da. Thư giãn trong khoảng 30 phút rồi 
rửa mặt sạch với nước ấm là chúng ta đã hoàn thành xong bước làm đẹp dễ dàng bằng nghệ tươi.
Đối với loại mặt nạ làm đẹp da sau sinh bằng nghệ này, bạn nên thực hiện 3 lần/ tuần. Kiên trì làn da của bạn sẽ ngày càng 
sáng mịn, hồng hào và tươi trẻ.

Thu nhỏ vòng bụng với hỗn hợp rượu gừng nghệ
Làm đẹp sau sinh bằng rượu gừng nghệ đòi hỏi mẹ phải chuẩn bị hỗn hợp từ trước khi sinh khoảng 3 tháng.

Mẹ xay nhuyễn 1kg nghệ và 1kg gừng rồi cho vào hũ, đổ rượu trắng vào, đậy kín hũ và hạ thổ (chôn xuống đất) hoặc để nơi thoáng mát 
khoảng 3 tháng trở đi là có thể dùng được.

Mỗi lần sử dụng, mẹ nên dùng khoảng 1/2 chén rượu gừng nghệ đã lọc bỏ bã, xoa đều lên da bụng và massage một lúc. Mẹ có thể 
tắm để làm sạch mùi rượu sau khi hoàn tất.

Kinh nghiệm làm đẹp da sinh mổ
Không quên các bước chăm sóc da cơ bản

Với chị em vừa sinh xong, da mặt còn mỏng manh và rất dễ bị tổn thương, nên bạn luôn cần phải thận trọng với các phương pháp 
làm đẹp, sử dụng mỹ phẩm.

Hãy khởi đầu “chiến dịch tân trang làn da” của mình bằng các bước chăm sóc da cơ bản như rửa mặt, dùng toner, kem dưỡng và 
chống nắng (khi đi ra ngoài) để củng cố làn da khỏe mạnh.


 
Bạn có thể tăng cường sử dụng tẩy da chết và các giải pháp đặc trị có thành phần thảo dược, lấy đi các tế bào chết mờ xỉn và 
cân bằng tông màu da của bạn.

Sử dụng kem dưỡng da đúng cách sau khi sinh

Thời gian mới sinh xong, vì con cho con bú và bế em bé hàng ngày, làn da lại mỏng và khá nhạy cảm, bạn không nên sử dụng nhiều 
mỹ phẩm làm đẹp, đặc biệt là những sản phẩm có chất tẩy mạnh như kem làm trắng, mặt nạ làm trắng, mỹ phẩm loại bỏ hắc tố trên da …

Tốt nhất, bạn chỉ nên lựa chọn kem dưỡng có chức năng giữ ẩm cho da, để da không bị khô và mịn màng hơn. Những loại kem dưỡng có 
nguồn gốc thảo dược, an toàn cho da nhạy cảm là những thứ bạn nên chọn dùng.

Thường xuyên massage da sau sinh

Massage là bước quan trọng giúp cho da của bạn nhanh chóng lấy lại độ đàn hồi và căng mịn, bởi lúc này trọng lượng cơ thể của bạn 
đã giảm đi đáng kể.

Việc massgae còn giúp các mạch máu lưu thông và bạn đỡ cảm thấy mệt mỏi, cũng như hạn chế sự xuất hiện của các nếp nhăn khi phải 
thức đêm nhiều để chăm con.

Dành thời gian cho thể dục

Mỗi ngày dành ra 15-20 phút để tập thể dục, sự vận động này không những giúp cơ thể khỏe mạnh, săn chắc mà còn đào thải được nhiều 
độc tố và các chất cặn bã trong cơ thể qua tuyến mồ hôi. Ngoài ra hãy suy trì hình thức tập luyện đi bộ để tiếp tục phát huy hiệu 
quả của nó.

Quan tâm nhiều hơn tới thực đơn hàng ngày

Bà mẹ trẻ ngoài việc ăn đủ chất đậm để đảm bảo chất lượng sữa cho con, cũng nên ăn nhiều chất xơ, các loại hoa quả giàu vitamin và 
uống 1,5 – 2 lít nước mỗi ngày nhằm hạn chế phát sinh mỡ thừa và làm đẹp da.

Thực phẩm có chứa nhiều vitamin C, E, kẽm và silic có tác dụng giúp hình thành sợi collagen trong da.

Những thực phẩm có thể giúp cho sự tổng hợp collagen trong cơ thể như: các sản phẩm từ đậu nành, các loại rau cải xanh giàu vitamin C 
(cải bó xôi, măng tây …), những trái cây màu đỏ, các loại cá có chứa omega acids cũng giúp cơ thể tổng hợp collagen như cá ngừ, cá hồi...

Với những cách làm đẹp da mặt sau sinh đơn giản kể trên, các mẹ bỉm sữa có thể dành một chút thời gian để chăm sóc bản thân, đảm bảo 
sẽ giúp cuộc sống vui tươi và hạnh phúc hơn rất nhiều. Chúc các mẹ thành công.
','2021-11-09'),
(6,N'6 sai lầm làm hại tóc khi đi ngủ nhiều người mắc phải','image21.png','image21,2.png', N'Một số sai lầm tưởng chừng như vô hại mà bạn đang mắc phải có thể gây tổn hại mái tóc của bạn.',
N' 1.Để tóc ẩm ướt đi ngủ
Để tóc ẩm ướt đi ngủ có thể gây ra một số tổn thương nghiêm trọng cho tóc.

Tóc ướt rất dễ tổn thương, khi bạn lật người trong lúc ngủ có thể làm hỏng sợi tóc và gây ra tình trạng gãy rụng, chẻ ngọn. 
Tốt hơn hết bạn nên gội đầu vài giờ trước khi đi ngủ hoặc sử dụng xịt bảo vệ tóc khỏi nhiệt rồi sấy khô bằng máy sấy tóc.
2.Búi tóc đi ngủ: 
Với người có tóc dài, búi tóc hoặc buộc tóc đuôi ngựa trước khi đi ngủ có thể tiện lợi. Tuy nhiên buộc tóc quá chặt qua đêm 
có thể làm tóc yếu đi, thậm chí gây rụng tóc về lâu dài.

Để da đầu có thời gian phục hồi cần thiết vào ban đêm, hãy để tóc xõa trước khi ngủ và không bao giờ búi tóc chặt khi tóc ướt.
3.Dùng vỏ gối cotton thay vì vỏ gối lụa
Vải cotton thường thô hơn vải lụa, tạo ma sát trên tóc khi ngủ và có thể dẫn tới tóc rối, khô và xoăn. 

Bạn nên thay vỏ gối lụa để tóc không bị rối khi ngủ và cũng sẽ tốt cho cả làn da của bạn.

4. Không chải tóc trước khi ngủ
Chải tóc trước khi đi ngủ có thể giúp tránh tóc bị rối khi thức dậy vào sáng hôm sau.

Chải tóc cũng giúp phân bổ đều lượng dầu tự nhiên mà da đầu sản xuất từ chân tóc đến ngọn tóc, giúp tóc bạn luôn bóng mượt và 
ngăn ngừa gãy rụng.

5. Không tết tóc trước khi đi ngủ : Tóc tết là một trong những kiểu tóc tốt nhất nên để khi đi ngủ. Bạn hãy thử tết tóc rồi thoa 
sản phẩm dưỡng tóc qua đêm để thức dậy với mái tóc đẹp.

Thực tế, tết tóc trước khi đi ngủ là một trong những bí quyết mà phụ nữ Ấn Độ áp dụng để giữ cho mái tóc dài, bóng và khỏe mạnh. 
Để kiểu tóc này đi ngủ có thể ngăn ngừa chẻ ngọn, tăng cường độ chắc khỏe cho tóc và giúp tóc mọc nhanh hơn.

6. Không dùng dầu dưỡng tóc
Cũng giống như da, tóc của chúng ta cũng tái tạo trong khi ngủ và chúng ta có thể tận dụng thời gian đó bằng một số phương pháp 
điều trị đơn giản qua đêm.

Thoa dầu dưỡng tóc qua đêm ít nhất 2 lần/tuần vào đêm trước khi bạn định gội đầu, là một cách tuyệt vời để củng cố và tăng cường 
sức khỏe cho tóc.
Nếu không thể để dầu dưỡng qua đêm, bạn chỉ cần thoa dầu một giờ trước khi gội và quấn tóc bằng khăn nóng để đảm bảo dầu được 
hấp thụ tốt.','2022-03-02'),

(7,N'Cách chăm sóc da vùng kín','image22.png','image22,2.png', N'Chăm sóc da vùng kín giúp thúc đẩy làn da âm hộ khỏe mạnh. Bài viết này giúp cung cấp cho bạn những sản phẩm và phương pháp giúp giảm bớt hoặc giảm đau rát, kích ứng hoặc ngứa âm hộ/âm đạo cũng như chăm sóc sức khỏe vùng kín đúng cách.',
N'
 1. Sản phẩm giặt là
 Bạn nên lựa chọn các nhãn hiệu bột giặt chuyên dụng trên tất cả đồ giặt. Sử dụng chúng cho mỗi lần giặt, lượng dùng chỉ nên 
 sử dụng ở mức từ 1/3 đến 1/2 lượng bột giặt đề xuất cho mỗi lần giặt.
Nếu bạn có máy giặt hiệu suất cao, hãy sử dụng lượng bột giặt nhỏ nhất có thể. Xả quần áo của bạn 2 lần và nên giặt đồ lót bằng tay.
 2. Quần áo
Lựa chọn đồ lót bằng vải cotton là một cách chăm sóc da vùng kín giúp vùng kín thoáng mát và thoát hơi ẩm dễ dàng hơn. Bạn nên 
mặc đồ lót màu kem và màu trắng để có thể phát hiện rõ các dấu hiệu bất thường.

Không nên mặc đồ lót bằng nilon; không nên mặc quần dài và không nên mặc quần lót khi ngủ vào ban đêm. Nên mặc quần đùi cotton 
rộng rãi hoặc quần pijama cotton đều được.

3. Tắm rửa
Không sử dụng xà phòng tắm, sữa tắm hoặc gel có nước hoa để vệ sinh vùng kín. Những thứ này có thể có mùi thơm, nhưng chúng có 
thể gây khó chịu.
Không sử dụng xà phòng, sữa tắm dạng bọt, muối tắm và dầu thơm trực tiếp trên da âm hộ.
Dùng nước ấm và tay để rửa nhẹ nhàng vùng kín giúp vùng âm hộ sạch sẽ mà không gây kích ứng da.
Bạn có thể thoa dầu hoặc lotion trung tính (không mùi) lên da ẩm sau khi ra khỏi bồn tắm hoặc vòi sen.
Không bôi kem dưỡng da vào âm hộ.
Không chà rửa vùng da âm hộ bằng khăn. Vỗ nhẹ cho khô thay vì chà xát bằng khăn. Hoặc sử dụng máy sấy tóc ở chế độ mát để làm 
khô âm hộ.
4. Vệ sinh
Khi vệ sinh vùng kín bạn hãy lưu ý những cách chăm sóc da vùng kín sau đây:

Sử dụng giấy vệ sinh màu trắng, không mùi.
Vỗ nhẹ cho khô thay vì lau.
Không thụt rửa. Ngâm baking soda hoặc rửa bằng nước ấm sẽ giúp loại bỏ tiết dịch nhiều hơn và giúp khử mùi hôi.
Không cạo hoặc sử dụng các sản phẩm tẩy lông trên vùng âm hộ.
Bạn có thể dùng kéo để cắt bớt lông mu sát âm hộ.
Bạn có thể chọn tẩy lông bằng laser.
Không sử dụng thuốc xịt vệ sinh phụ nữ, nước hoa vào vùng kín
Nếu việc đi tiểu khiến da bạn cảm thấy bỏng rát, hãy đổ nước ấm lên âm hộ khi bạn đi tiểu để làm loãng nước tiểu.
Nên thay băng vệ sinh khi đã sử dụng trong 4 giờ hoặc ít hơn.
5. Lưu ý khi chăm sóc da vùng kín bằng thuốc mỡ và kem
Mua thuốc mỡ không chứa paraben và không có mùi thơm.

Bạn có thể sử dụng chất bảo vệ da trên âm hộ thường xuyên nếu cần. Tốt nhất bạn nên sử dụng một lớp mỏng:

Dầu ô liu nguyên chất
Dầu thực vật
Dầu dừa
Thuốc mỡ kẽm oxit
Bạn có thể sử dụng sản phẩm này thường xuyên nếu cần để bảo vệ da.

Nó cũng giúp giảm kích ứng da trong kỳ kinh nguyệt và khi bạn đi tiểu.

6. Chăm sóc da vùng kín bằng cách giữ khô ráo vùng kín
Đối với phụ nữ gặp vấn đề về ẩm ướt mãn tính:

Chọn vải quần bằng cotton
Giữ thêm một chiếc quần lót bên mình và thay nếu để vùng kín luôn bị ẩm.','2022-03-04'),
(7,N'TIÊM PHÒNG UNG THƯ CỔ TỬ CUNG (HPV): NHỮNG ĐIỀU CẦN BIẾT','image23.png','image23,2.png', N'Tiêm phòng ung thư cổ tử cung giúp ngăn chặn căn bệnh nguy hiểm hàng đầu ở phụ nữ.  Ung thư cổ tử cung đang là bệnh phổ biến thứ hai ở phụ nữ trên toàn thế giới và xếp thứ 4 về các bệnh có tỷ lệ mắc và tử vong trên toàn cầu.

Bài viết dưới đây được sự tư vấn chuyên môn của bác sĩ Bạch Thị Chính, Giám đốc Y khoa Hệ thống trung tâm tiêm chủng VNVC.',

N'Ung thư cổ tử cung là căn bệnh thường gặp đứng thứ 3 ở phụ nữ Việt Nam từ độ tuổi 15 – 44. 80% phụ nữ bị nhiễm HPV ít nhất 
1 lần trong đời. Mỗi ngày có 7 phụ nữ tử vong vì ung thư cổ tử cung, 14 trường hợp mới được chẩn đoán mắc bệnh. Không phải ai 
nhiễm HPV cũng sẽ bị ung thư cổ tử cung, tuy nhiên, có hơn 90% các trường hợp ung thư cổ tử cung phát hiện do virus HPV gây ra. 
Chỉ tính riêng tại Việt Nam, gần 5.000 phụ nữ mắc ung thư cổ tử cung, hơn 2.000 trường hợp tử vong vì ung thư cổ tử cung trong 
năm 2018

Virus HPV có thể tồn tại âm thầm và phát triển trong cơ thể mà không tạo ra bất kỳ triệu chứng nào. Biện pháp phòng ngừa tối ưu 
đến 90% ung thư cổ tử cung chính là tiêm vắc xin phòng chống virus HPV đối với bé gái và phụ nữ từ 9-26 tuổi.

Có những loại vắc xin phòng HPV nào? Độ tuổi và đối tượng tiêm ngừa ung thư cổ tử cung? Tiêm phòng HPV có cần xét nghiệm không? 
Bị nhiễm HPV có tiêm phòng ung thư cổ tử cung được không? Bị sùi mào gà có tiêm vắc xin HPV được không? Tiêm phòng ung thư cổ tử cung 
bao lâu thì được mang thai?…
Vắc xin phòng HPV là gì?
Vắc xin phòng HPV là vắc xin giúp phòng bệnh ung thư cổ tử cung và u nhú bộ phận sinh dục, sùi mào gà do virus sinh u nhú ở người 
HPV (Human Papilloma Virus) gây ra; nhiễm ở những tế bào biểu mô da và niêm mạc, có liên quan đến bất thường cổ tử cung (gồm tổn 
thương tiền ung thư, ung thư), mụn cóc và bệnh đa u nhú đường hô hấp tái diễn. HPV cũng có liên quan đến những ung thư khác như ung 
thư tế bào gai của hậu môn, âm hộ, âm đạo, dương vật, ung thư vùng đầu và cổ.

Virus HPV chủ yếu lây truyền qua đường tình dục: tiếp xúc da với da, niêm mạc miệng, hầu họng hoặc tiếp xúc với dương vật, tử cung, 
âm đạo, hậu môn của những người bị nhiễm. Hôn hay chạm vào bộ phận sinh dục của đối tác bằng miệng cũng có thể lây truyền virus HPV.

Ngoài ra, virus này còn có thể lây truyền không qua đường tình dục như dụng cụ cắt móng tay, kim bấm sinh thiết, đồ lót…

HPV cũng có thể lây truyền dọc từ mẹ sang con trong lúc sinh và gây ra đa bướu gai đường hô hấp cho trẻ sơ sinh.

Có hơn 140 tuýp Papillomavirus (HPV) được phát hiện ở người. Khoảng 40 loại có thể nhiễm vào vùng sinh dục như âm hộ, âm đạo, cổ 
tử cung, trực tràng, hậu môn, dương vật và bìu cũng như miệng và cổ họng. Những loại HPV này lây lan trong quá trình quan hệ tình 
dục.

Hầu hết các trường hợp nhiễm HPV ở bộ phận sinh dục hoàn toàn không gây hại và tự biến mất. Nhưng một số loại HPV có thể dẫn đến 
mụn cóc sinh dục hoặc một số loại ung thư.

Hai loại HPV (loại 6 và 11) gây ra hầu hết các trường hợp mụn cóc ở bộ phận sinh dục. Mụn cóc sinh dục là những mụn nhìn thấy được 
ở vùng sinh dục của đàn ông và phụ nữ. Những mụn này có thể nhỏ hoặc lớn, nhô hoặc bẹt và không gây đau. Mụn cóc không đe dọa đến 
tính mạng nhưng có thể khó đối phó vì khả năng tái nhiễm sau điều trị. Tuy nhiên, mụn cóc sinh dục được coi là virus có nguy cơ thấp 
vì không dẫn đến ung thư hoặc các vấn đề sức khỏe nghiêm trọng khác.
Hơn 10 chủng virus HPV có thể dẫn đến ung thư, trong đó có 2 chủng đặc biệt (loại 16 và 18) dẫn đến phần lớn các trường hợp ung thư. 
Đây được gọi là HPV nguy cơ cao. Ung thư cổ tử cung có liên quan phổ biến nhất với HPV, nhưng HPV cũng có thể gây ung thư ở âm hộ, 
âm đạo, dương vật, hậu môn, miệng và hầu họng. Tuýp  HPV 16,18 cũng là 2 túyp chính gây nên ung thư cổ tử cung và còn là tác nhân 
gây ra các loại ung thư như: Ung thư âm hộ (50%), Ung thư âm đạo (65%), Ung thư hầu họng (70%).
Nhiễm trùng HPV từ đường sinh dục là rất phổ biến. Trên thực tế, hầu hết những người có quan hệ tình dục đều bị nhiễm virus tại một 
số thời điểm trong cuộc sống của họ. Hầu hết những người bị nhiễm virus không có triệu chứng và cảm thấy hoàn toàn ổn, vì vậy họ 
thường không biết mình bị nhiễm bệnh.

Theo thống kê của HPV Information Centre, cứ 4 phút trôi qua lại có 1 người chết vì ung thư cổ tử cung, mỗi ngày tại Việt Nam có 
thêm 14 ca mắc mới và 7 phụ nữ tử vong do ung thư cổ tử cung.

   * Hiện chưa có thuốc đặc trị virus HPV gây ung thư cổ tử cung. Nhưng có rất nhiều điều bạn có thể làm để giữ cho HPV không có tác 
động tiêu cực đến sức khỏe của bạn. Có những loại vắc xin có thể giúp bảo vệ bạn khỏi bị nhiễm một số loại HPV nhất định. Nhiễm 
virus HPV nguy cơ cao thường có thể dễ dàng điều trị trước khi tiến triển thành ung thư, đó là lý do tại sao việc tiêm phòng và 
tầm soát ung thư hàng theo định kỳ rất quan trọng.

  * Có nên tiêm vắc xin phòng ung thư cổ tử cung?
Cho đến nay, tiêm vắc xin là biện pháp hiệu quả nhất để chị em chủ động phòng ngừa căn bệnh nguy hiểm này. Vắc xin phòng HPV khá 
an toàn và có thể đem lại hiệu quả cao trong việc bảo vệ trẻ em, phụ nữ và nam giới tránh khỏi những căn bệnh liên quan đến 
virus HPV.

Bác sĩ khuyến cáo trẻ em trong độ tuổi 9-26 tuổi nên tiêm loại vắc xin này để đảm bảo rằng trẻ được bảo vệ trước khi phơi nhiễm 
loại virus này.

 * Tác dụng phụ của vắc xin phòng HPV
Nhiều người có thể chủng ngừa mà không gặp bất kỳ phản ứng phụ nghiêm trọng nào. Tuy nhiên, bạn có thể gặp phản ứng phụ nhẹ 
đến trung bình sau khi chủng ngừa như( Phản ứng tại chỗ tiêm, quầng đỏ, đau hoặc sưng;Sốt nhẹ;Nổi mề đay;Đau đầu; Mệt mỏi...)

Nếu bạn đang gặp bất kỳ triệu chứng bất thường hoặc nếu triệu chứng vẫn còn, bạn nên tham khảo ý kiến bác sĩ.','2021-12-29');

/****** Object:  Table [dbo].[Users] ******/
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](24) NOT NULL,
	[Password] [nvarchar](20) NOT NULL,
	[Email] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
));

INSERT [dbo].[Users] ([UserName], [Password], [Email]) VALUES 
( N'johnSmith45', N'123456',N'abc34@gmail.com'),
( N'EvaMilea3000', N'123@#',N'readbabe@gmail.com'),
( N'KiominoTaylor33', N'pool4599',N'dokfornow12@gmail.com');

/****** Object:  Table [dbo].[SaveNews] ******/
Create table [dbo].[saveNews](
     [UserId] [int] NOT NULL,
	 [NewsID] [int] NOT NULL,
	 primary key(userid, newsid),
	 foreign key (newsid) references [News](newsid),
	 foreign key (userid) references [Users](userid),

);
INSERT [dbo].[saveNews] ([UserId],[NewsID]) VALUES 
(1,2),
(1,21),
(1,16),
(2,5),
(3,10);

/****** Object:  Table [dbo].[MoonKing] ******/

Create table [dbo].[MoonKing](
     [MoonID] [int] IDENTITY(1,1) NOT NULL,
     [UserId] [int] NOT NULL,	 	 
	 [StartDate] [date] NOT null,
	 [EndDate] [date] NOT null,
	 [Year] [int] NOT NULL,
	 primary key(MoonID),
	 foreign key (userid) references [Users](userid)
);
INSERT [dbo].[MoonKing] ([UserId],[StartDate],[EndDate],[Year]) VALUES 
('1','2021-12-8','2021-12-13',2021),
('1','2022-01-10','2022-01-15',2022),
('1','2022-02-8','2022-02-14',2022),
('4','2021-10-15','2021-10-21',2021),
('4','2022-03-04','2022-03-09',2022);





