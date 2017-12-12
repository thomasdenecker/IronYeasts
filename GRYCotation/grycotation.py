"""
 Generate table with all annotations of GRYC
 Thomas Denecker
 December 2017
 Requirement : Biopython
 http://biopython.org/wiki/Download
"""

# -*- coding: utf-8 -*-

# -----------------------------------------------------------------------------
# Import
# -----------------------------------------------------------------------------

import glob
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
    parser.add_argument("-o", "--organism", dest="organism", required=True,
                        help="Studied organism. WARNING : no space in the name\
                         i.e. : C_glabrata")
    parser.add_argument("-f", "--folder", dest="folder", required=True,
                        help="Folder with EMBL files")

    return parser.parse_args()


if __name__ == '__main__':

    # -----------------------------------------------------------------------------
    # Variables
    # -----------------------------------------------------------------------------
    # ORGANISM is name of studied organism
    # FOLDER is the folder with all EMBL files for one organism.
    # In GRYC, 1 chromosome = 1 EMBL file

    ARGS = parse_args()
    ORGANISM = ARGS.organism
    FOLDER = ARGS.folder

    # -----------------------------------------------------------------------------
    # Main
    # -----------------------------------------------------------------------------

    # Get all file . embl in folder
    EMBL_FILES = glob.glob(FOLDER + "*.embl")

    # Write in a output file
    OUTFILE = open("./Outputs/GRYC_"+ORGANISM+".txt", "w")
    OUTFILE.write('locus_tag' + "\t" + 'GRYC_note' + "\n")

    # For all genes, get his name and his description
    for EMBL_file in EMBL_FILES:
        s = SeqIO.read(EMBL_file, 'embl')
        for feature in s.features:
            if feature.type == "CDS":
                locus_tag = ''.join(feature.qualifiers.get('locus_tag', "NA"))
                note = ''.join(feature.qualifiers.get('note', 'NA'))
                if locus_tag != "NA":
                    OUTFILE.write(locus_tag + "\t" + note + "\n")

    OUTFILE.close()
