#! /usr/bin/zsh

# "Export" podcasts feeds from Gnome Podcast and import them to gPodder.
#
# I wrote this because Podcast (currently) doesn't have an OPML export
# function.
#
# Note that the import will not work if gPodder's database is locked.
#
# Author: Lorenzo Cabrini <lorenzo.cabrini@gmail.com>

db=$HOME/.var/app/org.gnome.Podcasts/data/gnome-podcasts/podcasts.db
sqlite=sqlite3
gpo=gpo
sql="select uri from source"

for uri in $($sqlite $db $sql); do
  $gpo subscribe "$uri"
done
