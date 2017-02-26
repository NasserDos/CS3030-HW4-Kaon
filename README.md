# Kaon
CS 3030 &ndash; Homework 4

- Jeremy Johnson
- Nasser Binshabeeb
- Trevor Orgill


## Implementation


### kaon\_hw4.sh

Wrapper for all the scripts.

```
Usage: ./kaon_hw4.sh -y <year> -e <email> [-u <user> -p <passwd>]
```


### kaon\_hw4\_wget.sh

Gets the files.

```
Usage: ./kaon_hw4_wget.sh <year>
```


### kaon\_hw4\_expand.sh

Expands the files grabbed.

```
Usage: ./kaon_hw4_expand.sh
```


### kaon\_hw4.awk

Filters the data to grab what we want.

```
Usage: ./kaon_hw4.awk <file>
```


### kaon\_hw4\_zip.sh

Zips up the ending file.

```
Usage: ./kaon_hw4_zip.sh <file>
```


### kaon\_hw4\_ftp.sh

Ftps to the server and places file.

```
Usage ./kaon_hw4_ftp.sh -f <file> [-u <username> -p <password>]
```


### kaon\_hw4\_clean.sh

Cleans up the huge mess we just made.

```
Usage ./kaon_hw4_clean.sh
```

### kaon\_hw4\_cronjob.txt

Contains the line to schedule the job in the crontab. 



