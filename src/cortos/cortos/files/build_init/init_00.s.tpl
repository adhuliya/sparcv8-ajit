<%
# We are using bottle's simple templating system to generate files.
# Please refer to the following sources for the documentation:
#
# * <https://bottlepy.org/docs/dev/tutorial.html#tutorial-templates>
# * <https://bottlepy.org/docs/dev/stpl.html>
#
%>

% include("init_header.s")

<%
include(
  "init_allocate.s",
  reservedSize=allocRegion.ajitReserved.sizeInBytes,
  syncArraySize=allocRegion.ajitSyncVars.sizeInBytes,
  qHeaderArraySize=allocRegion.ajitQueueHeaders.sizeInBytes,
  qArraySize=allocRegion.ajitQueues.sizeInBytes,
)
%>

<%
include(
  "init_threads_run.s",
  threadStartLabels=threadStartLabels,
)
%>

% include("init_threads_setup.s")

% include("init_footer.s")
