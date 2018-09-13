#!/bin/bash
LIVE_AUDIO_STREAM="https://stream-relay-geo.ntslive.net/stream?t=1535983749542"
SAMPLE_AUDIO="resources/sample_with_silence.mp3"
OUT_AUDIO_FILENAME="out_audio.mp3"

audio_source = LIVE_AUDIO_STREAM
output_filename = OUT_AUDIO_FILENAME
while test $# -gt 0; do
        case "$1" in
             -file)
                 shift
                 audio_source=$1
                 shift
                 ;;
            -output)
                shift
                output_filename=$1
                shift
                ;;
             *)
                echo "$1 is not a recognized flag!"
                return 1;
                ;;
       esac
done

echo $audio_source

ffmpeg -y -i $audio_source -t 00:00:15 $output_filename >logs/stream_recording

# 2>&1 Pipes ffmpeg's sterr to stdout.
# ffmpeg -i $OUT_AUDIO_FILENAME -af silencedetect=noise=0.0001 -f null - | grep 'silencedetect'
# ffmpeg -i $SOURCE_PATH -af silencedetect=noise=0.0001 -f null - 2>&1 | grep 'silencedetect'
