# Pledge

This package exposes the [pledge(2)](https://man.openbsd.org/pledge.2) system call available in [OpenBSD](https://www.openbsd.org/).

See the `Pledge` module for usage and interface details.

## Installation

The package can be installed by adding `pledge` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:pledge, "~> 0.0.1"}
  ]
end
```

## License
This package is licensed using the [standard OpenBSD license](https://cvsweb.openbsd.org/src/share/misc/license.template?rev=HEAD). Refer to the `LICENSE` file for more details.

## Internals

The package makes use of [rustler](https://github.com/rusterlium/rustler) and the [openbsd](https://crates.io/crates/openbsd) crate.


