<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Login"].ToString() == "אורח")
        {
            Response.Redirect("Err.aspx");
            Response.End();
        }
    }
</script>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">


        var date1 = new Date();
        var start = date1.getTime();

        function checkingAns() {
            var radio, points = 0;
            for (var i = 1; i <= 10; i++) {
                radio = document.getElementsByName(i);
                for (var j = 0; j < radio.length; j++) {
                    if (radio[j].checked) {
                        if (radio[j].value == "correct") {
                            points += 10;
                            document.getElementById("correct" + i).style.color = "#00ff00"
                        }
                    }
                }
            }
            document.getElementById("score").innerHTML = "ציונך: " + points;
            document.getElementById("delete").innerHTML = "";
        }

        function Time() {
            var date2 = new Date();
            var stop = date2.getTime();
            var time = stop - start;
            time /= 1000;
            var minutes = Math.floor(time / 60);
            var seconds = Math.floor(time % 60);
            document.getElementById("time").innerHTML = ("הזמן שלך " + minutes + ":" + seconds + " דקות");
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="imgBanner" runat="Server">
    <div class="bgded" style="height: 848px; background-image: url('images/HomePage/HomePageBanner.jpg');">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="heroName" runat="Server">
    <p style="margin-top: 30px; background-color: rgba(142,123,123,.63); width: 435px; float: right">שאלון גיבורי על</p>
</asp:Content>
<asp:Content ID="Content10" ContentPlaceHolderID="sideImg" runat="Server">
    <br />
</asp:Content>
<asp:Content ID="Content11" ContentPlaceHolderID="superPowersHeadLine" runat="Server">
    <h1 class="heading" style="text-align: center; font-family: Calibri; font-weight: bolder; font-size: 80px; text-decoration: underline;">שאלון גיבורי על</h1>
</asp:Content>
<asp:Content ID="Content12" ContentPlaceHolderID="superPowersText" runat="Server">
    <h1 id="score" style="text-align: center; font-family: Calibri; font-weight: bolder; font-size: 30px; color: dimgray;"></h1>
    <h1 id="time" style="text-align: center; font-family: Calibri; font-weight: bolder; font-size: 30px; color: dimgray;"></h1>
    <form>

        <div class="font-x1">?מה הוא גזעו של גרוט</div>
        <br />

        <span style="color: black; font-size: 20px;" id="correct1">קולוסוס פלורה</span>
        <input type="radio" name="1" value="correct" style="width: 20px; height: 20px; margin-left: 10px;"><br />

        <span style="color: black; font-size: 20px;">בן אנוש</span>
        <input type="radio" name="1" value="1" style="width: 20px; height: 20px; margin-left: 10px;"><br />

        <span style="color: black; font-size: 20px;">טרי</span>
        <input type="radio" name="1" value="1" style="width: 20px; height: 20px; margin-left: 10px;"><br />

        <span style="color: black; font-size: 20px;">חוסמוסוס</span>
        <input type="radio" name="1" value="1" style="width: 20px; height: 20px; margin-left: 10px;"><br />
        <br />
        <br />

        <div class="font-x1">?ממה קיבל מיסטר פנטסטיק את כוחותיו</div>
        <br />

        <span style="color: black; font-size: 20px;" id="correct2">קרניים קוסמיות</span>
        <input type="radio" name="2" value="correct" style="width: 20px; height: 20px; margin-left: 10px;"><br />

        <span style="color: black; font-size: 20px;">הנדוס גנטי</span>
        <input type="radio" name="2" value="1" style="width: 20px; height: 20px; margin-left: 10px;"><br />

        <span style="color: black; font-size: 20px;">נחנק מגומי</span>
        <input type="radio" name="2" value="1" style="width: 20px; height: 20px; margin-left: 10px;"><br />

        <span style="color: black; font-size: 20px;">מלידה</span>
        <input type="radio" name="2" value="1" style="width: 20px; height: 20px; margin-left: 10px;"><br />
        <br />
        <br />

        <div class="font-x1">?ממה טפריו של וולברין עשויות</div>
        <br />

        <span style="color: black; font-size: 20px;">אלומיניום</span>
        <input type="radio" name="3" value="1" style="width: 20px; height: 20px; margin-left: 10px;"><br />

        <span style="color: black; font-size: 20px;">ויברניום</span>
        <input type="radio" name="3" value="1" style="width: 20px; height: 20px; margin-left: 10px;"><br />

        <span style="color: black; font-size: 20px;" id="correct3">אדמנטיום</span>
        <input type="radio" name="3" value="correct" style="width: 20px; height: 20px; margin-left: 10px;"><br />

        <span style="color: black; font-size: 20px;">כסף</span>
        <input type="radio" name="3" value="1" style="width: 20px; height: 20px; margin-left: 10px;"><br />
        <br />
        <br />

        <div class="font-x1">?מהו שמו האמיתי של איירון-מן</div>
        <br />

        <span style="color: black; font-size: 20px;" >ברוס ויין</span>
        <input type="radio" name="4" value="1" style="width: 20px; height: 20px; margin-left: 10px;"><br />

        <span style="color: black; font-size: 20px;">ייף קפלן</span>
        <input type="radio" name="4" value="1" style="width: 20px; height: 20px; margin-left: 10px;"><br />

        <span style="color: black; font-size: 20px;">רוברט דאוני ג'וניור</span>
        <input type="radio" name="4" value="1" style="width: 20px; height: 20px; margin-left: 10px;"><br />

        <span style="color: black; font-size: 20px;" id="correct4">טוני סטארק</span>
        <input type="radio" name="4" value="correct" style="width: 20px; height: 20px; margin-left: 10px;"><br />
        <br />
        <br />

        <div class="font-x1">?באיזו צורה הפרח אשר מעניק לפנתר השחור</div>
        <br />

        <span style="color: black; font-size: 20px;" id="correct5">לב</span>
        <input type="radio" name="5" value="correct" style="width: 20px; height: 20px; margin-left: 10px;"><br />

        <span style="color: black; font-size: 20px;">כוכב</span>
        <input type="radio" name="5" value="1" style="width: 20px; height: 20px; margin-left: 10px;"><br />

        <span style="color: black; font-size: 20px;">עלה</span>
        <input type="radio" name="5" value="1" style="width: 20px; height: 20px; margin-left: 10px;"><br />

        <span style="color: black; font-size: 20px;">פרח</span>
        <input type="radio" name="5" value="1" style="width: 20px; height: 20px; margin-left: 10px;"><br />
        <br />
        <br />

        <div class="font-x1">?היכן וונדר וומן נולדה</div>
        <br />

        <span style="color: black; font-size: 20px;">דרום סודאן</span>
        <input type="radio" name="6" value="1" style="width: 20px; height: 20px; margin-left: 10px;"><br />

        <span style="color: black; font-size: 20px;">קריפטון</span>
        <input type="radio" name="6" value="1" style="width: 20px; height: 20px; margin-left: 10px;"><br />

        <span style="color: black; font-size: 20px;" id="correct6">תמיסקירה</span>
        <input type="radio" name="6" value="correct" style="width: 20px; height: 20px; margin-left: 10px;"><br />

        <span style="color: black; font-size: 20px; ">באר שבע</span>
        <input type="radio" name="6" value="1" style="width: 20px; height: 20px; margin-left: 10px;"><br />
        <br />
        <br />

        <div class="font-x1">?את איזו דמות ריי פישר גילם</div>
        <br />

        <span style="color: black; font-size: 20px;" id="correct7">סייבורג</span>
        <input type="radio" name="7" value="correct" style="width: 20px; height: 20px; margin-left: 10px;"><br />

        <span style="color: black; font-size: 20px;">וולברין</span>
        <input type="radio" name="7" value="1" style="width: 20px; height: 20px; margin-left: 10px;"><br />

        <span style="color: black; font-size: 20px;">ביסט-בוי</span>
        <input type="radio" name="7" value="1" style="width: 20px; height: 20px; margin-left: 10px;"><br />

        <span style="color: black; font-size: 20px; ">באטמן</span>
        <input type="radio" name="7" value="1" style="width: 20px; height: 20px; margin-left: 10px;"><br />
        <br />
        <br />

        <div class="font-x1">?איפה שרה לאנס הוכשרה</div>
        <br />

        <span style="color: black; font-size: 20px;">ליגת המתאבקים</span>
        <input type="radio" name="8" value="1" style="width: 20px; height: 20px; margin-left: 10px;"><br />

        <span style="color: black; font-size: 20px;" id="correct8">ליגת המתנקשים</span>
        <input type="radio" name="8" value="correct" style="width: 20px; height: 20px; margin-left: 10px;"><br />

        <span style="color: black; font-size: 20px;">ליגת הגיבורים</span>
        <input type="radio" name="8" value="1" style="width: 20px; height: 20px; margin-left: 10px;"><br />

        <span style="color: black; font-size: 20px; ">חבורת המתאבדים</span>
        <input type="radio" name="8" value="1" style="width: 20px; height: 20px; margin-left: 10px;"><br />
        <br />
        <br />

        <div class="font-x1">?מי הוא האל ג'ורדן</div>
        <br />

        <span style="color: black; font-size: 20px;" id="correct9">גרין לנטרן</span>
        <input type="radio" name="9" value="correct" style="width: 20px; height: 20px; margin-left: 10px;"><br />

        <span style="color: black; font-size: 20px;">באטמן</span>
        <input type="radio" name="9" value="1" style="width: 20px; height: 20px; margin-left: 10px;"><br />

        <span style="color: black; font-size: 20px;">דדפול</span>
        <input type="radio" name="9" value="1" style="width: 20px; height: 20px; margin-left: 10px;"><br />

        <span style="color: black; font-size: 20px; ">נייטווינג</span>
        <input type="radio" name="9" value="1" style="width: 20px; height: 20px; margin-left: 10px;"><br />
        <br />
        <br />

        <div class="font-x1">?מה הוא שמה של השחקנית אשר שיחקה את ויקסן</div>
        <br />

        <span style="color: black; font-size: 20px;">קייטי לוץ</span>
        <input type="radio" name="10" value="1" style="width: 20px; height: 20px; margin-left: 10px;"><br />

        <span style="color: black; font-size: 20px;">אנה דיופ</span>
        <input type="radio" name="10" value="1" style="width: 20px; height: 20px; margin-left: 10px;"><br />

        <span style="color: black; font-size: 20px;">בריט אירווין</span>
        <input type="radio" name="10" value="1" style="width: 20px; height: 20px; margin-left: 10px;"><br />

        <span style="color: black; font-size: 20px;" id="correct10">מייסי סלרס</span>
        <input type="radio" name="10" value="correct" style="width: 20px; height: 20px; margin-left: 10px;"><br />
        <br />
        <br />


    </form>
    <center>
            <div id="delete">
            <button onclick="checkingAns(); Time()" >שלח</button>
            </div>
            <br />
            <button><a href="quiz.aspx">איפוס</a></button>
    </center>




</asp:Content>




