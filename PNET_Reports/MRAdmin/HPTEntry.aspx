<%@ Page Title="" Language="C#" MasterPageFile="~/PNET_Reports/MRAdmin/MRAdmin.Master" AutoEventWireup="true" CodeBehind="HPTEntry.aspx.cs" Inherits="PrasarNet.PNET_Reports.MRAdmin.HPTAction" %>
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

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">

        <ContentTemplate>


            <section class="wrapper">
                <section class="page_head">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12">
                                <h2>Action Taken By Zone</h2>
                                <nav id="breadcrumbs">
                                    <ul>                                      
                                         <li></li>
                                         <li></li>
                                        <li>Welcome :</li>
                                        <li><label id="lblloginstation" runat="server"></label></li>
                                        <li><a href="#">HPT Action</a></li>

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
                                        <legend class="well-legend">Search</legend>

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

                                                            <asp:DropDownList ID="ddlstation" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlstation_SelectedIndexChanged"></asp:DropDownList>

                                                        </div>


                                                        <div class="col-lg-1 ">
                                                            <h4>Services</h4>
                                                        </div>


                                                        <div class="col-lg-2">

                                                            <asp:DropDownList ID="ddlservices" AutoPostBack="true" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlservices_SelectedIndexChanged"></asp:DropDownList>

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

                                                            <asp:TextBox ID="txtscheduled" runat="server" CssClass="form-control" MaxLength="6" Enabled="false"></asp:TextBox>

                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatortxtscheduled" runat="server" ControlToValidate="txtscheduled" ErrorMessage="Monthly Scheduled Prog.(In Hrs.)" Display="None"> </asp:RequiredFieldValidator>
                                                            <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCallouttxtscheduled" runat="server" TargetControlID="RequiredFieldValidatortxtscheduled"></ajaxToolkit:ValidatorCalloutExtender>
                                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxtxtscheduled" runat="server" TargetControlID="txtscheduled" ValidChars=".0123456789"></ajaxToolkit:FilteredTextBoxExtender>
                                                            <ajaxToolkit:TextBoxWatermarkExtender ID="TextBoxWatermarkscheduled" runat="server" TargetControlID="txtscheduled" WatermarkCssClass="Watermark" WatermarkText="In Hrs." />

                                                        </div>

                                                        <div class="col-lg-1 ">
                                                            <h4>Actual Prog.(In Hrs.)</h4>
                                                        </div>


                                                        <div class="col-lg-3">

                                                            <asp:TextBox ID="txtactual" runat="server" CssClass="form-control" MaxLength="6" Enabled="false"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatortxtactual" runat="server" ControlToValidate="txtactual" ErrorMessage="Actual Prog.(In Hrs.)" Display="None"> </asp:RequiredFieldValidator>
                                                            <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtendertxtactual" runat="server" TargetControlID="RequiredFieldValidatortxtactual"></ajaxToolkit:ValidatorCalloutExtender>
                                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtendertxtactual" runat="server" TargetControlID="txtactual" ValidChars=".0123456789"></ajaxToolkit:FilteredTextBoxExtender>
                                                            <ajaxToolkit:TextBoxWatermarkExtender ID="TextBoxWatermarkactual" runat="server" TargetControlID="txtactual" WatermarkCssClass="Watermark" WatermarkText="In Hrs." />

                                                        </div>

                                                        <div class="col-lg-1">
                                                            <h4>Rated Power of Transmitter(In KW)</h4>
                                                        </div>


                                                        <div class="col-lg-2 ">

                                                            <asp:TextBox ID="txttransmitter" runat="server" CssClass="form-control" MaxLength="6" Enabled="false"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatortxttransmitter" runat="server" ControlToValidate="txttransmitter" ErrorMessage="Rated Power of Transmitter(In KW)" Display="None"> </asp:RequiredFieldValidator>
                                                            <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtendertxttransmitter" runat="server" TargetControlID="RequiredFieldValidatortxttransmitter"></ajaxToolkit:ValidatorCalloutExtender>
                                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtendertxttransmitter" runat="server" TargetControlID="txttransmitter" ValidChars=".0123456789"></ajaxToolkit:FilteredTextBoxExtender>
                                                            <ajaxToolkit:TextBoxWatermarkExtender ID="TextBoxWatermarktransmitter" runat="server" TargetControlID="txttransmitter" WatermarkCssClass="Watermark" WatermarkText="In KW" />

                                                        </div>

                                                    </div>

                                                </div>

                                            </div>

                                        </section>

                                        <section class="page_head" style="width: 100%;">
                                            <div class="container">

                                                <div class="row">

                                                    <div class="row col-lg-12">

                                                        <div class="col-lg-1 ">
                                                            <h4>Radiated Power (Peak)(In KW)</h4>
                                                        </div>


                                                        <div class="col-lg-3">

                                                            <asp:TextBox ID="txtradiated" runat="server" CssClass="form-control" MaxLength="6" Enabled="false"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatortxtradiated" runat="server" ControlToValidate="txtradiated" ErrorMessage="Radiated Power (Peak)(In KW)" Display="None"> </asp:RequiredFieldValidator>
                                                            <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtendertxtradiated" runat="server" TargetControlID="RequiredFieldValidatortxtradiated"></ajaxToolkit:ValidatorCalloutExtender>
                                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtendertxtradiated" runat="server" TargetControlID="txtradiated" ValidChars=".0123456789"></ajaxToolkit:FilteredTextBoxExtender>
                                                            <ajaxToolkit:TextBoxWatermarkExtender ID="TextBoxWatermarkradiated" runat="server" TargetControlID="txtradiated" WatermarkCssClass="Watermark" WatermarkText="In KW" />

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
                                        <legend class="well-legend">BD Hours in %</legend>

                                        <section class="page_head" style="width: 100%;">
                                            <div class="container">

                                                <div class="row">

                                                    <div class="row col-lg-12">
                                                        <div class="col-lg-2 ">
                                                            <h4>PS(Current)</h4>
                                                        </div>


                                                        <div class="col-lg-3">

                                                            <asp:TextBox ID="Txtpscurrent" runat="server" CssClass="form-control" MaxLength="6" Enabled="false"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtpscurrent" runat="server" ControlToValidate="Txtpscurrent" ErrorMessage="PS(Current)" Display="None"> </asp:RequiredFieldValidator>
                                                            <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtpscurrent" runat="server" TargetControlID="RequiredFieldValidatorTxtpscurrent"></ajaxToolkit:ValidatorCalloutExtender>
                                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtpscurrent" runat="server" TargetControlID="Txtpscurrent" ValidChars=".0123456789"></ajaxToolkit:FilteredTextBoxExtender>
                                                            <ajaxToolkit:TextBoxWatermarkExtender ID="TextBoxWatermarkpscurrent" runat="server" TargetControlID="Txtpscurrent" WatermarkCssClass="Watermark" WatermarkText="Numerals only" />

                                                        </div>

                                                        <div class="col-lg-2 ">
                                                            <h4>PS(Progressive)</h4>
                                                        </div>


                                                        <div class="col-lg-3">

                                                            <asp:TextBox ID="Txtpsprogressive" runat="server" CssClass="form-control" MaxLength="6" Enabled="false"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtpsprogressive" runat="server" ControlToValidate="Txtpsprogressive" ErrorMessage="PS(Progressive)" Display="None"> </asp:RequiredFieldValidator>
                                                            <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtpsprogressive" runat="server" TargetControlID="RequiredFieldValidatorTxtpsprogressive"></ajaxToolkit:ValidatorCalloutExtender>
                                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtpsprogressive" runat="server" TargetControlID="Txtpsprogressive" ValidChars=".0123456789"></ajaxToolkit:FilteredTextBoxExtender>
                                                            <ajaxToolkit:TextBoxWatermarkExtender ID="TextBoxWatermarkpsprogressive" runat="server" TargetControlID="Txtpsprogressive" WatermarkCssClass="Watermark" WatermarkText="Numerals only" />

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
                                                            <h4>Gear(Current)</h4>
                                                        </div>


                                                        <div class="col-lg-3">

                                                            <asp:TextBox ID="Txtgearcurrent" runat="server" CssClass="form-control" MaxLength="6"  Enabled="false"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtgearcurrent" runat="server" ControlToValidate="Txtgearcurrent" ErrorMessage="Gear(Current)" Display="None"> </asp:RequiredFieldValidator>
                                                            <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtgearcurrent" runat="server" TargetControlID="RequiredFieldValidatorTxtgearcurrent"></ajaxToolkit:ValidatorCalloutExtender>
                                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtgearcurrent" runat="server" TargetControlID="Txtgearcurrent" ValidChars=".0123456789"></ajaxToolkit:FilteredTextBoxExtender>
                                                            <ajaxToolkit:TextBoxWatermarkExtender ID="TextBoxWatermarkgearcurrent" runat="server" TargetControlID="Txtgearcurrent" WatermarkCssClass="Watermark" WatermarkText="Numerals only" />

                                                        </div>

                                                        <div class="col-lg-2 ">
                                                            <h4>Gear(Progressive)</h4>
                                                        </div>


                                                        <div class="col-lg-3">

                                                            <asp:TextBox ID="Txtgearprogressive" runat="server" CssClass="form-control" MaxLength="6" Enabled="false"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtgearprogressive" runat="server" ControlToValidate="Txtgearprogressive" ErrorMessage="Gear(Progressive)" Display="None"> </asp:RequiredFieldValidator>
                                                            <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtgearprogressive" runat="server" TargetControlID="RequiredFieldValidatorTxtgearprogressive"></ajaxToolkit:ValidatorCalloutExtender>
                                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtgearprogressive" runat="server" TargetControlID="Txtgearprogressive" ValidChars=".0123456789"></ajaxToolkit:FilteredTextBoxExtender>
                                                            <ajaxToolkit:TextBoxWatermarkExtender ID="TextBoxWatermarkgearprogressive" runat="server" TargetControlID="Txtgearprogressive" WatermarkCssClass="Watermark" WatermarkText="Numerals only" />

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
                                                            <h4>OC(Current)</h4>
                                                        </div>


                                                        <div class="col-lg-3">

                                                            <asp:TextBox ID="Txtoccurrent" runat="server" CssClass="form-control" MaxLength="6"  AutoPostBack="true" Enabled="false"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtoccurrent" runat="server" ControlToValidate="Txtoccurrent" ErrorMessage="OC(Current)" Display="None"> </asp:RequiredFieldValidator>
                                                            <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtoccurrent" runat="server" TargetControlID="RequiredFieldValidatorTxtoccurrent"></ajaxToolkit:ValidatorCalloutExtender>
                                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtoccurrent" runat="server" TargetControlID="Txtgearprogressive" ValidChars=".0123456789"></ajaxToolkit:FilteredTextBoxExtender>
                                                            <ajaxToolkit:TextBoxWatermarkExtender ID="TextBoxWatermarkoccurrent" runat="server" TargetControlID="Txtoccurrent" WatermarkCssClass="Watermark" WatermarkText="Numerals only" />

                                                        </div>


                                                        <div class="col-lg-2 ">
                                                            <h4>OC(Progressive)</h4>
                                                        </div>


                                                        <div class="col-lg-3">

                                                            <asp:TextBox ID="Txtocprogressive" runat="server" CssClass="form-control" MaxLength="6" Enabled="false"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtocprogressive" runat="server" ControlToValidate="Txtocprogressive" ErrorMessage="OC(Progressive)" Display="None"> </asp:RequiredFieldValidator>
                                                            <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtocprogressive" runat="server" TargetControlID="RequiredFieldValidatorTxtocprogressive"></ajaxToolkit:ValidatorCalloutExtender>
                                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtocprogressive" runat="server" TargetControlID="Txtocprogressive" ValidChars=".0123456789"></ajaxToolkit:FilteredTextBoxExtender>
                                                            <ajaxToolkit:TextBoxWatermarkExtender ID="TextBoxWatermarkocprogressive" runat="server" TargetControlID="Txtocprogressive" WatermarkCssClass="Watermark" WatermarkText="Numerals only" />

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

                                                            <asp:DropDownList ID="ddlworkingstatusACU" runat="server" AutoPostBack="true" CssClass="form-control" OnSelectedIndexChanged="ddlworkingstatusACU_SelectedIndexChanged" Enabled="false"></asp:DropDownList>

                                                            <asp:TextBox ID="txtairconditioning" runat="server" CssClass="form-control" TextMode="MultiLine" Height="90px"></asp:TextBox>
                                                            <ajaxToolkit:TextBoxWatermarkExtender ID="TextBoxWatermarkairconditioning" runat="server" TargetControlID="txtairconditioning" WatermarkCssClass="Watermark" WatermarkText="Enter Details for Not Working Air Conditioning Units." />

                                                        </div>

                                                        <div class="col-lg-2 ">
                                                            <h4>Power distribution system</h4>
                                                        </div>


                                                        <div class="col-lg-3">

                                                            <asp:DropDownList ID="ddlworkingstatusPDS" runat="server" AutoPostBack="true" CssClass="form-control" OnSelectedIndexChanged="ddlworkingstatusPDS_SelectedIndexChanged" Enabled="false"></asp:DropDownList>

                                                            <asp:TextBox ID="txtpowerdistribution" runat="server" CssClass="form-control" TextMode="MultiLine" Height="90px" Enabled="false"></asp:TextBox>
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


                                                        <div class="col-lg-6 ">

                                                            <asp:TextBox ID="txtreason" runat="server" CssClass="form-control" TextMode="MultiLine" Height="90px" Enabled="false"></asp:TextBox>

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

                                                            <asp:TextBox ID="txtrepair" runat="server" CssClass="form-control" TextMode="MultiLine" Height="90px" Enabled="false"></asp:TextBox>

                                                        </div>
                                                        <div class="col-lg-2 ">
                                                            <h4>Action taken by Zonal Office</h4>
                                                        </div>


                                                        <div class="col-lg-3">

                                                            <asp:TextBox ID="txtactionzonal" runat="server" CssClass="form-control" TextMode="MultiLine" Height="90px"></asp:TextBox>

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

                                                            <asp:TextBox ID="Txtantenna_lb" runat="server" CssClass="form-control" MaxLength="6"  Enabled="false"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtantenna_lb" runat="server" ControlToValidate="Txtantenna_lb" ErrorMessage="Enter LB" Display="None"> </asp:RequiredFieldValidator>
                                                            <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtantenna_lb" runat="server" TargetControlID="RequiredFieldValidatorTxtocprogressive"></ajaxToolkit:ValidatorCalloutExtender>
                                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtantenna_lb" runat="server" TargetControlID="Txtantenna_lb" ValidChars=".0123456789"></ajaxToolkit:FilteredTextBoxExtender>
                                                            <ajaxToolkit:TextBoxWatermarkExtender ID="TextBoxWatermarkantenna_lb" runat="server" TargetControlID="Txtantenna_lb" WatermarkCssClass="Watermark" WatermarkText="Numerals only" />

                                                        </div>
                                                        <div class="col-lg-1 ">
                                                            <h4>UB</h4>
                                                        </div>


                                                        <div class="col-lg-3">

                                                            <asp:TextBox ID="Txtantenna_ub" runat="server" CssClass="form-control" MaxLength="6"  AutoPostBack="true" Enabled="false"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtantenna_ub" runat="server" ControlToValidate="Txtantenna_ub" ErrorMessage="Enter UB" Display="None"> </asp:RequiredFieldValidator>
                                                            <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtantenna_ub" runat="server" TargetControlID="RequiredFieldValidatorTxtantenna_ub"></ajaxToolkit:ValidatorCalloutExtender>
                                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtantenna_ub" runat="server" TargetControlID="Txtantenna_ub" ValidChars=".0123456789"></ajaxToolkit:FilteredTextBoxExtender>
                                                            <ajaxToolkit:TextBoxWatermarkExtender ID="TextBoxWatermarkantenna_ub" runat="server" TargetControlID="Txtantenna_ub" WatermarkCssClass="Watermark" WatermarkText="Numerals only" />

                                                        </div>

                                                        <div class="col-lg-1 ">
                                                            <h4>Combined</h4>
                                                        </div>


                                                        <div class="col-lg-2">

                                                            <asp:TextBox ID="Txtantenna_comb" runat="server" CssClass="form-control" MaxLength="6" Enabled="false"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtantenna_comb" runat="server" ControlToValidate="Txtantenna_comb" ErrorMessage="Enter Combined" Display="None"> </asp:RequiredFieldValidator>
                                                            <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtantenna_comb" runat="server" TargetControlID="RequiredFieldValidatorTxtantenna_comb"></ajaxToolkit:ValidatorCalloutExtender>
                                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtantenna_comb" runat="server" TargetControlID="Txtantenna_comb" ValidChars=".0123456789"></ajaxToolkit:FilteredTextBoxExtender>
                                                            <ajaxToolkit:TextBoxWatermarkExtender ID="TextBoxWatermarkantenna_comb" runat="server" TargetControlID="Txtantenna_comb" WatermarkCssClass="Watermark" WatermarkText="Numerals only" />

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
                                                            <h4>Total Working Hours</h4>
                                                        </div>


                                                        <div class="col-lg-3">

                                                            <asp:TextBox ID="Txtdieselg_twh" runat="server" CssClass="form-control" MaxLength="6" AutoPostBack="true"  Enabled="false"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtdieselg_twh" runat="server" ControlToValidate="Txtdieselg_twh" ErrorMessage="Total Working Hours" Display="None"> </asp:RequiredFieldValidator>
                                                            <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtdieselg_twh" runat="server" TargetControlID="RequiredFieldValidatorTxtdieselg_twh"></ajaxToolkit:ValidatorCalloutExtender>
                                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtdieselg_twh" runat="server" TargetControlID="Txtdieselg_twh" ValidChars=".0123456789"></ajaxToolkit:FilteredTextBoxExtender>
                                                            <ajaxToolkit:TextBoxWatermarkExtender ID="TextBoxWatermarkTxtdieselg_twh" runat="server" TargetControlID="Txtdieselg_twh" WatermarkCssClass="Watermark" WatermarkText="In Hrs." />

                                                        </div>
                                                        <div class="col-lg-2 ">
                                                            <h4>Progressive Utilization</h4>
                                                        </div>


                                                        <div class="col-lg-3">

                                                            <asp:TextBox ID="Txtdieselg_progutil" runat="server" CssClass="form-control" MaxLength="6" Enabled="false"></asp:TextBox>

                                                            <ajaxToolkit:TextBoxWatermarkExtender ID="TextBoxWatermarkTxtdieselg_progutil" runat="server" TargetControlID="Txtdieselg_progutil" WatermarkCssClass="Watermark" WatermarkText="Numerals only" />

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
                                                            <h4>Quantity of Disel Consumed(in L)</h4>
                                                        </div>


                                                        <div class="col-lg-3">

                                                            <asp:TextBox ID="Txtdieselg_qdc" runat="server" CssClass="form-control" MaxLength="6"  Enabled="false"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtdieselg_qdc" runat="server" ControlToValidate="Txtdieselg_qdc" ErrorMessage="Quantity of Disel Consumed" Display="None"> </asp:RequiredFieldValidator>
                                                            <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtdieselg_qdc" runat="server" TargetControlID="RequiredFieldValidatorTxtdieselg_qdc"></ajaxToolkit:ValidatorCalloutExtender>
                                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtdieselg_qdc" runat="server" TargetControlID="Txtdieselg_qdc" ValidChars=".0123456789"></ajaxToolkit:FilteredTextBoxExtender>
                                                            <ajaxToolkit:TextBoxWatermarkExtender ID="TextBoxWatermarkTxtdieselg_qdc" runat="server" TargetControlID="Txtdieselg_qdc" WatermarkCssClass="Watermark" WatermarkText="Numerals only" />

                                                        </div>
                                                        <div class="col-lg-2">
                                                            <h4>Total Diesel Consumed(in L)</h4>
                                                        </div>


                                                        <div class="col-lg-3">

                                                            <asp:TextBox ID="TxttotalD" runat="server" CssClass="form-control" MaxLength="6" Enabled="false"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxttotalD" runat="server" ControlToValidate="TxttotalD" ErrorMessage="Total Disel Consumed" Display="None"> </asp:RequiredFieldValidator>
                                                            <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxttotalD" runat="server" TargetControlID="RequiredFieldValidatorTxttotalD"></ajaxToolkit:ValidatorCalloutExtender>
                                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxttotalD" runat="server" TargetControlID="TxttotalD" ValidChars=".0123456789"></ajaxToolkit:FilteredTextBoxExtender>
                                                            <ajaxToolkit:TextBoxWatermarkExtender ID="TextBoxWatermarkExtenderTxttotalD" runat="server" TargetControlID="TxttotalD" WatermarkCssClass="Watermark" WatermarkText="Numerals only" />

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

                                                        <div class="col-lg-1 ">
                                                            <h4>Current(in KW)</h4>
                                                        </div>


                                                        <div class="col-lg-3">

                                                            <asp:TextBox ID="Txtpoweru_current" runat="server" CssClass="form-control" AutoPostBack="true" MaxLength="6"  Enabled="false"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtpoweru_current" runat="server" ControlToValidate="Txtpoweru_current" ErrorMessage="Current" Display="None"> </asp:RequiredFieldValidator>
                                                            <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtpoweru_current" runat="server" TargetControlID="RequiredFieldValidatorTxtpoweru_current"></ajaxToolkit:ValidatorCalloutExtender>
                                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtpoweru_current" runat="server" TargetControlID="Txtpoweru_current" ValidChars=".0123456789"></ajaxToolkit:FilteredTextBoxExtender>
                                                            <ajaxToolkit:TextBoxWatermarkExtender ID="TextBoxWatermarkTxtpoweru_current" runat="server" TargetControlID="Txtpoweru_current" WatermarkCssClass="Watermark" WatermarkText="Numerals only" />

                                                        </div>
                                                        <div class="col-lg-1 ">
                                                            <h4>Progressive(in KW)</h4>
                                                        </div>


                                                        <div class="col-lg-3">

                                                            <asp:TextBox ID="Txtpoweru_prog" runat="server" CssClass="form-control" MaxLength="6" Enabled="false"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtpoweru_prog" runat="server" ControlToValidate="Txtpoweru_prog" ErrorMessage="Progressive" Display="None"> </asp:RequiredFieldValidator>
                                                            <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtpoweru_prog" runat="server" TargetControlID="RequiredFieldValidatorTxtpoweru_prog"></ajaxToolkit:ValidatorCalloutExtender>
                                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtpoweru_prog" runat="server" TargetControlID="Txtpoweru_prog" ValidChars=".0123456789"></ajaxToolkit:FilteredTextBoxExtender>
                                                            <ajaxToolkit:TextBoxWatermarkExtender ID="TextBoxWatermarkTxtpoweru_prog" runat="server" TargetControlID="Txtpoweru_prog" WatermarkCssClass="Watermark" WatermarkText="Numerals only" />

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

                                                        <asp:TextBox ID="Txtdetailsnewequipr" runat="server" CssClass="form-control" TextMode="MultiLine" Height="90px" Enabled="false"></asp:TextBox>

                                                    </div>

                                                    <div class="col-lg-2 ">
                                                        <h4>Details of Important Workdone/Remarks</h4>
                                                    </div>


                                                    <div class="col-lg-4">

                                                        <asp:TextBox ID="Txtdetailsimpworkr" runat="server" CssClass="form-control" TextMode="MultiLine" Height="90px" Enabled="false"></asp:TextBox>

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

                                                        <asp:Button ID="Btnupdate" runat="server" CssClass="btn btn-default btn-lg" Text="Update Action" OnClick="Btnupdate_Click" />
                                                       
                                                    </div>




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

           <%-- <asp:AsyncPostBackTrigger ControlID="btnexcel" EventName="Click" />
            <asp:AsyncPostBackTrigger ControlID="brnpdf" EventName="Click" />--%>


        </Triggers>

    </asp:UpdatePanel>

</asp:Content>
