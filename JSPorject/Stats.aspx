<%@ Page Title="" Language="C#" Debug="true" MasterPageFile="~/MasterPage2.master" %>

<%@ Import Namespace="System.Data.SqlClient" %>
<script runat="server">
    string sumMale, sumFemale, sumHolon, sumJerusalem, sumCityElse, sum1900to1950, sum1951to2000, sum2001to2021,maleStats,femaleStats,holonStats,jerusalemStats,cityElseStats,fYear,sYear,tYear;
    int Male, Female, Holon, Jerusalem, cityElse, year1900to1950, year1951to2000, year2001to2021;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Session["Login"].Equals("admin"))
        {
            Response.Redirect("Err.aspx");
            Response.End();
        }

        string conStr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True";
        string cmdStr = "SELECT * FROM UsersTable";

        SqlConnection conObj = new SqlConnection(conStr);
        SqlCommand cmdObj = new SqlCommand(cmdStr, conObj);
        conObj.Open();

        SqlDataReader dr = cmdObj.ExecuteReader();
        int count = 0;
        int countMale = 0;
        int countFemale = 0;
        int countHolon = 0;
        int countJeruslem = 0;
        int countCityElse = 0;
        int count1900to1950 = 0;
        int count1951to2000 = 0;
        int count2001to2021 = 0;
        if (dr.HasRows)
        {
            while (dr.Read())
            {
                count++;
                if (dr["username"].ToString() == "admin")
                {
                    count--;
                }
                else
                {
                    if (dr["Gender"].ToString() == "male")
                    {
                        countMale++;
                    }
                    else if (dr["Gender"].ToString() == "female")
                    {
                        countFemale++;
                    }
                    if (dr["City"].ToString() == "חולון")
                    {
                        countHolon++;
                    }
                    else if (dr["City"].ToString() == "ירושלים")
                    {
                        countJeruslem++;
                    }
                    else if (dr["City"].ToString() != "ירושלים" && dr["City"].ToString() != "תל אביב")
                    {
                        countCityElse++;
                    }
                    if (int.Parse(dr["BirthYear"].ToString()) >= 1900 && int.Parse(dr["BirthYear"].ToString()) <= 1950)
                    {
                        count1900to1950++;
                    }
                    else if (int.Parse(dr["BirthYear"].ToString()) >= 1951 && int.Parse(dr["BirthYear"].ToString()) <= 2000)
                    {
                        count1951to2000++;
                    }
                    else if (int.Parse(dr["BirthYear"].ToString()) >= 2001 && int.Parse(dr["BirthYear"].ToString()) <= 2021)
                    {
                        count2001to2021++;
                    }
                }
            }
        }

        Male = (int)((double)countMale / count * 100);
        Female = (int)((double)countFemale / count * 100);
        Holon = (int)((double)countHolon / count * 100);
        Jerusalem = (int)((double)countJeruslem / count * 100);
        cityElse = (int)((double)countCityElse / count * 100);
        year1900to1950 = (int)((double)count1900to1950 / count * 100);
        year1951to2000 = (int)((double)count1951to2000 / count * 100);
        year2001to2021 = (int)((double)count2001to2021 / count * 100);
        sumFemale = Female + "%";
        sumMale = Male + "%";
        sumHolon = Holon + "%";
        sumJerusalem = Jerusalem + "%";
        sumCityElse = cityElse + "%";
        sum1900to1950 = year1900to1950 + "%";
        sum1951to2000 = year1951to2000 + "%";
        sum2001to2021 = year2001to2021 + "%";
        maleStats = "<div class='skills male' style='width: " + sumMale + "'>"+sumMale+"</div>";
        femaleStats = "<div class='skills female' style='width: " + sumFemale + "'>"+sumFemale+"</div>";
        holonStats = "<div class='skills holon' style='width: " + sumHolon + "'>"+sumHolon+"</div>";
        jerusalemStats = "<div class='skills jerusalem' style='width: " + sumJerusalem + "'>"+sumJerusalem+"</div>";
        cityElseStats = "<div class='skills else' style='width: " + sumCityElse + "'>"+sumCityElse+"</div>";
        fYear = "<div class='skills fYear' style='width: " + sum1900to1950 + "'>"+sum1900to1950+"</div>";
        sYear = "<div class='skills sYear' style='width: " + sum1951to2000 + "'>"+sum1951to2000+"</div>";
        tYear = "<div class='skills tYear' style='width: " + sum2001to2021 + "'>"+sum2001to2021+"</div>";
    }

</script>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>

        .container {
            width: 100%;
        }

        .skills {
            text-align: right;
            padding-top: 10px;
            padding-bottom: 10px;
            color: white;
        }

        .male {
            background-color: blue;
        }

        .female {
            background-color: deeppink;
        }

        .holon {
            background-color: sandybrown;
        }

        .jerusalem {
            background-color: darkgoldenrod;
        }
        .else {
            background-color: darkslategrey;
        }
        .fYear {
            background-color: black;
        }
        .sYear {
            background-color: orangered;
        }
        .tYear {
            background-color: yellowgreen;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="imgBanner" runat="Server">
    <div class="bgded" style="height: 848px; background-image: url('images/HomePage/HomePageBanner.jpg');">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="heroName" runat="Server">
    <p style="margin-top: 30px; background-color: rgba(142,123,123,.63); width: 340px; float: right">סטטיסטיקות</p>
</asp:Content>
<asp:Content ID="Content10" ContentPlaceHolderID="sideImg" runat="Server">
        <form action="Stats.aspx" method="post" onsubmit="">
        <h1 style="font-size: 42px; text-align: center; text-decoration: underline">התפלגות משתמשים לפי מין</h1>
        <p>גברים <%=sumMale%></p>
        <div class="container">
            <%=maleStats %>
        </div>
        <p>נשים <%=sumFemale%></p>
        <div class="container">
            <%=femaleStats %>
        </div>

        <h1 style="font-size: 42px; text-align: center; text-decoration: underline">התפלגות משתמשים לפי ערים</h1>
        <p>חולון <%=sumHolon%></p>
        <div class="container">
            <%=holonStats %>
        </div>
        <p>ירושלים <%=sumJerusalem%></p>
        <div class="container">
            <%=jerusalemStats %>
        </div>
        <p>עיר אחרת <%=sumCityElse%></p>
        <div class="container">
            <%=cityElseStats %>
        </div>

        <h1 style="font-size: 42px; text-align: center; text-decoration: underline">התפלגות משתמשים לפי שנת לידה</h1>
        <p>בין השנים 1900-1950 <%=sum1900to1950%></p>
        <div class="container">
            <%=fYear %>
        </div>
        <p>בין השנים 1951-2000 <%=sum1951to2000%></p>
        <div class="container">
            <%=sYear %>
        </div>
        <p>בין השנים 2001-2021 <%=sum2001to2021%></p>
        <div class="container">
            <%=tYear %>
        </div>

    </form>
</asp:Content>
<asp:Content ID="Content11" ContentPlaceHolderID="superPowersHeadLine" runat="Server">
    <h1 style="font-size: 42px; text-align: center; text-decoration: underline"></h1>
</asp:Content>
<asp:Content ID="Content12" ContentPlaceHolderID="superPowersText" runat="Server">

</asp:Content>
