<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="LasVegasDB.Signup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin</title>
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
            <asp:SqlDataSource ID="SqlDataSourceUsers" runat="server" ConnectionString="<%$ ConnectionStrings:LasVegasConnectionString %>" DeleteCommand="DELETE FROM Magician WHERE (id = @id)" SelectCommand="SELECT id AS 'ID', realname AS 'Name',
CASE
    WHEN accesslevel = 1 THEN 'Manager'
    WHEN accesslevel = 2 THEN 'Secretary'
    ELSE 'Magician'
END AS [Level]
FROM Magician;"></asp:SqlDataSource>
            <br />
            <asp:GridView ID="GridViewUsers" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID" DataSourceID="SqlDataSourceUsers" ForeColor="#333333" GridLines="None" OnRowDeleting="GridViewUsers_RowDeleting">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="Level" HeaderText="Level" ReadOnly="True" SortExpression="Level" />
                    <asp:ButtonField ButtonType="Button" CommandName="Update" HeaderText="Update" ShowHeader="True" Text="Update" />
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
