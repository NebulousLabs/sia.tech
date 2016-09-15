Contributing translations
-------------------------

Translations that have been requested by the community can be found [by filtering open issues labeled "translation needed"](https://github.com/NebulousLabs/sia.tech/issues?q=is%3Aopen+is%3Aissue+label%3A%22needs+translation%22). If you can contribute translations in these languages, we would greatly appreciate it!

### Fixing typos

1. Fork the repository.
2. Create a feature-branch.
3. Locate the typo in the language's i18n file in `i18n/<language-prefix>.yaml`.
4. Correct the typo.
5. Add yourself to the CONTRIBUTORS file.
6. Commit the change.
7. Open a PR with the label "i18n".

See PR #n as an example.


### Adding missing translations to existing languages

1. Fork the repository.
2. Create a feature-branch.
3. Find the string's id in `i18n/en.yaml`.
4. Add the id and translation to `i18n/<language-prefix>.yaml` like so
```
- id: example_id
  translation: "Hello, World!"
```
5. Commit the change. If there is a corresponding "translation needed" issue, [close the issue in the commit message](https://help.github.com/articles/closing-issues-via-commit-messages/).
6. Add yourself to the CONTRIBUTORS file.
7. Open a PR with the label "i18n".

See PR #n as an example.


### Adding new languages

1. Fork the repository.
2. Create a feature-branch.
3. Add the language to the `Languages` section of `config.toml`.
4. Create the file `i18n/<langauge-prefix>.yaml`. This file will be where you write the translations. It may be helpful to copy `i18n/en.yaml` and then change the translations.
5. Write the translated text in the `translation` field of each id. Be sure to escape strings as necessary (see commit _ as an example).
6. Commit the change. If there is a corresponding "translation needed" issue, [close the issue in the commit message](https://help.github.com/articles/closing-issues-via-commit-messages/).
7. Add yourself to the CONTRIBUTORS file.
8. Open a PR with the label "i18n".

See PR #n as an example.


Site maintainers
----------------

This project uses [Hugo](https://github.com/spf13/Hugo/) to generate the static website. As of Sept. 15, 2016, the multilingual features have not yet been included in an official Hugo release. Run `go get -u github.com/spf13/hugo` to install Hugo from source.

### Build

```
git clone https://github.com/NebulousLabs/sia.tech.git
cd sia.tech
hugo
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
