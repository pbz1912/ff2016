#!/bin/bash
# Usage: Create html for images, and thumbnails
cat "test" > imagehtml.txt

echo "Creating thumbnails.."
sips --resampleWidth 400 images/*.jpg --out thumbs

cd images
shopt -s nullglob
for image in *.jpg
do
  echo "Adding $image to html file"
  echo "  <div class=\"picture\">" >> ../imagehtml.txt
  echo "    <img src=\"thumbs/$image\" data-src=\"images/$image\" alt=\"\">" >> ../imagehtml.txt
  echo "  </div>" >> ../imagehtml.txt
done
