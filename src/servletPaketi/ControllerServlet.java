package servletPaketi;

import hibernateVeEntityler.KullaniciBilgileriniGuncelleHibernate;
import hibernateVeEntityler.LoginEkranSorguHibernate;
import hibernateVeEntityler.RandevuEkleHibernate;
import hibernateVeEntityler.YeniUyeKayitHibernate;
import hibernateVeEntityler.entity.LoginEkrani;
import hibernateVeEntityler.entity.RandevuBilgileri;
import hibernateVeEntityler.entity.Uye;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "ControllerServlet",urlPatterns = {"/ControllerServlet"})
public class ControllerServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {

    }





    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        try {
            String theCommand=request.getParameter("command");

            if(theCommand==null)
            {
                theCommand="LOGOUT";
            }

            switch (theCommand)
            {
                case"LOGIN":
                    loginSorgusu(request,response);
                    break;
                case"REGISTER":
                    yeniUyeKaydi(request,response);
                    break;
                case"LOGOUT":
                    oturumSonlandir(request,response);
                    break;
                case"RANDEVU":
                    randevuEkle(request,response);
                    break;
                case"UPDATE":
                    uyeBilgisiUpdate(request,response);
                    break;
                default:
                    oturumSonlandir(request,response);
                    break;
            }



        } catch (Exception e) {
            e.printStackTrace();
        }





    }

    private void uyeBilgisiUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Boolean yanit;

        String tc=request.getParameter("tcKimlik");
        //long tc=Long.parseLong(tc1);
        String isim=request.getParameter("isim");
        String soyisim=request.getParameter("soyisim");
        String mail=request.getParameter("mail");
        String telefon=request.getParameter("telefon");
        String sifre=request.getParameter("sifre");

        Uye uye=new Uye(tc,isim,soyisim,mail,telefon,sifre);
        yanit= KullaniciBilgileriniGuncelleHibernate.uyeBilgileriniGuncelle(uye);

        RequestDispatcher requestDispatcher=request.getRequestDispatcher("/kullaniciBilgilerimOncesi.jsp");
        request.setAttribute("tc1",tc);
        if(yanit)
        {

            request.setAttribute("uyeGuncellemesi"," Kullanici Bilgileriniz Basari Ile Guncellendi");
            requestDispatcher.forward(request,response);
        }
        else
        {
            request.setAttribute("uyeGuncellemesi","Kullanici Bilgisi Guncelleme Basarisiz Oldu !");
            requestDispatcher.forward(request,response);
        }

    }

    private void randevuEkle(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        Boolean kontrol;

        String il=request.getParameter("parent_selection");
        String ilce=request.getParameter("child_selection");
        String hastane=request.getParameter("hastaneler");
        String klinik=request.getParameter("klinikler");
        String tc=request.getParameter("tcNo");

        RandevuBilgileri randevuBilgileriObjesi=new RandevuBilgileri(tc,il,ilce,hastane,klinik);

        kontrol= RandevuEkleHibernate.RandevuEkle(randevuBilgileriObjesi);

        RequestDispatcher requestDispatcher=request.getRequestDispatcher("/index.jsp");
        request.setAttribute("tc1",tc);

        if(kontrol)
        {

            request.setAttribute("randevu","  Randevunuz  Basari Ile Eklenmistir");
            requestDispatcher.forward(request,response);
        }
        else
        {

            request.setAttribute("randevu","Randevunuz Ekleme Basarisiz Oldu");
            requestDispatcher.forward(request,response);
        }

    }




    private void oturumSonlandir(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession httpSession=request.getSession();
        httpSession.invalidate();
        response.setHeader("Cache-Control","no-cache");
        response.setHeader("Cache-Control","no-store");
        response.setHeader("Pragma","no-cache");
        response.setDateHeader ("Expires", 0);
        response.sendRedirect("/login.jsp");
        return;
    }

    private void yeniUyeKaydi(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
    {
        String tc=request.getParameter("TC");
        //long tc=Long.parseLong(tc1);
        String isim=request.getParameter("AD");
        String soyisim=request.getParameter("SOYAD");
        String mail=request.getParameter("MAIL");
        String telefon=request.getParameter("TELEFON");
        String sifre=request.getParameter("SIFRE");

        Uye uye=new Uye(tc,isim,soyisim,mail,telefon,sifre);
        boolean donus= YeniUyeKayitHibernate.yeniUyeKayit(uye);

        RequestDispatcher requestDispatcher=request.getRequestDispatcher("/login.jsp");
        if(donus)
        {
            request.setAttribute("uyeKayitBilgisi","Yeni Kullanici Basariyla Olusturuldu.Giris Yapabilirsiniz");
            requestDispatcher.forward(request,response);
        }
        else
        {
            response.sendRedirect("/register.jsp");
        }

    }

    private void loginSorgusu(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String tc=request.getParameter("tc_no");
        //long tc=Long.parseLong(tc1);
        String sifre=request.getParameter("sifre");
        LoginEkrani login=new LoginEkrani(tc,sifre);
        boolean donus= LoginEkranSorguHibernate.loginSorgu(login);
        RequestDispatcher requestDispatcher=request.getRequestDispatcher("/index.jsp");
        RequestDispatcher requestDispatcher2=request.getRequestDispatcher("/login.jsp");
        request.setAttribute("tc1",tc);

        if(donus)
        {
            requestDispatcher.forward(request,response);

        }
        else
        {

            request.setAttribute("loginBilgisi","Bu bilgilere sahip kullanici bulunamadi");
            requestDispatcher2.forward(request,response);
            //response.sendRedirect("/login2.jsp");
        }
    }
}
