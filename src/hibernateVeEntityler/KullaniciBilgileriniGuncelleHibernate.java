package hibernateVeEntityler;

import hibernateVeEntityler.entity.Uye;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class KullaniciBilgileriniGuncelleHibernate
{
    public static boolean uyeBilgileriniGuncelle(Uye obje)
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
            session.createQuery("update Uye set mail=?, telefon=?, sifre=? where tc=? ")
                    .setParameter(0,obje.getMail())
                    .setParameter(1,obje.getTelefon())
                    .setParameter(2,obje.getSifre())
                    .setParameter(3,obje.getTc())
                    .executeUpdate();


            Uye uyeObjesi = (Uye) session.createQuery("from Uye where tc=? and sifre=?")
                    .setParameter(0,obje.getTc())
                    .setParameter(1,obje.getSifre())
                    .getSingleResult();

            // display the students
            displayStudents(uyeObjesi);

            // commit transaction
            session.getTransaction().commit();

            System.out.println("Uyenin bilgilerini update ettik agam sorunumuz yok !");
            donut=true;
            return  donut;
        }
        catch (Exception e)
        {
            e.printStackTrace();
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
