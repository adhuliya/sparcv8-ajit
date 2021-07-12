<%
# We are using bottle's simple templating system to generate files.
# Please refer to the following sources for the documentation:
#
# * <https://bottlepy.org/docs/dev/tutorial.html#tutorial-templates>
# * <https://bottlepy.org/docs/dev/stpl.html>
#
%>

% include("build_init/parts/init_header.s")

<%
include(
  "build_init/parts/init_allocate.s",
  reservedSize=allocRegion.ajitReserved.sizeInBytes,
  lockArraySize=allocRegion.ajitLockVars.sizeInBytes,
  qHeaderArraySize=allocRegion.ajitQueueHeaders.sizeInBytes,
  qArraySize=allocRegion.ajitQueues.sizeInBytes,
)
%>

<%
include(
  "build_init/parts/init_threads_setup.s",
  threadStartLabels=threadStartLabels,
)
%>

% include("build_init/parts/init_threads_start.s")

% include("build_init/parts/init_footer.s")

