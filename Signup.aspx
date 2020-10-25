<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="LasVegasDB.Signup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Signup</title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h1 class="auto-style1">CREATE NEW USER</h1>
        <div>
            <asp:DropDownList ID="DropDownListLevel" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownListLevel_SelectedIndexChanged">
                <asp:ListItem Value="Manager">Manager</asp:ListItem>
                <asp:ListItem Value="Secretary">Secretary</asp:ListItem>
                <asp:ListItem Value="Magician">Magician</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            <asp:TextBox ID="TextBoxSignupName" placeholder="Name" runat="server"></asp:TextBox>
            <br />
            <asp:TextBox ID="TextBoxSignupPassword" placeholder="Password" runat="server"></asp:TextBox>
            <br />
            <asp:TextBox ID="TextBoxSignupArtistName" placeholder="Artist name" runat="server" Visible="False"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="ButtonCreateUser" runat="server" OnClick="ButtonCreateUser_Click" Text="Create user" />
            <br />
            <br />
            <asp:Label ID="LabelSignupMessage" runat="server"></asp:Label>
            <br />
        </div>
        <h1 class="auto-style1">MANAGE USERS</h1>
        <div>
            <asp:SqlDataSource ID="SqlDataSourceUsers" runat="server" ConnectionString="<%$ ConnectionStrings:LasVegasConnectionString %>" DeleteCommandType="StoredProcedure" SelectCommand="SELECT Name, Level FROM (
	SELECT Magician.realname AS &quot;Name&quot;, Magician.accesslevel AS Level FROM Magician
	UNION ALL
	SELECT Secretary.name, Secretary.accesslevel AS Level FROM Secretary
	UNION ALL
	SELECT Manager.name, Manager.accesslevel AS Level FROM Manager) 
	AS users
GROUP BY Name, Level
ORDER BY Name, Level;"></asp:SqlDataSource>
            <br />
            <asp:GridView ID="GridViewUsers" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSourceUsers" ForeColor="#333333" GridLines="None" OnRowDeleting="GridViewUsers_RowDeleting">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="True" SortExpression="Name" />
                    <asp:BoundField DataField="Level" HeaderText="Level" ReadOnly="True" SortExpression="Level" />
                    <asp:ButtonField ButtonType="Button" CommandName="Delete" HeaderText="Delete" ShowHeader="True" Text="Delete" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
            <br />
            <asp:Label ID="LabelUserTable" runat="server"></asp:Label>
        </div>
    </form>
</body>
</html>
