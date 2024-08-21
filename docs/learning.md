`nix-instantiate --eval --strict --json eval.nix | jq`

outputs:

```nix
{
  "meta": {
    "available": true,
    "broken": false,
    "description": "A simple Nix package that says hello using cowsay",
    "homepage": "https://example.com/hello-nix",
    "insecure": false,
    "license": {
      "deprecated": false,
      "free": true,
      "fullName": "MIT License",
      "redistributable": true,
      "shortName": "mit",
      "spdxId": "MIT",
      "url": "https://spdx.org/licenses/MIT.html"
    },
    "maintainers": [],
    "name": "hello-nix-0.1.0",
    "outputsToInstall": [
      "out"
    ],
    "platforms": [
      "i686-cygwin",
      "x86_64-cygwin",
      "x86_64-darwin",
      "i686-darwin",
      "aarch64-darwin",
      "armv7a-darwin",
      "i686-freebsd13",
      "x86_64-freebsd13",
      "x86_64-solaris",
      "aarch64-linux",
      "armv5tel-linux",
      "armv6l-linux",
      "armv7a-linux",
      "armv7l-linux",
      "i686-linux",
      "loongarch64-linux",
      "m68k-linux",
      "microblaze-linux",
      "microblazeel-linux",
      "mips-linux",
      "mips64-linux",
      "mips64el-linux",
      "mipsel-linux",
      "powerpc64-linux",
      "powerpc64le-linux",
      "riscv32-linux",
      "riscv64-linux",
      "s390-linux",
      "s390x-linux",
      "x86_64-linux",
      "aarch64-netbsd",
      "armv6l-netbsd",
      "armv7a-netbsd",
      "armv7l-netbsd",
      "i686-netbsd",
      "m68k-netbsd",
      "mipsel-netbsd",
      "powerpc-netbsd",
      "riscv32-netbsd",
      "riscv64-netbsd",
      "x86_64-netbsd",
      "i686-openbsd",
      "x86_64-openbsd",
      "x86_64-redox"
    ],
    "position": "/Users/nikiv/src/nix/try.nix:40",
    "unfree": false,
    "unsupported": false
  },
  "name": "hello-nix-0.1.0",
  "pname": "hello-nix",
  "version": "0.1.0"
}
```

---
