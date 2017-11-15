# First install the library
install.packages(tm.plugin.webmining)

# Then load the library
library(tm.plugin.webmining)

# While loading, the library might throw an error. If it does, you most likely have to
# update your verion of java on your computer/or install the 64bits version of java in case you have 
# the 32bits versions. You can install the 64bits version on top of the 32 bits version. This
# assumes of course that you have a 64bits OS.
# For reference, I used this link: 
# https://stackoverflow.com/questions/17376939/problems-when-trying-to-load-a-package-in-r-due-to-rjava
# when I ran into my issue while installing the package. The accepted answer worked for me after I installed the 
# 64bits version of java.


# After that read in the sample data and I extracted one post into the variable c. Specifically the body of postid:31133870
# Then use the library on the post like this:
c <- extractHTMLStrip(c)

# The result in the variable c still kept things like "\n" in the post.
# So I used the following gsub funtion to get rid of all "\n" characters in the post:
c <- gsub('\\n', ' ', c)

# The result are acceptable enough to do some text mining on the data.
