#!/bin/sh

cd ..
for repo in Cerebritron_HAL Cerebritron_AC Cerebritron_PS Cerebritron_SM Cerebritron_CC; do
  if [ -d "$repo" ]; then
    echo "Updating $repo"
    cd "$repo"
    git -c credential.helper= -c credential.helper='!f() { echo username=$GITHUB_TOKEN; echo password=x-oauth-basic; }; f' pull
    cd ..
  else
    echo "Cloning $repo"
    git clone https://$GITHUB_TOKEN@github.com/Pioxolotl/$repo.git
  fi
done
cd Cerebritron

echo "Updating complete"