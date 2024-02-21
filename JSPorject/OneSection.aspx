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
            string section = Request.Form["section"].ToString();
            string sectTxt = Request.Form["sectTxt"].ToString();
            str = " <table border='1'><tr><td>שם משתמש</td><td>שם פרטי</td><td>שם משפחה</td><td>מייל</td><td>סיסמה</td><td>מספר זהות</td><td>מספר טלפון</td><td>תאריך לידה</td><td>רחוב</td><td>מספר בית</td><td>עיר</td><td>מין</td></tr>";
            string conStr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True";
            string cmdStr = string.Format("SELECT FirstName, LastName, UserName, Email, Password, Id, PhoneNumber, City, Street, HomeNumber, BirthDay, BirthMonth, BirthYear, Gender FROM UsersTable WHERE {0} = N'{1}'", section, sectTxt);
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
    <p style="margin-top: 30px; background-color: rgba(142,123,123,.63); width: 870px; float: right">הצגת משתמשים לפי חתך אחד</p>
</asp:Content>
<asp:Content ID="Content10" ContentPlaceHolderID="sideImg" runat="Server">
</asp:Content>
<asp:Content ID="Content11" ContentPlaceHolderID="superPowersHeadLine" runat="Server">
</asp:Content>
<asp:Content ID="Content12" ContentPlaceHolderID="superPowersText" runat="Server">
    <form action="OneSection.aspx" method="post">
        <select id="section" name="section">
            <option value="0" selected="1">בחר חתך</option>
            <option value="FirstName">שם פרטי</option>
            <option value="LastName">שם משפחה </option>
            <option value="City">עיר</option>
            <option value="Street">רחוב</option>
            <option value="BirthYear">שנת לידה</option>
            <option value="Gender">מין</option>
        </select>

        <input type="text" name="sectTxt" />
        <input type="submit" value="הצג " name="sub" />
        <br />
        <%=str %>
    </form>
</asp:Content>

