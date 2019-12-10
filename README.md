# github-tag-action

A Github Action to update the tag associated to a certain release after merging a `patch/[tag-name]_[patch_name]` in release branch.

[![Build Status](https://github.com/d4r1091/git-update-tag-patch/workflows/Bump%20version/badge.svg)](https://github.com/wiktorj/github-tag-action/workflows/Bump%20version/badge.svg)
[![Stable Version](https://img.shields.io/github/v/tag/d4r1091/git-update-tag-patch)](https://img.shields.io/github/v/tag/d4r1091/git-update-tag-patch)
[![Latest Release](https://img.shields.io/github/v/release/d4r1091/git-update-tag-patch?color=%233D9970)](https://img.shields.io/github/v/release/d4r1091/git-update-tag-patch?color=%233D9970)

### Usage

```Dockerfile
name: Updated tag
on:
  push:
    branches:
      - master
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@master
    - name: Bump version and push tag
      uses: d4r1091/git-update-tag-patch@master
      env:
        GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```
