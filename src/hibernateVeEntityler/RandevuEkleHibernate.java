package hibernateVeEntityler;

import hibernateVeEntityler.entity.RandevuBilgileri;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class RandevuEkleHibernate
{
    public static boolean RandevuEkle(RandevuBilgileri randevuBilgileri)
    {

        boolean donus;
        // create session factory
        SessionFactory factory = new Configuration()
                .configure("hibernate.cfg.xml")
                .addAnnotatedClass(RandevuBilgileri.class)
                .buildSessionFactory();

        // create session
        Session session = factory.getCurrentSession();


        try
        {
            // start a transaction
            session.beginTransaction();

            // query students
            session.save(randevuBilgileri);


            displayRandevu(randevuBilgileri);

            // commit transaction
            session.getTransaction().commit();

            System.out.println("Done!");

            donus=true;
            return donus;

        }
        catch (Exception e)
        {
            donus=false;
            return donus;
        }

        finally
        {
            factory.close();
        }
    }

    private static void displayRandevu(RandevuBilgileri randevu)
    {
        System.out.println(randevu);
    }


    public static List<RandevuBilgileri> RandevuCek(String tc)
    {
        List<RandevuBilgileri> randevuBilgileriList=new ArrayList<>();

        // create session factory
        SessionFactory factory = new Configuration()
                .configure("hibernate.cfg.xml")
                .addAnnotatedClass(RandevuBilgileri.class)
                .buildSessionFactory();

        // create session
        Session session = factory.getCurrentSession();


        try
        {
            // start a transaction
            session.beginTransaction();

            // query students
            randevuBilgileriList=session.createQuery("from RandevuBilgileri where tc=?").setParameter(0,tc).getResultList();


            displayRandevuBilgileri(randevuBilgileriList);

            // commit transaction
            session.getTransaction().commit();

            System.out.println("Done!");
            return  randevuBilgileriList;
        }
        finally
        {
            factory.close();
        }
    }

    private static void displayRandevuBilgileri(List<RandevuBilgileri> randevuBilgileriList)
    {
        for(RandevuBilgileri rb:randevuBilgileriList)
        {
            System.out.println(rb);
        }
    }


}
