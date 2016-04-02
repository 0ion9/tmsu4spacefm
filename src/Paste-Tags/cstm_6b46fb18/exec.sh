#!/bin/bash -x
$fm_import    # import file manager variables (scroll down for info)
#
# Enter your commands here:     ( then save this file )

# two scenarios:
#
# * Tags from (copy|cut)_files
#   * Apply tags that are present in intersection of tagsets
#     (eg. if there are two files, F1 and F2, and F1 is tagged 'a b c' and F2 is tagged 'b c d', apply tags 'b c')
# 
# * Tags from text on clipboard
#   * Apply tags that are listed in text and are already present in database
#   * " " (space) is treated as a tag separator. This may not be 100% correct but is suited to most cases.

eval clip="$(spacefm -s get clipboard_copy_files)"
if [ "${clip[0]}" = "" ]; then
    eval clip="$(spacefm -s get clipboard_cut_files)"
    if [ "${clip[0]}" = "" ]; then
        # no files on clipboard
      clip_text="`spacefm -s get clipboard_text`"
	  if [ "$clip_text" != "" ]; then
          tmsu tags | sort /tmp/taglist.$$
          tags=$(echo "$clip_text" | tr ' ' \\n | sort -u |comm -12 - /tmp/taglist.$$)
          tmsu tag --tags="$tags" -- "${fm_files[@]}"
          rm /tmp/taglist.$$
	  fi
      exit 0
    fi
fi

# ugh slow. But correct.
tmsu tags -1 -- "${clip[0]}" | tail -n +2 | sort > /tmp/taglist.$$
for V in "${clip[@]}"; do
  # intersection of tags
  tags=$(tmsu tags -1 -- "$V" | tail -n +2 | sort | comm -12 - /tmp/taglist.$$)
  printf "%s" "$tags" > /tmp/taglist.$$
done
tags="$(cat /tmp/taglist.$$)"
tmsu tag --tags="$tags" -- "${fm_files[@]}"
rm /tmp/taglist.$$

exit $?
