<%-- 
    Author     : HP
--%>

<%@page import="bib.NoweKonto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>



    


<!doctype html>
<html lang="pl">
<head>
<meta charset="utf-8">
<title>Rejestracja</title>
<link href="index.css" rel="stylesheet">
        <link async href="http://fonts.googleapis.com/css?family=Warnes" data-generated="http://enjoycss.com" rel="stylesheet" type="text/css"/>
        <link async href="http://fonts.googleapis.com/css?family=Atomic%20Age" data-generated="http://enjoycss.com" rel="stylesheet" type="text/css"/>
        <script type="text/javascript" script-name="bangers" src="http://use.edgefonts.net/bangers.js"></script>
<script src="jquery-1.12.4.min.js"></script>
<script>
function ValidateForm1()
{
   var regexp;
   var login = document.getElementById('login');
   if (!(login.disabled || login.style.display === 'none' || login.style.visibility === 'hidden'))
   {
      regexp = /^[A-Za-zÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖØÙÚÛÜÝÞßàáâãäåæçèéêëìíîïðñòóôõöøùúûüýþÿ0-9-_-]*$/;
      if (!regexp.test(login.value))
      {
         alert("Niepoprawny login (akceptowane znaki: a-A,0-9,_,-)");
         login.focus();
         return false;
      }
      if (login.value == "")
      {
         alert("Niepoprawny login (akceptowane znaki: a-A,0-9,_,-)");
         login.focus();
         return false;
      }
      if (login.value.length < 1)
      {
         alert("Niepoprawny login (akceptowane znaki: a-A,0-9,_,-)");
         login.focus();
         return false;
      }
      if (login.value.length > 100)
      {
         alert("Niepoprawny login (akceptowane znaki: a-A,0-9,_,-)");
         login.focus();
         return false;
      }
   }
   var haslo = document.getElementById('haslo');
   if (!(haslo.disabled || haslo.style.display === 'none' || haslo.style.visibility === 'hidden'))
   {
      if (haslo.value == "")
      {
         alert("Niepoprawne hasło (min. 8 znaków)");
         haslo.focus();
         return false;
      }
      if (haslo.value.length < 8)
      {
         alert("Niepoprawne hasło (min. 8 znaków)");
         haslo.focus();
         return false;
      }
      if (haslo.value.length > 100)
      {
         alert("Niepoprawne hasło (min. 8 znaków)");
         haslo.focus();
         return false;
      }
   }
   var haslo2 = document.getElementById('haslo2');
   if (!(haslo2.disabled || haslo2.style.display === 'none' || haslo2.style.visibility === 'hidden'))
   {
      if (haslo2.value == "")
      {
         alert("Niepoprawne hasło");
         haslo2.focus();
         return false;
      }
      if (haslo2.value.length < 8)
      {
         alert("Niepoprawne hasło");
         haslo2.focus();
         return false;
      }
      if (haslo2.value.length > 100)
      {
         alert("Niepoprawne hasło");
         haslo2.focus();
         return false;
      }
      if (haslo2.value != document.getElementById('haslo').value)
      {
         alert("Hasła nie zgadzają się");
         haslo2.focus();
         return false;
      }
   }
   return true;
}
</script>
<link async href="http://fonts.googleapis.com/css?family=Monoton" data-generated="http://enjoycss.com" rel="stylesheet" type="text/css"/>
<head>
<body>
    
       <%

    if (request.getParameter("login") != null) {

 
        String username = request.getParameter("login");
        String password = request.getParameter("haslo");
        NoweKonto newAccount = new NoweKonto();
        
        int checkRegistration = newAccount.createAccount(username, password);
        if (checkRegistration == 1) {
            session.setAttribute("username", username);
            response.sendRedirect("./index.jsp");
        } else if (checkRegistration == 2) {
 out.print("<script> alert('Login zajęty') </script>");
        } else {
             out.print("<script> alert('Tworzenie konta nie powiodło się') </script>");
        }
    }
%>   
    <div id="container">
<div id="Layer1" style="position:absolute;text-align:left;left:166px;top:109px;width:507px;height:368px;z-index:19;">
<div id="wb_Text3" style="position:absolute;left:80px;top:36px;width:250px;height:23px;z-index:10;">
<span style="color:#008BB9;font-family:'Trebuchet MS';font-size:17px;"><strong>Rejestracja:</strong></span></div>
<div id="wb_Form1" style="position:absolute;left:13px;top:82px;width:470px;height:266px;z-index:11;">
<form name="Form1" method="post" action="./register.jsp" id="Form1" onsubmit="return ValidateForm1()">
<input type="hidden" name="formname" value="add" id="formname">
<input type="submit" id="Button1" name="" value="Zatwierdź" style="position:absolute;left:122px;top:188px;width:303px;height:40px;z-index:3;">
<input type="text" id="login" style="position:absolute;left:125px;top:14px;width:293px;height:25px;line-height:25px;z-index:4;" name="login" value="" maxlength="100" spellcheck="false">
<input type="password" id="haslo" style="position:absolute;left:125px;top:72px;width:293px;height:25px;line-height:25px;z-index:5;" name="haslo" value="" maxlength="100" autocomplete="off" spellcheck="false">
<div id="wb_Text4" style="position:absolute;left:24px;top:23px;width:64px;height:20px;text-align:right;z-index:6;">
<span style="color:#646464;font-family:'Trebuchet MS';font-size:15px;"><strong>Login:</strong></span></div>
<div id="wb_Text5" style="position:absolute;left:24px;top:81px;width:64px;height:20px;text-align:right;z-index:7;">
<span style="color:#646464;font-family:'Trebuchet MS';font-size:15px;"><strong>Hasło:</strong></span></div>
<input type="password" id="haslo2" style="position:absolute;left:125px;top:130px;width:293px;height:25px;line-height:25px;z-index:8;" name="haslo2" value="" maxlength="100" autocomplete="off" spellcheck="false">
<div id="wb_Text2" style="position:absolute;left:0px;top:139px;width:119px;height:20px;text-align:right;z-index:9;">
<span style="color:#646464;font-family:'Trebuchet MS';font-size:15px;"><strong>Powtórz hasło:</strong></span></div>
</form>
</div>
</div>
</div>
  <div id="PageHeader1" style="position:absolute;text-align:center;left:0px;top:0px;width:100%;height:88px;z-index:7777;">
<div id="PageHeader1_Container" style="width:994px;position:relative;margin-left:auto;margin-right:auto;text-align:left;">
<div id="wb_Image1" style="position:absolute;left:0px;top:21px;width:48px;height:43px;z-index:0;">
<a href="./index.jsp"><img src="images/icons8-taśma-filmowa-96.png" id="Image1" alt=""></a></div>
<div id="wb_Text1" style="position:absolute;left:68px;top:16px;width:191x;height:48px;z-index:1;">Filmoteka online</div>
<div id="wb_MegaMenu2" style="position:absolute;left:390px;top:17px;width:890px;height:53px;z-index:2;">
   <ul class="ui-widget" id="MegaMenu2">
      <li>
      <a href="./index.jsp" class="button ui-state-default ui-state-active">Moje filmy</a>
      </li>
      <li>
      <a href="./dodaj.jsp" class="button ui-state-default">Dodaj film</a>
      </li>
      
      </li>
   </ul>
</div>
</div>
</div>

</body>
</html>
