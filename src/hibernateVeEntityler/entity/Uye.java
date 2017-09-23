package hibernateVeEntityler.entity;

import javax.persistence.Entity;
import javax.persistence.Column;
import javax.persistence.Table;
import javax.persistence.Id;

@Entity
@Table(name = "Uye")
public class Uye
{
    @Id
    @Column(name="TC")
    private String tc;

    @Column(name="ISIM")
    private String isim;

    @Column(name="SOYISIM")
    private String soyIsim;

    @Column(name="MAIL")
    private String mail;

    @Column(name="TELEFON")
    private String telefon;

    @Column(name="SIFRE")
    private String sifre;

    public Uye()
    {

    }

    public Uye(String tc, String isim, String soyIsim, String mail, String telefon, String sifre)
    {
        this.tc = tc;
        this.isim = isim;
        this.soyIsim = soyIsim;
        this.mail = mail;
        this.telefon = telefon;
        this.sifre = sifre;
    }

    public String getTc() {
        return tc;
    }

    public void setTc(String tc) {
        this.tc = tc;
    }

    public String getIsim() {
        return isim;
    }

    public void setIsim(String isim) {
        this.isim = isim;
    }

    public String getSoyIsim() {
        return soyIsim;
    }

    public void setSoyIsim(String soyIsim) {
        this.soyIsim = soyIsim;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getTelefon() {
        return telefon;
    }

    public void setTelefon(String telefon) {
        this.telefon = telefon;
    }

    public String getSifre() {
        return sifre;
    }

    public void setSifre(String sifre) {
        this.sifre = sifre;
    }

    @Override
    public String toString() {
        return "Uye{" +
                "tc=" + tc +
                ", isim='" + isim + '\'' +
                ", soyIsim='" + soyIsim + '\'' +
                ", mail='" + mail + '\'' +
                ", telefon='" + telefon + '\'' +
                ", sifre='" + sifre + '\'' +
                '}';
    }
}
