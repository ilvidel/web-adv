#!/usr/bin/env python3
import yaml
import json
import subprocess

ENCODING = "iso-8859-1"
file_list = subprocess.check_output("ls *.md", shell=True, text=True).split()

for filename in file_list:
    file_lines = []
    json_header = []
    with open(filename, "r", encoding=ENCODING) as f:
        file_lines = f.readlines()

    if "---" in file_lines[0]:
        print("skipping", filename)
        continue
    print(filename)

    # get the header lines
    for line in file_lines:
        if line == "\n":
            break
        json_header.append(line)

    # remove the header from the file
    for line in json_header:
        file_lines.remove(line)

    # parse the header using json
    header = json.loads("".join(json_header))
    yaml_str = yaml.dump(header, allow_unicode=True)
    with open(filename, "w", encoding=ENCODING) as f:
        f.write("---\n")
        f.write(yaml_str)
        f.write("---\n")
        f.writelines(file_lines)
