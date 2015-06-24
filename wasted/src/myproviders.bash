#!/bin/bash
#
# % SLURM and ALPS interfaces
# % juha.lento@csc.fi
# % 2015-06-24
#
# ~~~ {.bash}
source "${LIBDIR:=../lib}/nosql.bash"
# ~~~
#
#
# Job reservation information
# ---------------------------
#
# Interrogate SLURM and produce a nosql-table.
#
# If there are changes in the job reservation information provider,
# this is the part that will need to be modified, or rewritten. Note,
# this function can be written with whatever language that the writer is
# familiar with, as long as it writes a nosql-formatted table
# to the stdout.
#
# To test the script with a data cached in a file, set the environment
# variable OFFLINE to a non-empty string.
# 
# ~~~ {.bash}
squeue_nosql () {
    fmt="%.8i%.12P%.17j%.10u%.12M%.12l%.11D"
    fieldwidths=${fmt//[^[:digit:]]/ }
    if [ -n "$OFFLINE" ]; then
        cat "${DATADIR:=../data}/squeue.txt"
    else
        squeue -t R -o "$fmt"
    fi | sed 's/    NODES/RES_NODES/' | \
        nosql_from_fixed_width_table "$fieldwidths"
}
# ~~~
#
#
# Runtime information
# -------------------
#
# Interrogate ALPS and produce a nosql-table.
#
# Implementation notes are the same as for the job
# reservation information above.
#
# ~~~ {.bash}
apstat_nosql () {
    if [ -n "$OFFLINE" ]; then
        cat "${DATADIR:=../data}/apstat.txt"
    else
        apstat -av
    fi | awk -v OFS="$nosql_FS" -v SOH="$nosql_SOH" '
        /Batch System ID = / {
            jobid  = gensub( /[^0-9]/, "", "g", $NF )
        }
        match( $0, /Cmd\[[0-9]+\]: ([^,]+),.*, nodes ([0-9]+),/, n ) {
            if( jobid ) {
                nodes[jobid] = nodes[jobid] + n[2]
                prog[jobid]  = ( prog[jobid] ) ? prog[jobid] " : " n[1] : n[1]
            }
        }
        END {
            s = "JOBID USED_NODES COMMAND"
            print SOH gensub( " ", OFS SOH, "g", s )
            for( i in nodes )
               print i, nodes[i], prog[i]
        }
    ' | sort -n
}
# ~~~