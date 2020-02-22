* Lennart Hautzer
* 07/12/2019
* 10 100 5235
*
* Copyright (c) 2019 Lennart Hautzer
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in all
* copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
* SOFTWARE.


Required folder structure:

Root Folder
|-Makefile
|-source
    |-.c or .cpp files
|-include
    |-.h files
|-objects (will be generated and contain .o files)
|-binaries (will be generated and contain the executable file)

The default behaviour for these Makefiles is to build a .o object file in the
to-be-generated "objects" directory for every C or C++ sourcefile it finds in
the mandatory "source" directory. It will include the entire "include" directory
when linking the objects from the "objects" directory together.

Make sure to rename the appropriate file to "Makefile" in order for it to
function as expected!
