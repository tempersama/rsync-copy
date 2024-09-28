# Rsync Copy

***By `temper`***

Based off `SRUEDA99` scp-action due to the simplicity of that project

## Overview

This Github action uses Rsync to copy files over ssh 

## Input Parameters

Required Parameters

* `host` IP/Hostname of target.
* `username` on the target IP/host that is used to copy files to.
* `source` - Source file or folder to copy
* `destination` - the folder where the content will be copied.
* `key` - the private key used to secure the connection to the target.

Optional Parameters:

- The `port` is set as **22** by default, you can also specify another one.

## Secrets

It is recommended to pass all sensitive values through `secrets`

## Examples

```yaml
name: Copy single file
uses: tempersama/rsync-action@2.0
with:
  host: ${{ secrets.host }}
  source: html/
  destination: /opt/nginx/website.com
  username: ${{ secrets.username }}
  key: ${{ secrets.SERVER_KEY }}
  port: 2222
```

