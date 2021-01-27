#!/usr/bin/env python3

import os
import subprocess as sp


def parse_date(date):
    date = date.strip(" \",'")
    splitchar = "T" if "T" in date else " "
    date = date.split(splitchar)[0]
    return date


def parse_name(src):
    src = src.strip("\"' ./:")
    name = src.lower()

    replaces = {"á": "a", "é": "e", "í": "i", "ó": "o", "ú": "u", "ñ": "n", "ü": "u"}
    for old, new in replaces.items():
        name = name.replace(old, new)

    for c in "'¡!\"¿?ºª":
        name = name.replace(c, "")

    while "--" in name:
        name
    return src, name


def main():
    files = sp.check_output("grep date -r .".split(), text=True).split("\n")
    exceptions = ["Tienda.md", "Socios.md", "Club.md", "Contacto.md", "rename.py"]
    for f in files:
        if not f:
            continue
        fields = f.split(":")
        old, filename = parse_name(fields[0])
        if filename in exceptions:
            continue
        date = parse_date(fields[2])
        print(f"{old} ---> {date}_{filename}")
        os.rename(old, f"{date}_{filename}")


if __name__ == "__main__":
    main()
