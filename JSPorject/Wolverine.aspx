<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="imgBanner" Runat="Server">
    <div class="bgded" style="background-image:url('images/Wolverine/WolverineBanner.jpg');">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="heroName" Runat="Server">
    וולברין
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="iconHero" Runat="Server">
    <img style="margin-bottom:12px;width:70px;height:70px" src="images/Wolverine/WolverineSymbol.jpg"/>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="nameHero" Runat="Server">
    ג'יימס האולט 
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="firstShow" Runat="Server">
    The Incredible Hulk #180 <br /> (אוקטובר 1974)
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
    <img class="inspace-10 borderedbox" src="images/Wolverine/WolverineSideImg.jpg"/>
</asp:Content>
<asp:Content ID="Content11" ContentPlaceHolderID="superPowersHeadLine" Runat="Server">
    :יכולותיו של וולברין
</asp:Content>
<asp:Content ID="Content12" ContentPlaceHolderID="superPowersText" Runat="Server">
הכוח המוטאנטי הראשי שלו הוא תהליך ההתרפאות המואץ שהוא עובר, המכונה לעיתים קרובות גורם הריפוי המוטאנטי שלו. יכולת זו מחדשת רקמות גוף שנפגעו או נהרסו, מעבר ליכולת של אדם רגיל לרפא. בנוסף לריפוי מואץ של פצעים פיזיים, יכולת ההתרפאות של וולברין הופכת אותו לעמיד במיוחד בפני מחלות, סמים ורעלים. למרות זאת, הוא עדיין יכול לסבול מהאפקטים המיידיים של חומרים כאלה בכמויות גדולות: נראה שהוא הופך שיכור אחרי כמויות גדולות של אלכוהול, ובמקרים רבים הוא נחלש זמנית אחרי שהורעל בכמות גדולה של רעלים או סמים המוטציה של וולברין גורמת גם להסתגלות חייתית של גופו, הכוללת ניבים מחודדים ומוארכים ושלושה טופרים נשלפים השוכנים בגב כל כף יד. למרות שבמקור הטופרים תוארו כשתלים ביוניים שנוצרו על ידי תוכנית נשק אקס, אחרי זה נחשף שהם חלק טבעי של גופו. הטופרים לא עשויים מקרטין, כמו שבדרך כלל נראה בעולם החי, אלא עשויים מעצם מאוד דחוסה. בשילוב עם ציפוי האדמנטיום שעליהם, הטופרים יכולים לחתוך כמעט כל חומר יציב כמו רוב המתכות, עץ, וצורות מסוימות של אבן. וולברין משתמש בטופריו גם לשם חסימת מתקפות או טילים, וכן גם כדי להנעץ בתוך משטחים, מה שמאפשר לו לטפס על מבנים ומצוקים.למרות הכל, בידיו של וולברין אין פתח דרכו הטופרים יכולים לצאת: הם חותכים דרך בשרו בכל פעם שהוא שולף אותם. לפעמים וולברין מתייחס לשליפת הטופרים בצורה כלשהי, התייחסות שרומזת על כך שהוא מרגיש רגע קצר של כאב בידיו כשהוא שולף אותם. במהלך שיחה עם ג'ובילי, וולברין חושף שיש תעלות בתוך אמותיו בהן הטפרים עוברים כאשר הוא שולף אותם, ולכן הוא שולף את הטפרים כמה פעמים ביום כדי לשמור את התעלות פתוחות, באופן הדומה לחורים באוזניים</asp:Content>

<asp:Content ID="Content13" ContentPlaceHolderID="superPowers" Runat="Server">
        <li class="one_half first btmspace-10">	יכולת החלמה מהירה </li>
        <li class="one_half btmspace-10">ריפוי עצמי</li>
        <li class="one_half first btmspace-10">שלד מצופה אדמנטיום</li>
        <li class="one_half btmspace-10">טפרי אדמנטיום נשלפים</li>
        <li class="one_half first btmspace-10">חושים מפותחים</li>
        <li class="one_half btmspace-10">חוזק-על</li>
        <li class="one_half first btmspace-10">סיבולת-על</li>
        <li class="one_half btmspace-10">מהירות מוגברת</li>
        <li class="one_half first btmspace-10">אריכות חיים</li>
        <li class="one_half btmspace-10">ניבים מוארכים וחדים</li>

</asp:Content>
<asp:Content ID="Content23" ContentPlaceHolderID="actorsBackground" Runat="Server">
    <div class="wrapper bgded overlay" style="background-image:url('images/Wolverine/WolverineBack.jpg');">
</asp:Content>
<asp:Content ID="Content14" ContentPlaceHolderID="act1Img" Runat="Server">
</asp:Content>
<asp:Content ID="Content15" ContentPlaceHolderID="act1" Runat="Server">
</asp:Content>
<asp:Content ID="Content16" ContentPlaceHolderID="act1desc" Runat="Server">
</asp:Content>
<asp:Content ID="Content17" ContentPlaceHolderID="act2Img" Runat="Server">
        <img class="borderedbox inspace-10 btmspace-30" style="width:272px; height:358px" src="images/Wolverine/Actor1.jpg" alt=""/>
</asp:Content>
<asp:Content ID="Content18" ContentPlaceHolderID="act2" Runat="Server">
    יו ג'קמן
    (סדרת סרטי אקס-מן)
</asp:Content>
<asp:Content ID="Content19" ContentPlaceHolderID="act2desc" Runat="Server">
 בשנת 2000 לוהק בתפקיד וולברין בסרט "אקס-מן". למעשה ג'קמן לא היה הבחירה המקורית לתפקיד, שכן המפיקים ליהקו תחילה את השחקן הסקוטי דאגרי סקוט. אך סקוט היה מחויב לצילומי "משימה בלתי אפשרית 2" שהתארכו מעבר למתוכנן. דמותו האייקונית של וולברין התבררה כנכונה עבור ג'קמן, אשר נבחר לגלם שוב את התפקיד בסרטים הבאים עד לשנת 2017. בשנת 2017 הופיע בתפקיד הראשי בסרט "לוגאן - וולברין", סרט גיבורי-על מבית מארוול קומיקס המבוסס על זיכיון הקומיקס "וולברין: לוגאן הזקן", העשירי בסדרת סרטי אקס-מן והשלישי והאחרון בטרילוגיית וולברין, אחרי אקס-מן המקור: וולברין (מ-2009), ווולברין (מ-2013). בסרט הוא משחק לצד פטריק סטיוארט וריצ'רד אי. גרנט

</asp:Content>
<asp:Content ID="Content20" ContentPlaceHolderID="act3Img" Runat="Server">
</asp:Content>
<asp:Content ID="Content21" ContentPlaceHolderID="act3" Runat="Server">
</asp:Content>
<asp:Content ID="Content22" ContentPlaceHolderID="act3desc" Runat="Server">
</asp:Content>

