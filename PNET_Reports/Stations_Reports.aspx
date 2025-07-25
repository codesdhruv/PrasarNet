<%@ Page Title="" Language="C#" MasterPageFile="~/PNET_Reports/MonthlyReportsEntry.Master" AutoEventWireup="true" CodeBehind="Stations_Reports.aspx.cs" Inherits="PrasarNet.PNET_Reports.WebForm2" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style type="text/css">
        .Radiospace label {
            margin-right: 10px;
        }

        legend {
            display: block;
            padding-left: 2px;
            padding-right: 2px;
            border-color: red;
            width: 97%;
        }
    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">

        <ContentTemplate>


            <section class="wrapper">
                <section class="page_head">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12">
                                <h2>Monthly Reports</h2>
                                <nav id="breadcrumbs">
                                    <ul>
                                        <li>Welcome :</li>
                                        <li>
                                            <label id="lblloginstation" runat="server"></label>
                                        </li>
                                        <li><a href="#">Monthly Reports</a></li>

                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                </section>

                <section class="content about">
                    <div class="container">


                        <div class="row sub_content">
                            <div class="who">



                                <div class="col-lg-12 col-md-12 col-sm-12">


                                    <asp:ScriptManager ID="scrptmngr" runat="server"></asp:ScriptManager>




                                    <section class="page_head" style="width: 100%;">
                                        <div class="container">

                                            <div class="row">

                                                <div class="row col-lg-12">

                                                    <div class="col-lg-1">
                                                        <h4>Report</h4>
                                                    </div>


                                                    <div class="col-lg-2 ">

                                                        <asp:DropDownList ID="ddlreporttype" runat="server" AutoPostBack="true" CssClass="form-control" OnSelectedIndexChanged="ddlreporttype_SelectedIndexChanged"></asp:DropDownList>

                                                    </div>

                                                    <div class="col-lg-1 ">
                                                        <h4>Year</h4>
                                                    </div>


                                                    <div class="col-lg-2">

                                                        <asp:DropDownList ID="ddlyear" runat="server" AutoPostBack="true" CssClass="form-control" OnSelectedIndexChanged="ddlyear_SelectedIndexChanged"></asp:DropDownList>

                                                    </div>

                                                    <div class="col-lg-1 ">
                                                        <h4>Month</h4>
                                                    </div>


                                                    <div class="col-lg-2">

                                                        <asp:DropDownList ID="ddlmonth" runat="server" AutoPostBack="true" CssClass="form-control" OnSelectedIndexChanged="ddlmonth_SelectedIndexChanged"></asp:DropDownList>

                                                    </div>


                                                    <div class="col-lg-1 " id="divservicetext" runat="server"> 
                                                        <h4>Service</h4>
                                                    </div>


                                                    <div class="col-lg-2" id="divserviceddl" runat="server"> 

                                                        <asp:DropDownList ID="ddlservices" runat="server" AutoPostBack="true" CssClass="form-control" OnSelectedIndexChanged="ddlservices_SelectedIndexChanged"></asp:DropDownList>

                                                    </div>

                                                    

                                                    </div>

                                                    
                                                    
                                                </div>

                                            <div class="row" style="visibility:hidden;">

                                                <div class="row col-lg-12">

                                                   <div class="col-lg-1 ">
                                                        <h4>Zone</h4>
                                                    </div>


                                                    <div class="col-lg-3">

                                                        <asp:DropDownList ID="ddlzone" runat="server" AutoPostBack="true" CssClass="form-control" OnSelectedIndexChanged="ddlzone_SelectedIndexChanged"></asp:DropDownList>

                                                    </div>

                                                    <div class="col-lg-1 ">
                                                        <h4>State</h4>
                                                    </div>


                                                    <div class="col-lg-3">

                                                        <asp:DropDownList ID="ddlstate" runat="server" AutoPostBack="true" CssClass="form-control" OnSelectedIndexChanged="ddlstate_SelectedIndexChanged"></asp:DropDownList>

                                                    </div>

                                                     <div class="col-lg-1 ">
                                                        <h4>Station</h4>
                                                    </div>


                                                    <div class="col-lg-3">

                                                        <asp:DropDownList ID="ddlstation" runat="server" AutoPostBack="true" CssClass="form-control" OnSelectedIndexChanged="ddlstation_SelectedIndexChanged"></asp:DropDownList>

                                                    </div>

                                                    <span style="color:#337585;"></span>

                                                </div>


                                                
                                            </div>

                                        </div>
                                    </section>

                                    <br />


                                   <section class="page_head" style="width: 100%;">
                                        <div class="container">
                                            <div class="row">



                                                <div class="row col-lg-12" style="margin-top: 0px;overflow:auto;">

                                                    <asp:GridView ID="Gridrpt" runat="server" Width="100%" CssClass="table">

                                                        <HeaderStyle BackColor="#337585" Font-Bold="True" ForeColor="white" HorizontalAlign="Center" VerticalAlign="Middle" Height="30px" />
                                                        <PagerStyle ForeColor="#003399" HorizontalAlign="Center" CssClass="GridPager" Height="20px" />
                                                        <RowStyle BackColor="White" ForeColor="#686868" Height="41px" />
                                                        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                                                        <SortedAscendingCellStyle BackColor="#EDF6F6" />
                                                        <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                                                        <SortedDescendingCellStyle BackColor="#D6DFDF" />

                                                    </asp:GridView>

                                                   <%--Gridview for New Equipment Received--%>

                                                    <asp:GridView ID="Gridnewequiprec" runat="server" AutoGenerateColumns="true" CssClass="table" Visible="false"></asp:GridView>

                                                    <label id="lblnotfound" runat="server" style="font-size:medium;color:red;font-weight:bold;"></label>
                                                 
                                                    <asp:Label ID="lblneweqip" runat="server" Visible="false"></asp:Label>

                                                      <%--Gridview for AC Plant--%>


                                                    <asp:GridView ID="GridACPlant" runat="server" AutoGenerateColumns="true" CssClass="table" Visible="false"></asp:GridView>

                                                    <asp:Label ID="lblacplant" runat="server" Visible="false"></asp:Label>

                                                    <%--Gridview for UPS--%>

                                                     <asp:GridView ID="GridUPS" runat="server" AutoGenerateColumns="true" CssClass="table" Visible="false"></asp:GridView>

                                                    <asp:Label ID="Lblups" runat="server" Visible="false"></asp:Label>

                                                     <%--Gridview for Defective Equipment--%>

                                                     <asp:GridView ID="GriddefectiveEquip" runat="server" AutoGenerateColumns="true" CssClass="table" Visible="false"></asp:GridView>

                                                    <asp:Label ID="LbldefectiveEquip" runat="server" Visible="false"></asp:Label>




                                                    <%--Gridview for Sattellite Parameters --%>

                                                    <asp:GridView ID="Gridsatpara" runat="server" AutoGenerateColumns="true" CssClass="table" Visible="false"></asp:GridView>

                                                   <%-- <label id="Label1" runat="server" style="font-size:medium;color:red;font-weight:bold;"></label>--%>
                                                 
                                                    <asp:Label ID="Lblgridsatpara" runat="server" Visible="false"></asp:Label>

                                                      <%--Gridview for Service Information--%>


                                                    <asp:GridView ID="Gridservinfo" runat="server" AutoGenerateColumns="true" CssClass="table" Visible="false"></asp:GridView>

                                                    <asp:Label ID="Lblservinfo" runat="server" Visible="false"></asp:Label>

                                                    <%--Gridview for Special Feed Agncy--%>

                                                     <asp:GridView ID="Gridspecfeed" runat="server" AutoGenerateColumns="true" CssClass="table" Visible="false"></asp:GridView>

                                                    <asp:Label ID="Lblspecfeed" runat="server" Visible="false"></asp:Label>

                                                     <%--Gridview for Break down Details--%>

                                                     <asp:GridView ID="Gridbreakddetails" runat="server" AutoGenerateColumns="true" CssClass="table" Visible="false"></asp:GridView>

                                                    <asp:Label ID="LblBDdetails" runat="server" Visible="false"></asp:Label>

                                                    <%--Gridview for Equipment Details--%>

                                                     <asp:GridView ID="Gridequipdet" runat="server" AutoGenerateColumns="true" CssClass="table" Visible="false"></asp:GridView>

                                                    <asp:Label ID="Lblequpdetails" runat="server" Visible="false"></asp:Label>

                                                     <%--Gridview for Highlights Coverage--%>

                                                     <asp:GridView ID="Gridhighcov" runat="server" AutoGenerateColumns="true" CssClass="table" Visible="false"></asp:GridView>

                                                    <asp:Label ID="Lblhighcov" runat="server" Visible="false"></asp:Label>


                                                </div>




                                            </div>
                                        </div>
                                    </section>










                                </div>
                            </div>







                        </div>
                </section>
            </section>


        </ContentTemplate>



    </asp:UpdatePanel>

</asp:Content>
