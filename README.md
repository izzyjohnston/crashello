Simple Sinatra app to take crashes from Crashlytics and create new cards in Trello.

# Required environment variables

```
TRELLO_API_KEY
TRELLO_OAUTH_SECRET
TRELLO_OAUTH_TOKEN
TRELLO_BOARD_NAME
TRELLO_LIST_NAME
```

Instructions to get Trello info, taken from [Trellish](http://github.com/wgibbs/trellish)

1. Sign in to Trello and go to https://trello.com/1/appKey/generate.
1. Copy "Key" from that page, that's your `TRELLO_API_KEY`.
1. Copy "Secret (for OAuth signing)" from that page to `TRELLO_OAUTH_SECRET`.
1. Visit https://trello.com/1/authorize?key=TRELLO\_API\_KEY\_FROM\_ABOVE&name=Crashello&expiration=never&response_type=token&scope=read,write
1. Copy the token to `TRELLO_OAUTH_TOKEN`.

# Crashlytics setup

Go to your app’s settings > integrations and set the web hook to:

`http://yourherokuname.herokuapp.com/kaboom`

