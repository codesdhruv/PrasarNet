<%@ Page Title="" Language="C#" MasterPageFile="~/PNET_Reports/MonthlyReportsEntry.Master" AutoEventWireup="true" CodeBehind="DSNGEntry.aspx.cs" MaintainScrollPositionOnPostback="true" Inherits="PrasarNet.PNET_Reports.WebForm3" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style type="text/css">
        .Radiospace label {
            margin-right: 10px;
        }

        fieldset {
            min-width: 0;
            padding: 0;
            margin: 0;
            border: 0;
        }

        .well {
            min-height: 20px;
            padding: 19px;
            margin-bottom: 20px;
            background-color: #f5f5f5;
            border: 1px solid #337585;
            border-radius: 4px;
            -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .05);
            box-shadow: inset 0 1px 1px rgba(0, 0, 0, .05);
        }

        .well-legend {
            display: block;
            font-size: 14px;
            width: auto;
            padding: 2px 7px 2px 5px;
            margin-bottom: 20px;
            line-height: inherit;
            color: #333;
            background: #fff;
            border: 1px solid #e3e3e3;
            border-radius: 4px;
            box-shadow: inset 0 1px 1px rgba(0, 0, 0, .05);
            -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .05);
        }

        .Watermark {
            color: #AAA;
            background-color: beige;
        }

        .GridPager a, .GridPager span {
            display: block;
            height: 30px;
            width: 30px;
            font-weight: bold;
            text-align: center;
            text-decoration: none;
        }

        .GridPager a {
            background-color: #f5f5f5;
            color: #969696;
            border: 1px solid #969696;
        }

        .GridPager span {
            background-color: #337585;
            color: #000;
            border: 1px solid #3AC0F2;
        }
    </style>

    <script type="text/javascript">
        function checkFileExtension(elem) {
            var filePath = elem.value;

            if (filePath.indexOf('.') == -1)
                return false;


            var validExtensions = new Array();
            var ext = filePath.substring(filePath.lastIndexOf('.') + 1).toLowerCase();

            validExtensions[0] = 'doc';
            validExtensions[1] = 'docx';
            validExtensions[2] = 'pdf';

            for (var i = 0; i < validExtensions.length; i++) {
                if (ext == validExtensions[i])
                    return true;
            }

            alert('The file extension ' + ext.toUpperCase() + ' is not allowed!');
            return false;

        }

    </script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section class="wrapper">
        <section class="page_head">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12">
                        <h2>Entry Form for DSNG</h2>
                        <nav id="breadcrumbs">
                            <ul>
                                <li>Welcome :</li>
                                <li>
                                    <label id="lblloginstation" runat="server"></label>
                                </li>
                                <li><a href="#">DSNG Monthly Reports</a></li>

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


                           <%-- <asp:UpdatePanel ID="UpdatePanel1" runat="server">

                             <ContentTemplate>--%>



                                  <fieldset class="well">
                                <legend class="well-legend">Basic Details</legend>

                                <section class="page_head" style="width: 100%;">
                                    <div class="container">

                                        <div class="row">

                                            <div class="row col-lg-12">


                                                <div class="col-lg-1 ">
                                                    <h4>Year</h4>
                                                </div>


                                                <div class="col-lg-3">

                                                    <asp:DropDownList ID="ddlyear" runat="server" CssClass="form-control" ></asp:DropDownList>

                                                </div>

                                                <div class="col-lg-1 ">
                                                    <h4>Month</h4>
                                                </div>


                                                <div class="col-lg-3">

                                                    <asp:DropDownList ID="ddlmonth" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlmonth_SelectedIndexChanged" ></asp:DropDownList>

                                                </div>


                                                <div class="col-lg-1 ">
                                                    <h4>Zone</h4>
                                                </div>


                                                <div class="col-lg-2">

                                                    <asp:DropDownList ID="ddlzone" runat="server" AutoPostBack="true" CssClass="form-control"></asp:DropDownList>

                                                </div>


                                            </div>

                                            <div class="row col-lg-12">

                                                <div class="col-lg-1">
                                                    <h4>State</h4>
                                                </div>


                                                <div class="col-lg-3 ">

                                                    <asp:DropDownList ID="ddlstate" runat="server" CssClass="form-control" ></asp:DropDownList>

                                                </div>



                                                <div class="col-lg-1 ">
                                                    <h4>Station</h4>
                                                </div>


                                                <div class="col-lg-3">

                                                    <asp:DropDownList ID="ddlstation" runat="server" CssClass="form-control"></asp:DropDownList>

                                                </div>


                                            </div>

                                             <div class="row col-lg-12">

                                                <div class="col-lg-2">
                                                    <h4>HPA Rated Power</h4>
                                                </div>


                                                <div class="col-lg-2 ">

                                                    <asp:TextBox ID="Txthparatedpwr" runat="server" CssClass="form-control"></asp:TextBox>

                                                </div>



                                                <div class="col-lg-2 ">
                                                    <h4>Normal Uplink Power</h4>
                                                </div>


                                                <div class="col-lg-2">

                                                    <asp:TextBox ID="Txtnormaluplinkpwr" runat="server" CssClass="form-control"></asp:TextBox>

                                                </div>


                                            </div>


                                        </div>
                                    </div>
                                </section>

                            </fieldset>



                                  <fieldset class="well">
                                <legend class="well-legend">Sattelite Parameters</legend>

                                <section class="page_head" style="width: 100%;">
                                    <div class="container">

                                        <div class="row">

                                            <div class="row col-lg-12">


                                               <asp:GridView ID="Gridsatpara" runat="server" AutoGenerateColumns="False" ShowFooter="true" 
                                                OnRowCancelingEdit="Gridsatpara_RowCancelingEdit1" GridLines="Both" OnRowDeleting="Gridsatpara_RowDeleting1" OnRowEditing="Gridsatpara_RowEditing1"
                                                OnRowUpdating="Gridsatpara_RowUpdating1" CssClass="table" Width="93%">

                                                <Columns>
                                                    <asp:TemplateField>
                                                        <HeaderTemplate>S.No</HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="LblSlnoup" runat="server" Text='<%#Container.DataItemIndex + 1%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center" Visible="false">
                                                        <HeaderTemplate>Slno</HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="LblSlno_sat" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Slno").ToString())%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>


                                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center">
                                                        <HeaderTemplate>DSNG Type</HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="LblDSNGtype" runat="server" Text='<%# Server.HtmlEncode((string)Eval("DSNG_Type").ToString())%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TxtDSNGtypeupdt" runat="server" Text='<%# Server.HtmlEncode((string)Eval("DSNG_Type").ToString())%>' class="form-control"></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <FooterTemplate>
                                                            <asp:TextBox ID="TxtDSNGtypeins" runat="server" class="form-control"></asp:TextBox>
                                                        </FooterTemplate>
                                                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField ItemStyle-HorizontalAlign="left" ItemStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center">
                                                        <HeaderTemplate>MCPC/SCPC</HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="LblMCPC_SCPC" runat="server" Text='<%# Server.HtmlEncode((string)Eval("MCPC_SCPC").ToString())%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                           
                                                             <asp:HiddenField ID="hdnmcpcscpcupdt" runat="server" Value='<%#Server.HtmlEncode((string)Eval("MCPC_SCPC").ToString())%>' />

                                                            <asp:DropDownList ID="ddlmcpcscpcupdt" runat="server">

                                                                <asp:ListItem>MCPC</asp:ListItem>
                                                                <asp:ListItem>SCPC</asp:ListItem>

                                                            </asp:DropDownList>
                                                                                                               
                                                        </EditItemTemplate>

                                                        <FooterTemplate>

                                                           
                                                            <asp:DropDownList ID="ddlmcpcscpcins" runat="server">

                                                                <asp:ListItem>Select</asp:ListItem>
                                                                <asp:ListItem>MCPC</asp:ListItem>
                                                                <asp:ListItem>SCPC</asp:ListItem>

                                                            </asp:DropDownList>
                                                        
                                                        
                                                        </FooterTemplate>
                                                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField ItemStyle-HorizontalAlign="left" ItemStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center">
                                                        <HeaderTemplate>Satellite Transponder</HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="LblSattellite_Transponder" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Sattellite_Transponder").ToString())%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TxtSattellite_Transponderupdt" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Sattellite_Transponder").ToString())%>' class="form-control"></asp:TextBox>
                                                        </EditItemTemplate>

                                                        <FooterTemplate>
                                                            <asp:TextBox ID="TxtSattellite_Transponderins" runat="server" class="form-control"></asp:TextBox>
                                                        </FooterTemplate>
                                                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField ItemStyle-HorizontalAlign="center" ItemStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center">
                                                        <HeaderTemplate>Uplink Freq.</HeaderTemplate>
                                                        <ItemTemplate>
                                                           <asp:Label ID="LblUplink_Freq" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Uplink_Freq").ToString())%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TxtUplink_Frequpdt" Width="50%" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Uplink_Freq").ToString())%>' class="form-control"></asp:TextBox>
                                                        </EditItemTemplate>

                                                        <FooterTemplate>
                                                            <asp:TextBox ID="TxtUplink_Freqins" runat="server" Width="50%" class="form-control"></asp:TextBox>                                                          
                                                        </FooterTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" Width="15%"></HeaderStyle>
                                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="15%"></ItemStyle>
                                                        <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="15%" />
                                                    </asp:TemplateField>

                                                     <asp:TemplateField ItemStyle-HorizontalAlign="center" ItemStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center">
                                                        <HeaderTemplate>Uplink Pol.</HeaderTemplate>
                                                        <ItemTemplate>
                                                           <asp:Label ID="LblUplink_Pol" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Uplink_Pol").ToString())%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TxtUplink_Polupdt" Width="50%" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Uplink_Pol").ToString())%>' class="form-control"></asp:TextBox>
                                                        </EditItemTemplate>

                                                        <FooterTemplate>
                                                            <asp:TextBox ID="TxtUplink_Polins" runat="server" Width="50%" class="form-control"></asp:TextBox>                                                          
                                                        </FooterTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" Width="15%"></HeaderStyle>
                                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="15%"></ItemStyle>
                                                        <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="15%" />
                                                    </asp:TemplateField>

                                                     <asp:TemplateField ItemStyle-HorizontalAlign="center" ItemStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center">
                                                        <HeaderTemplate>Downlink Freq.</HeaderTemplate>
                                                        <ItemTemplate>
                                                           <asp:Label ID="LblDownlink_Freq" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Downlink_Freq").ToString())%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TxtDownlink_Frequpdt" Width="50%" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Downlink_Freq").ToString())%>' class="form-control"></asp:TextBox>
                                                        </EditItemTemplate>

                                                        <FooterTemplate>
                                                            <asp:TextBox ID="TxtDownlink_Freqins" runat="server" Width="50%" class="form-control"></asp:TextBox>                                                          
                                                        </FooterTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" Width="15%"></HeaderStyle>
                                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="15%"></ItemStyle>
                                                        <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="15%" />
                                                    </asp:TemplateField>

                                                    <asp:TemplateField ItemStyle-HorizontalAlign="center" ItemStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center">
                                                        <HeaderTemplate>Downlink k Pol.</HeaderTemplate>
                                                        <ItemTemplate>
                                                           <asp:Label ID="LblDownlink_KPol" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Downlink_KPol").ToString())%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TxtDownlink_KPolupdt" Width="50%" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Downlink_KPol").ToString())%>' class="form-control"></asp:TextBox>
                                                        </EditItemTemplate>

                                                        <FooterTemplate>
                                                            <asp:TextBox ID="TxtDownlink_KPolins" runat="server" Width="50%" class="form-control"></asp:TextBox>                                                          
                                                        </FooterTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" Width="15%"></HeaderStyle>
                                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="15%"></ItemStyle>
                                                        <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="15%" />
                                                    </asp:TemplateField>

                                                     <asp:TemplateField ItemStyle-HorizontalAlign="left" ItemStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center">
                                                        <HeaderTemplate>FEC</HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="LblFEC" runat="server" Text='<%# Server.HtmlEncode((string)Eval("FEC").ToString())%>'></asp:Label>                      
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TxtFECupdt" runat="server" Text='<%# Server.HtmlEncode((string)Eval("FEC").ToString())%>' class="form-control"></asp:TextBox>                                                            
                                                        </EditItemTemplate>

                                                        <FooterTemplate>
                                                            <asp:TextBox ID="TxtFECins" runat="server" class="form-control"></asp:TextBox>                                                           
                                                        </FooterTemplate>
                                                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField ItemStyle-HorizontalAlign="left" ItemStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center">
                                                        <HeaderTemplate>SR(MBPS)</HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="LblSR_Mbps" runat="server" Text='<%# Server.HtmlEncode((string)Eval("SR_Mbps").ToString())%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TxtSR_Mbpsupdt" runat="server" Text='<%# Server.HtmlEncode((string)Eval("SR_Mbps").ToString())%>' class="form-control"></asp:TextBox>
                                                        </EditItemTemplate>

                                                        <FooterTemplate>
                                                            <asp:TextBox ID="TxtSR_Mbpsins" runat="server" class="form-control"></asp:TextBox>
                                                        </FooterTemplate>
                                                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField ItemStyle-HorizontalAlign="left" ItemStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center">
                                                        <HeaderTemplate>BW(MHz)</HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="LblBW_MHZ" runat="server" Text='<%# Server.HtmlEncode((string)Eval("BW_MHZ").ToString())%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TxtBW_MHZupdt" runat="server" Text='<%# Server.HtmlEncode((string)Eval("BW_MHZ").ToString())%>' class="form-control"></asp:TextBox>
                                                        </EditItemTemplate>

                                                        <FooterTemplate>
                                                            <asp:TextBox ID="TxtBW_MHZins" runat="server" class="form-control"></asp:TextBox>
                                                        </FooterTemplate>
                                                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                                    </asp:TemplateField>


                                                   
                                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                                                        <HeaderTemplate>Operation</HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="Linkedit" runat="server" CommandName="edit" CausesValidation="false">Edit</asp:LinkButton>
                                                            /
                                                                    <asp:LinkButton ID="Linkdelete" runat="server" CommandName="delete" CausesValidation="false">Delete</asp:LinkButton>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:LinkButton ID="Linkupdate" runat="server" CommandName="update" CausesValidation="false">Update</asp:LinkButton>
                                                            /
                                                                    <asp:LinkButton ID="LinkButton4" runat="server" CommandName="cancel" CausesValidation="false">Cancel</asp:LinkButton>

                                                        </EditItemTemplate>
                                                        <FooterTemplate>
                                                            <asp:Button ID="Btnsavesat" runat="server" Text="Add" OnClick="SaveRecordsat" CausesValidation="false"  CssClass="form-control" />
                                                        </FooterTemplate>



                                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                                    </asp:TemplateField>


                                                </Columns>

                                                <HeaderStyle BackColor="#337585" Font-Bold="True" ForeColor="white" HorizontalAlign="Center" VerticalAlign="Middle" Height="30px" />
                                                <PagerStyle ForeColor="#003399" HorizontalAlign="Center" CssClass="GridPager" Height="20px" />
                                                <RowStyle BackColor="White" ForeColor="#686868" Height="41px" />
                                                <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                                                <SortedAscendingCellStyle BackColor="#EDF6F6" />
                                                <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                                                <SortedDescendingCellStyle BackColor="#D6DFDF" />
                                                <SortedDescendingHeaderStyle BackColor="#002876" />


                                            </asp:GridView>


                                            </div>

                                        </div>
                                    </div>
                                </section>

                                </fieldset>

                                  <fieldset class="well">
                                <legend class="well-legend">Service Information</legend>

                                <section class="page_head" style="width: 100%;">
                                    <div class="container">

                                        <div class="row">

                                            <div class="row col-lg-12">


                                               <asp:GridView ID="Gridservinfo" runat="server" AutoGenerateColumns="False" ShowFooter="true" 
                                                OnRowCancelingEdit="Gridservinfo_RowCancelingEdit1" GridLines="Both" OnRowDeleting="Gridservinfo_RowDeleting1" OnRowEditing="Gridservinfo_RowEditing1"
                                                OnRowUpdating="Gridservinfo_RowUpdating1" CssClass="table" Width="93%">

                                                <Columns>
                                                    <asp:TemplateField>
                                                        <HeaderTemplate>S.No</HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="LblSlnoup" runat="server" Text='<%#Container.DataItemIndex + 1%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center" Visible="false">
                                                        <HeaderTemplate>Slno</HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="LblSlno_serv" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Slno").ToString())%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>


                                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center">
                                                        <HeaderTemplate>Name of Service</HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="LblNm_Service" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Nm_Service").ToString())%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TxtNm_Serviceupdt" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Nm_Service").ToString())%>' class="form-control"></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <FooterTemplate>
                                                            <asp:TextBox ID="TxtNm_Serviceins" runat="server" class="form-control"></asp:TextBox>
                                                        </FooterTemplate>
                                                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField ItemStyle-HorizontalAlign="left" ItemStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center">
                                                        <HeaderTemplate>Service ID</HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="LblService_ID" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Service_ID").ToString())%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                           
                                                             <asp:TextBox ID="TxtService_IDupdt" runat="server" class="form-control" Text='<%# Server.HtmlEncode((string)Eval("Service_ID").ToString())%>'></asp:TextBox>
                                                                                                               
                                                        </EditItemTemplate>

                                                        <FooterTemplate>

                                                        <asp:TextBox ID="TxtService_IDins" runat="server" class="form-control"></asp:TextBox>
                                                         
                                                        </FooterTemplate>
                                                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField ItemStyle-HorizontalAlign="left" ItemStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center">
                                                        <HeaderTemplate>Video bit rate(Mbps)</HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="LblVideo_Brate" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Video_Brate").ToString())%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TxtVideo_Brateupdt" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Video_Brate").ToString())%>' class="form-control"></asp:TextBox>
                                                        </EditItemTemplate>

                                                        <FooterTemplate>
                                                            <asp:TextBox ID="TxtVideo_Brateins" runat="server" class="form-control"></asp:TextBox>
                                                        </FooterTemplate>
                                                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField ItemStyle-HorizontalAlign="center" ItemStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center">
                                                        <HeaderTemplate>Audio-1 bit rate(Kbps)</HeaderTemplate>
                                                        <ItemTemplate>
                                                           <asp:Label ID="LblAudio_1Brate" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Audio_1Brate").ToString())%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TxtAudio_1Brateupdt" Width="50%" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Audio_1Brate").ToString())%>' class="form-control"></asp:TextBox>
                                                        </EditItemTemplate>

                                                        <FooterTemplate>
                                                            <asp:TextBox ID="TxtAudio_1Brateins" runat="server" Width="50%" class="form-control"></asp:TextBox>                                                          
                                                        </FooterTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" Width="15%"></HeaderStyle>
                                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="15%"></ItemStyle>
                                                        <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="15%" />
                                                    </asp:TemplateField>

                                                     <asp:TemplateField ItemStyle-HorizontalAlign="center" ItemStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center">
                                                        <HeaderTemplate>Audio-2 bit rate(Kbps)</HeaderTemplate>
                                                        <ItemTemplate>
                                                           <asp:Label ID="LblAudio_2Brate" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Audio_2Brate").ToString())%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TxtAudio_2Brateupdt" Width="50%" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Audio_2Brate").ToString())%>' class="form-control"></asp:TextBox>
                                                        </EditItemTemplate>

                                                        <FooterTemplate>
                                                            <asp:TextBox ID="TxtAudio_2Brateins" runat="server" Width="50%" class="form-control"></asp:TextBox>                                                          
                                                        </FooterTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" Width="15%"></HeaderStyle>
                                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="15%"></ItemStyle>
                                                        <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="15%" />
                                                    </asp:TemplateField>

                                                     <asp:TemplateField ItemStyle-HorizontalAlign="center" ItemStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center">
                                                        <HeaderTemplate>Chroma Format</HeaderTemplate>
                                                        <ItemTemplate>
                                                           <asp:Label ID="LblChroma_Format" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Chroma_Format").ToString())%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TxtChroma_Formatupdt" Width="50%" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Chroma_Format").ToString())%>' class="form-control"></asp:TextBox>
                                                        </EditItemTemplate>

                                                        <FooterTemplate>
                                                            <asp:TextBox ID="TxtChroma_Formatins" runat="server" Width="50%" class="form-control"></asp:TextBox>                                                          
                                                        </FooterTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" Width="15%"></HeaderStyle>
                                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="15%"></ItemStyle>
                                                        <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="15%" />
                                                    </asp:TemplateField>

                                                    <asp:TemplateField ItemStyle-HorizontalAlign="center" ItemStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center">
                                                        <HeaderTemplate>Video PID</HeaderTemplate>
                                                        <ItemTemplate>
                                                           <asp:Label ID="LblVideo_PID" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Video_PID").ToString())%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TxtVideo_PIDupdt" Width="50%" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Video_PID").ToString())%>' class="form-control"></asp:TextBox>
                                                        </EditItemTemplate>

                                                        <FooterTemplate>
                                                            <asp:TextBox ID="TxtVideo_PIDins" runat="server" Width="50%" class="form-control"></asp:TextBox>                                                          
                                                        </FooterTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" Width="15%"></HeaderStyle>
                                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="15%"></ItemStyle>
                                                        <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="15%" />
                                                    </asp:TemplateField>

                                                     <asp:TemplateField ItemStyle-HorizontalAlign="left" ItemStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center">
                                                        <HeaderTemplate>Audio-1 PID</HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="LblAudio_1PID" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Audio_1PID").ToString())%>'></asp:Label>                      
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TxtAudio_1PIDupdt" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Audio_1PID").ToString())%>' class="form-control"></asp:TextBox>                                                            
                                                        </EditItemTemplate>

                                                        <FooterTemplate>
                                                            <asp:TextBox ID="TxtAudio_1PIDins" runat="server" class="form-control"></asp:TextBox>                                                           
                                                        </FooterTemplate>
                                                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField ItemStyle-HorizontalAlign="left" ItemStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center">
                                                        <HeaderTemplate>Audio-2 PID</HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="LblAudio_2PID" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Audio_2PID").ToString())%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TxtAudio_2PIDupdt" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Audio_2PID").ToString())%>' class="form-control"></asp:TextBox>
                                                        </EditItemTemplate>

                                                        <FooterTemplate>
                                                            <asp:TextBox ID="TxtAudio_2PIDins" runat="server" class="form-control"></asp:TextBox>
                                                        </FooterTemplate>
                                                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField ItemStyle-HorizontalAlign="left" ItemStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center">
                                                        <HeaderTemplate>PCR PID</HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="LblPCR_PID" runat="server" Text='<%# Server.HtmlEncode((string)Eval("PCR_PID").ToString())%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TxtPCR_PIDupdt" runat="server" Text='<%# Server.HtmlEncode((string)Eval("PCR_PID").ToString())%>' class="form-control"></asp:TextBox>
                                                        </EditItemTemplate>

                                                        <FooterTemplate>
                                                            <asp:TextBox ID="TxtPCR_PIDins" runat="server" class="form-control"></asp:TextBox>
                                                        </FooterTemplate>
                                                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField ItemStyle-HorizontalAlign="left" ItemStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center">
                                                        <HeaderTemplate>Scrambling_Type</HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="LblScrambling_Type" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Scrambling_Type").ToString())%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TxtScrambling_Typeupdt" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Scrambling_Type").ToString())%>' class="form-control"></asp:TextBox>
                                                        </EditItemTemplate>

                                                        <FooterTemplate>
                                                            <asp:TextBox ID="TxtScrambling_Typeins" runat="server" class="form-control"></asp:TextBox>
                                                        </FooterTemplate>
                                                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                                    </asp:TemplateField>
                                                   
                                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                                                        <HeaderTemplate>Operation</HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="Linkedit" runat="server" CommandName="edit" CausesValidation="false">Edit</asp:LinkButton>
                                                            /
                                                                    <asp:LinkButton ID="Linkdelete" runat="server" CommandName="delete" CausesValidation="false">Delete</asp:LinkButton>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:LinkButton ID="Linkupdate" runat="server" CommandName="update" CausesValidation="false">Update</asp:LinkButton>
                                                            /
                                                                    <asp:LinkButton ID="LinkButton4" runat="server" CommandName="cancel" CausesValidation="false">Cancel</asp:LinkButton>

                                                        </EditItemTemplate>
                                                        <FooterTemplate>
                                                            <asp:Button ID="Btnsaveinfo" runat="server" Text="Add" CausesValidation="false" OnClick="SaveRecordinfo"   CssClass="form-control" />
                                                        </FooterTemplate>



                                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                                    </asp:TemplateField>


                                                </Columns>

                                                <HeaderStyle BackColor="#337585" Font-Bold="True" ForeColor="white" HorizontalAlign="Center" VerticalAlign="Middle" Height="30px" />
                                                <PagerStyle ForeColor="#003399" HorizontalAlign="Center" CssClass="GridPager" Height="20px" />
                                                <RowStyle BackColor="White" ForeColor="#686868" Height="41px" />
                                                <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                                                <SortedAscendingCellStyle BackColor="#EDF6F6" />
                                                <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                                                <SortedDescendingCellStyle BackColor="#D6DFDF" />
                                                <SortedDescendingHeaderStyle BackColor="#002876" />


                                            </asp:GridView>


                                            </div>

                                        </div>
                                    </div>
                                </section>

                                </fieldset>
                           
                                  <fieldset class="well">
                                <legend class="well-legend">Special Feed for other agency</legend>

                                <section class="page_head" style="width: 100%;">
                                    <div class="container">

                                        <div class="row">

                                            <div class="row col-lg-12">


                                               <asp:GridView ID="Gridspecfeedsgency" runat="server" AutoGenerateColumns="False" ShowFooter="true" 
                                                OnRowCancelingEdit="Gridspecfeedsgency_RowCancelingEdit1" GridLines="Both" OnRowDeleting="Gridspecfeedsgency_RowDeleting1" OnRowEditing="Gridspecfeedsgency_RowEditing1"
                                                OnRowUpdating="Gridspecfeedsgency_RowUpdating1" CssClass="table" Width="93%">

                                                <Columns>
                                                    <asp:TemplateField>
                                                        <HeaderTemplate>S.No</HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="LblSlnoup" runat="server" Text='<%#Container.DataItemIndex + 1%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center" Visible="false">
                                                        <HeaderTemplate>Slno</HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="LblSlno_sfea" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Slno").ToString())%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>


                                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center">
                                                        <HeaderTemplate>Date</HeaderTemplate>
                                                        <ItemTemplate>
                                                              
                                                            <asp:Label ID="LblSpecialFeed_Dt" runat="server"  Text='<%# Eval("SpecialFeed_Dt", "{0:d}")%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TxtSpecialFeed_Dtupdt"  runat="server"  Width="130px"  Text='<%# Server.HtmlEncode((string)Eval("SpecialFeed_Dt").ToString())%>' class="form-control"></asp:TextBox>
                                                        
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtSpecialFeed_Dtupdt" runat="server" ControlToValidate="TxtSpecialFeed_Dtupdt" Display="None" ErrorMessage="Date!!"> </asp:RequiredFieldValidator>
                                                            <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtSpecialFeed_Dtupdt" runat="server" TargetControlID="RequiredFieldValidatorTxtSpecialFeed_Dtupdt">
                                                            </ajaxToolkit:ValidatorCalloutExtender>

                                                            <ajaxToolkit:CalendarExtender ID="CalenderTxtSpecialFeed_Dtupdt" TargetControlID="TxtSpecialFeed_Dtupdt" runat="server" PopupPosition="TopRight" Enabled="True" Format="dd/MM/yyyy"></ajaxToolkit:CalendarExtender>

                                                        
                                                        </EditItemTemplate>
                                                        <FooterTemplate>
                                                            <asp:TextBox ID="TxtSpecialFeed_Dtins" runat="server" Width="130px" class="form-control"></asp:TextBox>


                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtSpecialFeed_Dtins" runat="server" ControlToValidate="TxtSpecialFeed_Dtins" Display="None" ErrorMessage="Date!!"> </asp:RequiredFieldValidator>
                                                            <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtSpecialFeed_Dtins" runat="server" TargetControlID="RequiredFieldValidatorTxtSpecialFeed_Dtins">
                                                            </ajaxToolkit:ValidatorCalloutExtender>

                                                            <ajaxToolkit:CalendarExtender ID="CalenderTxtSpecialFeed_Dtins" TargetControlID="TxtSpecialFeed_Dtins" runat="server" PopupPosition="TopRight" Enabled="True" Format="dd/MM/yyyy"></ajaxToolkit:CalendarExtender>


                                                        </FooterTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" Width="20%"></HeaderStyle>
                                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"  Width="20%"></ItemStyle>
                                                         <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="20%" />
                                                    </asp:TemplateField>

                                                    <asp:TemplateField ItemStyle-HorizontalAlign="left" ItemStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center">
                                                        <HeaderTemplate>Agency Name</HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="LblNm_Agency" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Nm_Agency").ToString())%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                           
                                                             <asp:TextBox ID="TxtNm_Agencyupdt" runat="server"  Width="200px"  Text='<%# Server.HtmlEncode((string)Eval("Nm_Agency").ToString())%>' class="form-control"></asp:TextBox>
                                                                                                               
                                                        </EditItemTemplate>

                                                        <FooterTemplate>

                                                        <asp:TextBox ID="TxtNm_Agencyins" runat="server"  Width="200px" class="form-control" ></asp:TextBox>
                                                         
                                                        </FooterTemplate>
                                                        <HeaderStyle HorizontalAlign="Left" Width="30%" ></HeaderStyle>
                                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" Width="40%" ></ItemStyle>
                                                         <FooterStyle HorizontalAlign="Left" VerticalAlign="Middle" Width="40%" />
                                                    </asp:TemplateField>

                                                    <asp:TemplateField ItemStyle-HorizontalAlign="left" ItemStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center">
                                                        <HeaderTemplate>Duration(Hr/Min)</HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="LblDuration_Hr" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Duration_Hr").ToString())%>'></asp:Label>Hr.
                                                            <asp:Label ID="LblDuration_Min" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Duration_Min").ToString())%>'></asp:Label>Min.
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TxtDuration_Hrupdt" runat="server" Width="30px" Text='<%# Server.HtmlEncode((string)Eval("Duration_Hr").ToString())%>' class="form-control"></asp:TextBox>Hr.
                                                             <asp:TextBox ID="TxtDuration_Min" runat="server" Width="30px" Text='<%# Server.HtmlEncode((string)Eval("Duration_Min").ToString())%>' class="form-control"></asp:TextBox>Min.
                                                        </EditItemTemplate>

                                                        <FooterTemplate>
                                                            <asp:TextBox ID="TxtDuration_Hrins" runat="server" Width="30px" ></asp:TextBox>Hr.
                                                             <asp:TextBox ID="TxtDuration_Minins" runat="server" Width="30px" ></asp:TextBox>Min.

                                                        </FooterTemplate>
                                                        <HeaderStyle HorizontalAlign="Left" Width="30%"></HeaderStyle>
                                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" Width="30%"></ItemStyle>
                                                         <FooterStyle HorizontalAlign="Left" VerticalAlign="Middle" Width="30%" />
                                                    </asp:TemplateField>

                                                    <asp:TemplateField ItemStyle-HorizontalAlign="center" ItemStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center">
                                                        <HeaderTemplate>Remarks</HeaderTemplate>
                                                        <ItemTemplate>
                                                           <asp:Label ID="LblRemarks" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Remarks").ToString())%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TxtRemarksupdt" Width="20%" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Remarks").ToString())%>' class="form-control"></asp:TextBox>
                                                        </EditItemTemplate>

                                                        <FooterTemplate>
                                                            <asp:TextBox ID="TxtRemarksins" runat="server" Width="200px" TextMode="MultiLine" class="form-control"></asp:TextBox>                                                          
                                                        </FooterTemplate>
                                                        <HeaderStyle HorizontalAlign="left" Width="20%"></HeaderStyle>
                                                        <ItemStyle HorizontalAlign="left" VerticalAlign="Middle" Width="20%"></ItemStyle>
                                                        <FooterStyle HorizontalAlign="left" VerticalAlign="Middle" Width="20%" />
                                                    </asp:TemplateField>

                                                     
                                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                                                        <HeaderTemplate>Operation</HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="Linkedit" runat="server" CommandName="edit" CausesValidation="false">Edit</asp:LinkButton>
                                                            /
                                                                    <asp:LinkButton ID="Linkdelete" runat="server" CommandName="delete" CausesValidation="false">Delete</asp:LinkButton>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:LinkButton ID="Linkupdate" runat="server" CommandName="update" CausesValidation="false">Update</asp:LinkButton>
                                                            /
                                                                    <asp:LinkButton ID="LinkButton4" runat="server" CommandName="cancel" CausesValidation="false">Cancel</asp:LinkButton>

                                                        </EditItemTemplate>
                                                        <FooterTemplate>
                                                            <asp:Button ID="BtnSaveRecordspefeed" runat="server" Text="Add" CausesValidation="false" OnClick="SaveRecordspefeed"  CssClass="form-control" />
                                                        </FooterTemplate>



                                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                                    </asp:TemplateField>


                                                </Columns>

                                                <HeaderStyle BackColor="#337585" Font-Bold="True" ForeColor="white" HorizontalAlign="Center" VerticalAlign="Middle" Height="30px" />
                                                <PagerStyle ForeColor="#003399" HorizontalAlign="Center" CssClass="GridPager" Height="20px" />
                                                <RowStyle BackColor="White" ForeColor="#686868" Height="41px" />
                                                <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                                                <SortedAscendingCellStyle BackColor="#EDF6F6" />
                                                <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                                                <SortedDescendingCellStyle BackColor="#D6DFDF" />
                                                <SortedDescendingHeaderStyle BackColor="#002876" />


                                            </asp:GridView>


                                            </div>

                                        </div>
                                    </div>
                                </section>

                                </fieldset>

                                  <fieldset class="well">
                                <legend class="well-legend">Program Hours for the Current Month and its Progressive</legend>

                                <section class="page_head" style="width: 100%;">
                                    <div class="container">

                                        <div class="row">

                                            <div class="row col-lg-12">


                                                <%--div class="col-lg-1 ">
                                                    <h4>DSNG Used</h4>
                                                </div>


                                                <div class="col-lg-3">

                                                    <asp:TextBox ID="Txtdsngused" runat="server" CssClass="form-control"></asp:TextBox>

                                                </div>--%>


                                                <div class="col-lg-2 ">
                                                    <h4>Test Hours(Current Month)</h4>
                                                </div>


                                                <div class="col-lg-3">

                                                    <asp:TextBox ID="TxtTest_Hr_Current" runat="server" MaxLength="6" AutoPostBack="true" Width="20%" OnTextChanged="TxtTest_Hr_Current_TextChanged" ></asp:TextBox>Hrs.
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtTest_Hr_Current" runat="server" ControlToValidate="TxtTest_Hr_Current" ErrorMessage="Enter Test Hr." Display="None"> </asp:RequiredFieldValidator>
                                                    <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtTest_Hr_Current" runat="server" TargetControlID="RequiredFieldValidatorTxtTest_Hr_Current"></ajaxToolkit:ValidatorCalloutExtender>
                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtTest_Hr_Current" runat="server" TargetControlID="TxtTest_Hr_Current" ValidChars="0123456789"></ajaxToolkit:FilteredTextBoxExtender>


                                                    <asp:TextBox ID="TxtTest_Min_Current" runat="server" MaxLength="6" AutoPostBack="true" Width="20%" OnTextChanged="TxtTest_Min_Current_TextChanged" ></asp:TextBox>Min.
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtTest_Min_Current" runat="server" ControlToValidate="TxtTest_Min_Current" ErrorMessage="Enter Test Min." Display="None"> </asp:RequiredFieldValidator>
                                                    <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtTest_Min_Current" runat="server" TargetControlID="RequiredFieldValidatorTxtTest_Min_Current"></ajaxToolkit:ValidatorCalloutExtender>
                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtTest_Min_Current" runat="server" TargetControlID="TxtTest_Min_Current" ValidChars="0123456789"></ajaxToolkit:FilteredTextBoxExtender>
                                                    <asp:RangeValidator ID="RangeValidatorTxtTest_Min_Current" runat="server" ControlToValidate="TxtTest_Min_Current" MinimumValue="0" MaximumValue="60" ErrorMessage="Min in range 0 to 60" Text="range 0 to 60" ForeColor="Red" Display="Dynamic"></asp:RangeValidator>


                                                </div>

                                                <div class="col-lg-2 ">
                                                    <h4>Test Hours(Progressive)</h4>
                                                </div>


                                                <div class="col-lg-3">

                                                    <asp:TextBox ID="TxtTest_Hr_Progressive" runat="server" MaxLength="6" Width="20%"></asp:TextBox>Hrs.
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtTest_Hr_Progressive" runat="server" ControlToValidate="TxtTest_Hr_Progressive" ErrorMessage="Enter Test Hr. Prog" Display="None"> </asp:RequiredFieldValidator>
                                                    <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtTest_Hr_Progressive" runat="server" TargetControlID="RequiredFieldValidatorTxtTest_Hr_Progressive"></ajaxToolkit:ValidatorCalloutExtender>
                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtTest_Hr_Progressive" runat="server" TargetControlID="TxtTest_Hr_Progressive" ValidChars="0123456789"></ajaxToolkit:FilteredTextBoxExtender>


                                                    <asp:TextBox ID="TxtTest_Min_Progressive" runat="server" MaxLength="6" Width="20%"></asp:TextBox>Min.
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtTest_Min_Progressive" runat="server" ControlToValidate="TxtTest_Min_Progressive" ErrorMessage="Enter Test Min. Prog" Display="None"> </asp:RequiredFieldValidator>
                                                    <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtTest_Min_Progressive" runat="server" TargetControlID="RequiredFieldValidatorTxtTest_Min_Progressive"></ajaxToolkit:ValidatorCalloutExtender>
                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtTest_Min_Progressive" runat="server" TargetControlID="TxtTest_Min_Progressive" ValidChars="0123456789"></ajaxToolkit:FilteredTextBoxExtender>
                                                    <asp:RangeValidator ID="RangeValidatorTxtTest_Min_Progressive" runat="server" ControlToValidate="TxtTest_Min_Progressive" MinimumValue="0" MaximumValue="60" ErrorMessage="Min in range 0 to 60" Text="range 0 to 60" ForeColor="Red" Display="Dynamic"></asp:RangeValidator>




                                                </div>


                                            </div>

                                        </div>
                                    </div>
                                </section>

                                <section class="page_head" style="width: 100%;">
                                    <div class="container">

                                        <div class="row">

                                            <div class="row col-lg-12">





                                                <div class="col-lg-2 ">
                                                    <h4>Radiated Prog. Hrs.(Current Month)</h4>
                                                </div>


                                                <div class="col-lg-3">

                                                    <asp:TextBox ID="TxtRadiatedProg_Hr_Current" runat="server" MaxLength="6" AutoPostBack="true" Width="20%" OnTextChanged="TxtRadiatedProg_Hr_Current_TextChanged" ></asp:TextBox>Hrs.
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtRadiatedProg_Hr_Current" runat="server" ControlToValidate="TxtRadiatedProg_Hr_Current" ErrorMessage="Radiated Prog. Hrs. (Current)" Display="None"> </asp:RequiredFieldValidator>
                                                    <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtRadiatedProg_Hr_Current" runat="server" TargetControlID="RequiredFieldValidatorTxtRadiatedProg_Hr_Current"></ajaxToolkit:ValidatorCalloutExtender>
                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtRadiatedProg_Hr_Current" runat="server" TargetControlID="TxtRadiatedProg_Hr_Current" ValidChars="0123456789"></ajaxToolkit:FilteredTextBoxExtender>


                                                    <asp:TextBox ID="TxtRadiatedProg_Min_Current" runat="server" MaxLength="6" AutoPostBack="true" Width="20%" OnTextChanged="TxtRadiatedProg_Min_Current_TextChanged" ></asp:TextBox>Min.
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtRadiatedProg_Min_Current" runat="server" ControlToValidate="TxtRadiatedProg_Min_Current" ErrorMessage="Radiated Prog. Min. (Current)" Display="None"> </asp:RequiredFieldValidator>
                                                    <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtRadiatedProg_Min_Current" runat="server" TargetControlID="RequiredFieldValidatorTxtRadiatedProg_Min_Current"></ajaxToolkit:ValidatorCalloutExtender>
                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtRadiatedProg_Min_Current" runat="server" TargetControlID="TxtRadiatedProg_Min_Current" ValidChars="0123456789"></ajaxToolkit:FilteredTextBoxExtender>
                                                    <asp:RangeValidator ID="RangeValidatorTxtRadiatedProg_Min_Current" runat="server" ControlToValidate="TxtRadiatedProg_Min_Current" MinimumValue="0" MaximumValue="60" ErrorMessage="Min in range 0 to 60" Text="range 0 to 60" ForeColor="Red" Display="Dynamic"></asp:RangeValidator>


                                                </div>

                                                <div class="col-lg-2 ">
                                                    <h4>Radiated Prog. Hrs.(Progressive)</h4>
                                                </div>


                                                <div class="col-lg-3">


                                                    <asp:TextBox ID="TxtRadiatedProg_Hr_Progressive" runat="server" MaxLength="6" AutoPostBack="true" Width="20%" OnTextChanged="TxtRadiatedProg_Hr_Progressive_TextChanged"></asp:TextBox>Hrs.
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtRadiatedProg_Hr_Progressive" runat="server" ControlToValidate="TxtRadiatedProg_Hr_Progressive" ErrorMessage="Radiated Prog. Hrs.(Progressive)" Display="None"> </asp:RequiredFieldValidator>
                                                    <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtRadiatedProg_Hr_Progressive" runat="server" TargetControlID="RequiredFieldValidatorTxtRadiatedProg_Hr_Progressive"></ajaxToolkit:ValidatorCalloutExtender>
                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtRadiatedProg_Hr_Progressive" runat="server" TargetControlID="TxtRadiatedProg_Hr_Progressive" ValidChars="0123456789"></ajaxToolkit:FilteredTextBoxExtender>


                                                    <asp:TextBox ID="TxtRadiatedProg_Min_Progressive" runat="server" MaxLength="6" AutoPostBack="true" Width="20%" OnTextChanged="TxtRadiatedProg_Min_Progressive_TextChanged"></asp:TextBox>Min.
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtRadiatedProg_Min_Progressive" runat="server" ControlToValidate="TxtRadiatedProg_Min_Progressive" ErrorMessage="Radiated Prog. Min.(Progressive)" Display="None"></asp:RequiredFieldValidator>
                                                    <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtRadiatedProg_Min_Progressive" runat="server" TargetControlID="RequiredFieldValidatorTxtRadiatedProg_Min_Progressive"></ajaxToolkit:ValidatorCalloutExtender>
                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtRadiatedProg_Min_Progressive" runat="server" TargetControlID="TxtRadiatedProg_Min_Progressive" ValidChars="0123456789"></ajaxToolkit:FilteredTextBoxExtender>
                                                    <asp:RangeValidator ID="RangeValidatorTxtRadiatedProg_Min_Progressive" runat="server" ControlToValidate="TxtRadiatedProg_Min_Progressive" MinimumValue="0" MaximumValue="60" ErrorMessage="Min in range 0 to 60" Text="range 0 to 60" ForeColor="Red" Display="Dynamic"></asp:RangeValidator>


                                                </div>



                                            </div>

                                        </div>
                                    </div>
                                </section>

                                <section class="page_head" style="width: 100%;">
                                    <div class="container">

                                        <div class="row">

                                            <div class="row col-lg-12">





                                                <div class="col-lg-2 ">
                                                    <h4>Total Hr.(Current Month)</h4>
                                                </div>


                                                <div class="col-lg-3">

                                                    <asp:TextBox ID="TxtTotal_Hr_Current" runat="server" MaxLength="6" Enabled="false" Width="20%" ></asp:TextBox>Hrs.
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtTotal_Hr_Current" runat="server" ControlToValidate="TxtTotal_Hr_Current" ErrorMessage="Total Hr. Current Month" Display="None"> </asp:RequiredFieldValidator>
                                                    <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtTotal_Hr_Current" runat="server" TargetControlID="RequiredFieldValidatorTxtTotal_Hr_Current"></ajaxToolkit:ValidatorCalloutExtender>
                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtTotal_Hr_Current" runat="server" TargetControlID="TxtTotal_Hr_Current" ValidChars="0123456789"></ajaxToolkit:FilteredTextBoxExtender>


                                                    <asp:TextBox ID="TxtTotal_Min_Current" runat="server" MaxLength="6" Enabled="false"  Width="20%" ></asp:TextBox>Min.
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtTotal_Min_Current" runat="server" ControlToValidate="TxtTotal_Min_Current" ErrorMessage="Total Min. Current Month" Display="None"> </asp:RequiredFieldValidator>
                                                    <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtTotal_Min_Current" runat="server" TargetControlID="RequiredFieldValidatorTxtTotal_Min_Current"></ajaxToolkit:ValidatorCalloutExtender>
                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtTotal_Min_Current" runat="server" TargetControlID="TxtTotal_Min_Current" ValidChars="0123456789"></ajaxToolkit:FilteredTextBoxExtender>
                                                    <asp:RangeValidator ID="RangeValidatorTxtTotal_Min_Current" runat="server" ControlToValidate="TxtTotal_Min_Current" MinimumValue="0" MaximumValue="60" ErrorMessage="Min in range 0 to 60" Text="range 0 to 60" ForeColor="Red" Display="Dynamic"></asp:RangeValidator>


                                                </div>


                                                <div class="col-lg-2 ">
                                                    <h4>Total Hr.(Progressive)</h4>
                                                </div>


                                                <div class="col-lg-3">

                                                    <asp:TextBox ID="TxtTotal_Hr_Progrresive" runat="server" MaxLength="6" Enabled="false" Width="20%"></asp:TextBox>Hrs.
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtTotal_Hr_Progrresive" runat="server" ControlToValidate="TxtTotal_Hr_Progrresive" ErrorMessage="Total Hrs. (Progressive)" Display="None"> </asp:RequiredFieldValidator>
                                                    <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtTotal_Hr_Progrresive" runat="server" TargetControlID="RequiredFieldValidatorTxtTotal_Hr_Progrresive"></ajaxToolkit:ValidatorCalloutExtender>
                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtTotal_Hr_Progrresive" runat="server" TargetControlID="TxtTotal_Hr_Progrresive" ValidChars="0123456789"></ajaxToolkit:FilteredTextBoxExtender>


                                                    <asp:TextBox ID="TxtTotal_Min_Progressive" runat="server" MaxLength="6" Enabled="false" Width="20%" ></asp:TextBox>Min.
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtTotal_Min_Progressive" runat="server" ControlToValidate="TxtTotal_Min_Progressive" ErrorMessage="Total Min. (Progressive)" Display="None"> </asp:RequiredFieldValidator>
                                                    <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtTotal_Min_Progressive" runat="server" TargetControlID="RequiredFieldValidatorTxtTotal_Min_Progressive"></ajaxToolkit:ValidatorCalloutExtender>
                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtTotal_Min_Progressive" runat="server" TargetControlID="TxtTotal_Min_Progressive" ValidChars="0123456789"></ajaxToolkit:FilteredTextBoxExtender>
                                                    <asp:RangeValidator ID="RangeValidatorTxtTotal_Min_Progressive" runat="server" ControlToValidate="TxtTotal_Min_Progressive" MinimumValue="0" MaximumValue="60" ErrorMessage="Min in range 0 to 60" Text="range 0 to 60" ForeColor="Red" Display="Dynamic"></asp:RangeValidator>


                                                </div>



                                            </div>

                                        </div>
                                    </div>
                                </section>

                               <%-- <section class="page_head" style="width: 100%;">
                                    <div class="container">

                                        <div class="row">

                                            <div class="row col-lg-12">

                                                <div class="col-lg-2 ">
                                                    <h4>Yearly Test Hr. Progressive</h4>
                                                </div>


                                                <div class="col-lg-3">

                                                    <asp:TextBox ID="TxtYearlytest_Hr_Progressive" runat="server" MaxLength="6" AutoPostBack="true" Width="20%" ></asp:TextBox>Hrs.
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtYearlytest_Hr_Progressive" runat="server" ControlToValidate="TxtYearlytest_Hr_Progressive" ErrorMessage="Yearly Test Hr. Progressive" Display="None"> </asp:RequiredFieldValidator>
                                                    <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtYearlytest_Hr_Progressive" runat="server" TargetControlID="RequiredFieldValidatorTxtYearlytest_Hr_Progressive"></ajaxToolkit:ValidatorCalloutExtender>
                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtYearlytest_Hr_Progressive" runat="server" TargetControlID="TxtYearlytest_Hr_Progressive" ValidChars="0123456789"></ajaxToolkit:FilteredTextBoxExtender>


                                                    <asp:TextBox ID="TxtYearlytest_Min_Progressive" runat="server" MaxLength="6" AutoPostBack="true" Width="20%" ></asp:TextBox>Min.
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtYearlytest_Min_Progressive" runat="server" ControlToValidate="TxtYearlytest_Min_Progressive" ErrorMessage="Yearly Test Min. Progressive" Display="None"> </asp:RequiredFieldValidator>
                                                    <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtYearlytest_Min_Progressive" runat="server" TargetControlID="RequiredFieldValidatorTxtYearlytest_Min_Progressive"></ajaxToolkit:ValidatorCalloutExtender>
                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtYearlytest_Min_Progressive" runat="server" TargetControlID="TxtYearlytest_Min_Progressive" ValidChars="0123456789"></ajaxToolkit:FilteredTextBoxExtender>
                                                    <asp:RangeValidator ID="RangeValidatorTxtYearlytest_Min_Progressive" runat="server" ControlToValidate="TxtYearlytest_Min_Progressive" MinimumValue="0" MaximumValue="60" ErrorMessage="Min in range 0 to 60" Text="range 0 to 60" ForeColor="Red" Display="Dynamic"></asp:RangeValidator>


                                                </div>


                                                <div class="col-lg-2 ">
                                                    <h4>Yearly Radiated Prog. Hr. Progressive</h4>
                                                </div>


                                                <div class="col-lg-3">

                                                    <asp:TextBox ID="TxtYearlyRadiatedProg_Hr_Progressive" runat="server" MaxLength="6" AutoPostBack="true" Width="20%"></asp:TextBox>Hrs.
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtYearlyRadiatedProg_Hr_Progressive" runat="server" ControlToValidate="TxtYearlyRadiatedProg_Hr_Progressive" ErrorMessage="Yearly Radiated Prog. Hr. Progressive" Display="None"> </asp:RequiredFieldValidator>
                                                    <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtYearlyRadiatedProg_Hr_Progressive" runat="server" TargetControlID="RequiredFieldValidatorTxtYearlyRadiatedProg_Hr_Progressive"></ajaxToolkit:ValidatorCalloutExtender>
                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtYearlyRadiatedProg_Hr_Progressive" runat="server" TargetControlID="TxtYearlyRadiatedProg_Hr_Progressive" ValidChars="0123456789"></ajaxToolkit:FilteredTextBoxExtender>


                                                    <asp:TextBox ID="TxtYearlyRadiatedProg_Min_Progressive" runat="server" MaxLength="6" AutoPostBack="true" Width="20%" ></asp:TextBox>Min.
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtYearlyRadiatedProg_Min_Progressive" runat="server" ControlToValidate="TxtYearlyRadiatedProg_Min_Progressive" ErrorMessage="Yearly Radiated Prog. Min. Progressive" Display="None"> </asp:RequiredFieldValidator>
                                                    <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtYearlyRadiatedProg_Min_Progressive" runat="server" TargetControlID="RequiredFieldValidatorTxtYearlyRadiatedProg_Min_Progressive"></ajaxToolkit:ValidatorCalloutExtender>
                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtYearlyRadiatedProg_Min_Progressive" runat="server" TargetControlID="TxtYearlyRadiatedProg_Min_Progressive" ValidChars="0123456789"></ajaxToolkit:FilteredTextBoxExtender>
                                                    <asp:RangeValidator ID="RangeValidatorTxtYearlyRadiatedProg_Min_Progressive" runat="server" ControlToValidate="TxtYearlyRadiatedProg_Min_Progressive" MinimumValue="0" MaximumValue="60" ErrorMessage="Min in range 0 to 60" Text="range 0 to 60" ForeColor="Red" Display="Dynamic"></asp:RangeValidator>


                                                </div>



                                            </div>

                                        </div>
                                    </div>
                                </section>--%>

                                <section class="page_head" style="width: 100%;">
                                    <div class="container">

                                        <div class="row">

                                            <div class="row col-lg-12">

                                                 <div class="col-lg-2 ">
                                                    <h4>Since Test Hr. Progressive</h4>
                                                </div>


                                                <div class="col-lg-3">

                                                    <asp:TextBox ID="TxtSincetest_Hr_Progressive" runat="server" MaxLength="6"  Width="20%" ></asp:TextBox>Hrs.
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtSincetest_Hr_Progressive" runat="server" ControlToValidate="TxtSincetest_Hr_Progressive" ErrorMessage="Since Test Hr. Progressive" Display="None"> </asp:RequiredFieldValidator>
                                                    <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtSincetest_Hr_Progressive" runat="server" TargetControlID="RequiredFieldValidatorTxtSincetest_Hr_Progressive"></ajaxToolkit:ValidatorCalloutExtender>
                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtSincetest_Hr_Progressive" runat="server" TargetControlID="TxtSincetest_Hr_Progressive" ValidChars="0123456789"></ajaxToolkit:FilteredTextBoxExtender>


                                                    <asp:TextBox ID="TxtSincetest_Min_Progressive" runat="server" MaxLength="6" AutoPostBack="true" Width="20%" ></asp:TextBox>Min.
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtSincetest_Min_Progressive" runat="server" ControlToValidate="TxtSincetest_Min_Progressive" ErrorMessage="Since Test Min. Progressive" Display="None"> </asp:RequiredFieldValidator>
                                                    <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtSincetest_Min_Progressive" runat="server" TargetControlID="RequiredFieldValidatorTxtSincetest_Min_Progressive"></ajaxToolkit:ValidatorCalloutExtender>
                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtSincetest_Min_Progressive" runat="server" TargetControlID="TxtSincetest_Min_Progressive" ValidChars="0123456789"></ajaxToolkit:FilteredTextBoxExtender>
                                                    <asp:RangeValidator ID="RangeValidatorTxtSincetest_Min_Progressive" runat="server" ControlToValidate="TxtSincetest_Min_Progressive" MinimumValue="0" MaximumValue="60" ErrorMessage="Min in range 0 to 60" Text="range 0 to 60" ForeColor="Red" Display="Dynamic"></asp:RangeValidator>


                                                </div>


                                                 <div class="col-lg-2 ">
                                                    <h4>Since Radiated Prog. Hr. Progressive</h4>
                                                </div>


                                                <div class="col-lg-3">

                                                    <asp:TextBox ID="TxtSinceRadiatedProg_Hr_Progressive" runat="server" MaxLength="6" AutoPostBack="true" Width="20%" OnTextChanged="TxtSinceRadiatedProg_Hr_Progressive_TextChanged" ></asp:TextBox>Hrs.
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtSinceRadiatedProg_Hr_Progressive" runat="server" ControlToValidate="TxtSinceRadiatedProg_Hr_Progressive" ErrorMessage="Since Radiated Prog. Hr. Progressive" Display="None"> </asp:RequiredFieldValidator>
                                                    <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtSinceRadiatedProg_Hr_Progressive" runat="server" TargetControlID="RequiredFieldValidatorTxtSinceRadiatedProg_Hr_Progressive"></ajaxToolkit:ValidatorCalloutExtender>
                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtSinceRadiatedProg_Hr_Progressive" runat="server" TargetControlID="TxtSinceRadiatedProg_Hr_Progressive" ValidChars="0123456789"></ajaxToolkit:FilteredTextBoxExtender>


                                                    <asp:TextBox ID="TxtSinceRadiatedProg_Min_Progressive" runat="server" MaxLength="6" AutoPostBack="true" Width="20%" OnTextChanged="TxtSinceRadiatedProg_Min_Progressive_TextChanged" ></asp:TextBox>Min.
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtSinceRadiatedProg_Min_Progressive" runat="server" ControlToValidate="TxtSinceRadiatedProg_Min_Progressive" ErrorMessage="Since Radiated Prog. Min. Progressive" Display="None"> </asp:RequiredFieldValidator>
                                                    <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtSinceRadiatedProg_Min_Progressive" runat="server" TargetControlID="RequiredFieldValidatorTxtSinceRadiatedProg_Min_Progressive"></ajaxToolkit:ValidatorCalloutExtender>
                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtSinceRadiatedProg_Min_Progressive" runat="server" TargetControlID="TxtSinceRadiatedProg_Min_Progressive" ValidChars="0123456789"></ajaxToolkit:FilteredTextBoxExtender>
                                                    <asp:RangeValidator ID="RangeValidatorTxtSinceRadiatedProg_Min_Progressive" runat="server" ControlToValidate="TxtSinceRadiatedProg_Min_Progressive" MinimumValue="0" MaximumValue="60" ErrorMessage="Min in range 0 to 60" Text="range 0 to 60" ForeColor="Red" Display="Dynamic"></asp:RangeValidator>


                                                </div>


                                               



                                            </div>

                                        </div>
                                    </div>
                                </section>

                                <section class="page_head" style="width: 100%;">
                                    <div class="container">

                                        <div class="row">

                                            <div class="row col-lg-12">

                                               

                                                <div class="col-lg-2 ">
                                                    <h4>Since Total Hr. Progressive</h4>
                                                </div>


                                                <div class="col-lg-3">

                                                    <asp:TextBox ID="TxtSinceTotal_Hr_Progressive" runat="server" MaxLength="6" Enabled="false" Width="20%"></asp:TextBox>Hrs.
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtSinceTotal_Hr_Progressive" runat="server" ControlToValidate="TxtSinceTotal_Hr_Progressive" ErrorMessage="Since Total Hr. Progressive" Display="None"> </asp:RequiredFieldValidator>
                                                    <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtSinceTotal_Hr_Progressive" runat="server" TargetControlID="RequiredFieldValidatorTxtSinceTotal_Hr_Progressive"></ajaxToolkit:ValidatorCalloutExtender>
                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtSinceTotal_Hr_Progressive" runat="server" TargetControlID="TxtSinceTotal_Hr_Progressive" ValidChars="0123456789"></ajaxToolkit:FilteredTextBoxExtender>


                                                    <asp:TextBox ID="TxtSinceTotal_Min_Progressive" runat="server" MaxLength="6" Enabled="false"  Width="20%" ></asp:TextBox>Min.
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtSinceTotal_Min_Progressive" runat="server" ControlToValidate="TxtSinceTotal_Min_Progressive" ErrorMessage="Since Total Min. Progressive" Display="None"> </asp:RequiredFieldValidator>
                                                    <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtSinceTotal_Min_Progressive" runat="server" TargetControlID="RequiredFieldValidatorTxtSinceTotal_Min_Progressive"></ajaxToolkit:ValidatorCalloutExtender>
                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtSinceTotal_Min_Progressive" runat="server" TargetControlID="TxtSinceTotal_Min_Progressive" ValidChars="0123456789"></ajaxToolkit:FilteredTextBoxExtender>
                                                    <asp:RangeValidator ID="RangeValidatorTxtSinceTotal_Min_Progressive" runat="server" ControlToValidate="TxtSinceTotal_Min_Progressive" MinimumValue="0" MaximumValue="60" ErrorMessage="Min in range 0 to 60" Text="range 0 to 60" ForeColor="Red" Display="Dynamic"></asp:RangeValidator>


                                                </div>



                                            </div>

                                        </div>
                                    </div>
                                </section>





                                <fieldset class="well">
                                <legend class="well-legend">Break Down Hours</legend>



                                <section class="page_head" style="width: 100%;">
                                    <div class="container">

                                        <div class="row">

                                            <div class="row col-lg-12">

                                                <div class="col-lg-2 ">
                                                    <h4>Power Hrs.(Current Month)</h4>
                                                </div>


                                                <div class="col-lg-3">

                                                    <asp:TextBox ID="TxtBDPwr_Hr_Current" runat="server" MaxLength="6" AutoPostBack="true" Width="20%" OnTextChanged="TxtBDPwr_Hr_Current_TextChanged" ></asp:TextBox>Hrs.
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtBDPwr_Hr_Current" runat="server" ControlToValidate="TxtBDPwr_Hr_Current" ErrorMessage="Power Hrs.(Current Month)" Display="None"> </asp:RequiredFieldValidator>
                                                    <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtBDPwr_Hr_Current" runat="server" TargetControlID="RequiredFieldValidatorTxtBDPwr_Hr_Current"></ajaxToolkit:ValidatorCalloutExtender>
                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtBDPwr_Hr_Current" runat="server" TargetControlID="TxtBDPwr_Hr_Current" ValidChars="0123456789"></ajaxToolkit:FilteredTextBoxExtender>


                                                    <asp:TextBox ID="TxtBDPwr_Min_Current" runat="server" MaxLength="6" AutoPostBack="true" Width="20%" OnTextChanged="TxtBDPwr_Min_Current_TextChanged" ></asp:TextBox>Min.
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtBDPwr_Min_Current" runat="server" ControlToValidate="TxtBDPwr_Min_Current" ErrorMessage="Power Min.(Current Month)" Display="None"> </asp:RequiredFieldValidator>
                                                    <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtBDPwr_Min_Current" runat="server" TargetControlID="RequiredFieldValidatorTxtBDPwr_Min_Current"></ajaxToolkit:ValidatorCalloutExtender>
                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtBDPwr_Min_Current" runat="server" TargetControlID="TxtBDPwr_Min_Current" ValidChars="0123456789"></ajaxToolkit:FilteredTextBoxExtender>
                                                    <asp:RangeValidator ID="RangeValidatorTxtBDPwr_Min_Current" runat="server" ControlToValidate="TxtBDPwr_Min_Current" MinimumValue="0" MaximumValue="60" ErrorMessage="Min in range 0 to 60" Text="range 0 to 60" ForeColor="Red" Display="Dynamic"></asp:RangeValidator>


                                                </div>


                                                <div class="col-lg-2 ">
                                                    <h4>Power Hrs. Progressive</h4>
                                                </div>


                                                <div class="col-lg-3">

                                                    <asp:TextBox ID="TxtBDPwr_Hr_Progressive" runat="server" MaxLength="6" AutoPostBack="true" Width="20%"></asp:TextBox>Hrs.
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtBDPwr_Hr_Progressive" runat="server" ControlToValidate="TxtBDPwr_Hr_Progressive" ErrorMessage="Power Hr. Progressive" Display="None"> </asp:RequiredFieldValidator>
                                                    <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtBDPwr_Hr_Progressive" runat="server" TargetControlID="RequiredFieldValidatorTxtBDPwr_Hr_Progressive"></ajaxToolkit:ValidatorCalloutExtender>
                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtBDPwr_Hr_Progressive" runat="server" TargetControlID="TxtBDPwr_Hr_Progressive" ValidChars="0123456789"></ajaxToolkit:FilteredTextBoxExtender>


                                                    <asp:TextBox ID="TxtBDPwr_Min_Progressive" runat="server" MaxLength="6" AutoPostBack="true" Width="20%" ></asp:TextBox>Min.
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtBDPwr_Min_Progressive" runat="server" ControlToValidate="TxtBDPwr_Min_Progressive" ErrorMessage="Power Min. Progressive" Display="None"> </asp:RequiredFieldValidator>
                                                    <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtBDPwr_Min_Progressive" runat="server" TargetControlID="RequiredFieldValidatorTxtBDPwr_Min_Progressive"></ajaxToolkit:ValidatorCalloutExtender>
                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtBDPwr_Min_Progressive" runat="server" TargetControlID="TxtBDPwr_Min_Progressive" ValidChars="0123456789"></ajaxToolkit:FilteredTextBoxExtender>
                                                    <asp:RangeValidator ID="RangeValidatorTxtBDPwr_Min_Progressive" runat="server" ControlToValidate="TxtBDPwr_Min_Progressive" MinimumValue="0" MaximumValue="60" ErrorMessage="Min in range 0 to 60" Text="range 0 to 60" ForeColor="Red" Display="Dynamic"></asp:RangeValidator>


                                                </div>



                                            </div>

                                        </div>
                                    </div>
                                </section>



                                    <section class="page_head" style="width: 100%;">
                                    <div class="container">

                                        <div class="row">

                                            <div class="row col-lg-12">

                                                <div class="col-lg-2 ">
                                                    <h4>Gear Hrs.(Current Month)</h4>
                                                </div>


                                                <div class="col-lg-3">

                                                    <asp:TextBox ID="TxtBDGear_Hr_Current" runat="server" MaxLength="6" AutoPostBack="true" Width="20%" OnTextChanged="TxtBDGear_Hr_Current_TextChanged" ></asp:TextBox>Hrs.
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtBDGear_Hr_Current" runat="server" ControlToValidate="TxtBDGear_Hr_Current" ErrorMessage="Gear Hrs.(Current Month)" Display="None"> </asp:RequiredFieldValidator>
                                                    <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtBDGear_Hr_Current" runat="server" TargetControlID="RequiredFieldValidatorTxtBDGear_Hr_Current"></ajaxToolkit:ValidatorCalloutExtender>
                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtBDGear_Hr_Current" runat="server" TargetControlID="TxtBDGear_Hr_Current" ValidChars="0123456789"></ajaxToolkit:FilteredTextBoxExtender>


                                                    <asp:TextBox ID="TxtBDGear_Min_Current" runat="server" MaxLength="6" AutoPostBack="true" Width="20%" OnTextChanged="TxtBDGear_Min_Current_TextChanged" ></asp:TextBox>Min.
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtBDGear_Min_Current" runat="server" ControlToValidate="TxtBDGear_Min_Current" ErrorMessage="Gear Min.(Current Month)" Display="None"> </asp:RequiredFieldValidator>
                                                    <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtBDGear_Min_Current" runat="server" TargetControlID="RequiredFieldValidatorTxtBDGear_Min_Current"></ajaxToolkit:ValidatorCalloutExtender>
                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtBDGear_Min_Current" runat="server" TargetControlID="TxtBDGear_Min_Current" ValidChars="0123456789"></ajaxToolkit:FilteredTextBoxExtender>
                                                    <asp:RangeValidator ID="RangeValidatorTxtBDGear_Min_Current" runat="server" ControlToValidate="TxtBDGear_Min_Current" MinimumValue="0" MaximumValue="60" ErrorMessage="Min in range 0 to 60" Text="range 0 to 60" ForeColor="Red" Display="Dynamic"></asp:RangeValidator>


                                                </div>


                                                <div class="col-lg-2 ">
                                                    <h4>Gear Hrs. Progressive</h4>
                                                </div>


                                                <div class="col-lg-3">

                                                    <asp:TextBox ID="TxtBDGear_Hr_Progressive" runat="server" MaxLength="6" AutoPostBack="true" Width="20%"></asp:TextBox>Hrs.
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtBDGear_Hr_Progressive" runat="server" ControlToValidate="TxtBDGear_Hr_Progressive" ErrorMessage="Gear Hr. Progressive" Display="None"> </asp:RequiredFieldValidator>
                                                    <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtBDGear_Hr_Progressive" runat="server" TargetControlID="RequiredFieldValidatorTxtBDGear_Hr_Progressive"></ajaxToolkit:ValidatorCalloutExtender>
                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtBDGear_Hr_Progressive" runat="server" TargetControlID="TxtBDGear_Hr_Progressive" ValidChars="0123456789"></ajaxToolkit:FilteredTextBoxExtender>


                                                    <asp:TextBox ID="TxtBDGear_Min_Progressive" runat="server" MaxLength="6" AutoPostBack="true" Width="20%" ></asp:TextBox>Min.
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtBDGear_Min_Progressive" runat="server" ControlToValidate="TxtBDGear_Min_Progressive" ErrorMessage="Power Min. Progressive" Display="None"> </asp:RequiredFieldValidator>
                                                    <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtBDGear_Min_Progressive" runat="server" TargetControlID="RequiredFieldValidatorTxtBDGear_Min_Progressive"></ajaxToolkit:ValidatorCalloutExtender>
                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtBDGear_Min_Progressive" runat="server" TargetControlID="TxtBDGear_Min_Progressive" ValidChars="0123456789"></ajaxToolkit:FilteredTextBoxExtender>
                                                    <asp:RangeValidator ID="RangeValidatorTxtBDGear_Min_Progressive" runat="server" ControlToValidate="TxtBDGear_Min_Progressive" MinimumValue="0" MaximumValue="60" ErrorMessage="Min in range 0 to 60" Text="range 0 to 60" ForeColor="Red" Display="Dynamic"></asp:RangeValidator>


                                                </div>



                                            </div>

                                        </div>
                                    </div>
                                </section>



                                    <section class="page_head" style="width: 100%;">
                                    <div class="container">

                                        <div class="row">

                                            <div class="row col-lg-12">

                                                <div class="col-lg-2 ">
                                                    <h4>Other Cause Hrs.(Current Month)</h4>
                                                </div>


                                                <div class="col-lg-3">

                                                    <asp:TextBox ID="TxtBDOtherCause_Hr_Current" runat="server" MaxLength="6" AutoPostBack="true" Width="20%" OnTextChanged="TxtBDOtherCause_Hr_Current_TextChanged" ></asp:TextBox>Hrs.
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtBDOtherCause_Hr_Current" runat="server" ControlToValidate="TxtBDOtherCause_Hr_Current" ErrorMessage="Other Cause Hrs.(Current Month)" Display="None"> </asp:RequiredFieldValidator>
                                                    <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtBDOtherCause_Hr_Current" runat="server" TargetControlID="RequiredFieldValidatorTxtBDOtherCause_Hr_Current"></ajaxToolkit:ValidatorCalloutExtender>
                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtBDOtherCause_Hr_Current" runat="server" TargetControlID="TxtBDOtherCause_Hr_Current" ValidChars="0123456789"></ajaxToolkit:FilteredTextBoxExtender>


                                                    <asp:TextBox ID="TxtBDOtherCause_Min_Current" runat="server" MaxLength="6" AutoPostBack="true" Width="20%" OnTextChanged="TxtBDOtherCause_Min_Current_TextChanged" ></asp:TextBox>Min.
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtBDOtherCause_Min_Current" runat="server" ControlToValidate="TxtBDOtherCause_Min_Current" ErrorMessage="Other Cause Min.(Current Month)" Display="None"> </asp:RequiredFieldValidator>
                                                    <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtBDOtherCause_Min_Current" runat="server" TargetControlID="RequiredFieldValidatorTxtBDOtherCause_Min_Current"></ajaxToolkit:ValidatorCalloutExtender>
                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtBDOtherCause_Min_Current" runat="server" TargetControlID="TxtBDOtherCause_Min_Current" ValidChars="0123456789"></ajaxToolkit:FilteredTextBoxExtender>
                                                    <asp:RangeValidator ID="RangeValidatorTxtBDOtherCause_Min_Current" runat="server" ControlToValidate="TxtBDOtherCause_Min_Current" MinimumValue="0" MaximumValue="60" ErrorMessage="Min in range 0 to 60" Text="range 0 to 60" ForeColor="Red" Display="Dynamic"></asp:RangeValidator>


                                                </div>


                                                <div class="col-lg-2 ">
                                                    <h4>Other Cause Hrs. Progressive</h4>
                                                </div>


                                                <div class="col-lg-3">

                                                    <asp:TextBox ID="TxtBDOtherCause_Hr_Progressive" runat="server" MaxLength="6" AutoPostBack="true" Width="20%" OnTextChanged="TxtBDOtherCause_Hr_Progressive_TextChanged"></asp:TextBox>Hrs.
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtBDOtherCause_Hr_Progressive" runat="server" ControlToValidate="TxtBDOtherCause_Hr_Progressive" ErrorMessage="Other Cause Hr. Progressive" Display="None"> </asp:RequiredFieldValidator>
                                                    <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtBDOtherCause_Hr_Progressive" runat="server" TargetControlID="RequiredFieldValidatorTxtBDOtherCause_Hr_Progressive"></ajaxToolkit:ValidatorCalloutExtender>
                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtBDOtherCause_Hr_Progressive" runat="server" TargetControlID="TxtBDOtherCause_Hr_Progressive" ValidChars="0123456789"></ajaxToolkit:FilteredTextBoxExtender>


                                                    <asp:TextBox ID="TxtBDOtherCause_Min_Progressive" runat="server" MaxLength="6" AutoPostBack="true" Width="20%" OnTextChanged="TxtBDOtherCause_Min_Progressive_TextChanged" ></asp:TextBox>Min.
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtBDOtherCause_Min_Progressive" runat="server" ControlToValidate="TxtBDOtherCause_Min_Progressive" ErrorMessage="Other Cause Min. Progressive" Display="None"> </asp:RequiredFieldValidator>
                                                    <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtBDOtherCause_Min_Progressive" runat="server" TargetControlID="RequiredFieldValidatorTxtBDOtherCause_Min_Progressive"></ajaxToolkit:ValidatorCalloutExtender>
                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtBDOtherCause_Min_Progressive" runat="server" TargetControlID="TxtBDOtherCause_Min_Progressive" ValidChars="0123456789"></ajaxToolkit:FilteredTextBoxExtender>
                                                    <asp:RangeValidator ID="RangeValidatorTxtBDOtherCause_Min_Progressive" runat="server" ControlToValidate="TxtBDOtherCause_Min_Progressive" MinimumValue="0" MaximumValue="60" ErrorMessage="Min in range 0 to 60" Text="range 0 to 60" ForeColor="Red" Display="Dynamic"></asp:RangeValidator>


                                                </div>



                                            </div>

                                        </div>
                                    </div>
                                </section>



                                     <section class="page_head" style="width: 100%;">
                                    <div class="container">

                                        <div class="row">

                                            <div class="row col-lg-12">

                                                <div class="col-lg-2 ">
                                                    <h4>Total Hrs.(Current Month)</h4>
                                                </div>


                                                <div class="col-lg-3">

                                                    <asp:TextBox ID="TxtBD_Total_Hr_Current" runat="server" MaxLength="6" Enabled="false" Width="20%" ></asp:TextBox>Hrs.
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtBD_Total_Hr_Current" runat="server" ControlToValidate="TxtBD_Total_Hr_Current" ErrorMessage="Total Hrs.(Current Month)" Display="None"> </asp:RequiredFieldValidator>
                                                    <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtBD_Total_Hr_Current" runat="server" TargetControlID="RequiredFieldValidatorTxtBD_Total_Hr_Current"></ajaxToolkit:ValidatorCalloutExtender>
                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtBD_Total_Hr_Current" runat="server" TargetControlID="TxtBD_Total_Hr_Current" ValidChars="0123456789"></ajaxToolkit:FilteredTextBoxExtender>


                                                    <asp:TextBox ID="TxtBD_Total_Min_Current" runat="server" MaxLength="6" Enabled="false" Width="20%" ></asp:TextBox>Min.
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtBD_Total_Min_Current" runat="server" ControlToValidate="TxtBD_Total_Min_Current" ErrorMessage="Total Min.(Current Month)" Display="None"> </asp:RequiredFieldValidator>
                                                    <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtBD_Total_Min_Current" runat="server" TargetControlID="RequiredFieldValidatorTxtBD_Total_Min_Current"></ajaxToolkit:ValidatorCalloutExtender>
                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtBD_Total_Min_Current" runat="server" TargetControlID="TxtBD_Total_Min_Current" ValidChars="0123456789"></ajaxToolkit:FilteredTextBoxExtender>
                                                    <asp:RangeValidator ID="RangeValidatorTxtBD_Total_Min_Current" runat="server" ControlToValidate="TxtBD_Total_Min_Current" MinimumValue="0" MaximumValue="60" ErrorMessage="Min in range 0 to 60" Text="range 0 to 60" ForeColor="Red" Display="Dynamic"></asp:RangeValidator>


                                                </div>


                                                <div class="col-lg-2 ">
                                                    <h4>Total Hrs. Progressive</h4>
                                                </div>


                                                <div class="col-lg-3">

                                                    <asp:TextBox ID="TxtBD_Total_Hr_Progressive" runat="server" MaxLength="6" Enabled="false" Width="20%"></asp:TextBox>Hrs.
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtBD_Total_Hr_Progressive" runat="server" ControlToValidate="TxtBD_Total_Hr_Progressive" ErrorMessage="Total Hr. Progressive" Display="None"> </asp:RequiredFieldValidator>
                                                    <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtBD_Total_Hr_Progressive" runat="server" TargetControlID="RequiredFieldValidatorTxtBD_Total_Hr_Progressive"></ajaxToolkit:ValidatorCalloutExtender>
                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtBD_Total_Hr_Progressive" runat="server" TargetControlID="TxtBD_Total_Hr_Progressive" ValidChars="0123456789"></ajaxToolkit:FilteredTextBoxExtender>


                                                    <asp:TextBox ID="TxtBD_Total_Min_Progressive" runat="server" MaxLength="6" Enabled="false" Width="20%" ></asp:TextBox>Min.
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtBD_Total_Min_Progressive" runat="server" ControlToValidate="TxtBD_Total_Min_Progressive" ErrorMessage="Total Min. Progressive" Display="None"> </asp:RequiredFieldValidator>
                                                    <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtBD_Total_Min_Progressive" runat="server" TargetControlID="RequiredFieldValidatorTxtBD_Total_Min_Progressive"></ajaxToolkit:ValidatorCalloutExtender>
                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtBD_Total_Min_Progressive" runat="server" TargetControlID="TxtBD_Total_Min_Progressive" ValidChars="0123456789"></ajaxToolkit:FilteredTextBoxExtender>
                                                    <asp:RangeValidator ID="RangeValidatorTxtBD_Total_Min_Progressive" runat="server" ControlToValidate="TxtBD_Total_Min_Progressive" MinimumValue="0" MaximumValue="60" ErrorMessage="Min in range 0 to 60" Text="range 0 to 60" ForeColor="Red" Display="Dynamic"></asp:RangeValidator>


                                                </div>



                                            </div>

                                        </div>
                                    </div>
                                </section>



                                    </fieldset>

                                </fieldset>



                                  <fieldset class="well">
                                <legend class="well-legend">Break Down Details</legend>


                                 <section class="page_head" style="width: 100%;">
                                    <div class="container">

                                        <div class="row">

                                            <div class="row col-lg-12">

                                                 <asp:GridView ID="Gridbreakdown" runat="server" AutoGenerateColumns="False" ShowFooter="true" 
                                                OnRowCancelingEdit="Gridbreakdown_RowCancelingEdit1" GridLines="Both" OnRowDeleting="Gridbreakdown_RowDeleting1" OnRowEditing="Gridbreakdown_RowEditing1"
                                                OnRowUpdating="Gridbreakdown_RowUpdating1" CssClass="table" Width="93%">

                                                <Columns>
                                                    <asp:TemplateField>
                                                        <HeaderTemplate>S.No</HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="LblSlnoup" runat="server" Text='<%#Container.DataItemIndex + 1%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center" Visible="false">
                                                        <HeaderTemplate>Slno</HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="LblSlno_bd" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Slno").ToString())%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>


                                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center">
                                                        <HeaderTemplate>Date</HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="LblBD_Date" runat="server"  Text='<%# Eval("BD_Date", "{0:d}")%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TxtBD_Dateupdt" runat="server" Text='<%# Server.HtmlEncode((string)Eval("BD_Date").ToString())%>' class="form-control" Width="120px"></asp:TextBox>
                                                        
                                                             <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtBD_Dateupdt" runat="server" ControlToValidate="TxtBD_Dateupdt" Display="None" ErrorMessage="Date!!"> </asp:RequiredFieldValidator>
                                                            <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtBD_Dateupdt" runat="server" TargetControlID="RequiredFieldValidatorTxtBD_Dateupdt">
                                                            </ajaxToolkit:ValidatorCalloutExtender>

                                                            <ajaxToolkit:CalendarExtender ID="CalenderTxtBD_Dateupdt" TargetControlID="TxtBD_Dateupdt" runat="server" PopupPosition="TopRight" Enabled="True" Format="dd/MM/yyyy"></ajaxToolkit:CalendarExtender>

                                                        
                                                        </EditItemTemplate>
                                                        <FooterTemplate>
                                                            <asp:TextBox ID="TxtBD_Dateins" runat="server" class="form-control" Width="120px"></asp:TextBox>

                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtBD_Dateins" runat="server" ControlToValidate="TxtBD_Dateins" Display="None" ErrorMessage="Date!!"> </asp:RequiredFieldValidator>
                                                            <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtBD_Dateins" runat="server" TargetControlID="RequiredFieldValidatorTxtBD_Dateins">
                                                            </ajaxToolkit:ValidatorCalloutExtender>

                                                            <ajaxToolkit:CalendarExtender ID="CalenderTxtBD_Dateins" TargetControlID="TxtBD_Dateins" runat="server" PopupPosition="TopRight" Enabled="True" Format="dd/MM/yyyy"></ajaxToolkit:CalendarExtender>


                                                        </FooterTemplate>
                                                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField ItemStyle-HorizontalAlign="left" ItemStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center">
                                                        <HeaderTemplate>From(Hr - Min)</HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="LblBD_HR_From" runat="server" Text='<%# Server.HtmlEncode((string)Eval("BD_HR_From").ToString())%>'></asp:Label>Hr.
                                                             <asp:Label ID="LblBD_Min_From" runat="server" Text='<%# Server.HtmlEncode((string)Eval("BD_Min_From").ToString())%>'></asp:Label>Min.
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                           
                                                             <asp:TextBox ID="TxtBD_HR_Fromupdt" runat="server" Width="30px" Text='<%# Server.HtmlEncode((string)Eval("BD_HR_From").ToString())%>'></asp:TextBox>Hr.
                                                            <asp:TextBox ID="TxtBD_Min_Fromupdt" runat="server" Width="30px" Text='<%# Server.HtmlEncode((string)Eval("BD_Min_From").ToString())%>'></asp:TextBox>Min.

                                                                                                               
                                                        </EditItemTemplate>

                                                        <FooterTemplate>

                                                        <asp:TextBox ID="TxtBD_HR_Fromins" runat="server" Width="30px"></asp:TextBox>Hr.
                                                        <asp:TextBox ID="TxtBD_Min_Fromins" runat="server" Width="30px"></asp:TextBox>Min.
                                                        </FooterTemplate>
                                                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField ItemStyle-HorizontalAlign="left" ItemStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center">
                                                        <HeaderTemplate>To(Hr - Min)</HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="LblBD_HR_To" runat="server" Text='<%# Server.HtmlEncode((string)Eval("BD_HR_To").ToString())%>'></asp:Label>Hr.
                                                            <asp:Label ID="LblBD_Min_To" runat="server" Text='<%# Server.HtmlEncode((string)Eval("BD_Min_To").ToString())%>'></asp:Label>Min.
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                        <asp:TextBox ID="TxtBD_HR_Toupdt" runat="server" Width="30px" Text='<%# Server.HtmlEncode((string)Eval("BD_HR_To").ToString())%>'></asp:TextBox>Hr.
                                                        <asp:TextBox ID="TxtBD_Min_Toupdt" runat="server" Width="30px" Text='<%# Server.HtmlEncode((string)Eval("BD_Min_To").ToString())%>'></asp:TextBox>Min.

                                                        </EditItemTemplate>

                                                        <FooterTemplate>
                                                            <asp:TextBox ID="TxtBD_HR_Toins" runat="server" Width="30px"></asp:TextBox>Hr.
                                                            <asp:TextBox ID="TxtBD_Min_Toins" runat="server" Width="30px"></asp:TextBox>Min.
                                                        </FooterTemplate>
                                                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField ItemStyle-HorizontalAlign="center" ItemStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center">
                                                        <HeaderTemplate>Duration(Hr - Min)</HeaderTemplate>
                                                        <ItemTemplate>
                                                        <asp:Label ID="LblBD_HR_Duration" runat="server" Text='<%# Server.HtmlEncode((string)Eval("BD_HR_Duration").ToString())%>'></asp:Label>Hr.
                                                            <asp:Label ID="LblBD_Min_Duration" runat="server" Text='<%# Server.HtmlEncode((string)Eval("BD_Min_Duration").ToString())%>'></asp:Label>Min.
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                          <asp:TextBox ID="TxtBD_HR_Durationupdt" runat="server" Width="30px" Text='<%# Server.HtmlEncode((string)Eval("BD_HR_Duration").ToString())%>'></asp:TextBox>Hr.
                                                        <asp:TextBox ID="TxtBD_Min_Durationupdt" runat="server" Width="30px" Text='<%# Server.HtmlEncode((string)Eval("BD_Min_Duration").ToString())%>'></asp:TextBox>Min.
                                                        </EditItemTemplate>

                                                        <FooterTemplate>
                                                           <asp:TextBox ID="TxtBD_HR_Durationins" runat="server" Width="30px"></asp:TextBox>Hr.
                                                            <asp:TextBox ID="TxtBD_Min_Durationins" runat="server" Width="30px"></asp:TextBox>Min.                                                   
                                                        </FooterTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" Width="15%"></HeaderStyle>
                                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="15%"></ItemStyle>
                                                        <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="15%" />
                                                    </asp:TemplateField>

                                                     <asp:TemplateField ItemStyle-HorizontalAlign="center" ItemStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center">
                                                        <HeaderTemplate>Cause</HeaderTemplate>
                                                        <ItemTemplate>
                                                           <asp:Label ID="LblBD_Cause" runat="server" Text='<%# Server.HtmlEncode((string)Eval("BD_Cause").ToString())%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TxtBD_Causeupdt" Width="200px" runat="server" TextMode="MultiLine" Text='<%# Server.HtmlEncode((string)Eval("BD_Cause").ToString())%>' class="form-control"></asp:TextBox>
                                                        </EditItemTemplate>

                                                        <FooterTemplate>
                                                            <asp:TextBox ID="TxtBD_Causeins" runat="server" Width="200px" class="form-control" TextMode="MultiLine"></asp:TextBox>                                                          
                                                        </FooterTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" Width="15%"></HeaderStyle>
                                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="15%"></ItemStyle>
                                                        <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="15%" />
                                                    </asp:TemplateField>

                                                   
                                                   
                                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                                                        <HeaderTemplate>Operation</HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="Linkedit" runat="server" CommandName="edit" CausesValidation="false">Edit</asp:LinkButton>
                                                            /
                                                                    <asp:LinkButton ID="Linkdelete" runat="server" CommandName="delete" CausesValidation="false">Delete</asp:LinkButton>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:LinkButton ID="Linkupdate" runat="server" CommandName="update" CausesValidation="false">Update</asp:LinkButton>
                                                            /
                                                                    <asp:LinkButton ID="LinkButton4" runat="server" CommandName="cancel" CausesValidation="false">Cancel</asp:LinkButton>

                                                        </EditItemTemplate>
                                                        <FooterTemplate>
                                                            <asp:Button ID="Btnsavebd" runat="server" Text="Add" CausesValidation="false" OnClick="SaveRecordbd"   CssClass="form-control" />
                                                        </FooterTemplate>



                                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                                    </asp:TemplateField>


                                                </Columns>

                                                <HeaderStyle BackColor="#337585" Font-Bold="True" ForeColor="white" HorizontalAlign="Center" VerticalAlign="Middle" Height="30px" />
                                                <PagerStyle ForeColor="#003399" HorizontalAlign="Center" CssClass="GridPager" Height="20px" />
                                                <RowStyle BackColor="White" ForeColor="#686868" Height="41px" />
                                                <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                                                <SortedAscendingCellStyle BackColor="#EDF6F6" />
                                                <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                                                <SortedDescendingCellStyle BackColor="#D6DFDF" />
                                                <SortedDescendingHeaderStyle BackColor="#002876" />


                                            </asp:GridView>



                                            </div>

                                        </div>
                                    </div>
                                </section>


                                 </fieldset>





                                  <fieldset class="well">
                                <legend class="well-legend">Equipment Details</legend>


                                 <section class="page_head" style="width: 100%;">
                                    <div class="container">

                                        <div class="row">

                                            <div class="row col-lg-12">

                                                 <asp:GridView ID="Gridequipdetails" runat="server" AutoGenerateColumns="False" ShowFooter="true" 
                                                OnRowCancelingEdit="Gridequipdetails_RowCancelingEdit1" GridLines="Both" OnRowDeleting="Gridequipdetails_RowDeleting1" OnRowEditing="Gridequipdetails_RowEditing1"
                                                OnRowUpdating="Gridequipdetails_RowUpdating1" CssClass="table" Width="93%">

                                                <Columns>
                                                    <asp:TemplateField>
                                                        <HeaderTemplate>S.No</HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="LblSlnoup" runat="server" Text='<%#Container.DataItemIndex + 1%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center" Visible="false">
                                                        <HeaderTemplate>Slno</HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="LblSlno_eqp" runat="server" Text='<%# Server.HtmlEncode((string)Eval("EquipmentID").ToString())%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>


                                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center">
                                                        <HeaderTemplate>Equipment Type</HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="LblEquip_Type" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Equip_Type").ToString())%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>

                                                         <asp:HiddenField ID="hdnEquip_Typeupdt" runat="server" Value='<%#Server.HtmlEncode((string)Eval("Equip_Type").ToString())%>' />

                                                         <asp:DropDownList ID="ddlEquip_Typeupdt" runat="server">

                                                                <asp:ListItem>New Equipment</asp:ListItem>
                                                                <asp:ListItem>PowerSupply Equipment</asp:ListItem>
                                                                <asp:ListItem>Defective Equipment</asp:ListItem>

                                                            </asp:DropDownList>
                                                        
                                                        </EditItemTemplate>
                                                        <FooterTemplate>

                                                         <asp:DropDownList ID="ddlEquip_Typeins" runat="server">

                                                                <asp:ListItem>New Equipment</asp:ListItem>
                                                                <asp:ListItem>PowerSupply Equipment</asp:ListItem>
                                                                <asp:ListItem>Defective Equipment</asp:ListItem>

                                                            </asp:DropDownList>

                                                        </FooterTemplate>
                                                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField ItemStyle-HorizontalAlign="left" ItemStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center">
                                                        <HeaderTemplate>Equipment Name</HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="LblEquipment_NM" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Equipment_NM").ToString())%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                           
                                                             <asp:TextBox ID="TxtEquipment_NMupdt" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Equipment_NM").ToString())%>' class="form-control"></asp:TextBox>
                                                                                                               
                                                        </EditItemTemplate>

                                                        <FooterTemplate>

                                                        <asp:TextBox ID="TxtEquipment_NMins" runat="server"  class="form-control"></asp:TextBox>
                                                       
                                                        </FooterTemplate>
                                                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField ItemStyle-HorizontalAlign="left" ItemStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center">
                                                        <HeaderTemplate>Rating</HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="LblEquip_Rating" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Equip_Rating").ToString())%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                           
                                                             <asp:TextBox ID="TxtEquip_Ratingupdt" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Equip_Rating").ToString())%>' class="form-control"></asp:TextBox>
                                                                                                               
                                                        </EditItemTemplate>

                                                        <FooterTemplate>

                                                        <asp:TextBox ID="TxtEquip_Ratingins" runat="server" class="form-control"></asp:TextBox>
                                                       
                                                        </FooterTemplate>
                                                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField ItemStyle-HorizontalAlign="center" ItemStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center">
                                                        <HeaderTemplate>Make</HeaderTemplate>
                                                        <ItemTemplate>
                                                           <asp:Label ID="LblEquip_Make" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Equip_Make").ToString())%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TxtEquip_Makeupdt" Width="50%" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Equip_Make").ToString())%>' class="form-control"></asp:TextBox>
                                                        </EditItemTemplate>

                                                        <FooterTemplate>
                                                            <asp:TextBox ID="TxtEquip_Makeins" runat="server" Width="50%" class="form-control"></asp:TextBox>Hr.    
                                                                                                                 
                                                        </FooterTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" Width="15%"></HeaderStyle>
                                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="15%"></ItemStyle>
                                                        <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="15%" />
                                                    </asp:TemplateField>

                                                     <asp:TemplateField ItemStyle-HorizontalAlign="center" ItemStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center">
                                                        <HeaderTemplate>Model</HeaderTemplate>
                                                        <ItemTemplate>
                                                           <asp:Label ID="LblEquip_Model" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Equip_Model").ToString())%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TxtEquip_Modelupdt" Width="50%" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Equip_Model").ToString())%>' class="form-control"></asp:TextBox>
                                                        </EditItemTemplate>

                                                        <FooterTemplate>
                                                            <asp:TextBox ID="TxtEquip_Modelins" runat="server" Width="50%" class="form-control"></asp:TextBox>                                                          
                                                        </FooterTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" Width="15%"></HeaderStyle>
                                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="15%"></ItemStyle>
                                                        <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="15%" />
                                                    </asp:TemplateField>

                                                    <asp:TemplateField ItemStyle-HorizontalAlign="center" ItemStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center">
                                                        <HeaderTemplate>Serial no</HeaderTemplate>
                                                        <ItemTemplate>
                                                           <asp:Label ID="LblEquip_Serialno" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Equip_Serialno").ToString())%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TxtEquip_Serialnoupdt" Width="50%" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Equip_Serialno").ToString())%>' class="form-control"></asp:TextBox>
                                                        </EditItemTemplate>

                                                        <FooterTemplate>
                                                            <asp:TextBox ID="TxtEquip_Serialnoins" runat="server" Width="50%" class="form-control"></asp:TextBox>                                                          
                                                        </FooterTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" Width="15%"></HeaderStyle>
                                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="15%"></ItemStyle>
                                                        <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="15%" />
                                                    </asp:TemplateField>

                                                    <asp:TemplateField ItemStyle-HorizontalAlign="center" ItemStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center">
                                                        <HeaderTemplate>Status</HeaderTemplate>
                                                        <ItemTemplate>
                                                           <asp:Label ID="LblEquip_Status" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Equip_Status").ToString())%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TxtEquip_Statusupdt" Width="50%" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Equip_Status").ToString())%>' class="form-control"></asp:TextBox>
                                                        </EditItemTemplate>

                                                        <FooterTemplate>
                                                            <asp:TextBox ID="TxtEquip_Statusins" runat="server" Width="50%" class="form-control"></asp:TextBox>                                                          
                                                        </FooterTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" Width="15%"></HeaderStyle>
                                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="15%"></ItemStyle>
                                                        <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="15%" />
                                                    </asp:TemplateField>
                                                   
                                                   
                                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                                                        <HeaderTemplate>Operation</HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="Linkedit" runat="server" CommandName="edit" CausesValidation="false">Edit</asp:LinkButton>
                                                            /
                                                                    <asp:LinkButton ID="Linkdelete" runat="server" CommandName="delete" CausesValidation="false">Delete</asp:LinkButton>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:LinkButton ID="Linkupdate" runat="server" CommandName="update" CausesValidation="false">Update</asp:LinkButton>
                                                            /
                                                                    <asp:LinkButton ID="LinkButton4" runat="server" CommandName="cancel" CausesValidation="false">Cancel</asp:LinkButton>

                                                        </EditItemTemplate>
                                                        <FooterTemplate>
                                                            <asp:Button ID="Btnsaveeqp" runat="server" Text="Add" CausesValidation="false" OnClick="SaveEquip"   CssClass="form-control" />
                                                        </FooterTemplate>



                                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                                    </asp:TemplateField>


                                                </Columns>

                                                <HeaderStyle BackColor="#337585" Font-Bold="True" ForeColor="white" HorizontalAlign="Center" VerticalAlign="Middle" Height="30px" />
                                                <PagerStyle ForeColor="#003399" HorizontalAlign="Center" CssClass="GridPager" Height="20px" />
                                                <RowStyle BackColor="White" ForeColor="#686868" Height="41px" />
                                                <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                                                <SortedAscendingCellStyle BackColor="#EDF6F6" />
                                                <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                                                <SortedDescendingCellStyle BackColor="#D6DFDF" />
                                                <SortedDescendingHeaderStyle BackColor="#002876" />


                                            </asp:GridView>



                                            </div>

                                        </div>
                                    </div>
                                </section>


                                 </fieldset>



                                  <fieldset class="well">
                                <legend class="well-legend">Highlights of Coverage(Details)</legend>


                                 <section class="page_head" style="width: 100%;">
                                    <div class="container">

                                        <div class="row">

                                            <div class="row col-lg-12">

                                                 <asp:GridView ID="Gridhighlights" runat="server" AutoGenerateColumns="False" ShowFooter="true" 
                                                OnRowCancelingEdit="Gridhighlights_RowCancelingEdit1" GridLines="Both" OnRowDeleting="Gridhighlights_RowDeleting1" OnRowEditing="Gridhighlights_RowEditing1"
                                                OnRowUpdating="Gridhighlights_RowUpdating1" CssClass="table" Width="93%">

                                                <Columns>
                                                    <asp:TemplateField>
                                                        <HeaderTemplate>S.No</HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="LblSlnoup" runat="server" Text='<%#Container.DataItemIndex + 1%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center" Visible="false">
                                                        <HeaderTemplate>Slno</HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="LblSlno_highcov" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Slno").ToString())%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>


                                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center">
                                                        <HeaderTemplate>Date of Coverage</HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="LblDate_Coverage" runat="server"  Text='<%# Eval("Date_Coverage", "{0:d}")%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>

                                                            <asp:TextBox ID="TxtDate_Coverageupdt" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Date_Coverage").ToString())%>' Width="120px" class="form-control"></asp:TextBox>
                                                        
                                                             <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtDate_Coverageupdt" runat="server" ControlToValidate="TxtDate_Coverageupdt" Display="None" ErrorMessage="Date!!"> </asp:RequiredFieldValidator>
                                                            <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtDate_Coverageupdt" runat="server" TargetControlID="RequiredFieldValidatorTxtDate_Coverageupdt">
                                                            </ajaxToolkit:ValidatorCalloutExtender>

                                                            <ajaxToolkit:CalendarExtender ID="CalenderTxtDate_Coverageupdt" TargetControlID="TxtDate_Coverageupdt" runat="server" PopupPosition="TopRight" Enabled="True" Format="dd/MM/yyyy"></ajaxToolkit:CalendarExtender>

                                                        
                                                        </EditItemTemplate>
                                                        <FooterTemplate>
                                                            <asp:TextBox ID="TxtDate_Coverageins" runat="server" Width="120px"></asp:TextBox>

                                                             <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtDate_Coverageins" runat="server" ControlToValidate="TxtDate_Coverageins" Display="None" ErrorMessage="Date!!"> </asp:RequiredFieldValidator>
                                                            <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtDate_Coverageins" runat="server" TargetControlID="RequiredFieldValidatorTxtDate_Coverageins">
                                                            </ajaxToolkit:ValidatorCalloutExtender>

                                                            <ajaxToolkit:CalendarExtender ID="CalenderTxtDate_Coverageins" TargetControlID="TxtDate_Coverageins" runat="server" PopupPosition="TopRight" Enabled="True" Format="dd/MM/yyyy"></ajaxToolkit:CalendarExtender>

                                                           

                                                        </FooterTemplate>
                                                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField ItemStyle-HorizontalAlign="left" ItemStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center">
                                                        <HeaderTemplate>Event</HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="LblCoverage_Event" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Coverage_Event").ToString())%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                           
                                                             <asp:TextBox ID="TxtCoverage_Eventupdt" runat="server" class="form-control" Width="200px" Text='<%# Server.HtmlEncode((string)Eval("Coverage_Event").ToString())%>'></asp:TextBox>
                                                                                                               
                                                        </EditItemTemplate>

                                                        <FooterTemplate>

                                                        <asp:TextBox ID="TxtCoverage_Eventins" runat="server" class="form-control" Width="200px"></asp:TextBox>
                                                       
                                                        </FooterTemplate>
                                                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField ItemStyle-HorizontalAlign="left" ItemStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center">
                                                        <HeaderTemplate>Live Feed(Hrs.)</HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="LblLive_FeedHrs" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Live_FeedHrs").ToString())%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                           
                                                             <asp:TextBox ID="TxtLive_FeedHrsupdt" runat="server" class="form-control" Text='<%# Server.HtmlEncode((string)Eval("Live_FeedHrs").ToString())%>'></asp:TextBox>
                                                                                                               
                                                        </EditItemTemplate>

                                                        <FooterTemplate>

                                                        <asp:TextBox ID="TxtLive_FeedHrsins" runat="server" class="form-control"></asp:TextBox>
                                                       
                                                        </FooterTemplate>
                                                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField ItemStyle-HorizontalAlign="center" ItemStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center">
                                                        <HeaderTemplate>Recorded Feed(Hrs.)</HeaderTemplate>
                                                        <ItemTemplate>
                                                           <asp:Label ID="LblRecorded_FeedHrs" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Recorded_FeedHrs").ToString())%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TxtRecorded_FeedHrsupdt" Width="50%" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Recorded_FeedHrs").ToString())%>' class="form-control"></asp:TextBox>
                                                        </EditItemTemplate>

                                                        <FooterTemplate>
                                                            <asp:TextBox ID="TxtRecorded_FeedHrsins" runat="server" Width="50%" class="form-control"></asp:TextBox>    
                                                                                                                 
                                                        </FooterTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" Width="15%"></HeaderStyle>
                                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="15%"></ItemStyle>
                                                        <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="15%" />
                                                    </asp:TemplateField>

                                                     <asp:TemplateField ItemStyle-HorizontalAlign="center" ItemStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center">
                                                        <HeaderTemplate>Hot Switching(Hrs.)</HeaderTemplate>
                                                        <ItemTemplate>
                                                           <asp:Label ID="LblHot_SwitchingHrs" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Hot_SwitchingHrs").ToString())%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TxtHot_SwitchingHrsupdt" Width="50%" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Hot_SwitchingHrs").ToString())%>' class="form-control"></asp:TextBox>
                                                        </EditItemTemplate>

                                                        <FooterTemplate>
                                                            <asp:TextBox ID="TxtHot_SwitchingHrsins" runat="server" Width="50%" class="form-control"></asp:TextBox>                                                          
                                                        </FooterTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" Width="15%"></HeaderStyle>
                                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="15%"></ItemStyle>
                                                        <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="15%" />
                                                    </asp:TemplateField>

                                                    <asp:TemplateField ItemStyle-HorizontalAlign="center" ItemStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center">
                                                        <HeaderTemplate>Remarks</HeaderTemplate>
                                                        <ItemTemplate>
                                                           <asp:Label ID="LblRemarks" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Remarks").ToString())%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TxtRemarksupdt" Width="200px" runat="server" TextMode="MultiLine" Text='<%# Server.HtmlEncode((string)Eval("Remarks").ToString())%>' class="form-control"></asp:TextBox>
                                                        </EditItemTemplate>

                                                        <FooterTemplate>
                                                            <asp:TextBox ID="TxtRemarksins" runat="server" Width="200px" class="form-control" TextMode="MultiLine" ></asp:TextBox>                                                          
                                                        </FooterTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" Width="15%"></HeaderStyle>
                                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="15%"></ItemStyle>
                                                        <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="15%" />
                                                    </asp:TemplateField>

                                                    
                                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                                                        <HeaderTemplate>Operation</HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="Linkedit" runat="server" CommandName="edit" CausesValidation="false">Edit</asp:LinkButton>
                                                            /
                                                                    <asp:LinkButton ID="Linkdelete" runat="server" CommandName="delete" CausesValidation="false">Delete</asp:LinkButton>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:LinkButton ID="Linkupdate" runat="server" CommandName="update" CausesValidation="false">Update</asp:LinkButton>
                                                            /
                                                                    <asp:LinkButton ID="LinkButton4" runat="server" CommandName="cancel" CausesValidation="false">Cancel</asp:LinkButton>

                                                        </EditItemTemplate>
                                                        <FooterTemplate>
                                                            <asp:Button ID="Btnsaveequip" runat="server" Text="Add" CausesValidation="false" OnClick="SaveHighlightCov"   CssClass="form-control" />
                                                        </FooterTemplate>



                                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                                    </asp:TemplateField>


                                                </Columns>

                                                <HeaderStyle BackColor="#337585" Font-Bold="True" ForeColor="white" HorizontalAlign="Center" VerticalAlign="Middle" Height="30px" />
                                                <PagerStyle ForeColor="#003399" HorizontalAlign="Center" CssClass="GridPager" Height="20px" />
                                                <RowStyle BackColor="White" ForeColor="#686868" Height="41px" />
                                                <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                                                <SortedAscendingCellStyle BackColor="#EDF6F6" />
                                                <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                                                <SortedDescendingCellStyle BackColor="#D6DFDF" />
                                                <SortedDescendingHeaderStyle BackColor="#002876" />


                                            </asp:GridView>



                                            </div>

                                        </div>
                                    </div>
                                </section>


                                 </fieldset>



                                 <fieldset class="well">
                                <legend class="well-legend">Action Taken at Station Level and Zonal Level</legend>



                                <section class="page_head" style="width: 100%;">
                                    <div class="container">

                                        <div class="row">

                                            <div class="row col-lg-12">

                                                <div class="col-lg-2">

                                                   <h4>Action taken at Station level</h4>
                                                    
                                                </div>

                                                
                                                <div class="col-lg-3">

                                                    <asp:TextBox ID="TxtActiontakenStation" runat="server" Height="70px" TextMode="MultiLine" MaxLength="6" ></asp:TextBox>
                                                    
                                                </div>

                                                <div class="col-lg-3">

                                                   <h4>Action taken at Zonal level</h4>
                                                    
                                                </div>

                                                
                                                <div class="col-lg-3">

                                                    <asp:TextBox ID="TxtActiontakenZonalOffc" runat="server" TextMode="MultiLine" Height="70px" MaxLength="6" ></asp:TextBox>
                                                    
                                                </div>


                                            </div>

                                        </div>
                                    </div>
                                </section>
                                    </fieldset>


                                 <fieldset class="well">
                                <legend class="well-legend">Additional Information & Remarks</legend>



                                <section class="page_head" style="width: 100%;">
                                    <div class="container">

                                        <div class="row">

                                            <div class="row col-lg-12">

                                                
                                                <div class="col-lg-2">

                                                   <h4>Additional Information</h4>
                                                    
                                                </div>

                                                <div class="col-lg-4">

                                                    <asp:TextBox ID="TxtAdditional_Information" runat="server" TextMode="MultiLine" Height="70px"></asp:TextBox>
                                                    
                                                </div>

                                                <div class="col-lg-1">

                                                   <h4>Remarks</h4>
                                                    
                                                </div>

                                                <div class="col-lg-4">

                                                    <asp:TextBox ID="TxtRemarks" runat="server" TextMode="MultiLine" Height="70px" ></asp:TextBox>
                                                    
                                                </div>


                                            </div>

                                        </div>
                                    </div>
                                </section>
                                    </fieldset>


                               <section class="page_head" style="width: 100%;">
                            <div class="container">

                                <div class="row">

                                    <div class="row col-lg-12">


                                        <div class="col-lg-7 ">

                                            <asp:Button ID="Btnsubmit" runat="server" CssClass="btn btn-default btn-lg" CausesValidation="false" Text="Submit" OnClick="Btnsubmit_Click"  />
                                            &nbsp;&nbsp;

                                                        <asp:Button ID="Btnupdate" runat="server" CssClass="btn btn-default btn-lg" CausesValidation="false" Text="Update" OnClick="Btnupdate_Click"  />
                                            &nbsp;&nbsp;

                                                        <asp:Button ID="Btncancel" runat="server" CssClass="btn btn-default btn-lg" Text="Cancel" CausesValidation="false"  />
                                            &nbsp;&nbsp;
                                                
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </section>


                       <%-- </ContentTemplate>

                       <triggers>

           
                        </triggers>

                        </asp:UpdatePanel>--%>


                        <section class="page_head" style="width: 100%;">
                            <div class="container">
                                <div class="row">



                                    <div class="row col-lg-12" style="margin-top: 40px; overflow: auto">


                                          <asp:GridView ID="Griddsng" runat="server" AutoGenerateColumns="False" AllowPaging="true" PageSize="2" OnRowCommand="Griddsng_RowCommand" OnRowEditing="Griddsng_RowEditing"
                                            OnRowDeleting="Griddsng_RowDeleting1" OnPageIndexChanging="Griddsng_PageIndexChanging" CssClass="table"
                                            Width="1140px">

                                            <Columns>
                                                <asp:TemplateField Visible="false">
                                                    <HeaderTemplate>S.No</HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="LblSlnoup" runat="server" Text='<%#Container.DataItemIndex + 1%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center" Visible="false">
                                                    <HeaderTemplate>S.No</HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="LblSno" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Slno").ToString())%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField ItemStyle-HorizontalAlign="left" ItemStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center">
                                                    <HeaderTemplate>
                                                        Year<hr />
                                                        Month
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="LblYear_NM" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Year_NM").ToString())%>'></asp:Label>
                                                        <hr />
                                                        <asp:Label ID="lblMonth_Nm" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Month_Nm").ToString())%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField Visible="false">
                                                    <HeaderTemplate>Zone</HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblZoneName" runat="server" Text='<%# Server.HtmlEncode((string)Eval("ZoneName").ToString())%>'></asp:Label>

                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField Visible="false">
                                                    <HeaderTemplate>State</HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblStateName" runat="server" Text='<%# Server.HtmlEncode((string)Eval("StateName").ToString())%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>




                                                <asp:TemplateField>
                                                    <HeaderTemplate>
                                                        HPA Rated Power
                                                                    <hr />
                                                        Normal Uplink Power                                                          
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblHPARatedPwr" runat="server" Text='<%# Server.HtmlEncode((string)Eval("HPARatedPwr").ToString())%>'></asp:Label>Hr
                                                        <asp:Label ID="lblNormaluplinkPwr" runat="server" Text='<%# Server.HtmlEncode((string)Eval("NormaluplinkPwr").ToString())%>'></asp:Label>Min<hr />                                                        
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField>
                                                    <HeaderTemplate>
                                                       Test Hours | Test Min <hr/>
                                                        Test Hours(Progressive)  | Test Min
                                                        
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblTest_Hr_Current" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Test_Hr_Current").ToString())%>'></asp:Label>|
                                                        <asp:Label ID="lblTest_Min_Current" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Test_Min_Current").ToString())%>'></asp:Label> <hr/>
                                                        <asp:Label ID="lblTest_Hr_Progressive" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Test_Hr_Progressive").ToString())%>'></asp:Label> |
                                                        <asp:Label ID="lblTest_Min_Progressive" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Test_Min_Progressive").ToString())%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>



                                                <asp:TemplateField>
                                                    <HeaderTemplate>
                                                       Radiated Prog. Hours | Min<hr />
                                                        Radiated Prog. Hours (Progressive) | Min

                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblRadiatedProg_Hr_Current" runat="server" Text='<%# Server.HtmlEncode((string)Eval("RadiatedProg_Hr_Current").ToString())%>'></asp:Label> |
                                                        <asp:Label ID="lblRadiatedProg_Min_Current" runat="server" Text='<%# Server.HtmlEncode((string)Eval("RadiatedProg_Min_Current").ToString())%>'></asp:Label> <hr />
                                                        <asp:Label ID="lblRadiatedProg_Hr_Progressive" runat="server" Text='<%# Server.HtmlEncode((string)Eval("RadiatedProg_Hr_Progressive").ToString())%>'></asp:Label> |
                                                        <asp:Label ID="lblRadiatedProg_Min_Progressive" runat="server" Text='<%# Server.HtmlEncode((string)Eval("RadiatedProg_Min_Progressive").ToString())%>'></asp:Label>
                                                   
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                             

                                                <asp:TemplateField>
                                                    <HeaderTemplate>
                                                       Total Hours | Min <hr />
                                                       Total Hours (Progressive) | Min
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblTotal_Hr_Current" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Total_Hr_Current").ToString())%>'></asp:Label> |
                                                        <asp:Label ID="lblTotal_Min_Current" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Total_Min_Current").ToString())%>'></asp:Label> <hr/>
                                                        <asp:Label ID="lblTotal_Hr_Progrresive" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Total_Hr_Progrresive").ToString())%>'></asp:Label> |
                                                        <asp:Label ID="lblTotal_Min_Progressive" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Total_Min_Progressive").ToString())%>'></asp:Label>
                                                   
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                               <asp:TemplateField>
                                                    <HeaderTemplate>
                                                       Since Test Hours(Progressive) | Min <hr/>
                                                       Since Radiated Prog. Hrs (Progressive) | Min <hr/>
                                                       Since Total Hrs (Progressive) | Min (Progressive)
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblSincetest_Hr_Progressive" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Sincetest_Hr_Progressive").ToString())%>'></asp:Label> |
                                                        <asp:Label ID="lblSincetest_Min_Progressive" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Sincetest_Min_Progressive").ToString())%>'></asp:Label> <hr />
                                                         <asp:Label ID="lblSinceRadiatedProg_Hr_Progressive" runat="server" Text='<%# Server.HtmlEncode((string)Eval("SinceRadiatedProg_Hr_Progressive").ToString())%>'></asp:Label> |
                                                        <asp:Label ID="lblSinceRadiatedProg_Min_Progressive" runat="server" Text='<%# Server.HtmlEncode((string)Eval("SinceRadiatedProg_Min_Progressive").ToString())%>'></asp:Label> <hr />
                                                        <asp:Label ID="lblSinceTotal_Hr_Progressive" runat="server" Text='<%# Server.HtmlEncode((string)Eval("SinceTotal_Hr_Progressive").ToString())%>'></asp:Label> |
                                                        <asp:Label ID="lblSinceTotal_Min_Progressive" runat="server" Text='<%# Server.HtmlEncode((string)Eval("SinceTotal_Min_Progressive").ToString())%>'></asp:Label>
                                                  
                                                
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                               <asp:TemplateField Visible="false">
                                                    <HeaderTemplate>Date of Entry</HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblInserted_Dt" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Inserted_Dt").ToString())%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>


                                                <asp:TemplateField>
                                                    <HeaderTemplate>Operation</HeaderTemplate>
                                                    <ItemTemplate>

                                                        <asp:LinkButton ID="Linkedit" runat="server" CommandName="edit" CausesValidation="false" CommandArgument='<%#Eval("Slno") +","+Eval("StateId")+","+Eval("StationID")%>'>Edit</asp:LinkButton>
                                                        <asp:LinkButton ID="Linkdelete" runat="server" CommandName="delete" CausesValidation="false">Delete</asp:LinkButton>
                                                    </ItemTemplate>

                                                </asp:TemplateField>


                                            </Columns>

                                            <HeaderStyle BackColor="#337585" Font-Bold="True" ForeColor="white" HorizontalAlign="Center" VerticalAlign="Middle" Height="30px" />
                                            <PagerStyle ForeColor="#003399" HorizontalAlign="Center" CssClass="GridPager" Height="20px" />
                                            <RowStyle BackColor="White" ForeColor="#686868" Height="41px" />
                                            <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                                            <SortedAscendingCellStyle BackColor="#EDF6F6" />
                                            <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                                            <SortedDescendingCellStyle BackColor="#D6DFDF" />
                                            <SortedDescendingHeaderStyle BackColor="#002876" />

                                        </asp:GridView>


                                    </div>

                                </div>
                            </div>
                        </section>







                    </div>

                </div>
            </div>
        </section>
    </section>

   

</asp:Content>
