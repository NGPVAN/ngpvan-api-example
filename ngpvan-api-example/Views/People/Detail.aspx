<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<ngpvanapi.Models.People>" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>Person Detail</title>
    <link href="~/Content/Site.css" type="text/css" rel="stylesheet"/>
</head>
<body>
    <fieldset>
        <legend>People</legend>
        <p>
            <%= Html.Label("VAN Id:", new { @class="editor-label"}) %> <%= Html.TextBox("vanId", Model.VanId.ToString(), new { @class="editor-field", @readonly = "readonly" }) %> <br/>
            
            <%= Html.Label("First name:", new { @class="editor-label"}) %> <%= Html.TextBox("firstName", Model.FirstName, new { @class="editor-field", @readonly = "readonly"}) %> <br/>
            
            <%= Html.Label("Last name:", new { @class="editor-label"}) %> <%= Html.TextBox("lastName", Model.LastName, new { @class="editor-field", @readonly = "readonly"}) %> <br/>
            
            <% if (Model.Addresses != null)
               {
                    foreach (var address in Model.Addresses)
                   { %>
                    <%= Html.Label("Address", new {@class = "editor-label"}) %><br/>
                    <%= Html.TextBox("addressLine1", address.AddressLine1, new {@class = "editor-field", @readonly = "readonly"}) %> <br/>
                    <%= Html.TextBox("city", address.City, new {@class = "editor-field", @readonly = "readonly"}) %>, <%= Html.TextBox("city", address.StateOrProvince, new {@class = "editor-field", @readonly = "readonly"}) %>, <%= Html.TextBox("city", address.ZipOrPostalCode, new {@class = "editor-field", @readonly = "readonly"}) %> <br/>
            <% }
               } %>
            
            <% if (Model.Phones != null)
               {
                   foreach (var phone in Model.Phones)
                   { %>
                    <%= Html.Label("Phone", new {@class = "editor-label"}) %><br/>
                    <%= Html.TextBox("phoneNumber", phone.PhoneNumber, new {@class = "editor-field", @readonly = "readonly"}) %> <br/>
            <% }
               } %>
            
            <% if (Model.Emails != null)
               {
                   foreach (var email in Model.Emails)
                   { %>
                    <%= Html.Label("Email Address", new {@class = "editor-label"}) %><br/>
                    <%= Html.TextBox("emailAddress", email.EmailAddress, new {@class = "editor-field", @readonly = "readonly"}) %> <br/>
            <% }
               } %>
        </p>
    </fieldset>
    <p>
        <%: Html.ActionLink("Back to Find or Create People", "Index") %>
    </p>
</body>
</html>
