<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="XMLRakendus._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <main>
        <h1>XML katsetamine: Elizaveta II sugupuu</h1>
        <div class="row">
            <asp:Xml runat="server"
                DocumentSource="~/ElizavetatTeine.xml"
                TransformSource="~/ParingElizavetaTeine.xslt">
            </asp:Xml>           
        </div>
    </main>

</asp:Content>
