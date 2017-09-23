package hibernateVeEntityler;

import hibernateVeEntityler.entity.Uye;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import java.util.ArrayList;
import java.util.List;

public class KullaniciBilgileriniGetirHibernate
{

    public static Uye kullaniciBilgileriniSorgula(String tc,String sifre)
    {
        Uye kullanici=new Uye();

        // create session factory
        SessionFactory factory = new Configuration()
                .configure("hibernate.cfg.xml")
                .addAnnotatedClass(Uye.class)
                .buildSessionFactory();

        // create session
        Session session = factory.getCurrentSession();


        try
        {
            // start a transaction
            session.beginTransaction();

            // query students
            Uye uyeObjesi = (Uye) session.createQuery("from Uye where tc=? and sifre=?")
                    .setParameter(0,tc)
                    .setParameter(1,sifre)
                    .getSingleResult();

            // display the students
            displayUye(uyeObjesi);

            // commit transaction
            session.getTransaction().commit();

            System.out.println("Tc ve Sifre Yollanarak Uye Sorgusu Tamamlandi!");

            return uyeObjesi;

        }
        catch (Exception e)
        {
            Uye kullanici2=new Uye("0","kayit bulunamadi","kayit bulunamadi","kayit bulunamadi","kayit bulunamadi","kayit bulunamadi");
            return kullanici2;
        }

        finally
        {
            factory.close();
        }


    }

    private static void displayUye(Uye uyeObjesi)
    {
        System.out.println(uyeObjesi);
    }

}
