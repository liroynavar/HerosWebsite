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
        var counter = 1;

        function nextImg() {
            var pic = document.getElementById("getImage");
            counter = counter % 6 + 1;
            pic.src = "images/Gallery/" + counter + ".jpg";
        }
        function previousImg() {
            var pic = document.getElementById("getImage");
            if (counter == 1) counter = 6;
            else counter--;
            pic.src = "images/Gallery/" + counter + ".jpg";
        }

        function zoomin() {
            var pic = document.getElementById("getImage");
            if ((pic.width + 50 < 900)) pic.width += 50;
        }
        function zoomout() {
            var pic = document.getElementById("getImage");
            if (!(pic.width - 50 <= 50)) pic.width -= 50;
        }
        
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="imgBanner" runat="Server">
    <div class="bgded" style="height: 848px; background-image: url('images/HomePage/HomePageBanner.jpg');">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="heroName" runat="Server">
    <p style="margin-top: 30px; background-color: rgba(142,123,123,.63); width: 175px; float: right">גלריה</p>
</asp:Content>
<asp:Content ID="Content10" ContentPlaceHolderID="sideImg" runat="Server">
    <br />
</asp:Content>
<asp:Content ID="Content11" ContentPlaceHolderID="superPowersHeadLine" runat="Server">
</asp:Content>
<asp:Content ID="Content12" ContentPlaceHolderID="superPowersText" runat="Server">
    <style type="text/css">
	h2 {
    text-align: center;
    font-size: 60px;
    font-weight: 600;
    text-decoration:underline;
	}
	img#getImage {
        max-width: 100%;
        height: auto;  
        border: 4px solid #a1a1a1;  
	}
	div {
    text-align: center;
	}
</style>
    <h2>:גלריה</h2>
    <div style="height:600px; overflow:hidden;">
		<img src="images/Gallery/1.jpg" id="getImage" width="500" />
    </div>
    <div>
    	<input type="button" onclick="nextImg()" value="הבא">
    	<input type="button" onclick="previousImg()" value="אחורה">
    </div>
    <div>
        <input type="button" onclick="zoomin()" value="הגדל" />
        <input type="button" onclick="zoomout()" value="הקטן" />
    </div>
</asp:Content>




