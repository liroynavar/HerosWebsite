<%@ Page Title="" Language="C#" Debug="true" MasterPageFile="~/MasterPage2.master" %>

<%@ Import Namespace="System.Data.SqlClient" %>
<script runat="server">

    string fName, lName, uName, email, pass, phone, city, homeNum, street, conStr, id;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["Login"].ToString() != "admin")
        {
            Response.Redirect("Err.aspx");
            Response.End();
        }
        conStr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True";
        string cmdStr;
        SqlConnection conObj = new SqlConnection(conStr);
        if (Request.Form["sub"] != null)
        {
            fName = Request.Form["firstName"].ToString();
            lName = Request.Form["lastName"].ToString();
            uName = Request.Form["userName"].ToString();
            email = Request.Form["email"].ToString();
            pass = Request.Form["password"].ToString();
            id = Request.Form["ID"].ToString();
            phone = Request.Form["phone"].ToString();
            city = Request.Form["City"].ToString();
            homeNum = Request.Form["homeNum"].ToString();
            street = Request.Form["street"].ToString();
            cmdStr = string.Format("UPDATE UsersTable SET FirstName=N'{0}', LastName=N'{1}' , Email=N'{2}', Password=N'{3}' , Id=N'{4}', PhoneNumber=N'{5}', City=N'{6}', Street=N'{7}', HomeNumber=N'{8}' WHERE Username=N'{9}'", fName, lName, email, pass, id, phone, city, street, homeNum, Application["uNameChange"]);
            SqlCommand cmdObj2 = new SqlCommand(cmdStr, conObj);
            conObj.Open();
            cmdObj2.ExecuteNonQuery();
            conObj.Close();
        }

        cmdStr = string.Format("SELECT * FROM  UsersTable WHERE UserName = N'{0}'", Application["uNameChange"]);
        SqlCommand cmdObj = new SqlCommand(cmdStr, conObj);
        conObj.Open();
        SqlDataReader dr = cmdObj.ExecuteReader();
        if (dr.Read())
        {
            fName = dr["FirstName"].ToString();
            lName = dr["LastName"].ToString();
            uName = dr["UserName"].ToString();
            pass = dr["Password"].ToString();
            id = dr["Id"].ToString();
            email = dr["Email"].ToString();
            phone = dr["PhoneNumber"].ToString();
            city = dr["City"].ToString();
            street = dr["Street"].ToString();
            homeNum = dr["HomeNumber"].ToString();
        }
        conObj.Close();
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
            var l = checkCity();
            var m = checkStreet();
            var n = checkHomeNum();
            return a && b && c && d && e && f && g && l && m && n;
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

            if (!(a.length > 1)) {
                document.getElementById("errHomeNum").innerHTML = "מספר בית חייבת להיות מעל לתו אחד"
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
    <p style="margin-top: 30px; background-color: rgba(142,123,123,.63); width: 340px; float: right">עדכון פרטים</p>
</asp:Content>
<asp:Content ID="Content10" ContentPlaceHolderID="sideImg" runat="Server">
    <br />
</asp:Content>
<asp:Content ID="Content11" ContentPlaceHolderID="superPowersHeadLine" runat="Server">
    <h1 style="font-size: 42px; text-align: center; text-decoration: underline">:עדכון פרטים</h1>
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
    <form action="" method="post" onsubmit="return chkForm()">
        <table style="text-align: right" dir="rtl">
            <tr>
                <td>שם פרטי:</td>
                <td>
                    <input type="text" id="firstName" name="firstName" value="<%=fName %>" /></td>
                <td id="errFirstName"></td>
            </tr>
            <tr>
                <td>שם משפחה:</td>
                <td>
                    <input type="text" id="lastName" name="lastName" value="<%=lName %>" /></td>
                <td id="errLastName"></td>
            </tr>
            <tr>
                <td>שם משתמש:</td>
                <td>
                    <input type="text" id="userName" name="userName" value="<%=uName %>" /></td>
                <td id="errUserName"></td>
            </tr>
            <tr>
                <td>אימייל:</td>
                <td>
                    <input type="text" id="email" name="email" value="<%=email %>" /></td>
                <td id="errEmail"></td>
            </tr>
            <tr>
                <td>סיסמה:</td>
                <td>
                    <input type="password" id="password" name="password" value="<%=pass %>" /></td>
                <td id="errPassword"></td>
            </tr>
            <tr>
                <td>תעודת זהות:</td>
                <td>
                    <input type="text" id="ID" name="ID" value="<%=id %>" /></td>
                <td id="errID"></td>
            </tr>
            <tr>
                <td>טלפון:</td>
                <td>
                    <input type="text" id="phone" name="phone" value="<%=phone %>" /></td>
                <td id="errPhone"></td>
            </tr>
            <tr>
                <td>עיר:</td>
                <td>
                    <input type="text" id="city" name="city" value="<%=city %>" /></td>
                <td id="errCity"></td>
            </tr>
            <tr>
                <td>רחוב:</td>
                <td>
                    <input type="text" id="street" name="street" value="<%=street %>" /></td>
                <td id="errStreet"></td>
            </tr>
            <tr>
                <td>מספר בית:</td>
                <td>
                    <input type="text" id="homeNum" name="homeNum" value="<%=homeNum %>" /></td>
                <td id="errHomeNum"></td>
            </tr>
            <tr>
                <td colspan="3">
                    <input type="submit" id="sub" name="sub" />
                </td>
            </tr>

        </table>
    </form>
</asp:Content>
