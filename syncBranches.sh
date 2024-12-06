#!/bin/bash

# Colors for console
BPurple='\033[1;35m'
Yellow='\033[0;33m'
NC='\033[0m' # No Color
Blue='\033[0;34m'
Green='\033[0;32m'
Cyan='\033[0;36m'

echo "****⬇  ${BPurple}Start Git Hook pre-push for SYNC Branches${NC} ⬇ ****\n"

# Variables of branches:
BRANCHES=("develop" "stage" "master")
CURRENT_BRANCH=$(git branch --show-current)

if [[ $(git status --porcelain) ]]; then
  echo "⚠️ ${Yellow}There are some uncommitted changes yet, so commit before doing a git push${NC}. ⚠️"
  exit 1
fi

for BRANCH in "${BRANCHES[@]}"; do
  if [[ "$CURRENT_BRANCH" == "$BRANCH" ]]; then
    echo "⚠️ ${Yellow}This pre-push hook can not be execute by $CURRENT_BRANCH branch${NC}. ⚠️"
    exit 1
  fi
done

# Get the latest updates to remote branches
git fetch origin

for BRANCH in "${BRANCHES[@]}"; do
  echo "\n**** ${Blue}Pulling from $BRANCH branch...${NC} ****"

  MERGE_OUTPUT=$(git merge "origin/$BRANCH")

  if [[ "$MERGE_OUTPUT" != *"Already up to date."* ]]; then
    echo "**** ${Cyan}There are difference between $CURRENT_BRANCH and $BRANCH. Doing commit...${NC} ****"
    
    # Check if a merge is in progress (to handle conflicts)
    if [[ -f .git/MERGE_HEAD ]]; then
      git commit --no-edit
      echo "⚠️ ${Cyan}There are conflicts between $CURRENT_BRANCH and $BRANCH. Please resolve conflicts manually${NC}. ⚠️"
      exit 1
    fi
  else
    echo "**** ${Cyan}There are not differences between $CURRENT_BRANCH and $BRANCH${NC}. ****"
  fi
done

echo "\n**** ${Green}SYNC FINISHED SUCCESSFULLY!!${NC} ****"
exit 0