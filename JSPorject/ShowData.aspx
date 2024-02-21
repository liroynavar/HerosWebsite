<%@ Page Title="" Language="C#" Debug="true" MasterPageFile="~/MasterPage2.master" %>

<%@ Import Namespace="System.Data.SqlClient" %>

<script runat="server">
    string str = " ";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Login"].ToString() != "admin")
        {
            Response.Redirect("Err.aspx");
            Response.End();
        }
        if (Request.Form["sub"] != null)
        {
            str = " <table border='1'><tr><td>שם משתמש</td><td>שם פרטי</td><td>שם משפחה</td><td>מייל</td><td>סיסמה</td><td>מספר זהות</td><td>מספר טלפון</td><td>תאריך לידה</td><td>רחוב</td><td>מספר בית</td><td>עיר</td><td>מין</td></tr>";
            string conStr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True";
            string cmdStr = "SELECT FirstName, LastName, UserName, Email, Password, Id, PhoneNumber, City, Street, HomeNumber, BirthDay, BirthMonth, BirthYear, Gender FROM UsersTable";
            SqlConnection conObj = new SqlConnection(conStr);
            SqlCommand cmdObj = new SqlCommand(cmdStr, conObj);

            conObj.Open();
            SqlDataReader dr = cmdObj.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    str += "<tr><td>" + dr["UserName"] + "</td><td>" + dr["FirstName"] + "</td><td>" + dr["LastName"] + "</td><td>" + dr["Email"] + "</td><td>" + dr["Password"] + "</td><td>" + dr["Id"] + "</td><td>" + dr["PhoneNumber"] + "</td><td>" + dr["BirthDay"] + '/' + dr["BirthMonth"] + '/' + dr["BirthYear"] + "</td><td>" + dr["City"] + "</td><td>" + dr["Street"] + "</td><td>" + dr["HomeNumber"] + "</td><td>" + dr["Gender"] + "</td></tr>";
                }
                str += "</table>";
            }
            else
            {
                str = "אין רשומות להצגה ";
            }
            conObj.Close();
        }
        if (Request.Form["btn"] != null)
        {
            str = " <table border='1'><tr><td>שם משתמש</td><td>שם פרטי</td><td>שם משפחה</td><td>מייל</td><td>סיסמה</td><td>מספר זהות</td><td>מספר טלפון</td><td>תאריך לידה</td><td>רחוב</td><td>מספר בית</td><td>עיר</td><td>מין</td></tr>";
            string conStr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True";
            string cmdStr = "SELECT FirstName, LastName, UserName, Email, Password, Id, PhoneNumber, City, Street, HomeNumber, BirthDay, BirthMonth, BirthYear, Gender FROM UsersTable WHERE Email LIKE '%gmail%'";
            SqlConnection conObj = new SqlConnection(conStr);
            SqlCommand cmdObj = new SqlCommand(cmdStr, conObj);

            conObj.Open();
            SqlDataReader dr = cmdObj.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    str += "<tr><td>" + dr["UserName"] + "</td><td>" + dr["FirstName"] + "</td><td>" + dr["LastName"] + "</td><td>" + dr["Email"] + "</td><td>" + dr["Password"] + "</td><td>" + dr["Id"] + "</td><td>" + dr["PhoneNumber"] + "</td><td>" + dr["BirthDay"] + '/' + dr["BirthMonth"] + '/' + dr["BirthYear"] + "</td><td>" + dr["City"] + "</td><td>" + dr["Street"] + "</td><td>" + dr["HomeNumber"] + "</td><td>" + dr["Gender"] + "</td></tr>";
                }
                str += "</table>";
            }
            else
            {
                str = "אין רשומות להצגה ";
            }
            conObj.Close();
        }

    }
</script>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="imgBanner" runat="Server">
    <div class="bgded" style="height: 848px; background-image: url('images/HomePage/HomePageBanner.jpg');">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="heroName" runat="Server">
    <p style="margin-top: 30px; background-color: rgba(142,123,123,.63); width: 750px; float: right">הצגת נתונים על משתמשים</p>
</asp:Content>
<asp:Content ID="Content10" ContentPlaceHolderID="sideImg" runat="Server">
</asp:Content>
<asp:Content ID="Content11" ContentPlaceHolderID="superPowersHeadLine" runat="Server">
</asp:Content>
<asp:Content ID="Content12" ContentPlaceHolderID="superPowersText" runat="Server">
    <form action="ShowData.aspx" method="post">
        <input type="submit" value="הצג " name="sub" />
        <input type="submit" value="הצג2 " name="btn" />
        <br />

        <%=str %>
    </form>
</asp:Content>

