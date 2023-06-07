Benchmark the platform channel that can deliver the message fastest on all platforms.
- [ ] android
- [ ] linux
- [ ] web

Benchmark type of messages:
- Basic primitive types
- List of object
- Convert the list of object into the binary bytes, then send the binary bytes


Run for testing device

Run the android emulatar, then execute the following bash script
```shell
flutter test integration_test/app_test.dart
```

```shell
flutter drive \
    --driver=test_driver/integration_test.dart \
    --target=integration_test/app_test.dart \
    -d linux
```

```shell
chromedriver --port=4444

flutter drive \
  --driver=test_driver/integration_test.dart \
  --target=integration_test/app_test.dart \
  -d web-server
```


Result
```
I/flutter (10956): BasicMessageChannel/StandardMessageCodec/Flutter->Host/Small: 0.4 µs
I/flutter (10956): BasicMessageChannel/StandardMessageCodec/Flutter->Host/Large: 0.9 µs
I/flutter (10956): BasicMessageChannel/BinaryCodec/Flutter->Host/Large: 0.1 µs
I/flutter (10956): BasicMessageChannel/BinaryCodec/Flutter->Host/LargeEncode: 0.2 µs
I/flutter (10956): BasicMessageChannel/StandardMessageCodec/Flutter->Host/1MB: 69.8 µs
I/flutter (10956): BasicMessageChannel/BinaryCodec/Flutter->Host/1MBLargeEncode: 31.8 µs
I/flutter (10956): BasicMessageChannel/BinaryCodec/Flutter->Host/1MB: 0.6 µs
```