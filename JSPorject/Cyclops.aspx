<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="imgBanner" Runat="Server">
    <div class="bgded" style="background-image:url('images/Cyclops/CyclopsBanner.jpg');">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="heroName" Runat="Server">
    סייקלופס
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="iconHero" Runat="Server">
    <img style="margin-bottom:12px" src="https://img.icons8.com/color/70/000000/cyclop-marvel.png"/>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="nameHero" Runat="Server">
סקוט סאמרס

</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="firstShow" Runat="Server">
  X-Men #1 <br /> (ספטמבר 1963)
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="race" Runat="Server">
    מוטנאנט
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="DcMarvel" Runat="Server">
    <img style="margin-bottom:12px; width:100px; height:70px"  src="images/Main/MarvelLogo.png" />
</asp:Content>
<asp:Content ID="Content9" ContentPlaceHolderID="DcMarvelText" Runat="Server">
    	Marvel Comics
</asp:Content>
<asp:Content ID="Content10" ContentPlaceHolderID="sideImg" Runat="Server">
    <img class="inspace-10 borderedbox" src="images/Cyclops/CyclopsSideImg.jpg"/>
</asp:Content>
<asp:Content ID="Content11" ContentPlaceHolderID="superPowersHeadLine" Runat="Server">
    :יכולותיו של סייקלופס
</asp:Content>
<asp:Content ID="Content12" ContentPlaceHolderID="superPowersText" Runat="Server">
סייקלופס יש את היכולת המוטאנטית לשגר קרני אנרגיה מעיניו, והיא מתוארת כ"פיצוץ אופטי". הקרניים נראות כאור אדום (לדוגמה קרינה אלקטרומגנטית בגל אדום). אולם, אין הם מותירות סימני חום אלא יוצאות ככוח הרסני וללא כל רתע. הקרניים חזקות ביותר וניתן להשתמש בהן כדי לקרוע לוחות מתכת ולאייד סלעים. סייקלופס הדגים יכולת מרשימה של דיוק ומיומנות בשליטה במטחי האנרגיה היוצאות מתוך עיניו דרך משקפי המגן שלו, והוא מסוגל לשלוט ברוחבה של הקרן, בגובהה ובעוצמתה. בנוסף, הוא מסוגל לשקף את הקרן דרך משטחים שונים

</asp:Content>

<asp:Content ID="Content13" ContentPlaceHolderID="superPowers" Runat="Server">
        <li class="one_half first btmspace-10">	יריית מטחי אנרגיה חזקים מעיניו </li>
        <li class="one_half btmspace-10">מדידת מרחקים על ידי טריאנגולציה</li>
        <li class="one_half first btmspace-10">חסינות למתקפותיו של האבוק</li>
        <li class="one_half btmspace-10">אמן לחימה מיומן</li>


</asp:Content>
<asp:Content ID="Content23" ContentPlaceHolderID="actorsBackground" Runat="Server">
    <div class="wrapper bgded overlay" style="background-image:url('images/Cyclops/CyclopsBack.jpg');">
</asp:Content>
<asp:Content ID="Content14" ContentPlaceHolderID="act1Img" Runat="Server">
    <img class="borderedbox inspace-10 btmspace-30" style="width:272px; height:358px" src="images/Cyclops/Actor1.jpg" alt=""/>
</asp:Content>
<asp:Content ID="Content15" ContentPlaceHolderID="act1" Runat="Server">
    ג'יימס מרסדן
    (גרסה מבוגרת; "אקס-מן", "אקס-מן 2", "אקס-מן 3: המפלט האחרון", "אקס-מן: העתיד שהיה")
</asp:Content>
<asp:Content ID="Content16" ContentPlaceHolderID="act1desc" Runat="Server">
בשנת 2000 הגיעה פריצתו המשמעותית של מרסדן, כששיחק את סייקלופס בסדרת הסרטים "אקס-מן", לצד יו ג'קמן, פטריק סטיוארט, איאן מקלן, האלי ברי, פמקה ינסן ואנה פקווין. בשנת 2014 חזר לשחק בסרט "אקס-מן: העתיד שהיה"

</asp:Content>
<asp:Content ID="Content17" ContentPlaceHolderID="act2Img" Runat="Server">
</asp:Content>
<asp:Content ID="Content18" ContentPlaceHolderID="act2" Runat="Server">
</asp:Content>
<asp:Content ID="Content19" ContentPlaceHolderID="act2desc" Runat="Server">
</asp:Content>
<asp:Content ID="Content20" ContentPlaceHolderID="act3Img" Runat="Server">
        <img class="borderedbox inspace-10 btmspace-30" style="width:272px; height:358px" src="images/Cyclops/Actor2.jpg" alt=""/>
</asp:Content>
<asp:Content ID="Content21" ContentPlaceHolderID="act3" Runat="Server">
    טיי שרידן
    (גרסה צעירה; "אקס-מן: אפוקליפסה", "אקס-מן: הפניקס האפלה")
</asp:Content>
<asp:Content ID="Content22" ContentPlaceHolderID="act3desc" Runat="Server">
שרידן שיחק את המוטציה סקוט סאמרס / סייקלופס בסרט אקס-מן: אפוקליפסה משנת 2016, שיצא לאקרנים ב 27. במאי. לאחר מכן החזיר את תפקידו של סקוט סאמרס / סייקלופס בסרט "Dark Phoenix" מ-2019
</asp:Content>

