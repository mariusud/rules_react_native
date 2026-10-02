# Bazel rules for react_native

This is my attempt at trying to build react-native projects with bazel. I am not particularly experienced at bazel and this is still very much WIP, so don't expect anything.

## Roadmap

- [ ] Set up bundling: will focus either on Re.pack or Metro and then come back and do the other one once I can verify this works E2E
- [ ] Set up Hermes: compile JS bundle to bytecode
- [ ] Set up iOS: use rules_apple and compile a minimal app
- [ ] Set up Android: ?
- [ ] Set up Expo: ?

## Installation

From the release you wish to use:
<https://github.com/mariusud/rules_react_native/releases>
copy the Bzlmod snippet into your `MODULE.bazel` file.

To use a commit rather than a release, you can point at any SHA of the repo with an `archive_override` in MODULE.bazel.

For example to use commit `abc123`:

```starlark
archive_override(
    module_name = "rules_react_native",
    url = "https://github.com/mariusud/rules_react_native/archive/abc123.tar.gz",
    strip_prefix = "rules_react_native-abc123",
    # The easiest way to set this is to commout out this line, then Bazel will print
    # a message with the correct value. Note that GitHub source archives don't have a strong
    # guarantee on the sha256 stability, see <https://github.blog/2023-02-21-update-on-the-future-stability-of-source-code-archives-and-hashes/>
    integrity = "...",
)
```
