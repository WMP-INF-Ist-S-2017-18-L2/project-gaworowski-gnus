<%-- 
    Author     : HP
--%>

<%@page import="bib.*"%> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String uzytkownik = "guest";
    String link_tekst = "Zaloguj się";
    String link_adres = "./login.jsp";
    if ((session.getAttribute("username") != null)) {
        uzytkownik = session.getAttribute("username").toString();
        link_tekst = "Wyloguj się";
        link_adres = "./wyloguj.jsp";
    }
%>
<!doctype html>
<html lang="pl">
    <head>
        <meta charset="utf-8">
        <title>Dodaj film</title>
        <link href="index.css" rel="stylesheet">
        <link async href="http://fonts.googleapis.com/css?family=Warnes" data-generated="http://enjoycss.com" rel="stylesheet" type="text/css"/>
        <link async href="http://fonts.googleapis.com/css?family=Atomic%20Age" data-generated="http://enjoycss.com" rel="stylesheet" type="text/css"/>
        <script type="text/javascript" script-name="bangers" src="http://use.edgefonts.net/bangers.js"></script>
        <script src="jquery-1.12.4.min.js"></script>
        <script>
            function ValidateForm1()
            {
                var regexp;
                var gatunek = document.getElementById('gatunek');
                if (!(gatunek.disabled ||
                        gatunek.style.display === 'none' ||
                        gatunek.style.visibility === 'hidden'))
                {
                    if (gatunek.selectedIndex < 0)
                    {
                        alert("Please select one of the \"gatunek\" options.");
                        gatunek.focus();
                        return false;
                    }
                }
                var tytul = document.getElementById('tytul');
                if (!(tytul.disabled || tytul.style.display === 'none' || tytul.style.visibility === 'hidden'))
                {
                    if (tytul.value == "")
                    {
                        alert("Niepoprawny tytuł filmu");
                        tytul.focus();
                        return false;
                    }
                    if (tytul.value.length < 1)
                    {
                        alert("Niepoprawny tytuł filmu");
                        tytul.focus();
                        return false;
                    }
                    if (tytul.value.length > 100)
                    {
                        alert("Niepoprawny tytuł filmu");
                        tytul.focus();
                        return false;
                    }
                }
                var autor = document.getElementById('autor');
                if (!(autor.disabled || autor.style.display === 'none' || autor.style.visibility === 'hidden'))
                {
                    regexp = /^[A-Za-zÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖØÙÚÛÜÝÞßàáâãäåæçèéêëìíîïðñòóôõöøùúûüýþÿ \t\r\n\f-.]*$/;
                    if (!regexp.test(autor.value))
                    {
                        alert("Niepoprawna nazwa autora");
                        autor.focus();
                        return false;
                    }
                    if (autor.value == "")
                    {
                        alert("Niepoprawna nazwa autora");
                        autor.focus();
                        return false;
                    }
                    if (autor.value.length < 3)
                    {
                        alert("Niepoprawna nazwa autora");
                        autor.focus();
                        return false;
                    }
                    if (autor.value.length > 100)
                    {
                        alert("Niepoprawna nazwa autora");
                        autor.focus();
                        return false;
                    }
                }
                var rok = document.getElementById('rok');
                if (!(rok.disabled || rok.style.display === 'none' || rok.style.visibility === 'hidden'))
                {
                    regexp = /^[-+]?\d*\.?\d*$/;
                    if (!regexp.test(rok.value))
                    {
                        alert("Niepoprawny rok wydania");
                        rok.focus();
                        return false;
                    }
                    if (rok.value == "")
                    {
                        alert("Niepoprawny rok wydania");
                        rok.focus();
                        return false;
                    }
                    if (rok.value.length < 4)
                    {
                        alert("Niepoprawny rok wydania");
                        rok.focus();
                        return false;
                    }
                    if (rok.value.length > 4)
                    {
                        alert("Niepoprawny rok wydania");
                        rok.focus();
                        return false;
                    }
                    if (rok.value != "" && !(rok.value >= 1000 && rok.value <= 9999))
                    {
                        alert("Niepoprawny rok wydania");
                        rok.focus();
                        return false;
                    }
                }
                var minuty = document.getElementById('minuty');
                if (!(minuty.disabled || minuty.style.display === 'none' || minuty.style.visibility === 'hidden'))
                {
                    regexp = /^[-+]?\d*\.?\d*$/;
                    if (!regexp.test(minuty.value))
                    {
                        alert("Niepoprawna liczba minut");
                        minuty.focus();
                        return false;
                    }
                    if (minuty.value == "")
                    {
                        alert("Niepoprawna liczba minut");
                        minuty.focus();
                        return false;
                    }
                    if (minuty.value.length < 1)
                    {
                        alert("Niepoprawna liczba minut");
                        minuty.focus();
                        return false;
                    }
                    if (minuty.value.length > 4)
                    {
                        alert("Niepoprawna liczba minut");
                        minuty.focus();
                        return false;
                    }
                    if (minuty.value != "" && !(minuty.value > 0 && minuty.value < 10000))
                    {
                        alert("Niepoprawna liczba minut");
                        minuty.focus();
                        return false;
                    }
                }
                var okladka = document.getElementById('okladka');
                if (!(okladka.disabled || okladka.style.display === 'none' || okladka.style.visibility === 'hidden'))
                {
                    regexp = /(http|https):\/\/(\w+:{0,1}\w*@)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%@!\-\/]))?/;
                    if (!regexp.test(okladka.value))
                    {
                        alert("Niepoprawny adres okładki");
                        okladka.focus();
                        return false;
                    }
                    if (okladka.value == "")
                    {
                        alert("Niepoprawny adres okładki");
                        okladka.focus();
                        return false;
                    }
                    if (okladka.value.length < 1)
                    {
                        alert("Niepoprawny adres okładki");
                        okladka.focus();
                        return false;
                    }
                }
                return true;
            }
        </script>
        <script>
            $(document).ready(function ()
            {
                $('#MegaMenu2 .submenu ul li h2 a').addClass('ui-widget-header');
                $('#MegaMenu2 .submenu ul li a').hover(function ()
                {
                    $(this).addClass('ui-state-hover');
                }, function ()
                {
                    $(this).removeClass('ui-state-hover');
                });
                $('.ui-state-default').hover(function ()
                {
                    $(this).addClass('ui-state-hover');
                }, function ()
                {
                    $(this).removeClass('ui-state-hover');
                });
                $('#MegaMenu2 li').hover(function ()
                {
                    var top = $(this).find('.button').outerHeight();
                    $(this).find('.submenu').css({'top': top});
                    $(this).find('.submenu').show();
                    var maxWidth = 0;
                    $(this).find('ul').each(function ()
                    {
                        $(this).find('li').each(function ()
                        {
                            $(this).css('width', 'auto');
                            if ($(this).width() > maxWidth)
                                maxWidth = $(this).width();
                        });
                    });
                    $(this).find('ul').each(function ()
                    {
                        $(this).find('li').width(maxWidth);
                        $(this).css({'width': maxWidth + 10});
                    });
                    if ($(this).find('.row').length > 0)
                    {
                        var maxRowWidth = 0;
                        $(this).find('.row').each(function ()
                        {
                            var width = 0;
                            $(this).find('ul').each(function ()
                            {
                                width += $(this).width();
                            });
                            if (width > maxRowWidth)
                            {
                                maxRowWidth = width;
                            }
                        });
                        $(this).find('.submenu').css({'width': maxRowWidth});
                        $(this).find('.row:last').css({'margin': '0'});
                    } else
                    {
                        var width = 0;
                        $(this).find('ul').each(function ()
                        {
                            width += $(this).width();
                        });
                        $(this).find('.submenu').css({'width': width});
                    }
                    $(this).find('.submenu').slideDown();
                }, function ()
                {
                    $(this).find('.submenu').hide();
                })
                $('#MegaMenu2 li .submenu').hide();
            });
        </script>
        <link async href="http://fonts.googleapis.com/css?family=Monoton" data-generated="http://enjoycss.com" rel="stylesheet" type="text/css"/>
    </head>
    <body>

        <%
           
            
            if (request.getParameter("gatunek") != null) {
                
                Film film = new Film(0);
                String tytul = request.getParameter("tytul");
                String autor = request.getParameter("autor");
                String rok_wydania = request.getParameter("rok");
                String minuty = request.getParameter("minuty");
                String obejrzane = request.getParameter("obejrzane");
                String gatunek = request.getParameter("gatunek");
                String okladka = request.getParameter("okladka");
                int checkNewFilm = film.addFilm(tytul, autor, rok_wydania, minuty, obejrzane, gatunek, okladka, uzytkownik);
                if (checkNewFilm == 1) {
                    out.print("<script> window.location = './index.jsp'; </script>");
                    
                    return;
                } else {
                    out.print("<script> alert('Dodawanie filmu nie powiodło się, spróbuj jeszcze raz') </script>");
                }
            }
        %> 

        <div id="container">
            <div id="Layer1" style="position:absolute;text-align:left;left:185px;top:121px;width:556px;height:644px;z-index:41;">
                <div id="wb_Text3" style="position:absolute;left:161px;top:24px;width:250px;height:23px;z-index:21;">
                    <span style="color:#008BB9;font-family:'Trebuchet MS';font-size:17px;"><strong>Dodawanie filmu:</strong></span></div>
                <div id="wb_Form1" style="position:absolute;left:0px;top:70px;width:556px;height:487px;z-index:22;">
                    <form name="Form1" method="post" action="./add.jsp" id="Form1" onsubmit="return ValidateForm1()">
                        <input type="hidden" name="formname" value="add" id="formname">
                        <select name="gatunek" size="1" id="gatunek" style="position:absolute;left:161px;top:305px;width:303px;height:35px;z-index:3;">
                            <option value="Fantastyka">Fantastyka</option>
                            <option value="Fantastyka">Fantastyka</option>
                            <option value="Horror">Horror</option>
                            <option value="Przygodowa">Przygodowa</option>
                            <option value="Thriller">Thriller</option>
                            <option value="Kryminal">Kryminal</option>
                            <option value="Biografia">Biografia</option>
                        </select>
                        <input type="submit" id="Button1" name="" value="Zatwierdź" style="position:absolute;left:161px;top:416px;width:303px;height:40px;z-index:4;">
                        <input type="text" id="tytul" style="position:absolute;left:161px;top:14px;width:293px;height:25px;line-height:25px;z-index:5;" name="tytul" value="" maxlength="100" spellcheck="false">
                        <input type="text" id="autor" style="position:absolute;left:161px;top:72px;width:293px;height:25px;line-height:25px;z-index:6;" name="autor" value="" maxlength="100" spellcheck="false">
                        <input type="text" id="rok" style="position:absolute;left:161px;top:130px;width:293px;height:25px;line-height:25px;z-index:7;" name="rok" value="" maxlength="4" spellcheck="false">
                       <div id="wb_Text10" style="position:absolute;left:435px;top:373px;width:29px;height:16px;text-align:right;z-index:8;">
                            <span style="color:#f8f8ff;font-family:Arial;font-size:15px;">Nie</span></div>
                        <div id="wb_Text9" style="position:absolute;left:373px;top:373px;width:29px;height:16px;z-index:9;">
                            <span style="color:#f8f8ff;font-family:Arial;font-size:15px;">Tak</span></div>
                        <input type="text" id="minuty" style="position:absolute;left:161px;top:188px;width:293px;height:25px;line-height:25px;z-index:10;" name="minuty" maxlength="4" spellcheck="false">
                        <div id="wb_RadioButton1" style="position:absolute;left:415px;top:370px;width:20px;height:20px;z-index:11;">
                            <input type="radio" id="RadioButton1" name="obejrzane" value="Nie" checked style="position:absolute;left:0;top:0;"><label for="RadioButton1"></label></div>
                        <div id="wb_RadioButton2" style="position:absolute;left:345px;top:370px;width:20px;height:20px;z-index:12;">
                            <input type="radio" id="RadioButton2" name="obejrzane" value="Tak" style="position:absolute;left:0;top:0;"><label for="RadioButton2"></label></div>
                        <div id="wb_Text7" style="position:absolute;left:89px;top:368px;width:111px;height:20px;text-align:right;z-index:13;">
<span style="color:#646464;font-family:'Trebuchet MS';font-size:15px;"><strong>obejrzany:</strong></span></div>
                        <div id="wb_Text4" style="position:absolute;left:78px;top:23px;width:64px;height:20px;text-align:right;z-index:14;">
                            <span style="color:#646464;font-family:'Trebuchet MS';font-size:15px;"><strong>Tytuł:</strong></span></div>
                        <div id="wb_Text8" style="position:absolute;left:31px;top:311px;width:111px;height:20px;text-align:right;z-index:15;">
                            <span style="color:#646464;font-family:'Trebuchet MS';font-size:15px;"><strong>Gatunek:</strong></span></div>
                        <div id="wb_Text2" style="position:absolute;left:31px;top:194px;width:111px;height:20px;text-align:right;z-index:16;">
                            <span style="color:#646464;font-family:'Trebuchet MS';font-size:15px;"><strong>Liczba minut:</strong></span></div>
                        <div id="wb_Text6" style="position:absolute;left:31px;top:136px;width:111px;height:20px;text-align:right;z-index:17;">
                            <span style="color:#646464;font-family:'Trebuchet MS';font-size:15px;"><strong>Rok wydania:</strong></span></div>
                        <div id="wb_Text5" style="position:absolute;left:78px;top:81px;width:64px;height:20px;text-align:right;z-index:18;">
                            <span style="color:#646464;font-family:'Trebuchet MS';font-size:15px;"><strong>Autor:</strong></span></div>
                        <input type="url" id="okladka" style="position:absolute;left:161px;top:246px;width:293px;height:25px;line-height:25px;z-index:19;" name="okladka" value="" spellcheck="false">
                        <div id="wb_Text11" style="position:absolute;left:10px;top:252px;width:132px;height:20px;text-align:right;z-index:20;">
                            <span style="color:#646464;font-family:'Trebuchet MS';font-size:15px;"><strong>Link do okładki:</strong></span></div>
                    </form>
                </div>
            </div>
        </div>
       <div id="PageHeader1" style="position:absolute;text-align:center;left:0px;top:0px;width:100%;height:88px;z-index:7777;">
<div id="PageHeader1_Container" style="width:994px;position:relative;margin-left:auto;margin-right:auto;text-align:left;">
<div id="wb_Image1" style="position:absolute;left:0px;top:21px;width:48px;height:48px;z-index:0;">
<a href="./index.jsp"><img src="images/icons8-taśma-filmowa-96.png" id="Image1" alt=""></a></div>
<div id="wb_Text1" style="position:absolute;left:68px;top:16px;width:191px;height:43px;z-index:1;">Filmoteka online</div>
<div id="wb_MegaMenu2" style="position:absolute;left:390px;top:17px;width:890px;height:53px;z-index:2;">
                    <ul class="ui-widget" id="MegaMenu2">
                        <li>
                            <a href="./index.jsp" class="button ui-state-default ui-state-active">Moje filmy</a>
                        </li>
                        <li>
                            <a href="./dodaj.jsp" class="button ui-state-default">Dodaj film</a>
                        </li>
                        <li>
                            <a href="./rejestruj.jsp" class="button ui-state-default">Rejestracja</a>
                        </li>

                    </ul>
                </div>
            </div>
        </div>
    </body>
</html>
