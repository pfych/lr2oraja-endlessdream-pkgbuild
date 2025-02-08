# Maintainer: Pfych <contact at pfy dot ch>
pkgname=lr2oraja-endlessdream
pkgver=0.2.1
_basever=0.8.7
pkgrel=2
url="https://github.com/seraxis/lr2oraja-endlessdream"
pkgdesc="A featureful fork of beatoraja."
arch=('x86_64')
depends=('lr2oraja')
makedepend=('unzip')
source=(
  "https://github.com/seraxis/lr2oraja-endlessdream/releases/download/v${pkgver}/lr2oraja-${_basever}-endlessdream-linux-${pkgver}.jar"
  "https://github.com/seraxis/lr2oraja-endlessdream/releases/download/v0.2.0/lr2oraja-0.8.7-endlessdream-linux-0.2.0.zip"
  'lr2oraja-endlessdream.sh'
  'lr2oraja-endlessdream-icon.png'
  'default.json'
)
sha256sums=(
  '73390564fde09fd89eab9c3a34b0afbd24ee7e07ac161b43ed8184c320f71d8b' # lr2oraja-endlessdream.jar
  '1688a08ac547b891977bdf53cb80f0f458f2bce36acaa8260d273fdb16a7c677' # lr2oraja-0.8.7-endlessdream-linux-0.2.0.zip (For Fonts)
  'a72fb162c592736a991d1680c7ac97c5662404498c0c85cce70ba1a8ff60e6b9' # lr2oraja-endlessdream.sh
  'fdbd37ff43aa6af20f9eb643bf271a77ef579014970a7a3dcecf78e65123d83d' # lr2oraja-endlessdream-icon.png
  'f345af8667fb67a2df083c62b204cfbc92585f3bd2f856fef673046525679356' # default.json
)
license=(
  'GPL3'
  'GPL3'
  'MIT'
)

prepare() {
  # This release contained required font files
  unzip -o "lr2oraja-0.8.7-endlessdream-linux-0.2.0.zip"
}

package() {
  # Create required directories
  cd "$srcdir/"
  mkdir -p "$pkgdir/opt/beatoraja"
  mkdir -p "$pkgdir/usr/share/applications"
  mkdir -p "$pkgdir/usr/share/pixmaps"
  mkdir -p "$pkgdir/opt/beatoraja/font"
  mkdir -p "$pkgdir/opt/beatoraja/random"


  # Move new Jar
  cp "lr2oraja-${_basever}-endlessdream-linux-${pkgver}.jar" "$pkgdir/opt/beatoraja/LR2oraja-endlessdream.jar"
  chmod -R 777 "$pkgdir/opt/beatoraja"

  # Move required font
  cp font/* "$pkgdir/opt/beatoraja/font"

  # Make required files
  cp default.json "$pkgdir/opt/beatoraja/random"

  # Create Desktop entry
  cp lr2oraja-endlessdream-icon.png "$pkgdir/usr/share/pixmaps"
  desktopEntry="$pkgdir/usr/share/applications/lr2oraja-endlessdream.desktop"
  touch "$desktopEntry"
  echo "[Desktop Entry]" >> "$desktopEntry"
  echo "Type=Application" >> "$desktopEntry"
  echo "Terminal=true" >> "$desktopEntry"
  echo "Exec=/usr/bin/lr2oraja-endlessdream" >> "$desktopEntry"
  echo "Version=$pkgver" >> "$desktopEntry"
  echo "Name=LR2oraja Endless Dream" >> "$desktopEntry"
  echo "Categories=Game;" >> "$desktopEntry"
  echo "Icon=lr2oraja-endlessdream-icon" >> "$desktopEntry"

  if [ -z "$XDG_CONFIG_HOME" ]; then
    XDG_CONFIG_HOME="$HOME/.config"
  fi

  # Install LR2oraja
  install -D lr2oraja-endlessdream.sh "$pkgdir/usr/bin/lr2oraja-endlessdream"
}
