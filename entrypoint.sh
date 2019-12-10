#!/bin/bash
exec < /dev/tty

# Get the current branch name
branch_name=$(git branch | grep "*" | sed "s/\* //")

# Get the name of the branch that was just merged
reflog_message=$(git reflog -1)
merged_branch_name=$(echo $reflog_message | cut -d" " -f 4 | sed "s/://")

# if the merged branch was master - don't do anything
if [[ $merged_branch_name = "master" ]]; then
    exit 0
fi

# Begin output
echo " "
echo "You've just merged the branch \"$merged_branch_name\" into \"$branch_name\". "

# if the merged branch starts with "patch" - then
# move the appropriate tag to the latest commit of target branch
if [[ $merged_branch_name == patch* ]]; then

    echo "Getting tag"

    # get the tag name
    tag_name=$merged_branch_name
    tag_name=${tag_name##*patch/}
    tag_name=${tag_name%%-*}

    echo "Pushing tag: $tag_name"

    git tag -d $tag_name        # delete the old local tag
    git push origin :$tag_name  # delete the old remote tag (use for each affected remote)
    git tag $tag_name           # create a new local tag
    git push origin $tag_name   # push new tag to remote    (use for each affected remote)

    echo "Tag successfully updated"

fi
