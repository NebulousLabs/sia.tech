Translations
-------------------------

Please see [TRANSLATION.md](TRANSLATION.md) for a guide on contributing translations.

If a page does not have complete translations, add the language code to the `i18nwarnings` array in the front matter for the page. For example: `i18nwarnings = [ "fr", "ru" ]` will display a bar at the top of the page asking for translation contributions when the page is displayed in any of those languages. See [PR #50](https://github.com/NebulousLabs/sia.tech/pull/50) to see what this looks like.

Site maintainers
----------------

This project uses [Hugo](https://github.com/spf13/Hugo/) to generate the static website. As of Sept. 15, 2016, the multilingual features have not yet been included in an official Hugo release. Run `go get -u github.com/spf13/hugo` to install Hugo from source.

### Build

```
git clone https://github.com/NebulousLabs/sia.tech.git
cd sia.tech
./build.sh
```

Hugo also has a built-in server for testing the site locally.
```
hugo server
```


### Directory structure
```
$ tree -L 1
.
├── LICENSE
├── README.md
├── config.toml
├── content     <- Content and pages go here.
├── i18n        <- Translations go here.
├── layouts     <- Templates and partials.
└── static      <- Assets.
```


### i18n and translation

Hugo supports multiple ways of defining translations for a page. The most obvious is `<content>.<language-prefix>.md`, which allows you to rewrite the content in another language. The downside of this is that changing the text structure requires changing the structure of each translated file. This is problematic for us as our content contains mostly markup. Hugo also supports string translation with the template `{{ i18n "string_id" }}`. We only use string translation so that the markup is only written once (this is why we sim-link `index.html` to every other `index.<langauge-prefix>.html`). The English and translated text are then written in the corresponding `i18n/<language-prefix>.yaml`.


### Kludges

Content pages do not render templates. Therefore we cannot call `{{ i18n "string_id" }}` from content pages. Hugo has [shortcodes](https://gohugo.io/extras/shortcodes/) to work around this. The i18n shortcode in `layouts/shortcodes/i18n.html` allows us to call `{{% i18n "string_id" }}`.

The index page is not typically a content page. We use the workaround described in https://github.com/spf13/hugo/issues/330.

Hugo removes the `<p></p>` tags that surround shortcodes. See issue #33. To get around this we surround the shortcodes with a space.
