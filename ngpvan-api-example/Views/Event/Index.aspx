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
                <th>Event Id</th>
                <th>Name</th>
                <th>Description</th>
                <th>Start Date</th>
                <th>End Date</th>
            </tr> 
        <% foreach (var item in Model) { %>
            <tr>
                <td>
                    <%: Html.ActionLink(item.EventId.ToString(), "Detail", new { eventId=item.EventId }) %>
                </td>
                <td>
                    <%= Html.Label(item.Name) %>
                </td>
                <td>
                    <%= Html.Label(item.Description ?? "") %>
                </td>
                <td>
                    <%= Html.Label(item.StartDate.ToString()) %>
                </td>
                <td>
                    <%= Html.Label(item.EndDate.ToString()) %>
                </td>
            </tr>
        <% } %>
        </table>
    </fieldset>
</body>
</html>
