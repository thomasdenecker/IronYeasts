"""
Converte raw mesh file to link table
Thomas Denecker
December 2017
"""

# !/usr/bin/env python
# -*- coding: utf-8 -*-

# -----------------------------------------------------------------------------
# Import
# -----------------------------------------------------------------------------

import sys
import argparse

# -----------------------------------------------------------------------------
# Parser
# -----------------------------------------------------------------------------

PARSER = argparse.ArgumentParser()
PARSER.add_argument("-m", "--MESH", dest="mesh",
                    help="Mesh file (bin format find here \
                    (dYEAR.bin, ie. d2018.bin): \
                    ftp://nlmpubs.nlm.nih.gov/online/mesh/MESH_FILES/\
                    asciimesh/)")
PARSER.add_argument("-o", "--output", dest="output",
                    help="File name of link table (whithout format (.txt))")
ARGS = PARSER.parse_args()

if len(sys.argv) != 5:
    print(len(sys.argv))
    print(sys.argv)
    PARSER.error("2 arguments are expected.\
                 Please, read help to have arguments (sys.argv[0] -h or \
                 sys.argv[0] --help)")

# -----------------------------------------------------------------------------
# Variables
# -----------------------------------------------------------------------------

# MESH is file in ASCII format with Mesh
# OUTPUT is the name of futur link table

MESH = ARGS.mesh
OUTPUT = ARGS.output

# -----------------------------------------------------------------------------
# Main
# -----------------------------------------------------------------------------

# Read MESH file
infile = open(MESH, "r")
LINES_MESH = infile.readlines()

# Output file
OUTFILE = open(OUTPUT+".txt", "w")
OUTFILE.write("source" + "\t" + "target" + "\n")

# Search link between MESH term
for line in LINES_MESH:
    # MH is a MESH term
    if line[:5] == "MH = ":
        MESH_term = line.rstrip()[5:]

    # FX is a "see also" for this MESH term
    if line[:5] == "FX = ":
        newline = []
        newline.append(MESH_term)
        newline.append(line.rstrip()[5:])
        OUTFILE.write("\t".join(newline)+"\n")

# Close files
infile.close()
OUTFILE.close()
