﻿CREATE DATABASE QUAN_LY_GIAO_VU
USE QUAN_LY_GIAO_VU

---TAO BANG----
CREATE TABLE KHOA
(
	MAKHOA VARCHAR(4) PRIMARY KEY NOT NULL,
	TENKHOA VARCHAR(40) ,
	NGTLAP SMALLDATETIME ,
	TRGKHOA CHAR(4),
)



CREATE TABLE MONHOC 
(
	MAMH VARCHAR(10) NOT NULL PRIMARY KEY,
	TENMH VARCHAR(40) NOT NULL,
	TCLT TINYINT NOT NULL,
	TCTH TINYINT NOT NULL,
	MAKHOA VARCHAR(4) NOT NULL,
)

CREATE TABLE DIEUKIEN 
(
	MAMH VARCHAR(10) NOT NULL FOREIGN KEY REFERENCES MONHOC(MAMH),
	MAMH_TRUOC VARCHAR(10) NOT NULL FOREIGN KEY REFERENCES MONHOC(MAMH),
	CONSTRAINT PK_DK PRIMARY KEY (MAMH,MAMH_TRUOC),
)

CREATE TABLE GIAOVIEN 
(
	MAGV CHAR(4) NOT NULL PRIMARY KEY,
	HOTEN VARCHAR(40) NOT NULL,
	HOCVI VARCHAR(40) NOT NULL,
	HOCHAM VARCHAR(40), ---CO NGUOI K CO HOC HAM --K CAN NOT NULL--
	GIOITINH VARCHAR(3) NOT NULL,
	NGSINH SMALLDATETIME NOT NULL,
	NGVL  SMALLDATETIME NOT NULL,
	HESO NUMERIC(4,2) NOT NULL,
	MUCLUONG MONEY NOT NULL,
	MAKHOA VARCHAR(4) NOT NULL,
)

CREATE TABLE LOP
(
	MALOP CHAR(3) NOT NULL PRIMARY KEY,
	TENLOP VARCHAR(40) NOT NULL,
	TRGLOP CHAR(5) NOT NULL,
	SISO TINYINT NOT NULL,
	MAGVCN CHAR(4) NOT NULL,
)

CREATE TABLE HOCVIEN
(
	MAHV CHAR(5) NOT NULL PRIMARY KEY,
	HO VARCHAR(40) NOT NULL,
	TEN VARCHAR(10) NOT NULL,
	NGSINH SMALLDATETIME NOT NULL,
	GIOITINH VARCHAR(3) NOT NULL,
	NOISINH VARCHAR(40),
	MALOP CHAR(3),
)

CREATE TABLE GIANGDAY 
(
	MALOP CHAR(3) NOT NULL FOREIGN KEY REFERENCES LOP(MALOP),
	MAMH VARCHAR(10) NOT NULL FOREIGN KEY REFERENCES MONHOC(MAMH),
	MAGV CHAR(4) NOT NULL,
	HOCKY TINYINT NOT NULL,
	NAM SMALLINT NOT NULL,
	TUNGAY SMALLDATETIME NOT NULL,
	DENNGAY SMALLDATETIME NOT NULL,
	CONSTRAINT PK_GD PRIMARY KEY (MALOP,MAMH),
)

CREATE TABLE KETQUATHI 
(
	MAHV CHAR(5),
	MAMH VARCHAR(10), 
	LANTHI TINYINT NOT NULL ,
	NGTHI SMALLDATETIME NOT NULL,
	DIEM NUMERIC(4,2) NOT NULL,
	KQUA VARCHAR(10) NOT NULL,
	CONSTRAINT PK_KQT PRIMARY KEY (MAHV,MAMH,LANTHI),
)


SELECT * FROM KETQUATHI;


---CAU 2 K LAM-------
-----CAU 3----
ALTER TABLE GIAOVIEN ADD CONSTRAINT KT_GTGV CHECK ( GIOITINH='Nam' OR GIOITINH='Nu')
ALTER TABLE HOCVIEN ADD CONSTRAINT KT_GTHV CHECK ( GIOITINH='Nam' OR GIOITINH='Nu')

---CAU 4 -------
ALTER TABLE KETQUATHI ADD CONSTRAINT KT_DIEM CHECK(DIEM>=0 AND DIEM<=10 AND DIEM LIKE('%.__'))

---CAU 5 ----
ALTER TABLE KETQUATHI ADD CONSTRAINT KT_KQ CHECK ((DIEM<5 AND KQUA='Khong Dat') or (DIEM>=5 AND DIEM<=10 AND KQUA ='Dat'))

---CAU 6------
ALTER TABLE KETQUATHI ADD CONSTRAINT KT_LANTHI CHECK ((LANTHI)<=3)

----CAU 7----
ALTER TABLE GIANGDAY ADD CONSTRAINT KT_HK CHECK (HOCKY>=1 AND HOCKY<=3)

---CAU 8-----
ALTER TABLE GIAOVIEN ADD CONSTRAINT KT_HV CHECK (HOCVI='CN' OR HOCVI='KS' OR HOCVI='Ths' OR  HOCVI='TS' OR HOCVI='PTS')


-----NHAP LIEU ----

set dateformat dmy

SELECT *FROM KHOA;

INSERT INTO KHOA VALUES ('KHMT','Khoa hoc may tinh','7/6/2005','GV01')
INSERT INTO KHOA VALUES ('HTTT','He thong thong tin','7/6/2005','GV02')
INSERT INTO KHOA VALUES ('CNPM','Cong nghe phan mem','7/6/2005','GV04')
INSERT INTO KHOA VALUES ('MTT','Mang va truyen thong','20/10/2005','GV03')
INSERT INTO KHOA VALUES ('KTMT','Ky thuat may tinh','20/12/2005','Null')

SELECT *FROM LOP;
INSERT INTO LOP VALUES ('K11','Lop 1 khoa 1','K1108',11,'GV07')
INSERT INTO LOP VALUES ('K12','Lop 2 khoa 1','K1205',12,'GV09')
INSERT INTO LOP VALUES ('K13','Lop 3 khoa 1','K1305',12,'GV14')

SELECT *FROM MONHOC;
INSERT INTO MONHOC VALUES ('THDC','Tin hoc dai cuong',4,1,'KHMT')
INSERT INTO MONHOC VALUES ('CTRR','Cau truc roi rac',5,0,'KHMT')
INSERT INTO MONHOC VALUES ('CSDL','Co so du lieu',3,1,'HTTT')
INSERT INTO MONHOC VALUES ('CTDLGT','Cau truc du lieu va giai thuat',3,1,'KHMT')
INSERT INTO MONHOC VALUES ('PTTKTT','Phan tich thiet ke thuat toan',3,0,'KHMT')
INSERT INTO MONHOC VALUES ('DHMT','Do hoa may tinh',3,1,'KHMT')
INSERT INTO MONHOC VALUES ('KTMT','Kien truc may tinh',3,0,'KTMT')
INSERT INTO MONHOC VALUES ('TKCSDL','Thiet ke co so du lieu',3,1,'HTTT')
INSERT INTO MONHOC VALUES ('PTTKHTTT','Phan tich thiet ke he thong thong tin',4,1,'HTTT')
INSERT INTO MONHOC VALUES ('HDH','He dieu hanh',4,0,'KTMT')
INSERT INTO MONHOC VALUES ('NMCNPM','Nhap mon cong nghe phan mem',3,0,'CNPM')
INSERT INTO MONHOC VALUES ('LTCFW','Lap trinh C for win',3,1,'CNPM')
INSERT INTO MONHOC VALUES ('LTHDT','Lap trinh huong doi tuong',3,1,'CNPM')

SELECT *FROM GIANGDAY;
INSERT INTO GIANGDAY VALUES ('K11','THDC','GV07',1,2006,'2/1/2006','12/5/2006')
INSERT INTO GIANGDAY VALUES ('K12','THDC','GV06',1,2006,'2/1/2006','12/5/2006')
INSERT INTO GIANGDAY VALUES ('K13','THDC','GV15',1,2006,'2/1/2006','12/5/2006')
INSERT INTO GIANGDAY VALUES ('K11','CTRR','GV02',1,2006,'9/1/2006','17/5/2006')
INSERT INTO GIANGDAY VALUES ('K12','CTRR','GV02',1,2006,'9/1/2006','17/5/2006')
INSERT INTO GIANGDAY VALUES ('K13','CTRR','GV08',1,2006,'9/1/2006','17/5/2006')
INSERT INTO GIANGDAY VALUES ('K11','CSDL','GV05',2,2006,'1/6/2006','15/7/2006')
INSERT INTO GIANGDAY VALUES ('K12','CSDL','GV09',2,2006,'1/6/2006','15/7/2006')
INSERT INTO GIANGDAY VALUES ('K13','CTDLGT','GV15',2,2006,'1/6/2006','15/7/2006')
INSERT INTO GIANGDAY VALUES ('K13','CSDL','GV05',3,2006,'1/8/2006','15/12/2006')
INSERT INTO GIANGDAY VALUES ('K13','DHMT','GV07',3,2006,'1/8/2006','15/12/2006')
INSERT INTO GIANGDAY VALUES ('K11','CTDLGT','GV15',3,2006,'1/8/2006','15/12/2006')
INSERT INTO GIANGDAY VALUES ('K12','CTDLGT','GV15',3,2006,'1/8/2006','15/12/2006')
INSERT INTO GIANGDAY VALUES ('K11','HDH','GV04',1,2007,'2/1/2007','18/2/2007')
INSERT INTO GIANGDAY VALUES ('K12','HDH','GV04',1,2007,'2/1/2007','20/3/2007')
INSERT INTO GIANGDAY VALUES ('K11','DHMT','GV07',1,2007,'18/2/2007','20/3/2007')

SELECT *FROM GIAOVIEN;
INSERT INTO GIAOVIEN VALUES('GV01','Ho Thanh Son','PTS','GS','Nam','2/5/1950','11/1/2004',5,2250000,'KHMT')
INSERT INTO GIAOVIEN VALUES('GV02','Tran Tam Thanh','TS','PGS','Nam','17/12/1965','20/4/2004',4.5,2025000,'HTTT')
INSERT INTO GIAOVIEN VALUES('GV03','Do Nghiem Phung','TS','GS','Nu','1/8/1950','23/9/2004',4,1800000,'CNPM')
INSERT INTO GIAOVIEN VALUES('GV04','Tran Nam Son','TS','PGS','Nam','22/2/1961','12/1/2005',4.5,2025000,'KTMT')
INSERT INTO GIAOVIEN VALUES('GV05','Mai Thanh Danh','ThS','GV','Nam','12/3/1958','12/1/2005',3,1350000,'HTTT')
INSERT INTO GIAOVIEN VALUES('GV06','Tran Doan Hung','TS','GV','Nam','11/3/1953','12/1/2005',4.5,2025000,'KHMT')
INSERT INTO GIAOVIEN VALUES('GV07','Nguyen Minh Tien','ThS','GV','Nam','23/11/1971','1/3/2005',4,1800000,'KHMT')
INSERT INTO GIAOVIEN VALUES('GV08','Le Thi Tran','KS','Null','Nu','26/3/1974','1/3/2005',1.69,760500,'KHMT')
INSERT INTO GIAOVIEN VALUES('GV09','Nguyen To Lan','ThS','GV','Nu','31/12/1966','1/3/2005',4,1800000,'HTTT')
INSERT INTO GIAOVIEN VALUES('GV10','Le Tran Anh Loan','KS','Null','Nu','17/7/1972','1/3/2005',1.86,837000,'CNPM')
INSERT INTO GIAOVIEN VALUES('GV11','Ho Thanh Tung','CN','GV','Nam','12/1/1980','15/5/2005',2.67,1201500,'MTT')
INSERT INTO GIAOVIEN VALUES('GV12','Tran Van Anh','CN','Null','Nu','29/3/1981','15/5/2005',1.69,760500,'CNPM')
INSERT INTO GIAOVIEN VALUES('GV13','Nguyen Linh Dan','CN','Null','Nu','23/5/1980','15/5/2005',1.69,760500,'KTMT')
INSERT INTO GIAOVIEN VALUES('GV14','Truong Minh Chau','ThS','GV','Nu','30/11/1976','15/5/2005',3,1350000,'MTT')
INSERT INTO GIAOVIEN VALUES('GV15','Le Ha Thanh','ThS','GV','Nam','4/5/1978','15/5/2005',3,1350000,'KHMT')

SELECT *FROM DIEUKIEN;
INSERT INTO DIEUKIEN VALUES ('CSDL','CTRR')
INSERT INTO DIEUKIEN VALUES ('CSDL','CTDLGT')
INSERT INTO DIEUKIEN VALUES ('CTDLGT','THDC')
INSERT INTO DIEUKIEN VALUES ('PTTKTT','THDC')
INSERT INTO DIEUKIEN VALUES ('PTTKTT','CTDLGT')
INSERT INTO DIEUKIEN VALUES ('DHMT','THDC')
INSERT INTO DIEUKIEN VALUES ('LTHDT','THDC')
INSERT INTO DIEUKIEN VALUES ('PTTKHTTT','CSDL')

SELECT *FROM KETQUATHI;
INSERT INTO KETQUATHI VALUES('K1101','CSDL',1,'20/7/2006',10,'Dat')
INSERT INTO KETQUATHI VALUES('K1101','CTDLGT',1,'28/12/2006',9,'Dat')
INSERT INTO KETQUATHI VALUES('K1101','THDC',1,'20/5/2006',9,'Dat')
INSERT INTO KETQUATHI VALUES('K1101','CTRR',1,'13/5/2006',9.5,'Dat')
INSERT INTO KETQUATHI VALUES('K1102','CSDL',1,'20/7/2006',4,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1102','CSDL',2,'27/7/2006',4.25,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1102','CSDL',3,'10/8/2006',4.5,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1102','CTDLGT',1,'28/12/2006',4.5,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1102','CTDLGT',2,'5/1/2007',4,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1102','CTDLGT',3,'15/1/2007',6,'Dat')
INSERT INTO KETQUATHI VALUES('K1102','THDC',1,'20/5/2006',5,'Dat')
INSERT INTO KETQUATHI VALUES('K1102','CTRR',1,'13/5/2006',7,'Dat')
INSERT INTO KETQUATHI VALUES('K1103','CSDL',1,'20/7/2006',3.5,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1103','CSDL',2,'27/7/2006',8.25,'Dat')
INSERT INTO KETQUATHI VALUES('K1103','CTDLGT',1,'28/12/2006',7,'Dat')
INSERT INTO KETQUATHI VALUES('K1103','THDC',1,'20/5/2006',8,'Dat')
INSERT INTO KETQUATHI VALUES('K1103','CTRR',1,'13/5/2006',6.5,'Dat')
INSERT INTO KETQUATHI VALUES('K1104','CSDL',1,'20/7/2006',3.75,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1104','CTDLGT',1,'28/12/2006',4,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1104','THDC',1,'20/5/2006',4,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1104','CTRR',1,'13/5/2006',4,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1104','CTRR',2,'20/5/2006',3.5,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1104','CTRR',3,'30/6/2006',4,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1201','CSDL',1,'20/7/2006',6,'Dat')
INSERT INTO KETQUATHI VALUES('K1201','CTDLGT',1,'28/12/2006',5,'Dat')
INSERT INTO KETQUATHI VALUES('K1201','THDC',1,'20/5/2006',8.5,'Dat')
INSERT INTO KETQUATHI VALUES('K1201','CTRR',1,'13/5/2006',9,'Dat')
INSERT INTO KETQUATHI VALUES('K1202','CSDL',1,'20/7/2006',8,'Dat')
INSERT INTO KETQUATHI VALUES('K1202','CTDLGT',1,'28/12/2006',4,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1202','CTDLGT',2,'5/1/2007',5,'Dat')
INSERT INTO KETQUATHI VALUES('K1202','THDC',1,'20/5/2006',4,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1202','THDC',2,'27/5/2006',4,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1202','CTRR',1,'13/5/2006',3,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1202','CTRR',2,'20/5/2006',4,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1202','CTRR',3,'30/6/2006',6.25,'Dat')
INSERT INTO KETQUATHI VALUES('K1203','CSDL',1,'20/7/2006',9.25,'Dat')
INSERT INTO KETQUATHI VALUES('K1203','CTDLGT',1,'28/12/2006',9.5,'Dat')
INSERT INTO KETQUATHI VALUES('K1203','THDC',1,'20/5/2006',10,'Dat')
INSERT INTO KETQUATHI VALUES('K1203','CTRR',1,'13/5/2006',10,'Dat')
INSERT INTO KETQUATHI VALUES('K1204','CSDL',1,'20/7/2006',8.5,'Dat')
INSERT INTO KETQUATHI VALUES('K1204','CTDLGT',1,'28/12/2006',6.75,'Dat')
INSERT INTO KETQUATHI VALUES('K1204','THDC',1,'20/5/2006',4,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1204','CTRR',1,'13/5/2006',6,'Dat')
INSERT INTO KETQUATHI VALUES('K1301','CSDL',1,'20/12/2006',4.25,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1301','CTDLGT',1,'25/7/2006',8,'Dat')
INSERT INTO KETQUATHI VALUES('K1301','THDC',1,'20/5/2006',7.75,'Dat')
INSERT INTO KETQUATHI VALUES('K1301','CTRR',1,'13/5/2006',8,'Dat')
INSERT INTO KETQUATHI VALUES('K1302','CSDL',1,'20/12/2006',6.75,'Dat')
INSERT INTO KETQUATHI VALUES('K1302','CTDLGT',1,'25/7/2006',5,'Dat')
INSERT INTO KETQUATHI VALUES('K1302','THDC',1,'20/5/2006',8,'Dat')
INSERT INTO KETQUATHI VALUES('K1302','CTRR',1,'13/5/2006',8.5,'Dat')
INSERT INTO KETQUATHI VALUES('K1303','CSDL',1,'20/12/2006',4,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1303','CTDLGT',1,'25/7/2006',4.5,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1303','CTDLGT',2,'7/8/2006',4,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1303','CTDLGT',3,'15/8/2006',4.25,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1303','THDC',1,'20/5/2006',4.5,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1303','CTRR',1,'13/5/2006',3.25,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1303','CTRR',2,'20/5/2006',5,'Dat')
INSERT INTO KETQUATHI VALUES('K1304','CSDL',1,'20/12/2006',7.75,'Dat')
INSERT INTO KETQUATHI VALUES('K1304','CTDLGT',1,'25/7/2006',9.75,'Dat')
INSERT INTO KETQUATHI VALUES('K1304','THDC',1,'20/5/2006',5.5,'Dat')
INSERT INTO KETQUATHI VALUES('K1304','CTRR',1,'13/5/2006',5,'Dat')
INSERT INTO KETQUATHI VALUES('K1305','CSDL',1,'20/12/2006',9.25,'Dat')
INSERT INTO KETQUATHI VALUES('K1305','CTDLGT',1,'25/7/2006',10,'Dat')
INSERT INTO KETQUATHI VALUES('K1305','THDC',1,'20/5/2006',8,'Dat')
INSERT INTO KETQUATHI VALUES('K1305','CTRR',1,'13/5/2006',10,'Dat')

SELECT *FROM HOCVIEN;
INSERT INTO HOCVIEN VALUES('K1101','Nguyen Van','A','27/1/1986','Nam','TpHCM','K11')
INSERT INTO HOCVIEN VALUES('K1102','Tran Ngoc','Han','14/3/1986','Nu','Kien Giang','K11')
INSERT INTO HOCVIEN VALUES('K1103','Ha Duy','Lap','18/4/1986','Nam','Nghe An','K11')
INSERT INTO HOCVIEN VALUES('K1104','Tran Ngoc','Linh','30/3/1986','Nu','Tay Ninh','K11')
INSERT INTO HOCVIEN VALUES('K1105','Tran Minh','Long','27/2/1986','Nam','TpHCM','K11')
INSERT INTO HOCVIEN VALUES('K1106','Le Nhat','Minh','24/1/1986','Nam','TpHCM','K11')
INSERT INTO HOCVIEN VALUES('K1107','Nguyen Nhu','Nhut','27/1/1986','Nam','Ha Noi','K11')
INSERT INTO HOCVIEN VALUES('K1108','Nguyen Manh','Tam','27/2/1986','Nam','Kien Giang','K11')
INSERT INTO HOCVIEN VALUES('K1109','Phan Thi Thanh','Tam','27/1/1986','Nu','Vinh Long','K11')
INSERT INTO HOCVIEN VALUES('K1110','Le Hoai','Thuong','5/2/1986','Nu','Can Tho','K11')
INSERT INTO HOCVIEN VALUES('K1111','Le Ha','Vinh','25/12/1986','Nam','Vinh Long','K11')
INSERT INTO HOCVIEN VALUES('K1201','Nguyen Van','B','11/2/1986','Nam','TpHCM','K12')
INSERT INTO HOCVIEN VALUES('K1202','Nguyen Thi Kim','Duyen','18/1/1986','Nu','TpHCM','K12')
INSERT INTO HOCVIEN VALUES('K1203','Tran Thi Kim','Duyen','17/9/1986','Nu','TpHCM','K12')
INSERT INTO HOCVIEN VALUES('K1204','Truong My','Hanh','19/5/1986','Nu','Dong Nai','K12')
INSERT INTO HOCVIEN VALUES('K1205','Nguyen Thanh','Nam','17/4/1986','Nam','TpHCM','K12')
INSERT INTO HOCVIEN VALUES('K1206','Nguyen Thi Truc','Thanh','4/3/1986','Nu','Kien Giang','K12')
INSERT INTO HOCVIEN VALUES('K1207','Tran Thi Bich','Thuy','8/2/1986','Nu','Nghe An','K12')
INSERT INTO HOCVIEN VALUES('K1208','Huynh Thi Kim','Trieu','8/4/1986','Nu','Tay Ninh','K12')
INSERT INTO HOCVIEN VALUES('K1209','Pham Thanh','Trieu','23/2/1986','Nam','TpHCM','K12')
INSERT INTO HOCVIEN VALUES('K1210','Ngo Thanh','Tuan','14/2/1986','Nam','TpHCM','K12')
INSERT INTO HOCVIEN VALUES('K1211','Do Thi','Xuan','9/3/1986','Nu','Ha Noi','K12')
INSERT INTO HOCVIEN VALUES('K1212','Le Thi Phi','Yen','12/3/1986','Nu','TpHCM','K12')
INSERT INTO HOCVIEN VALUES('K1301','Nguyen Thi Kim','Cuc','9/6/1986','Nu','Kien Giang','K13')
INSERT INTO HOCVIEN VALUES('K1302','Truong Thi My','Hien','18/3/1986','Nu','Nghe An','K13')
INSERT INTO HOCVIEN VALUES('K1303','Le Duc','Hien','21/3/1986','Nam','Tay Ninh','K13')
INSERT INTO HOCVIEN VALUES('K1304','Le Quang','Hien','18/4/1986','Nam','TpHCM','K13')
INSERT INTO HOCVIEN VALUES('K1305','Le Thi','Huong','27/3/1986','Nu','TpHCM','K13')
INSERT INTO HOCVIEN VALUES('K1306','Nguyen Thai','Huu','30/3/1986','Nam','Ha Noi','K13')
INSERT INTO HOCVIEN VALUES('K1307','Tran Minh','Man','28/5/1986','Nam','TpHCM','K13')
INSERT INTO HOCVIEN VALUES('K1308','Nguyen Hieu','Nghia','8/4/1986','Nam','Kien Giang','K13')
INSERT INTO HOCVIEN VALUES('K1309','Nguyen Trung','Nghia','18/1/1987','Nam','Nghe An','K13')
INSERT INTO HOCVIEN VALUES('K1310','Tran Thi Hong','Tham','22/4/1986','Nu','Tay Ninh','K13')
INSERT INTO HOCVIEN VALUES('K1311','Tran Minh','Thuc','4/4/1986','Nam','TpHCM','K13')
INSERT INTO HOCVIEN VALUES('K1312','Nguyen Thi Kim','Yen','7/9/1986','Nu','TpHCM','K13')


--PHAN 1:
---CAU 11:Học viên ít nhất là 18 tuổi.
ALTER TABLE HOCVIEN ADD CONSTRAINT KT_NGSINH CHECK (YEAR(NGSINH)<'2004');
---CAU 12: Giảng dạy một môn học ngày bắt đầu (TUNGAY) phải nhỏ hơn ngày kết thúc (DENNGAY).
ALTER TABLE GIANGDAY ADD CONSTRAINT KT_NGAYDAY CHECK (TUNGAY<DENNGAY);
---CAU 13: Giáo viên khi vào làm ít nhất là 22 tuổi.
ALTER TABLE GIAOVIEN ADD CONSTRAINT KT_NGSINH2 CHECK (YEAR(NGSINH)<'2000');
---CAU 14: Tất cả các môn học đều có số tín chỉ lý thuyết và tín chỉ thực hành chênh lệch nhau không quá 3.
ALTER TABLE MONHOC ADD CONSTRAINT KT_TINCHI CHECK((TCLT-TCTH)<=3);


---PHAN 3
---CAU 1: In ra danh sách (mã học viên, họ tên, ngày sinh, mã lớp) lớp trưởng của các lớp.
SELECT MAHV,HO,TEN,NGSINH,HOCVIEN.MALOP FROM HOCVIEN INNER JOIN LOP ON HOCVIEN.MALOP=LOP.MALOP WHERE HOCVIEN.MAHV=TRGLOP; 
---CAU2: 	In ra bảng điểm khi thi (mã học viên, họ tên , lần thi, điểm số) môn CTRR của lớp “K12”, sắp xếp theo tên, họ học viên.
SELECT KETQUATHI.MAHV,HO,TEN,LANTHI,DIEM FROM KETQUATHI INNER JOIN HOCVIEN ON HOCVIEN.MAHV=KETQUATHI.MAHV WHERE (MAMH='CTRR' AND MALOP='K12') ORDER BY HO ASC, TEN ASC;
---CAU3:In ra danh sách những học viên (mã học viên, họ tên) và những môn học mà học viên đó thi lần thứ nhất đã đạt.
SELECT HOCVIEN.MAHV,HO,TEN,MAMH FROM HOCVIEN INNER JOIN KETQUATHI ON KETQUATHI.MAHV=HOCVIEN.MAHV WHERE (LANTHI=1 AND KQUA='Dat');
---CAU4:In ra danh sách học viên (mã học viên, họ tên) của lớp “K11” thi môn CTRR không đạt (ở lần thi 1).
SELECT HOCVIEN.MAHV, HO,TEN  FROM HOCVIEN INNER JOIN KETQUATHI ON KETQUATHI.MAHV=HOCVIEN.MAHV WHERE ( MALOP='K11' AND MAMH='CTRR' AND LANTHI=1 AND KQUA='Khong Dat');
---CAU5:* Danh sách học viên (mã học viên, họ tên) của lớp “K” thi môn CTRR không đạt (ở tất cả các lần thi).
SELECT HOCVIEN.MAHV, HO+' '+TEN AS HOTEN FROM KETQUATHI,HOCVIEN WHERE ( KETQUATHI.MAMH=HOCVIEN.MAHV AND MALOP LIKE 'K%' AND MAMH = 'CTRR' AND NOT EXISTS (SELECT *FROM KETQUATHI WHERE MAMH='CTRR' AND KQUA='Dat' and MAHV=HOCVIEN.MAHV))

---PHAN 2 
--CAU 1:Tăng hệ số lương thêm 0.2 cho những giáo viên là trưởng khoa
SELECT *FROM GIAOVIEN;
UPDATE GIAOVIEN SET HESO+=0.2  WHERE MAGV IN ( SELECT TRGKHOA  FROM KHOA );
--CAU2:Cập nhật giá trị điểm trung bình tất cả các môn học  (DIEMTB) của mỗi học viên (tất cả các môn học đều có hệ số 1 và nếu học viên thi một môn nhiều lần, chỉ lấy điểm của lần thi sau cùng).
ALTER TABLE HOCVIEN ADD DIEMTB NUMERIC(4,2);


UPDATE HOCVIEN SET DIEMTB=
(SELECT AVG(DIEM) FROM KETQUATHI
WHERE LANTHI =(SELECT MAX(LANTHI) FROM KETQUATHI WHERE MAHV=HOCVIEN.MAHV GROUP BY MAHV)
GROUP BY MAHV
HAVING MAHV=HOCVIEN.MAHV)


SELECT *FROM HOCVIEN;

--CAU 3: Cập nhật giá trị cho cột GHICHU là “Cam thi” đối với trường hợp: học viên có một môn bất kỳ thi lần thứ 3 dưới 5 điểm.
ALTER TABLE HOCVIEN ADD GHICHU CHAR(40);

UPDATE HOCVIEN SET GHICHU ='CAM THI' WHERE  (MAHV IN (SELECT MAHV FROM KETQUATHI WHERE LANTHI=3 AND DIEM <5 ))

--CAU4: Cập nhật giá trị cho cột XEPLOAI trong quan hệ HOCVIEN như sau:
--	Nếu DIEMTB  9 thì XEPLOAI =”XS”
--=o	Nếu  8  DIEMTB < 9 thì XEPLOAI = “G”
--o	Nếu  6.5  DIEMTB < 8 thì XEPLOAI = “K”
--o	Nếu  5    DIEMTB < 6.5 thì XEPLOAI = “TB”
--o	Nếu  DIEMTB < 5 thì XEPLOAI = ”Y”
ALTER TABLE HOCVIEN ADD XEPLOAI CHAR(40)

UPDATE HOCVIEN SET XEPLOAI =
(
CASE 
WHEN DIEMTB>=9 THEN 'XS'
WHEN (DIEMTB<9 AND DIEMTB>=8 )THEN 'G'
WHEN DIEMTB>=6.5 AND DIEMTB<8 THEN 'K'
WHEN DIEMTB<6.5 AND DIEMTB>=5 THEN 'TB' 
WHEN DIEMTB<5 THEN'Y'
END
)

--phan 3: 
--cau 6: Tìm tên những môn học mà giáo viên có tên “Tran Tam Thanh” dạy trong học kỳ 1 năm 2006.
select DISTINCT TENMH FROM MONHOC 
INNER JOIN (GIANGDAY
INNER JOIN GIAOVIEN ON GIAOVIEN.MAGV=GIANGDAY.MAGV) 
ON MONHOC.MAMH=GIANGDAY.MAMH 
WHERE HOTEN='Tran Tam Thanh' and HOCKY=1 and NAM=2006;

--cau7:Tìm những môn học (mã môn học, tên môn học) mà giáo viên chủ nhiệm lớp “K11” dạy trong học kỳ 1 năm 2006.
select MONHOC.MAMH,TENMH FROM MONHOC
INNER JOIN (GIAOVIEN
INNER JOIN (  GIANGDAY INNER JOIN LOP ON GIANGDAY.MALOP=LOP.MALOP  )
ON GIAOVIEN.MAGV=GIANGDAY.MAGV) 
ON MONHOC.MAMH=GIANGDAY.MAMH 
WHERE (HOCKY=1 and NAM =2006 AND GIAOVIEN.MAGV IN (SELECT MAGVCN FROM LOP WHERE MALOP='K11' ))

--CAU8:Tìm họ tên lớp trưởng của các lớp mà giáo viên có tên “Nguyen To Lan” dạy môn “Co So Du Lieu”.

SELECT HO +' '+TEN AS HOTEN FROM HOCVIEN 
	INNER JOIN( LOP 
		INNER JOIN ( GIAOVIEN 
			INNER JOIN (MONHOC 
				INNER JOIN GIANGDAY 
				ON MONHOC.MAMH=GIANGDAY.MAMH)
			ON GIAOVIEN.MAGV=GIANGDAY.MAGV)
		ON  LOP.MALOP=GIANGDAY.MALOP)
	ON HOCVIEN.MALOP=LOP.MALOP
WHERE (HOTEN='Nguyen To Lan' and TENMH='Co So Du Lieu' and MAHV IN (SELECT TRGLOP FROM LOP ))

--CAU9:In ra danh sách những môn học (mã môn học, tên môn học) phải học liền trước môn “Co So Du Lieu”.
SELECT MONHOC.MAMH,TENMH FROM MONHOC INNER JOIN DIEUKIEN ON DIEUKIEN.MAMH=MONHOC.MAMH 
WHERE (MAMH_TRUOC IN (SELECT MAMH FROM MONHOC WHERE TENMH='Co So Du Lieu'))

--cau 10:	Môn “Cau Truc Roi Rac” là môn bắt buộc phải học liền trước những môn học (mã môn học, tên môn học) nào.
SELECT MONHOC.MAMH,TENMH FROM MONHOC INNER JOIN DIEUKIEN ON DIEUKIEN.MAMH=MONHOC.MAMH 
WHERE (MAMH_TRUOC IN (SELECT MAMH FROM MONHOC WHERE TENMH='Cau Truc Roi Rac'))


--CAU11: Tìm họ tên giáo viên dạy môn CTRR cho cả hai lớp “K11” và “K12” trong cùng học kỳ 1 năm 2006.
(SELECT HOTEN FROM GIAOVIEN INNER JOIN GIANGDAY ON GIANGDAY.MAGV=GIAOVIEN.MAGV WHERE MALOP='K11' AND NAM=2006 )
INTERSECT 
(SELECT HOTEN FROM GIAOVIEN INNER JOIN GIANGDAY ON GIANGDAY.MAGV=GIAOVIEN.MAGV WHERE MALOP='K12' AND NAM=2006 )

--CAU 12:Tìm những học viên (mã học viên, họ tên) thi không đạt môn CSDL ở lần thi thứ 1 nhưng chưa thi lại môn này.

SELECT HOCVIEN.MAHV,HO+' '+TEN AS HOTEN FROM HOCVIEN INNER JOIN KETQUATHI ON KETQUATHI.MAHV = HOCVIEN.MAHV 
WHERE 
((MAMH='CSDL' AND LANTHI=1 AND KQUA='Khong Dat')
and HOCVIEN.MAHV NOT IN
(SELECT MAHV FROM KETQUATHI WHERE MAMH='CSDL' AND LANTHI=2))

--CAU13:Tìm giáo viên (mã giáo viên, họ tên) không được phân công giảng dạy bất kỳ môn học nào.
SELECT MAGV,HOTEN FROM GIAOVIEN WHERE MAGV NOT IN (SELECT MAGV  FROM GIANGDAY )

--CAU14: Tìm giáo viên (mã giáo viên, họ tên) không được phân công giảng dạy bất kỳ môn học nào thuộc khoa giáo viên đó phụ trách.
SELECT MAGV, HOTEN FROM GIAOVIEN WHERE NOT EXISTS 
(
		SELECT* FROM MONHOC WHERE GIAOVIEN.MAKHOA=MONHOC.MAKHOA AND NOT EXISTS 
		( 
			SELECT *FROM GIANGDAY WHERE GIANGDAY.MAMH=MONHOC.MAMH AND GIANGDAY.MAGV=GIAOVIEN.MAGV
		)
)

--CAU 15:	Tìm họ tên các học viên thuộc lớp “K11” thi một môn bất kỳ quá 3 lần vẫn “Khong dat” hoặc thi lần thứ 2 môn CTRR được 5 điểm.
SELECT DISTINCT HO+' '+TEN AS HOTEN FROM HOCVIEN,KETQUATHI WHERE (HOCVIEN.MAHV=KETQUATHI.MAHV AND HOCVIEN.MALOP ='K11' AND ((LANTHI=2 AND MAMH='CTRR' AND DIEM=5) 
OR EXISTS (SELECT DISTINCT *FROM HOCVIEN, KETQUATHI WHERE HOCVIEN.MAHV=KETQUATHI.MAHV AND KQUA='Khong Dat')))

--CAU16: Tìm họ tên giáo viên dạy môn CTRR cho ít nhất hai lớp trong cùng một học kỳ của một năm học.
SELECT HOTEN FROM GIAOVIEN,GIANGDAY WHERE GIANGDAY.MAGV=GIAOVIEN.MAGV AND MAMH='CTRR'  GROUP BY HOTEN,HOCKY,GIAOVIEN.MAGV HAVING COUNT(*)>=2

--CAU17: 	Danh sách học viên và điểm thi môn CSDL (chỉ lấy điểm của lần thi sau cùng).

SELECT HO+' ' +TEN  AS HOTEN,DIEM  FROM HOCVIEN , KETQUATHI WHERE HOCVIEN.MAHV=KETQUATHI.MAHV AND MAMH='CSDL' AND LANTHI =(SELECT MAX(LANTHI) FROM KETQUATHI WHERE MAHV=HOCVIEN.MAHV AND MAMH='CSDL' GROUP BY MAHV)

--CAU 18:Danh sách học viên và điểm thi môn “Co So Du Lieu” (chỉ lấy điểm cao nhất của các lần thi).

SELECT HO+' ' +TEN  AS HOTEN,DIEM  FROM HOCVIEN , KETQUATHI WHERE HOCVIEN.MAHV=KETQUATHI.MAHV AND MAMH='CSDL' AND DIEM =(SELECT MAX(DIEM) FROM KETQUATHI WHERE MAHV=HOCVIEN.MAHV AND MAMH='CSDL' GROUP BY MAHV)


----PHAN3-BTH4
--19.	Khoa nào (mã khoa, tên khoa) được thành lập sớm nhất.
SELECT MAKHOA,TENKHOA 
FROM KHOA
WHERE NGTLAP IN
(
	SELECT TOP 1 NGTLAP
	FROM KHOA 
	ORDER BY NGTLAP ASC
)

--20.	Có bao nhiêu giáo viên có học hàm là “GS” hoặc “PGS”.
SELECT COUNT(DISTINCT MAGV)
FROM GIAOVIEN
WHERE HOCHAM IN('GS','PGS') 



--21.	Thống kê có bao nhiêu giáo viên có học vị là “CN”, “KS”, “Ths”, “TS”, “PTS” trong mỗi khoa.
SELECT MAKHOA,HOCVI, COUNT(DISTINCT MAGV) AS SOLUONG
FROM GIAOVIEN
WHERE HOCVI IN ('CN','KS','Ths','TS','PTS')  
GROUP BY MAKHOA, HOCVI



--22.	Mỗi môn học thống kê số lượng học viên theo kết quả (đạt và không đạt).
SELECT MAMH,KQUA, COUNT (DISTINCT MAHV) AS SOLUONG
FROM KETQUATHI
GROUP BY MAMH,KQUA


--23.	Tìm giáo viên (mã giáo viên, họ tên) là giáo viên chủ nhiệm của một lớp, đồng thời dạy cho lớp đó ít nhất một môn học.
SELECT DISTINCT GIAOVIEN.MAGV,HOTEN
FROM GIAOVIEN,LOP,GIANGDAY
WHERE GIAOVIEN.MAGV=MAGVCN AND GIAOVIEN.MAGV=GIANGDAY.MAGV


--24.	Tìm họ tên lớp trưởng của lớp có sỉ số cao nhất.
SELECT HO+' '+TEN AS HOTEN
FROM HOCVIEN,LOP
WHERE MAHV=TRGLOP AND SISO IN
(
	SELECT TOP 1 SISO
	FROM HOCVIEN,LOP
	ORDER BY SISO DESC
)

--25.	* Tìm họ tên những LOPTRG thi không đạt quá 3 môn (mỗi môn đều thi không đạt ở tất cả các lần thi).
SELECT HO+' '+TEN AS HOTEN
FROM HOCVIEN,LOP,KETQUATHI
WHERE (HOCVIEN.MAHV=TRGLOP AND HOCVIEN.MAHV=KETQUATHI.MAHV AND  KQUA='Khong Dat')
GROUP BY HO,TEN,TRGLOP
HAVING COUNT(*)>3-------------------////

--26.	Tìm học viên (mã học viên, họ tên) có số môn đạt điểm 9,10 nhiều nhất.
SELECT MAHV,HO+' '+TEN AS HOTEN
FROM HOCVIEN
WHERE  MAHV IN 
(
	SELECT TOP 1 MAHV
	FROM KETQUATHI
	WHERE DIEM >=9
	GROUP BY MAHV
	ORDER BY COUNT(MAHV) DESC
)

--27.	Trong từng lớp, tìm học viên (mã học viên, họ tên) có số môn đạt điểm 9,10 nhiều nhất.
SELECT MALOP, MAHV,  HOTEN
FROM(
	SELECT KETQUATHI.MAHV,HO+' '+TEN AS HOTEN ,LOP.MALOP,RANK() OVER (PARTITION BY LOP.MALOP ORDER BY COUNT(*) DESC) AS THUTU
	FROM KETQUATHI,LOP,HOCVIEN
	WHERE DIEM>=9 AND HOCVIEN.MAHV=KETQUATHI.MAHV AND LOP.MALOP=HOCVIEN.MALOP
	GROUP BY KETQUATHI.MAHV,LOP.MALOP,HO,TEN
)
AS A
WHERE A.THUTU=1;


----RANK() OVER (
----    [PARTITION BY partition_expression, ... ]
----   ORDER BY sort_expression [ASC | DESC], ...
)
--28.	Trong từng học kỳ của từng năm, mỗi giáo viên phân công dạy bao nhiêu môn học, bao nhiêu lớp.
SELECT NAM,HOCKY,MAGV,COUNT(DISTINCT MALOP) AS SOLUONG_LOP,COUNT(DISTINCT MAMH) AS SPLUONG_MH
FROM GIANGDAY
GROUP BY NAM,HOCKY,MAGV

--29.	Trong từng học kỳ của từng năm, tìm giáo viên (mã giáo viên, họ tên) giảng dạy nhiều nhất.
SELECT NAM,HOCKY,A.MAGV,HOTEN
FROM 
(
	SELECT NAM,HOCKY,HOTEN , GIANGDAY.MAGV,COUNT(GIANGDAY.MAGV) AS COUNTGIAOVIEN,RANK() OVER (PARTITION BY  HOCKY ORDER BY COUNT(*) DESC ) AS XEPHANG
	FROM GIANGDAY,GIAOVIEN
	WHERE GIANGDAY.MAGV=GIAOVIEN.MAGV
	GROUP BY NAM,HOCKY,GIANGDAY.MAGV,HOTEN
) 
AS A
WHERE A.XEPHANG=1
ORDER BY NAM,HOCKY ASC


--30.	Tìm môn học (mã môn học, tên môn học) có nhiều học viên thi không đạt (ở lần thi thứ 1) nhất.
SELECT MAMH,TENMH
FROM MONHOC
WHERE MAMH IN 
(
	SELECT MAMH 
	FROM KETQUATHI
	WHERE KQUA='Khong Dat' AND LANTHI=1
	group by MAMH
	HAVING COUNT(KQUA)>=2
)



--31.	Tìm học viên (mã học viên, họ tên) thi môn nào cũng đạt (chỉ xét lần thi thứ 1).
SELECT KETQUATHI.MAHV,HO+' '+TEN AS HOTEN
FROM HOCVIEN,KETQUATHI
WHERE KETQUATHI.MAHV=HOCVIEN.MAHV

EXCEPT
	(SELECT DISTINCT HOCVIEN.MAHV ,HO+' '+TEN AS HOTEN
	FROM KETQUATHI,HOCVIEN
	WHERE KETQUATHI.MAHV=HOCVIEN.MAHV AND LANTHI=1 AND KQUA='Khong Dat')



--32.	* Tìm học viên (mã học viên, họ tên) thi môn nào cũng đạt (chỉ xét lần thi sau cùng).
SELECT KETQUATHI.MAHV,HO+' '+TEN AS HOTEN
FROM HOCVIEN,KETQUATHI
WHERE HOCVIEN.MAHV=KETQUATHI.MAHV
EXCEPT
(
	SELECT KETQUATHI.MAHV, HO+' '+TEN AS HOTEN
	FROM HOCVIEN,KETQUATHI 
	WHERE HOCVIEN.MAHV=KETQUATHI.MAHV AND KQUA='Khong Dat' AND LANTHI=(SELECT MAX(LANTHI) FROM KETQUATHI WHERE MaHV = HOCVIEN.MAHV GROUP BY MAHV)
	GROUP BY KETQUATHI.MAHV,HO,TEN
)


--33.	* Tìm học viên (mã học viên, họ tên) đã thi tất cả các môn đều đạt (chỉ xét lần thi thứ 1

SELECT MAHV,HO+' '+TEN AS HOTEN
FROM HOCVIEN
WHERE NOT EXISTS 
(
	SELECT 
	*FROM MONHOC
	WHERE NOT EXISTS 
	(
		SELECT 
		*FROM KETQUATHI
		WHERE  
			KETQUATHI.MAMH=MONHOC.MAMH AND 
			KETQUATHI.MAHV=HOCVIEN.MAHV  AND 
			LANTHI=1 AND 
			KQUA='Dat'
	)
)




--34.	* Tìm học viên (mã học viên, họ tên) đã thi tất cả các môn đều đạt  (chỉ xét lần thi sau cùng).
SELECT MAHV,HO+' '+TEN AS HOTEN
FROM HOCVIEN
WHERE NOT EXISTS 
(
	SELECT 
	*FROM MONHOC
	WHERE NOT EXISTS 
	(
		
			SELECT 
			*FROM KETQUATHI 
			WHERE
				HOCVIEN.MAHV=KETQUATHI.MAHV 
				AND KETQUATHI.MAMH=MONHOC.MAMH
				AND KQUA='Dat' 
				AND LANTHI=(SELECT MAX(LANTHI) FROM KETQUATHI WHERE MaHV = HOCVIEN.MAHV GROUP BY MAHV)
	)
)

--35.	** Tìm học viên (mã học viên, họ tên) có điểm thi cao nhất trong từng môn (lấy điểm ở lần thi sau cùng).
SELECT DISTINCT MAHV, HOTEN,MAMH 
FROM 
(
	SELECT MAMH,HOCVIEN.MAHV,HO+' '+TEN AS HOTEN, RANK() OVER (PARTITION BY MAMH ORDER BY MAX(DIEM) DESC) AS THUTU
	FROM KETQUATHI,HOCVIEN
	WHERE HOCVIEN.MAHV=KETQUATHI.MAHV AND LANTHI=(SELECT MAX(LANTHI) FROM KETQUATHI WHERE MaHV = HOCVIEN.MAHV GROUP BY MAHV)
	GROUP BY MAMH,HOCVIEN.MAHV,HO,TEN
) 
AS A
WHERE A.THUTU=1;



---Phan1: trigger


--9.	Lớp trưởng của một lớp phải là học viên của lớp đó.
GO
CREATE TRIGGER TRG_IN_UD_LOP ON LOP
--DROP TRIGGER TRG_IN_UD_LOP
FOR INSERT, UPDATE 
AS
BEGIN
	IF(EXISTS (
		SELECT *FROM INSERTED AS A INNER JOIN HOCVIEN ON A.MALOP=HOCVIEN.MALOP 
		WHERE TRGLOP=MAHV
	))
	BEGIN 
		PRINT 'THONG TIN CHINH XAC'
	END
	ELSE
	BEGIN
		PRINT 'LOI: THONG TIN TRUONG LOP SAI'
		ROLLBACK
	END
END

UPDATE LOP
SET TRGLOP='K1205'
WHERE MALOP='K13'
--SELECT *FROM LOP


CREATE TRIGGER TRG_UP_HOCVIEN ON HOCVIEN
FOR UPDATE
AS 
BEGIN
	IF(EXISTS (
		SELECT *FROM INSERTED AS A INNER JOIN LOP ON A.MALOP=LOP.MALOP
		WHERE A.MAHV=LOP.TRGLOP AND A.MALOP=LOP.MALOP
	))
	BEGIN 
		PRINT ' THONG TIN HOC VIEN CHINH XAC'
	END
	ELSE
	BEGIN
		PRINT 'LOI: THONG TIN HOC VIEN SAI'
		ROLLBACK
	END
END



--10.	Trưởng khoa phải là giáo viên thuộc khoa và có học vị “TS” hoặc “PTS”.
--DROP TRIGGER TRG_IN_UD_KHOA 

CREATE TRIGGER TRG_IN_UD_KHOA ON KHOA
FOR INSERT,UPDATE
AS
BEGIN
	IF(EXISTS(
		SELECT *FROM INSERTED AS A INNER JOIN GIAOVIEN ON A.MAKHOA=GIAOVIEN.MAKHOA
		WHERE A.TRGKHOA=GIAOVIEN.MAGV AND HOCVI IN ('TS','PTS') 
	))
	BEGIN 
		PRINT 'THONG TIN KHOA CHINH XAC'
	END
	ELSE 
	BEGIN
		PRINT 'LOI : THONG TIN KHOA SAI'
		ROLLBACK
	END
END


--UPDATE KHOA
--SET TRGKHOA = 'GV01'
--WHERE MAKHOA='KHMT'
--SELECT*FROM KHOA

--DROP TRIGGER TRG_UD_GIAOVIEN

CREATE TRIGGER TRG_UD_GIAOVIEN ON GIAOVIEN
FOR UPDATE
AS 
BEGIN
	IF(EXISTS (
		SELECT *FROM INSERTED AS A, KHOA WHERE (A.MAKHOA<>KHOA.MAKHOA OR A.HOCVI  NOT IN ('TS','PTS')) AND A.MAGV=KHOA.TRGKHOA
	))	
	BEGIN
		PRINT ' LOI GIAO VIEN'
		ROLLBACK
	END 
END
--select*from KHOA
--UPDATE GIAOVIEN
--SET MAKHOA = 'KHMT'
--WHERE MAGV='GV15'


--15.	Học viên chỉ được thi một môn học nào đó khi lớp của học viên đã học xong môn học này.

CREATE TRIGGER TRG_UP_GIANGDAY ON GIANGDAY
FOR UPDATE
AS
BEGIN
	IF(EXISTS (
		SELECT *FROM INSERTED AS A ,KETQUATHI WHERE KETQUATHI.MAMH=A.MAMH AND (NGTHI<DENNGAY)
	))
	BEGIN
		PRINT ' LOI NGAY GIANG DAY'
		ROLLBACK
	END
END

--UPDATE GIANGDAY
--SET DENNGAY ='5/12/2006'
--WHERE MALOP='K11' AND MAMH='THDC'
--SELECT *FROM GIANGDAY


--DROP TRIGGER TRG_INS_UP_KQT
CREATE TRIGGER TRG_INS_UP_KQT ON KETQUATHI
FOR INSERT,UPDATE
AS
BEGIN
	IF(EXISTS (
		SELECT *FROM INSERTED AS A,GIANGDAY , LOP, HOCVIEN
		WHERE A.MAMH=GIANGDAY.MAMH  AND  NGTHI<DENNGAY
	))
	BEGIN
		PRINT ' LOI KETQUATHI -- NGAYTHI'
		ROLLBACK
	END
END

set dateformat dmy
--chua ra kq
UPDATE KETQUATHI 
SET NGTHI = '20/7/2006'
WHERE MAMH='CSDL' AND MAHV='K1101'

SELECT *FROM KETQUATHI

--16.	Mỗi học kỳ của một năm học, một lớp chỉ được học tối đa 3 môn.

create TRIGGER TRG_INS_UP_GIANGDAY ON GIANGDAY
FOR INSERT,UPDATE 
AS
BEGIN
	IF(EXISTS (
		SELECT *FROM INSERTED AS A , LOP WHERE A.MALOP=LOP.MALOP 
		HAVING COUNT (DISTINCT MAMH)>3
		
	))
	BEGIN 
		PRINT 'LOI: GIANG DAY'
	END
END


--17.	Sỉ số của một lớp bằng với số lượng học viên thuộc lớp đó.

CREATE TRIGGER TRG_IN_UP_DE_HOCVIEN ON HOCVIEN
FOR INSERT,UPDATE,DELETE 
AS
BEGIN
	IF(EXISTS(
		SELECT *FROM INSERTED AS A, LOP WHERE A.MALOP=LOP.MALOP GROUP BY SISO
		HAVING COUNT(DISTINCT A.MAHV)!=LOP.SISO
		
	))
	BEGIN 
		PRINT 'LOI HOCVIEN '
	END
END
-----------------
CREATE TRIGGER TRG_UP_LOP ON LOP
FOR UPDATE
AS
BEGIN
	IF(EXISTS(
		SELECT *FROM INSERTED AS A, HOCVIEN WHERE A.MALOP=HOCVIEN.MALOP GROUP BY SISO
		HAVING SISO!=COUNT (DISTINCT MAHV)
	))
	BEGIN	PRINT 'LOI SI SO LOP'
	END
END

--18.	Trong quan hệ DIEUKIEN giá trị của thuộc tính MAMH và MAMH_TRUOC trong cùng một bộ không được giống nhau (“A”,”A”) và cũng không tồn tại hai bộ (“A”,”B”) và (“B”,”A”).

CREATE TRIGGER TRG_IN_UP_DK ON DIEUKIEN
FOR INSERT,UPDATE 
AS
BEGIN
	IF(EXISTS(
		SELECT *FROM INSERTED AS A , DIEUKIEN WHERE A.MAMH=DIEUKIEN.MAMH AND  A.MAMH=A.MAMH_TRUOC OR 
	))
END



--19.	Các giáo viên có cùng học vị, học hàm, hệ số lương thì mức lương bằng nhau.
--20.	Học viên chỉ được thi lại (lần thi >1) khi điểm của lần thi trước đó dưới 5.
--21.	Ngày thi của lần thi sau phải lớn hơn ngày thi của lần thi trước (cùng học viên, cùng môn học).
--22.	Học viên chỉ được thi những môn mà lớp của học viên đó đã học xong.
--23.	Khi phân công giảng dạy một môn học, phải xét đến thứ tự trước sau giữa các môn học (sau khi học xong những môn học phải học trước mới được học những môn liền sau).
--24.	Giáo viên chỉ được phân công dạy những môn thuộc khoa giáo viên đó phụ trách.



