library(swirl)
install_from_swirl("R Programming")
x <- 1:20
x
5+7
x <- 5 + 7
x
y <- x-3
y
c(1.1, 9, 3.14)
z <- c(1.1, 9, 3.14)
?c
z
c(z, 555, z)
z * 2 + 100
my_sqrt <- sqrt(z-1)
my_sqrt
my_div <- z/my_sqrt
my_div
c(1,2,3,4) + c(0,10)
c(1,2,3,4) + c(0,10,100)
getwd()
ls()
x <- 9
ls
ls()
list.files()
?list.files
args(list.files)
list.files(full.names = TRUE)
old.dir <- getwd()
dir.create(testdir)
dir.create("testdir")
setwd(testdir)
setwd("testdir")
file.create("mytest.R")
list.files()
file.exists("mytest.R")
file.info("mytest.R")
file.rename("mytest.R", "mytest2.R")
file.copy("mytest2.R", "mytest3.R")
play()
list.files()
remove.files("mytest2.R")
file.remove("mytest2.R")
list.files()
nxt()
file.path("mytest2.R")
?file.path
info()
file.path("mytest3.R")
file.path("folder1", "folder2")
?dir.create
dir.create("testdir2",file.path("testdir3", "testdir2"), recursive = TRUE)
dir.create(file.path("testdir2", "testdir3"), recursive = TRUE)
setwd(old.dir)
?unlink
#delete a directory and all of it's contents when recursive = TRUE
unlink("testdir", recursive = TRUE)
