<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="practicasdotnet.Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <asp:Label ID="lbltitulo" runat="server" Text="Site de prácticas de ASP.NET C#"></asp:Label>
    <asp:TextBox ID="txtnombre" runat="server"></asp:TextBox>
    <br>
    <asp:CheckBoxList ID="chkcaracteristicas" runat="server">
        <asp:ListItem>Piscina</asp:ListItem>
        <asp:ListItem>Garaje</asp:ListItem>
        <asp:ListItem>Sótano</asp:ListItem>
        <asp:ListItem>Balcón</asp:ListItem>
        <asp:ListItem>Trastero</asp:ListItem>
    </asp:CheckBoxList>
    <br>
    <asp:RadioButtonList ID="rdbsexo" runat="server">
        <asp:ListItem>Hombre</asp:ListItem>
        <asp:ListItem>Mujer</asp:ListItem>
    </asp:RadioButtonList>
    <br>
    <asp:Image ID="imgfoto" runat="server" src="https://i.ytimg.com/vi/_5Wm-dXJM14/mqdefault.jpg" Heigth="96px" Width="96px" />
    <br>
    <asp:Calendar ID="calcalendario" runat="server"></asp:Calendar>
    <br>
    <asp:DropDownList ID="lstcategorias" runat="server">
        <asp:ListItem>Procesado</asp:ListItem>
        <asp:ListItem>Rechazado</asp:ListItem>
        <asp:ListItem>En Curso</asp:ListItem>
    </asp:DropDownList>
    <asp:Button ID="btnaceptar" runat="server" Text="Aceptar" />
    <br>
    <div>
        <form method="get">
            <label for="searchUser">Inserte id usuario</label>
            <input type="text" name="searchUser" value="" />
            <input type="Submit" value="Buscar Usuario" onclick="FillLabel()" />
            <br />
        </form>
        <br />
    </div>
            <asp:label ID="queryResult" runat="server" Text="¿existe?"></asp:label>
    <br>
    <contenttemplate>
        <asp:GridView ID="grvUsuarios" runat="server" AutoGenerateColumns="False" CellPadding="4" GridLines="Horizontal" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" Width="259px">
            <Columns>
                <asp:BoundField HeaderText="usuaCODI" DataField="usuaCODI" />
                <asp:BoundField HeaderText="usuaNom" DataField="usuaNom" />
                <asp:BoundField HeaderText="usuaActivo" DataField="usuaActivo" />
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#333333" />
            <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="White" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#487575" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#275353" />
        </asp:GridView>
    </contenttemplate>
    <br />
    <asp:Label ID="peticion" runat="server" Text=""></asp:Label>
</asp:Content>

