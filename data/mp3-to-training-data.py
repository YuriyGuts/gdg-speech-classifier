#!/usr/bin/env python

import glob
import subprocess


for match in glob.glob("*.mp3"):
    mp3_name = match
    wav_name = mp3_name.replace(".mp3", ".wav")
    conversion_cmd = "sox --norm {mp3_name} {wav_name} channels 1 trim 0 1.5".format(**locals())
    subprocess.Popen(conversion_cmd, shell=True);
