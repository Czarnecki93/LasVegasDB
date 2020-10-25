<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="LasVegasDB.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Las Vegas Magical Show</title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }

        .auto-style2 {
            text-align: center;
            margin-left: 1277px;
            width: 212px;
        }

        .auto-style3 {
            margin-left: 0px;
        }

        .auto-style4 {
            width: 1537px;
            height: 600px;
        }

        </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="login-div" class="auto-style2">
            <asp:TextBox ID="TextBoxUsername" placeholder="Username" runat="server"></asp:TextBox>
            <br />
            <asp:TextBox ID="TextBoxPassword" placeholder="Password" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="ButtonLogin" runat="server" CssClass="auto-style3" Text="LOGIN" Width="150px" OnClick="ButtonLogin_Click" />
            <br />
            <asp:Label ID="LabelLogin" runat="server"></asp:Label>
        </div>
        <h1 class="auto-style1">WELCOME TO THE LAS VEGAS MAGICAL SHOW!</h1>
        <div class="auto-style1">
            <img class="auto-style4" src="WebPics/Dinninghall.jpg" />
        </div>
        <h2 class="auto-style1">TODAY'S PROGRAM</h2>
        <div id="programTable" class="auto-style1">
            <asp:SqlDataSource ID="SqlDataSourceProgram" runat="server" ConnectionString="<%$ ConnectionStrings:LasVegasConnectionString %>" SelectCommand="SELECT seq_no AS &quot;Sequence&quot;, Act.title AS &quot;Title&quot;, Act.description AS &quot;Description&quot;, Act.duration AS &quot;Duration (minutes)&quot;, Magician.artistname AS &quot;Artist&quot;, Act.picture AS &quot; &quot; FROM Program
INNER JOIN Act
ON Program.act_id = Act.id
INNER JOIN Magician
ON Act.Magician_id = Magician.id;"></asp:SqlDataSource>
            <div align="center">
                <asp:GridView ID="GridViewProgram" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceProgram" CellPadding="4" ForeColor="#333333" GridLines="None" HorizontalAlign="Center">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="Sequence" HeaderText="Sequence" SortExpression="Sequence" />
                        <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                        <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                        <asp:BoundField DataField="Duration (minutes)" HeaderText="Duration (minutes)" SortExpression="Duration (minutes)" />
                        <asp:BoundField DataField="Artist" HeaderText="Artist" SortExpression="Artist" />
                        <asp:BoundField DataField=" " HeaderText=" " SortExpression=" " />
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
            </div>
            <div class="auto-style1">
                <br />
                <asp:Label ID="LabelDBMessage" runat="server"></asp:Label>
            </div>
        </div>
    </form>
</body>
</html>
