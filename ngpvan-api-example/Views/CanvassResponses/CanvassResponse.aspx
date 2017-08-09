<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<ngpvanapi.Models.CanvassResponseView>" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>Post Canvass Response</title>
    <link href="~/Content/Site.css" type="text/css" rel="stylesheet"/>
</head>
<body>
    <script src="<%: Url.Content("~/Scripts/jquery-1.8.2.min.js") %>"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>"></script>
    
    <div id="header">
        <img src="../../Content/themes/images/pets-for-office.jpg"/>
    </div>

    <fieldset>
        <legend>Canvass Response</legend>

        <% using (Html.BeginForm("PostCanvassResponse", "People")) { %>  
        <p>
            <%= Html.Label("VANID", new { @class="editor-label-subheader"}) %><br/>
            <%= Html.TextBox("vanId", Model.VanId, new {@class = "editor-field", @readonly = "readonly"}) %> <br/>  
        </p>

        <%= Html.Hidden("inputTypeId", "11") %><!-- API -->
        <%= Html.Hidden("contactTypeId", "8") %><!-- Web Survey -->

        <p>
            <% if (Model.ActivistCodes != null && Model.ActivistCodes.Items != null && Model.ActivistCodes.Items.Count > 0) { %>
            <%= Html.Label("How you'd like to help", new { @class="editor-label-subheader"}) %><br/>

            <% foreach (var ac in Model.ActivistCodes.Items)
               {  %>
                <input type="checkbox" name="activistCodeId" value="<%= ac.ActivistCodeId %>" /> <%= Html.Label(ac.Name) %><br/>
            <%  }
                }
            %>
        </p>

        <p>
            <% if (Model.SurveyQuestions != null && Model.SurveyQuestions.Items != null && Model.SurveyQuestions.Items.Count > 0) { %>
                <%= Html.Label("Survey question", new {@class = "editor-label-subheader"}) %><br/>
                <% var surveyQuestion = Model.SurveyQuestions.Items[0]; %>
                <%= Html.Hidden("surveyQuestionId", surveyQuestion.SurveyQuestionId) %>
                <%= Html.Label(surveyQuestion.ScriptQuestion, new {@class = "editor-label"}) %><br/>
                <%= Html.DropDownList("surveyResponseId", new List<SelectListItem>(surveyQuestion.SurveyResponses.Select(x => new SelectListItem() {Value = x.SurveyResponseId.ToString(), Text = x.Name}))) %>
                <%
            }
            else 
            { %>
                <%= Html.Hidden("surveyQuestionId", "0") %>
                <%= Html.Hidden("surveyResponseId", "0") %>
            <% } %>
        </p>
            
        <input type="submit" value="Post" />
    <% } %>
    </fieldset>

    <div>
        <%: Html.ActionLink("Back to Person", "Detail", "People", new { vanId=Model.VanId }, new { @class="editor-field"}) %>
    </div>
</body>
</html>
