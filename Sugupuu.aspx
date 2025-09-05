<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Sugupuu.aspx.cs" Inherits="XMLRakendus.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        table, tr, td, th{
            border: 1px solid black;
            border-collapse: collapse;
        }
    </style>
    <main aria-labelledby="title">
        <h2 id="title">Minu sugupuu.</h2>
        <asp:Xml runat="server"
            DocumentSource="~/Sugupuu.xml"
            TransformSource="~/MinuSugupuuParing.xslt">
        </asp:Xml>       
    </main>
</asp:Content>
