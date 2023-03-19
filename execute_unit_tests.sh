outputFile="$(pwd)/test/coverage_generate_file.dart"
packageName="$(cat pubspec.yaml | grep '^name: ' | awk '{print $2}')"

if [ -d "coverage" ]; then
  rm -rf "coverage"
fi
if [ -f "$outputFile" ]; then
  rm -f "$outputFile"
fi

if [ "$packageName" = "" ]; then
  echo "Run $0 from the root of your Dart/Flutter project"
  exit 1
fi

find lib -name '*.dart' | grep -v '.gr.dart' | grep -v '.freezed.dart' | grep -v '.g.dart' | grep -v 'generated_plugin_registrant' | awk -v package=$packageName '{gsub("^lib", "", $1); printf("import '\''package:%s%s'\'';\n", package, $1);}' >>"$outputFile"
echo "void main() {}" >>"$outputFile"
flutter test --coverage
lcov --remove coverage/lcov.info "lib/generated/*" -o coverage/lcov.info
genhtml coverage/lcov.info -o coverage --no-function-coverage -s -p $(pwd)
if [ "$1" != "skip_open_report" ]; then
  open coverage/index.html
fi