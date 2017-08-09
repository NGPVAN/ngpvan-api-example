<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<ngpvanapi.Models.People>" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>Sign Up For The Campaign</title>
    <link href="~/Content/Site.css" type="text/css" rel="stylesheet"/>
</head>
<body>
    <div id="header">
        <img src="../../Content/themes/images/pets-for-office.jpg"/>
    </div>

    <fieldset>
        <legend>Sign Up For The Campaign</legend>
        <% Html.BeginForm("FindOrCreate", "People"); %>
        <p>
            <%= Html.Label("First name", new { @class="editor-label"}) %> <%= Html.TextBox("firstName", "", new { @class="editor-field"}) %><br/>
            
            <%= Html.Label("Last name", new { @class="editor-label"}) %> <%= Html.TextBox("lastName", "", new { @class="editor-field"}) %><br/>
        
            <%= Html.Label("Email address", new { @class="editor-label"}) %> <%= Html.TextBox("emailAddress", "", new { @class="editor-field"}) %><br/>
            
            <%= Html.Label("Phone number", new { @class="editor-label"}) %> <%= Html.TextBox("phoneNumber", "", new { @class="editor-field"}) %><br/>
            
            <%= Html.Label("Address line 1", new { @class="editor-label"}) %> <%= Html.TextBox("addressLine1", "", new { @class="editor-field"}) %><br/>          
            
            <%= Html.Label("City", new { @class="editor-label"}) %> <%= Html.TextBox("city", "", new { @class="editor-field"}) %><br/>
            
            <%= Html.Label("State", new { @class="editor-label"}) %> <%= Html.TextBox("stateOrProvince", "", new { @class="editor-field"}) %><br/>

            <%= Html.Label("ZIP 5", new { @class="editor-label"}) %> <%= Html.TextBox("zip5", "", new { @class="editor-field"}) %>
        </p>

        <input type="submit" value="Sign up" />
        <% Html.EndForm(); %>
    </fieldset>
    <p>
        <%: Html.ActionLink("Home", "Index", "Home") %>
    </p>
</body>
</html>
