brew () {
  local pkg=${1}
  local c=''
  if contains "$brews_have" "$pkg" ; then
    if contains "$brews_outdated" "$pkg" ; then
      c="brew upgrade $pkg"
    fi
  else
    c="brew install $@"
  fi
  if [ -n "$c" ] ; then bake "command $c" ; fi
}
brews_have=$(command brew list)
brews_outdated=$(command brew outdated | awk '{print $1}')
