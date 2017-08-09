<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<ngpvanapi.Models.SignupList>" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>Signups</title>
    <link href="~/Content/Site.css" type="text/css" rel="stylesheet"/>
</head>
<body>
    <div id="header">
        <img src="../../Content/themes/images/pets-for-office.jpg"/>
    </div>

    <fieldset>
        <legend>List of Event Signups</legend>
        
        <% if (Model.VanId != null) { %>
        <p>
            <%= Html.Label("VANID", new { @class="editor-label-subheader"}) %><br/>
            <%= Html.TextBox("vanId", Model.VanId, new {@class = "editor-field", @readonly = "readonly"}) %><br/>  
        </p>
        
        <table>   
        <% foreach (var item in Model.Items) { %>
            <tr>
                <td>
                    Event: <%= Html.Label(item.Event.Name) %> (Event ID: <%: Html.ActionLink(item.Event.EventId.ToString(), "Detail", "Event", new { eventId=item.Event.EventId }, new { @class="editor-field"}) %>)<br/>
                    Role: <%= Html.Label(item.Role.Name) %><br/>
                    Location: <%= Html.Label(item.Location.Name) %><br/>
                    Status: <%= Html.Label(item.Status.Name) %><br/>
                </td>
            </tr>
        <% } %>
        </table>
        <% } %>

        <% if (Model.EventId != null) { %>
        <p>
            <%= Html.Label("Event ID", new { @class="editor-label-subheader"}) %><br/>
            <%= Html.TextBox("eventId", Model.EventId, new {@class = "editor-field", @readonly = "readonly"}) %><br/>    
        </p>
        
        <table>   
        <% foreach (var item in Model.Items) { %>
            <tr>
                <td>
                    Name: <%= Html.Label(item.Person.FirstName) %> <%= Html.Label(item.Person.LastName) %> (VANID: <%: Html.ActionLink(item.Person.VanId.ToString(), "Detail", "People", new { vanId=item.Person.VanId }, new { @class="editor-field"}) %>)<br/>
                    Role: <%= Html.Label(item.Role.Name) %><br/>
                    Location: <%= Html.Label(item.Location.Name) %><br/>
                    Status: <%= Html.Label(item.Status.Name) %><br/>
                </td>
            </tr>
        <% } %>
        </table>
        <% } %>
    </fieldset>
</body>
</html>
