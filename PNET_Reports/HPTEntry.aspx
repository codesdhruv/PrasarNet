<%@ Page Title="" Language="C#" MasterPageFile="~/PNET_Reports/MonthlyReportsEntry.Master" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeBehind="HPTEntry.aspx.cs" Inherits="PrasarNet.PNET_Reports.WebForm1" %>

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

        // Compare Monthly Actual Programme Hours with Monthly Scheduled Programme Hours

        function CompareActualwithSchedule() {
            var txtactual = document.getElementById('<%=txtactual.ClientID%>').value;
            var txtscheduled = document.getElementById('<%=txtscheduled.ClientID%>').value;
            if (parseFloat(txtactual) > parseFloat(txtscheduled)) {
                alert("Monthly Actual Programme Hours cannot be Greater Than Monthly Scheduled Programme Hours");

                document.getElementById('<%=txtactual.ClientID%>').value = "";
                document.getElementById('<%=txtactual.ClientID%>').focus();
            }
            else {

            }
            return false;
        }

    </script>


</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">

        <ContentTemplate>


            <section class="wrapper">
                <section class="page_head">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12">
                                <h2>Entry Form for HPT</h2>
                                <nav id="breadcrumbs">
                                    <ul>
                                        <li>Welcome :</li>
                                        <li>
                                            <label id="lblloginstation" runat="server"></label>
                                        </li>
                                        <li><a href="#">HPT Monthly Reports</a></li>

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

                                                            <asp:DropDownList ID="ddlyear" runat="server" CssClass="form-control"></asp:DropDownList>

                                                        </div>

                                                        <div class="col-lg-1 ">
                                                            <h4>Month</h4>
                                                        </div>


                                                        <div class="col-lg-3">

                                                            <asp:DropDownList ID="ddlmonth" runat="server" CssClass="form-control"></asp:DropDownList>

                                                        </div>


                                                        <div class="col-lg-1 ">
                                                            <h4>Zone</h4>
                                                        </div>


                                                        <div class="col-lg-2">

                                                            <asp:DropDownList ID="ddlzone" runat="server" AutoPostBack="true" CssClass="form-control" OnSelectedIndexChanged="ddlzone_SelectedIndexChanged"></asp:DropDownList>

                                                        </div>


                                                    </div>

                                                    <div class="row col-lg-12">

                                                        <div class="col-lg-1">
                                                            <h4>State</h4>
                                                        </div>


                                                        <div class="col-lg-3 ">

                                                            <asp:DropDownList ID="ddlstate" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlstate_SelectedIndexChanged"></asp:DropDownList>

                                                        </div>



                                                        <div class="col-lg-1 ">
                                                            <h4>Station</h4>
                                                        </div>


                                                        <div class="col-lg-3">

                                                            <asp:DropDownList ID="ddlstation" runat="server" CssClass="form-control"></asp:DropDownList>

                                                        </div>


                                                        <div class="col-lg-1 ">
                                                            <h4>Services</h4>
                                                        </div>


                                                        <div class="col-lg-2">

                                                            <asp:DropDownList ID="ddlservices" AutoPostBack="true" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlservices_SelectedIndexChanged"></asp:DropDownList>

                                                        </div>


                                                    </div>

                                                    <div class="row col-lg-12">

                                                        <div class="col-lg-1">
                                                            <h4>Station Name</h4>
                                                        </div>


                                                        <div class="col-lg-3 ">

                                                            <asp:DropDownList ID="ddlstationname" runat="server" AutoPostBack="true" CssClass="form-control" Enabled="false"></asp:DropDownList>

                                                        </div>


                                                        <div class="col-lg-1">
                                                        </div>


                                                        <div class="col-lg-3 ">
                                                        </div>

                                                        <div class="col-lg-1">
                                                        </div>


                                                        <div class="col-lg-3 ">
                                                        </div>


                                                    </div>


                                                </div>
                                            </div>
                                        </section>

                                    </fieldset>

                                    <br />

                                    <fieldset class="well">
                                        <legend class="well-legend">Prog in Hrs. & Power</legend>

                                        <section class="page_head" style="width: 100%;">
                                            <div class="container">

                                                <div class="row">

                                                    <div class="row col-lg-12">


                                                        <div class="col-lg-2 ">
                                                            <h4>Monthly Scheduled Prog.(In Hrs.)</h4>
                                                        </div>


                                                        <div class="col-lg-2">

                                                            <asp:TextBox ID="txtscheduled" runat="server" CssClass="form-control" Width="52%" MaxLength="6" OnTextChanged="txtscheduled_TextChanged" AutoPostBack="true"></asp:TextBox>

                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatortxtscheduled" runat="server" ControlToValidate="txtscheduled" ErrorMessage="Monthly Scheduled Prog.(In Hrs.)" Display="None"> </asp:RequiredFieldValidator>
                                                            <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCallouttxtscheduled" runat="server" TargetControlID="RequiredFieldValidatortxtscheduled"></ajaxToolkit:ValidatorCalloutExtender>
                                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxtxtscheduled" runat="server" TargetControlID="txtscheduled" ValidChars=".0123456789"></ajaxToolkit:FilteredTextBoxExtender>
                                                          <%--  <ajaxToolkit:TextBoxWatermarkExtender ID="TextBoxWatermarkscheduled" runat="server" TargetControlID="txtscheduled" WatermarkCssClass="Watermark" WatermarkText="In Hrs." />--%>

                                                        </div>

                                                        <div class="col-lg-2 ">
                                                            <h4>Monthly Actual Prog.(In Hrs.)</h4>
                                                        </div>


                                                        <div class="col-lg-2">

                                                            <asp:TextBox ID="txtactual" runat="server" Width="52%" CssClass="form-control" MaxLength="6" onkeyup="CompareActualwithSchedule();"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatortxtactual" runat="server" ControlToValidate="txtactual" ErrorMessage="Actual Prog.(In Hrs.)" Display="None"> </asp:RequiredFieldValidator>
                                                            <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtendertxtactual" runat="server" TargetControlID="RequiredFieldValidatortxtactual"></ajaxToolkit:ValidatorCalloutExtender>
                                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtendertxtactual" runat="server" TargetControlID="txtactual" ValidChars=".0123456789"></ajaxToolkit:FilteredTextBoxExtender>
                                                           <%-- <ajaxToolkit:TextBoxWatermarkExtender ID="TextBoxWatermarkactual" runat="server" TargetControlID="txtactual" WatermarkCssClass="Watermark" WatermarkText="In Hrs." />--%>

                                                        </div>


                                                        <div class="col-lg-2 ">
                                                            <h4>Progressive Scheduled Prog.(In Hrs.)</h4>
                                                        </div>


                                                        <div class="col-lg-2">

                                                            <asp:TextBox ID="Txtprogschdproghrs" runat="server" Width="52%" CssClass="form-control" MaxLength="6" AutoPostBack="true" OnTextChanged="Txtprogschdproghrs_TextChanged"></asp:TextBox>

                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtprogschdproghrs" runat="server" ControlToValidate="Txtprogschdproghrs" ErrorMessage="Progressive Scheduled Prog.(In Hrs.)" Display="None"> </asp:RequiredFieldValidator>
                                                            <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtprogschdproghrs" runat="server" TargetControlID="RequiredFieldValidatorTxtprogschdproghrs"></ajaxToolkit:ValidatorCalloutExtender>
                                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtprogschdproghrs" runat="server" TargetControlID="Txtprogschdproghrs" ValidChars=".0123456789"></ajaxToolkit:FilteredTextBoxExtender>
                                                          <%--  <ajaxToolkit:TextBoxWatermarkExtender ID="TextBoxWatermarkExtenderTxtprogschdproghrs" runat="server" TargetControlID="Txtprogschdproghrs" WatermarkCssClass="Watermark" WatermarkText="In Hrs." />--%>

                                                        </div>


                                                    </div>

                                                </div>

                                            </div>

                                        </section>

                                        <section class="page_head" style="width: 100%;">
                                            <div class="container">

                                                <div class="row">

                                                    <div class="row col-lg-12">


                                                        <div class="col-lg-1">
                                                            <h4>Rated Power of Transmitter(In kW)</h4>
                                                        </div>


                                                        <div class="col-lg-2 ">

                                                            <asp:TextBox ID="txttransmitter" runat="server" Width="52%" CssClass="form-control" MaxLength="6"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatortxttransmitter" runat="server" ControlToValidate="txttransmitter" ErrorMessage="Rated Power of Transmitter(In KW)" Display="None"> </asp:RequiredFieldValidator>
                                                            <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtendertxttransmitter" runat="server" TargetControlID="RequiredFieldValidatortxttransmitter"></ajaxToolkit:ValidatorCalloutExtender>
                                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtendertxttransmitter" runat="server" TargetControlID="txttransmitter" ValidChars=".0123456789"></ajaxToolkit:FilteredTextBoxExtender>
                                                           <%-- <ajaxToolkit:TextBoxWatermarkExtender ID="TextBoxWatermarktransmitter" runat="server" TargetControlID="txttransmitter" WatermarkCssClass="Watermark" WatermarkText="In KW" />--%>

                                                        </div>


                                                        <div class="col-lg-1 ">
                                                            <h4>Radiated Power (Peak)(In KW)</h4>
                                                        </div>


                                                        <div class="col-lg-2">

                                                            <asp:TextBox ID="txtradiated" runat="server" Width="52%" CssClass="form-control" MaxLength="6"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatortxtradiated" runat="server" ControlToValidate="txtradiated" ErrorMessage="Radiated Power (Peak)(In KW)" Display="None"> </asp:RequiredFieldValidator>
                                                            <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtendertxtradiated" runat="server" TargetControlID="RequiredFieldValidatortxtradiated"></ajaxToolkit:ValidatorCalloutExtender>
                                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtendertxtradiated" runat="server" TargetControlID="txtradiated" ValidChars=".0123456789"></ajaxToolkit:FilteredTextBoxExtender>
                                                          <%--  <ajaxToolkit:TextBoxWatermarkExtender ID="TextBoxWatermarkradiated" runat="server" TargetControlID="txtradiated" WatermarkCssClass="Watermark" WatermarkText="In KW" />--%>

                                                        </div>

                                                        <div class="col-lg-1 ">
                                                            <h4></h4>
                                                        </div>


                                                        <div class="col-lg-3">
                                                        </div>

                                                    </div>

                                                </div>
                                            </div>
                                        </section>


                                    </fieldset>


                                    <br />
                                    <fieldset class="well">
                                        <legend class="well-legend">Breakdown</legend>

                                        <section class="page_head" style="width: 100%;">
                                            <div class="container">

                                                <div class="row">

                                                    <div class="row col-lg-12">



                                                        <div class="col-lg-2 ">
                                                            <h4>PS(Current Month)</h4>
                                                        </div>


                                                        <div class="col-lg-3">

                                                            <asp:TextBox ID="Txtpshrscurrent" runat="server" MaxLength="6" AutoPostBack="true" OnTextChanged="Txtpshrscurrent_TextChanged" Width="20%"></asp:TextBox>Hrs.
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtpshrscurrent" runat="server" ControlToValidate="Txtpshrscurrent" ErrorMessage="PS Hrs. (Current)" Display="None"> </asp:RequiredFieldValidator>
                                                            <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtpshrscurrent" runat="server" TargetControlID="RequiredFieldValidatorTxtpshrscurrent"></ajaxToolkit:ValidatorCalloutExtender>
                                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtpshrscurrent" runat="server" TargetControlID="Txtpshrscurrent" ValidChars="0123456789"></ajaxToolkit:FilteredTextBoxExtender>


                                                            <asp:TextBox ID="Txtpsmincurrent" runat="server" MaxLength="6" AutoPostBack="true" OnTextChanged="Txtpsmincurrent_TextChanged" Width="20%"></asp:TextBox>Min.
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtpsmincurrent" runat="server" ControlToValidate="Txtpsmincurrent" ErrorMessage="PS Min. (Current)" Display="None"> </asp:RequiredFieldValidator>
                                                            <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtpsmincurrent" runat="server" TargetControlID="RequiredFieldValidatorTxtpsmincurrent"></ajaxToolkit:ValidatorCalloutExtender>
                                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtpsmincurrent" runat="server" TargetControlID="Txtpsmincurrent" ValidChars="0123456789"></ajaxToolkit:FilteredTextBoxExtender>

                                                            <br />

                                                            <asp:TextBox ID="Txtpscurrent" runat="server" CssClass="form-control" Enabled="false" MaxLength="6" OnTextChanged="Txtpscurrent_TextChanged" Width="52%"></asp:TextBox>% Breakdown
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtpscurrent" runat="server" ControlToValidate="Txtpscurrent" ErrorMessage="PS(Current)" Display="None"> </asp:RequiredFieldValidator>
                                                            <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtpscurrent" runat="server" TargetControlID="RequiredFieldValidatorTxtpscurrent"></ajaxToolkit:ValidatorCalloutExtender>
                                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtpscurrent" runat="server" TargetControlID="Txtpscurrent" ValidChars=".0123456789"></ajaxToolkit:FilteredTextBoxExtender>

                                                        </div>

                                                        <div class="col-lg-2 ">
                                                            <h4>PS(Progressive)</h4>
                                                        </div>


                                                        <div class="col-lg-3">

                                                            <asp:TextBox ID="Txtpshrsprogressive" runat="server" MaxLength="6" AutoPostBack="true" Width="20%" OnTextChanged="Txtpshrsprogressive_TextChanged"></asp:TextBox>Hrs.
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtpshrsprogressive" runat="server" ControlToValidate="Txtpshrsprogressive" ErrorMessage="PS Hrs. (Progressive)" Display="None"> </asp:RequiredFieldValidator>
                                                            <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtpshrsprogressive" runat="server" TargetControlID="RequiredFieldValidatorTxtpshrsprogressive"></ajaxToolkit:ValidatorCalloutExtender>
                                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtpshrsprogressive" runat="server" TargetControlID="Txtpshrsprogressive" ValidChars="0123456789"></ajaxToolkit:FilteredTextBoxExtender>


                                                            <asp:TextBox ID="Txtpsminprogressive" runat="server" MaxLength="6" AutoPostBack="true" Width="20%" OnTextChanged="Txtpsminprogressive_TextChanged"></asp:TextBox>Min.
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtpsminprogressive" runat="server" ControlToValidate="Txtpsminprogressive" ErrorMessage="PS Min. (Progressive)" Display="None"> </asp:RequiredFieldValidator>
                                                            <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtpsminprogressive" runat="server" TargetControlID="RequiredFieldValidatorTxtpsminprogressive"></ajaxToolkit:ValidatorCalloutExtender>
                                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtpsminprogressive" runat="server" TargetControlID="Txtpsminprogressive" ValidChars="0123456789"></ajaxToolkit:FilteredTextBoxExtender>


                                                            <asp:TextBox ID="Txtpsprogressive" runat="server" CssClass="form-control" Enabled="false" MaxLength="6" Width="52%"></asp:TextBox>% Breakdown
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtpsprogressive" runat="server" ControlToValidate="Txtpsprogressive" ErrorMessage="PS(Progressive)" Enabled="false" Display="None"> </asp:RequiredFieldValidator>
                                                            <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtpsprogressive" runat="server" TargetControlID="RequiredFieldValidatorTxtpsprogressive"></ajaxToolkit:ValidatorCalloutExtender>
                                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtpsprogressive" runat="server" TargetControlID="Txtpsprogressive" ValidChars=".0123456789"></ajaxToolkit:FilteredTextBoxExtender>


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
                                                            <h4>Gear(Current Month)</h4>
                                                        </div>


                                                        <div class="col-lg-3">

                                                            <asp:TextBox ID="Txtgearhrscurrent" runat="server" MaxLength="6" AutoPostBack="true" Width="20%" OnTextChanged="Txtgearhrscurrent_TextChanged"></asp:TextBox>Hrs.
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtgearhrscurrent" runat="server" ControlToValidate="Txtgearhrscurrent" ErrorMessage="Gear Hrs. (Current)" Display="None"> </asp:RequiredFieldValidator>
                                                            <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtgearhrscurrent" runat="server" TargetControlID="RequiredFieldValidatorTxtgearhrscurrent"></ajaxToolkit:ValidatorCalloutExtender>
                                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtgearhrscurrent" runat="server" TargetControlID="Txtgearhrscurrent" ValidChars="0123456789"></ajaxToolkit:FilteredTextBoxExtender>


                                                            <asp:TextBox ID="Txtgearmincurrent" runat="server" MaxLength="6" AutoPostBack="true" OnTextChanged="Txtgearmincurrent_TextChanged" Width="20%"></asp:TextBox>Min.
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtgearmincurrent" runat="server" ControlToValidate="Txtgearmincurrent" ErrorMessage="Gear Min. (Current)" Display="None"> </asp:RequiredFieldValidator>
                                                            <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtgearmincurrent" runat="server" TargetControlID="RequiredFieldValidatorTxtgearmincurrent"></ajaxToolkit:ValidatorCalloutExtender>
                                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtgearmincurrent" runat="server" TargetControlID="Txtgearmincurrent" ValidChars="0123456789"></ajaxToolkit:FilteredTextBoxExtender>

                                                            <br />


                                                            <asp:TextBox ID="Txtgearcurrent" runat="server" Enabled="false" CssClass="form-control" MaxLength="6" OnTextChanged="Txtgearcurrent_TextChanged" AutoPostBack="true" Width="52%"></asp:TextBox>% Breakdown
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtgearcurrent" runat="server" ControlToValidate="Txtgearcurrent" ErrorMessage="Gear(Current)" Display="None"> </asp:RequiredFieldValidator>
                                                            <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtgearcurrent" runat="server" TargetControlID="RequiredFieldValidatorTxtgearcurrent"></ajaxToolkit:ValidatorCalloutExtender>
                                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtgearcurrent" runat="server" TargetControlID="Txtgearcurrent" ValidChars=".0123456789"></ajaxToolkit:FilteredTextBoxExtender>


                                                        </div>

                                                        <div class="col-lg-2 ">
                                                            <h4>Gear(Progressive)</h4>
                                                        </div>


                                                        <div class="col-lg-3">


                                                            <asp:TextBox ID="Txtgearhrsprogressive" runat="server" MaxLength="6" AutoPostBack="true" Width="20%" OnTextChanged="Txtgearhrsprogressive_TextChanged"></asp:TextBox>Hrs.
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtgearhrsprogressive" runat="server" ControlToValidate="Txtgearhrsprogressive" ErrorMessage="Gear Hrs. (Progressive)" Display="None"> </asp:RequiredFieldValidator>
                                                            <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtgearhrsprogressive" runat="server" TargetControlID="RequiredFieldValidatorTxtgearhrsprogressive"></ajaxToolkit:ValidatorCalloutExtender>
                                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtgearhrsprogressive" runat="server" TargetControlID="Txtgearhrsprogressive" ValidChars="0123456789"></ajaxToolkit:FilteredTextBoxExtender>


                                                            <asp:TextBox ID="Txtgearminprogressive" runat="server" MaxLength="6" AutoPostBack="true" Width="20%" OnTextChanged="Txtgearminprogressive_TextChanged"></asp:TextBox>Min.
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtgearminprogressive" runat="server" ControlToValidate="Txtgearminprogressive" ErrorMessage="Gear Min. (Progressive)" Display="None"> </asp:RequiredFieldValidator>
                                                            <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtgearminprogressive" runat="server" TargetControlID="RequiredFieldValidatorTxtgearminprogressive"></ajaxToolkit:ValidatorCalloutExtender>
                                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtgearminprogressive" runat="server" TargetControlID="Txtgearminprogressive" ValidChars="0123456789"></ajaxToolkit:FilteredTextBoxExtender>


                                                            <asp:TextBox ID="Txtgearprogressive" runat="server" Enabled="false" CssClass="form-control" MaxLength="6" Width="52%"></asp:TextBox>% Breakdown
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtgearprogressive" runat="server" ControlToValidate="Txtgearprogressive" ErrorMessage="Gear(Progressive)" Display="None"> </asp:RequiredFieldValidator>
                                                            <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtgearprogressive" runat="server" TargetControlID="RequiredFieldValidatorTxtgearprogressive"></ajaxToolkit:ValidatorCalloutExtender>
                                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtgearprogressive" runat="server" TargetControlID="Txtgearprogressive" ValidChars=".0123456789"></ajaxToolkit:FilteredTextBoxExtender>


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
                                                            <h4>OC(Current Month)</h4>
                                                        </div>


                                                        <div class="col-lg-3">

                                                            <asp:TextBox ID="Txtochrscurrent" runat="server" MaxLength="6" AutoPostBack="true" Width="20%" OnTextChanged="Txtochrscurrent_TextChanged"></asp:TextBox>Hrs.
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtochrscurrent" runat="server" ControlToValidate="Txtochrscurrent" ErrorMessage="OC Hrs. (Current)" Display="None"> </asp:RequiredFieldValidator>
                                                            <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtochrscurrent" runat="server" TargetControlID="RequiredFieldValidatorTxtochrscurrent"></ajaxToolkit:ValidatorCalloutExtender>
                                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtochrscurrent" runat="server" TargetControlID="Txtochrscurrent" ValidChars="0123456789"></ajaxToolkit:FilteredTextBoxExtender>


                                                            <asp:TextBox ID="Txtocmincurrent" runat="server" MaxLength="6" AutoPostBack="true" OnTextChanged="Txtocmincurrent_TextChanged" Width="20%"></asp:TextBox>Min.
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtocmincurrent" runat="server" ControlToValidate="Txtocmincurrent" ErrorMessage="OC Min. (Current)" Display="None"> </asp:RequiredFieldValidator>
                                                            <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtocmincurrent" runat="server" TargetControlID="RequiredFieldValidatorTxtocmincurrent"></ajaxToolkit:ValidatorCalloutExtender>
                                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtocmincurrent" runat="server" TargetControlID="Txtocmincurrent" ValidChars="0123456789"></ajaxToolkit:FilteredTextBoxExtender>

                                                            <br />

                                                            <asp:TextBox ID="Txtoccurrent" runat="server" CssClass="form-control" Enabled="false" MaxLength="6" Width="52%"></asp:TextBox>% Breakdown
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtoccurrent" runat="server" ControlToValidate="Txtoccurrent" ErrorMessage="OC(Current)" Display="None"> </asp:RequiredFieldValidator>
                                                            <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtoccurrent" runat="server" TargetControlID="RequiredFieldValidatorTxtoccurrent"></ajaxToolkit:ValidatorCalloutExtender>
                                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtoccurrent" runat="server" TargetControlID="Txtgearprogressive" ValidChars=".0123456789"></ajaxToolkit:FilteredTextBoxExtender>

                                                        </div>


                                                        <div class="col-lg-2 ">
                                                            <h4>OC(Progressive)</h4>
                                                        </div>


                                                        <div class="col-lg-3">

                                                            <asp:TextBox ID="Txtochrsprogressive" runat="server" MaxLength="6" AutoPostBack="true" Width="20%" OnTextChanged="Txtochrsprogressive_TextChanged"></asp:TextBox>Hrs.
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtochrsprogressive" runat="server" ControlToValidate="Txtochrsprogressive" ErrorMessage="OC Hrs. (Progressive)" Display="None"> </asp:RequiredFieldValidator>
                                                            <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtochrsprogressive" runat="server" TargetControlID="RequiredFieldValidatorTxtochrsprogressive"></ajaxToolkit:ValidatorCalloutExtender>
                                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtochrsprogressive" runat="server" TargetControlID="Txtochrsprogressive" ValidChars="0123456789"></ajaxToolkit:FilteredTextBoxExtender>


                                                            <asp:TextBox ID="Txtocminprogressive" runat="server" MaxLength="6" AutoPostBack="true" Width="20%" OnTextChanged="Txtocminprogressive_TextChanged"></asp:TextBox>Min.
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtocminprogressive" runat="server" ControlToValidate="Txtocminprogressive" ErrorMessage="OC Min. (Progressive)" Display="None"> </asp:RequiredFieldValidator>
                                                            <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtocminprogressive" runat="server" TargetControlID="RequiredFieldValidatorTxtocminprogressive"></ajaxToolkit:ValidatorCalloutExtender>
                                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtocminprogressive" runat="server" TargetControlID="Txtocminprogressive" ValidChars="0123456789"></ajaxToolkit:FilteredTextBoxExtender>



                                                            <asp:TextBox ID="Txtocprogressive" runat="server" CssClass="form-control" Enabled="false" MaxLength="6" Width="52%"></asp:TextBox>% Breakdown
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtocprogressive" runat="server" ControlToValidate="Txtocprogressive" ErrorMessage="OC(Progressive)" Display="None"> </asp:RequiredFieldValidator>
                                                            <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtocprogressive" runat="server" TargetControlID="RequiredFieldValidatorTxtocprogressive"></ajaxToolkit:ValidatorCalloutExtender>
                                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtocprogressive" runat="server" TargetControlID="Txtocprogressive" ValidChars=".0123456789"></ajaxToolkit:FilteredTextBoxExtender>

                                                        </div>



                                                    </div>

                                                </div>
                                            </div>
                                        </section>

                                    </fieldset>

                                    <fieldset>
                                        <legend></legend>

                                    </fieldset>

                                   <%-- <br />--%>


                                    <fieldset class="well">
                                        <legend class="well-legend">Working Status and Action taken</legend>

                                        <section class="page_head" style="width: 100%;">
                                            <div class="container">

                                                <div class="row">

                                                    <div class="row col-lg-12">



                                                        <div class="col-lg-2 ">
                                                            <h4>Air Conditioning units</h4>
                                                        </div>


                                                        <div class="col-lg-3">

                                                            <asp:DropDownList ID="ddlworkingstatusACU" runat="server" AutoPostBack="true" CssClass="form-control" OnSelectedIndexChanged="ddlworkingstatusACU_SelectedIndexChanged"></asp:DropDownList>

                                                            <asp:TextBox ID="txtairconditioning" runat="server" CssClass="form-control" TextMode="MultiLine" Height="90px"></asp:TextBox>
                                                            <ajaxToolkit:TextBoxWatermarkExtender ID="TextBoxWatermarkairconditioning" runat="server" TargetControlID="txtairconditioning" WatermarkCssClass="Watermark" WatermarkText="Enter Details for Not Working Air Conditioning Units." />

                                                        </div>

                                                        <div class="col-lg-2 ">
                                                            <h4>Power distribution system</h4>
                                                        </div>


                                                        <div class="col-lg-3">

                                                            <asp:DropDownList ID="ddlworkingstatusPDS" runat="server" AutoPostBack="true" CssClass="form-control" OnSelectedIndexChanged="ddlworkingstatusPDS_SelectedIndexChanged"></asp:DropDownList>

                                                            <asp:TextBox ID="txtpowerdistribution" runat="server" CssClass="form-control" TextMode="MultiLine" Height="90px"></asp:TextBox>
                                                            <ajaxToolkit:TextBoxWatermarkExtender ID="TextBoxWatermarkpowerdistribution" runat="server" TargetControlID="txtpowerdistribution" WatermarkCssClass="Watermark" WatermarkText="Enter Details for Not Working power distribution system." />

                                                        </div>






                                                    </div>

                                                </div>
                                            </div>
                                        </section>

                                        <section class="page_head" style="width: 100%;">
                                            <div class="container">

                                                <div class="row">

                                                    <div class="row col-lg-12">



                                                        <div class="col-lg-2">
                                                            <h4>Reason for low power / List of faulty</h4>
                                                        </div>


                                                        <div class="col-lg-8 ">

                                                            <asp:TextBox ID="txtreason" runat="server" CssClass="form-control" TextMode="MultiLine" Height="90px"></asp:TextBox>

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
                                                            <h4>Action taken to repair by Station</h4>
                                                        </div>


                                                        <div class="col-lg-3">

                                                            <asp:TextBox ID="txtrepair" runat="server" CssClass="form-control" TextMode="MultiLine" Height="90px"></asp:TextBox>

                                                        </div>
                                                        <div class="col-lg-2 ">
                                                            <h4>Action taken by Zonal Office</h4>
                                                        </div>


                                                        <div class="col-lg-3">

                                                            <asp:TextBox ID="txtactionzonal" runat="server" Enabled="false" CssClass="form-control" TextMode="MultiLine" Height="90px"></asp:TextBox>

                                                        </div>

                                                        <div class="col-lg-1 ">
                                                            <%-- <h4>Remarks</h4>--%>
                                                        </div>


                                                        <div class="col-lg-3">

                                                            <%-- <asp:TextBox ID="Txtremarks" runat="server" CssClass="form-control" TextMode="MultiLine" Height="90px"></asp:TextBox>--%>
                                                        </div>


                                                    </div>

                                                </div>
                                            </div>
                                        </section>

                                    </fieldset>


                                    <br />
                                    <fieldset class="well">
                                        <legend class="well-legend">Antenna System VSWR</legend>

                                        <section class="page_head" style="width: 100%;">
                                            <div class="container">

                                                <div class="row">

                                                    <div class="row col-lg-12">

                                                        <div class="col-lg-1 ">
                                                            <h4>LB</h4>
                                                        </div>


                                                        <div class="col-lg-3">

                                                            <asp:TextBox ID="Txtantenna_lb" runat="server" Width="52%" CssClass="form-control" MaxLength="6" ></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtantenna_lb" runat="server" ControlToValidate="Txtantenna_lb" ErrorMessage="Enter LB" Display="None"> </asp:RequiredFieldValidator>
                                                            <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtantenna_lb" runat="server" TargetControlID="RequiredFieldValidatorTxtocprogressive"></ajaxToolkit:ValidatorCalloutExtender>
                                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtantenna_lb" runat="server" TargetControlID="Txtantenna_lb" ValidChars=".0123456789"></ajaxToolkit:FilteredTextBoxExtender>
                                                         <%--   <ajaxToolkit:TextBoxWatermarkExtender ID="TextBoxWatermarkantenna_lb" runat="server" TargetControlID="Txtantenna_lb" WatermarkCssClass="Watermark" WatermarkText="Numerals only" />--%>

                                                        </div>
                                                        <div class="col-lg-1 ">
                                                            <h4>UB</h4>
                                                        </div>


                                                        <div class="col-lg-3">

                                                            <asp:TextBox ID="Txtantenna_ub" runat="server" Width="52%" CssClass="form-control" MaxLength="6" OnTextChanged="Txtantenna_ub_TextChanged" AutoPostBack="true"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtantenna_ub" runat="server" ControlToValidate="Txtantenna_ub" ErrorMessage="Enter UB" Display="None"> </asp:RequiredFieldValidator>
                                                            <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtantenna_ub" runat="server" TargetControlID="RequiredFieldValidatorTxtantenna_ub"></ajaxToolkit:ValidatorCalloutExtender>
                                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtantenna_ub" runat="server" TargetControlID="Txtantenna_ub" ValidChars=".0123456789"></ajaxToolkit:FilteredTextBoxExtender>
                                                          <%--  <ajaxToolkit:TextBoxWatermarkExtender ID="TextBoxWatermarkantenna_ub" runat="server" TargetControlID="Txtantenna_ub" WatermarkCssClass="Watermark" WatermarkText="Numerals only" />--%>

                                                        </div>

                                                        <div class="col-lg-1 ">
                                                            <h4>Combined</h4>
                                                        </div>


                                                        <div class="col-lg-2">

                                                            <asp:TextBox ID="Txtantenna_comb" runat="server" Width="52%" Enabled="false" CssClass="form-control" MaxLength="6"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtantenna_comb" runat="server" ControlToValidate="Txtantenna_comb" ErrorMessage="Enter Combined" Display="None"> </asp:RequiredFieldValidator>
                                                            <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtantenna_comb" runat="server" TargetControlID="RequiredFieldValidatorTxtantenna_comb"></ajaxToolkit:ValidatorCalloutExtender>
                                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtantenna_comb" runat="server" TargetControlID="Txtantenna_comb" ValidChars=".0123456789"></ajaxToolkit:FilteredTextBoxExtender>
                                                           
                                                        </div>


                                                    </div>

                                                </div>
                                            </div>
                                        </section>

                                    </fieldset>
                                    <br />
                                    <fieldset class="well">
                                        <legend class="well-legend">Diesel Generator</legend>

                                        <section class="page_head" style="width: 100%;">
                                            <div class="container">

                                                <div class="row">

                                                    <div class="row col-lg-12">

                                                        <div class="col-lg-2">
                                                            <h4>Total Working Hours(Current Month)</h4>
                                                        </div>


                                                        <div class="col-lg-3">

                                                            <asp:TextBox ID="Txtdieselg_twh" runat="server" Width="52%" CssClass="form-control" MaxLength="6" AutoPostBack="true" OnTextChanged="Txtdieselg_twh_TextChanged"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtdieselg_twh" runat="server" ControlToValidate="Txtdieselg_twh" ErrorMessage="Total Working Hours" Display="None"> </asp:RequiredFieldValidator>
                                                            <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtdieselg_twh" runat="server" TargetControlID="RequiredFieldValidatorTxtdieselg_twh"></ajaxToolkit:ValidatorCalloutExtender>
                                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtdieselg_twh" runat="server" TargetControlID="Txtdieselg_twh" ValidChars=".0123456789"></ajaxToolkit:FilteredTextBoxExtender>
                                                         <%--   <ajaxToolkit:TextBoxWatermarkExtender ID="TextBoxWatermarkTxtdieselg_twh" runat="server" TargetControlID="Txtdieselg_twh" WatermarkCssClass="Watermark" WatermarkText="In Hrs." />--%>

                                                        </div>
                                                        <div class="col-lg-2 ">
                                                            <h4>Progressive Utilization(in Hrs.)</h4>
                                                        </div>


                                                        <div class="col-lg-3">

                                                            <asp:TextBox ID="Txtdieselg_progutil" Width="52%" runat="server" CssClass="form-control" MaxLength="6"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtdieselg_progutil" runat="server" ControlToValidate="Txtdieselg_progutil" ErrorMessage="Progressive Utilization(In Hrs.)" Display="None"> </asp:RequiredFieldValidator>
                                                            <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtdieselg_progutil" runat="server" TargetControlID="RequiredFieldValidatorTxtdieselg_progutil"></ajaxToolkit:ValidatorCalloutExtender>
                                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtdieselg_progutil" runat="server" TargetControlID="Txtdieselg_progutil" ValidChars=".0123456789"></ajaxToolkit:FilteredTextBoxExtender>
                                                           <%-- <ajaxToolkit:TextBoxWatermarkExtender ID="TextBoxWatermarkTxtdieselg_progutil" runat="server" TargetControlID="Txtdieselg_progutil" WatermarkCssClass="Watermark" WatermarkText="In Hrs." />--%>

                                                        </div>




                                                    </div>

                                                </div>
                                            </div>
                                        </section>


                                        <section class="page_head" style="width: 100%;">
                                            <div class="container">

                                                <div class="row">

                                                    <div class="row col-lg-12">

                                                        <div class="col-lg-2">
                                                            <h4>Diesel Consumed(Current Month)(in L)</h4>
                                                        </div>


                                                        <div class="col-lg-3">

                                                            <asp:TextBox ID="Txtdieselg_qdc" runat="server" Width="52%" CssClass="form-control" MaxLength="6" OnTextChanged="Txtdieselg_qdc_TextChanged" AutoPostBack="true"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtdieselg_qdc" runat="server" ControlToValidate="Txtdieselg_qdc" ErrorMessage="Quantity of Disel Consumed" Display="None"> </asp:RequiredFieldValidator>
                                                            <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtdieselg_qdc" runat="server" TargetControlID="RequiredFieldValidatorTxtdieselg_qdc"></ajaxToolkit:ValidatorCalloutExtender>
                                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtdieselg_qdc" runat="server" TargetControlID="Txtdieselg_qdc" ValidChars=".0123456789"></ajaxToolkit:FilteredTextBoxExtender>
                                                           <%-- <ajaxToolkit:TextBoxWatermarkExtender ID="TextBoxWatermarkTxtdieselg_qdc" runat="server" TargetControlID="Txtdieselg_qdc" WatermarkCssClass="Watermark" WatermarkText="In L" />--%>

                                                        </div>
                                                        <div class="col-lg-2">
                                                            <h4>Progressive Diesel Consumed(in L)</h4>
                                                        </div>


                                                        <div class="col-lg-3">

                                                            <asp:TextBox ID="TxttotalD" runat="server" Width="52%" CssClass="form-control" MaxLength="6"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxttotalD" runat="server" ControlToValidate="TxttotalD" ErrorMessage="Total Disel Consumed" Display="None"> </asp:RequiredFieldValidator>
                                                            <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxttotalD" runat="server" TargetControlID="RequiredFieldValidatorTxttotalD"></ajaxToolkit:ValidatorCalloutExtender>
                                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxttotalD" runat="server" TargetControlID="TxttotalD" ValidChars=".0123456789"></ajaxToolkit:FilteredTextBoxExtender>
                                                           <%-- <ajaxToolkit:TextBoxWatermarkExtender ID="TextBoxWatermarkExtenderTxttotalD" runat="server" TargetControlID="TxttotalD" WatermarkCssClass="Watermark" WatermarkText="In L" />--%>

                                                        </div>




                                                    </div>

                                                </div>
                                            </div>
                                        </section>

                                    </fieldset>
                                    <br />
                                    <fieldset class="well">
                                        <legend class="well-legend">Power Units</legend>

                                        <section class="page_head" style="width: 100%;">
                                            <div class="container">

                                                <div class="row">

                                                    <div class="row col-lg-12">

                                                        <div class="col-lg-2 ">
                                                            <h4>Electrical Consumption (Current Month)(in kW)</h4>
                                                        </div>


                                                        <div class="col-lg-3">

                                                            <asp:TextBox ID="Txtpoweru_current" runat="server" Width="52%" CssClass="form-control" AutoPostBack="true" MaxLength="6" OnTextChanged="Txtpoweru_current_TextChanged"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtpoweru_current" runat="server" ControlToValidate="Txtpoweru_current" ErrorMessage="Current" Display="None"> </asp:RequiredFieldValidator>
                                                            <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtpoweru_current" runat="server" TargetControlID="RequiredFieldValidatorTxtpoweru_current"></ajaxToolkit:ValidatorCalloutExtender>
                                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtpoweru_current" runat="server" TargetControlID="Txtpoweru_current" ValidChars=".0123456789"></ajaxToolkit:FilteredTextBoxExtender>
                                                          <%--  <ajaxToolkit:TextBoxWatermarkExtender ID="TextBoxWatermarkTxtpoweru_current" runat="server" TargetControlID="Txtpoweru_current" WatermarkCssClass="Watermark" WatermarkText="In kW" />--%>

                                                        </div>
                                                        <div class="col-lg-2 ">
                                                            <h4>Progressive Electrical Consumption(in kW)</h4>
                                                        </div>


                                                        <div class="col-lg-3">

                                                            <asp:TextBox ID="Txtpoweru_prog" runat="server" Width="52%" CssClass="form-control" MaxLength="6"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtpoweru_prog" runat="server" ControlToValidate="Txtpoweru_prog" ErrorMessage="Progressive" Display="None"> </asp:RequiredFieldValidator>
                                                            <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtpoweru_prog" runat="server" TargetControlID="RequiredFieldValidatorTxtpoweru_prog"></ajaxToolkit:ValidatorCalloutExtender>
                                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtpoweru_prog" runat="server" TargetControlID="Txtpoweru_prog" ValidChars=".0123456789"></ajaxToolkit:FilteredTextBoxExtender>
                                                         <%--   <ajaxToolkit:TextBoxWatermarkExtender ID="TextBoxWatermarkTxtpoweru_prog" runat="server" TargetControlID="Txtpoweru_prog" WatermarkCssClass="Watermark" WatermarkText="In kW" />--%>

                                                        </div>

                                                        <div class="col-lg-1 ">
                                                            <h4></h4>
                                                        </div>


                                                        <div class="col-lg-3">
                                                        </div>


                                                    </div>

                                                </div>
                                            </div>
                                        </section>

                                    </fieldset>

                                    <fieldset>
                                        <legend></legend>

                                    </fieldset>

                                    <br />

                                    <section class="page_head" style="width: 100%;">
                                        <div class="container">

                                            <div class="row">

                                                <div class="row col-lg-12">

                                                    <div class="col-lg-1 ">
                                                        <h4>Details of New Equipments Recived</h4>
                                                    </div>


                                                    <div class="col-lg-5">

                                                        <asp:TextBox ID="Txtdetailsnewequipr" runat="server" CssClass="form-control" TextMode="MultiLine" Height="90px"></asp:TextBox>

                                                    </div>

                                                    <div class="col-lg-2 ">
                                                        <h4>Details of Important Workdone/Remarks</h4>
                                                    </div>


                                                    <div class="col-lg-4">

                                                        <asp:TextBox ID="Txtdetailsimpworkr" runat="server" CssClass="form-control" TextMode="MultiLine" Height="90px"></asp:TextBox>

                                                    </div>




                                                </div>

                                            </div>
                                        </div>
                                    </section>

                                    <br />

                                    <section class="page_head" style="width: 100%;">
                                        <div class="container">

                                            <div class="row">

                                                <div class="row col-lg-12">

                                                    <div class="col-lg-1 " id="div_fileText" runat="server">
                                                        <h4>Upload Full Monthly Report</h4>
                                                    </div>


                                                    <div class="col-lg-4" id="div_fileUpload" runat="server">

                                                        <asp:FileUpload ID="FileUploadMR" runat="server" />

                                                    </div>


                                                    <div class="col-lg-7 ">

                                                        <asp:Button ID="Btnsubmit" runat="server" CssClass="btn btn-default btn-lg" Text="Submit" OnClick="Btnsubmit_Click" />
                                                        &nbsp;&nbsp;

                                                        <asp:Button ID="Btnupdate" runat="server" CssClass="btn btn-default btn-lg" Text="Update" OnClick="Btnupdate_Click" />
                                                        &nbsp;&nbsp;

                                                        <asp:Button ID="Btncancel" runat="server" CssClass="btn btn-default btn-lg" Text="Cancel" CausesValidation="false" OnClick="Btncancel_Click" />
                                                        &nbsp;&nbsp;
                                                
                                                    </div>




                                                </div>

                                            </div>
                                        </div>
                                    </section>

                                    <br />



                                    <section class="page_head" style="width: 1140px;">
                                        <div class="container">
                                            <div class="row">



                                                <div class="row col-lg-12" style="margin-top: 0px;">



                                                    <asp:GridView ID="Gridhptrpt" runat="server" AutoGenerateColumns="False" AllowPaging="true" PageSize="2" OnRowCommand="Gridhptrpt_RowCommand" OnRowEditing="Gridhptrpt_RowEditing"
                                                        OnRowDeleting="Gridhptrpt_RowDeleting1" OnPageIndexChanging="Gridhptrpt_PageIndexChanging" CssClass="table" OnRowCreated="Gridhptrpt_RowCreated"
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
                                                                    Station<hr />
                                                                    Services
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblStationName" runat="server" Text='<%# Server.HtmlEncode((string)Eval("StationName").ToString())%>'></asp:Label><hr />
                                                                    <asp:Label ID="lblServices_Name" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Services_Name").ToString())%>'></asp:Label><hr />
                                                                    <%-- <asp:Label ID="lblStation" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Station").ToString())%>'></asp:Label>--%>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>


                                                            <asp:TemplateField>
                                                                <HeaderTemplate>
                                                                    Monthly Schedules Prog(hrs.)
                                                                    <hr />
                                                                    Actual Prog.(hrs.)
                                                                    
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblMonthlySchdProghrs" runat="server" Text='<%# Server.HtmlEncode((string)Eval("MonthlySchdProghrs").ToString())%>'></asp:Label><hr />
                                                                    <asp:Label ID="lblActualProghrs" runat="server" Text='<%# Server.HtmlEncode((string)Eval("ActualProghrs").ToString())%>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField>
                                                                <HeaderTemplate>
                                                                    Rated Power Transmitter<hr />
                                                                    Radiated Power Peak
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblRatedpwrtransmt" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Ratedpwrtransmt").ToString())%>'></asp:Label><hr />
                                                                    <asp:Label ID="lblRadiatedpwrpeak" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Radiatedpwrpeak").ToString())%>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>



                                                            <asp:TemplateField>
                                                                <HeaderTemplate>PS(Current) | (Progressive)</HeaderTemplate>
                                                                <ItemTemplate>

                                                                    <asp:Label ID="lblBDhrsperPS_Current" runat="server" Text='<%# Server.HtmlEncode((string)Eval("BDhrsperPS_Current").ToString())%>'></asp:Label>
                                                                    &nbsp;&nbsp;| &nbsp;&nbsp;<asp:Label ID="LBDhrsperPS_Progressive" runat="server" Text='<%# Server.HtmlEncode((string)Eval("BDhrsperPS_Progressive").ToString())%>'></asp:Label>


                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField>
                                                                <HeaderTemplate>Gear(Current) | Gear(Progressive)</HeaderTemplate>
                                                                <ItemTemplate>


                                                                    <asp:Label ID="LBDhrsperGEAR_Current" runat="server" Text='<%# Server.HtmlEncode((string)Eval("BDhrsperGEAR_Current").ToString())%>'></asp:Label>
                                                                    &nbsp;&nbsp;| &nbsp;&nbsp;<asp:Label ID="LBDhrsperGEAR_Progressive" runat="server" Text='<%# Server.HtmlEncode((string)Eval("BDhrsperGEAR_Progressive").ToString())%>'></asp:Label>

                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField>
                                                                <HeaderTemplate>OC(Current) | OC(Progressive)</HeaderTemplate>
                                                                <ItemTemplate>

                                                                    <asp:Label ID="LBDhrsperOC_Current" runat="server" Text='<%# Server.HtmlEncode((string)Eval("BDhrsperOC_Current").ToString())%>'></asp:Label>
                                                                    &nbsp;&nbsp;| &nbsp;&nbsp;<asp:Label ID="LBDhrsperOC_Progressive" runat="server" Text='<%# Server.HtmlEncode((string)Eval("BDhrsperOC_Progressive").ToString())%>'></asp:Label>

                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField Visible="false">
                                                                <HeaderTemplate>
                                                                    Working Status<br />
                                                                    Air Conditioning System
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblWorkingStatus_NM" runat="server" Text='<%# Server.HtmlEncode((string)Eval("WorkingStatus_NM").ToString())%>'></asp:Label>
                                                                    <hr />
                                                                    <asp:Label ID="lblWorkingstatusAirCond" runat="server" Text='<%# Server.HtmlEncode((string)Eval("WorkingstatusAirCond").ToString())%>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField Visible="false">
                                                                <HeaderTemplate>
                                                                    Working Status
                                        <br />
                                                                    Power Distribution System
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblWorkingStatuspdm" runat="server" Text='<%# Server.HtmlEncode((string)Eval("WorkingstatusPDS").ToString())%>'></asp:Label>
                                                                    <hr />
                                                                    <asp:Label ID="lblWorkingstatusPowrDistSys" runat="server" Text='<%# Server.HtmlEncode((string)Eval("WorkingstatusPowrDistSys").ToString())%>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField Visible="false">
                                                                <HeaderTemplate>
                                                                    Reason for Low Power<br />
                                                                    /List of Faulty
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblReasonlowpwrlistfaulty" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Reasonlowpwrlistfaulty").ToString())%>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField Visible="false">
                                                                <HeaderTemplate>
                                                                    Action taken<br />
                                                                    Station
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblActiontakenStation" runat="server" Text='<%# Server.HtmlEncode((string)Eval("ActiontakenStation").ToString())%>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField Visible="false">
                                                                <HeaderTemplate>
                                                                    Action taken<br />
                                                                    Zonal Office
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblActiontakenZonalOffc" runat="server" Text='<%# Server.HtmlEncode((string)Eval("ActiontakenZonalOffc").ToString())%>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField Visible="false">
                                                                <HeaderTemplate>
                                                                    Antenna SVSWR<br />
                                                                    LB<hr />
                                                                    UB<hr />
                                                                    Combined<hr />
                                                                    Diesel Generated Working Hrs<hr />
                                                                    Progressive Utilization
                                                                    <hr />
                                                                    Consumed
                                                                </HeaderTemplate>
                                                                <ItemTemplate>

                                                                    <asp:Label ID="lblAntennaSVSWR_LB" runat="server" Text='<%# Server.HtmlEncode((string)Eval("AntennaSVSWR_LB").ToString())%>'></asp:Label><hr />
                                                                    &nbsp;&nbsp;<asp:Label ID="LAntennaSVSWR_UB" runat="server" Text='<%# Server.HtmlEncode((string)Eval("AntennaSVSWR_UB").ToString())%>'></asp:Label><hr />

                                                                    <asp:Label ID="LAntennaSVSWR_COMB" runat="server" Text='<%# Server.HtmlEncode((string)Eval("AntennaSVSWR_COMB").ToString())%>'></asp:Label><hr />
                                                                    &nbsp;&nbsp;<asp:Label ID="LDieselG_TWHrs" runat="server" Text='<%# Server.HtmlEncode((string)Eval("DieselG_TWHrs").ToString())%>'></asp:Label><hr />

                                                                    <asp:Label ID="LDieselG_ProgUti" runat="server" Text='<%# Server.HtmlEncode((string)Eval("DieselG_ProgUti").ToString())%>'></asp:Label><hr />
                                                                    &nbsp;&nbsp;<asp:Label ID="LDieselG_QDConsumed" runat="server" Text='<%# Server.HtmlEncode((string)Eval("DieselG_QDConsumed").ToString())%>'></asp:Label>

                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField Visible="false">
                                                                <HeaderTemplate>Remarks</HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblRemarks" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Remarks").ToString())%>'></asp:Label>
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


        </ContentTemplate>

        <Triggers>

            <asp:PostBackTrigger ControlID="Btnsubmit" />
            <asp:AsyncPostBackTrigger ControlID="Btnupdate" EventName="Click" />
            <asp:AsyncPostBackTrigger ControlID="Btncancel" EventName="Click" />


        </Triggers>

    </asp:UpdatePanel>

</asp:Content>
