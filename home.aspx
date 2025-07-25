<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="PrasarNet.home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <title>DEMO</title>
    <meta content="width=device-width, initial-scale=1" name="viewport" />
    <link href="static/css/bootstrap.min.css" rel="stylesheet" />
    <link href="static/css/custom.css" rel="stylesheet" />
    <link href="static/css/font-awesome.min.css" rel="stylesheet" />
    <script src="static/js/jquery.min.js" type="text/javascript"></script>
    <script src="static/js/popper.min.js" type="text/javascript"></script>
    <script src="static/js/bootstrap.min.js" type="text/javascript"></script>

   
        .tile {
            height: 200px;
            width: 200px;
            margin: 20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentSection" runat="server">
    <div id="main-card" class="card">
        <div class="card-body">
            <h3 class="text-center">User Authentication/Profile Details</h3>
        
           
              
                 

                <div>
 
    </div>
            <table border="0" cellpadding="5" cellspacing="0" width="500" class="text-left">
                <tr>
                    <td>
                        <table cellpadding="10" cellspacing="0" width="500" class="alert alert-success">
                            <tr>
                                <td width="40%" class="font-weight-bold">Client Registered with</td>
                                <td class="value">Parichay</td>
                            </tr>
                            <!--<tr>-->
                                <!--<td class="font-weight-bold">Token issued by</td>-->
                                <!--<td class="value">{{data.data.signature.issuer}}</td>-->
                            <!--</tr>-->
                        </table>
                    </td>
                </tr>
                <tr>



                    <td style="padding-left:15px;">
                        <table border="0" cellpadding="2" cellspacing="0" width="500" class="text-left">

                            <tr>
                                
                                <td width="40%" class="font-weight-bold text-primary">Login Id</td>
                                <td class="value"><% Response.Write(Session["Name"]); %> </td>
                            </tr>
                           <%-- <tr>
                                <td class="font-weight-bold text-primary">Employee Id</td>
                                <td class="value"><% Response.Write(Session["employeeCode"]); %></td>
                            </tr>--%>
                            <tr>
                                <td class="font-weight-bold text-primary">SSO Id</td>
                                <td class="value"><% Response.Write(Session["parichayId"]); %></td>
                            </tr>

                            <tr>
                                <td class="font-weight-bold text-primary">Name</td>
                                <td class="value"><% Response.Write(Session["fullName"]); %></td>
                            </tr>
                            <tr>
                                <td class="font-weight-bold text-primary">department</td>
                                <td class="value"><% Response.Write(Session["dept"]); %></td>
                            </tr>
                            <tr>
                                <td class="font-weight-bold text-primary">Mobile Number</td>
                                <td class="value"><% Response.Write(Session["mobileNo"]); %></td>
                            </tr>
                            <tr>
                                <td class="font-weight-bold text-primary">Email</td>
                                <td class="value"><% Response.Write(Session["email"]); %></td>
                            </tr>

                                    </table>
                                </td>

                            </tr>


            </table>

                 <div class="d-flex my-4">
                <asp:Button ID="sessionTimeOutApi" runat="server" CssClass="btn btn-secondary ml-2 deep-purple form-control" Text="sessionTimeOutApi" OnClick="sessionTimeOutAPI_Click" />
                <asp:Button ID="sessionTimeOut" runat="server" CssClass="btn btn-secondary ml-2 deep-purple form-control" Text="sessionTimeOutWeb" OnClick="sessionTimeOut_Click" />
                <asp:Button ID="tokenValidatebtn" runat="server" CssClass="btn btn-secondary ml-2 deep-purple form-control" Text="tokenValidate" OnClick="tokenValidate_Click" />

                <asp:Button ID="logoutAPI" runat="server" CssClass="btn btn-secondary ml-2 deep-purple form-control" Text="Logout API" OnClick="logoutAPI_Click" />
             <asp:Button ID="logoutWeb" runat="server" CssClass="btn btn-secondary ml-2 deep-purple form-control" Text="Logout Web" OnClick="logoutWEB_Click" />
                 </div>
            
        </div>
        <div>
            <br />
            <asp:Button runat="server"  ID="btnPrasarNet" CssClass="btn btn-primary tile" OnClick="btnPrasarNet_Click" Text="Prasar Net " />
          
            <br />
        </div>
    </div>
</asp:Content>
