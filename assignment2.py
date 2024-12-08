#!/usr/bin/env python3

<<<<<<< HEAD
'''
OPS445 Assignment 2
Program: assignment2.py 
Author: "Jashanpreet Singh"
Semester: "Winter"

The python code in this file is original work written by
"Student Name". No code in this file is copied from any other source 
except those provided by the course instructor, including any person, 
textbook, or on-line resource. I have not shared this python script 
with anyone or anything except for submission for grading.  
I understand that the Academic Honesty Policy will be enforced and 
violators will be reported and appropriate action will be taken.


'''

import argparse
import os, sys

def parse_command_args() -> object:
    "Set up argparse here. Call this function inside main."
    parser = argparse.ArgumentParser(description="Memory Visualiser -- See Memory Usage Report with bar charts",epilog="Copyright 2023")
    parser.add_argument("-l", "--length", type=int, default=20, help="Specify the length of the graph. Default is 20.")
    # add argument for "human-readable". USE -H, don't use -h! -h is reserved for --help which is created automatically.
    # check the docs for an argparse option to store this as a boolean.
    parser.add_argument("program", type=str, nargs='?', help="if a program is specified, show memory use of all associated processes. Show only total use is not.")
    args = parser.parse_args()
    return args
# create argparse function
# -H human readable
# -r running only

def percent_to_graph(percent: float, length: int=20) -> str:
    "turns a percent 0.0 - 1.0 into a bar graph"
    ...
# percent to graph function

def get_sys_mem() -> int:
    "return total system memory (used or available) in kB"
    ...

def get_avail_mem() -> int:
    "return total memory that is available"
    ...

def pids_of_prog(app_name: str) -> list:
    "given an app name, return all pids associated with app"
    ...

def rss_mem_of_pid(proc_id: str) -> int:
    "given a process id, return the resident memory used, zero if not found"
    ...

def bytes_to_human_r(kibibytes: int, decimal_places: int=2) -> str:
    "turn 1,024 into 1 MiB, for example"
    suffixes = ['KiB', 'MiB', 'GiB', 'TiB', 'PiB']  # iB indicates 1024
    suf_count = 0
    result = kibibytes 
    while result > 1024 and suf_count < len(suffixes):
        result /= 1024
        suf_count += 1
    str_result = f'{result:.{decimal_places}f} '
    str_result += suffixes[suf_count]
    return str_result

if __name__ == "__main__":
    args = parse_command_args()
    if not args.program:
        ...
    else:
        ...
    # process args
    # if no parameter passed, 
    # open meminfo.
    # get used memory
    # get total memory
    # call percent to graph
    # print

    # if a parameter passed:
    # get pids from pidof
    # lookup each process id in /proc
    # read memory used
    # add to total used
    # percent to graph
    # take total our of total system memory? or total used memory? total used memory.
    # percent to graph.
=======
import argparse
import subprocess
import os

def get_memory_info():
    """Get total and used memory from /proc/meminfo."""
    with open("/proc/meminfo", "r") as f:
        meminfo = {line.split(":")[0]: int(line.split()[1]) for line in f}
    total_mem = meminfo["MemTotal"]  # Total memory in kB
    avail_mem = meminfo["MemAvailable"]  # Available memory in kB
    used_mem = total_mem - avail_mem
    return total_mem, used_mem

def get_pids(program_name):
    """Get PIDs for a given program using pidof."""
    try:
        result = subprocess.run(["pidof", program_name], capture_output=True, text=True, check=True)
        return list(map(int, result.stdout.strip().split()))
    except subprocess.CalledProcessError:
        return []

def get_process_memory(pid):
    """Calculate the total Rss memory for a process."""
    rss_total = 0
    try:
        with open(f"/proc/{pid}/smaps", "r") as f:
            for line in f:
                if line.startswith("Rss:"):
                    rss_total += int(line.split()[1])  # Add Rss in kB
    except FileNotFoundError:
        pass  # Process might have terminated
    return rss_total

def to_human_readable(kb):
    """Convert memory from kB to GiB."""
    gib = kb / (1024 * 1024)
    return f"{gib:.2f} GiB"

def display_bar(label, used, total, length=20):
    """Display a memory usage bar."""
    percentage = used / total
    bar = "#" * int(percentage * length)
    bar = bar.ljust(length)
    print(f"{label:<15} [{bar} | {int(percentage * 100)}%] {used}/{total} kB")

def main():
    parser = argparse.ArgumentParser(description="Display memory usage for processes.")
    parser.add_argument("program", nargs="?", default=None, help="Program name to filter processes")
    parser.add_argument("-H", "--human-readable", action="store_true", help="Show memory in human-readable format")
    parser.add_argument("-l", "--length", type=int, default=20, help="Length of the bar graph")
    args = parser.parse_args()

    total_mem, used_mem = get_memory_info()

    if not args.program:
        # Show system memory usage
        display_bar("Memory", used_mem, total_mem, args.length)
    else:
        # Show memory usage for each process of the given program
        pids = get_pids(args.program)
        if not pids:
            print(f"No running processes found for {args.program}")
            return

        total_rss = 0
        for pid in pids:
            rss = get_process_memory(pid)
            total_rss += rss
            label = str(pid)
            display_bar(label, rss, total_mem, args.length)

        display_bar(args.program, total_rss, total_mem, args.length)

if __name__ == "__main__":
    main()
