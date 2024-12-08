#!/usr/bin/env python3
import argparse
import os
import sys

def generate_memory_bar(percentage, length=20):
    """Create a graphical representation of memory usage."""
    hashes = '#' * int(percentage * length)
    spaces = ' ' * (length - len(hashes))
    return f"[{hashes}{spaces} | {int(percentage * 100)}%]"

def read_memory_stats():
    """Read memory statistics from /proc/meminfo."""
    with open('/proc/meminfo') as f:
        data = f.read().splitlines()
    memory = {line.split(':')[0].strip(): int(line.split()[1]) for line in data if 'MemTotal' in line or 'MemAvailable' in line}
    return memory.get('MemTotal', 0), memory.get('MemAvailable', 0)

def get_pid_list_for_program(program):
    """Get the list of PIDs associated with the program."""
    pids = os.popen(f"pidof {program}").read().strip()
    return list(map(int, pids.split())) if pids else []

def get_rss_memory(pid):
    """Get the RSS memory of a process."""
    try:
        with open(f'/proc/{pid}/statm') as f:
            return int(f.read().split()[1]) * 4096
    except Exception:
        return 0

def parse_arguments():
    """Parse command-line arguments."""
    parser = argparse.ArgumentParser(description='Memory Usage Graph')
    parser.add_argument('-H', '--human-readable', action='store_true', help="Print memory in human-readable format")
    parser.add_argument('-l', '--length', type=int, default=20, help="Length of the graph")
    parser.add_argument('program', nargs='?', help="Program name to check memory usage for")
    return parser.parse_args()

def convert_to_human_readable(size_kb):
    """Convert memory size from KB to human-readable format (e.g., MiB, GiB)."""
    units = ['KiB', 'MiB', 'GiB', 'TiB']
    for unit in units:
        if size_kb < 1024:
            return f"{size_kb:.2f} {unit}"
        size_kb /= 1024

def main():
    """Main function to execute the memory visualization logic."""
    args = parse_arguments()
    total_mem, available_mem = read_memory_stats()
    
    if total_mem == 0 or available_mem == 0:
        print("Error: Could not fetch memory stats.")
        sys.exit(1)

    used_memory = total_mem - available_mem
    memory_percentage = used_memory / total_mem

    print(f"Memory Usage: {generate_memory_bar(memory_percentage, args.length)} {used_memory}/{total_mem} KB")

    if args.program:
        pids = get_pid_list_for_program(args.program)
        if not pids:
            print(f"No processes found for {args.program}.")
            return

        program_memory = sum(get_rss_memory(pid) for pid in pids)
        program_percentage = program_memory / total_mem
        print(f"{args.program} Memory Usage: {generate_memory_bar(program_percentage, args.length)} {program_memory}/{total_mem} KB")
    else:
        print(f"Total Memory Usage: {generate_memory_bar(memory_percentage, args.length)} {used_memory}/{total_mem} KB")

if _name_ == '_main_':
    main()
