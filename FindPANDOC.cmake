# Find pandoc -- this module looks for pandoc
#
# PANDOC_EXECUTABLE - the full path to pandoc
# PANDOC_FOUND - If false, don't attempt to use PANDOC.

FIND_PROGRAM(PANDOC_EXECUTABLE pandoc)
MARK_AS_ADVANCED(PANDOC_EXECUTABLE)

IF (NOT PANDOC_EXECUTABLE)
SET(PANDOC_FOUND "NO")
ELSE (NOT PANDOC_EXECUTABLE)
SET(PANDOC_FOUND "YES")
ENDIF (NOT PANDOC_EXECUTABLE)

IF (NOT PANDOC_FOUND AND PANDOC_FIND_REQUIRED)
MESSAGE(FATAL_ERROR "Could not find PANDOC")
ENDIF (NOT PANDOC_FOUND AND PANDOC_FIND_REQUIRED)
