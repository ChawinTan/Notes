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

## Reset password

Mac
1. `git config --global credential.helper osxkeychain` or `git config --global --unset user.password`, then type the command you want to execute

Windows
1. `git config --global credential.helper wincred`

## Git mergin on ubuntu

If you encounter an editor that requires you to type some commit message when you `git pull master` to merge but can't seem to use vim commands ... do the below instead.

```
1. Type some message
2. Press Ctrl C O
3. Type the file name and press Enter
4. Press Ctrl X to exit
```


