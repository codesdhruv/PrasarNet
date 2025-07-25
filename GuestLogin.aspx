<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GuestLogin.aspx.cs" Inherits="PrasarNet.GuestLogin"
    MasterPageFile="~/Site1.Master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <%--link of style sheet--%>
    <link rel="stylesheet" href="style/responsive.css" type="text/css" media="screen" />
    <script type='text/javascript' src='https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js'></script>
    <script src="http://jqueryjs.googlecode.com/files/jquery-1.2.6.min.js"></script>
    <style type="text/css">
        html { /* use on dashboard for showing the Message of Management i.e. CEO, DG:DD, DG:AIR ..... Added on 08-Aug-2018*/
            box-sizing: border-box;
        }

        *, *:before, *:after { /* use on dashboard for showing the Message of Management i.e. CEO, DG:DD, DG:AIR ..... Added on 08-Aug-2018*/
            box-sizing: border-box;
        }

        .card { /* use on dashboard for showing the Message of Management i.e. CEO, DG:DD, DG:AIR ..... Added on 08-Aug-2018*/
            box-shadow: 20px 20px 20px 0 rgba(0, 0, 0, 0.8);
        }

        .container11 { /* use on dashboard for showing the Message of Management i.e. CEO, DG:DD, DG:AIR ..... Added on 08-Aug-2018*/
            padding: 0 16px;
        }

            .container11::after, .row::after { /* use on dashboard for showing the Message of Management i.e. CEO, DG:DD, DG:AIR ..... Added on 08-Aug-2018*/
                content: "";
                clear: both;
                display: table;
            }

        .title { /* use on dashboard for showing the Message of Management i.e. CEO, DG:DD, DG:AIR ..... Added on 08-Aug-2018*/
            color: grey;
        }

        .groucho {
            position: relative;
            font-family: 'Sanchez', serif;
            font-size: $base-font-size;
            line-height: $base-line-height;
            footer;

        {
            font-family: 'Noto Sans', sans-serif;
            font-size: 0.6em;
            font-weight: 700;
            color: darken($white, 15%);
            float: right;
            &:before;

        {
            content: '\2015';
        }

        }

        &:after {
            content: '\201D';
            position: Relative;
            top: 0em;
            right: 0;
            font-size: 6em;
            font-style: italic;
            color: darken($white, 7%);
            z-index: -1;
        }

        }

        .divforwhatsnew1 {
            background-color: #ECF0F1;
            height: 525px;
            width: 100%;
            overflow-y: auto;
            overflow-x: auto;
        }

        .height1 {
            height: 460px;
        }

        .grad2 {
            background: linear-gradient(to right, #CACFD2, #E67E22);
            -webkit-radial-gradient;
        }

        .scrollnew {
            height: 450px;
            overflow-y: auto;
            overflow-x: auto;
        }

        .profilescroll {
            overflow-y: auto;
            overflow-x: auto;
        }

        .toc {
            margin: 0;
        }

        .gradquote {
            background: linear-gradient(to right, #CACFD2, #E67E22);
            -webkit-radial-gradient;
        }

        .gradtab {
            background: linear-gradient(to right, orange, #ECF0F1);
            background: radial-gradient(orange, #ECF0F1);
            -webkit-radial-gradient;
        }

        .gradtab1 {
            background: linear-gradient(to left, orange, #ECF0F1);
            -webkit-radial-gradient;
        }

        .gradh {
            background: radial-gradient(orange, #F4F6F7);
        }

        .gradformessage {
            background: linear-gradient(to bottom, #FAD7A0, #EAFAF1);
        }


        #main {
            transition: margin-left .5s;
            padding: 16px;
        }


        .grad2 {
            /* background-color: red; /* For browsers that do not support gradients */
            /*background-image: linear-gradient(90deg, orange, yellow);  /*Standard syntax (must be last) */
            /*background: radial-gradient(#F9FBE7, #FFF3E0);*/
            background: linear-gradient(to right, #CACFD2, #E67E22);
            -webkit-radial-gradient;
        }

        .grad4 {
            background: radial-gradient(#CACFD2, #E67E22);
            -webkit-radial-gradient;
        }

        .grad5 {
            background: linear-gradient(to right, #F5DA81, #D8D8D8);
            min-height: 100px;
        }

        .style1 {
            font-size: medium;
        }

        .style2 {
            color: #FF0000;
            background-color: #CCFFCC;
        }

        .style3 {
            background-color: #CCFFCC;
        }

        .style4 {
            font-size: large;
        }
    </style>
    <script type='text/javascript'>
        function clearmodal() {
            $('#loginModal4').on('hide.bs.modal', function () {
                var emp = document.getElementById("txtemployee");
                var grd = document.getElementById("divgrd");
                //                var rev = document.getElementById("RegularExpressionValidator1");
                //                var rfv = document.getElementById("RequiredFieldValidator1");
                emp.value = "";


                if ($("#divgrd").is(':visible')) {
                    //                    alert("Room 1 is filled.");
                    grd.style.display = "none";
                }
            })
        }
        function popupfunction() {
            var popup = document.getElementById("myPopup");
            popup.classList.toggle("show");
        }
        function popupfunction2() {
            var popup = document.getElementById("myPopup2");
            popup.classList.toggle("show");
        }
        /* Begin jQuery */;
        (function ($) {

            $(window).scroll(function (e) {
                if ($(window).scrollTop() >= $("header").height() + 30) {
                    $(".sticky").addClass("fixed");
                    $(".content").addClass("margin");

                } else {
                    $(".sticky").removeClass("fixed");
                    $(".content").removeClass("margin");
                }
                e.stopPropagation();
            });

            // DOM ready


        })(jQuery);
        function preventBack() { window.history.forward(); }
        setTimeout("preventBack()", 0);
        window.onunload = function () { null };
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuContent" runat="server" class="containernew">
    <div id="Div1" class="row gradhead" runat="server" style="margin: auto">
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
            <asp:Label ID="Label12" runat="server" class="fontheader" ForeColor="Blue" Font-Bold="true"
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
    <div id="Div2" class="row" style="margin: auto" runat="server">
        <div id="guestmenu" visible="true" runat="server" class="sticky">
            <nav class="navbar navbar-default row-no-padding"> <%--nav and nav default hav a default magin and padding--%>
            <div class="navbar-header grad3">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar1">
                            <span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar">
                            </span>
                        </button>
                        <%-- <a class="navbar-brand" href="#">WebSiteName</a>--%>
          </div>
            <%--    oiwqepiepqiep--%>
            
           <div class="collapse navbar-collapse ex3 navpriorscrolling navigation grad3 wid100menu" id="myNavbar1">
                <ul class="nav navbar-nav">
                    <li><a href="Logout.aspx" style="color: Black; font-size: 11.5px; font-weight: bold">
                        <span class="glyphicon glyphicon-off"></span>&nbsp;LogOut</a></li>
                <%-- <li><a href="Logout.aspx" id="lgout" style="color: #000000" runat="server">LogOut</a></li>--%>                          
                     
              </ul>
            </div>
            </nav>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentSection" runat="server">
    <div class="content gradbody">
        <div class="row" style="padding: 10px 0px 10px 0px; margin: auto">
            <div class="col-lg-12 col-md-12 sm-12 xs-12" style="padding-left: 25px; padding-right: 35px;">
                <asp:Label ID="Label16" class="font2 pull-right captalisefirstLetter" ForeColor="Black"
                    Font-Bold="true" runat="server" Text=""></asp:Label>
                <asp:Label ID="Label17" class="font pull-right" ForeColor="Black" Font-Bold="true"
                    runat="server"><span>&nbsp;</span></asp:Label>
                <asp:Label ID="Label15" class="font pull-right" ForeColor="Black" Font-Bold="true"
                    runat="server" Text="Welcome"></asp:Label>
            </div>
        </div>
        <div class="style1" style="text-align: center">
            <marquee direction="left" scrolldelay="122" behavior="slide">
            <strong><span class="style2">&nbsp; &nbsp; <span class="style4">* For more options and functions, 
            Kindly, do 
            login via authentication. Instructions are given on login page and employees 
            need to signup before login.</span> &nbsp;&nbsp;&nbsp; </span>
            <br class="style3" />
            </strong></marquee>
        </div>
        <br />
        <div id="divgrd" runat="server" visible="true" class="row" style="margin: auto">
            <div class="row" visible="false" style="padding-top: 0px; padding-bottom: 10px; margin: auto" >
                <div class="col-md-10 col-lg-10 col-sm-10" style="padding-left: 20px" runat="server" align="left">
                   
                    <asp:LinkButton ID="LinkButton3" Text="Download Posters for Vigilance Awareness Week - 2019" CssClass="font2" Visible="false"
                        Font-Underline="true" Font-Bold="true" ForeColor="Blue" CausesValidation="false" runat="server" OnClick="LinkButton3_Click"></asp:LinkButton>

                </div>
            </div>
            <div class="row" style="padding-top: 0px; padding-bottom: 10px; margin: auto">
            <div class="col-md-10 col-lg-10 col-sm-10" style="padding-left: 30px" runat="server" align="left">
                <asp:Image ID="imgcw" runat="server" Height="29px" Width="41px" ImageAlign="Middle" ImageUrl="~/images/IndianFlag.jpg" Class="image-responsive" />
                <asp:LinkButton ID="lnkcoronawarriors" Text="  Click here to salute and provide gratitude to the Prasar Bharati Corona Warriors..." CssClass="font2 blink_me"
                    Font-Underline="true" Font-Bold="true" ForeColor="Blue" CausesValidation="false" runat="server" OnClick="lnkcoronawarriors_Click"></asp:LinkButton>
            </div>
        </div>
            <div align="center" class=" col-md-3 col-sm-3 col-lg-3" runat="server" id="div5">
                <div id="divsearch2" class="table-responsive grad5 table-hover" runat="server" visible="false"
                    style="padding: 20px">
                    <div id="Div3" runat="server" align="center" class="grad3" style="padding-top: 4px; padding-bottom: 4px">
                        <asp:Label ID="Label4" runat="server" Text="Search Document" Style="font-weight: bold; font-size: medium; color: Black;"></asp:Label>&nbsp;
                    </div>
                    <table class="table table-bordered grad2">
                        <tr>
                            <td align="left" style="padding-right: 30px">
                                <asp:Label ID="lbldoctyp" runat="server" class="font" Text="Category" ForeColor="Black"
                                    Style="font-weight: bold;"></asp:Label>&nbsp;
                                <br />
                                <asp:DropDownList ID="ddldoctyp" runat="server" AutoPostBack="false" class="select widthofboxes"
                                    Height="22px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" style="padding-right: 30px">
                                <asp:Label ID="lblorg" runat="server" Text="Organisation" class="font" ForeColor="Black"
                                    Style="font-weight: bold;"></asp:Label>&nbsp;
                                <br />
                                <asp:DropDownList ID="ddlorg" runat="server" AutoPostBack="True" class="select widthofboxes"
                                    Height="22px" OnSelectedIndexChanged="ddlorg_SelectedIndexChanged">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr id="uploadedbyrow" runat="server" visible="false">
                            <td align="left" style="padding-right: 30px">
                                <asp:Label ID="lbluploadedby" runat="server" Text="UploadedBy" class="font" ForeColor="Black"
                                    Style="font-weight: bold;"></asp:Label>&nbsp;
                                <br />
                                <asp:DropDownList ID="ddluploadedby" runat="server" AutoPostBack="True" class="select widthofboxes"
                                    Height="22px" OnSelectedIndexChanged="ddluploadedby_SelectedIndexChanged">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr id="stationrow" runat="server" visible="false">
                            <td align="left" style="padding-right: 30px">
                                <asp:Label ID="lblstation" runat="server" Text="Station" class="font" ForeColor="Black"
                                    Style="font-weight: bold;"></asp:Label>&nbsp;
                                <br />
                                <asp:DropDownList ID="ddlstation" runat="server" AutoPostBack="false" class="select widthofboxes"
                                    Height="22px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr id="SectionRow" runat="server" visible="false">
                            <td align="left" style="padding-right: 30px">
                                <asp:Label ID="lblSection" runat="server" class="font" Text="Section" ForeColor="Black"
                                    Style="font-weight: bold;"></asp:Label>&nbsp;
                                <br />
                                <asp:DropDownList ID="ddlsection" runat="server" AutoPostBack="false" class="select widthofboxes"
                                    Height="22px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" style="padding-right: 30px">
                                <asp:Label ID="lbltitle" runat="server" Text="Title/Subject" class="font" ForeColor="Black"
                                    Style="font-weight: bold;"></asp:Label>&nbsp;
                                <br />
                                <asp:TextBox ID="txttitle" class="select widthofboxes" Height="50px" runat="server"
                                    TextMode="MultiLine"></asp:TextBox>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender7" runat="server"
                                    TargetControlID="txttitle" ValidChars="1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ@#)(&-_%?/\][{} "></ajaxToolkit:FilteredTextBoxExtender>

                            </td>
                        </tr>
                        <tr>
                            <td align="left" style="padding-right: 30px">
                                <asp:Label ID="lblfileno" runat="server" Text="File-No" ForeColor="Black" Style="font-weight: bold;"
                                    class="font"></asp:Label>&nbsp;
                                <br />
                                <asp:TextBox ID="txtfileno" runat="server" class="select widthofboxes" Height="22px"></asp:TextBox>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server"
                                    TargetControlID="txtfileno" ValidChars="1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ)(&-_%?/\][{} "></ajaxToolkit:FilteredTextBoxExtender>

                            </td>
                        </tr>
                        <tr>
                            <td align="left" style="padding-right: 30px">
                                <asp:Label ID="lbldatedoc" runat="server" Text="Date(From)" ForeColor="Black" Style="font-weight: bold;"
                                    class="font"></asp:Label>&nbsp;
                                <br />
                                <asp:TextBox ID="txtdatedoc" runat="server" class="select widthofboxes" Height="22px"></asp:TextBox>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server"
                                    TargetControlID="txtdatedoc" ValidChars="0123456789-"></ajaxToolkit:FilteredTextBoxExtender>

                                <ajaxToolkit:CalendarExtender ID="txtdatedoc_CalendarExtender" runat="server" BehaviorID="txtdatedoc_CalendarExtender"
                                    Format="dd-MM-yyyy" TargetControlID="txtdatedoc" />
                                <br />
                                <asp:CompareValidator ID="cValFrom" runat="server" ErrorMessage="<br>Date(From) must not be later than today"
                                    Operator="LessThanEqual" ControlToValidate="txtdatedoc" Type="Date" Display="Dynamic"
                                    SetFocusOnError="True" Style="color: #FF0000; font-size: small"></asp:CompareValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" style="padding-right: 30px">
                                <asp:Label ID="Label2" runat="server" Text="Date(To)" ForeColor="Black" Style="font-weight: bold;"
                                    class="font"></asp:Label>&nbsp;
                                <br />
                                <asp:TextBox ID="txttodate" runat="server" class="select widthofboxes" Height="22px"></asp:TextBox>
                                <ajaxToolkit:CalendarExtender ID="txttodate_CalendarExtender" runat="server" BehaviorID="txttodate_CalendarExtender"
                                    Format="dd-MM-yyyy" TargetControlID="txttodate" />
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server"
                                    TargetControlID="txttodate" ValidChars="0123456789-"></ajaxToolkit:FilteredTextBoxExtender>
                                <br />
                                <asp:CompareValidator ID="CompareValidator2" ForeColor="Red" runat="server" ControlToValidate="txttodate"
                                    ControlToCompare="txtdatedoc" Display="Dynamic" Operator="GreaterThanEqual" Type="Date"
                                    ErrorMessage="Date(To) must be later than the Date(From)" SetFocusOnError="True"
                                    Style="font-size: small"></asp:CompareValidator>
                                <br />
                                <asp:CompareValidator ID="cValTo" runat="server" ErrorMessage="<br>Date(To) must not be later than today"
                                    Operator="LessThanEqual" ControlToValidate="txttodate" Type="Date" Display="Dynamic"
                                    SetFocusOnError="True" Style="color: #FF0000; font-size: small"></asp:CompareValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" style="padding-right: 30px">
                                <asp:Label ID="lblorderno" runat="server" Text="OrderNo" class="font" ForeColor="Black"
                                    Style="font-weight: bold;"></asp:Label>&nbsp;
                                <br />
                                <asp:TextBox ID="txtorder" runat="server" class="select widthofboxes" Height="22px"></asp:TextBox>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender42" runat="server"
                                    TargetControlID="txtorder" ValidChars="1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ)(&-_%?/\][{} "></ajaxToolkit:FilteredTextBoxExtender>

                            </td>
                        </tr>
                        <tr>
                            <td align="left" style="padding-right: 10px">
                                <asp:Button ID="btnsearch" runat="server" Text="Search" class="btn select button111"
                                    Style="background-color: #99FFCC; color: Black; font-weight: bold" OnClick="btnsearch_Click"
                                    ToolTip="Search" />
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="btncncl" runat="server" Text="Close" class="btn select gradbody button111"
                                    Style="color: Black; font-weight: bold" CausesValidation="False"
                                    OnClick="btncncl_Click" />
                            </td>
                        </tr>
                    </table>
                </div>
                <div id="divcat" runat="server" class="grad5 table-hover" style="padding: 20px; margin: auto;"
                    visible="true" align="left">
                    <asp:Repeater ID="RepDetails" runat="server" OnItemCommand="RepDetails_ItemCommand">
                        <HeaderTemplate>
                            <table cellpadding="0">
                                <tr style="color: Black">
                                    <td>
                                        <span style="font-weight: bold; text-decoration: underline;" class="font2">Filter by Document
                                            Category</span>
                                        <br />
                                        <br />
                                    </td>
                                </tr>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td>
                                    <asp:LinkButton ID="lnkelg" runat="server" CssClass="btn gradbody21 font button112"
                                        CausesValidation="False" CommandName="catsearch" Style="color: #000000" Text='<%#Eval("Doc_Type") %>'>
                                    </asp:LinkButton>
                                    <asp:Label ID="lbldoccatid" runat="server" Text='<%#Eval("Docid") %>' Visible="false"></asp:Label>
                                    <br />
                                    <br />
                                </td>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            </table>
                        </FooterTemplate>
                    </asp:Repeater>
                </div>
                <br />
                <br />
            </div>
            <div align="center" class=" col-md-9 col-sm-9 col-lg-9" runat="server" id="div6">
                <div id="divsrch1" runat="server" visible="true" align="center">
                    <%--<asp:LinkButton ID="lnksearch1" runat="server" Font-Bold="True" Font-Size="Medium"
                        ForeColor="#000099" OnClick="lnksearch_Click">Search Document</asp:LinkButton>--%>
                    <asp:LinkButton ID="lnksearch" runat="server" CssClass="btn grad4" CausesValidation="False"
                        OnClick="lnksearch_Click"> <span aria-hidden="true" style="color: Black"class="glyphicon glyphicon-search"></span>&nbsp;<span style="font-weight: bold; color: #000000">Search Document</span></asp:LinkButton>
                </div>
                <br />
                <div class="panel panel-primary">
                    <div class="panel-heading grad3">
                        <span style="font-size: medium; font-weight: bold; color: Black;">:: Documents ::</span>
                    </div>
                    <div class="panel-body grad2 table-responsive">
                        <%-- <div style="text-align: center">
                          
                        <asp:LinkButton ID="btnprint1" Style="background-color: #F1948A" runat="server" 
                                CssClass="btn" CausesValidation="False"> <span aria-hidden="true" style="color: Black"class="glyphicon glyphicon-print"></span>&nbsp; <span style="font-weight: bold; color: #000000">Print</span></asp:LinkButton>                   
                        </div>--%>
                        <div class="row" id="divshow" runat="server" visible="false" style="margin: auto;">
                            <div style="padding-left: 50px" class="col-md-6 col-sm-6 col-xs-12 col-lg-6">
                                <asp:Label ID="Label5" Visible="false" runat="server" class="font2 pull-left" Text="Selected Document Type: "
                                    Style="font-weight: 700; font-family: 'Baskerville Old Face'; color: #800000"></asp:Label>
                                <asp:Label ID="lblcat" runat="server" Text="" class="font2 pull-left" Style="font-weight: 700; color: #800000; font-family: 'Baskerville Old Face'; background-color: #FFFFCC"></asp:Label>
                            </div>
                            <div style="padding-right: 50px" class="col-md-6 col-sm-6 col-xs-12 col-lg-6 pull-right">
                                <asp:LinkButton ID="lnkshowall" runat="server" CssClass="btn gradbody font button111 pull-right"
                                    CausesValidation="False" CommandName="catsearch" Style="color: #000000" Text="Show All"
                                    OnClick="lnkshowall_Click">
                                </asp:LinkButton>
                            </div>
                        </div>
                        <br />
                        <asp:GridView ID="grddoc" runat="server" DataKeyNames="Docid" AutoGenerateColumns="False"
                            AllowPaging="True" PageSize="25" EmptyDataText=".. Records Not Found .." ShowHeaderWhenEmpty="True"
                            Width="80%" OnPageIndexChanging="grddoc_PageIndexChanging" OnRowCommand="grddoc_RowCommand"
                            ForeColor="#333333" BorderStyle="Solid" BorderWidth="2px">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:TemplateField HeaderText="S.No." ItemStyle-Width="8%">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSNo" Font-Bold="true" runat="server" Text='<%#Container.DataItemIndex+1 %>' />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Uploaded By" ItemStyle-Width="8%">
                                    <ItemTemplate>
                                        <div style="padding-left: 7px; padding-right: 5px" align="left">
                                            <asp:Label ID="lbluploader" Font-Italic="true" runat="server" Text='<%#Eval("UploaderName") %>'
                                                class="fontingrid" Font-Bold="true" />
                                        </div>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Title/Subject" ItemStyle-Width="59%">
                                    <ItemTemplate>
                                        <div style="padding-left: 10px">
                                            <asp:LinkButton ID="lnktitle" runat="server" CommandName="Download" Text='<%#Eval("Doc_Title") %>' Font-Underline="false"
                                                class="font2" Font-Bold="True" CausesValidation="False" ForeColor="Blue" />
                                            <br />
                                            <%--<asp:Label ID="Label1" runat="server" Text="(" Font-Size="Smaller" />
                                        <asp:Label ID="lbldoctypename1" runat="server" Text='<%#Eval("Doc_Type") %>' Font-Size="Smaller" />
                                        <asp:Label ID="Lbbrac" runat="server" Text=")" Font-Size="Smaller" />--%>
                                            <asp:Label ID="lbluplon" runat="server" Text="Uploaded On" Font-Size="9pt" Font-Bold="true"
                                                ForeColor="Maroon" />
                                            <asp:Label ID="lbluplon1" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />
                                            <asp:Label ID="lbluplon2" Font-Italic="true" runat="server" Text='<%#Eval("Createdon", "{0:dd-MMM-yyyy}")%>'
                                                Font-Size="8pt" Font-Bold="true" />
                                            <br />
                                            <asp:Label ID="Label1" runat="server" Text="Doc-Category" Font-Size="9pt" Font-Bold="true"
                                                ForeColor="Maroon" />
                                            <asp:Label ID="Label6" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />
                                            <asp:Label ID="Label7" Font-Italic="true" runat="server" Text='<%#Eval("Doc_Type") %>'
                                                Font-Size="8pt" Font-Bold="true" />
                                        </div>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Order No. " ItemStyle-Width="15%">
                                    <ItemTemplate>
                                        <div style="padding-left: 5px; padding-right: 5px">
                                            <%-- <asp:Label ID="Label2" runat="server" Text="Order No." Font-Size="Smaller" />
                                        <asp:Label ID="Label5" runat="server" Text=" : " Font-Size="Smaller" />--%>
                                            <asp:Label ID="Label3" Font-Bold="true" runat="server" Text='<%#Eval("Doc_OrderNo") %>'
                                                class="fontingrid" />
                                            <%--<br />
                                        <asp:Label ID="Label6" runat="server" Text="File No." Font-Size="Smaller" />
                                        <asp:Label ID="Label7" runat="server" Text=" : " Font-Size="Smaller" />
                                        <asp:Label ID="Label8" runat="server" Text='<%#Eval("Doc_FileNo") %>' Font-Size="Smaller" />--%>
                                        </div>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" />
                                    <HeaderStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Dated" ItemStyle-Width="10%">
                                    <ItemTemplate>
                                        <%--<asp:Label ID="Label9" runat="server" Text="Dated" Font-Size="Smaller" />
                                        <asp:Label ID="Label10" runat="server" Text=" : " Font-Size="Smaller" />--%>
                                        <asp:Label ID="Label11" Font-Bold="true" runat="server" Text='<%#Eval("Doc_Dated", "{0:dd-MMM-yyyy}") %>'
                                            class="fontingrid" /><%--Text='<%# Eval("tDate", "{0:dd-MMM-yyyy}") %>'--%>
                                        <asp:Label ID="lbldoctypeid" runat="server" Text='<%#Eval("Doc_Typeid") %>' Visible="false"
                                            Font-Size="Small" />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                            </Columns>
                            <EditRowStyle BackColor="#2461BF" />
                            <FooterStyle BackColor="#E67E22" Font-Bold="True" ForeColor="Black" />
                            <HeaderStyle BackColor="#E67E22" Font-Bold="True" ForeColor="Black" HorizontalAlign="Center"
                                CssClass="centerHeaderText fontingrid" Wrap="True"></HeaderStyle>
                            <PagerSettings Position="TopAndBottom" />
                            <PagerStyle BackColor="#E67E22" CssClass="cssPager pag" ForeColor="White" Font-Size="Small"
                                HorizontalAlign="Left" VerticalAlign="Middle" Font-Bold="True" BorderColor="Black"
                                BorderWidth="2" />
                            <RowStyle BackColor="#EFF3FB" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#F5F7FB" />
                            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                            <SortedDescendingCellStyle BackColor="#E9EBEF" />
                            <SortedDescendingHeaderStyle BackColor="#4870BE" />
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
