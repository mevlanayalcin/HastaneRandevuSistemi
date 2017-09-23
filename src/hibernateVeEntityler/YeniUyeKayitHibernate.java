package hibernateVeEntityler;

import hibernateVeEntityler.entity.Uye;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class YeniUyeKayitHibernate
{


    public static boolean yeniUyeKayit(Uye obje)
    {
        boolean donut;
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
            session.save(obje);


            // display the students
            displayStudents(obje);

            // commit transaction
            session.getTransaction().commit();

            System.out.println("Done!");
            donut=true;
            return  donut;
        }
        catch (Exception e)
        {
            donut=false;
            return donut;
        }
        finally
        {
            factory.close();
        }


    }

    private static void displayStudents(Uye lg)
    {
        System.out.println(lg);
    }




}




