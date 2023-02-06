#!/bin/bash

BACKUP_PATH="/volume1/Backup/github"
OAUTH_TOKEN="" # Token from https://github.com/settings/tokens
GITHUB_USERNAME="swissbuechi"

# Fetch all repositories
ALL_REPOSITORIES=""
fetch_repositories() {
	PAGE=1
	while :
	do
		echo "Getting page $PAGE"

	    if [ -z "$OAUTH_TOKEN" ]
	    then
	      PAGE_REPOSITORIES=`curl "https://api.github.com/users/${GITHUB_USERNAME}/repos?per_page=100&page=${PAGE}" | jq -r '.[] | "\(.name),\(.full_name),\(.private),\(.html_url)"'`
	    else
	      PAGE_REPOSITORIES=`curl -H "Authorization: token ${OAUTH_TOKEN}" -s "https://api.github.com/user/repos?per_page=100&page=${PAGE}" | jq -r '.[] | "\(.name),\(.full_name),\(.private),\(.html_url)"'`
	    fi

	    TOTAL_PAGE_REPOSITORIES=`echo $PAGE_REPOSITORIES | tr -cd " " | wc -c`

		ALL_REPOSITORIES="${ALL_REPOSITORIES} ${PAGE_REPOSITORIES}"

	    if [ "$TOTAL_PAGE_REPOSITORIES" = "99" ]; then
		    let PAGE++
	    else
	    	break;
	    fi
	done
}


fetch_repositories

TOTAL_REPOSITORIES=`echo $ALL_REPOSITORIES | tr -cd " " | wc -c`

echo "Backing up $TOTAL_REPOSITORIES repositories"

COUNT=1
for REPO in $ALL_REPOSITORIES
do
    REPO_NAME=`echo ${REPO} | cut -d ',' -f1`
    REPO_FULLNAME=`echo ${REPO} | cut -d ',' -f2`
    REPO_OWNER=`echo ${REPO_FULLNAME} | cut -d '/' -f1`
    PRIVATE_FLAG=`echo ${REPO} | cut -d ',' -f3`
    ARCHIVE_URL=`echo ${REPO} | cut -d ',' -f4`
    ARCHIVE_URL="${ARCHIVE_URL}/archive/master.zip"
    mkdir -p "${BACKUP_PATH}/${REPO_OWNER}"
    FILE_PATH="${BACKUP_PATH}/${REPO_OWNER}/${REPO_NAME}.zip"
    curl -H "Authorization: token ${OAUTH_TOKEN}" -L ${ARCHIVE_URL} -o ${FILE_PATH} -s
    echo "${COUNT}/${TOTAL_REPOSITORIES}: Saved ${FILE_PATH}"
	let COUNT++
done

echo "Done!"