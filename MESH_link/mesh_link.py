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

import argparse

# -----------------------------------------------------------------------------
# Parser
# -----------------------------------------------------------------------------


def parse_args():
    """
    Function to get and parse arguments
    """
    parser = argparse.ArgumentParser()
    parser.add_argument("-m", "--MESH", dest="mesh", required=True,
                        help="Mesh file (bin format find here \
                        (dYEAR.bin, ie. d2018.bin): \
                        ftp://nlmpubs.nlm.nih.gov/online/mesh/MESH_FILES/\
                        asciimesh/)")
    parser.add_argument("-o", "--output", dest="output", required=True,
                        help="File name of link table \
                        (whithout format (.txt))")

    return parser.parse_args()


if __name__ == '__main__':

    # -------------------------------------------------------------------------
    # CONSTANT
    # -------------------------------------------------------------------------

    # MESH is file in ASCII format with Mesh
    # OUTPUT is the name of futur link table
    ARGS = parse_args()
    MESH = ARGS.mesh
    OUTPUT = ARGS.output

    # -------------------------------------------------------------------------
    # Main
    # -------------------------------------------------------------------------

    # Read MESH file
    INFILE = open(MESH, "r")
    LINES_MESH = INFILE.readlines()

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
    INFILE.close()
    OUTFILE.close()
