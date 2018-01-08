#!/bin/sh
set -e

version='1.5.2'
arch='x86_64'
mitamae_version="mitamae-${version}"

if ! [ -f "bin/${mitamae_version}" ]; then
  case "$(uname)" in
    "Darwin")
      mitamae_bin="mitamae-${arch}-darwin"
      ;;
    "Linux")
      mitamae_bin="mitamae-${arch}-linux"
      ;;
    *)
      echo "unknown system: $(uname)"
      exit 1
      ;;
  esac
  url="https://github.com/itamae-kitchen/mitamae/releases/download/v${version}/${mitamae_bin}"
  echo "Download ${mitamae_bin} from ${url}"
  curl -o "bin/${mitamae_bin}" -fL "https://github.com/itamae-kitchen/mitamae/releases/download/v${version}/${mitamae_bin}"
  chmod +x "bin/${mitamae_bin}"
fi
