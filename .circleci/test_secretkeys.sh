#! /bin/bash

COMMON_PARAMETERS="--exclude_paths .circleci/exclude-patterns.hog $TRUFFLEHOG_SINCE_COMMIT ./"

trufflehog --entropy=False $COMMON_PARAMETERS
trufflehog --entropy=False --regex $COMMON_PARAMETERS
trufflehog --entropy=True $COMMON_PARAMETERS
trufflehog --entropy=True --regex $COMMON_PARAMETERS
