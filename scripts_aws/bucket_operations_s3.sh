#!/usr/bin/env bash

# snippet-start:[s3./bash.bucket-operation.complete]

source ./awsdocs_general.sh

# this function will check the bucket is already exits or not.

function bucket_exits {
    be_bucketname = $1

    #checking the bucket existance is there or not.
    # all other output are not shown
    aws s3api head-bucket \
        --bucket $be_bucketname \
        >/dev/null 2>&1


    if [[${?} -eq 0]]; then
        return 0  # for condition of true
    else 
        return 1  # for condition of false
    fi
}


# function for creating new s3-bucket

function create_bucket {
    local BUCKET_NAME REGION_CODE RESPONSE
    local OPTION OPTIND OPTARG

    function usage {
        echo "function create_bucket"
        echo " create an amazon s3 bucket. you must supply both of the following parameters."
        echo " -b bucket_name"
        echo "-r region_code"
        echo ""
    }

    # retrieve the calling parameters
    while getopts "b:r" OPTION; do
        case "${OPTION}"
        in 
            b) BUCKET_NAME="${OPTANG}";;
            r) REGION_CODE="${OPTANG}";;
            h) usage; return 1;;
            \?) echo "Invalid Parameter"; usage; return 1;;

        esac
    done

    if [[ -z "$BUCKET_NAME" ]]; then
        errecho "ERROR : you must provide a bucket name with the -b parameter"
        usage
        return 1
    fi

    iecho "parameters:\n"
    iecho " Bucket name: $BUCKET_NAME"
    iecho "Region code: $REGION_CODE"
    iecho ""

    if (bucket_exits $BUCKET_NAME); then
        errecho "ERROR: A bucket with the name already exits . try new name"
        return 1
    fi

}

function copy_file_to_bucket {
    cftb_bucketname=$1
    cftb_sourcefile=$2
    cftb_destfilename=$3
    local RESPONSE


    RESPONSE=$(aws s3api put-object \
                --bcuket $cftb_bucketname \
                --body $cftb_sourcefile \
                --key $cftb_destfilename)


    if [[${?} -ne 0 ]]; then
        errecho "ERROR: AWS reports put-object operation failed. \n$RESPONSE"
        return 1

    fi
}

#function copy item in to the bucket

function copy_item_in_bucket {
    ciib_bucketname=$1
    ciib_sourcefile=$2
    ciib_destfile=$3
    local RESPONSE
    
    RESPONSE=$(aws s3api copy-object \
                --bucket $ciib_bucketname \
                --copy-source $ciib_bucketname/$ciib_sourcefile \
                --key $ciib_destfile)

    if [[ $? -ne 0 ]]; then
        errecho "ERROR:  AWS reports s3api copy-object operation failed.\n$RESPONSE"
        return 1
    fi
}


# function for listing the item in to the bucket

function list_item_in_bucket {
    liib_bucketname=$1
    local RESPONSE

    RESPONSE=$(aws s3api list-objects \
                    --bucket $liib_bucketname \
                    --output text \
                    --query 'Contents[].{Key: Key, Size:Size}' )

    if [[ $(?) -eq 0]]; then
        echo "$RESPONSE"
    else
        errecho "ERROR: AWS report s3api list-objects operation failed.\n$RESPONSE"
        return 1
    fi
}

# deleting the item into the bucket

function delete_item_in_bucket {
    diib_bucketname=$1
    diib_key=$2
    local RESPONSE
    
    RESPONSE=$(aws s3api delete-object \
                --bucket $diib_bucketname \
                --key $diib_key)

    if [[ $? -ne 0 ]]; then
        errecho "ERROR:  AWS reports s3api delete-object operation failed.\n$RESPONSE"
        return 1
    fi
}

#

function delete_bucket {
    db_bucketname=$1
    local RESPONSE

    RESPONSE=$(aws s3api delete-bucket \
                --bucket $db_bucketname)

    if [[ $? -ne 0 ]]; then
        errecho "ERROR: AWS reports s3api delete-bucket failed.\n$RESPONSE"
        return 1
    fi
}