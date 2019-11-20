# Tips and tricks on git

## Squashing commits

1. `git rebase -i HEAD~X` where X is the number + 1 of commits you want to squash together. Also for selective squashing within a range or `git rebase -i --root` to rebase to first commit
2. `git push --force-with-lease`

Change to `fixup` to remove commit logs

## Branches

1. `git checkout branch_name` switch to a new branch
2. `git checkout -b new_branch_name` creates a new branch

## Origin

1. `git remote set-url origin __your origin__`
2. `git remote remove origin`
3. `git remote add origin __your origin__`

## Upstream

To keep your branch relevant if you (eg.) fork your repo from other repo and you want to keep it updated whenever the original author makes a change.

1. `git remote add upstream https://......`
2. `git pull upstream master`