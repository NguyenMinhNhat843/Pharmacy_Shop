package dao;

import entity.SanPham;

import java.util.List;

public interface SanPhamDao {
    public SanPham getSanPhamById(String id);

    public SanPham getSanPhamByTen(String ten);

    public SanPham addSanPham(SanPham sanPham);

    public SanPham updateSanPham(String id, SanPham sanPham);

    public boolean deleteSanPham(String id);

    public List<SanPham> getAllSanPham();
}
