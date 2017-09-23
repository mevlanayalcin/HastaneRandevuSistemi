package hibernateVeEntityler.entity;

import javax.persistence.*;

@Entity
@Table(name = "randevu")
public class RandevuBilgileri
{

    @Id
    @Column(name="ID")
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private int id;


    @Column(name="TC")
    private String tc;

    @Column(name="SEHIR")
    private String sehir;

    @Column(name="ILCE")
    private String ilce;

    @Column(name="HASTANE")
    private String hastane;

    @Column(name="KLINIK")
    private String klinik;

    public RandevuBilgileri() {
    }

    public RandevuBilgileri(String tc,String sehir, String ilce, String hastane,String klinik) {
        this.tc=tc;
        this.sehir = sehir;
        this.ilce = ilce;
        this.hastane = hastane;
        this.klinik=klinik;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSehir() {
        return sehir;
    }

    public void setSehir(String sehir) {
        this.sehir = sehir;
    }

    public String getIlce() {
        return ilce;
    }

    public void setIlce(String ilce) {
        this.ilce = ilce;
    }

    public String getHastane() {
        return hastane;
    }

    public void setHastane(String hastane) {
        this.hastane = hastane;
    }

    public String getKlinik() {
        return klinik;
    }

    public void setKlinik(String klinik) {
        this.klinik = klinik;
    }

    public String getTc() {
        return tc;
    }

    public void setTc(String tc) {
        this.tc = tc;
    }

    @Override
    public String toString() {
        return "RandevuBilgileri{" +
                "id=" + id +
                ", tc='" + tc + '\'' +
                ", sehir='" + sehir + '\'' +
                ", ilce='" + ilce + '\'' +
                ", hastane='" + hastane + '\'' +
                ", klinik='" + klinik + '\'' +
                '}';
    }
}
