package com.cupid.wrappers;

import com.cupid.dataObjects.ResultMSG;

import java.util.List;

/**
 * Created by victorzhao on 11/4/16.
 */
public class ResultMSGWrapper {
    private List<ResultMSG> msgs;

    public ResultMSGWrapper() {
    }
    public ResultMSGWrapper (List<ResultMSG> msgs) {
        this.msgs = msgs;
    }

    public List<ResultMSG> getMsgs() {
        return msgs;
    }

    public void setMsgs(List<ResultMSG> msgs) {
        this.msgs = msgs;
    }
}
