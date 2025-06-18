# Guidelines for Rust projects

## Don't leak dependencies in libraries' public APIs

Unless requested, items that stem from dependencies such as structs, enums or traits must not become part of a library's public API.
Consider this scenario: we have released `our_crate@v0.1.0` and it has `some_dependency@0.5`. Assume now that `some_dependency@v0.6` is
a new breaking release that introduces some feature we want to incorporate into `our_crate`. If any of `some_dependency`'s types are
part of `our_crate`'s public API, then bumping the dependency is a breaking change, requiring us to release `our_crate@v0.2`. If however
it was not part of the public API we can treat it as an implementation detail, allowing us to release a minor version `our_crate@v0.1.1`.

Below are a few scenarios with types from `some_dependency` that should be avoided:

```rust
// In the following example, we provide access to `some_dependency::SomeType` via a getter,
// thus putting it in the public API of our crate:

pub struct MyType {
    some_type: some_dependency::SomeType,
}

impl MyType {
    pub fn some_type(&self) -> some_dependency::SomeType {
        &self.some_type
    }
}

// In the following example, we provide access to `some_dependency::SomeType` through an enum
// variant, thus also putting it in the public API of our crate:

pub enum MyEnum {
    some_dependency(some_dependency::SomeType),
}

// In the following example, we initialize a newtype wrapper around a dependency's type
// using a fallible method, but leak `some_dependency::SomeError`:
pub struct MyType(some_dependency::SomeType);

impl MyType {
    pub fn fallible_init() -> Result<Self, some_dependency::SomeError> {
        some_dependency::SomeType::fallible_init.map_ok(Self)
    }
}
```

Strategies to avoid putting these into the public API:

1. consider whether a getter is even necessary (YAGNI, you are not gonna need it);
2. wrap the external type and return that instead.

For error handling, a common pattern is to provide a public  struct as a thin facade and have it
wrap a private enum. For example:

```rust
pub struct PublicError(PrivateErrorEnum);

enum PrivateErrorEnum {
    Dependency(some_dependency::SomeError),
}
```

Traits such as `std::error::Error` and `std::fmt::Display` can then be implemented for `PublicError` that
delegate to `PrivateErrorEnum` and eventually `some_dependency::SomeError`, but the dependency itself
stays a private implementation detail.

## On error handling

Error information should in general not be thrown away but wrapped instead. This applies to both: errors
that were defined in the current crate, but also errors that are imported from dependencies.

Consider the following example:

```rust
// Incorrect implementation
enum Error {
    ReadFile,
}

fn read_the_config<P: AsRef<Path>>(path: P) -> Result<Config, Error> {
    let config_contents = std::fs::read_to_string(path).map_err(|_| Error::ReadFile)?;
    todo!("rest of the implementation")
}

// Correct implementation
enum Error {
  ReadFile(std::io::Errro),
}

fn read_the_config<P: AsRef<Path>>(path: P) -> Result<Config, Error> {
    let config_contents = std::fs::read_to_string(path).map_err(Error::ReadFile)?;
    todo!("rest of the implementation")
}
```
