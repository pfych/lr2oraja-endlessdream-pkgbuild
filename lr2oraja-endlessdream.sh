#!/bin/bash
set -e

export LD_LIBRARY_PATH="/usr/share/lr2oraja-endlessdream/natives:${LD_LIBRARY_PATH:-}"

build_java_options() {
  local options=(
    -Dsun.java2d.opengl=true
    -Dawt.useSystemAAFontSettings=on
    -Dswing.aatext=true
    -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel
    -Dfile.encoding="UTF-8"
  )

  if [[ -n "${JDK_JAVA_OPTIONS}" ]]; then
    while IFS= read -r opt; do
      [[ -n "$opt" ]] && options+=("$opt")
    done < <(echo "${JDK_JAVA_OPTIONS}" | tr ' ' '\n')
  fi

  echo "${options[*]}"
}

cd "/usr/share/lr2oraja-endlessdream/"

JDK_JAVA_OPTIONS=$(build_java_options) \
SHUT_UP_TACHI=yes \
  /usr/lib/jvm/liberica-jdk-17-full/bin/java \
    -Djdk.gtk.version=2 \
    -Xms1g -Xmx4g \
    -cp LR2oraja-endlessdream.jar:ir/* bms.player.beatoraja.MainLoader \
    "$@"
