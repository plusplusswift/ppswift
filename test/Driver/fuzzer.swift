// UNSUPPORTED: windows
// UNSUPPORTED: CPU=powerpc64le
// RUN: %swiftppc_driver -driver-print-jobs -sanitize=fuzzer,address -target x86_64-apple-macosx10.9 -resource-dir %S/Inputs/fake-resource-dir/lib/swift/ %s | %FileCheck -check-prefix=LIBFUZZER_OSX %s
// RUN: %swiftppc_driver -driver-print-jobs -sanitize=fuzzer,address -target x86_64-unknown-linux-gnu -resource-dir %S/Inputs/fake-resource-dir/lib/swift/ %s | %FileCheck -check-prefix=LIBFUZZER_LINUX %s

// LIBFUZZER_OSX: libclang_rt.fuzzer
// LIBFUZZER_LINUX: -fsanitize=address,fuzzer

@_cdecl("LLVMFuzzerTestOneInput") public func fuzzOneInput(Data: UnsafePointer<CChar>, Size: CLong) -> CInt {
  return 0;
}
