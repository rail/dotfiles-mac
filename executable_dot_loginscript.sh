#!/usr/bin/env bash

# Remap Caps Lock to Backspace, from http://homeowmorphism.com/2017/05/27/Remap-CapsLock-Backspace-Sierra
hidutil property --set '{"UserKeyMapping":[{"HIDKeyboardModifierMappingSrc":0x700000039,"HIDKeyboardModifierMappingDst":0x70000002A}]}'

