pdfmerge() {
    if ! [ "$#" -ge 3 ]; then
        echo "ERROR: The script needs at least 3 arguments: <output.pdf> <input1.pdf> <input2.pdf> <...>"
        return
    fi

    for i in "${@:2}"; do
        # all input files have to exist and be a valid PDF file
        if ! [ -f "$i" ]; then
            echo "ERROR: All input arguments have be already existing pdf files!"
            echo "Input file $i does not exist"
            return
        fi

        if ! [ $(head -c 4 "$i") = "%PDF" ]; then
            echo "ERROR: The input file $i is not a valid PDF file!"
            return
        fi
    done

    gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -dPDFSETTINGS=/prepress -sOutputFile=$1 ${@:2}
    echo "Merge successfull!"
    return
}

compresspdf() {
    if ! [ "$#" -ge 1 ]; then
        echo 'Usage: compresspdf [input file] <[output file]> <[screen|ebook|printer|prepress]>'
        return
    fi

    if [ "$#" -ge 4 ]; then
        echo 'Usage: compresspdf [input file] [output file] [screen|ebook|printer|prepress]'
        return
    fi

    if [ "$#" -eq 1 ]; then
        gs -sDEVICE=pdfwrite -dNOPAUSE -dQUIET -dBATCH -dPDFSETTINGS=/${3:-"screen"} -dCompatibilityLevel=1.4 -sOutputFile="temp.pdf" "$1"
        mv "temp.pdf" "$1"
    else
        gs -sDEVICE=pdfwrite -dNOPAUSE -dQUIET -dBATCH -dPDFSETTINGS=/${3:-"screen"} -dCompatibilityLevel=1.4 -sOutputFile="$2" "$1"
    fi
}
