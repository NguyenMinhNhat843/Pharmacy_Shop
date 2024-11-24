package dao;

import entity.KhuyenMai;

import java.util.List;

public interface KhuyenMaiDao {
    public KhuyenMai getKhuyenMai(String id);

    public KhuyenMai themKhuyenMai(KhuyenMai khuyenMai);

    public KhuyenMai suaKhuyenMai(String id, KhuyenMai khuyenMai);

    public boolean xoaKhuyenMai(int id);

    public List<KhuyenMai> getDanhSachKhuyenMai();
}
