# Slackcat

Upload files and snippets to [Slack](http://slack.com) chat from the
command-line.

## Getting started

Log in to your slack.com account and get your API token from
https://api.slack.com/.

```sh
gem install slackcat
export SLACK_TOKEN=<your api token>
echo 'hello world' | slackcat -c <channel>
```

## Environment variables

* `SLACK_TOKEN`: your token from https://api.slack.com/.

## Command-line options

```
            --token, -k <s>:   Slack API token
         --channels, -c <s>:   Channels to share
           --groups, -g <s>:   Groups to share
            --users, -u <s>:   Users (DMs) to share
         --filetype, -t <s>:   File type identifier
            --title, -T <s>:   Title of file
         --filename, -n <s>:   Filename of file
  --initial-comment, -i <s>:   Initial comment to add
                 --post, -p:   Post instead of upload
            --multipart, -m:   Multipart upload each file
                 --help, -h:   Show this message
```

## Basic usage: text snippets

To upload text snippets, `slackcat` is used similarly to unix `cat`:
read data from STDIN or list filenames as arguments. Multiple files
will be concatenated.

Examples:

```sh
date | slackcat -c general
slackcat -u buddy foo.txt bar.txt
```

Uploads to slack are private by default. If you list channels, groups
or usernames, content will be shared to them.

## Multipart file uploads

If you wish to upload binary files, for example images, use the `-m`
option, which will cause each file to be uploaded separately.

Example:

```sh
slackcat -c general kitten.jpg cat.gif
```

Slack does a good job of setting filetype correctly from mimetype,
though you may override this with the `-t` option.

This mode does not read stdin. 

## Post messages as chat text

To post text as a normal chat, instead of as a text snippet, use the
`-p` option.

Example:

```sh
date | slackcat -c general -p
slackcat -u buddy -p foo.txt bar.txt
```

Due to a limitation of the slack api, your user icon will not be set,
and your username will appear as `username (bot)`.

## Example usage from vim

Upload contents of buffer:

`:%! slackcat -c dev`

## Example usage from emacs

Upload contents of region:

`M-| slackcat -c dev`

To make a named function:

```lisp
(setenv "SLACK_TOKEN" "<your api token>")

(defvar slackcat-bin  "slackcat" "Command to invoke slackcat.")
(defvar slackcat-args "-c dev"   "Default arguments to pass to slackcat.")

(defun slackcat (&optional b e)
  "Upload contents of region to slack chat."
  (interactive "r")
  (let ((args (read-from-minibuffer "slackcat args: " slackcat-args)))
    (shell-command-on-region b e (format "%s %s" slackcat-bin args))))
```
