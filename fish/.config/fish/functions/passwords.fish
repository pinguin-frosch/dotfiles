function passwords
    cd ~/Programación/.passwords/ > /dev/null
    git add . > /dev/null
    git commit -m (date +%F\ %T) > /dev/null
    git push
    prevd > /dev/null
end
