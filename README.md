To use this Makefile, open it in a text editor and specify the source, header, 
object and binaries folders at the top of the file.
If you wish to use the formatter alongside the makefile, grab it from this link: 

https://github.com/lennarthautzer/toolSourceFileFormatter

If you don't wish to use the formatter, simply remove the "format" instruction 
from the "all" rule in the makefile. 

Regardless of formatting, the makefile will treat the header directory as an include
directory for linking; it will load dynamically all the .cpp files in the source 
directory and build objects for each in the objects directory. Finally the "target"
specified will be built in the binaries directory. 
