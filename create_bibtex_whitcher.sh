#!/bin/bash

OUTPUT_FILE="${HOME}/whitcher.bib"
TMP_FILE="/tmp/whitcher_edit.bib"
DOI=(
    '10.3390/nu12072064'
    '10.1093/ajcn/nqaa100'
    '10.1111/joim.13082'
    '10.1002/oby.22510'
    '10.1093/biostatistics/kxx068'
    '10.1002/jmri.25891'
    '10.1016/j.pscychresns.2017.10.004'
    '10.1007/s00330-017-4858-0'
    '10.1016/j.juro.2016.11.090'
    '10.1155/2017/4519653'
    '10.1038/npjschz.2016.24'
    '10.1016/j.neuroimage.2015.08.012'
    '10.1172/JCI82636'
    '10.1371/journal.pone.0130900'
    '10.1002/jmri.24293'
    '10.1007/s00330-012-2740-7'
    '10.1523/jneurosci.4437-12.2013'
    '10.1016/j.cct.2012.10.003'
    '10.1007/s00330-012-2446-x'
    '10.1016/j.neurobiolaging.2010.04.018'
    '10.1111/j.1552-6569.2010.00536.x'
    '10.18637/jss.v044.i06'
    '10.18637/jss.v044.i05'
    '10.18637/jss.v044.i01'
    '10.1214/10-AOAS441'
    '10.1038/bjc.2011.191'
    '10.1007/s10334-010-0238-3'
    '10.1016/j.neuroimage.2011.01.013'
    '10.1016/j.neuroimage.2010.12.008'
    '10.3233/JAD-2010-100939'
    '10.1080/14697680903460143'
    '10.1002/mrm.22003'
    '10.1109/TMI.2008.2007326'
    '10.1109/TSP.2008.2005752'
    '10.1016/j.neuroimage.2008.10.003'
    '10.1002/mrm.21807'
    '10.1016/j.neuroimage.2008.05.005'
    '10.1111/j.1467-9876.2007.00614.x'
    '10.1002/hbm.20395'
    '10.1016/j.neuroimage.2007.05.057'
    '10.1002/mrm.21229'
    '10.1016/j.jneumeth.2006.07.017'
    '10.1109/tmi.2006.884210'
    '10.2165/00124363-200620030-00003'
    '10.1016/j.ijpharm.2006.01.018'
    '10.1016/j.csda.2004.12.016'
    '10.1523/JNEUROSCI.3874-05.2006'
    '10.1016/j.sigpro.2005.07.002'
    '10.1109/TSP.2005.853098'
    '10.1016/j.jimonfin.2004.10.003'
    '10.1016/j.neuroimage.2004.08.022'
    '10.1142/S0219691304000652'
    '10.1198/004017004000000275'
    '10.1002/asmb.497'
    '10.1088/1469-7688/3/2/305'
    '10.1029/2001WR000509'
    '10.1198/10618600152418674'
    '10.1016/S0378-4371(00)00463-5'
    '10.1016/S0378-4371(00)00456-8'
    '10.1080/00949650008812056'
    '10.1029/2000JD900110'
    '10.1071/EG00094'

    '10.1016/B978-0-12-279670-8.X5000-9'
)

rm -f "${OUTPUT_FILE}"

for doi in "${DOI[@]}"; do
  echo "----- $doi -----"
  curl -s https://api.crossref.org/works/"${doi}"/transform/application/x-bibtex >> "${OUTPUT_FILE}"
  printf '\n\n' >> "${OUTPUT_FILE}"
done

sed -e 's+%2F+/+g' -e '/url =.*,$/d' -e '/month =.*,$/d' "${OUTPUT_FILE}" >> "${TMP_FILE}"
mv "${TMP_FILE}" "${OUTPUT_FILE}"

printf '@book{Book_2001,
	doi = {10.1016/b978-0-12-279670-8.x5000-9},
	year = 2001,
	publisher = {Elsevier},
	author = {Ramazan Gen{\c{c}}ay and Faruk Sel{\c{c}}uk and Brandon Whitcher},
	title = {An Introduction to Wavelets and Other Filtering Methods in Finance and Economics}
}\n\n' >> "${OUTPUT_FILE}"

printf '@online{Basty_2020,
    title = {Image Processing and Quality Control for Abdominal Magnetic Resonance Imaging in the UK Biobank},
    year = {2020},
    eprinttype = {arxiv},
    erprintclass = {eees.IV},
    eprint{2007.01251},
    author = {N. Basty and Y. Liu and M. Cule and E. L. Thomas and J. D. Bell and B. Whitcher}
}\n\n' >> "${OUTPUT_FILE}"

printf '@online{Fitzpatrick_2020,
    title = {Large-scale analysis of iliopsoas muscle volumes in the {UK Biobank}},
    year = {2020},
    eprinttype = {arxiv},
    erprintclass = {eees.IV},
    eprint = {2008.05217},
    author = {J. Fitzpatrick and N. Basty and M. Cule and Y. Liu and J. D. Bell and E. L. T. and B. Whitcher}
}\n\n' >> "${OUTPUT_FILE}"

printf '@online{Liu_2020,
    title = {Systematic Quantification of Health Parameters from {UK Biobank} Abdominal MRI using Deep Learning},
    year = {2020},
    eprinttype = {bioRxiv},
    doi = {10.1101/2020.07.14.187070},
    author = {Y. Liu and N. Basty and B. Whitcher and J. D. Bell and N. {van Bruggen} and E. L. Thomas and M. Cule}
}\n\n' >> "${OUTPUT_FILE}"