% for prog in confObj.programs:
asr29={{prog.thread.getIdHex()}} core {{prog.thread.cid}} thread {{prog.thread.tid}}
asr16=0x0        core {{prog.thread.cid}} thread {{prog.thread.tid}}
% end
