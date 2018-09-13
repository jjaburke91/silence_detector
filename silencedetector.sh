#!/bin/bash

LIVE_AUDIO_STREAM="https://stream-relay-geo.ntslive.net/stream?t=1535983749542"
SAMPLE_AUDIO="resources/sample_with_silence.mp3"

audio_source=$LIVE_AUDIO_STREAM
while test $# -gt 0; do
    case "$1" in
        -f)
            shift
            audio_source=$1
            shift
            ;;
        *)
            echo "$1 is not a recognized flag!"
            return 1;
            ;;
    esac
done

echo "$audio_source"

# 2>&1 Pipes ffmpeg's sterr to stdout.
ffmpeg -i $audio_source -af silencedetect=noise=0.0001 -f null -
#ffmpeg -i $SOURCE_PATH -af silencedetect=noise=0.0001 -f null - 2>&1 | grep 'silencedetect'
