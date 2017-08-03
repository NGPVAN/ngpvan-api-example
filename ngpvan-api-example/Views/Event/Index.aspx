<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<System.Collections.Generic.List<ngpvanapi.Models.Event>>" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>Index</title>
    <link href="~/Content/Site.css" type="text/css" rel="stylesheet"/>
</head>
<body>
    <fieldset>
        <legend>List of Events</legend> 
        <table>
            <tr>
                <th><%= Html.Label("Event Id", new { @class="editor-label"}) %></th>
                <th><%= Html.Label("Name", new { @class="editor-label"}) %></th>
                <th><%= Html.Label("Description", new { @class="editor-label"}) %></th>
                <th><%= Html.Label("Start date", new { @class="editor-label"}) %></th>
                <th><%= Html.Label("End date", new { @class="editor-label"}) %></th>
            </tr> 
        <% foreach (var item in Model) { %>
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
    </fieldset>
    <p>
        <%: Html.ActionLink("Home", "Index", "Home") %>
    </p>
</body>
</html>
