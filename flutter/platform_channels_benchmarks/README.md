Benchmark the platform channel that can deliver the message fastest on all platforms.
- [ ] android
- [ ] linux
- [ ] web

Benchmark type of messages:
- Basic primitive types
- List of object
- Convert the list of object into the binary bytes, then send the binary bytes

```bash
flutter drive \
    --driver=test_
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