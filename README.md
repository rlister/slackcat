# Slackcat

Upload files and snippets to [Slack](http://slack.com) chat from the
command-line.

## Getting started

Log in to your slack.com account and get your API token from
https://api.slack.com/.

    gem install slackcat
    export SLACKCAT_TOKEN=<your api token>
    echo 'hello world' | slackcat -c <channel>

## Usage

`slackcat` is used similarly to unix `cat`: read data from STDIN or
list filenames as arguments. Multiple files will be concatenated.

Environment variables:

* `SLACKCAT_TOKEN`: your token from https://api.slack.com/.
* `SLACKCAT_CHANNELS`: default comma-separated list of channel names
  to share files

Command-line options:

```
            --token, -k:   Slack API token
         --channels, -c:   Channels to share into
         --filetype, -t:   File type identifier
            --title, -T:   Title of file
         --filename, -n:   Filename of file
  --initial-comment, -i:   Initial comment to add
             --help, -h:   Show this message
```

File uploads to slack are private by default. If you list channels,
content will be shared to them.

## Example usage from vim

Upload contents of buffer:

`:%! slackcat`

## Example usage from emacs

Upload contents of region:

`M-| slackcat`

To make a named function:

```lisp
(setenv "SLACK_TOKEN" "<your api token>")
(setenv "SLACK_CHANNELS" "<channel list")

(defun slackcat (&optional b e)
  "Upload contents of region to slack chat."
  (interactive "r")
  (shell-command-on-region b e "slackcat"))
```
