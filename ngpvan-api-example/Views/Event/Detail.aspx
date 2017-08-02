<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<ngpvanapi.Models.Event>" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>Detail</title>
    <link href="~/Content/Site.css" type="text/css" rel="stylesheet"/>
</head>
<body>
    <fieldset>
        <legend>Event Detail</legend>
        <p>
            Event Id: <%: Html.ActionLink(Model.EventId.ToString(), "Detail", new { eventId=Model.EventId }) %><br/>

            Name: <%= Html.Label(Model.Name) %><br/>
        
            Short Name: <%= Html.Label(Model.ShortName) %><br/>
        
            Description: <%= Html.Label(Model.Description ?? "") %><br/>
        
            Start Date: <%= Html.Label(Model.StartDate.ToString()) %><br/>
        
            End Date: <%= Html.Label(Model.EndDate.ToString()) %><br/>
        
            Is Active: <%= Html.Label(Model.IsActive.ToString()) %><br/>
        </p>
    </fieldset>
    <p>
        <%: Html.ActionLink("Back to List", "Index") %>
    </p>
</body>
</html>
