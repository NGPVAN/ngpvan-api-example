<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<ngpvanapi.Models.Errors>" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>Error</title>
    <link href="~/Content/Site.css" type="text/css" rel="stylesheet"/>
</head>
<body>
    <fieldset>
        <legend>Error</legend>
        <p>
            <ul>
            <% foreach (var item in Model.Items) { %>
                <li><%= Html.Label(item.Text, new {@class = "editor-label"}) %> [<%= Html.Label(item.Code, new {@class = "editor-label"}) %>]</li>
            <% } %>
            </ul>
        </p>
    </fieldset>
</body>
</html>