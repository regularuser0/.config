#!/bin/bash

TEXT=$(wl-paste)
TRANSLATION=$(trans -brief -t fr "$TEXT")
dunstify "$TRANSLATION"
