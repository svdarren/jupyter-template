#! /bin/bash

trufflehog --entropy=False ./
trufflehog --entropy=False --regex ./
trufflehog --entropy=True ./
trufflehog --entropy=True --regex ./