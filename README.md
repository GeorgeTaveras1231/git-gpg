# git-gpg
> A tool to help you hide secrets in git

## Install

```
npm install -g git-gpg
```

## Usage

** Explore commands **

This command will list all available commands
```bash
$ git gpg
```

## Tutorial

### Initialize repo

```
git gpg init # or
git gpg init custom-secrets-dir
```

### Add trustees

In this example, a trusted key can be anything that un-ambigously identifies a public key in your possession.
```
git gpg add-person a-trusted-key
```

###  List trustees

```
git gpg who-knows
```

###  Hide files

```
git gpg hide
```

### Clean raw secret files

```
git gpg clean
```

### Reveal hidden files

```
git gpg reveal
```

## Configurations

### Override encrypt format

By default, the encrypt format is ascii but can be configured to be binary
```
git gpg config encrypt.format binary
```
