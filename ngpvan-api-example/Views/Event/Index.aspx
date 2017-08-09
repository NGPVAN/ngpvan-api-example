<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<ngpvanapi.Models.EventList>" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>List of Events</title>
    <link href="~/Content/Site.css" type="text/css" rel="stylesheet"/>
</head>
<body>
    <div id="header">
        <img src="../../Content/themes/images/pets-for-office.jpg"/>
    </div>

    <fieldset>
        <legend>List of Events</legend> 

        <table>
            <tr>
                <th><%= Html.Label("Event ID", new { @class="editor-label"}) %></th>
                <th><%= Html.Label("Name", new { @class="editor-label"}) %></th>
                <th><%= Html.Label("Description", new { @class="editor-label"}) %></th>
                <th><%= Html.Label("Start date", new { @class="editor-label"}) %></th>
                <th><%= Html.Label("End date", new { @class="editor-label"}) %></th>
            </tr> 
        <% foreach (var item in Model.Items) { %>
            <tr>
                <td>
                    <%: Html.ActionLink(item.EventId.ToString(), "Detail", new { eventId=item.EventId }, new { @class="editor-field"}) %>
                </td>
                <td>
                    <%= Html.Label("name", item.Name, new { @class="editor-field"}) %>
                </td>
                <td>
                    <%= Html.Label("description", item.Description ?? "", new { @class="editor-field"}) %>
                </td>
                <td>
                    <%= Html.Label("startDateUtc", item.StartDateUtc.ToLocalTime().ToString(), new { @class="editor-field"}) %>
                </td>
                <td>
                    <%= Html.Label("endDateUtc", item.EndDateUtc.ToLocalTime().ToString(), new { @class="editor-field"}) %>
                </td>
            </tr>
        <% } %>
        </table>
        
        <p>
            <% if (Model.NextPageLink != null)
               { %>
            <%: Html.ActionLink("Next", "Index", new { top = Model.Top, skip = Model.Skip  }) %> | 
            <% } %>
            <%= Html.Label("Total records:", new { @class="editor-label"}) %>  <%= Html.Label("count", Model.Count.ToString(), new { @class="editor-field"}) %>
        </p>
    </fieldset>
    <p>
        <%: Html.ActionLink("Home", "Index", "Home") %>
    </p>
</body>
</html>
