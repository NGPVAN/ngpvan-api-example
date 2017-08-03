<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<ngpvanapi.Models.Home>" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>Index</title>
    <link href="~/Content/Site.css" type="text/css" rel="stylesheet"/>
</head>
<body>
    <fieldset>
        <legend>NGP VAN API</legend>
        <p>
            <strong>Echoes</strong><br/>
            
            <%= Html.Label("Message:", new { @class="editor-label"}) %> <%= Html.Label(Model.Message, new { @class="editor-label"}) %><br/>
            
            <%= Html.Label("Date sent:", new { @class="editor-label"}) %> <%= Html.Label(Model.DateSentUtc.ToLocalTime().ToString(), new { @class="editor-label"}) %>
        </p> 
    </fieldset>
    <p>
        <%: Html.ActionLink("People", "Index", "People") %> | <%: Html.ActionLink("Events", "Index", "Event") %>
    </p>
</body>
</html>
