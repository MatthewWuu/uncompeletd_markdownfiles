###**UNIX programming course on COURSERA**

#### *Some configurations before we get into main context*

----------



-----

- **Quick Q&A**

1. **What's the default shell program on Windows,Linux and MacOS?**

A: cmd, bash and zsh.



   2.**What is GUN/Linux**?

A: some takeaways:

1.    GUN/Linux is a more specified/accurate name rather than Linux; and the GNU org. wants to inspire the spirit of free software/freedom of usage or development
2.    Linux is a kernel, functioned/activated based on GNU(GNU's Not Unix) OS; it cannot run with itself;
3.    Linux is developed by GNU project;
4.    Linux distributions is actually GNU/Linux distributions

FOR more details, see also in this [website](https://www.gnu.org/gnu/linux-and-gnu.en.html) 

------



- **We can install the *windows subsystem for Linux(WSL)* instead of using dual OS or virtual machine, which is a waste of a memory if there is not too much work on the shell. **

Here is the difference between WSL1 and WSL2

> pic



**You need to click on this tab as you wish to install WSL in your Windows OS**

pic

Encounter problems? Here are some troubleshooter pages ：

- Refer to [this](https://answers.microsoft.com/en-us/windows/forum/all/microsoft-store-error-code-0x80131500/41d2d363-83ee-4b5d-ba43-615ca63bb1bf) if you got trouble in accessing the Microsoft Store 

- refer to [this](https://www.jianshu.com/p/3e627ff45ccb)  for installation

- this is the [official guide](https://docs.microsoft.com/zh-cn/windows/wsl/setup/environment#set-up-your-linux-user-info)

After successful installation, you can check the version

```shell
zsh --version
```

you can also see all shell that you got now

```shell
cat /etc/shells
```

----------

You can also easily switch the shell :

```bash
chsh -s /bin/bash
```

```shell
chsh -s /bin/zsh
```



- right now we may have many terminals, you can integrate them together with **Windows Terminal**, which supports cross-platform usages, including cmd/ubuntu/....

**P.S.: control+L 另起一页！很有用啊**

**Unsolved Questions:**

有什么不同？：在windows terminal中的cmd进入到wsl， 我进入到的是window里面的文件夹 `inorganicunix@inorganics:/mnt/c/Users/15290$` ，但是cd后会回到 `/home/inorganicunix` ；在wt里面打开Ubuntu也是一样。但是如果直接打开Ubuntu，不通过wt，那么初始所在的路径是在 `/home/inorganicunix`；在wt的powershell里打开也是一样。为什么呢？显示如下图



目前猜测：

因为是通过Linux 补全只能在自己的目录下？？

***2022/5/30更新**：*
可以理解成两个不同的文件管理方式
一个是Windows的 一个是Ubuntu的
cd到最底层的文件目录 是linux的根目录



### **Fist Week Outline Notes**

-----

let's start with command line command

Every command line is like a little computer program; all command line commands all tend to have the structure like:

```shell
[command] [options] [argurments]
```



Options are preceded by a **hyphen(-)**; arguments can be like **files/raw data/directory.** 



#### -Navigating the command line

hierarchy of folders("directories" in Unix)

home directory(includes personal files) $\equiv$ "~"



- Here are some basic commands

`cd`

`pwd`

`ls`

`cd ..`  //go back to the upper dir.

Let's applied them in real senario.

We can change directory into any folders can be typed(absolute path) exactly in the [arguments]  with "`~/[directory]`" 

```shell
cd ~/Music
pwd
## /user/inorganic/Music
```



If you are not sure about what you wanna enter, and have no idea that what is in the current folder, you can try pressing the **Tab**;

```
cd ~/
```

(double) press the **Tab** to see what is inside of the selected folder

```shell
cd ~/[seletced folder] //press the tab 
## ## Desktop
## Documents
## Photos
## Music
## todo.txt       (just an example here )
```

If you want to find the file/folders which is lead with some characters, for example ".vim", you can type "`cd ~/.vim`" then press **Tab** to find the  specified one.

```shell
inorganicunix@inorganics:/mnt/c/Users/15290$ ls ~/
.123.txt.swp               .landscape/                .viminfo                   zsh-syntax-highlighting/
.bash_history              .motd_shown                .vimrc
.bash_logout               .profile                   .zcompdump
.bashrc                    .sudo_as_admin_successful  .zshrc

inorganicunix@inorganics:/mnt/c/Users/15290$ ls ~/.vim
.viminfo  .vimrc
```

##### Summary

- You can identify a specific file or folder by its path.

- The root directory (/) contains all of the folders and files on your computer.

- Your home directory (~) is the directory where your terminal always starts.

- Use the cd command to change your working directory.

- The pwd command will print the working directory.

- The ls command will list files and folders in a directory.

  ------

#### -Creation and Inspection

* Commands included

  `mkdir`

  `touch`

  `ls -l`

  `wc`

  `vi`

  `echo`

  `echo "[context]" > [filename(within current dir)] `

  `echo "[context]" > `

`mkdir` i.e, ***make directory***

let's try it! Remember that the "Code" here is an **[argument]** phrase.

```shell
inorganicunix@inorganics:/mnt/c/Users/15290/My Documents$ ls
'My Music'  'My Pictures'  'My Videos'
inorganicunix@inorganics:/mnt/c/Users/15290/My Documents$ mkdir Code
inorganicunix@inorganics:/mnt/c/Users/15290/My Documents$ ls
 Code  'My Music'  'My Pictures'  'My Videos'
inorganicunix@inorganics:/mnt/c/Users/15290/My Documents$
```

The most simple way to create a blank file is using the **touch** cmd;

Sometimes it's to complicated to distinguish the files and directories with a single `ls` cmd, then the [-option] function can specify our needs. 

`ls -l`

Let's be coherent.

```shell
inorganicunix@inorganics:/mnt/c/Users/15290/My Documents$ cd Code
inorganicunix@inorganics:/mnt/c/Users/15290/My Documents/Code$ touch ablankfile2.txt 
inorganicunix@inorganics:/mnt/c/Users/15290/My Documents/Code$ ls
ablankfile2.txt
inorganicunix@inorganics:/mnt/c/Users/15290/My Documents/Code$ ls -l
total 0
-rwxrwxrwx 1 inorganicunix inorganicunix 0 Nov 30 13:54 ablankfile2.txt
inorganicunix@inorganics:/mnt/c/Users/15290/My Documents/Code$
```

`-rwxrwxrwx` is a **l**ong sting combined with 10 characters, which stands for different meanings correspondingly.

The first character represents the attributes of the file/dir.; the following three blocks correspond to the authorities of**Owner/ Members_of_group_that_owner_in/ Others**

 [Here](https://blog.csdn.net/LEON1741/article/details/82386520/) is a completed instruction for dummies.



Now if you want to see the detailed info of a specific file, such like we have already created just now, try this. (I've type in some meaningless words in the file)

```shell
inorganicunix@inorganics:/mnt/c/Users/15290/My Documents/Code$ wc ablankfile2.txt
  5  19 117 ablankfile2.txt
```

The first "5" is line; "19" is the total words;"117" is total characters.

let's create a text file with a long content, which is a usual scenario in the real life cases, literally, TLCR :(

```shell
inorganicunix@inorganics:/mnt/c/Users/15290/My Documents/Code$ touch Homeric_Hymns.txt
inorganicunix@inorganics:/mnt/c/Users/15290/My Documents/Code$ vi Homeric_Hymns.txt
Error detected while processing /home/inorganicunix/.vimrc:
line    2:
E492: Not an editor command: rscheme ron
Press ENTER or type command to continue
inorganicunix@inorganics:/mnt/c/Users/15290/My Documents/Code$ cat Homeric_Hymns.txt
Homer, Iliad, Book 1, lines 1-52

Sing, goddess, the anger of Peleus? son Achilleus........
.................
.................
```

I create a file includes an excerpt of ***Homeric Hymns***, just try to implicate demonstrate a very large text file that can hardly read. See how the following commands make an entrance.

Use `wc` to incept the basic info.

```shell
inorganicunix@inorganics:/mnt/c/Users/15290/My Documents/Code$ wc Homeric_Hymns.txt
  54  577 3119 Homeric_Hymns.txt
```

Hum, that's a big one isn't it?

If we simply use the `cat` to get all the content, too long to acquire the key point that we want. `head` is for showing the first 10 lines, we can also set it manually, with the option `-n 5` behind, meaning get the first 5 lines. `cat -c 50`is for asking the first 50 words, and similarly, you can deduce the `tail` and `less`.(`less` would take over your entire terminal window)



You can also refuse to use `vi` as there is only one line to insert in a (new) file, if you find it tooo noxious to open up vim editor, `echo.. >..`and `echo.. >>.. ` are here for you. That also omit the create-file process for you.

```shell
inorganicunix@inorganics:/mnt/c/Users/15290/My Documents/Code$ echo "this line was echo into the file echo-out" > echo-out.txt
inorganicunix@inorganics:/mnt/c/Users/15290/My Documents/Code$ ls
Homeric_Hymns.txt  echo-out.txt
ablankfile2.txt
inorganicunix@inorganics:/mnt/c/Users/15290/My Documents/Code$ cat echo-out.txt
this line was echo into the file echo-out
```

As you can see, a now file named by you with `echo` is also created simultaneously. This technique is called **output redirection**.

> One easy way to create a file is using **output redirection**. Output redirection stores text that would be normally printed to the command line in a text file. You can use output redirection by typing the greater-than sign (>) at the end of a command followed by the name of the new file that will contain the output from the proceeding command. 



You can use `echo ..>>..` to insert/append a sentence at the end of the content.

```shell
inorganicunix@inorganics:/mnt/c/Users/15290/M
y Documents/Code$ echo "this line was appended into the file echo-out.txt by 'echo >>' techui
que" >> echo-out.txt
inorganicunix@inorganics:/mnt/c/Users/15290/My Documents/Code$ cat echo-out.txt
this line was echo into the file echo-out
this line was appended into the file echo-out.txt by 'echo >>' techuique
inorganicunix@inorganics:/mnt/c/Users/15290/My Documents/Code$
```



- **WARNING!!**

  IF you want to append another line to the end of echo-out.txt, so typed echo "A third line." > echo-out.txt into the terminal when really I meant to type echo "A third line." >> echo-out.txt**(notice I used > when I meant to use >>)**.  The previous content would be covered by the current inputs.


#### -Text Editor

- **vim and emacs** // two prevailing text editor in the world.


----
----

### SECOND WEEK NOTE

In this week section, most of the knowledge are made up with a great amount of **fractional command**. I try to cluster them by classes.

##### ***Summary***

+ grep and `egrep` can be used along with regular expressions to search for patterns of text in a file.

+ Metacharacters are used in regular expressions to describe patterns of characters.

+ `find` can be used to search for the names of files in a directory.

-----------



#### **-Regular expression 正则表达式**

text data, such as ../states.txt --> can be treat as  **string**
use regex to search string (a datatype) 

.txt 文件内搜索
`grep “x” states.txt`  \\\ here the **''x''** is a regular expression

#### **-Metacharacters 元字符**

use `egrep` to handle matechar. well rather than `grep` 
"." stands for one char, called period metachar.

`egrep "i.g" states.txt`
we can get "irg"/"ivg" or something like it

#### **-Quantifier sign** 

+  "+", "*", {n} defines times of occurrence of adjacent char (邻近的char)

```bash
egrep "s*i" states.txt
egrep "i*s" states.txt
egrep "s{2,3}" states.txt
egrep "(i.{2}){3}" states.txt \\很好解释` 
```

#### **-Character set**

```bash
egrep "\s" small.txt \\space
egrep "\w" small.txt \\words
```

-v flag \\invert_match \\\类似not

```bash
egrep -v "\s" small.txt \\NON-space
```

除了如上面通用的set 可以用 [ ]来定义一个set

```bash
egrep "[aeiou]" small.txt
```

用^ (caret) 来表示补集

```bash
egrep "[^aeiou]" small.txt
```

标志一个range [a-z] 	\\\it's casesensitive

```bash
egrep "[a-z]" small.txt
egrep "[1-9]" small.txt
```

#### **-标点符号**

Add **\\** before you type in punctuations. Then we can search in the text files.

```shell
inorganicunix@inorganics:/mnt/c/Users/15290/Desktop/2022_Spring_semester$ egrep "\." small.txt
http://www.jhsph.edu/
```

#### **-Anchor** 

+ **^** anchor the start of the line
+ **$** anchor the end of the line

the flag **"-n"** can be used to print out the line number accrodingly

+ **|** stands for OR  

`egrep "North|South" states.txt`

`egrep -n "^M|North" states.txt`

<u>-v_叫做一个flag</u>

#### **-Find a file by name**

+ Search downward from the current dir *(the defult dir is the current dir)*.

`$ find . -name "*.pdf"`




#### **-Differentiate**

+ head // somthing like cat > 

`head -n 4 states.txt > four.txt`

+ diff //can differenciate the difference betw given two files

`diff states.txt four.txt`


+ hash //generate a unique code from the content; prevent the malicous files; shell provides two forms of hash to check on the files

Let's check your computed hash with the provided hash

***MD5* and *SHA-1*.**

***-MD5***
```bash
inorganicunix@inorganics:/mnt/c/Users/15290/Desktop/shellscript/txt_files$ md5sum states.txt
c7dbf17524d5b10647ab6895df7bb953  states.txt
```
***-sha224sum & sha256sum***
```bash
inorganicunix@inorganics:/mnt/c/Users/15290/Desktop/shellscript/txt_files$ sha224sum states.txt
640534595668f3ef43f88f0920972d55104b2c2c2bbb0bc21ef5e6e2  states.txt

inorganicunix@inorganics:/mnt/c/Users/15290/Desktop/shellscript/txt_files$ sha256sum states.txt
3a788c1fa94976bf16d6e0708f022d4971f5ccc26bc1e022eb83bb782776ee1c  states.txt
```

#### **-Pips**

The pipe (|) takes the output of the program on its left side and directs the output to be the input for the program on its right side.



#### **-Make(incompleted)**

**usages:** 
   install programs **->** compile from source code to program. This is widely used on LinuxOS when you install some programs;
   creat document automatically 

-target file
	目标下的任何命令都必须使用 Tab 缩进


**more for makefile tutorial:**
- https://makefiletutorial.com/#makefile-cookbook
- https://opensource.com/article/18/8/what-how-makefile

---------
-------


