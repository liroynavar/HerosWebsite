<%@ Page Title="" Language="C#" Debug="true" MasterPageFile="~/MasterPage2.master" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script runat="server">
    string str = " ";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Session["Login"].Equals("admin")) Response.Redirect("Err.aspx");
        str = " <table border='1' style='text-align:center; width:1350px;'><tr style='font-weight:bold;'><td>שם משתמש</td><td>שם פרטי</td><td>שם משפחה</td><td>מייל</td><td>סיסמה</td><td>מספר זהות</td><td>טלפון</td><td>תאריך לידה</td><td>עיר</td><td>רחוב</td><td>מספר בית</td><td>מין</td><td>עדכון נתונים</td><td>מחיקת משתמש</td></tr>";
        IsClicked();
        CreateStrTable();
    }

    protected void DeleteUser(string user)
    {
        string conStr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True";
        string cmdStr = string.Format("DELETE FROM UsersTable WHERE UserName = N'{0}'", user);
        SqlConnection conObj = new SqlConnection(conStr);
        SqlCommand cmdObj = new SqlCommand(cmdStr, conObj);

        conObj.Open();
        cmdObj.ExecuteNonQuery();
        conObj.Close();
    }

    protected void CreateStrTable()
    {
        string conStr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True";
        string cmdStr = "SELECT * FROM UsersTable";
        SqlConnection conObj = new SqlConnection(conStr);
        SqlCommand cmdObj = new SqlCommand(cmdStr, conObj);

        conObj.Open();
        SqlDataReader dr = cmdObj.ExecuteReader();

        int i = 1;
        if (dr.HasRows)
        {
            while (dr.Read())
            {
                if (!dr["UserName"].ToString().Equals("Admin"))
                {
                    str += "<tr><td>" + dr["UserName"] + "</td><td>" + dr["FirstName"] + "</td><td>" + dr["LastName"] + "</td><td>" + dr["Email"] + "</td><td>" + dr["Password"] + "</td><td>" + dr["Id"] + "</td><td>" + dr["PhoneNumber"] + "</td><td>" + dr["BirthDay"] + '/' + dr["BirthMonth"] + '/' + dr["BirthYear"] + "</td><td>" + dr["City"] + "</td><td>" + dr["Street"] + "</td><td>" + dr["HomeNumber"] + "</td><td>" + dr["Gender"] + "</td><td><input type='submit' value='עדכן נתונים' name='update" + i + "' /></td><td><input type='submit' value='מחק משתמש' name='remove" + i + "' /></td></tr>";
                    i++;
                }
            }
            str += "</table>";

        }
        else
        {
            str = "אין רשומות להצגה ";
        }
        conObj.Close();
    }

    protected void IsClicked()
    {
        string conStr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True";
        string cmdStr = "SELECT * FROM UsersTable";
        SqlConnection conObj = new SqlConnection(conStr);
        SqlCommand cmdObj = new SqlCommand(cmdStr, conObj);


        conObj.Open();
        SqlDataReader dr = cmdObj.ExecuteReader();
        if (dr.HasRows)
        {
            int i = 1;
            while (dr.Read())
            {
                if (!dr["UserName"].ToString().Equals("Admin"))
                {
                    if (Request.Form["remove" + i] != null)
                    {
                        string userNameDelete = dr["UserName"].ToString();
                        conObj.Close();
                        DeleteUser(userNameDelete);
                        break;
                    }
                    else if (Request.Form["update" + i] != null)
                    {
                        Application["uNameChange"] = dr["UserName"];
                        conObj.Close();
                        Response.Redirect("AdminUpdate.aspx");
                    }

                    i++;
                }

            }
        }
        conObj.Close();
    }

</script>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="imgBanner" runat="Server">
    <div class="bgded" style="height: 848px; background-image: url('images/HomePage/HomePageBanner.jpg');">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="heroName" runat="Server">
    <p style="margin-top: 30px; background-color: rgba(142,123,123,.63); width: 1080px; float: right">מחיקת/עדכון של נתונים על משתמשים</p>
</asp:Content>
<asp:Content ID="Content10" ContentPlaceHolderID="sideImg" runat="Server">
</asp:Content>
<asp:Content ID="Content11" ContentPlaceHolderID="superPowersHeadLine" runat="Server">
</asp:Content>
<asp:Content ID="Content12" ContentPlaceHolderID="superPowersText" runat="Server">
    <form action="AdminUpDel.aspx" method="post">
        <%=str %>
    </form>
</asp:Content>

