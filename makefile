# simple makefile for the fg3d

#definitions to make rules simpler and easy to update
UNICON=unicon
UC=$(UNICON)
UFLAGS=-c
RM= rm -f
MAKE=make

# What do I want to call my application
PKGNAME=fg3d

# The list of source files and their corresponding .u files
SRC=uw.icn voxw.icn s.icn w.icn
UFILES=uw.u voxw.u s.u w.u 

# Rules, only the first two are really needed to build the application

# rule1: how to build the target application
#building fg3d depends on having all .u files first then putting them together
$(PKGNAME): $(UFILES)
	 $(UC) -o $(PKGNAME)  $(UFILES)

# rule2: creating a .u files is a result compiling a .icn file using unicon
# you can create a sepearte explicit rule for every file, but makefiles
# allows you to define a generic catch all rule which I'm using here
%.u:	%.icn
	 $(UC) $(UFLAGS) $<

#rule3: how to compress/zip all files 
zip:
	 zip $(PKGNAME).zip makefile *.icn *.png *.gif *.txt *.x README.md

#rule4: what files need to be deleted to go back to a "clean" state
clean:
	$(RM) *.u  $(PKGNAME) uniclass.dir uniclass.pag *~


