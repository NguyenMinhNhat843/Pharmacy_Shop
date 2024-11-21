package dao;

import entity.PhieuThongTin;

import java.util.List;

public interface PhieuThongTinDao {
    public PhieuThongTin addPhieuThongTin(PhieuThongTin phieuThongTin);

    public PhieuThongTin updatePhieuThongTin(String id, PhieuThongTin phieuThongTin);

    public PhieuThongTin getPhieuThongTinById(String id);

    public boolean deletePhieuThongTin(String id);

    public List<PhieuThongTin> getAllPhieuThongTin();
}
