#!/usr/bin/env python

"""
Database formating for R
Thomas Denecker
December 2017
"""


# -----------------------------------------------------------------------------
# Import
# -----------------------------------------------------------------------------

import os
import glob
import datetime
import argparse
from Bio import SeqIO

# -----------------------------------------------------------------------------
# Parser
# -----------------------------------------------------------------------------


def parse_args():
    """
    Function to get and parse arguments
    """
    parser = argparse.ArgumentParser()
    parser.add_argument("-i", "--input", dest="input",
                        help="For MESH, a Mesh file (bin format find here \
                        (dYEAR.bin, ie. d2018.bin): \
                        ftp://nlmpubs.nlm.nih.gov/online/mesh/MESH_FILES/\
                        asciimesh/). For GO, a GO terms file (obo format \
                        find here : (go.obo, ie. go.obo : \
                        http://purl.obolibrary.org/obo/go.obo).\
                        By default, the last version.For GRYC \
                        a folder with EMBL files ")
    parser.add_argument("-o", "--output", dest="output",
                        help="Output file name \
                        (whithout format (.txt))")

    parser.add_argument('--mesh', action='store_true',
                        help="Converte raw mesh file to link table")
    parser.add_argument('--go', action='store_true',
                        help="Associate GO term and its definition")
    parser.add_argument('--gryc', action='store_true',
                        help=" Generate table with all annotations of GRYC")

    return parser.parse_args()


if __name__ == '__main__':

    ARGS = parse_args()
    # --------------------------------------------------------------------------
    # Analysis controls
    # --------------------------------------------------------------------------

    CONTROL = [ARGS.mesh, ARGS.go, ARGS.gryc]

    if sum(CONTROL) == 0:
        print("No analysis was selected (--mesh, --go, --gryc).")
        print("Please, read the help of the function")
        exit()
    elif sum(CONTROL) != 1:
        print("Only one analysis was be selected (--mesh, --go or --gryc).")
        print("Please, read the help of the function")
        exit()

    # --------------------------------------------------------------------------
    # Arg gestion
    # --------------------------------------------------------------------------
    # >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    # Inputs
    # >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    if ARGS.input is not None:
        INPUT = ARGS.input
    else:
        if ARGS.go is True:
            INPUT = "./Inputs/go_" + \
                          datetime.date.today().strftime('%d_%m_%Y') + ".obo"
            os.system("wget http://purl.obolibrary.org/obo/go.obo -O " +
                      INPUT)
        if ARGS.mesh is True:
            print("For --mesh option, a input file is required")
            print("Please, read the help of the function")
            exit()
        if ARGS.gryc is True:
            print("For gryc option, a folder path with EMBL files is required")
            print("Please, read the help of the function")
            exit()

    # >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    # Outputs
    # >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    if ARGS.output is not None:
        OUTPUT = ARGS.output + ".txt"
    else:
        if ARGS.go is True:
            OUTPUT = "./Outputs/GO_with_def_" + \
                     datetime.date.today().strftime('%d_%m_%Y') + ".txt"
        if ARGS.mesh is True:
            OUTPUT = "./Outputs/Mesh_link_table_" + \
                     datetime.date.today().strftime('%d_%m_%Y') + ".txt"
        if ARGS.gryc is True:
            OUTPUT = "./Outputs/Undefined_name_Yeast_GRYC_" + \
                     datetime.date.today().strftime('%d_%m_%Y') + ".txt"

    # --------------------------------------------------------------------------
    # Main
    # --------------------------------------------------------------------------

    if ARGS.mesh is True:
        # >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
        # MESH part
        # >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

        # Read MESH file
        INFILE = open(INPUT, "r")
        LINES_MESH = INFILE.readlines()

        # Output file
        OUTFILE = open(OUTPUT, "w")
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
    elif ARGS.go is True:
        # Read file
        INFILE = open(INPUT, "r")
        LINES_GO = INFILE.readlines()

        # Output file
        OUTFILE = open(OUTPUT, "w")
        OUTFILE.write("GO ID" + "\t" + "Term" + "\t" + "Def" + "\n")

        for line in LINES_GO:
            if line[:4] == "id: ":
                GO_ID = line.rstrip()[4:]

            if line[:6] == "name: ":
                GO_term = line.rstrip()[6:]

            if line[:5] == 'def: ':
                newline = []
                newline.append(GO_ID)
                newline.append(GO_term)
                # associated term
                raw_def = line.rstrip()[5:]
                position = [pos for pos, char in enumerate(raw_def)
                            if char == '"']
                definition = raw_def[(position[0]+1):position[-1]]
                definition = definition.replace('"', "'")
                newline.append(definition)
                OUTFILE.write("\t".join(newline)+"\n")

        INFILE.close()
        OUTFILE.close()
    elif ARGS.gryc is True:
        # Get all file . embl in folder
        EMBL_FILES = glob.glob(INPUT + "*.embl")

        # Write in a output file
        OUTFILE = open(OUTPUT, "w")
        OUTFILE.write('locus_tag' + "\t" + 'GRYC_note' + "\n")

        # For all genes, get his name and his description
        for EMBL_file in EMBL_FILES:
            s = SeqIO.read(EMBL_file, 'embl')
            for feature in s.features:
                if feature.type == "CDS":
                    locus_tag = ''.join(feature.qualifiers.get('locus_tag',
                                                               "NA"))
                    note = ''.join(feature.qualifiers.get('note', 'NA'))
                    if locus_tag != "NA":
                        OUTFILE.write(locus_tag + "\t" + note + "\n")

        OUTFILE.close()
