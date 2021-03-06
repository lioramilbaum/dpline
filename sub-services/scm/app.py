#!/usr/bin/env python3

import os

from dotenv import load_dotenv
from github import Github


def main():
    load_dotenv(dotenv_path='/.env')
    g = Github(os.environ['GITHUB_TOKEN'])
    for repo in g.get_user().get_repos():
        print(repo.name)
        for pr in repo.get_pulls(state='open'):
            print(pr)


if __name__ == "__main__":
    main()
