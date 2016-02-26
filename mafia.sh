#!/bin/bash
myvar=`cat`

echo "    <li class="b-games-li">
      <h2>${1}-ая игра в «Сухаревой башне»</h2>
      <p class=\"b-games-li-date\"> ${2} 2016 года</p>
      <ul class=\"b-games-li-players\">"

      echo "$myvar" | sed 's/\s*\(.\+\)\s\+\(-\?[0-9]\+\)\s*/        <li class="b-games-li-player">\1 <p class="b-games-li-points">\2<\/p><\/li>/g' |  sed 's/^\s*\(\(\w\+\s*\)\+\)\s*$/        <li class="b-games-li-player">\1<\/li>/g'

echo "      </ul>
    </li>"
