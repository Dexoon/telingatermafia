#!/bin/bash
myvar=`cat`

echo "    <li class="b-games-li">
      <h2>${1}-ая игра в «Убежище»</h2>
      <p class=\"b-games-li-date\"> ${2} 2013 года</p>
      <ul class=\"b-games-li-players\">"

echo "$myvar" | sed 's/\(\w\+\s\w\+\)\s\+\(\w\+\)/        <li class="b-games-li-player">\1 <p class="b-games-li-points">\2<\/p><\/li>/g' |  sed 's/\(\w\+\s\w\+\)\s*$/        <li class="b-games-li-player">\1<\/li>/g'

echo "      </ul>
    </li>"
