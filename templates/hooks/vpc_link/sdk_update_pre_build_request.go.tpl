    if latest.ko.Status.VPCLinkStatus != nil && *latest.ko.Status.VPCLinkStatus != string(svcsdktypes.VpcLinkStatusAvailable) {
        return nil, waitForAvailableRequeue
    }