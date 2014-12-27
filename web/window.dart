import 'dart:html';
import 'package:chrome/chrome_ext.dart' as chrome_ext;

void init() {
  Storage localStorage = window.localStorage;
  String project_name = localStorage['project-name'];
  SelectElement selement = querySelector("#project-name");
  selement.value = project_name;

  InputElement element = querySelector("#issue-id");
  element.onKeyPress.listen(handleKeyEvent);
}

void handleKeyEvent(KeyboardEvent event) {
  window.console.info(event.keyCode);
  if (event.keyCode == KeyCode.ENTER) {
    SelectElement selement = querySelector("#project-name");
    String project_name = selement.value;

    Storage localStorage = window.localStorage;
    localStorage['project-name'] = project_name;

    InputElement element = querySelector("#issue-id");
    String input_text = element.value;
    window.console.info(input_text);

    window.console.info(project_name);
    window.console.info(getGithubIssueUrl(project_name, input_text));

    chrome_ext.TabsCreateParams params = new chrome_ext.TabsCreateParams(
        url: getGithubIssueUrl(project_name, input_text));
    chrome_ext.tabs.create(params);
  }
}

String getGithubIssueUrl(project_name, input_text) {
  return "https://github.com/manabo-inc/" +
      project_name +
      "/issues/" +
      input_text;
}
