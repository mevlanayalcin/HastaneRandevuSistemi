package hibernateVeEntityler;

import hibernateVeEntityler.entity.LoginEkrani;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class LoginEkranSorguHibernate
{


    public static boolean loginSorgu(LoginEkrani obje)
    {
        boolean donut;
        // create session factory
        SessionFactory factory = new Configuration()
                .configure("hibernate.cfg.xml")
                .addAnnotatedClass(LoginEkrani.class)
                .buildSessionFactory();

        // create session
        Session session = factory.getCurrentSession();


        try
        {
            // start a transaction
            session.beginTransaction();

            // query students
            LoginEkrani loginEkraniObjesi = (LoginEkrani) session.createQuery("from LoginEkrani where tc=? and sifre=?")
                    .setParameter(0,obje.getTc())
                    .setParameter(1,obje.getSifre())
                    .getSingleResult();

            // display the students
            displayStudents(loginEkraniObjesi);

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

    private static void displayStudents(LoginEkrani lg)
    {
        System.out.println(lg);
    }




}




