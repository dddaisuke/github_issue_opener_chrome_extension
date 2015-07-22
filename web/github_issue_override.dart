import 'dart:html';

import 'package:chrome/chrome_app.dart' as chrome;

void main() {
  appendTroubleNewIssueButtom();
}

void appendTroubleNewIssueButtom() {
  Element element = querySelector("div.subnav");

  AnchorElement aElement = new AnchorElement();
  aElement.setInnerHtml("New Trouble Issue");
  aElement.setAttribute("class", "btn btn-primary right");
  aElement.onClick.listen((_) {
    bbb();
  });

  element.append(aElement);
}

DivElement generateLabel(String value) {
  DivElement div = new DivElement();

  CheckboxInputElement checkbox = new CheckboxInputElement();
  checkbox.setAttribute("name", "issue[labels][]");
  checkbox.setAttribute("value",value);
  div.append(checkbox);
  div.appendText(value);

  return div;
}

void bbb() {
  InputElement issueTitle = querySelector("#issue_title");
  issueTitle.setAttribute("placeholder", "「対象」を「どうする」という文言を記載");

  Element newIssue = querySelector("div.discussion-topic-header");
  DivElement issue = new DivElement();
  DivElement labelDevelopment = generateLabel("Development");
  DivElement labelDesign = generateLabel("Design");
  DivElement labelBug = generateLabel("Bug");
  issue.append(labelDevelopment);
  issue.append(labelDesign);
  issue.append(labelBug);
  issue.classes.add("form-checkbox");
  issue.setAttribute("style", "margin-bottom: 10px");
  newIssue.append(issue);

  DivElement target = new DivElement();
  DivElement labelAndroid = generateLabel("Android");
  DivElement labelIos = generateLabel("iOS");
  DivElement labelWhiteboard = generateLabel("Whiteboard");
  DivElement labelServerAdmin = generateLabel("Server(admin)");
  DivElement labelServerInfra = generateLabel("Server(infra)");
  DivElement labelServerRails = generateLabel("Server(Rails)");
  target.append(labelAndroid);
  target.append(labelIos);
  target.append(labelWhiteboard);
  target.append(labelServerAdmin);
  target.append(labelServerInfra);
  target.append(labelServerRails);
  target.setAttribute("style", "margin-bottom: 10px");
  target.classes.add("form-checkbox");
  newIssue.append(target);

  DivElement service = new DivElement();
  DivElement labelTutor = generateLabel("Tutor");
  DivElement labelStudentManabo = generateLabel("Student(mana.bo)");
  DivElement labelStudentRiakate = generateLabel("Student(Riakate)");
  DivElement labelScheduled = generateLabel("Scheduled");
  service.append(labelTutor);
  service.append(labelStudentManabo);
  service.append(labelStudentRiakate);
  service.append(labelScheduled);
  service.classes.add("form-checkbox");
  service.setAttribute("style", "margin-bottom: 10px");
  newIssue.append(service);

  TextAreaElement issueBody = querySelector("#issue_body");
  issueBody.setAttribute("style", "height: 350px") ;
  issueBody.value ="""
## 発生した状況
発生時刻：2015-01-02 11:22:33
UA：riakate/5.1.2 (iPhone; iOS 8.1.3; Scale/2.00)
student_id：99999
confab_id：99999
URL：https://mana.bo/confabs/open

## 再現方法
**再現性あり／なし**
再現手順の詳細な説明

## issueの完了条件
第三者が見て明らかな条件が望ましい
""";
}
