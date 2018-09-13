#!/bin/bash

LIVE_AUDIO_STREAM="https://stream-relay-geo.ntslive.net/stream?t=1535983749542"
OUT_AUDIO_FILENAME="out_audio.mp3"

ffmpeg -y -i $LIVE_AUDIO_STREAM -t 00:00:15 $OUT_AUDIO_FILENAME

# 2>&1 Pipes ffmpeg's sterr to stdout.
# ffmpeg -i $OUT_AUDIO_FILENAME -af silencedetect=noise=0.0001 -f null -
# ffmpeg -i $SOURCE_PATH -af silencedetect=noise=0.0001 -f null - 2>&1 | grep 'silencedetect'
