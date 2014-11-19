
chrome.app.runtime.onLaunched.addListener(function(launchData) {
  chrome.app.window.create('github_issue_opener.html', {
    'id': '_mainWindow', 'bounds': {'width': 800, 'height': 600 }
  });
});
