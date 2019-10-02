#!/usr/bin/env python3

# run chmod +x my-mission-app.py

import argparse
import sys

def on_boot():

    print("OnBoot logic")

def on_command():

    print("OnCommand logic")

def main():
    parser = argparse.ArgumentParser()

    parser.add_argument('--run', '-r')

    args = parser.parse_args()

    if args.run == 'OnBoot':
        on_boot()
    elif args.run == 'OnCommand':
        on_command()
    else:
        print("Unknown run level specified")
        sys.exit(1)

if __name__ == "__main__":
    main()