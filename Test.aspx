<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Test.aspx.cs" Inherits="PrasarNet.Test" MasterPageFile="~/Site1.Master" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <%--link of style sheet--%>
    <link rel="stylesheet" href="style/responsive.css" type="text/css" media="screen" />
    <script type='text/javascript' src='https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js'></script>
    <script src="http://jqueryjs.googlecode.com/files/jquery-1.2.6.min.js"></script>
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>


    <script type="text/javascript">
        google.load("visualization", "1", { packages: ["corechart"] });
        //Do not call this method on pageload
        //google.setOnLoadCallback(drawChart);
        function drawChart() {
            var options = {
                title: 'USA City Distribution',
                width: 600,
                height: 400,
                //bar: { groupWidth: "95%" },
                //legend: { position: "none" },
                isStacked: true
            };

        
            var ddlReason = document.getElementById('<%=ddl1.ClientID %>');
            var reason = ddlReason.options[ddlReason.selectedIndex].text;
            var ddlstate = document.getElementById('<%=ddlstatecode.ClientID %>');
            var state = ddlstate.options[ddlstate.selectedIndex].value;

            var ddlnot = document.getElementById('<%=ddlnottype.ClientID %>');
            var nott = ddlnot.options[ddlnot.selectedIndex].text;

            var params = {"dt": + state  ,"year": nott };
          //  var params = { "dt": "1", "year": "2021" };
            console.log("DEBUGIING ::: " + JSON.stringify(params));



        /*var params = { "dt": "7", "type": "ccw" }*/
            /*alert(params);*/
            /* 2021 - 01 - 01*/
            //var obj = {};{"id":["138","140"]}
            //obj.dt = $.trim("2021-01-01");
        /* obj.age = $.trim($("[id*=txtAge]").val());*/
            
                $.ajax({
                    type: "POST",
                    url: "test.aspx/GetChartData",
                    //data: JSON.stringify(params),
                    data: JSON.stringify(params),
                  //  data: {},
                                        
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (r) {

                        console.log("data received from web service :::  " + JSON.stringify(r))
                        var data = google.visualization.arrayToDataTable(r.d);
                        var chart;
                        if (reason == 1) {
                            chart = new google.visualization.BarChart($("#chart")[0]);
                        }
                        else if (reason == 2) {
                            chart = new google.visualization.LineChart($("#chart")[0]);
                            console.log("Chart Initiated.....")
                        }
                        else {
                            chart = new google.visualization.PieChart($("#chart")[0]);
                        }
                        chart.draw(data, options);
                    },
                    failure: function (r) {
                        console.log ("Failure....." + r)
                        alert(r.d);
                    },
                    error: function (r) {
                        console.log("ERROR....." + r);
                        alert(r.d);
                    }

                });
            //}
            //else if (reason == 2) {
            //    $.ajax({
            //        type: "POST",
            //        url: "test.aspx/GetChartData",
            //        /*data: JSON.stringify(obj),*/
            //        data: params,
            //        contentType: "application/json; charset=utf-8",
            //        dataType: "json",
            //        success: function (r) {
            //            var data = google.visualization.arrayToDataTable(r.d);
            //            var chart = new google.visualization.LineChart($("#chart")[0]);
            //            chart.draw(data, options);
            //        },
            //        failure: function (r) {
            //            alert(r.d);
            //        },
            //        error: function (r) {
            //            alert(r.d);
            //        }

            //    });
            //}
            //else {
            //    $.ajax({
            //        type: "POST",
            //        url: "test.aspx/GetChartData",
            //        /*data: JSON.stringify(obj),*/
            //        data: params,
            //        contentType: "application/json; charset=utf-8",
            //        dataType: "json",
            //        success: function (r) {
            //            var data = google.visualization.arrayToDataTable(r.d);
            //            var chart = new google.visualization.PieChart($("#chart")[0]);
            //            chart.draw(data, options);
            //        },
            //        failure: function (r) {
            //            alert(r.d);
            //        },
            //        error: function (r) {
            //            alert(r.d);
            //        }

            //    });
            //}
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuContent" runat="server">
    <div id="Div9" class="row gradhead" runat="server" style="margin: auto">
        <div class="col-xs-4 col-lg-4 text-center" style="padding-left: 25px; padding-top: 8px; padding-bottom: 5px">
            <asp:Image ID="img1" runat="server" class="img-responsive pull-left" Height="93%"
                ImageAlign="Left" ImageUrl="~/images/AIR.png" Width="100px" />
            <%--<img src="images/AIRlogo.jpg" alt="AIR LOGO" width="120px" height="107px" />--%>
        </div>
        <div class="col-xs-4 col-lg-4 text-center" style="padding-top: 8px">
            <%-- <h2 style="color: Blue; font-weight: bolder">--%>
            <asp:Label ID="Label10" runat="server" class="fontheader" ForeColor="Blue" Font-Bold="true"
                Text="PrasarNet"></asp:Label>
            <%--  PrasarNet--%>
            <br />
            <asp:Label ID="Label6" runat="server" class="fontheader" ForeColor="Blue" Font-Bold="true"
                Text="(प्रसार नेट)"></asp:Label>
            <%--(प्रसार नेट)--%>
            <%--  </h2>--%>
            <br />
            <asp:Label ID="Label14" runat="server" class="fontheader1" ForeColor="Blue" Font-Bold="false"
                Text=" An Intranet for Prasar Bharati Employees"></asp:Label>
            <%--<h4 style="color: Blue; font-weight: normal">
                An Intranet for Prasar Bharati Employees
            </h4>--%>
        </div>
        <div class="col-xs-4 col-lg-4 text-center" style="padding-right: 25px; padding-top: 10px; padding-bottom: 4px">
            <asp:Image ID="Image1" runat="server" class="img-responsive pull-right" Height="105%"
                ImageAlign="Right" ImageUrl="~/images/Doordarshan.png" Width="125px" />
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentSection" runat="server">
    <div class="content gradbody">
        <div class="row" style="padding: 10px 0px 0px 0px; margin: auto">
            <div class="col-lg-12 col-md-12 sm-12 xs-12" style="padding-left: 25px; padding-right: 35px;">
                <asp:Label ID="Label1" class="font2 pull-right captalisefirstLetter" ForeColor="Black"
                    Font-Bold="true" runat="server" Text=""></asp:Label>
                <asp:Label ID="Label2" class="font pull-right" ForeColor="Black" Font-Bold="true"
                    runat="server"><span>&nbsp;</span></asp:Label>
                <asp:Label ID="Label15" class="font pull-right" ForeColor="Black" Font-Bold="true"
                    runat="server" Text="Welcome"></asp:Label>
            </div>
        </div>
        <div id="Div1" class="row" runat="server" style="padding-right: 20px; margin: auto">
            <div id="Div2" class="col-md-12 col-sm-12 col-xs-12 col-lg-12" runat="server" align="right">
                <br />
                <asp:LinkButton ID="btnback" runat="server" CssClass="btn grad4" CausesValidation="False"> <span aria-hidden="true" style="color: Black" class="glyphicon glyphicon-arrow-left"></span>&nbsp; <span style="font-weight: bold; color: #000000">Back</span></asp:LinkButton>
                <br />

            </div>
        </div>
        <asp:Literal ID="lt" runat="server"></asp:Literal>
        <asp:UpdatePanel runat="server">
            <ContentTemplate>

<div id="div3" runat="server" visible="true" align="center" class="scrol2">
            <asp:DropDownList ID="ddl1" runat="server" AppendDataBoundItems="true" class="select widthofboxes1 font2 padtdd" Height="32px" Width="80%" ValidationGroup="add" ClientIDMode="Static">
                 <asp:ListItem Text="--Select--" Value=""> </asp:ListItem>
                <asp:ListItem Text="1" Value="1"> </asp:ListItem>
                <asp:ListItem Text="2" Value="2"> </asp:ListItem>
                <asp:ListItem Text="3" Value="3"> </asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
    <asp:DropDownList ID="ddlstatecode" runat="server" AppendDataBoundItems="true" class="select widthofboxes1 font2 padtdd" Height="32px" Width="80%" ValidationGroup="add" ClientIDMode="Static">
                <%-- <asp:ListItem Text="--Select--" Value=""> </asp:ListItem>--%>
                <asp:ListItem Text="Delhi" Value="7"> </asp:ListItem>
                <asp:ListItem Text="UP" Value="9"> </asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
    <asp:DropDownList ID="ddlnottype" runat="server" AppendDataBoundItems="true" class="select widthofboxes1 font2 padtdd" Height="32px" Width="80%" ValidationGroup="add" ClientIDMode="Static">
                <%-- <asp:ListItem Text="--Select--" Value=""> </asp:ListItem>--%>
                <asp:ListItem Text="2020" Value="1"> </asp:ListItem>
                <asp:ListItem Text="2021" Value="2"> </asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
        </div>

        <div id="divchartmain" runat="server" visible="true" align="center" class="scrol2">

            <div id="chart" style="width: 900px; height: 500px;">
            </div>
        </div>
            </ContentTemplate>

        </asp:UpdatePanel>
        
        <asp:Label ID="Label5" runat="server" Text=" "></asp:Label>
    </div>
</asp:Content>
