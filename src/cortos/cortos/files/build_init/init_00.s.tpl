<%
# We are using bottle's simple templating system to generate files.
# Please refer to the following sources for the documentation:
#
# * <https://bottlepy.org/docs/dev/tutorial.html#tutorial-templates>
# * <https://bottlepy.org/docs/dev/stpl.html>
#
%>

% include("init_header.s")

% include("init_allocate.s")

% include("init_threads_setup.s")

% include("init_threads_run.s")

% include("init_footer.s")
