function shrink
    ffmpeg -i $argv[1] -c:v libx264 -c:a copy -crf 20 $argv[2]
end
