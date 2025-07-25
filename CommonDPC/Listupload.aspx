<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="Listupload.aspx.cs" Inherits="PrasarNet.CommonDPC.Listupload" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <%--    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
   <link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css" />

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

    <script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js" type="text/javascript"></script>--%>
    <script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js" type="text/javascript"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <script type="text/javascript">  
        $(document).ready(function () {
            $("#GridView1").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
    </script>
    <style type="text/css">
        .auto-style2 {
            font-size: x-large;
            color: #0000FF;
        }

        .auto-style4 {
            font-size: large;
        }

        .auto-style6 {
            display: block;
            margin-right: auto;
            margin-left: auto;
            background-color: #FF99FF;
        }

        .auto-style9 {
            color: #0033CC;
            font-size: x-large;
        }

        .auto-style10 {
            font-size: x-large;
        }

        .auto-style11 {
            color: #FF9966;
            font-size: large;
        }

        .wrap {
            white-space: normal;
            width: 100px;
        }
    </style>




</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentSection" runat="server">
    <div id="Div2" class="col-md-12 col-sm-12 col-lg-12" runat="server" align="right">
        <br />
        <asp:LinkButton ID="btnback" runat="server" CssClass="btn grad4" CausesValidation="False" BorderColor="Black" BorderStyle="Ridge" BorderWidth="2px" OnClick="btnback_Click">
                <span aria-hidden="true" style="color: Black" class="glyphicon glyphicon-menu-left"></span>&nbsp; <span style="font-weight: bold; color: #000000">Back</span></asp:LinkButton>
        <br />
        <br />

    </div>
    <h2 class="text-center text-uppercase bg-primary">Tool to Generate Common Eligibility List</h2>
    <div class="container py-3  table-bordered" width="30%" align="center">


        <div class="row">
            <div class="col-md-12" align="center">
                <div class="alert-primary">
                    <%--<asp:Label ID="Label1" runat="server" Text="Common Eligibility List" CssClass="auto-style4"></asp:Label>--%>
                    <br />
                    <div>
                        <div class="row" runat="server" align="center" style="margin: auto; padding-top: 7px; padding-bottom: 7px; padding-right: 0px; padding-left: 0px; align-items: center">

                            <div align="center" runat="server" class=" col-md-4 col-sm-4 col-lg-4 " style="padding-top: 5px; padding-bottom: 5px">
                                <asp:Button ID="btntotal" runat="server" class="gradtotal font2 glyphicon-text-color" Font-Bold="true" Font-Size="Large" Text="Template (Blank Excel File to upload)"
                                    Style="padding-top: 63px; padding-bottom: 62px; width: 70%; height: 150px;" BorderColor="White" OnClick="btntotal_Click" CssClass="wrap" />

                            </div>
                            <div align="center" runat="server" class=" col-md-4 col-sm-4 col-lg-4 " style="padding-top: 5px; padding-bottom: 5px">
                                <asp:Button ID="Button1" runat="server" class="gradtotal font2" Font-Bold="true" Text="View Previous Generated Lists" Font-Size="Large"
                                    Style="padding-top: 63px; padding-bottom: 62px; width: 70%; height: 150px;" BorderColor="White" OnClick="btnprv_Click" CssClass="wrap" />

                            </div>
                            <div align="center" runat="server" class=" col-md-4 col-sm-4 col-lg-4 " style="padding-top: 5px; padding-bottom: 5px">
                                <asp:Button ID="Button2" runat="server" class="gradtotal font2" Font-Bold="true" Text="New" Font-Size="Large"
                                    Style="padding-top: 63px; padding-bottom: 62px; width: 70%; height: 150px;" BorderColor="White" OnClick="btnnew_Click" />

                            </div>
                        </div>
                    </div>
                    <br />

                </div>
            </div>
        </div>
        <div id="divprvdpc" runat="server" visible="false" class="panel panel-collapse">
            <asp:Panel ID="Panel1" runat="server" BorderStyle="Solid" BorderColor="cyan" BorderWidth="5" ScrollBars="Both" Width="90%" Height="300px">
                <div>
                    <strong>
                        <asp:Label ID="Label5" runat="server" Text="Click Over the DPC Name To upload excel file & Generate Common Eligible List " CssClass="auto-style11"></asp:Label>
                    </strong>
                </div>
                <asp:GridView ID="grdDPCdetails" runat="server" AutoGenerateColumns="False" ShowHeaderWhenEmpty="True"
                    OnRowDataBound="grdDPCdetails_OnRowDataBound" Width="90%" align="center" ShowFooterWhenEmpty="true" AlternatingRowStyle-CssClass="table-condensed"
                    OnRowCommand="grdDPCdetails_RowCommand" OnRowUpdating="grdDPCdetails_OnRowUpdating" OnRowEditing="grdDPCdetails_RowEditing" OnRowCancelingEdit="grdDPCdetails_OnRowCancelingEdit" DataKeyNames="id" CssClass="auto-style4">

                    <EmptyDataTemplate>
                        <div class="text-center">No record found</div>
                    </EmptyDataTemplate>
                    <AlternatingRowStyle CssClass="table-condensed" />
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <EditItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update" ValidationGroup="dpcupdate"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="SlNO" ItemStyle-Width="10px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="lblsno" runat="server" Text='<%# Bind("SNO") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <br />
                                <%-- <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>--%>
                                <div id="createDPC" runat="server" align="center" class="row table-bordered" visible="true">
                                    <div class="table-responsive-lg row ">
                                        <asp:Label ID="lblDPCcreate" runat="server" class="label-info rounded" Text=" Add a New DPC Name" Width="300px"></asp:Label>
                                        <br />
                                        <div class="text-xl-center row">
                                            <asp:TextBox ID="txtDPCcreate" runat="server" ValidationGroup="dpccreate"></asp:TextBox>
                                            <br />
                                            <br />
                                            <asp:RequiredFieldValidator ID="rbDPCcreate" runat="server" ControlToValidate="txtDPCcreate" ErrorMessage="Required" ForeColor="Red" ValidationGroup="dpccreate"></asp:RequiredFieldValidator>
                                            <br />
                                            <div class="btn-group-lg">
                                                <asp:Button ID="btnDPCcreate" runat="server" class="btn btn-primary" CommandName="AddaDPC" CssClass="btn btn-outline-dark alert-primary" Text="Add ++" ValidationGroup="dpccreate" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <%--         </ContentTemplate>
                                    <Triggers>
                                        <asp:PostBackTrigger ControlID="grdDPCdetails" />
                                    </Triggers>
                                </asp:UpdatePanel>--%>
                            </FooterTemplate>
<%--                            <ItemStyle Width="300px" />--%>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="DPC Name" ItemStyle-Width="300px">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbdesc" runat="server" CommandArgument='<%# Bind("id") %>' OnClick="lbdesc_Click" Text='<%# Bind("description") %>'></asp:LinkButton>
                                <asp:Label ID="lbldd" runat="server" Text='<%# Bind("DDExcelName") %>' Visible="false"></asp:Label>
                                <asp:Label ID="lblpb" runat="server" Text='<%# Bind("PBExcelName") %>' Visible="false"></asp:Label>
                                <asp:Label ID="lblcommon" runat="server" Text='<%# Bind("CommonDPCExcel") %>' Visible="false"> </asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtdesc" runat="server" Text='<%# Eval("description") %>' ValidationGroup="dpcupdate"></asp:TextBox>
                                <br />
                                <br />
                                <asp:RequiredFieldValidator ID="rbDPCupdate" runat="server" ControlToValidate="txtdesc" ErrorMessage="Required" ForeColor="Red" ValidationGroup="dpccreate"></asp:RequiredFieldValidator>
                                <br />
                            </EditItemTemplate>
                            <ItemStyle Width="300px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="postname" ItemStyle-Width="150px">
                            <ItemTemplate>
                                <asp:Label ID="Label21" runat="server" Text='<%# Eval("postname") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtpostname" runat="server" Text='<%# Eval("postname") %>' ValidationGroup="dpcupdate"></asp:TextBox>
                                <br />
                                <br />
                                <asp:RequiredFieldValidator ID="rbpostnameupdate" runat="server" ControlToValidate="txtpostname" ErrorMessage="Required" ForeColor="Red" ValidationGroup="dpccreate"></asp:RequiredFieldValidator>
                                <br />
                            </EditItemTemplate>
                            <ItemStyle Width="150px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="created date" ItemStyle-Width="150px">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("createddate") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="150px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Deemed Dep. List" ItemStyle-Width="100px">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbddexcel" runat="server" CommandArgument='<%# Bind("dpcid") %>' CssClass="btn-link" OnClick="lbexcel_Click">File Uploaded-1</asp:LinkButton>
                                <%--<asp:Label ID="Label3" runat="server" Text='<%# Bind("DDExcelName") %>'></asp:Label>--%>
                            </ItemTemplate>
                            <ItemStyle Width="200px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="PB Emp. List" ItemStyle-Width="200px">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbpbexcel" runat="server" CommandArgument='<%# Bind("dpcid") %>' OnClick="lbexcel_Click">File Uploaded-2</asp:LinkButton>
                                <%--<asp:Label ID="Label4" runat="server" Text='<%# Bind("PBExcelName") %>'></asp:Label>--%>
                            </ItemTemplate>
                            <ItemStyle Width="200px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderStyle-Width="300px" HeaderText="Common Eligiblity List">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbcommonexcel" runat="server" CommandArgument='<%# Bind("dpcid") %>' OnClick="lbexcel_Click">Download File</asp:LinkButton>
                                <%--<asp:Label ID="Label5" runat="server" Text='<%# Bind("CommonList") %>'></asp:Label>--%>
                            </ItemTemplate>
                            <HeaderStyle Width="300px" />
                            <ItemStyle Width="300px" />
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>

                                <%--                                <asp:LinkButton ID="lbEdit" runat="server" CommandArgument='<%# Bind("id") %>' OnClick="lbEdit_Click">Edit Details</asp:LinkButton>--%>
                                <asp:LinkButton ID="lbDelete" runat="server" CommandArgument='<%# Bind("id") %>' OnClick="lbDelete_Click">Delete</asp:LinkButton>

                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <%--                    <HeaderStyle BackColor="#df5015" Font-Bold="true" ForeColor="White" />--%>
                    <FooterStyle CssClass="bg-white" />
                    <HeaderStyle CssClass="bg-primary"></HeaderStyle>
                </asp:GridView>
            </asp:Panel>
        </div>


        <br />
        <br />
        <div id="divnewdpc" runat="server" class="form-group" visible="false">
            <%--  <div class="row form-control  ">

                <asp:Label ID="Label3" runat="server" Text="Name of the DPC" CssClass="auto-style5"></asp:Label>
                <asp:TextBox ID="txtDPCname" runat="server" ValidationGroup="savedpc"></asp:TextBox>
            </div>--%>
            <div runat="server" id="divaddadpc" class="auto-style6 center-block">
                <h1 class="alert-heading">Add a new Record </h1>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div class="container.container-fluid">
                            <div class="row">
                                <div class="col-sm-6">
                                    <asp:Label ID="Label9" runat="server" Text="Name of the DPC" CssClass="auto-style9"></asp:Label>
                                    <asp:TextBox ID="txtdpcdescr" runat="server" TextMode="MultiLine" ValidationGroup="savedpc" Width="400px" Font-Size="Large"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtdpcdescr" ValidationGroup="savedpc" runat="server" ErrorMessage="*" ForeColor="Red" CssClass="auto-style4"></asp:RequiredFieldValidator>

                                </div>
                                <div class="col-sm-6">
                                    <asp:Label ID="Label4" runat="server" Text="Name of the Post" CssClass="auto-style9"></asp:Label>
                                    <asp:TextBox ID="txtPostName" TextMode="MultiLine" Font-Size="Large" runat="server" ValidationGroup="savedpc" Width="400px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtPostName" Width="400px" ValidationGroup="savedpc" runat="server" ErrorMessage="*" ForeColor="Red" CssClass="auto-style4"></asp:RequiredFieldValidator>

                                </div>

                            </div>
                            <div class="row center-block">
                                <div class="col-sm-12">
                                    <asp:Button ID="btndpcsave" runat="server" CssClass="btn btn-secondary btn-info" Text="Save" Width="200px" ValidationGroup="savedpc" OnClick="btnaddaDPC_Click" Style="font-size: xx-large" />

                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                                <asp:Button ID="lblcancel" runat="server" CssClass="btn btn-secondary btn-warning" Text="Cancel" CausesValidation="false" Width="200px" ValidationGroup="savedpc" OnClick="btnCancel_Click" Style="font-size: xx-large" />
                                </div>
                                <div class="col-sm-12">
                                </div>
                            </div>
                            <%--        <div class="row center-block">
                                
                            </div>ca--%>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:PostBackTrigger ControlID="btndpcsave" />
                    </Triggers>
                </asp:UpdatePanel>
                <br />

            </div>
            <br />
            <div class="row form-control auto-style6" id="divdpcdscr" runat="server" visible="false">

                <asp:Label ID="lbldpcdsr" runat="server" Text="" CssClass="auto-style10"></asp:Label>


                <%-- <asp:Label ID="Label10" runat="server" Text="Name of the Post" CssClass="auto-style5"></asp:Label>
                        :
                <asp:Label ID="lbldpcpost" runat="server" Text=""></asp:Label>--%>
            </div>

            <%--<div class="row form-control">

                <asp:Label ID="Label5" runat="server" Text="DD Emp. Eligibility List" CssClass="auto-style5"></asp:Label>
                <button style="margin-bottom: 10px;" type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModaldd">
                    <i class="fa fa-plus-circle"></i>Upload Excel</button>
                <div class="modal fade" id="myModaldd">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">Deemed Dep. Employee List</h4>
                                <button type="button" class="close" data-dismiss="modal">×</button>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-md-12">
                                        <asp:Panel ID="Panel2" runat="server">
                                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                                <ContentTemplate>
                                                    <div class="row  align-content-center" style="padding: 2px; margin: 2px; background-position: center center; border: thin solid #0000FF;">
                                                        <div>
                                                            <asp:FileUpload ID="FileUpload3" runat="server" class="form-control" />
                                                        </div>
                                                        <div>
                                                                                                                 </div>
                                                        <asp:Label ID="Label8" runat="server"></asp:Label>

                                                        <asp:Button ID="btnpostUpload" CssClass="btn btn-primary pull-right" runat="server"
                                                            Text="Upload" Style="margin: 0.10em;" UseSubmitBehavior="false" OnClick="btnUpload_Click" />
                                                        <button id="btnUploadcancel" class="btn btn-primary pull-right" data-dismiss="modal"
                                                            aria-hidden="true" style="margin: 0.10em;">
                                                            Cancel</button>
                                                    </div>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:PostBackTrigger ControlID="btnpostUpload" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                        </asp:Panel>
                                        <br />



                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
                <button style="margin-bottom: 10px;" type="button" class="btn btn-secondary" data-toggle="modal" data-target="#myModalddview">

                    <i class="fa fa-plus-circle"></i>View data</button>
                <div class="modal fade" id="myModalddview">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">Deemed Dep. Employee List</h4>
                                <button type="button" class="close" data-dismiss="modal">×</button>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-md-12">
                                        <asp:GridView ID="GridView3" ShowHeader="true" HeaderStyle-CssClass="bg-primary text-white" ShowHeaderWhenEmpty="true" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered">
                                            <EmptyDataTemplate>
                                                <div class="text-center">No record found</div>
                                            </EmptyDataTemplate>
                                            <Columns>
                                                <asp:BoundField HeaderText="SNO" DataField="SNO" />
                                                <asp:BoundField HeaderText="NAME" DataField="Name" />
                                                <asp:BoundField HeaderText="EMPNO" DataField="EMPNO" />
                                                <asp:BoundField HeaderText="DOB" DataField="DOB" />

                                                <asp:BoundField HeaderText="Date of Joining Service" DataField="Date of Joining Service" />
                                                <asp:BoundField HeaderText="Date of Joining Post in the Zone" DataField="Date of Joining Post in the Zone" />
                                                <asp:BoundField HeaderText="CAT" DataField="CAT" />
                                                <asp:BoundField HeaderText="STATION" DataField="STATION" />
                                                <asp:BoundField HeaderText="REMARKS" DataField="REMARKS" />
                                                <asp:BoundField HeaderText="HRISCode" DataField="HRISCode" />
                                                <asp:BoundField HeaderText="EmpType" DataField="EmpType" />

                                            </Columns>
                                        </asp:GridView>

                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>


            </div>--%>
            <%--           <div class="row form-control  ">

                <asp:Label ID="Label6" runat="server" Text="PB Emp. Eligibility List" CssClass="auto-style5"></asp:Label>
            </div>
            <div class="row form-control  ">--%>
        </div>


        <div class="border-warning align-self-lg-center" runat="server" align="center" id="divuploadexcel" visible="false">
            <div>
                <strong>
                    <asp:Label ID="Label3" runat="server" Text="All the Dates in the uploaded Excel file must be in 'YYYY-MM-DD' format only." CssClass="auto-style11"></asp:Label>
                </strong>
            </div>
            <div class="row table-bordered fa-upload border fa-align-center" style="padding: 5px; margin: 5px; border: thick solid #00FFFF;">
                <div class="col-10">
                    <asp:Label ID="lbluploadexceltext" runat="server" Text="" CssClass="auto-style2"></asp:Label>
                    <br />

                </div>
                <div class="row table-bordered fa-upload border fa-align-right" style="padding: 5px; margin: 5px; border: thick solid;">

                    <asp:LinkButton ID="lbclose" Font-Size="Large" BackColor="PaleVioletRed" runat="server" OnClick="btnCancel_Click" Visible="false">close</asp:LinkButton>
                </div>
                <%--   <div class="col-10">
                    <asp:LinkButton ID="lbsampledownload" runat="server" OnClick="exporttoexcelsample">Download Blank Excel</asp:LinkButton>
                </div>--%>
                <br />

                <div runat="server" id="divuploadddexcel" width="35%" class="card-header border-1 text-uppercase bottom-right fa-align-left " style="table-layout: fixed; border-style: solid; border-width: thick; border-color: Blue;">

                    <h1>Deemed Deputation Employees List </h1>
                    <div class="col-md-12">
                        <div class="row  align-content-center" style="padding: 2px; margin: 2px; background-position: center center; border: thin solid #0000FF;">
                            <div>
                                <asp:FileUpload ID="FileUpload1" runat="server" class="form-control" />
                            </div>
                            <div>

                                <asp:Button ID="btnUpload" runat="server" class="form-control " CssClass="btn btn-outline-dark alert-danger" Text="Upload" OnClick="btnUpload_Click" />
                            </div>
                            <asp:Label ID="lblMessage" runat="server"></asp:Label>
                            <asp:Label ID="lblExcelName" runat="server"></asp:Label>
                        </div>

                        <%--
                        <div class="card-body" visible="false">
                            
                            <button visible="false" style="margin-bottom: 10px;" type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal" >
                                <i class="fa fa-plus-circle" visible="false"></i>View Excel (Deeemed Dep. Employee)</button>
                            <div class="modal fade" id="myModal">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h4 class="modal-title">Deemed Dep. Employee List</h4>
                                            <button type="button" class="close" data-dismiss="modal">×</button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <asp:GridView ID="GridView1" ShowHeader="true" HeaderStyle-CssClass="bg-primary text-white" ShowHeaderWhenEmpty="true" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered">
                                                        <EmptyDataTemplate>
                                                            <div class="text-center">No record found</div>
                                                        </EmptyDataTemplate>
                                                        <Columns>
                                                            <asp:BoundField HeaderText="SNO" DataField="SNO" />
                                                            <asp:BoundField HeaderText="NAME" DataField="Name" />
                                                            <asp:BoundField HeaderText="EMPNO" DataField="EMPNO" />
                                                            <asp:BoundField HeaderText="DOB" DataField="DOB" />

                                                            <asp:BoundField HeaderText="Date of Joining Service" DataField="Date of Joining Service" />
                                                            <asp:BoundField HeaderText="Date of Joining Post in the Zone" DataField="Date of Joining Post in the Zone" />
                                                            <asp:BoundField HeaderText="CAT" DataField="CAT" />
                                                            <asp:BoundField HeaderText="STATION" DataField="STATION" />
                                                            <asp:BoundField HeaderText="REMARKS" DataField="REMARKS" />
                                                            <asp:BoundField HeaderText="HRISCode" DataField="HRISCode" />
                                                            <asp:BoundField HeaderText="EmpType" DataField="EmpType" />

                                                        </Columns>
                                                    </asp:GridView>
                                                    <%--                  <div class="form-group">
                                        <label>Choose excel file</label>
                                        <div class="input-group">
                                            <div class="custom-file">
                                                <asp:FileUpload ID="FileUpload1" CssClass="custom-file-input" runat="server" />
                                                <label class="custom-file-label"></label>
                                            </div>
                                            <label id="filename"></label>
                                            <div class="input-group-append">
                                                <asp:Button ID="Button1" runat="server" CssClass="btn btn-outline-primary" Text="Upload" OnClick="btnUpload_Click" />
                                            </div>
                                        </div>
                                        <asp:Label ID="lblMessage1" runat="server"></asp:Label>
                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        --%>
                    </div>
                </div>
                <div runat="server" id="div1" width="30%" class="card-header bg-light text-uppercase fa-align-right align-content-lg-center align-content-center" style="table-layout: fixed; border-style: solid; border-width: unset; border-color: yellow">

                    <br />
                    <br />
                    <br />
                </div>
                <div runat="server" id="divuploadpbexcel" width="35%" class="card-header bg-light text-uppercase fa-align-right align-content-lg-center align-content-center" style="table-layout: fixed; border-style: solid; border-width: thick; border-color: green">
                    <h1>Prasar Bharati Employees List </h1>
                    <div class="col-md-12">
                        <div class="row  align-content-center" style="padding: 2px; margin: 2px; background-position: center center; border: thin solid #0000FF;">
                            <div>
                                <asp:FileUpload ID="FileUpload2" runat="server" class="form-control " />
                            </div>
                            <div>

                                <asp:Button ID="btnUploadPB" runat="server" class="form-control " CssClass="btn btn-outline-dark alert-primary" Text="Upload" OnClick="btnUploadPB_Click" />
                            </div>
                            <asp:Label ID="lblmessagepb" runat="server"></asp:Label>
                        </div>


                        <asp:GridView ID="GridView1" runat="server" Visible="false"></asp:GridView>
                        <asp:GridView ID="GridView2" runat="server" Visible="false"></asp:GridView>

                        <%--       <div class="card-body" visible="false">

                            <button  visible="false" style="margin-bottom: 10px;" type="button" class="btn btn-primary" visible="false" data-toggle="modal" data-target="#myModalPB">
                                <i class="fa fa-plus-circle" visible="false"></i>View Excel (PB Employee)
                            </button>
                            <div class="modal fade" id="myModalPB">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title">PB Employee List</h5>
                                            <button type="button" class="close" data-dismiss="modal">×</button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="row">
                                                <div class="col-md-12">

                                                    <asp:GridView ID="GridView2" ShowHeader="true" HeaderStyle-CssClass="bg-primary text-white" AutoGenerateColumns="false" ShowHeaderWhenEmpty="true" runat="server" CssClass="table table-bordered">
                                                        <EmptyDataTemplate>
                                                            <div class="text-center">No record found</div>
                                                        </EmptyDataTemplate>
                                                        <Columns>
                                                            <asp:BoundField HeaderText="SNO" DataField="SNO" />
                                                            <asp:BoundField HeaderText="NAME" DataField="Name" />
                                                            <asp:BoundField HeaderText="EMPNO" DataField="EMPNO" />
                                                            <asp:BoundField HeaderText="DOB" DataField="DOB" />

                                                            <asp:BoundField HeaderText="Date of Joining Service" DataField="Date of Joining Service" />
                                                            <asp:BoundField HeaderText="Date of Joining Post in the Zone" DataField="Date of Joining Post in the Zone" />
                                                            <asp:BoundField HeaderText="CAT" DataField="CAT" />
                                                            <asp:BoundField HeaderText="STATION" DataField="STATION" />
                                                            <asp:BoundField HeaderText="REMARKS" DataField="REMARKS" />
                                                            <asp:BoundField HeaderText="HRISCode" DataField="HRISCode" />
                                                            <asp:BoundField HeaderText="EmpType" DataField="EmpType" />

                                                        </Columns>
                                                    </asp:GridView>
                                                    <%--                  <div class="form-group">
                                        <label>Choose excel file</label>
                                        <div class="input-group">
                                            <div class="custom-file">
                                                <asp:FileUpload ID="FileUpload1" CssClass="custom-file-input" runat="server" />
                                                <label class="custom-file-label"></label>
                                            </div>
                                            <label id="filename"></label>
                                            <div class="input-group-append">
                                                <asp:Button ID="Button1" runat="server" CssClass="btn btn-outline-primary" Text="Upload" OnClick="btnUpload_Click" />
                                            </div>
                                        </div>
                                        <asp:Label ID="lblMessage1" runat="server"></asp:Label>
                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>--%>
                    </div>
                </div>
                <div class="col-12 ">
                    <br />
                    <asp:Button ID="btnGenerateList" CssClass="btn btn-secondary btn-outline-success info" runat="server" Text="Generate Commom Seniority List" OnClick="btnGenerateList_Click" Style="font-size: x-large" />
                </div>
            </div>

        </div>

    </div>
</asp:Content>
