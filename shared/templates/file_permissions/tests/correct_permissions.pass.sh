#!/bin/bash
#

{{% for path in FILEPATH %}}
{{% if IS_DIRECTORY and FILE_REGEX %}}
echo "Create specific tests for this rule because of regex"
{{% elif IS_DIRECTORY and RECURSIVE %}}
find -L {{{ path }}} -type d -exec chmod {{{ FILEMODE }}} {} \;
{{% else %}}
if [ ! -f {{{ path }}} ]; then
    touch {{{ path }}}
fi
chmod {{{ FILEMODE }}} {{{ path }}}
{{% endif %}}
{{% endfor %}}
