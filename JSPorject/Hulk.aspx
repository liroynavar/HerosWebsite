<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="imgBanner" Runat="Server">
    <div class="bgded" style="background-image:url('images/Hulk/HulkBanner.jpg');"> 
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="heroName" Runat="Server">
    הענק הירוק
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="iconHero" Runat="Server">
    <img style="margin-bottom:12px;width:70px;height:70px" src="images/Hulk/HulkSymbol.jpg"/>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="nameHero" Runat="Server">
רוברט ברוס באנר
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="firstShow" Runat="Server">
    The Incredible Hulk #1 <br /> (מאי 1962)
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="race" Runat="Server">
    מוטציה
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="DcMarvel" Runat="Server">
    <img style="margin-bottom:12px; width:100px; height:70px"  src="images/Main/MarvelLogo.png" />
</asp:Content>
<asp:Content ID="Content9" ContentPlaceHolderID="DcMarvelText" Runat="Server">
    	Marvel Comics
</asp:Content>
<asp:Content ID="Content10" ContentPlaceHolderID="sideImg" Runat="Server">
    <img class="inspace-10 borderedbox" src="images/Hulk/HulkSideImg.jpg"/>
</asp:Content>
<asp:Content ID="Content11" ContentPlaceHolderID="superPowersHeadLine" Runat="Server">
    :יכולותיו של הענק הירוק
</asp:Content>
<asp:Content ID="Content12" ContentPlaceHolderID="superPowersText" Runat="Server">
הענק מחזיק בפוטנציאל לכוח פיזי בלתי מוגבל שקשור ישירות למצבו הנפשי, בייחוד הזעם שלו. ככל שמצב החרדה והזעם של ברוס באנר עולה, כך גם מתעצם כוחו של הענק. נסיונותיו של דייוויד באנר לשחזר את נוסחת סופר-חייל וכן הניסויים אותם ערך על עצמו הביאו לשינויים גנטיים אותם העביר בירושה לבנו. אפיונים גנטיים אלה והשינויים להם גרמו שכבו רדומים עד אשר הופעלו בידי הקרינה של פצצת הגמא. כאשר הוא הופך לענק, ה-DNA של באנר מתיישר בצורה כזו כדי לפעול כאנטנה קוסמית הסופגת אנרגיה קינטית ישירות מהמולטי-יקום. כמו רדיו, ככל שהענק כועס יותר, כך השינוי הגנטי מתעצם. היכולת לספוג אנרגיה ממקור בלתי נדלה זה מעניקה לענק חזות מאיימת ושרירית וכן כוח בלתי מוגבל. כמו כן, הסיבולת שלו, הריפוי העצמי וכן יכולת ההתמדה שלו מוגברים בהתאם למצבו הנפשי. למרות חסינותו המדהימה, ירי ממושך של מכונת ירייה יכול להאט את מהירות התקדמותו. לענק יכולת ריפוי עצמי והסתגלות, כולל גידולן של רקמות המקנות לו יכולת נשימה מתחת למים, לשרוד בחלל לפרקי זמן ממושכים והחלמה מפצעים בתוך שניות. כתוצאה מכך, יש לו תוחלת חיים ארוכה ביותר. כמו כן, הענק חסין בפני מחלות ורעלים ומסוגל להחלים באופן מיידי מכל פגיעה. רגליו העוצמתיות של הענק מאפשרות לו לזנק מרחק אדיר לאורכן של יבשות שלמות והוא אף הפגין מהירות המשתווה לזו של תור ושל הסנטרי. כברוס באנר, הוא מוכר בתור אחד המוחות הגדולים ביותר שידע יקום מארוול. באנר פיתח התמחות בביולוגיה, כימיה, הנדסה ופיזיולוגיה, והוא מחזיק בתואר דוקטורט בתחום הפיזיקה הגרעינית. באנר גם עושה שימוש באינטליגנציה שלו כדי לפתח טכנולוגיה ששווה ברמתה לזו של טוני סטארק או דוקטור דום</asp:Content>

<asp:Content ID="Content13" ContentPlaceHolderID="superPowers" Runat="Server">
        <li class="one_half first btmspace-10">חוזק-על</li>
        <li class="one_half btmspace-10">מהירות-על</li>
        <li class="one_half first btmspace-10">החלמה מהירה</li>
        <li class="one_half btmspace-10">אפשרות לספוג קרינה רדיואקטיבית</li>
        <li class="one_half first btmspace-10">שינוי צורה מוגבל</li>       
        <li class="one_half btmspace-10">גאונות-על</li>


</asp:Content>
<asp:Content ID="Content23" ContentPlaceHolderID="actorsBackground" Runat="Server">
    <div class="wrapper bgded overlay" style="background-image:url('images/Hulk/HulkBack.jpg');">
</asp:Content>
<asp:Content ID="Content14" ContentPlaceHolderID="act1Img" Runat="Server">
        <img class="borderedbox inspace-10 btmspace-30" style="width:272px; height:358px" src="images/Hulk/Actor1.jpg" alt=""/>
</asp:Content>
<asp:Content ID="Content15" ContentPlaceHolderID="act1" Runat="Server">
    אריק באנה 
    ("הענק")
</asp:Content>
<asp:Content ID="Content16" ContentPlaceHolderID="act1desc" Runat="Server">
    ב-2003 נבחר באנה על ידי הבמאי אנג לי לגלם את גיבור הסרט "הענק" (האלק/פרופסור באנר) לצידה של ג'ניפר קונלי
</asp:Content>
<asp:Content ID="Content17" ContentPlaceHolderID="act2Img" Runat="Server">
        <img class="borderedbox inspace-10 btmspace-30" style="width:272px; height:358px" src="images/Hulk/Actor2.jpg" alt=""/>
</asp:Content>
<asp:Content ID="Content18" ContentPlaceHolderID="act2" Runat="Server">
    אדוארד נורטון
    ("הענק הירוק")
</asp:Content>
<asp:Content ID="Content19" ContentPlaceHolderID="act2desc" Runat="Server">
ב-2008 גילם נורטון את דמותו של ברוס באנר, האלטר אגו לגיבור-העל הענק הירוק של מארוול קומיקס, בסרט "הענק הירוק"
</asp:Content>
<asp:Content ID="Content20" ContentPlaceHolderID="act3Img" Runat="Server">
        <img class="borderedbox inspace-10 btmspace-30" style="width:272px; height:358px" src="images/Hulk/Actor3.jpg" alt=""/>
</asp:Content>
<asp:Content ID="Content21" ContentPlaceHolderID="act3" Runat="Server">
    מארק רופאלו 
    ("היקום הקולנועי של מארוול")
</asp:Content>
<asp:Content ID="Content22" ContentPlaceHolderID="act3desc" Runat="Server">
    בשנת 2012 השתתף בסרט גיבורי העל "הנוקמים", המבוסס על קומיקס באותו שם, שם גילם את דמותו של הענק הירוק ברוס באנר. הוא שב לגלם את הדמות בסרטים "איירון מן 3", "הנוקמים: עידן אולטרון","תור: ראגנארוק" ו"הנוקמים: מלחמת האינסוף". ב-2017 שיחק בסרט האקשן "תור: ראגנארוק", בו גילם את הענק הירוק, זהו הסרט השלישי בטרילוגיית "תור" וגם הוא חלק מהיקום הקולנועי של מארוול
</asp:Content>

