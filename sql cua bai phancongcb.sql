USE [master]
GO
/****** Object:  Database [quanLyCoiThiChamThi2]    Script Date: 23/10/2021 16:13:37 ******/
CREATE DATABASE [quanLyCoiThiChamThi2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'quanLyCoiThiChamThi2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\quanLyCoiThiChamThi2.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'quanLyCoiThiChamThi2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\quanLyCoiThiChamThi2_log.ldf' , SIZE = 784KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [quanLyCoiThiChamThi2] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [quanLyCoiThiChamThi2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [quanLyCoiThiChamThi2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [quanLyCoiThiChamThi2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [quanLyCoiThiChamThi2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [quanLyCoiThiChamThi2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [quanLyCoiThiChamThi2] SET ARITHABORT OFF 
GO
ALTER DATABASE [quanLyCoiThiChamThi2] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [quanLyCoiThiChamThi2] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [quanLyCoiThiChamThi2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [quanLyCoiThiChamThi2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [quanLyCoiThiChamThi2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [quanLyCoiThiChamThi2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [quanLyCoiThiChamThi2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [quanLyCoiThiChamThi2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [quanLyCoiThiChamThi2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [quanLyCoiThiChamThi2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [quanLyCoiThiChamThi2] SET  ENABLE_BROKER 
GO
ALTER DATABASE [quanLyCoiThiChamThi2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [quanLyCoiThiChamThi2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [quanLyCoiThiChamThi2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [quanLyCoiThiChamThi2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [quanLyCoiThiChamThi2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [quanLyCoiThiChamThi2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [quanLyCoiThiChamThi2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [quanLyCoiThiChamThi2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [quanLyCoiThiChamThi2] SET  MULTI_USER 
GO
ALTER DATABASE [quanLyCoiThiChamThi2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [quanLyCoiThiChamThi2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [quanLyCoiThiChamThi2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [quanLyCoiThiChamThi2] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [quanLyCoiThiChamThi2]
GO
/****** Object:  StoredProcedure [dbo].[sp_baoCaoTienCongTheoHoiDong]    Script Date: 23/10/2021 16:13:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_baoCaoTienCongTheoHoiDong]
@id int
as
select tblCanBo.iMaCanBo as N'Mã CB/GV',
 tblcanbo.sTenGiangVien as N'Tên Cán Bộ/Giảng Viên',sum(iTienCong) as N'Tiền Công' from 
tblPhongHoc, tblCaThi, tblCanBo, tblPhanCongCanBo where tblCanBo.iMaCanBo = tblPhanCongCanBo.iMaCanBo and tblPhanCongCanBo.iMaCa = tblCaThi.iMaCaThi and tblPhanCongCanBo.iMaPhongHoc = tblPhongHoc.iMaPhongHoc
and tblPhanCongCanBo.iMaHoiDong = @id group by tblCanBo.iMaCanBo,tblcanbo.sTenGiangVien

GO
/****** Object:  StoredProcedure [dbo].[sp_danhSachPhanCongCanBoTheoNgay]    Script Date: 23/10/2021 16:13:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_danhSachPhanCongCanBoTheoNgay]
@ngay date
as
select ROW_NUMBER() OVER (ORDER BY tblPhanCongCanBo.iMaPhanCong) AS  STT,tblPhanCongCanBo.iMaPhanCong,--tblPhanCongCanBo.iMaCanBo,tblPhanCongCanBo.iMaHoiDong,
 tblcanbo.sTenGiangVien as N'Tên Cán Bộ/Giảng Viên', tblPhanCongCanBo.dNgay  as N'Ngày' ,tblPhongHoc.sTenPhong  as N'Phòng' , tblCaThi.sTenCaThi  as N'Ca' ,iTienCong as N'Tiền Công' from 
tblPhongHoc, tblCaThi, tblCanBo, tblPhanCongCanBo where tblCanBo.iMaCanBo = tblPhanCongCanBo.iMaCanBo and tblPhanCongCanBo.iMaCa = tblCaThi.iMaCaThi and tblPhanCongCanBo.iMaPhongHoc = tblPhongHoc.iMaPhongHoc
and tblPhanCongCanBo.dNgay = @ngay

GO
/****** Object:  StoredProcedure [dbo].[sp_danhSachPhanCongTheoHoiDong]    Script Date: 23/10/2021 16:13:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_danhSachPhanCongTheoHoiDong]
@id int
as
select ROW_NUMBER() OVER (ORDER BY tblPhanCongCanBo.iMaPhanCong) AS  STT,tblPhanCongCanBo.iMaPhanCong,--tblPhanCongCanBo.iMaCanBo,tblPhanCongCanBo.iMaHoiDong,
 tblcanbo.sTenGiangVien as N'Tên Cán Bộ/Giảng Viên', tblPhanCongCanBo.dNgay  as N'Ngày' ,tblPhongHoc.sTenPhong  as N'Phòng' , tblCaThi.sTenCaThi  as N'Ca' ,iTienCong as N'Tiền Công' from 
tblPhongHoc, tblCaThi, tblCanBo, tblPhanCongCanBo where tblCanBo.iMaCanBo = tblPhanCongCanBo.iMaCanBo and tblPhanCongCanBo.iMaCa = tblCaThi.iMaCaThi and tblPhanCongCanBo.iMaPhongHoc = tblPhongHoc.iMaPhongHoc

and tblPhanCongCanBo.iMaHoiDong = @id

GO
/****** Object:  StoredProcedure [dbo].[sp_danhSachPhanCongTheoHoiDong_]    Script Date: 23/10/2021 16:13:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_danhSachPhanCongTheoHoiDong_]
@id int
as
select ROW_NUMBER() OVER (ORDER BY tblPhanCongCanBo.iMaPhanCong) AS  STT,tblPhanCongCanBo.iMaPhanCong,--tblPhanCongCanBo.iMaCanBo,tblPhanCongCanBo.iMaHoiDong,
 tblcanbo.sTenGiangVien as N'Tên Cán Bộ/Giảng Viên', tblPhanCongCanBo.dNgay  as N'Ngày' ,tblPhongHoc.sTenPhong  as N'Phòng' , tblCaThi.sTenCaThi  as N'Ca' ,iTienCong as N'Tiền Công' from 
tblPhongHoc, tblCaThi, tblCanBo, tblPhanCongCanBo where tblCanBo.iMaCanBo = tblPhanCongCanBo.iMaCanBo and tblPhanCongCanBo.iMaCa = tblCaThi.iMaCaThi and tblPhanCongCanBo.iMaPhongHoc = tblPhongHoc.iMaPhongHoc
and tblPhanCongCanBo.iMaCanBo = @id

GO
/****** Object:  StoredProcedure [dbo].[sp_danhSachTienCongTheoHoiDong]    Script Date: 23/10/2021 16:13:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[sp_danhSachTienCongTheoHoiDong]
@id int
as
select tblCanBo.iMaCanBo as N'Mã CB/GV',
 tblcanbo.sTenGiangVien as N'Tên Cán Bộ/Giảng Viên',sum(iTienCong) as N'Tiền Công' from 
tblPhongHoc, tblCaThi, tblCanBo, tblPhanCongCanBo where tblCanBo.iMaCanBo = tblPhanCongCanBo.iMaCanBo and tblPhanCongCanBo.iMaCa = tblCaThi.iMaCaThi and tblPhanCongCanBo.iMaPhongHoc = tblPhongHoc.iMaPhongHoc
and tblPhanCongCanBo.iMaHoiDong = @id group by tblCanBo.iMaCanBo,tblcanbo.sTenGiangVien

GO
/****** Object:  StoredProcedure [dbo].[sp_dsCanBo]    Script Date: 23/10/2021 16:13:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_dsCanBo]
as
select  ROW_NUMBER() OVER (ORDER BY iMaCanBo) AS  STT,iMaCanBo,sTenGiangVien as N'Tên Giảng Viên', sSoDienThoai as N'Số Điện Thoại', sEmail as N'Email' , sDiaChi as N'Địa Chỉ' 
from tblCanBo

GO
/****** Object:  StoredProcedure [dbo].[sp_dsCanBoTheoHoiDong]    Script Date: 23/10/2021 16:13:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_dsCanBoTheoHoiDong]
@id int
as
select ROW_NUMBER() OVER (ORDER BY tblPhanCongCanBo.iMaPhanCong) AS  STT,tblPhanCongCanBo.iMaCanBo,tblPhanCongCanBo.iMaHoiDong, tblcanbo.sTenGiangVien as N'Tên Cán Bộ/Giảng Viên', tblPhanCongCanBo.dNgay  as N'Ngày' ,tblPhongHoc.sTenPhong  as N'Phòng' , tblCaThi.sTenCaThi  as N'Ca' ,iTienCong as N'Tiền Công' from 
tblPhongHoc, tblCaThi, tblCanBo, tblPhanCongCanBo where tblCanBo.iMaCanBo = tblPhanCongCanBo.iMaCanBo and tblPhanCongCanBo.iMaCa = tblCaThi.iMaCaThi
and tblPhanCongCanBo.iMaCanBo = @id


GO
/****** Object:  StoredProcedure [dbo].[sp_dsHoiDong]    Script Date: 23/10/2021 16:13:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_dsHoiDong]  
as
select ROW_NUMBER() OVER (ORDER BY  a.iMaHoiDong) AS  STT, a.iMaHoiDong, a.stenhoidong as N'Tên Hội Đồng',IIF(a.bloaihoidong = 1, N'Coi Thi',N'Chấm Thi' ) as N'Loại Hội Đồng',a.dNgayBatDau  as N'Từ Ngày',a.dngayketthuc as N'Đến Ngày',a.dThoiGianTao  as N'Ngày Tạo', b.stengiangvien as N'Chủ Tịch', c.stengiangvien as N'Giám Sát', d.stengiangvien as N'Thư Ký'
 from 
(
(select  bLoaiHoiDong , dThoiGianTao, dNgayBatDau , dNgayKetThuc , iMaHoiDong, stenhoidong from tblHoiDong) a inner join
(select iMaHoiDong, sTenGiangVien from tblHoiDong, tblCanBo where tblHoiDong.iChuTich = tblCanBo.iMaCanBo) b on a.iMaHoiDong = b.iMaHoiDong
inner join 
(select iMaHoiDong, sTenGiangVien from tblHoiDong, tblCanBo where tblHoiDong.iGiamSat = tblCanBo.iMaCanBo) c on a.iMaHoiDong = c.iMaHoiDong
inner join
(select iMaHoiDong, sTenGiangVien from tblHoiDong, tblCanBo where tblHoiDong.iThuKy = tblCanBo.iMaCanBo) d on a.iMaHoiDong = d.iMaHoiDong
)


GO
/****** Object:  StoredProcedure [dbo].[sp_dsPhongHoc]    Script Date: 23/10/2021 16:13:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[sp_dsPhongHoc]
as
select  ROW_NUMBER() OVER (ORDER BY  iMaPhongHoc) AS  STT,iMaPhongHoc,sTenPhong as N'Tên Phòng' from tblPhongHoc

GO
/****** Object:  StoredProcedure [dbo].[sp_kiemTraPhanCongCanBo]    Script Date: 23/10/2021 16:13:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_kiemTraPhanCongCanBo]
@maphong int,
@macanbo int,
@maca int,
@ngay date,
@mahoidong int
as
select * from tblPhanCongCanBo where iMaCanBo =  @macanbo and iMaPhongHoc = @maphong and 
iMaHoiDong = @mahoidong and iMaCa = @maca and dNgay = @ngay

GO
/****** Object:  StoredProcedure [dbo].[sp_layDanhSachCanBo]    Script Date: 23/10/2021 16:13:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[sp_layDanhSachCanBo]
as
select * from tblCanBo

GO
/****** Object:  StoredProcedure [dbo].[sp_suaCanBo]    Script Date: 23/10/2021 16:13:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[sp_suaCanBo]
@id int,
@ten nvarchar(30),
@sdt varchar(20),
@mail varchar(20),
@diachi nvarchar(50)
as
update tblCanBo set sTenGiangVien = @ten,sSoDienThoai = @sdt,sEmail = @mail, sdiachi =  @diachi where imacanbo = @id

GO
/****** Object:  StoredProcedure [dbo].[sp_suahoidong]    Script Date: 23/10/2021 16:13:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_suahoidong]
@id int,
@tenhoidong nvarchar(60),
@machutich int,
@mathuky int,
@magiamsat int,
@tungay date,
@denngay date,
@loaihoidong bit
as
update tblHoiDong set stenhoidong = @tenhoidong, iChuTich= @machutich, iGiamSat= @magiamsat, iThuKy=@mathuky, dNgayBatDau = @tungay, dNgayKetThuc=@denngay, bloaihoidong = @loaihoidong
where iMaHoiDong = @id

GO
/****** Object:  StoredProcedure [dbo].[sp_suaPhanCongCanBo]    Script Date: 23/10/2021 16:13:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[sp_suaPhanCongCanBo]
@maHoiDong int,
@maPhongHoc int,
@maCaThi int,
@ngay date,
@maCanBo int
as
update tblPhanCongCanBo set iMaHoiDong = @maHoiDong, iMaPhongHoc=@maPhongHoc, iMaCa  = @maCaThi, dNgay = @ngay,iMaCanBo = @maCanBo 
where iMaCanBo = @maCanBo and iMaHoiDong = @maHoiDong

GO
/****** Object:  StoredProcedure [dbo].[sp_thanhToanTienChoCanBo]    Script Date: 23/10/2021 16:13:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_thanhToanTienChoCanBo]
@maPhanCong int,
@tien int
as
update tblPhanCongCanBo set iTienCong = @tien where iMaPhanCong = @maPhanCong

GO
/****** Object:  StoredProcedure [dbo].[sp_themCanBo]    Script Date: 23/10/2021 16:13:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_themCanBo]
@ten nvarchar(30),
@sdt varchar(20),
@mail varchar(20),
@diachi nvarchar(50)
as
insert into tblCanBo (sTenGiangVien,sSoDienThoai,sEmail,sdiachi) values
(@ten, @sdt,@mail,@diachi)

GO
/****** Object:  StoredProcedure [dbo].[sp_themhoidong]    Script Date: 23/10/2021 16:13:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_themhoidong]
@tenhoidong nvarchar(60),
@machutich int,
@mathuky int,
@magiamsat int,
@tungay date,
@denngay date,
@ngaytao datetime,
@loaihoidong bit
as
insert into tblHoiDong (stenhoidong, iChuTich, iGiamSat, iThuKy, dNgayBatDau, dNgayKetThuc,dThoiGianTao, bloaihoidong) values
(@tenhoidong, @machutich, @magiamsat,@mathuky, @tungay, @denngay, @ngaytao, @loaihoidong)


GO
/****** Object:  StoredProcedure [dbo].[sp_themPhanCongCanBo]    Script Date: 23/10/2021 16:13:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_themPhanCongCanBo]
@maHoiDong int,
@maPhongHoc int,
@maCaThi int,
@ngay date,
@maCanBo int
as
insert into tblPhanCongCanBo(iMaHoiDong, iMaPhongHoc, iMaCa, dNgay,iMaCanBo) values
(@maHoiDong, @maPhongHoc, @maCaThi, @ngay, @maCanBo) 

GO
/****** Object:  StoredProcedure [dbo].[sp_themPhong]    Script Date: 23/10/2021 16:13:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_themPhong]
@ten nvarchar(30)
as
insert into tblPhongHoc (sTenPhong) values (@ten)
GO
/****** Object:  StoredProcedure [dbo].[sp_timKiemHoiDong]    Script Date: 23/10/2021 16:13:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[sp_timKiemHoiDong]
@tenhoidong nvarchar(30)
as
select ROW_NUMBER() OVER (ORDER BY  a.iMaHoiDong) AS  STT, a.iMaHoiDong, a.stenhoidong as N'Tên Hội Đồng',IIF(a.bloaihoidong = 1, N'Coi Thi',N'Chấm Thi' ) as N'Loại Hội Đồng',a.dNgayBatDau  as N'Từ Ngày',a.dngayketthuc as N'Đến Ngày',a.dThoiGianTao  as N'Ngày Tạo', b.stengiangvien as N'Chủ Tịch', c.stengiangvien as N'Giám Sát', d.stengiangvien as N'Thư Ký'
 from 
(
(select  bLoaiHoiDong , dThoiGianTao, dNgayBatDau , dNgayKetThuc , iMaHoiDong, stenhoidong from tblHoiDong where sTenHoiDong like '%' + @tenhoidong + '%') a inner join
(select iMaHoiDong, sTenGiangVien from tblHoiDong, tblCanBo where tblHoiDong.iChuTich = tblCanBo.iMaCanBo) b on a.iMaHoiDong = b.iMaHoiDong
inner join 
(select iMaHoiDong, sTenGiangVien from tblHoiDong, tblCanBo where tblHoiDong.iGiamSat = tblCanBo.iMaCanBo) c on a.iMaHoiDong = c.iMaHoiDong
inner join
(select iMaHoiDong, sTenGiangVien from tblHoiDong, tblCanBo where tblHoiDong.iThuKy = tblCanBo.iMaCanBo) d on a.iMaHoiDong = d.iMaHoiDong

)

GO
/****** Object:  StoredProcedure [dbo].[sp_xoaCanBo]    Script Date: 23/10/2021 16:13:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_xoaCanBo]
@id int
as
delete from tblCanBo where iMaCanBo = @id

GO
/****** Object:  StoredProcedure [dbo].[sp_xoaHoiDong]    Script Date: 23/10/2021 16:13:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_xoaHoiDong]
@id int
as
delete from tblPhanCongCanBo where iMaHoiDong = @id
delete from tblHoiDong where iMaHoiDong = @id


GO
/****** Object:  StoredProcedure [dbo].[sp_XoaPhanCongCanBo]    Script Date: 23/10/2021 16:13:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_XoaPhanCongCanBo]
@maPhanCong int
as
delete from tblPhanCongCanBo where iMaPhanCong = @maPhanCong

GO
/****** Object:  Table [dbo].[tblCanBo]    Script Date: 23/10/2021 16:13:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCanBo](
	[iMaCanBo] [int] IDENTITY(1,1) NOT NULL,
	[sTenGiangVien] [nvarchar](30) NULL,
	[sSoDienThoai] [nvarchar](20) NULL,
	[sEmail] [nvarchar](20) NULL,
	[sDiaChi] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[iMaCanBo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblCaThi]    Script Date: 23/10/2021 16:13:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblCaThi](
	[iMaCaThi] [int] IDENTITY(1,1) NOT NULL,
	[sTenCaThi] [varchar](5) NULL,
PRIMARY KEY CLUSTERED 
(
	[iMaCaThi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblHoiDong]    Script Date: 23/10/2021 16:13:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblHoiDong](
	[iMaHoiDong] [int] IDENTITY(1,1) NOT NULL,
	[sTenHoiDong] [nvarchar](60) NULL,
	[dNgayBatDau] [date] NULL,
	[dNgayKetThuc] [date] NULL,
	[iChuTich] [int] NOT NULL,
	[iThuKy] [int] NOT NULL,
	[iGiamSat] [int] NOT NULL,
	[dThoiGianTao] [datetime] NULL,
	[bLoaiHoiDong] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[iMaHoiDong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblPhanCongCanBo]    Script Date: 23/10/2021 16:13:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPhanCongCanBo](
	[iMaPhanCong] [int] IDENTITY(1,1) NOT NULL,
	[iMaHoiDong] [int] NOT NULL,
	[iMaCa] [int] NOT NULL,
	[iMaPhongHoc] [int] NOT NULL,
	[iMaCanBo] [int] NOT NULL,
	[dNgay] [date] NULL,
	[iTienCong] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[iMaPhanCong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblPhongHoc]    Script Date: 23/10/2021 16:13:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblPhongHoc](
	[iMaPhongHoc] [int] IDENTITY(1,1) NOT NULL,
	[sTenPhong] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[iMaPhongHoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tblCanBo] ON 

INSERT [dbo].[tblCanBo] ([iMaCanBo], [sTenGiangVien], [sSoDienThoai], [sEmail], [sDiaChi]) VALUES (1, N'Nguyễn Thành Huy', N'0965656565', N'huyds333@hou.com', N'Hà Nội')
INSERT [dbo].[tblCanBo] ([iMaCanBo], [sTenGiangVien], [sSoDienThoai], [sEmail], [sDiaChi]) VALUES (3, N'Trần Tiến Dũng', N'0965656565', N'dungnd@hou.com', N'Hà Nội')
INSERT [dbo].[tblCanBo] ([iMaCanBo], [sTenGiangVien], [sSoDienThoai], [sEmail], [sDiaChi]) VALUES (4, N'Thái Thanh Sơn', N'0965656565', N'sonhou@hou.com', N'Hà Nội')
INSERT [dbo].[tblCanBo] ([iMaCanBo], [sTenGiangVien], [sSoDienThoai], [sEmail], [sDiaChi]) VALUES (5, N'Nguyễn Thuỳ Linh', N'0965656565', N'llinhnghou@hou.com', N'Hà Nội')
INSERT [dbo].[tblCanBo] ([iMaCanBo], [sTenGiangVien], [sSoDienThoai], [sEmail], [sDiaChi]) VALUES (6, N'Trần Tiến Tùng', N'0965656565', N'dungnd@hou.com', N'Hà Nội')
INSERT [dbo].[tblCanBo] ([iMaCanBo], [sTenGiangVien], [sSoDienThoai], [sEmail], [sDiaChi]) VALUES (7, N'Nguyễn Hiểu', N'0965656565', N'hieuhou@hou.com', N'Hà Nội')
SET IDENTITY_INSERT [dbo].[tblCanBo] OFF
SET IDENTITY_INSERT [dbo].[tblCaThi] ON 

INSERT [dbo].[tblCaThi] ([iMaCaThi], [sTenCaThi]) VALUES (1, N'Ca1')
INSERT [dbo].[tblCaThi] ([iMaCaThi], [sTenCaThi]) VALUES (2, N'Ca2')
INSERT [dbo].[tblCaThi] ([iMaCaThi], [sTenCaThi]) VALUES (3, N'Ca3')
INSERT [dbo].[tblCaThi] ([iMaCaThi], [sTenCaThi]) VALUES (4, N'Ca4')
SET IDENTITY_INSERT [dbo].[tblCaThi] OFF
SET IDENTITY_INSERT [dbo].[tblHoiDong] ON 

INSERT [dbo].[tblHoiDong] ([iMaHoiDong], [sTenHoiDong], [dNgayBatDau], [dNgayKetThuc], [iChuTich], [iThuKy], [iGiamSat], [dThoiGianTao], [bLoaiHoiDong]) VALUES (3, N'Hội Đồng Trông Thi Kì 2021-2022 ', CAST(0xF9420B00 AS Date), CAST(0x17430B00 AS Date), 4, 1, 5, CAST(0x0000AC4B01042E54 AS DateTime), 0)
INSERT [dbo].[tblHoiDong] ([iMaHoiDong], [sTenHoiDong], [dNgayBatDau], [dNgayKetThuc], [iChuTich], [iThuKy], [iGiamSat], [dThoiGianTao], [bLoaiHoiDong]) VALUES (4, N'Hội Đồng Coi Thi Tiếng Anh T6/2020', CAST(0x34430B00 AS Date), CAST(0x52430B00 AS Date), 5, 5, 6, CAST(0x0000AC4B0105C01F AS DateTime), 0)
INSERT [dbo].[tblHoiDong] ([iMaHoiDong], [sTenHoiDong], [dNgayBatDau], [dNgayKetThuc], [iChuTich], [iThuKy], [iGiamSat], [dThoiGianTao], [bLoaiHoiDong]) VALUES (5, N'Thi Học Kì 2 Năm Học 2020 - 2021', CAST(0x6E420B00 AS Date), CAST(0x8C420B00 AS Date), 7, 4, 3, CAST(0x0000ADCA010802C5 AS DateTime), 0)
INSERT [dbo].[tblHoiDong] ([iMaHoiDong], [sTenHoiDong], [dNgayBatDau], [dNgayKetThuc], [iChuTich], [iThuKy], [iGiamSat], [dThoiGianTao], [bLoaiHoiDong]) VALUES (6, N'Hội Đồng CoiThi Tốt Nghiệp', CAST(0x1A430B00 AS Date), CAST(0x25430B00 AS Date), 1, 6, 1, CAST(0x0000ADCA010A0520 AS DateTime), 0)
INSERT [dbo].[tblHoiDong] ([iMaHoiDong], [sTenHoiDong], [dNgayBatDau], [dNgayKetThuc], [iChuTich], [iThuKy], [iGiamSat], [dThoiGianTao], [bLoaiHoiDong]) VALUES (7, N'Hội Đồng Chấm Thi Tốt Nghiệp', CAST(0x25430B00 AS Date), CAST(0x2C430B00 AS Date), 5, 5, 1, CAST(0x0000ADCA010A295E AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[tblHoiDong] OFF
SET IDENTITY_INSERT [dbo].[tblPhanCongCanBo] ON 

INSERT [dbo].[tblPhanCongCanBo] ([iMaPhanCong], [iMaHoiDong], [iMaCa], [iMaPhongHoc], [iMaCanBo], [dNgay], [iTienCong]) VALUES (10, 3, 1, 1, 1, CAST(0x07430B00 AS Date), 0)
INSERT [dbo].[tblPhanCongCanBo] ([iMaPhanCong], [iMaHoiDong], [iMaCa], [iMaPhongHoc], [iMaCanBo], [dNgay], [iTienCong]) VALUES (11, 3, 1, 1, 3, CAST(0x0E430B00 AS Date), 0)
INSERT [dbo].[tblPhanCongCanBo] ([iMaPhanCong], [iMaHoiDong], [iMaCa], [iMaPhongHoc], [iMaCanBo], [dNgay], [iTienCong]) VALUES (12, 4, 1, 1, 3, CAST(0x13430B00 AS Date), 400000)
INSERT [dbo].[tblPhanCongCanBo] ([iMaPhanCong], [iMaHoiDong], [iMaCa], [iMaPhongHoc], [iMaCanBo], [dNgay], [iTienCong]) VALUES (13, 4, 1, 1, 1, CAST(0x13430B00 AS Date), 350000)
INSERT [dbo].[tblPhanCongCanBo] ([iMaPhanCong], [iMaHoiDong], [iMaCa], [iMaPhongHoc], [iMaCanBo], [dNgay], [iTienCong]) VALUES (14, 4, 2, 1, 1, CAST(0x13430B00 AS Date), 0)
INSERT [dbo].[tblPhanCongCanBo] ([iMaPhanCong], [iMaHoiDong], [iMaCa], [iMaPhongHoc], [iMaCanBo], [dNgay], [iTienCong]) VALUES (15, 4, 2, 1, 5, CAST(0x13430B00 AS Date), 300000)
INSERT [dbo].[tblPhanCongCanBo] ([iMaPhanCong], [iMaHoiDong], [iMaCa], [iMaPhongHoc], [iMaCanBo], [dNgay], [iTienCong]) VALUES (16, 4, 2, 7, 3, CAST(0xF5420B00 AS Date), 180000)
INSERT [dbo].[tblPhanCongCanBo] ([iMaPhanCong], [iMaHoiDong], [iMaCa], [iMaPhongHoc], [iMaCanBo], [dNgay], [iTienCong]) VALUES (17, 5, 1, 1, 1, CAST(0x6E420B00 AS Date), 300000)
INSERT [dbo].[tblPhanCongCanBo] ([iMaPhanCong], [iMaHoiDong], [iMaCa], [iMaPhongHoc], [iMaCanBo], [dNgay], [iTienCong]) VALUES (18, 5, 1, 1, 5, CAST(0x6E420B00 AS Date), 0)
INSERT [dbo].[tblPhanCongCanBo] ([iMaPhanCong], [iMaHoiDong], [iMaCa], [iMaPhongHoc], [iMaCanBo], [dNgay], [iTienCong]) VALUES (19, 5, 1, 4, 4, CAST(0x6E420B00 AS Date), 0)
INSERT [dbo].[tblPhanCongCanBo] ([iMaPhanCong], [iMaHoiDong], [iMaCa], [iMaPhongHoc], [iMaCanBo], [dNgay], [iTienCong]) VALUES (20, 5, 3, 1, 1, CAST(0x6E420B00 AS Date), 0)
INSERT [dbo].[tblPhanCongCanBo] ([iMaPhanCong], [iMaHoiDong], [iMaCa], [iMaPhongHoc], [iMaCanBo], [dNgay], [iTienCong]) VALUES (21, 7, 1, 1, 1, CAST(0x25430B00 AS Date), 300000)
INSERT [dbo].[tblPhanCongCanBo] ([iMaPhanCong], [iMaHoiDong], [iMaCa], [iMaPhongHoc], [iMaCanBo], [dNgay], [iTienCong]) VALUES (22, 7, 1, 1, 4, CAST(0x25430B00 AS Date), 300000)
INSERT [dbo].[tblPhanCongCanBo] ([iMaPhanCong], [iMaHoiDong], [iMaCa], [iMaPhongHoc], [iMaCanBo], [dNgay], [iTienCong]) VALUES (23, 7, 3, 1, 1, CAST(0x25430B00 AS Date), 0)
INSERT [dbo].[tblPhanCongCanBo] ([iMaPhanCong], [iMaHoiDong], [iMaCa], [iMaPhongHoc], [iMaCanBo], [dNgay], [iTienCong]) VALUES (24, 7, 1, 1, 5, CAST(0x25430B00 AS Date), 0)
INSERT [dbo].[tblPhanCongCanBo] ([iMaPhanCong], [iMaHoiDong], [iMaCa], [iMaPhongHoc], [iMaCanBo], [dNgay], [iTienCong]) VALUES (25, 7, 4, 1, 6, CAST(0x25430B00 AS Date), 0)
SET IDENTITY_INSERT [dbo].[tblPhanCongCanBo] OFF
SET IDENTITY_INSERT [dbo].[tblPhongHoc] ON 

INSERT [dbo].[tblPhongHoc] ([iMaPhongHoc], [sTenPhong]) VALUES (1, N'P21')
INSERT [dbo].[tblPhongHoc] ([iMaPhongHoc], [sTenPhong]) VALUES (2, N'P22')
INSERT [dbo].[tblPhongHoc] ([iMaPhongHoc], [sTenPhong]) VALUES (3, N'P23')
INSERT [dbo].[tblPhongHoc] ([iMaPhongHoc], [sTenPhong]) VALUES (4, N'P24')
INSERT [dbo].[tblPhongHoc] ([iMaPhongHoc], [sTenPhong]) VALUES (5, N'P31')
INSERT [dbo].[tblPhongHoc] ([iMaPhongHoc], [sTenPhong]) VALUES (6, N'P32')
INSERT [dbo].[tblPhongHoc] ([iMaPhongHoc], [sTenPhong]) VALUES (7, N'P33')
INSERT [dbo].[tblPhongHoc] ([iMaPhongHoc], [sTenPhong]) VALUES (8, N'P34')
INSERT [dbo].[tblPhongHoc] ([iMaPhongHoc], [sTenPhong]) VALUES (9, N'P41')
INSERT [dbo].[tblPhongHoc] ([iMaPhongHoc], [sTenPhong]) VALUES (10, N'P42')
INSERT [dbo].[tblPhongHoc] ([iMaPhongHoc], [sTenPhong]) VALUES (11, N'P43')
INSERT [dbo].[tblPhongHoc] ([iMaPhongHoc], [sTenPhong]) VALUES (12, N'P44')
INSERT [dbo].[tblPhongHoc] ([iMaPhongHoc], [sTenPhong]) VALUES (13, N'P51')
INSERT [dbo].[tblPhongHoc] ([iMaPhongHoc], [sTenPhong]) VALUES (14, N'P52')
INSERT [dbo].[tblPhongHoc] ([iMaPhongHoc], [sTenPhong]) VALUES (15, N'P Ph? 1')
SET IDENTITY_INSERT [dbo].[tblPhongHoc] OFF
ALTER TABLE [dbo].[tblPhanCongCanBo] ADD  DEFAULT ((0)) FOR [iTienCong]
GO
ALTER TABLE [dbo].[tblHoiDong]  WITH CHECK ADD FOREIGN KEY([iChuTich])
REFERENCES [dbo].[tblCanBo] ([iMaCanBo])
GO
ALTER TABLE [dbo].[tblHoiDong]  WITH CHECK ADD FOREIGN KEY([iChuTich])
REFERENCES [dbo].[tblCanBo] ([iMaCanBo])
GO
ALTER TABLE [dbo].[tblHoiDong]  WITH CHECK ADD FOREIGN KEY([iChuTich])
REFERENCES [dbo].[tblCanBo] ([iMaCanBo])
GO
ALTER TABLE [dbo].[tblHoiDong]  WITH CHECK ADD FOREIGN KEY([iChuTich])
REFERENCES [dbo].[tblCanBo] ([iMaCanBo])
GO
ALTER TABLE [dbo].[tblHoiDong]  WITH CHECK ADD FOREIGN KEY([iGiamSat])
REFERENCES [dbo].[tblCanBo] ([iMaCanBo])
GO
ALTER TABLE [dbo].[tblHoiDong]  WITH CHECK ADD FOREIGN KEY([iGiamSat])
REFERENCES [dbo].[tblCanBo] ([iMaCanBo])
GO
ALTER TABLE [dbo].[tblHoiDong]  WITH CHECK ADD FOREIGN KEY([iGiamSat])
REFERENCES [dbo].[tblCanBo] ([iMaCanBo])
GO
ALTER TABLE [dbo].[tblHoiDong]  WITH CHECK ADD FOREIGN KEY([iGiamSat])
REFERENCES [dbo].[tblCanBo] ([iMaCanBo])
GO
ALTER TABLE [dbo].[tblHoiDong]  WITH CHECK ADD FOREIGN KEY([iThuKy])
REFERENCES [dbo].[tblCanBo] ([iMaCanBo])
GO
ALTER TABLE [dbo].[tblHoiDong]  WITH CHECK ADD FOREIGN KEY([iThuKy])
REFERENCES [dbo].[tblCanBo] ([iMaCanBo])
GO
ALTER TABLE [dbo].[tblHoiDong]  WITH CHECK ADD FOREIGN KEY([iThuKy])
REFERENCES [dbo].[tblCanBo] ([iMaCanBo])
GO
ALTER TABLE [dbo].[tblHoiDong]  WITH CHECK ADD FOREIGN KEY([iThuKy])
REFERENCES [dbo].[tblCanBo] ([iMaCanBo])
GO
ALTER TABLE [dbo].[tblPhanCongCanBo]  WITH CHECK ADD FOREIGN KEY([iMaCa])
REFERENCES [dbo].[tblCaThi] ([iMaCaThi])
GO
ALTER TABLE [dbo].[tblPhanCongCanBo]  WITH CHECK ADD FOREIGN KEY([iMaCanBo])
REFERENCES [dbo].[tblCanBo] ([iMaCanBo])
GO
ALTER TABLE [dbo].[tblPhanCongCanBo]  WITH CHECK ADD FOREIGN KEY([iMaCa])
REFERENCES [dbo].[tblCaThi] ([iMaCaThi])
GO
ALTER TABLE [dbo].[tblPhanCongCanBo]  WITH CHECK ADD FOREIGN KEY([iMaCanBo])
REFERENCES [dbo].[tblCanBo] ([iMaCanBo])
GO
ALTER TABLE [dbo].[tblPhanCongCanBo]  WITH CHECK ADD FOREIGN KEY([iMaCa])
REFERENCES [dbo].[tblCaThi] ([iMaCaThi])
GO
ALTER TABLE [dbo].[tblPhanCongCanBo]  WITH CHECK ADD FOREIGN KEY([iMaCanBo])
REFERENCES [dbo].[tblCanBo] ([iMaCanBo])
GO
ALTER TABLE [dbo].[tblPhanCongCanBo]  WITH CHECK ADD FOREIGN KEY([iMaCa])
REFERENCES [dbo].[tblCaThi] ([iMaCaThi])
GO
ALTER TABLE [dbo].[tblPhanCongCanBo]  WITH CHECK ADD FOREIGN KEY([iMaCanBo])
REFERENCES [dbo].[tblCanBo] ([iMaCanBo])
GO
ALTER TABLE [dbo].[tblPhanCongCanBo]  WITH CHECK ADD FOREIGN KEY([iMaHoiDong])
REFERENCES [dbo].[tblHoiDong] ([iMaHoiDong])
GO
ALTER TABLE [dbo].[tblPhanCongCanBo]  WITH CHECK ADD FOREIGN KEY([iMaHoiDong])
REFERENCES [dbo].[tblHoiDong] ([iMaHoiDong])
GO
ALTER TABLE [dbo].[tblPhanCongCanBo]  WITH CHECK ADD FOREIGN KEY([iMaHoiDong])
REFERENCES [dbo].[tblHoiDong] ([iMaHoiDong])
GO
ALTER TABLE [dbo].[tblPhanCongCanBo]  WITH CHECK ADD FOREIGN KEY([iMaHoiDong])
REFERENCES [dbo].[tblHoiDong] ([iMaHoiDong])
GO
ALTER TABLE [dbo].[tblPhanCongCanBo]  WITH CHECK ADD FOREIGN KEY([iMaHoiDong])
REFERENCES [dbo].[tblHoiDong] ([iMaHoiDong])
GO
ALTER TABLE [dbo].[tblPhanCongCanBo]  WITH CHECK ADD FOREIGN KEY([iMaHoiDong])
REFERENCES [dbo].[tblHoiDong] ([iMaHoiDong])
GO
ALTER TABLE [dbo].[tblPhanCongCanBo]  WITH CHECK ADD FOREIGN KEY([iMaHoiDong])
REFERENCES [dbo].[tblHoiDong] ([iMaHoiDong])
GO
ALTER TABLE [dbo].[tblPhanCongCanBo]  WITH CHECK ADD FOREIGN KEY([iMaHoiDong])
REFERENCES [dbo].[tblHoiDong] ([iMaHoiDong])
GO
ALTER TABLE [dbo].[tblPhanCongCanBo]  WITH CHECK ADD FOREIGN KEY([iMaPhongHoc])
REFERENCES [dbo].[tblPhongHoc] ([iMaPhongHoc])
GO
ALTER TABLE [dbo].[tblPhanCongCanBo]  WITH CHECK ADD FOREIGN KEY([iMaPhongHoc])
REFERENCES [dbo].[tblPhongHoc] ([iMaPhongHoc])
GO
ALTER TABLE [dbo].[tblPhanCongCanBo]  WITH CHECK ADD FOREIGN KEY([iMaPhongHoc])
REFERENCES [dbo].[tblPhongHoc] ([iMaPhongHoc])
GO
ALTER TABLE [dbo].[tblPhanCongCanBo]  WITH CHECK ADD FOREIGN KEY([iMaPhongHoc])
REFERENCES [dbo].[tblPhongHoc] ([iMaPhongHoc])
GO
ALTER TABLE [dbo].[tblPhanCongCanBo]  WITH CHECK ADD FOREIGN KEY([iMaPhongHoc])
REFERENCES [dbo].[tblPhongHoc] ([iMaPhongHoc])
GO
ALTER TABLE [dbo].[tblPhanCongCanBo]  WITH CHECK ADD FOREIGN KEY([iMaPhongHoc])
REFERENCES [dbo].[tblPhongHoc] ([iMaPhongHoc])
GO
ALTER TABLE [dbo].[tblPhanCongCanBo]  WITH CHECK ADD FOREIGN KEY([iMaPhongHoc])
REFERENCES [dbo].[tblPhongHoc] ([iMaPhongHoc])
GO
ALTER TABLE [dbo].[tblPhanCongCanBo]  WITH CHECK ADD FOREIGN KEY([iMaPhongHoc])
REFERENCES [dbo].[tblPhongHoc] ([iMaPhongHoc])
GO
USE [master]
GO
ALTER DATABASE [quanLyCoiThiChamThi2] SET  READ_WRITE 
GO
