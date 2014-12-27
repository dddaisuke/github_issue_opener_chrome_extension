import 'window.dart' deferred as window;

void main() {
  window.loadLibrary().then((_) {
    window.init();
  });
}
