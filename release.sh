#!/bin/bash

set -e

# Parámetros
VERSION=$1
SCRIPT_NAME="autogit"
TARBALL="${SCRIPT_NAME}-${VERSION}.tar.gz"
FORMULA_PATH="Formula/${SCRIPT_NAME}.rb"
REPO_URL="https://github.com/Jonahh21/homebrew-autogit"

if [ -z "$VERSION" ]; then
  echo "Uso: ./release.sh <nueva-version> (ej. 0.2.1)"
  exit 1
fi

# 1. Preparar estructura y tar.gz
mkdir -p dist
mkdir -p build/${SCRIPT_NAME}-${VERSION}
cp ${SCRIPT_NAME} build/${SCRIPT_NAME}-${VERSION}/
tar -czf dist/${TARBALL} -C build ${SCRIPT_NAME}-${VERSION}

# 2. Calcular SHA256
SHA=$(shasum -a 256 dist/${TARBALL} | awk '{ print $1 }')

# 3. Actualizar fórmula
cat > $FORMULA_PATH <<EOF
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

# 4. Git commit y tag
git add $FORMULA_PATH
git commit -m "release v$VERSION"
git tag "v$VERSION"

# 5. Subir el tar.gz a GitHub release (si usás GitHub CLI)
if command -v gh &>/dev/null; then
  gh release create "v$VERSION" dist/${TARBALL} --title "v$VERSION" --notes "Release autogit v$VERSION"
else
  echo "🔧 Sube el archivo dist/${TARBALL} manualmente al release en GitHub"
fi

echo "✅ Listo. Hacé 'git push && git push --tags' para publicar."
