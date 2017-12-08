#############################################
# Converte raw mesh file to link table
# Thomas Denecker
# November 2017
#############################################

# !/usr/bin/env python
# -*- coding: utf-8 -*-

# -----------------------------------------------------------------------------
# Import
# -----------------------------------------------------------------------------

import sys
from optparse import OptionParser

# -----------------------------------------------------------------------------
# Parser
# -----------------------------------------------------------------------------

parser = OptionParser()
parser.add_option("-m", "--MESH", dest="mesh",
                  help="Mesh file (bin format find here \
                  (dYEAR.bin, ie. d2018.bin): \
                  ftp://nlmpubs.nlm.nih.gov/online/mesh/MESH_FILES/\
                  asciimesh/)")
parser.add_option("-o", "--output", dest="output",
                  help="File name of link table (whithout format (.txt))")
(options, args) = parser.parse_args()

if len(sys.argv) != 5:
    print(len(sys.argv))
    print(sys.argv)
    parser.error("2 arguments are expected.\
                 Please, read help to have arguments (sys.argv[0] -h or \
                 sys.argv[0] --help)")

# -----------------------------------------------------------------------------
# Variables
# -----------------------------------------------------------------------------

# MESH is file in ASCII format with Mesh
# OUTPUT is the name of futur link table

MESH = options.mesh
OUTPUT = options.output

# -----------------------------------------------------------------------------
# Main
# -----------------------------------------------------------------------------

# Read MESH file
infile = open(MESH, "r")
lines_MESH = infile.readlines()

# Output file
outfile = open(OUTPUT+".txt", "w")
outfile.write("source" + "\t" + "target" + "\n")

# Search link between MESH term
for line in lines_MESH:
    # MH is a MESH term
    if(line[:5] == "MH = "):
        MESH_term = line.rstrip()[5:]

    # FX is a "see also" for this MESH term
    if(line[:5] == "FX = "):
        newline = []
        newline.append(MESH_term)
        newline.append(line.rstrip()[5:])
        outfile.write("\t".join(newline)+"\n")

# Close files
infile.close()
outfile.close()
