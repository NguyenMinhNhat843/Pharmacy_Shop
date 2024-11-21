package dao;

import entity.DonHang;

import java.util.List;

public interface DonHangDao {
    public DonHang addDonHang(DonHang donHang);

    public DonHang getDonHangById(String id);

    public DonHang updateDonHang(String id, DonHang donHang);

    public boolean deleteDonHang(String id);

    public List<DonHang> getAllDonHang();
}
