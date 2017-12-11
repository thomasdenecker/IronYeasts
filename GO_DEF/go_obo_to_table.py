"""
Converte raw mesh file to link table
Thomas Denecker
November 2017
"""

# !/usr/bin/env python
# -*- coding: utf-8 -*-


# -----------------------------------------------------------------------------
# Import
# -----------------------------------------------------------------------------

import os
import datetime
import argparse

# -----------------------------------------------------------------------------
# Parser
# -----------------------------------------------------------------------------


def parse_args_go():
    """
    Function to get and parse GO terms file and output name
    """
    parser = argparse.ArgumentParser()
    parser.add_argument("-g", "--GO", dest="GO_FILE",
                        help="GO terms file (obo format find here :  \
                        (go.obo, ie. go.obo : \
                        http://purl.obolibrary.org/obo/go.obo).\
                        By default, the last version")
    parser.add_argument("-o", "--output", dest="output",
                        help="File name of link table \
                        (whithout format (.txt)). \
                        By default : GO_with_def_DATE.txt")

    return parser.parse_args()


if __name__ == '__main__':
    # -------------------------------------------------------------------------
    # CONSTANT
    # -------------------------------------------------------------------------

    ARGS = parse_args_go()

    # Download last GO version or use a user version
    if ARGS.GO_FILE is not None:
        IMPORT_NAME = ARGS.GO_FILE
    else:
        IMPORT_NAME = "./Inputs/go_" + \
                      datetime.date.today().strftime('%d_%m_%Y') + ".obo"
        os.system("wget http://purl.obolibrary.org/obo/go.obo -O " +
                  IMPORT_NAME)

    if ARGS.output is not None:
        OUTPUT = ARGS.output + ".txt"
    else:
        OUTPUT = "./Outputs/GO_with_def" + \
                 datetime.date.today().strftime('%d_%m_%Y') + ".txt"

    # -------------------------------------------------------------------------
    # Main
    # -------------------------------------------------------------------------

    # Read file
    INFILE = open(IMPORT_NAME, "r")
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
            position = [pos for pos, char in enumerate(raw_def) if char == '"']
            definition = raw_def[(position[0]+1):position[-1]]
            definition = definition.replace('"', "'")
            newline.append(definition)
            OUTFILE.write("\t".join(newline)+"\n")

    INFILE.close()
    OUTFILE.close()
