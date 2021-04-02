#!/usr/bin/env python3

import sys
from moviepy.editor import *

video = VideoFileClip(sys.argv[1]) # 2.
audio = video.audio # 3.
audio.write_audiofile(sys.argv[1].split('.')[0] + '.mp3')
