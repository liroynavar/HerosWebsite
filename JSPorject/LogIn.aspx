<%@ Page Title="" Language="C#" Debug="true" MasterPageFile="~/MasterPage2.master" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script runat="server">
    public static bool IsExist(string username, string pass)
    {
        bool flag = false;
        string conStr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True";
        SqlConnection conObj = new SqlConnection(conStr);
        string cmdStr = string.Format("SELECT * FROM UsersTable WHERE UserName=N'{0}' AND Password=N'{1}'", username, pass);
        SqlCommand cmdObj = new SqlCommand(cmdStr, conObj);
        conObj.Open();
        SqlDataReader dr = cmdObj.ExecuteReader();
       
        if (dr.HasRows)
            flag = true;
        
        conObj.Close();
        return flag;
            
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Form["sub"] != null)
        {
            string user = Request.Form["user_name"];
            string pass = Request.Form["user_password"];

            if (IsExist(user, pass))
            {
                Session["Login"] = user;
                
            }
            else
            {
                Response.Redirect("SignUp.aspx");
            }
        }
    }
</script>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="imgBanner" runat="Server">
    <div class="bgded" style="height: 848px; background-image: url('images/HomePage/HomePageBanner.jpg');">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="heroName" runat="Server">
    <p style="margin-top: 30px; background-color: rgba(142,123,123,.63); width: 300px; float: right">התחברות</p>
</asp:Content>
<asp:Content ID="Content10" ContentPlaceHolderID="sideImg" runat="Server">
    <br />
</asp:Content>
<asp:Content ID="Content11" ContentPlaceHolderID="superPowersHeadLine" runat="Server">
    <h1 style="font-size: 42px; text-align: center; text-decoration: underline"></h1>
</asp:Content>
<asp:Content ID="Content12" ContentPlaceHolderID="superPowersText" runat="Server">
    <style>
        *, *:before, *:after {
            -moz-box-sizing: border-box;
            -webkit-box-sizing: border-box;
            box-sizing: border-box;
        }

        body {
            font-family: 'Nunito', sans-serif;
        }

        form {
            max-width: 300px;
            margin: 10px auto;
            padding: 10px 20px;
            background: #f4f7f8;
            border-radius: 8px;
        }

        h1 {
            margin: 0 0 30px 0;
            text-align: center;
        }

        input[type="text"],
        input[type="password"],
        input[type="date"],
        input[type="datetime"],
        input[type="email"],
        input[type="number"],
        input[type="search"],
        input[type="tel"],
        input[type="time"],
        input[type="url"],
        textarea,
        select {
            background: rgba(255,255,255,0.1);
            border: none;
            font-size: 16px;
            height: auto;
            margin: 0;
            outline: 0;
            padding: 15px;
            width: 100%;
            background-color: #e8eeef;
            color: #8a97a0;
            box-shadow: 0 1px 0 rgba(0,0,0,0.03) inset;
            margin-bottom: 30px;
        }

        button {
            padding: 19px 39px 18px 39px;
            color: #FFF;
            background-color: #4bc970;
            font-size: 18px;
            text-align: center;
            font-style: normal;
            border-radius: 5px;
            width: 100%;
            border: 1px solid #3ac162;
            border-width: 1px 1px 3px;
            box-shadow: 0 -1px 0 rgba(255,255,255,0.1) inset;
            margin-bottom: 10px;
        }

        fieldset {
            margin-bottom: 30px;
            border: none;
        }

        label {
            display: block;
            margin-bottom: 8px;
        }

            label.light {
                font-weight: 300;
                display: inline;
            }

        .number {
            background-color: #5fcf80;
            color: #fff;
            height: 30px;
            width: 30px;
            display: inline-block;
            font-size: 0.8em;
            margin-right: 4px;
            line-height: 30px;
            text-align: center;
            text-shadow: 0 1px 0 rgba(255,255,255,0.2);
            border-radius: 100%;
        }

        @media screen and (min-width: 480px) {

            form {
                max-width: 430px;
            }
        }
    </style>

    <form action="LogIn.aspx" method="post">

        <h1>התחברות</h1>

        <fieldset>

            <label for="name">:שם משתמש</label>
            <input style="text-align: right" type="text" id="name" name="user_name">
            <label for="password">:סיסמה</label>
            <input style="text-align: right" type="password" id="password" name="user_password">
        </fieldset>
        <button type="submit" name="sub">התחבר</button>
    </form>
</asp:Content>

