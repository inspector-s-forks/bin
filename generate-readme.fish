#!/usr/bin/fish

#  Decription
#  ----------
#  Generates this readme

#  Usage
#  -----
#       echo -e "#!/bin/sh\necho \# Useful scripts for Linux users > README.md\ngenerate-readme.fish >> README.md\nshasum -a 256 * | grep -v 'SHASUMS\|config' > SHASUMS" > .git/hooks/pre-commit
#       chmod +x .git/hooks/pre-commit    

    

for f in (git ls-files "*[^.md|^.txt|.gitignore]")
    echo -e "\n# [$f](https://github.com/dmi3/"(basename (pwd))"/blob/master/$f)\n"    
    grep -h -e "#\s\s" $f | grep -v "Author\|Source" | string sub -s 4 | string replace -ar "(?=Usage|Requirements|Instalation|Decription|Description)" "\n"
    echo -e "<hr/>"    
end

git add README.md