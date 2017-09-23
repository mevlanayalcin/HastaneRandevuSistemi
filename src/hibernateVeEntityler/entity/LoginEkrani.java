package hibernateVeEntityler.entity;

import javax.persistence.Entity;
import javax.persistence.Column;
import javax.persistence.Table;
import javax.persistence.Id;


@Entity
@Table(name="anaekransorgu")
public class LoginEkrani
{

    @Id
    @Column(name="TC")
    private String tc;

    @Column(name="SIFRE")
    private String sifre;

    public LoginEkrani()
    {

    }

    public LoginEkrani(String tc, String sifre) {
        this.tc = tc;
        this.sifre = sifre;
    }

    public String getTc() {
        return tc;
    }

    public void setTc(String tc) {
        this.tc = tc;
    }

    public String getSifre() {
        return sifre;
    }

    public void setSifre(String sifre) {
        this.sifre = sifre;
    }

    @Override
    public String toString() {
        return "LoginEkrani{" +
                "tc=" + tc +
                ", sifre=" + sifre +
                '}';
    }
}
