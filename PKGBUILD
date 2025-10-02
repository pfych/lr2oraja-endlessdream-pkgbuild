# Maintainer: Pfych <contact at pfy dot ch>
pkgname=lr2oraja-endlessdream
pkgver=0.3.0
_basever=0.8.8
pkgrel=4
url="https://github.com/seraxis/lr2oraja-endlessdream"
pkgdesc="A featureful fork of beatoraja."
arch=('x86_64')
depends=('liberica-jre-8-full-bin' 'portaudio')
makedepends=('unzip')
source=(
  "https://github.com/seraxis/lr2oraja-endlessdream/releases/download/v${pkgver}/lr2oraja-${_basever}-endlessdream-linux-${pkgver}.jar"
  'https://github.com/TNG-dev/tachi-beatoraja-ir/releases/download/v3.0.0/bokutachiIR-3.0.0.jar'
  'lr2oraja-endlessdream.sh'
  'lr2oraja-endlessdream-icon.png'
  'libjportaudio.so'
)
sha256sums=(
  'c77719e5be5f650755297e837f8e26df998662d066334153c63e219bc03a851d' # lr2oraja-endlessdream.jar
  '3754959d5d6f121dbeed3a78dec2b91a26e915ff4ce68fdee4262b89ad150cb9' # bokutachiIR
  '0c1168c66a9685348cab396acdfc7bbac6e4b851cb4a25cbb166ff9481987ea1' # lr2oraja-endlessdream.sh
  'fdbd37ff43aa6af20f9eb643bf271a77ef579014970a7a3dcecf78e65123d83d' # lr2oraja-endlessdream-icon.png
  'a65d1290d3ee7710f9327c040e6369bf7587eb3609835ed782caaf0ac02d84ed' # libjportaudio.so
)
license=(
  'GPL3'
  'GPL3'
  'MIT'
)
install=migrate.install

prepare() {
  git clone "https://github.com/seraxis/lr2oraja-endlessdream" --depth=1 upstream
}

package() {
  # Create required directories
  cd "$srcdir/"
  mkdir -p "$pkgdir/opt/lr2oraja-endlessdream"
  mkdir -p "$pkgdir/opt/lr2oraja-endlessdream/ir"
  mkdir -p "$pkgdir/usr/share/applications"
  mkdir -p "$pkgdir/usr/share/pixmaps"

  # Move new Jar
  cp "lr2oraja-${_basever}-endlessdream-linux-${pkgver}.jar" "$pkgdir/opt/lr2oraja-endlessdream/LR2oraja-endlessdream.jar"

  # Move required files
  cp -r upstream/assets/* "$pkgdir/opt/lr2oraja-endlessdream"
  cp "bokutachiIR-3.0.0.jar" "$pkgdir/opt/lr2oraja-endlessdream/ir"
  chmod -R 777 "$pkgdir/opt/lr2oraja-endlessdream"
  ln -sfn "/opt/lr2oraja-endlessdream" "$XDG_CONFIG_HOME/lr2oraja-endlessdream"

  if ! [[ -f "/usr/lib/libjportaudio.so" ]]; then
    cp libjportaudio.so "$pkgdir/usr/lib"
  fi

  # Create Desktop entry
  cp lr2oraja-endlessdream-icon.png "$pkgdir/usr/share/pixmaps"
  desktopEntry="$pkgdir/usr/share/applications/lr2oraja-endlessdream.desktop"
  touch "$desktopEntry"
  echo "[Desktop Entry]" >>"$desktopEntry"
  echo "Type=Application" >>"$desktopEntry"
  echo "Terminal=true" >>"$desktopEntry"
  echo "Exec=/usr/bin/lr2oraja-endlessdream" >>"$desktopEntry"
  echo "Version=$pkgver" >>"$desktopEntry"
  echo "Name=LR2oraja Endless Dream" >>"$desktopEntry"
  echo "Categories=Game;" >>"$desktopEntry"
  echo "Icon=lr2oraja-endlessdream-icon" >>"$desktopEntry"

  # Install LR2oraja
  install -D lr2oraja-endlessdream.sh "$pkgdir/usr/bin/lr2oraja-endlessdream"
}
