execute_process(COMMAND "${GIT}" describe RESULT_VARIABLE RET OUTPUT_VARIABLE DESCRIPTION OUTPUT_STRIP_TRAILING_WHITESPACE)
if(RET)
    message(WARNING "Cannot determine current revision. Make sure that you are building either from a Git working tree or from a source archive.")
    set(VERSION "${COMMIT}")
    configure_file("src/version.h.in" "${TO}")
else()
    string(REGEX MATCH "([0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f])?(-dirty)? $" COMMIT "${DESCRIPTION} ")
    string(STRIP "${COMMIT}" COMMIT)
    set(VERSION "${COMMIT}")
    configure_file("src/version.h.in" "${TO}")
endif()
