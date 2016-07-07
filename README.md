# ftp plugin

[![fastlane Plugin Badge](https://rawcdn.githack.com/fastlane/fastlane/master/fastlane/assets/plugin-badge.svg)](https://rubygems.org/gems/fastlane-plugin-ftp)

## Getting Started

This project is a [fastlane](https://github.com/fastlane/fastlane) plugin. To get started with `fastlane-plugin-ftp`, add it to your project by running:

```bash
fastlane add_plugin ftp
```

## About ftp

Simple FTP plugins for Fastlane

Support Download and Upload

## Example

### Upload :

```ruby
  ftp(
    host: 'ftp.domain.com',
    username: 'my_name',
    password: 'my_password',
    upload: {
      src: "./localFile",
      dest:"/server/path/"
    }
    )
```

### Download

```ruby
  ftp(
    host: 'ftp.domain.com',
    username: 'my_name',
    password: 'my_password',
    download: {
      src: "/distant/server/path/file.md",
      dest:"/localPath/file.md"
    }
    )
```

## Run tests for this plugin

To run both the tests, and code style validation, run

````
rake
```

To automatically fix many of the styling issues, use
```
rubocop -a
```

## Issues and Feedback

For any other issues and feedback about this plugin, please submit it to this repository.

## Troubleshooting

If you have trouble using plugins, check out the [Plugins Troubleshooting](https://github.com/fastlane/fastlane/blob/master/fastlane/docs/PluginsTroubleshooting.md) doc in the main `fastlane` repo.

## Using `fastlane` Plugins

For more information about how the `fastlane` plugin system works, check out the [Plugins documentation](https://github.com/fastlane/fastlane/blob/master/fastlane/docs/Plugins.md).

## About `fastlane`

`fastlane` is the easiest way to automate building and releasing your iOS and Android apps. To learn more, check out [fastlane.tools](https://fastlane.tools).
