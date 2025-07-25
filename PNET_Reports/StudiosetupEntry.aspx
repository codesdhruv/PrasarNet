<%@ Page Title="" Language="C#" MasterPageFile="~/PNET_Reports/MonthlyReportsEntry.Master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeBehind="StudiosetupEntry.aspx.cs" Inherits="PrasarNet.PNET_Reports.StudiosetupEntry" %>

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
                        <h2>Entry Form for Studio SetUp</h2>
                        <nav id="breadcrumbs">
                            <ul>
                                <li>Welcome :</li>
                                <li>
                                    <label id="lblloginstation" runat="server"></label>
                                </li>
                                <li><a href="#">Studio SetUp Monthly Reports</a></li>

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

                                                    <asp:DropDownList ID="ddlyear" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlyear_SelectedIndexChanged"></asp:DropDownList>

                                                </div>

                                                <div class="col-lg-1 ">
                                                    <h4>Month</h4>
                                                </div>


                                                <div class="col-lg-3">

                                                    <asp:DropDownList ID="ddlmonth" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlmonth_SelectedIndexChanged"></asp:DropDownList>

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

                                                    <asp:DropDownList ID="ddlstate" runat="server" CssClass="form-control" AutoPostBack="true"></asp:DropDownList>

                                                </div>



                                                <div class="col-lg-1 ">
                                                    <h4>Station</h4>
                                                </div>


                                                <div class="col-lg-3">

                                                    <asp:DropDownList ID="ddlstation" runat="server" CssClass="form-control"></asp:DropDownList>

                                                </div>


                                            </div>




                                        </div>
                                    </div>
                                </section>

                            </fieldset>



                            <fieldset class="well">
                                <legend class="well-legend">Studio Utilization in Hours & Shift alloted in Hours</legend>

                                <section class="page_head" style="width: 100%;">
                                    <div class="container">

                                        <div class="row">

                                            <div class="row col-lg-12">



                                                <div class="col-lg-2 ">
                                                    <h4>Recording(Current Month)</h4>
                                                </div>


                                                <div class="col-lg-3">

                                                    <asp:TextBox ID="TxtStudioutilizn_Recordinghrs" runat="server" MaxLength="6" AutoPostBack="true" Width="20%" OnTextChanged="TxtStudioutilizn_Recordinghrs_TextChanged"></asp:TextBox>Hrs.
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtStudioutilizn_Recordinghrs" runat="server" ControlToValidate="TxtStudioutilizn_Recordinghrs" ErrorMessage="Studio Utilization Shift Hours" Display="None"> </asp:RequiredFieldValidator>
                                                    <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtStudioutilizn_Recordinghrs" runat="server" TargetControlID="RequiredFieldValidatorTxtStudioutilizn_Recordinghrs"></ajaxToolkit:ValidatorCalloutExtender>
                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtStudioutilizn_Recordinghrs" runat="server" TargetControlID="TxtStudioutilizn_Recordinghrs" ValidChars="0123456789"></ajaxToolkit:FilteredTextBoxExtender>


                                                    <asp:TextBox ID="TxtStudioutilizn_Recordingmin" runat="server" MaxLength="6" AutoPostBack="true" Width="20%" OnTextChanged="TxtStudioutilizn_Recordingmin_TextChanged"></asp:TextBox>Min.
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtStudioutilizn_Recordingmin" runat="server" ControlToValidate="TxtStudioutilizn_Recordingmin" ErrorMessage="Studio Utilization Shift Min" Display="None"> </asp:RequiredFieldValidator>
                                                    <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtStudioutilizn_Recordingmin" runat="server" TargetControlID="RequiredFieldValidatorTxtStudioutilizn_Recordingmin"></ajaxToolkit:ValidatorCalloutExtender>
                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtStudioutilizn_Recordingmin" runat="server" TargetControlID="TxtStudioutilizn_Recordingmin" ValidChars="0123456789"></ajaxToolkit:FilteredTextBoxExtender>
                                                    <asp:RangeValidator ID="RangeValidatorTxtStudioutilizn_Recordingmin" runat="server" ControlToValidate="TxtStudioutilizn_Recordingmin" MinimumValue="0" MaximumValue="60" ErrorMessage="Min in range 0 to 60" Text="range 0 to 60" ForeColor="Red" Display="Dynamic"></asp:RangeValidator>


                                                </div>

                                                <div class="col-lg-2 ">
                                                    <h4>Recording(Progressive)</h4>
                                                </div>


                                                <div class="col-lg-3">

                                                    <asp:TextBox ID="TxtStudioutilizn_RecordingProghrs" runat="server" MaxLength="6" Width="20%"></asp:TextBox>Hrs.
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtStudioutilizn_RecordingProghrs" runat="server" ControlToValidate="TxtStudioutilizn_RecordingProghrs" ErrorMessage="Studio Utilization Shift Progressive Hrs." Display="None"> </asp:RequiredFieldValidator>
                                                    <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtStudioutilizn_RecordingProghrs" runat="server" TargetControlID="RequiredFieldValidatorTxtStudioutilizn_RecordingProghrs"></ajaxToolkit:ValidatorCalloutExtender>
                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtStudioutilizn_RecordingProghrs" runat="server" TargetControlID="TxtStudioutilizn_RecordingProghrs" ValidChars="0123456789"></ajaxToolkit:FilteredTextBoxExtender>


                                                    <asp:TextBox ID="TxtStudioutilizn_RecordingProgmin" runat="server" MaxLength="6" Width="20%"></asp:TextBox>Min.
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtStudioutilizn_RecordingProgmin" runat="server" ControlToValidate="TxtStudioutilizn_RecordingProgmin" ErrorMessage="Studio Utilization Shift Progressive Min." Display="None"> </asp:RequiredFieldValidator>
                                                    <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtStudioutilizn_RecordingProgmin" runat="server" TargetControlID="RequiredFieldValidatorTxtStudioutilizn_RecordingProgmin"></ajaxToolkit:ValidatorCalloutExtender>
                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtStudioutilizn_RecordingProgmin" runat="server" TargetControlID="TxtStudioutilizn_RecordingProgmin" ValidChars="0123456789"></ajaxToolkit:FilteredTextBoxExtender>
                                                    <asp:RangeValidator ID="RangeValidatorTxtStudioutilizn_RecordingProgmin" runat="server" ControlToValidate="TxtStudioutilizn_RecordingProgmin" MinimumValue="0" MaximumValue="60" ErrorMessage="Min in range 0 to 60" Text="range 0 to 60" ForeColor="Red" Display="Dynamic"></asp:RangeValidator>




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
                                                    <h4>Transmission(Current Month)</h4>
                                                </div>


                                                <div class="col-lg-3">

                                                    <asp:TextBox ID="TxtStudioutilizn_Transmissionhrs" runat="server" MaxLength="6" AutoPostBack="true" Width="20%" OnTextChanged="TxtStudioutilizn_Transmissionhrs_TextChanged"></asp:TextBox>Hrs.
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtStudioutilizn_Transmissionhrs" runat="server" ControlToValidate="TxtStudioutilizn_Transmissionhrs" ErrorMessage="Transmission Hrs. (Current)" Display="None"> </asp:RequiredFieldValidator>
                                                    <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtStudioutilizn_Transmissionhrs" runat="server" TargetControlID="RequiredFieldValidatorTxtStudioutilizn_Transmissionhrs"></ajaxToolkit:ValidatorCalloutExtender>
                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtStudioutilizn_Transmissionhrs" runat="server" TargetControlID="TxtStudioutilizn_Transmissionhrs" ValidChars="0123456789"></ajaxToolkit:FilteredTextBoxExtender>


                                                    <asp:TextBox ID="TxtStudioutilizn_Transmissionmin" runat="server" MaxLength="6" AutoPostBack="true" Width="20%" OnTextChanged="TxtStudioutilizn_Transmissionmin_TextChanged"></asp:TextBox>Min.
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtStudioutilizn_Transmissionmin" runat="server" ControlToValidate="TxtStudioutilizn_Transmissionmin" ErrorMessage="Transmission Min. (Current)" Display="None"> </asp:RequiredFieldValidator>
                                                    <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtStudioutilizn_Transmissionmin" runat="server" TargetControlID="RequiredFieldValidatorTxtStudioutilizn_Transmissionmin"></ajaxToolkit:ValidatorCalloutExtender>
                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtStudioutilizn_Transmissionmin" runat="server" TargetControlID="TxtStudioutilizn_Transmissionmin" ValidChars="0123456789"></ajaxToolkit:FilteredTextBoxExtender>
                                                    <asp:RangeValidator ID="RangeValidatorTxtStudioutilizn_Transmissionmin" runat="server" ControlToValidate="TxtStudioutilizn_Transmissionmin" MinimumValue="0" MaximumValue="60" ErrorMessage="Min in range 0 to 60" Text="range 0 to 60" ForeColor="Red" Display="Dynamic"></asp:RangeValidator>


                                                </div>

                                                <div class="col-lg-2 ">
                                                    <h4>Transmission(Progressive)</h4>
                                                </div>


                                                <div class="col-lg-3">


                                                    <asp:TextBox ID="TxtStudioutilizn_TransmissionProghrs" runat="server" MaxLength="6" AutoPostBack="true" Width="20%"></asp:TextBox>Hrs.
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtStudioutilizn_TransmissionProghrs" runat="server" ControlToValidate="TxtStudioutilizn_TransmissionProghrs" ErrorMessage="Transmission Hrs. (Progressive)" Display="None"> </asp:RequiredFieldValidator>
                                                    <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtStudioutilizn_TransmissionProghrs" runat="server" TargetControlID="RequiredFieldValidatorTxtStudioutilizn_TransmissionProghrs"></ajaxToolkit:ValidatorCalloutExtender>
                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtStudioutilizn_TransmissionProghrs" runat="server" TargetControlID="TxtStudioutilizn_TransmissionProghrs" ValidChars="0123456789"></ajaxToolkit:FilteredTextBoxExtender>


                                                    <asp:TextBox ID="TxtStudioutilizn_TransmissionProgmin" runat="server" MaxLength="6" Width="20%"></asp:TextBox>Min.
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtStudioutilizn_TransmissionProgmin" runat="server" ControlToValidate="TxtStudioutilizn_TransmissionProgmin" ErrorMessage="Transmission Min. (Progressive)" Display="None"> </asp:RequiredFieldValidator>
                                                    <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtStudioutilizn_TransmissionProgmin" runat="server" TargetControlID="RequiredFieldValidatorTxtStudioutilizn_TransmissionProgmin"></ajaxToolkit:ValidatorCalloutExtender>
                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtStudioutilizn_TransmissionProgmin" runat="server" TargetControlID="TxtStudioutilizn_TransmissionProgmin" ValidChars="0123456789"></ajaxToolkit:FilteredTextBoxExtender>
                                                    <asp:RangeValidator ID="RangeValidatorTxtStudioutilizn_TransmissionProgmin" runat="server" ControlToValidate="TxtStudioutilizn_TransmissionProgmin" MinimumValue="0" MaximumValue="60" ErrorMessage="Min in range 0 to 60" Text="range 0 to 60" ForeColor="Red" Display="Dynamic"></asp:RangeValidator>


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
                                                    <h4>Studio Shift(Current Month)</h4>
                                                </div>


                                                <div class="col-lg-3">

                                                    <asp:TextBox ID="TxtStudioutilizn_Shifthrs" runat="server" MaxLength="6" AutoPostBack="true" Width="20%" OnTextChanged="TxtStudioutilizn_Shifthrs_TextChanged"></asp:TextBox>Hrs.
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtStudioutilizn_Shifthrs" runat="server" ControlToValidate="TxtStudioutilizn_Shifthrs" ErrorMessage="Studio Shift Hrs. (Current)" Display="None"> </asp:RequiredFieldValidator>
                                                    <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtStudioutilizn_Shifthrs" runat="server" TargetControlID="RequiredFieldValidatorTxtStudioutilizn_Shifthrs"></ajaxToolkit:ValidatorCalloutExtender>
                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtStudioutilizn_Shifthrs" runat="server" TargetControlID="TxtStudioutilizn_Shifthrs" ValidChars="0123456789"></ajaxToolkit:FilteredTextBoxExtender>


                                                    <asp:TextBox ID="TxtStudioutilizn_Shiftmin" runat="server" MaxLength="6" AutoPostBack="true" Width="20%" OnTextChanged="TxtStudioutilizn_Shiftmin_TextChanged"></asp:TextBox>Min.
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtStudioutilizn_Shiftmin" runat="server" ControlToValidate="TxtStudioutilizn_Shiftmin" ErrorMessage="Studio Shift Min. (Current)" Display="None"> </asp:RequiredFieldValidator>
                                                    <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtStudioutilizn_Shiftmin" runat="server" TargetControlID="RequiredFieldValidatorTxtStudioutilizn_Shiftmin"></ajaxToolkit:ValidatorCalloutExtender>
                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtStudioutilizn_Shiftmin" runat="server" TargetControlID="TxtStudioutilizn_Shiftmin" ValidChars="0123456789"></ajaxToolkit:FilteredTextBoxExtender>
                                                    <asp:RangeValidator ID="RangeValidatorTxtStudioutilizn_Shiftmin" runat="server" ControlToValidate="TxtStudioutilizn_Shiftmin" MinimumValue="0" MaximumValue="60" ErrorMessage="Min in range 0 to 60" Text="range 0 to 60" ForeColor="Red" Display="Dynamic"></asp:RangeValidator>


                                                </div>


                                                <div class="col-lg-2 ">
                                                    <h4>Studio Shift(Progressive)</h4>
                                                </div>


                                                <div class="col-lg-3">

                                                    <asp:TextBox ID="TxtStudioutilizn_ShiftProghrs" runat="server" MaxLength="6" AutoPostBack="true" Width="20%"></asp:TextBox>Hrs.
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtStudioutilizn_ShiftProghrs" runat="server" ControlToValidate="TxtStudioutilizn_ShiftProghrs" ErrorMessage="Studio Shift Hrs. (Progressive)" Display="None"> </asp:RequiredFieldValidator>
                                                    <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtStudioutilizn_ShiftProghrs" runat="server" TargetControlID="RequiredFieldValidatorTxtStudioutilizn_ShiftProghrs"></ajaxToolkit:ValidatorCalloutExtender>
                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtStudioutilizn_ShiftProghrs" runat="server" TargetControlID="TxtStudioutilizn_ShiftProghrs" ValidChars="0123456789"></ajaxToolkit:FilteredTextBoxExtender>


                                                    <asp:TextBox ID="TxtStudioutilizn_ShiftProgmin" runat="server" MaxLength="6" AutoPostBack="true" Width="20%" OnTextChanged="TxtStudioutilizn_ShiftProgmin_TextChanged"></asp:TextBox>Min.
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtStudioutilizn_ShiftProgmin" runat="server" ControlToValidate="TxtStudioutilizn_ShiftProgmin" ErrorMessage="Studio Shift Min. (Progressive)" Display="None"> </asp:RequiredFieldValidator>
                                                    <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtStudioutilizn_ShiftProgmin" runat="server" TargetControlID="RequiredFieldValidatorTxtStudioutilizn_ShiftProgmin"></ajaxToolkit:ValidatorCalloutExtender>
                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtStudioutilizn_ShiftProgmin" runat="server" TargetControlID="TxtStudioutilizn_ShiftProgmin" ValidChars="0123456789"></ajaxToolkit:FilteredTextBoxExtender>
                                                    <asp:RangeValidator ID="RangeValidatorTxtStudioutilizn_ShiftProgmin" runat="server" ControlToValidate="TxtStudioutilizn_ShiftProgmin" MinimumValue="0" MaximumValue="60" ErrorMessage="Min in range 0 to 60" Text="range 0 to 60" ForeColor="Red" Display="Dynamic"></asp:RangeValidator>


                                                </div>



                                            </div>

                                        </div>
                                    </div>
                                </section>

                            </fieldset>


                            <fieldset class="well">
                                <legend class="well-legend">Studio Utilization in % w.r.t finished recording/transmission</legend>

                                <section class="page_head" style="width: 100%;">
                                    <div class="container">

                                        <div class="row">

                                            <div class="row col-lg-12">



                                                <div class="col-lg-3 ">
                                                    <asp:Label type="hidden" ID="labashitcur" runat="server" Visible="false"></asp:Label>
                                                    <asp:Label type="hidden" ID="labbreccur" runat="server"  Visible="false"></asp:Label>
                                                    <asp:Label type="hidden" ID="labctranscur" runat="server"  Visible="false"></asp:Label>
                                                    <h4>Studio Utilization(Current Month) %</h4>
                                                </div>


                                                <div class="col-lg-3">

                                                    <asp:Label ID="lblstudioutilcurrent" runat="server"></asp:Label>

                                                </div>

                                                <div class="col-lg-3 ">
                                                    <asp:Label type="hidden" ID="labashitprog" runat="server"  Visible="false"></asp:Label>
                                                    <asp:Label type="hidden" ID="labbrecprog" runat="server"  Visible="false"></asp:Label>
                                                    <asp:Label type="hidden" ID="labctransprog" runat="server"  Visible="false"></asp:Label>
                                                    <h4>Studio Utilization(Progressive) %</h4>
                                                </div>


                                                <div class="col-lg-3">

                                                    <asp:Label ID="lblstudioutilprogressive" runat="server"></asp:Label>

                                                </div>

                                            </div>

                                        </div>
                                    </div>
                                </section>


                            </fieldset>


                            <fieldset class="well">
                                <legend class="well-legend">Deployment / Utilization of OB/EFV Van</legend>

                                <section class="page_head" style="width: 100%;">
                                    <div class="container">

                                        <fieldset class="well" style="width: 95%;">
                                            <legend class="well-legend">No of Coverage(in. Hrs)</legend>


                                            <div class="row">


                                                <div class="row col-lg-12">

                                                    <div class="col-lg-3">
                                                        <h4>No of OV/EFV Vans Used</h4>
                                                    </div>


                                                    <div class="col-lg-3">

                                                        <asp:TextBox ID="Txtnoofovefvvans" runat="server" Width="20%" CssClass="form-control" MaxLength="3"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtnoofovefvvans" runat="server" ControlToValidate="Txtnoofovefvvans" ErrorMessage="No of OV/EFV Vans for Coverage" Display="None"> </asp:RequiredFieldValidator>
                                                        <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtnoofovefvvans" runat="server" TargetControlID="RequiredFieldValidatorTxtnoofovefvvans"></ajaxToolkit:ValidatorCalloutExtender>
                                                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtnoofovefvvans" runat="server" TargetControlID="Txtnoofovefvvans" ValidChars="0123456789"></ajaxToolkit:FilteredTextBoxExtender>


                                                    </div>




                                                </div>

                                            </div>


                                            <div class="row">


                                                <div class="row col-lg-12">

                                                    <div class="col-lg-3">
                                                        <h4>Live(Current Month)</h4>
                                                    </div>


                                                    <div class="col-lg-3">

                                                        <asp:TextBox ID="TxtDeputiNoofcov_LiveCurrent" runat="server" Width="70%" CssClass="form-control" MaxLength="6" AutoPostBack="true" OnTextChanged="TxtDeputiNoofcov_LiveCurrent_TextChanged"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtDeputiNoofcov_LiveCurrent" runat="server" ControlToValidate="TxtDeputiNoofcov_LiveCurrent" ErrorMessage="No of Coverage Live Current" Display="None"> </asp:RequiredFieldValidator>
                                                        <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtDeputiNoofcov_LiveCurrent" runat="server" TargetControlID="RequiredFieldValidatorTxtDeputiNoofcov_LiveCurrent"></ajaxToolkit:ValidatorCalloutExtender>
                                                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtDeputiNoofcov_LiveCurrent" runat="server" TargetControlID="TxtDeputiNoofcov_LiveCurrent" ValidChars=".0123456789"></ajaxToolkit:FilteredTextBoxExtender>


                                                    </div>


                                                    <div class="col-lg-3 ">
                                                        <h4>Live(Progressive)</h4>
                                                    </div>


                                                    <div class="col-lg-3">

                                                        <asp:TextBox ID="TxtDeputiNoofcov_ProgLive" Width="70%" runat="server" CssClass="form-control" MaxLength="6"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtDeputiNoofcov_ProgLive" runat="server" ControlToValidate="TxtDeputiNoofcov_ProgLive" ErrorMessage="No of Coverage Live Progressive" Display="None"> </asp:RequiredFieldValidator>
                                                        <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtDeputiNoofcov_ProgLive" runat="server" TargetControlID="RequiredFieldValidatorTxtDeputiNoofcov_ProgLive"></ajaxToolkit:ValidatorCalloutExtender>
                                                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtDeputiNoofcov_ProgLive" runat="server" TargetControlID="TxtDeputiNoofcov_ProgLive" ValidChars=".0123456789"></ajaxToolkit:FilteredTextBoxExtender>

                                                    </div>

                                                </div>

                                            </div>


                                            <div class="row">

                                                <div class="row col-lg-12">

                                                    <div class="col-lg-3">
                                                        <h4>Recording(Current Month)</h4>
                                                    </div>

                                                    <div class="col-lg-3">

                                                        <asp:TextBox ID="TxtDeputiNoofcov_RECCurrent" runat="server" Width="70%" CssClass="form-control" MaxLength="6" AutoPostBack="true" OnTextChanged="TxtDeputiNoofcov_RECCurrent_TextChanged"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtDeputiNoofcov_RECCurrent" runat="server" ControlToValidate="TxtDeputiNoofcov_RECCurrent" ErrorMessage="No of Coverage Recording Current" Display="None"> </asp:RequiredFieldValidator>
                                                        <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtDeputiNoofcov_RECCurrent" runat="server" TargetControlID="RequiredFieldValidatorTxtDeputiNoofcov_RECCurrent"></ajaxToolkit:ValidatorCalloutExtender>
                                                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtDeputiNoofcov_RECCurrent" runat="server" TargetControlID="TxtDeputiNoofcov_RECCurrent" ValidChars=".0123456789"></ajaxToolkit:FilteredTextBoxExtender>

                                                    </div>



                                                    <div class="col-lg-3 ">
                                                        <h4>Recording(Progressive)</h4>
                                                    </div>


                                                    <div class="col-lg-3">


                                                        <asp:TextBox ID="TxtDeputiNoofcov_ProgREC" Width="70%" runat="server" CssClass="form-control" AutoPostBack="true" MaxLength="6" OnTextChanged="TxtDeputiNoofcov_ProgREC_TextChanged"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtDeputiNoofcov_ProgREC" runat="server" ControlToValidate="TxtDeputiNoofcov_ProgREC" ErrorMessage="No of Coverage Recording Progressive" Display="None"> </asp:RequiredFieldValidator>
                                                        <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtDeputiNoofcov_ProgREC" runat="server" TargetControlID="RequiredFieldValidatorTxtDeputiNoofcov_ProgREC"></ajaxToolkit:ValidatorCalloutExtender>
                                                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtDeputiNoofcov_ProgREC" runat="server" TargetControlID="TxtDeputiNoofcov_ProgREC" ValidChars=".0123456789"></ajaxToolkit:FilteredTextBoxExtender>

                                                    </div>

                                                </div>

                                            </div>


                                            <div class="row">

                                                <div class="row col-lg-12">

                                                    <div class="col-lg-3 ">
                                                        <h4>Total(Current Month)</h4>
                                                    </div>

                                                    <div class="col-lg-3">

                                                        <asp:TextBox ID="TxtDeputiNoofcov_TotalCurrent" runat="server" Width="70%" CssClass="form-control" MaxLength="6" AutoPostBack="true"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtDeputiNoofcov_TotalCurrent" runat="server" ControlToValidate="TxtDeputiNoofcov_TotalCurrent" ErrorMessage="No of Coverage Total Current" Display="None"> </asp:RequiredFieldValidator>
                                                        <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtDeputiNoofcov_TotalCurrent" runat="server" TargetControlID="RequiredFieldValidatorTxtDeputiNoofcov_TotalCurrent"></ajaxToolkit:ValidatorCalloutExtender>
                                                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtDeputiNoofcov_TotalCurrent" runat="server" TargetControlID="TxtDeputiNoofcov_TotalCurrent" ValidChars=".0123456789"></ajaxToolkit:FilteredTextBoxExtender>

                                                    </div>


                                                    <div class="col-lg-3 ">
                                                        <h4>Total(Progressive)</h4>
                                                    </div>

                                                    <div class="col-lg-3">

                                                        <asp:TextBox ID="TxtDeputiNoofcov_ProgTotal" Width="70%" runat="server" CssClass="form-control" MaxLength="6"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtDeputiNoofcov_ProgTotal" runat="server" ControlToValidate="TxtDeputiNoofcov_ProgTotal" ErrorMessage="No of Coverage Total Progressive" Display="None"> </asp:RequiredFieldValidator>
                                                        <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtDeputiNoofcov_ProgTotal" runat="server" TargetControlID="RequiredFieldValidatorTxtDeputiNoofcov_ProgTotal"></ajaxToolkit:ValidatorCalloutExtender>
                                                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtDeputiNoofcov_ProgTotal" runat="server" TargetControlID="TxtDeputiNoofcov_ProgTotal" ValidChars=".0123456789"></ajaxToolkit:FilteredTextBoxExtender>

                                                    </div>


                                                </div>

                                            </div>




                                        </fieldset>










                                        <fieldset class="well" style="width: 95%;">
                                            <legend class="well-legend">Actual Duration of Coverages(in. Hrs)</legend>


                                            <div class="row">


                                                <div class="row col-lg-12">

                                                    <div class="col-lg-3">
                                                        <h4>Live(Current Month)</h4>
                                                    </div>


                                                    <div class="col-lg-3">

                                                        <asp:TextBox ID="TxtDeputiActualcov_LiveCurrent" runat="server" Width="70%" CssClass="form-control" MaxLength="6" AutoPostBack="true" OnTextChanged="TxtDeputiActualcov_LiveCurrent_TextChanged"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtDeputiActualcov_LiveCurrent" runat="server" ControlToValidate="TxtDeputiActualcov_LiveCurrent" ErrorMessage="No of Coverage Live Current" Display="None"> </asp:RequiredFieldValidator>
                                                        <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtDeputiActualcov_LiveCurrent" runat="server" TargetControlID="RequiredFieldValidatorTxtDeputiActualcov_LiveCurrent"></ajaxToolkit:ValidatorCalloutExtender>
                                                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtDeputiActualcov_LiveCurrent" runat="server" TargetControlID="TxtDeputiActualcov_LiveCurrent" ValidChars=".0123456789"></ajaxToolkit:FilteredTextBoxExtender>


                                                    </div>


                                                    <div class="col-lg-3 ">
                                                        <h4>Live(Progressive)</h4>
                                                    </div>


                                                    <div class="col-lg-3">

                                                        <asp:TextBox ID="TxtDeputiActualcov_ProgLive" Width="70%" runat="server" CssClass="form-control" MaxLength="6"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtDeputiActualcov_ProgLive" runat="server" ControlToValidate="TxtDeputiActualcov_ProgLive" ErrorMessage="No of Coverage Live Progressive" Display="None"> </asp:RequiredFieldValidator>
                                                        <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtDeputiActualcov_ProgLive" runat="server" TargetControlID="RequiredFieldValidatorTxtDeputiActualcov_ProgLive"></ajaxToolkit:ValidatorCalloutExtender>
                                                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtDeputiActualcov_ProgLive" runat="server" TargetControlID="TxtDeputiActualcov_ProgLive" ValidChars=".0123456789"></ajaxToolkit:FilteredTextBoxExtender>

                                                    </div>

                                                </div>

                                            </div>


                                            <div class="row">

                                                <div class="row col-lg-12">

                                                    <div class="col-lg-3">
                                                        <h4>Recording(Current Month)</h4>
                                                    </div>

                                                    <div class="col-lg-3">

                                                        <asp:TextBox ID="TxtDeputiActualcov_RECCurrent" runat="server" Width="70%" CssClass="form-control" MaxLength="6" AutoPostBack="true" OnTextChanged="TxtDeputiActualcov_RECCurrent_TextChanged"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtDeputiActualcov_RECCurrent" runat="server" ControlToValidate="TxtDeputiActualcov_RECCurrent" ErrorMessage="No of Coverage Recording Current" Display="None"> </asp:RequiredFieldValidator>
                                                        <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtDeputiActualcov_RECCurrent" runat="server" TargetControlID="RequiredFieldValidatorTxtDeputiActualcov_RECCurrent"></ajaxToolkit:ValidatorCalloutExtender>
                                                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtDeputiActualcov_RECCurrent" runat="server" TargetControlID="TxtDeputiActualcov_RECCurrent" ValidChars=".0123456789"></ajaxToolkit:FilteredTextBoxExtender>

                                                    </div>



                                                    <div class="col-lg-3 ">
                                                        <h4>Recording(Progressive)</h4>
                                                    </div>


                                                    <div class="col-lg-3">


                                                        <asp:TextBox ID="TxtDeputiActualcov_ProgREC" Width="70%" runat="server" CssClass="form-control" AutoPostBack="true" MaxLength="6" OnTextChanged="TxtDeputiActualcov_ProgREC_TextChanged"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtDeputiActualcov_ProgREC" runat="server" ControlToValidate="TxtDeputiActualcov_ProgREC" ErrorMessage="No of Coverage Recording Progressive" Display="None"> </asp:RequiredFieldValidator>
                                                        <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtDeputiActualcov_ProgREC" runat="server" TargetControlID="RequiredFieldValidatorTxtDeputiActualcov_ProgREC"></ajaxToolkit:ValidatorCalloutExtender>
                                                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtDeputiActualcov_ProgREC" runat="server" TargetControlID="TxtDeputiActualcov_ProgREC" ValidChars=".0123456789"></ajaxToolkit:FilteredTextBoxExtender>

                                                    </div>

                                                </div>

                                            </div>


                                            <div class="row">

                                                <div class="row col-lg-12">

                                                    <div class="col-lg-3 ">
                                                        <h4>Total(Current Month)</h4>
                                                    </div>

                                                    <div class="col-lg-3">

                                                        <asp:TextBox ID="TxtDeputiActualcov_TotalCurrent" runat="server" Width="70%" CssClass="form-control" MaxLength="6" AutoPostBack="true"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtDeputiActualcov_TotalCurrent" runat="server" ControlToValidate="TxtDeputiActualcov_TotalCurrent" ErrorMessage="No of Coverage Total Current" Display="None"> </asp:RequiredFieldValidator>
                                                        <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtDeputiActualcov_TotalCurrent" runat="server" TargetControlID="RequiredFieldValidatorTxtDeputiActualcov_TotalCurrent"></ajaxToolkit:ValidatorCalloutExtender>
                                                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtDeputiActualcov_TotalCurrent" runat="server" TargetControlID="TxtDeputiActualcov_TotalCurrent" ValidChars=".0123456789"></ajaxToolkit:FilteredTextBoxExtender>

                                                    </div>


                                                    <div class="col-lg-3 ">
                                                        <h4>Total(Progressive)</h4>
                                                    </div>

                                                    <div class="col-lg-3">

                                                        <asp:TextBox ID="TxtDeputiActualcov_ProgTotal" Width="70%" runat="server" CssClass="form-control" MaxLength="6"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtDeputiActualcov_ProgTotal" runat="server" ControlToValidate="TxtDeputiActualcov_ProgTotal" ErrorMessage="No of Coverage Total Progressive" Display="None"> </asp:RequiredFieldValidator>
                                                        <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtDeputiActualcov_ProgTotal" runat="server" TargetControlID="RequiredFieldValidatorTxtDeputiActualcov_ProgTotal"></ajaxToolkit:ValidatorCalloutExtender>
                                                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtDeputiActualcov_ProgTotal" runat="server" TargetControlID="TxtDeputiActualcov_ProgTotal" ValidChars=".0123456789"></ajaxToolkit:FilteredTextBoxExtender>

                                                    </div>


                                                </div>

                                            </div>




                                        </fieldset>



                                    </div>
                        </div>

                        <section class="page_head" style="width: 100%;">
                            <div class="container">

                                <div class="row">

                                    <div class="row col-lg-12">



                                        <div class="col-lg-2">
                                            <h4>Achievements / Important Activities at the Kendra during the Month</h4>
                                        </div>


                                        <div class="col-lg-8 ">

                                            <asp:TextBox ID="TxtAchvimpactivitiesmonth" runat="server" CssClass="form-control" TextMode="MultiLine" Height="90px"></asp:TextBox>

                                        </div>



                                    </div>

                                </div>
                            </div>
                        </section>


                        <fieldset class="well">
                            <legend class="well-legend">New Equipment Received at the Kendra During the Month</legend>
                            <section class="page_head" style="width: 100%;">
                                <div class="container">

                                    <div class="row">

                                        <div class="row col-lg-12">


                                            <asp:GridView ID="Gridnewequiprec" runat="server" AutoGenerateColumns="False" ShowFooter="true" OnRowDataBound="Gridnewequiprec_RowDataBound"
                                                OnRowCancelingEdit="Gridnewequiprec_RowCancelingEdit1" GridLines="Both" OnRowDeleting="Gridnewequiprec_RowDeleting1" OnRowEditing="Gridnewequiprec_RowEditing1"
                                                OnRowUpdating="Gridnewequiprec_RowUpdating1" CssClass="table" Width="93%">

                                                <Columns>
                                                    <asp:TemplateField>
                                                        <HeaderTemplate>S.No</HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="LblSlnoup" runat="server" Text='<%#Container.DataItemIndex + 1%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center" Visible="false">
                                                        <HeaderTemplate>Equipment ID</HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="LblEquipmentID" runat="server" Text='<%# Server.HtmlEncode((string)Eval("EquipmentID").ToString())%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>


                                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center">
                                                        <HeaderTemplate>Equipment Type</HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="LblEquip_Type" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Equip_Type").ToString())%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>

                                                            <asp:HiddenField ID="hdnequiptypeupdt" runat="server" Value='<%#Server.HtmlEncode((string)Eval("Equip_Type").ToString())%>' />

                                                            <asp:RadioButtonList ID="Radioequiptypeupdt" runat="server" CssClass="Radiospace" RepeatDirection="Horizontal" RepeatLayout="Flow">

                                                                <asp:ListItem>New Equipment</asp:ListItem>
                                                                <asp:ListItem>Surplus/Unused</asp:ListItem>

                                                            </asp:RadioButtonList>
                                                        </EditItemTemplate>

                                                        <FooterTemplate>

                                                            <asp:RadioButtonList ID="Radioequiptypeins" runat="server" CssClass="Radiospace" RepeatDirection="Vertical" RepeatLayout="Flow">

                                                                <asp:ListItem>New Equipment</asp:ListItem>
                                                                <asp:ListItem>Surplus/Unused</asp:ListItem>

                                                            </asp:RadioButtonList>

                                                        </FooterTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle"></HeaderStyle>
                                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField ItemStyle-HorizontalAlign="left" ItemStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center">
                                                        <HeaderTemplate>New Equipment Name</HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="LblEquipment_NM" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Equipment_NM").ToString())%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TxtEquipment_NMupdt" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Equipment_NM").ToString())%>' class="form-control"></asp:TextBox>
                                                        </EditItemTemplate>

                                                        <FooterTemplate>
                                                            <asp:TextBox ID="TxtEquipment_NMins" runat="server" class="form-control"></asp:TextBox>
                                                        </FooterTemplate>
                                                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField ItemStyle-HorizontalAlign="left" ItemStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center">
                                                        <HeaderTemplate>Performance</HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="LblEquipment_Performance" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Equipment_Performance").ToString())%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TxtEquipment_Performanceupdt" runat="server" TextMode="MultiLine" Text='<%# Server.HtmlEncode((string)Eval("Equipment_Performance").ToString())%>' class="form-control"></asp:TextBox>
                                                        </EditItemTemplate>

                                                        <FooterTemplate>
                                                            <asp:TextBox ID="TxtEquipment_Performanceins" runat="server" TextMode="MultiLine" class="form-control"></asp:TextBox>
                                                        </FooterTemplate>
                                                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField ItemStyle-HorizontalAlign="center" ItemStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center">
                                                        <HeaderTemplate>Date of Installtion</HeaderTemplate>
                                                        <ItemTemplate>

                                                            <asp:Label ID="LblDt_Installtion" runat="server" Text='<%# Eval("Dt_Installtion", "{0:d}")%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TxtDt_Installtionupdt" Width="50%" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Dt_Installtion").ToString())%>' class="form-control"></asp:TextBox>

                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtDt_Installtionupdt" runat="server" ControlToValidate="TxtDt_Installtionupdt" Display="None" ErrorMessage="Date of Installtion!"> </asp:RequiredFieldValidator>
                                                            <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtDt_Installtionupdt" runat="server" TargetControlID="RequiredFieldValidatorTxtDt_Installtionupdt">
                                                            </ajaxToolkit:ValidatorCalloutExtender>

                                                            <ajaxToolkit:CalendarExtender ID="CalenderTxtDt_Installtionupdt" TargetControlID="TxtDt_Installtionupdt" runat="server" PopupPosition="TopRight" Enabled="True" Format="dd/MM/yyyy"></ajaxToolkit:CalendarExtender>


                                                        </EditItemTemplate>

                                                        <FooterTemplate>
                                                            <asp:TextBox ID="TxtDt_Installtionins" runat="server" Width="50%" class="form-control"></asp:TextBox>

                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtDt_Installtionins" runat="server" ControlToValidate="TxtDt_Installtionins" Display="None" ErrorMessage="Date of Installtion!"> </asp:RequiredFieldValidator>
                                                            <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtDt_Installtionins" runat="server" TargetControlID="RequiredFieldValidatorTxtDt_Installtionins">
                                                            </ajaxToolkit:ValidatorCalloutExtender>

                                                            <ajaxToolkit:CalendarExtender ID="CalenderTxtDt_Installtionins" TargetControlID="TxtDt_Installtionins" runat="server" PopupPosition="TopRight" Enabled="True" Format="dd/MM/yyyy"></ajaxToolkit:CalendarExtender>

                                                        </FooterTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" Width="15%"></HeaderStyle>
                                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="15%"></ItemStyle>
                                                        <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="15%" />
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

                                                     <asp:TemplateField ItemStyle-HorizontalAlign="left" ItemStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center">
                                                        <HeaderTemplate>Make</HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="LblEquip_Make" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Equip_Make").ToString())%>'></asp:Label>                      
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TxtEquip_Makeupdt" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Equip_Make").ToString())%>' class="form-control"></asp:TextBox>                                                            
                                                        </EditItemTemplate>

                                                        <FooterTemplate>
                                                            <asp:TextBox ID="TxtEquip_Makeins" runat="server" class="form-control"></asp:TextBox>                                                           
                                                        </FooterTemplate>
                                                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField ItemStyle-HorizontalAlign="left" ItemStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center">
                                                        <HeaderTemplate>Model</HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="LblEquip_Model" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Equip_Model").ToString())%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TxtEquip_Modelupdt" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Equip_Model").ToString())%>' class="form-control"></asp:TextBox>
                                                        </EditItemTemplate>

                                                        <FooterTemplate>
                                                            <asp:TextBox ID="TxtEquip_Modelins" runat="server" class="form-control"></asp:TextBox>
                                                        </FooterTemplate>
                                                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField ItemStyle-HorizontalAlign="left" ItemStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center">
                                                        <HeaderTemplate>Serial No.</HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="LblEquip_Serialno" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Equip_Serialno").ToString())%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TxtEquip_Serialnoupdt" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Equip_Serialno").ToString())%>' class="form-control"></asp:TextBox>
                                                        </EditItemTemplate>

                                                        <FooterTemplate>
                                                            <asp:TextBox ID="TxtEquip_Serialnoins" runat="server" class="form-control"></asp:TextBox>
                                                        </FooterTemplate>
                                                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                                    </asp:TemplateField>


                                                    <asp:TemplateField ItemStyle-HorizontalAlign="left" ItemStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center">
                                                        <HeaderTemplate>Status</HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="LblEquip_Status" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Equip_Status").ToString())%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TxtEquip_Statusupdt" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Equip_Status").ToString())%>' class="form-control"></asp:TextBox>
                                                        </EditItemTemplate>

                                                        <FooterTemplate>
                                                            <asp:TextBox ID="TxtEquip_Statusins" runat="server" class="form-control" TextMode="MultiLine"></asp:TextBox>
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
                                                            <asp:Button ID="Btnsaveequip" runat="server" Text="Add" CausesValidation="false" OnClick="SaveRecord" CssClass="form-control" />
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
                            <legend class="well-legend">AC Plant</legend>
                            <section class="page_head" style="width: 100%;">
                                <div class="container">

                                    <div class="row">

                                        <div class="row col-lg-12">


                                            <asp:GridView ID="GridViewacplant" runat="server" AutoGenerateColumns="False" ShowFooter="true" OnRowDataBound="GridViewacplant_RowDataBound"
                                                OnRowCancelingEdit="GridViewacplant_RowCancelingEdit1" GridLines="Both" OnRowDeleting="GridViewacplant_RowDeleting1" OnRowEditing="GridViewacplant_RowEditing1"
                                                OnRowUpdating="GridViewacplant_RowUpdating1" CssClass="table" Width="93%">

                                                <Columns>
                                                    <asp:TemplateField>
                                                        <HeaderTemplate>S.No</HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="LblSlnoup" runat="server" Text='<%#Container.DataItemIndex + 1%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center" Visible="false">
                                                        <HeaderTemplate>AC PlantID</HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="LblACPlantID" runat="server" Text='<%# Server.HtmlEncode((string)Eval("ACPlantID").ToString())%>'></asp:Label>
                                                        </ItemTemplate>

                                                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>

                                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                                    </asp:TemplateField>


                                                    <asp:TemplateField ItemStyle-HorizontalAlign="left" ItemStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center">
                                                        <HeaderTemplate>AC Plant Name</HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="LblACPlantNM" runat="server" Text='<%# Server.HtmlEncode((string)Eval("ACPlantNM").ToString())%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TxtACPlantNMupdt" runat="server" Text='<%# Server.HtmlEncode((string)Eval("ACPlantNM").ToString())%>' class="form-control"></asp:TextBox>
                                                        </EditItemTemplate>

                                                        <FooterTemplate>
                                                            <asp:TextBox ID="TxtACPlantNMins" runat="server" class="form-control"></asp:TextBox>
                                                        </FooterTemplate>
                                                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField ItemStyle-HorizontalAlign="left" ItemStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center">
                                                        <HeaderTemplate>Capacity</HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="LblACPlantCapacity" runat="server" Text='<%# Server.HtmlEncode((string)Eval("ACPlantCapacity").ToString())%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TxtACPlantCapacityupdt" runat="server" MaxLength="5" Text='<%# Server.HtmlEncode((string)Eval("ACPlantCapacity").ToString())%>' class="form-control"></asp:TextBox>
                                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtACPlantCapacityupdt" runat="server" TargetControlID="TxtACPlantCapacityupdt" ValidChars=".0123456789"></ajaxToolkit:FilteredTextBoxExtender>
                                                        </EditItemTemplate>

                                                        <FooterTemplate>
                                                            <asp:TextBox ID="TxtACPlantCapacityins" runat="server" MaxLength="5" class="form-control"></asp:TextBox>
                                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtACPlantCapacityins" runat="server" TargetControlID="TxtACPlantCapacityins" ValidChars=".0123456789"></ajaxToolkit:FilteredTextBoxExtender>
                                                        </FooterTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" Width="10%"></HeaderStyle>
                                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="10%"></ItemStyle>
                                                    </asp:TemplateField>



                                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center">
                                                        <HeaderTemplate>Date of Installtion</HeaderTemplate>
                                                        <ItemTemplate>

                                                            <asp:Label ID="LblACPlantInstall_DT" runat="server" Text='<%# Eval("ACPlantInstall_DT", "{0:d}")%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TxtACPlantInstall_DTupdt" runat="server" Width="50%" Text='<%# Server.HtmlEncode((string)Eval("ACPlantInstall_DT").ToString())%>' class="form-control"></asp:TextBox>

                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtACPlantInstall_DTupdt" runat="server" ControlToValidate="TxtACPlantInstall_DTupdt" Display="None" ErrorMessage="Date of Installtion!"> </asp:RequiredFieldValidator>
                                                            <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtACPlantInstall_DTupdt" runat="server" TargetControlID="RequiredFieldValidatorTxtACPlantInstall_DTupdt">
                                                            </ajaxToolkit:ValidatorCalloutExtender>

                                                            <ajaxToolkit:CalendarExtender ID="CalenderTxtACPlantInstall_DTupdt" TargetControlID="TxtACPlantInstall_DTupdt" runat="server" PopupPosition="TopRight" Enabled="True" Format="dd/MM/yyyy"></ajaxToolkit:CalendarExtender>


                                                        </EditItemTemplate>

                                                        <FooterTemplate>
                                                            <asp:TextBox ID="TxtACPlantInstall_DTins" Width="60%" runat="server" class="form-control"></asp:TextBox>

                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtACPlantInstall_DTins" runat="server" ControlToValidate="TxtACPlantInstall_DTins" Display="None" ErrorMessage="Date of Installtion!"> </asp:RequiredFieldValidator>
                                                            <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtenderTxtACPlantInstall_DTins" runat="server" TargetControlID="RequiredFieldValidatorTxtACPlantInstall_DTins">
                                                            </ajaxToolkit:ValidatorCalloutExtender>

                                                            <ajaxToolkit:CalendarExtender ID="CalenderTxtACPlantInstall_DTins" TargetControlID="TxtACPlantInstall_DTins" runat="server" PopupPosition="TopRight" Enabled="True" Format="dd/MM/yyyy"></ajaxToolkit:CalendarExtender>

                                                        </FooterTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" Width="15%"></HeaderStyle>
                                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="15%"></ItemStyle>
                                                        <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="15%" />
                                                    </asp:TemplateField>



                                                    <asp:TemplateField ItemStyle-HorizontalAlign="left" ItemStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center">
                                                        <HeaderTemplate>
                                                            Working Hours(Current Month)<hr />
                                                            Progressive
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="LblACPlantCurrentHR" runat="server" Text='<%# Server.HtmlEncode((string)Eval("ACPlantCurrentHR").ToString())%>'></asp:Label>Hr
                                                            <asp:Label ID="LblACPlantCurrentMin" runat="server" Text='<%# Server.HtmlEncode((string)Eval("ACPlantCurrentMin").ToString())%>'></asp:Label>Min
                                                            <hr />
                                                            <asp:Label ID="LblACPlantProgHR" runat="server" Text='<%# Server.HtmlEncode((string)Eval("ACPlantProgHR").ToString())%>'></asp:Label>Hr
                                                            <asp:Label ID="LblACPlantProgMin" runat="server" Text='<%# Server.HtmlEncode((string)Eval("ACPlantProgMin").ToString())%>'></asp:Label>Min
                                                        </ItemTemplate>
                                                        <EditItemTemplate>

                                                            <asp:UpdatePanel ID="updtpnlhrminupdt" runat="server">
                                                                <ContentTemplate>

                                                                    <asp:TextBox ID="TxtACPlantCurrentHRupdt" runat="server" Width="20%" AutoPostBack="true" Text='<%# Server.HtmlEncode((string)Eval("ACPlantCurrentHR").ToString())%>' OnTextChanged="TxtACPlantCurrentHRupdt_TextChanged"></asp:TextBox>Hr.
                                                             <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtACPlantCurrentHRupdt" runat="server" TargetControlID="TxtACPlantCurrentHRupdt" ValidChars="0123456789"></ajaxToolkit:FilteredTextBoxExtender>
                                                                    <asp:TextBox ID="TxtACPlantCurrentMinupdt" runat="server" Width="20%" AutoPostBack="true" Text='<%# Server.HtmlEncode((string)Eval("ACPlantCurrentMin").ToString())%>' OnTextChanged="TxtACPlantCurrentMinupdt_TextChanged"></asp:TextBox>Min.
                                                             <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtACPlantCurrentMinupdt" runat="server" TargetControlID="TxtACPlantCurrentMinupdt" ValidChars="0123456789"></ajaxToolkit:FilteredTextBoxExtender>
                                                                    <hr />
                                                                    <asp:TextBox ID="TxtACPlantProgHRupdt" runat="server" Width="20%" AutoPostBack="true" Text='<%# Server.HtmlEncode((string)Eval("ACPlantProgHR").ToString())%>'></asp:TextBox>Hr.
                                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtACPlantProgHRupdt" runat="server" TargetControlID="TxtACPlantProgHRupdt" ValidChars="0123456789"></ajaxToolkit:FilteredTextBoxExtender>
                                                                    <asp:TextBox ID="TxtACPlantProgMinupdt" runat="server" Width="20%" Text='<%# Server.HtmlEncode((string)Eval("ACPlantProgMin").ToString())%>'></asp:TextBox>Min.
                                                             <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtACPlantProgMinupdt" runat="server" TargetControlID="TxtACPlantProgMinupdt" ValidChars="0123456789"></ajaxToolkit:FilteredTextBoxExtender>

                                                                </ContentTemplate>

                                                                <Triggers>

                                                                    <%-- <asp:PostBackTrigger ControlID="Btnsubmit" />--%>
                                                                    <asp:AsyncPostBackTrigger ControlID="TxtACPlantCurrentHRupdt" EventName="TextChanged" />
                                                                    <asp:AsyncPostBackTrigger ControlID="TxtACPlantCurrentMinupdt" EventName="TextChanged" />
                                                                    <%-- <asp:AsyncPostBackTrigger ControlID="Btncancel" EventName="Click" />--%>
                                                                </Triggers>

                                                            </asp:UpdatePanel>

                                                        </EditItemTemplate>

                                                        <FooterTemplate>

                                                            <asp:UpdatePanel ID="updtpnlhrmin" runat="server">
                                                                <ContentTemplate>

                                                                    <asp:TextBox ID="TxtACPlantCurrentHRins" runat="server" Width="20%" AutoPostBack="true" OnTextChanged="TxtACPlantCurrentHRins_TextChanged"> </asp:TextBox>Hr.
                                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtACPlantCurrentHRins" runat="server" TargetControlID="TxtACPlantCurrentHRins" ValidChars="0123456789"></ajaxToolkit:FilteredTextBoxExtender>

                                                                    <asp:RangeValidator ID="RangeValidatorTxtACPlantCurrentHRins" runat="server" ControlToValidate="TxtACPlantCurrentHRins" MinimumValue="0" MaximumValue="24" ErrorMessage="Min in range 0 to 24" Text="range 0 to 24" ForeColor="Red" Display="Dynamic"></asp:RangeValidator>

                                                                    <asp:TextBox ID="TxtACPlantCurrentMinins" runat="server" Width="20%" AutoPostBack="true" OnTextChanged="TxtACPlantCurrentMinins_TextChanged"></asp:TextBox>Min.
                                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtACPlantCurrentMinins" runat="server" TargetControlID="TxtACPlantCurrentMinins" ValidChars="0123456789"></ajaxToolkit:FilteredTextBoxExtender>

                                                                    <asp:RangeValidator ID="RangeValidatorTxtACPlantCurrentMinins" runat="server" ControlToValidate="TxtACPlantCurrentMinins" MinimumValue="0" MaximumValue="60" ErrorMessage="Min in range 0 to 60" Text="range 0 to 60" ForeColor="Red" Display="Dynamic"></asp:RangeValidator>


                                                                    <hr />
                                                                    <asp:TextBox ID="TxtACPlantProgHRins" runat="server" Width="20%"></asp:TextBox>Hr.
                                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtACPlantProgHRins" runat="server" TargetControlID="TxtACPlantProgHRins" ValidChars="0123456789"></ajaxToolkit:FilteredTextBoxExtender>

                                                                    <asp:RangeValidator ID="RangeValidatorTxtACPlantProgHRins" runat="server" ControlToValidate="TxtACPlantProgHRins" MinimumValue="0" MaximumValue="24" ErrorMessage="Min in range 0 to 24" Text="range 0 to 24" ForeColor="Red" Display="Dynamic"></asp:RangeValidator>

                                                                    <asp:TextBox ID="TxtACPlantProgMinins" runat="server" Width="20%"></asp:TextBox>Min.
                                                             <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtACPlantProgMinins" runat="server" TargetControlID="TxtACPlantProgMinins" ValidChars="0123456789"></ajaxToolkit:FilteredTextBoxExtender>

                                                                    <asp:RangeValidator ID="RangeValidatorTxtACPlantProgMinins" runat="server" ControlToValidate="TxtACPlantProgMinins" MinimumValue="0" MaximumValue="60" ErrorMessage="Min in range 0 to 60" Text="range 0 to 60" ForeColor="Red" Display="Dynamic"></asp:RangeValidator>

                                                                </ContentTemplate>

                                                                <Triggers>

                                                                    <%-- <asp:PostBackTrigger ControlID="Btnsubmit" />--%>
                                                                    <asp:AsyncPostBackTrigger ControlID="TxtACPlantCurrentHRins" EventName="TextChanged" />
                                                                    <asp:AsyncPostBackTrigger ControlID="TxtACPlantCurrentMinins" EventName="TextChanged" />
                                                                    <%-- <asp:AsyncPostBackTrigger ControlID="Btncancel" EventName="Click" />--%>
                                                                </Triggers>

                                                            </asp:UpdatePanel>

                                                        </FooterTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" Width="140px"></HeaderStyle>
                                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="140px"></ItemStyle>
                                                        <FooterStyle Width="90px" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                    </asp:TemplateField>



                                                    <asp:TemplateField ItemStyle-HorizontalAlign="left" ItemStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center">
                                                        <HeaderTemplate>
                                                            AC Plant Status
                                                                    <hr />
                                                            Reason
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="LblWorkingStatus_NM" runat="server" Text='<%# Server.HtmlEncode((string)Eval("WorkingStatus_NM").ToString())%>'></asp:Label><hr />
                                                            <asp:Label ID="LblACPlantNotWorkReason" runat="server" Text='<%# Server.HtmlEncode((string)Eval("ACPlantNotWorkReason").ToString())%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>

                                                            <asp:UpdatePanel ID="updtworkstatusins" runat="server">
                                                                <ContentTemplate>

                                                                    <asp:HiddenField ID="hdnacplantupdt" runat="server" Value='<%#Server.HtmlEncode((string)Eval("WorkingStatus_NM").ToString())%>' />
                                                                    <asp:DropDownList ID="ddlworkingACPlantStatusupdt" runat="server" AutoPostBack="true" CssClass="form-control" OnSelectedIndexChanged="ddlworkingACPlantStatusupdt_SelectedIndexChanged"></asp:DropDownList><hr />
                                                                    <asp:TextBox ID="TxtACPlantNotWorkReasonupdt" runat="server" Text='<%# Server.HtmlEncode((string)Eval("ACPlantNotWorkReason").ToString())%>' class="form-control"></asp:TextBox>


                                                                </ContentTemplate>

                                                                <Triggers>

                                                                    <asp:AsyncPostBackTrigger ControlID="ddlworkingACPlantStatusupdt" EventName="SelectedIndexChanged" />

                                                                </Triggers>

                                                            </asp:UpdatePanel>

                                                        </EditItemTemplate>

                                                        <FooterTemplate>

                                                            <asp:UpdatePanel ID="updtworkstatusins" runat="server">
                                                                <ContentTemplate>

                                                                    <asp:DropDownList ID="ddlworkingACPlantStatus" runat="server" AutoPostBack="true" CssClass="form-control" OnSelectedIndexChanged="ddlworkingACPlantStatus_SelectedIndexChanged"></asp:DropDownList>

                                                                    <asp:TextBox ID="TxtACPlantNotWorkReasonins" runat="server" class="form-control" TextMode="MultiLine"></asp:TextBox>

                                                                </ContentTemplate>

                                                                <Triggers>


                                                                    <asp:AsyncPostBackTrigger ControlID="ddlworkingACPlantStatus" EventName="SelectedIndexChanged" />



                                                                </Triggers>

                                                            </asp:UpdatePanel>

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
                                                            <asp:Button ID="Btnsaveacplant" runat="server" Text="Add" OnClick="SaveRecordacplant" CssClass="form-control" CausesValidation="false" />
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
                            <legend class="well-legend">UPS</legend>
                            <section class="page_head" style="width: 100%; margin-top: 0px;">
                                <div class="container">

                                    <div class="row">

                                        <div class="row col-lg-12">


                                            <asp:GridView ID="GridViewUPS" runat="server" AutoGenerateColumns="False" ShowFooter="true"
                                                OnRowCancelingEdit="GridViewUPS_RowCancelingEdit1" GridLines="Both" OnRowDeleting="GridViewUPS_RowDeleting1" OnRowEditing="GridViewUPS_RowEditing1"
                                                OnRowUpdating="GridViewUPS_RowUpdating1" CssClass="table" Width="93%">

                                                <Columns>
                                                    <asp:TemplateField>
                                                        <HeaderTemplate>S.No</HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="LblSlnoup" runat="server" Text='<%#Container.DataItemIndex + 1%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center" Visible="false">
                                                        <HeaderTemplate>UPS ID</HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="LblUPSID" runat="server" Text='<%# Server.HtmlEncode((string)Eval("UPSID").ToString())%>'></asp:Label>
                                                        </ItemTemplate>

                                                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>

                                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                                    </asp:TemplateField>


                                                    <asp:TemplateField ItemStyle-HorizontalAlign="left" ItemStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center">
                                                        <HeaderTemplate>UPS Name</HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="LblUPS_NM" runat="server" Text='<%# Server.HtmlEncode((string)Eval("UPS_NM").ToString())%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TxtUPS_NMupdt" runat="server" Text='<%# Server.HtmlEncode((string)Eval("UPS_NM").ToString())%>' class="form-control"></asp:TextBox>
                                                        </EditItemTemplate>

                                                        <FooterTemplate>
                                                            <asp:TextBox ID="TxtUPS_NMins" runat="server" class="form-control"></asp:TextBox>
                                                        </FooterTemplate>
                                                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center">
                                                        <HeaderTemplate>UPS capacity</HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="LblUPS_Capacity" runat="server" Text='<%# Server.HtmlEncode((string)Eval("UPS_Capacity").ToString())%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TxtUPS_Capacityupdt" Width="50%" runat="server" MaxLength="5" Text='<%# Server.HtmlEncode((string)Eval("UPS_Capacity").ToString())%>' class="form-control"></asp:TextBox>
                                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtUPS_Capacityupdt" runat="server" TargetControlID="TxtUPS_Capacityupdt" ValidChars=".0123456789"></ajaxToolkit:FilteredTextBoxExtender>
                                                        </EditItemTemplate>

                                                        <FooterTemplate>
                                                            <asp:TextBox ID="TxtUPS_Capacityins" runat="server" Width="50%" class="form-control" MaxLength="5"></asp:TextBox>
                                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTxtUPS_Capacityins" runat="server" TargetControlID="TxtUPS_Capacityins" ValidChars=".0123456789"></ajaxToolkit:FilteredTextBoxExtender>
                                                        </FooterTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" Width="20%"></HeaderStyle>
                                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="20%"></ItemStyle>
                                                        <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                    </asp:TemplateField>

                                                    <asp:TemplateField ItemStyle-HorizontalAlign="left" ItemStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center">
                                                        <HeaderTemplate>UPS Status</HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="LblUPS_Status" runat="server" Text='<%# Server.HtmlEncode((string)Eval("UPS_Status").ToString())%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TxtUPS_Statusupdt" runat="server" Text='<%# Server.HtmlEncode((string)Eval("UPS_Status").ToString())%>' class="form-control"></asp:TextBox>
                                                        </EditItemTemplate>

                                                        <FooterTemplate>
                                                            <asp:TextBox ID="TxtUPS_Statusins" runat="server" class="form-control" TextMode="MultiLine"></asp:TextBox>
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
                                                            <asp:Button ID="Btnsaveacplant" runat="server" Text="Add" OnClick="SaveRecordups" CssClass="form-control" CausesValidation="false" />
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
                            <legend class="well-legend">Details of all Defective Equipments at kendra/ Action Taken</legend>
                            <section class="page_head" style="width: 100%;">
                                <div class="container">

                                    <div class="row">

                                        <div class="row col-lg-12">


                                            <asp:GridView ID="GridViewDefectiveEquipment" runat="server" AutoGenerateColumns="False" ShowFooter="true"
                                                OnRowCancelingEdit="GridViewDefectiveEquipment_RowCancelingEdit1" GridLines="Both" OnRowDeleting="GridViewDefectiveEquipment_RowDeleting1" OnRowEditing="GridViewDefectiveEquipment_RowEditing1"
                                                OnRowUpdating="GridViewDefectiveEquipment_RowUpdating1" CssClass="table" Width="93%">

                                                <Columns>
                                                    <asp:TemplateField>
                                                        <HeaderTemplate>S.No</HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="LblSlnodefect" runat="server" Text='<%#Container.DataItemIndex + 1%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center" Visible="false">
                                                        <HeaderTemplate>Defective Equipment ID</HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="LblDefectEquipID" runat="server" Text='<%# Server.HtmlEncode((string)Eval("DefectEquipID").ToString())%>'></asp:Label>
                                                        </ItemTemplate>

                                                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>

                                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                                    </asp:TemplateField>


                                                    <asp:TemplateField ItemStyle-HorizontalAlign="left" ItemStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center">
                                                        <HeaderTemplate>Defective Equipment Name</HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="LblDefectEquipNM" runat="server" Text='<%# Server.HtmlEncode((string)Eval("DefectEquipNM").ToString())%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TxtDefectEquipNMupdt" runat="server" Text='<%# Server.HtmlEncode((string)Eval("DefectEquipNM").ToString())%>' class="form-control"></asp:TextBox>
                                                        </EditItemTemplate>

                                                        <FooterTemplate>
                                                            <asp:TextBox ID="TxtDefectEquipNMins" runat="server" class="form-control"></asp:TextBox>
                                                        </FooterTemplate>
                                                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField ItemStyle-HorizontalAlign="left" ItemStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center">
                                                        <HeaderTemplate>Defective Equipment Problem</HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="LblDefectEquipProblem" runat="server" Text='<%# Server.HtmlEncode((string)Eval("DefectEquipProblem").ToString())%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TxtDefectEquipProblemupdt" runat="server" Text='<%# Server.HtmlEncode((string)Eval("DefectEquipProblem").ToString())%>' class="form-control"></asp:TextBox>
                                                        </EditItemTemplate>

                                                        <FooterTemplate>
                                                            <asp:TextBox ID="TxtDefectEquipProblemins" runat="server" class="form-control"></asp:TextBox>
                                                        </FooterTemplate>
                                                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField ItemStyle-HorizontalAlign="left" ItemStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center">
                                                        <HeaderTemplate>Defective Equipment Action</HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="LblDefectEquipAction" runat="server" Text='<%# Server.HtmlEncode((string)Eval("DefectEquipAction").ToString())%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TxtDefectEquipActionupdt" runat="server" Text='<%# Server.HtmlEncode((string)Eval("DefectEquipAction").ToString())%>' class="form-control"></asp:TextBox>
                                                        </EditItemTemplate>

                                                        <FooterTemplate>
                                                            <asp:TextBox ID="TxtDefectEquipActionins" runat="server" class="form-control" TextMode="MultiLine"></asp:TextBox>
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
                                                            <asp:Button ID="BtnsaveSaveRecordDefectiveEquipment" runat="server" CssClass="form-control" Text="Add" OnClick="SaveRecordDefectiveEquipment" CausesValidation="false" />
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

                        <section class="page_head" style="width: 100%;">
                            <div class="container">

                                <div class="row">

                                    <div class="row col-lg-12">



                                        <div class="col-lg-2">
                                            <h4>Remarks</h4>
                                        </div>


                                        <div class="col-lg-8 ">

                                            <asp:TextBox ID="Txtremarks" runat="server" Width="80%" CssClass="form-control" TextMode="MultiLine" Height="90px"></asp:TextBox>

                                        </div>



                                    </div>

                                </div>
                            </div>
                        </section>

                        <section class="page_head" style="width: 100%;">
                            <div class="container">

                                <div class="row">

                                    <div class="row col-lg-12">


                                        <div class="col-lg-7 ">

                                            <asp:Button ID="Btnsubmit" runat="server" CssClass="btn btn-default btn-lg" CausesValidation="false" Text="Submit" OnClick="Btnsubmit_Click" />
                                            &nbsp;&nbsp;

                                                        <asp:Button ID="Btnupdate" runat="server" CssClass="btn btn-default btn-lg" CausesValidation="false" Text="Update" OnClick="Btnupdate_Click" />
                                            &nbsp;&nbsp;

                                                        <asp:Button ID="Btncancel" runat="server" CssClass="btn btn-default btn-lg" Text="Cancel" CausesValidation="false" OnClick="Btncancel_Click1" />
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



                                        <asp:GridView ID="Gridstudiosetuprpt" runat="server" AutoGenerateColumns="False" AllowPaging="true" PageSize="2" OnRowCommand="Gridstudiosetuprpt_RowCommand" OnRowEditing="Gridstudiosetuprpt_RowEditing"
                                            OnRowDeleting="Gridstudiosetuprpt_RowDeleting1" OnPageIndexChanging="Gridstudiosetuprpt_PageIndexChanging" CssClass="table"
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
                                                        Recording
                                                                    <hr />
                                                        Transmission
                                                                    <hr />
                                                        Shift Allotted
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblStudioutilizn_Recordinghrs" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Studioutilizn_Recordinghrs").ToString())%>'></asp:Label>Hr
                                                                    <asp:Label ID="lblStudioutilizn_Recordingmin" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Studioutilizn_Recordingmin").ToString())%>'></asp:Label>Min<hr />
                                                        <asp:Label ID="lblStudioutilizn_Transmissionhrs" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Studioutilizn_Transmissionhrs").ToString())%>'></asp:Label>Hrs
                                                                    <asp:Label ID="lblStudioutilizn_Transmissionmin" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Studioutilizn_Transmissionmin").ToString())%>'></asp:Label>Min<hr />
                                                        <asp:Label ID="lblStudioutilizn_Shifthrs" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Studioutilizn_Shifthrs").ToString())%>'></asp:Label>Hr
                                                                    <asp:Label ID="lblStudioutilizn_Shiftmin" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Studioutilizn_Shiftmin").ToString())%>'></asp:Label>Min
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField>
                                                    <HeaderTemplate>
                                                        Studio Utilization in % (Current Month)<hr />
                                                        Progessive
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblStudioutilizn_Record_Trans_current" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Studioutilizn_Record_Trans_current").ToString())%>'></asp:Label><hr />
                                                        <asp:Label ID="lblStudioutilizn_Record_Trans_prog" runat="server" Text='<%# Server.HtmlEncode((string)Eval("Studioutilizn_Record_Trans_prog").ToString())%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>



                                                <asp:TemplateField>
                                                    <HeaderTemplate>No of Coverages(Live(Current Month) | (Progressive)</HeaderTemplate>
                                                    <ItemTemplate>

                                                        <asp:Label ID="lblDeputiNoofcov_LiveCurrent" runat="server" Text='<%# Server.HtmlEncode((string)Eval("DeputiNoofcov_LiveCurrent").ToString())%>'></asp:Label>
                                                        &nbsp;&nbsp;| &nbsp;&nbsp;<asp:Label ID="LDeputiNoofcov_ProgLive" runat="server" Text='<%# Server.HtmlEncode((string)Eval("DeputiNoofcov_ProgLive").ToString())%>'></asp:Label>


                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField>
                                                    <HeaderTemplate>No of Coverages(Recording(Current Month) | (Progressive)</HeaderTemplate>
                                                    <ItemTemplate>

                                                        <asp:Label ID="lblDeputiNoofcov_RECCurrent" runat="server" Text='<%# Server.HtmlEncode((string)Eval("DeputiNoofcov_RECCurrent").ToString())%>'></asp:Label>
                                                        &nbsp;&nbsp;| &nbsp;&nbsp;<asp:Label ID="LDeputiNoofcov_ProgREC" runat="server" Text='<%# Server.HtmlEncode((string)Eval("DeputiNoofcov_ProgREC").ToString())%>'></asp:Label>


                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField>
                                                    <HeaderTemplate>No of Coverages(Total(Current Month) | (Progressive)</HeaderTemplate>
                                                    <ItemTemplate>

                                                        <asp:Label ID="lblDeputiNoofcov_TotalCurrent" runat="server" Text='<%# Server.HtmlEncode((string)Eval("DeputiNoofcov_TotalCurrent").ToString())%>'></asp:Label>
                                                        &nbsp;&nbsp;| &nbsp;&nbsp;<asp:Label ID="LDeputiNoofcov_ProgTotal" runat="server" Text='<%# Server.HtmlEncode((string)Eval("DeputiNoofcov_ProgTotal").ToString())%>'></asp:Label>


                                                    </ItemTemplate>
                                                </asp:TemplateField>





                                                <asp:TemplateField>
                                                    <HeaderTemplate>Actual Duration of Coverages(Live(Current Month) | (Progressive)</HeaderTemplate>
                                                    <ItemTemplate>

                                                        <asp:Label ID="lblDeputiActualcov_LiveCurrent" runat="server" Text='<%# Server.HtmlEncode((string)Eval("DeputiActualcov_LiveCurrent").ToString())%>'></asp:Label>
                                                        &nbsp;&nbsp;| &nbsp;&nbsp;<asp:Label ID="LDeputiActualcov_ProgLive" runat="server" Text='<%# Server.HtmlEncode((string)Eval("DeputiActualcov_ProgLive").ToString())%>'></asp:Label>


                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField>
                                                    <HeaderTemplate>Actual Duration of Coverages(Recording(Current Month) | (Progressive)</HeaderTemplate>
                                                    <ItemTemplate>

                                                        <asp:Label ID="lblDeputiActualcov_RECCurrent" runat="server" Text='<%# Server.HtmlEncode((string)Eval("DeputiActualcov_RECCurrent").ToString())%>'></asp:Label>
                                                        &nbsp;&nbsp;| &nbsp;&nbsp;<asp:Label ID="LDeputiActualcov_ProgREC" runat="server" Text='<%# Server.HtmlEncode((string)Eval("DeputiActualcov_ProgREC").ToString())%>'></asp:Label>


                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField>
                                                    <HeaderTemplate>Actual Duration of Coverages(Total(Current Month) | (Progressive)</HeaderTemplate>
                                                    <ItemTemplate>

                                                        <asp:Label ID="lblDeputiActualcov_TotalCurrent" runat="server" Text='<%# Server.HtmlEncode((string)Eval("DeputiActualcov_TotalCurrent").ToString())%>'></asp:Label>
                                                        &nbsp;&nbsp;| &nbsp;&nbsp;<asp:Label ID="LDeputiActualcov_ProgTotal" runat="server" Text='<%# Server.HtmlEncode((string)Eval("DeputiActualcov_ProgTotal").ToString())%>'></asp:Label>


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

    </section>
    </section>
</asp:Content>
