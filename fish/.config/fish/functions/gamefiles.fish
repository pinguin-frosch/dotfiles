function gamefiles
    cd ~/Juegos/saves > /dev/null
    git add . > /dev/null
    git commit -m (date +%F) > /dev/null
    prevd > /dev/null
end
