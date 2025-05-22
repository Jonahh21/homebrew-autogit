#!/bin/bash

set -e

VERSION="$1"
SCRIPT_NAME="autogit"
TARBALL="${SCRIPT_NAME}-${VERSION}.tar.gz"
FORMULA_PATH="Formula/${SCRIPT_NAME}.rb"
REPO_URL="https://github.com/Jonahh21/homebrew-autogit"

# 🧪 Validación básica
if [ -z "$VERSION" ]; then
  echo "❌ Uso: ./release.sh <version> (ej: 0.2.1)"
  exit 1
fi

# 📦 Crear estructura y empaquetar binario
mkdir -p dist
mkdir -p build/${SCRIPT_NAME}-${VERSION}
cp ${SCRIPT_NAME} build/${SCRIPT_NAME}-${VERSION}/
tar -czf dist/${TARBALL} -C build ${SCRIPT_NAME}-${VERSION}

# 🔐 Calcular checksum
SHA=$(shasum -a 256 dist/${TARBALL} | awk '{ print $1 }')

# 📝 Actualizar fórmula
cat > "$FORMULA_PATH" <<EOF
class Autogit < Formula
  desc "Gestión automática de versiones semánticas en commits de Git"
  homepage "$REPO_URL"
  url "$REPO_URL/releases/download/v${VERSION}/${TARBALL}"
  sha256 "$SHA"
  license "MIT"

  def install
    bin.install "$SCRIPT_NAME"
  end
end
EOF

# 📦 Commit y tag
git add "$FORMULA_PATH"
git commit -m "release v$VERSION"
git tag "v$VERSION"

# 🚀 Subir release a GitHub con el binario
if command -v gh &>/dev/null; then
  gh release create "v$VERSION" dist/${TARBALL} --title "v$VERSION" --notes "Release $VERSION"
else
  echo "⚠️ GitHub CLI (gh) no está instalado. Subí el release manualmente."
fi

# ✅ Instrucciones finales
echo ""
echo "🎉 Release v$VERSION generado con éxito."
echo "👉 Ejecutá ahora:"
echo "   git push && git push --tags"
