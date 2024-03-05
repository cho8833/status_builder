<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->



## Features

update widget with ValueNotifier that has Status value

## Getting started

import status_builder

```yaml
dependencies:
    status_builder:
        git:
            url: https://github.com/cho8833/status_builder
```

## Usage

example

```dart
class ExampleProvider {

  ValueNotifier<Status> fetchStatus = ValueNotifier(Status.idle);

  Future<void> fetch() async {
    fetchStatus.value = Status.loading;
    repository.fetchData().then((value) {
      print(value);
      fetchStatus.value = Status.success;
    }).catchError((e) {
      fetchStatus.value = Status.fail;
      throw Exception(e);
    });
  }
}


Widget build(BuildContext context) {
    ExampleProvider provider = context.read<ExampleProvider>
    return StatusBuilder(
        statusNotifier: provider.fetchStatus,
        loadingBuilder: (context) {
            return const CircularProgressIndicator();
        },
        suessBuilder: (context) {
            return const Text("success");
        }
    )
}

```
