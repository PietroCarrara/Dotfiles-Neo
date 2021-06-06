#!/usr/bin/env python3

import os
import sys
import glob
import subprocess

doneProcessingFlags = False
stopFlagsProcessing = False

verbose = False

for video in sys.argv[1:]:
    if not stopFlagsProcessing and video.startswith("--"):
        # Don't treat the next values as flags
        if video == '--':
            stopFlagsProcessing = True
        elif doneProcessingFlags:
            print('Usage: sub-fix.py [FLAGS...] [--] FILES...')
            print('error: encountered a flag while expecting a file')
            exit(1)
        elif video == '--verbose':
            verbose = True

    # As soon as we find a video, we don't expect to find any other flag
    doneProcessingFlags = True

    dirpath = os.path.dirname(video)
    filename = os.path.splitext(os.path.basename(video))[0]
    subs = []
    for subCandidate in glob.glob(os.path.join(dirpath, '**/*.srt'), recursive=True):
        if filename.lower() in subCandidate.lower():
            subs.append(subCandidate)

    if (len(subs) < 2):
        if verbose:
            print(f'warn: skipping {video}: not enough subtitles found')

    subs = sorted(subs, key=lambda x: os.path.getmtime(x))

    # The oldest file is the correct one, the newest is the one we need to adjust
    correct, incorrect = subs[0], subs[len(subs)-1]

    subprocess.call(['ffsubsync', correct, '-i', incorrect, '-o', incorrect])
