<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<ngpvanapi.Models.People>" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>Person Detail</title>
    <link href="~/Content/Site.css" type="text/css" rel="stylesheet"/>
</head>
<body>
    <fieldset>
        <legend>Person Detail</legend>
        <p>
            <%= Html.Label("VAN Id", new {@class = "editor-label"}) %><br/>
            <%= Html.TextBox("vanId", Model.VanId.ToString(), new {@class = "editor-field", @readonly = "readonly"}) %> <br/>
            
            <%= Html.Label("Name", new {@class = "editor-label"}) %><br/>
            <%= Html.TextBox("title", Model.Title, new {@class = "editor-field", @readonly = "readonly"}) %> 
            <%= Html.TextBox("firstName", Model.FirstName, new {@class = "editor-field", @readonly = "readonly"}) %> 
            <%= Html.TextBox("middleName", Model.MiddleName, new {@class = "editor-field", @readonly = "readonly"}) %>
            <%= Html.TextBox("lastName", Model.LastName, new {@class = "editor-field", @readonly = "readonly"}) %>
            <%= Html.TextBox("suffix", Model.Suffix, new {@class = "editor-field", @readonly = "readonly"}) %><br/>
            
            <%= Html.Label("Address", new {@class = "editor-label"}) %><br/>
            <% if (Model.Addresses != null)
               {
                   foreach (var address in Model.Addresses)
                   { %>                  
                    <%= Html.TextBox("addressType", address.AddressType, new {@class = "editor-field", @readonly = "readonly"}) %> <br/>
                    <%= Html.TextBox("addressLine1", address.AddressLine1, new {@class = "editor-field", @readonly = "readonly"}) %> <br/>
                    <%= Html.TextBox("city", address.City, new {@class = "editor-field", @readonly = "readonly"}) %>, <%= Html.TextBox("city", address.StateOrProvince, new {@class = "editor-field", @readonly = "readonly"}) %>, <%= Html.TextBox("city", address.ZipOrPostalCode, new {@class = "editor-field", @readonly = "readonly"}) %> <br/>
            <% }
               } %>
            
            <%= Html.Label("Phone", new {@class = "editor-label"}) %><br/>
            <% if (Model.Phones != null)
               {
                   foreach (var phone in Model.Phones)
                   { %>
                    <%= Html.TextBox("phoneNumber", phone.PhoneNumber, new {@class = "editor-field", @readonly = "readonly"}) %> <br/>
            <% }
               } %>

            <%= Html.Label("Email Address", new {@class = "editor-label"}) %><br/>
            <% if (Model.Emails != null)
               {
                   foreach (var email in Model.Emails)
                   { %>
                    <%= Html.TextBox("emailAddress", email.EmailAddress, new {@class = "editor-field", @readonly = "readonly"}) %> <br/>
            <% }
               } %>         
        </p>
        <p>
            <%: Html.ActionLink("RSVP For An Event", "EventSignup", "Signup", new { vanId=Model.VanId }, new { @class="editor-field"} ) %> |
            <%: Html.ActionLink("Post Canvass Response", "CanvassResponse", "CanvassResponses", new { vanId=Model.VanId }, new { @class="editor-field"}) %>
        </p>
    </fieldset>
    <p>
        <%: Html.ActionLink("Back to Sign Up", "Index") %>
    </p>
</body>
</html>
