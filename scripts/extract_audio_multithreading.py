import shutil
import os
from threading import Thread
import sys
from moviepy.editor import *

videos = os.popen('find \\. -name "*MP4" -o -name "*.avi" -o -name "*.MKV" -o -name "*.mp4"').read().split('\n')
print(videos)

inputpath = './'
outputpath = './mp3'

for dirpath, dirnames, filenames in os.walk(inputpath):
    structure = os.path.join(outputpath, dirpath[len(inputpath):])
    if not os.path.isdir(structure):
        os.mkdir(structure)
    else:
        print("Folder does already exits!")


def to_chunks(lst, n):
    """Yield successive n-sized chunks from lst."""
    for i in range(0, len(lst), n):
        yield lst[i:i + n]


def to_audio(src):
    video = VideoFileClip(src)
    audio = video.audio
    to = src[:-4] + '.mp3'
    to2 = outputpath + to[1:]
    print(to2)
    audio.write_audiofile(to2)


threads = [Thread(target=to_audio, args=(p,)) for p in videos if p]

chunks = to_chunks(threads, 8)

for chunk in chunks:
    for t in chunk:
        t.start()

    for t in chunk:
        t.join()
