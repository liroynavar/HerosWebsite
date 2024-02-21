<%@ Page Title="" Language="C#" Debug="true" MasterPageFile="~/MasterPage2.master" %>

<%@ Import Namespace="System.Data.SqlClient" %>
<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {

        if (Request.Form["sub"] != null)
        {
            string fName = Request.Form["firstName"];
            string lName = Request.Form["lastName"];
            string uName = Request.Form["userName"];
            string email = Request.Form["email"];
            string pass = Request.Form["password"];
            string id = Request.Form["ID"];
            string phone = Request.Form["phone"];
            string city = Request.Form["City"].ToString();
            string homeNum = Request.Form["homeNum"].ToString();
            string street = Request.Form["street"].ToString();
            string bDay = Request.Form["birthDay"];
            string bMonth = Request.Form["birthMonth"];
            string bYear = Request.Form["birthYear"];
            string gender = Request.Form["gender"];
            string conStr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True";
            string cmdStr = string.Format("INSERT INTO UsersTable (FirstName, LastName, UserName, Email, Password, Id, PhoneNumber, City, Street, HomeNumber, BirthDay, BirthMonth, BirthYear, Gender) VALUES  (N'{0}', N'{1}', N'{2}', N'{3}', N'{4}', N'{5}', N'{6}', N'{7}', N'{8}', N'{9}', N'{10}', N'{11}', N'{12}', N'{13}')", fName, lName, uName, email, pass, id, phone, city, street, homeNum, bDay, bMonth, bYear, gender);
            SqlConnection conObj = new SqlConnection(conStr);
            SqlCommand cmdObj = new SqlCommand(cmdStr, conObj);
            if (IsExist(uName))
            {
                Response.Redirect("errDouble.aspx");
            }
            conObj.Open();
            cmdObj.ExecuteNonQuery();
            conObj.Close();
            Response.Redirect("HomePage.aspx");

        }
    }
    public static bool IsExist(string username)
    {
        bool flag = false;
        string conStr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True";
        SqlConnection conObj = new SqlConnection(conStr);
        string cmdStr = string.Format("SELECT * FROM Userstable WHERE username=N'{0}'", username);
        SqlCommand cmdObj = new SqlCommand(cmdStr, conObj);
        conObj.Open();
        SqlDataReader dr = cmdObj.ExecuteReader();
        if (dr.HasRows)
            flag = true;
        conObj.Close();
        return flag;

    }

</script>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script>
        function chkForm() {
            var a = checkFirstName();
            var b = checkLastName();
            var c = checkUserName();
            var d = checkEmail();
            var e = checkPassword();
            var f = checkID();
            var g = checkPhone();
            var h = checkBirthDate();
            var i = checkGender();
            var j = checkCity();
            var k = checkStreet();
            var l = checkHomeNum();
            return a && b && c && d && e && f && g && h && i && j && k && l;
        }
        function checkFirstName() {
            var a = document.getElementById("firstName").value;

            if (a == "") {
                document.getElementById("errFirstName").innerHTML = "הקלד שם פרטי";
                return false;
            }
            if (!(a >= 'א' && a <= 'ת')) {
                document.getElementById("errFirstName").innerHTML = "שם פרטי חייב לכלול אותיות בעברית בלבד";
                return false;
            }



            document.getElementById("errFirstName").innerHTML = "";
            return true;
        }
        function checkLastName() {
            var a = document.getElementById("lastName").value;
            if (a == "") {
                document.getElementById("errLastName").innerHTML = "הקלד שם משפחה";
                return false;
            }
            if (!(a >= 'א' && a <= 'ת')) {
                document.getElementById("errLastName").innerHTML = "שם משפחה חייב לכלול אותיות בעברית בלבד";
                return false;
            }



            document.getElementById("errLastName").innerHTML = "";
            return true;
        }
        function checkUserName() {
            var a = document.getElementById("userName").value;
            if (a == "") {
                document.getElementById("errUserName").innerHTML = "הקלד שם משתמש";
                return false;
            }
            if (a[0] != a[a.length - 1]) {
                document.getElementById("errUserName").innerHTML = "אות ראשונה ואחרונה בשם מתשמש חייבות להיות זהות";
                return false;
            }
            for (var i = 0; i < a.length; i++) {
                if (!((a[i] >= 'a' && a[i] <= 'z') || (a[i] >= 'A' && a[i] <= 'Z') || (a[i] >= '0' && a[i] <= '9'))) {
                    document.getElementById("errUserName").innerHTML = "שם משתמש יכול לכלול אותיות באנגלית ומספרים בלבד";
                    return false;
                }
            }


            document.getElementById("errUserName").innerHTML = "";
            return true;
        }
        function checkEmail() {
            var a = document.getElementById("email").value;
            if (a == "") {
                document.getElementById("errEmail").innerHTML = "הקלד אימייל";
                return false;
            }
            if (a.indexOf('@') == -1) {
                document.getElementById("errEmail").innerHTML = "אימייל חייב לכלול @";
                return false;
            }
            if (a.indexOf('@') != a.lastIndexOf('@')) {
                document.getElementById("errEmail").innerHTML = "אימייל חייב לכלול רק @ אחד";
                return false;
            }
            for (var i = 0; i < length; i++) {
                if (!((a[i] >= 'a' && a[i] <= 'z') || (a[i] >= 'A' && a[i] <= 'Z') || (a[i] >= '0' && a[i] <= '9') || (a[i] == '@') || (a[i] == '.'))) {
                    document.getElementById("errUserName").innerHTML = " אימייל לכלול אותיות באנגלית ומספרים בלבד";
                    return false;
                }
            }

            if (a[0] == '@') {
                document.getElementById("errEmail").innerHTML = "אימייל לא יכול להתחיל ב@ ";
                return false;
            }
            if (a[a.length - 1] == '@') {
                document.getElementById("errEmail").innerHTML = "אימייל לא יכול להסתיים ב@ ";
                return false;
            }
            for (var i = 0; i < a.length; i++) {
                if (a.indexOf('@') + 1 == a.lastIndexOf('.')) {
                    document.getElementById("errEmail").innerHTML = "לאחר שטרודל לא יכולה לבוא נקודה";
                    return false;
                }

            }
            var flag = false;
            for (var i = a.indexOf('@') + 2; i < a.length; i++) {
                if (a[i] == '.') {
                    flag = true;
                }
            }
            if (!flag) {
                document.getElementById("errEmail").innerHTML = "לאחר התווים אחרי ה@ חייבת לבוא .";
                return false;
            }

            if (a[a.length - 1] == '.') {
                document.getElementById("errEmail").innerHTML = "אימייל לא יכול להסתיים ב. ";
                return false;
            }


            document.getElementById("errEmail").innerHTML = "";
            return true;

        }
        function checkUpperCase() {
            var a = document.getElementById("password").value;
            for (var i = 0; i < a.length; i++) {
                if (a[i] >= 'A' && a[i] <= 'Z') {
                    return true;
                }
            }
            return false;
        }
        function checkLowerCase() {
            var a = document.getElementById("password").value;
            for (var i = 0; i < a.length; i++) {
                if (a[i] >= 'a' && a[i] <= 'z') {
                    return true;
                }
            }
            return false;
        }
        function checkNumber() {
            var a = document.getElementById("password").value;
            for (var i = 0; i < a.length; i++) {
                if (a[i] >= '0' && a[i] <= '9') {
                    return true;
                }

            }
            return false;
        }
        function checkPassword() {
            var a = document.getElementById("password").value;
            var b = document.getElementById("password2").value;
            if (a == "") {
                document.getElementById("errPassword").innerHTML = "הקלד סיסמה";
                return false;
            }
            if (a.length < 8) {
                document.getElementById("errPassword").innerHTML = "סיסמה חייבת לכלול מעל 8 תווים";
                return false;
            }

            for (var i = 0; i < a.length; i++) {
                if (!((a[i] >= 'a' && a[i] <= 'z') || (a[i] >= 'A' && a[i] <= 'Z') || (a[i] >= '0' && a[i] <= '9'))) {
                    document.getElementById("errPassword").innerHTML = "סיסמה חייבת לכלול אותיות גדולות וקטנות באנגלית ומספרים בלבד";
                    return false;
                }
            }
            if (!checkLowerCase()) {
                document.getElementById("errPassword").innerHTML = "סיסמה חייבת לכלול אותיות קטנות באנגלית";
                return false;
            }
            if (!checkUpperCase()) {
                document.getElementById("errPassword").innerHTML = "סיסמה חייבת לכלול אותיות גדולות באנגלית";
                return false;
            }
            if (!checkNumber()) {
                document.getElementById("errPassword").innerHTML = "סיסמה חייבת לכלול מספרים";
                return false;
            }
            if (a != b) {
                document.getElementById("errPassword2").innerHTML = "הסיסמה חייבת להיות זהה לאימות הסיסמה";
                return false;
            }
            document.getElementById("errPassword").innerHTML = "";
            document.getElementById("errPassword2").innerHTML = "";
            return true;

        }
        function checkID() {
            var a = document.getElementById("ID").value;
            if (a == "") {
                document.getElementById("errID").innerHTML = "הקלד תעודת זהות";
                return false;
            }
            for (var i = 0; i < a.length; i++) {
                if (!(a[i] >= 0 && a[i] <= 9)) {
                    document.getElementById("errID").innerHTML = "תעודת זהות חייבת לכלול רק מספרים"
                    return false;
                }

            }
            if (!(a.length == 9)) {
                document.getElementById("errID").innerHTML = "תעודת זהות חייבת להיות 9 מספרים בלבד"
                return false;
            }

            document.getElementById("errID").innerHTML = "";
            return true;
        }
        function checkPhone() {
            var a = document.getElementById("phone").value;
            if (a == "") {
                document.getElementById("errPhone").innerHTML = "הקלד מספר טלפון";
                return false;
            }
            for (var i = 0; i < a.length; i++) {
                if (!(a[i] >= 0 && a[i] <= 9)) {
                    document.getElementById("errPhone").innerHTML = "מספר טלפון חייב לכלול רק מספרים"
                    return false;
                }

            }
            if (!(a.length == 10)) {
                document.getElementById("errPhone").innerHTML = "מספר טלפון חייב להיות 10 מספרים בלבד"
                return false;
            }

            document.getElementById("errPhone").innerHTML = "";
            return true;
        }
        function checkBirthDate() {
            var a = document.getElementById("birthDay");
            if (a.selectedIndex == 0) {
                document.getElementById("errBirthDate").innerHTML = "מלא יום";
                return false;
            }
            var b = document.getElementById("birthYear");
            if (b.selectedIndex == 0) {
                document.getElementById("errBirthDate").innerHTML = "מלא שנה";
                return false;
            }

            var c = document.getElementById("birthMonth");
            if (c.selectedIndex == 0) {
                document.getElementById("errBirthDate").innerHTML = "מלא חודש";
                return true;
            }

            if (c.value == 2) {
                if (parseInt(a.value) > 29) {
                    document.getElementById("errBirthDate").innerHTML = "תאריך לא תקין";
                    return false;
                }
                if (b.value % 4 != 0 && parseInt(a.value) > 28) {
                    document.getElementById("errBirthDate").innerHTML = "תאריך לא תקין";
                    return false;
                }
            }
            month = parseInt(c.value);
            if ((c == 4 || c == 6 || c == 9 || c == 11) && parseInt(a.value) == 31) {
                document.getElementById("errBirthDate").innerHTML = "תאריך לא תקין";
                return false;
            }
            document.getElementById("errBirthDate").innerHTML = "";
            return true;

        }
        function checkGender() {
            var a = document.getElementsByName("gender");
            for (var i = 0; i < a.length; i++) {
                if ((a[i].checked)) {
                    document.getElementById("errGender").innerHTML = "";
                    return true;
                }
            }

            document.getElementById("errGender").innerHTML = "מלא מין";
            return false;
        }
        function checkCity() {
            var a = document.getElementById("city").value;
            if (a == "") {
                document.getElementById("errCity").innerHTML = "הקלד עיר";
                return false;
            }

            if (!(a.length > 1)) {
                document.getElementById("errCity").innerHTML = "עיר חייבת להיות מעל לתו אחד"
                return false;
            }
            document.getElementById("errCity").innerHTML = "";
            return true;
        }
        function checkStreet() {
            var a = document.getElementById("street").value;
            if (a == "") {
                document.getElementById("errStreet").innerHTML = "הקלד רחוב";
                return false;
            }

            if (!(a.length > 1)) {
                document.getElementById("errStreet").innerHTML = "רחוב חייבת להיות מעל לתו אחד"
                return false;
            }
            document.getElementById("errStreet").innerHTML = "";
            return true;
        }
        function checkHomeNum() {
            var a = document.getElementById("homeNum").value;
            if (a == "") {
                document.getElementById("errHomeNum").innerHTML = "הקלד מספר בית";
                return false;
            }

            document.getElementById("errHomeNum").innerHTML = "";
            return true;
        }


    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="imgBanner" runat="Server">
    <div class="bgded" style="height: 848px; background-image: url('images/HomePage/HomePageBanner.jpg');">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="heroName" runat="Server">
    <p style="margin-top: 30px; background-color: rgba(142,123,123,.63); width: 400px; float: right">הרשמה לאתר</p>
</asp:Content>
<asp:Content ID="Content10" ContentPlaceHolderID="sideImg" runat="Server">
    <br />
</asp:Content>
<asp:Content ID="Content11" ContentPlaceHolderID="superPowersHeadLine" runat="Server">
    <h1 style="font-size: 42px; text-align: center; text-decoration: underline">:הרשמה לאתר</h1>
</asp:Content>
<asp:Content ID="Content12" ContentPlaceHolderID="superPowersText" runat="Server">

    <style>
        table {
            font-family: arial, sans-serif;
            border-collapse: collapse;
            width: 100%;
        }

        td, th {
            text-align: center;
            padding: 8px;
        }

        tr:nth-child(even) {
            background-color: #dddddd;
        }
    </style>
    <form action="SignUp.aspx" method="post" onsubmit="return chkForm()">
        <table style="text-align: right" dir="rtl">
            <tr>
                <td>שם פרטי:</td>
                <td>
                    <input type="text" id="firstName" name="firstName" /></td>
                <td id="errFirstName"></td>
            </tr>
            <tr>
                <td>שם משפחה:</td>
                <td>
                    <input type="text" id="lastName" name="lastName" /></td>
                <td id="errLastName"></td>
            </tr>
            <tr>
                <td>שם משתמש:</td>
                <td>
                    <input type="text" id="userName" name="userName" /></td>
                <td id="errUserName"></td>
            </tr>
            <tr>
                <td>אימייל:</td>
                <td>
                    <input type="text" id="email" name="email" /></td>
                <td id="errEmail"></td>
            </tr>
            <tr>
                <td>סיסמה:</td>
                <td>
                    <input type="password" id="password" name="password" /></td>
                <td id="errPassword"></td>
            </tr>
            <tr>
                <td>אימות סיסמה:</td>
                <td>
                    <input type="password" id="password2" /></td>
                <td id="errPassword2"></td>
            </tr>
            <tr>
                <td>תעודת זהות:</td>
                <td>
                    <input type="text" id="ID" name="ID" /></td>
                <td id="errID"></td>
            </tr>
            <tr>
                <td>טלפון:</td>
                <td>
                    <input type="text" id="phone" name="phone" /></td>
                <td id="errPhone"></td>
            </tr>
            <tr>
                <td>עיר:</td>
                <td>
                    <input type="text" id="city" name="city" /></td>
                <td id="errCity"></td>
            </tr>
            <tr>
                <td>רחוב:</td>
                <td>
                    <input type="text" id="street" name="street" /></td>
                <td id="errStreet"></td>
            </tr>
            <tr>
                <td>מספר בית:</td>
                <td>
                    <input type="text" id="homeNum" name="homeNum" /></td>
                <td id="errHomeNum"></td>
            </tr>
            <tr>
                <td>תאריך לידה:</td>
                <td>
                    <select id="birthDay" name="birthDay">
                        <option value="0" selected="1">יום</option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="6">6</option>
                        <option value="7">7</option>
                        <option value="8">8</option>
                        <option value="9">9</option>
                        <option value="10">10</option>
                        <option value="11">11</option>
                        <option value="12">12</option>
                        <option value="13">13</option>
                        <option value="14">14</option>
                        <option value="15">15</option>
                        <option value="16">16</option>
                        <option value="17">17</option>
                        <option value="18">18</option>
                        <option value="19">19</option>
                        <option value="20">20</option>
                        <option value="21">21</option>
                        <option value="22">22</option>
                        <option value="23">23</option>
                        <option value="24">24</option>
                        <option value="25">25</option>
                        <option value="26">26</option>
                        <option value="27">27</option>
                        <option value="28">28</option>
                        <option value="29">29</option>
                        <option value="30">30</option>
                        <option value="31">31</option>
                    </select>
                    <select id="birthMonth" name="birthMonth">
                        <option value="0" selected="1">חודש</option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="6">6</option>
                        <option value="7">7</option>
                        <option value="8">8</option>
                        <option value="9">9</option>
                        <option value="10">10</option>
                        <option value="11">11</option>
                        <option value="12">12</option>
                    </select>
                    <select id="birthYear" name="birthYear">
                        <option value="0" selected="1">שנה</option>
                        <option value="2021">2021</option>
                        <option value="2020">2020</option>
                        <option value="2019">2019</option>
                        <option value="2018">2018</option>
                        <option value="2017">2017</option>
                        <option value="2016">2016</option>
                        <option value="2015">2015</option>
                        <option value="2014">2014</option>
                        <option value="2013">2013</option>
                        <option value="2012">2012</option>
                        <option value="2011">2011</option>
                        <option value="2010">2010</option>
                        <option value="2009">2009</option>
                        <option value="2008">2008</option>
                        <option value="2007">2007</option>
                        <option value="2006">2006</option>
                        <option value="2005">2005</option>
                        <option value="2004">2004</option>
                        <option value="2003">2003</option>
                        <option value="2002">2002</option>
                        <option value="2001">2001</option>
                        <option value="2000">2000</option>
                        <option value="1999">1999</option>
                        <option value="1998">1998</option>
                        <option value="1997">1997</option>
                        <option value="1996">1996</option>
                        <option value="1995">1995</option>
                        <option value="1994">1994</option>
                        <option value="1993">1993</option>
                        <option value="1992">1992</option>
                        <option value="1991">1991</option>
                        <option value="1990">1990</option>
                        <option value="1989">1989</option>
                        <option value="1988">1988</option>
                        <option value="1987">1987</option>
                        <option value="1986">1986</option>
                        <option value="1985">1985</option>
                        <option value="1984">1984</option>
                        <option value="1983">1983</option>
                        <option value="1982">1982</option>
                        <option value="1981">1981</option>
                        <option value="1980">1980</option>
                        <option value="1979">1979</option>
                        <option value="1978">1978</option>
                        <option value="1977">1977</option>
                        <option value="1976">1976</option>
                        <option value="1975">1975</option>
                        <option value="1974">1974</option>
                        <option value="1973">1973</option>
                        <option value="1972">1972</option>
                        <option value="1971">1971</option>
                        <option value="1970">1970</option>
                        <option value="1969">1969</option>
                        <option value="1968">1968</option>
                        <option value="1967">1967</option>
                        <option value="1966">1966</option>
                        <option value="1965">1965</option>
                        <option value="1964">1964</option>
                        <option value="1963">1963</option>
                        <option value="1962">1962</option>
                        <option value="1961">1961</option>
                        <option value="1960">1960</option>
                        <option value="1959">1959</option>
                        <option value="1958">1958</option>
                        <option value="1957">1957</option>
                        <option value="1956">1956</option>
                        <option value="1955">1955</option>
                        <option value="1954">1954</option>
                        <option value="1953">1953</option>
                        <option value="1952">1952</option>
                        <option value="1951">1951</option>
                        <option value="1950">1950</option>
                        <option value="1949">1949</option>
                        <option value="1948">1948</option>
                        <option value="1947">1947</option>
                        <option value="1946">1946</option>
                        <option value="1945">1945</option>
                        <option value="1944">1944</option>
                        <option value="1943">1943</option>
                        <option value="1942">1942</option>
                        <option value="1941">1941</option>
                        <option value="1940">1940</option>
                        <option value="1939">1939</option>
                        <option value="1938">1938</option>
                        <option value="1937">1937</option>
                        <option value="1936">1936</option>
                        <option value="1935">1935</option>
                        <option value="1934">1934</option>
                        <option value="1933">1933</option>
                        <option value="1932">1932</option>
                        <option value="1931">1931</option>
                        <option value="1930">1930</option>
                        <option value="1929">1929</option>
                        <option value="1928">1928</option>
                        <option value="1927">1927</option>
                        <option value="1926">1926</option>
                        <option value="1925">1925</option>
                        <option value="1924">1924</option>
                        <option value="1923">1923</option>
                        <option value="1922">1922</option>
                        <option value="1921">1921</option>
                        <option value="1920">1920</option>
                        <option value="1919">1919</option>
                        <option value="1918">1918</option>
                        <option value="1917">1917</option>
                        <option value="1916">1916</option>
                        <option value="1915">1915</option>
                        <option value="1914">1914</option>
                        <option value="1913">1913</option>
                        <option value="1912">1912</option>
                        <option value="1911">1911</option>
                        <option value="1910">1910</option>
                        <option value="1909">1909</option>
                        <option value="1908">1908</option>
                        <option value="1907">1907</option>
                        <option value="1906">1906</option>
                        <option value="1905">1905</option>
                        <option value="1904">1904</option>
                        <option value="1903">1903</option>
                        <option value="1902">1902</option>
                        <option value="1901">1901</option>
                        <option value="1900">1900</option>
                    </select>

                </td>
                <td id="errBirthDate"></td>
            </tr>
            <tr>
                <td>מין:</td>
                <td>זכר:
                    <input type="radio" name="gender" id="gender_Male" value="male" />
                    נקבה:
                    <input type="radio" name="gender" id="gender_Female" value="female" />
                </td>
                <td id="errGender"></td>
            </tr>
            <tr>
                <th colspan="3">שאלות סקר:</th>
            </tr>
            <tr>
                <td>כמה אהבת את העיצוב של האתר?</td>
                <td>
                    <select>
                        <option>1</option>
                        <option>2</option>
                        <option>3</option>
                        <option>4</option>
                        <option>5</option>
                        <option>6</option>
                        <option>7</option>
                        <option>8</option>
                        <option>9</option>
                        <option>10</option>
                    </select>
                </td>
                <td></td>
            </tr>
            <tr>
                <td>מה אהבת יותר?</td>
                <td>DC
                    <input type="radio" name="LoveTheMost" id="DC" value="DC" />
                    <br />
                    Marvel
                    <input type="radio" name="LoveTheMost" id="Marvel" value="Marvel" />
                </td>
                <td></td>
            </tr>
            <tr>
                <td>האם למדת משהו חדש מהאתר?</td>
                <td>כן
                    <input type="radio" name="YesOrNo" id="yes" value="yes" />
                    לא
                    <input type="radio" name="YesOrNo" id="no" value="no" />
                </td>
                <td></td>
            </tr>
            <tr>
                <td colspan="3">
                    <input type="submit" id="sub" name="sub" />
                </td>
            </tr>

        </table>
    </form>
</asp:Content>
