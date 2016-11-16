Logstash 5.0.0 supported plugin. (Forked from: https://github.com/cyli/logstash-output-slack)

## Logstash Slack Output Plugin

Uses Slack [incoming webhooks API](https://api.slack.com/incoming-webhooks) to send log events to Slack.

Usage:

```
input {
    ...
}

filters {
    ...
}

output {
    ...
    slack {
        url => <YOUR SLACK WEBHOOK URL HERE>
        channel => [channel-name - optional]
        username => [slack username - optional]
        icon_emoji => [emoji, something like ":simple_smile:" - optional]
        icon_url => [icon url, would be overriden by icon_emoji - optional]
        format => [default is "%{message}", but used to format the text - optional]
        attachments => [an array of attachment maps as specified by the slack API - optional; if there is an "attachments" field in the event map and it is valid, it will override what is configured here, even if it's empty]
    }
}
```

### Changelog:
- [v0.1.5](https://github.com/cyli/logstash-output-slack/releases/tag/v0.1.5):
    - Support logstash 5.0.0
- [v0.1.4](https://github.com/cyli/logstash-output-slack/releases/tag/v0.1.4):
    - Drops support for JDK6 ([#15](https://github.com/cyli/logstash-output-slack/pull/15))
    - Fix gemspec requirements to support newer versions of logstash core ([#14](https://github.com/cyli/logstash-output-slack/pull/14))
- [v0.1.3](https://github.com/cyli/logstash-output-slack/releases/tag/v0.1.3):
    - No change - bug in releasing
- [v0.1.2](https://github.com/cyli/logstash-output-slack/releases/tag/v0.1.2):
    - Added support for attachments
- [v0.1.1](https://github.com/cyli/logstash-output-slack/releases/tag/v0.1.1):
    - Added variable expansion to usernames and channel names ([#6](https://github.com/cyli/logstash-output-slack/pull/6))
    - Fixed bug when reporting malformed requests ([#3](https://github.com/cyli/logstash-output-slack/pull/3))
    - Test fixes since newer versions of logstash-core expects the values in
        the `add_field` hash to not be integers.
- [v0.1.0](https://github.com/cyli/logstash-output-slack/releases/tag/v0.1.0):
    - initial version containing basic slack functionality

### Installation on Logstash = 5.0.0

This forked plugin is not deployed yet, so you need to build it.

#### Prerequisite

1. Install logstash 5.0.0
1. Install JRuby
1. `jruby -S gem install bundler`

#### To build your own gem and install:

1. `git clone <thisrepo>`
1. `jruby -S bundle install`
1. `jruby -S gem build logstash-output-slack.gemspec`
1. `logstash-plugin install --no-verify`

#### Verify that the plugin installed correctly
`bin/plugin list | grep logstash-output-slack`

#### Test that it works:
```
bin/logstash -e '
input { stdin {} }
output { slack { <your slack config here> }}'
```

And type some text in.  The same text should appear in the channel it's configured to go in.

### Installation on Logstash < 1.5

Not supported.
