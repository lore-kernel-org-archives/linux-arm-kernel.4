Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 595FD606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 13:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PVpr/aSP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=GILqxYb8p5yo19CosH6Owa5dDUz944tPztYWV+5Ez50=; b=PVpr/aSP2s61RKvNAVU6mIbvII
	VMI7Yyf+SVwXPgGIYsXqhx2Lz2Cr67bjoOpNgQ0DfvTL6PMwQa2jT5P44GqsRIOroDRszHyTH59a5
	88mMxaFwSYnfz99ViiGnN9t82JhVd83V2Op53opMQE3WsGehg3/IRPerhGto1Ph10WcgawTmiouo7
	RL7Ybs1+ZCyosH/AGgeaWqjyrppIAL4fYK9MCucjQo5offoj1T0vVSTJycZgQxBExFuOqDZp1nMy0
	K6tlp3vfDlaiF2n71guRvWnrIbAMfRGoMZuX+vElOThtRmZMQ0TkECXhjmn/VDQyWgDGszhPa9X1o
	D0Qfdc3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOIN-0000000F2ra-1P88;
	Fri, 20 Nov 2026 13:04:51 +0000
Received: from mx.gpxsee.org ([37.205.14.76])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOIL-0000000F2r1-0wAR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 13:04:50 +0000
Received: from localhost (unknown [62.77.71.229])
	by mx.gpxsee.org (Postfix) with ESMTPSA id ABD95BD05F;
	Fri, 20 Nov 2026 14:04:46 +0100 (CET)
From: tumic@gpxsee.org
To: Michal Simek <michal.simek@amd.com>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: =?UTF-8?q?Martin=20T=C5=AFma?= <martin.tuma@digiteqautomotive.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org
Subject: [PATCH] i2c: xiic: Fix broken PM suspend/resume
Date: Fri, 20 Nov 2026 14:04:14 +0100
Message-ID: <20261120130415.9262-1-tumic@gpxsee.org>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_050449_420032_EC38477A 
X-CRM114-Status: GOOD (  12.42  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Martin Tůma <martin.tuma@digiteqautomotive.com>

Add the missing PM suspend/resume callbacks that properly reconfigure
the XDMA HW on PCIe suspend/resume.

This is required in cases where the HW is on a PCIe card connected using
one of the Xilinx PCIe cores (e.g. XDMA) like in the case of the Digiteq
Automotive FG4 grabber card (mgb4 module).

Signed-off-by: Martin Tůma <martin.tuma@digiteqautomotive.com>
---
 drivers/i2c/busses/i2c-xiic.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index ab7916745ad3..fc122ceb5631 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -252,6 +252,8 @@ static const struct timing_regs timing_reg_values[] = {
 
 static int xiic_start_xfer(struct xiic_i2c *i2c, struct i2c_msg *msgs, int num);
 static void __xiic_start_xfer(struct xiic_i2c *i2c);
+static int xiic_reinit(struct xiic_i2c *i2c);
+static void xiic_deinit(struct xiic_i2c *i2c);
 
 static int xiic_i2c_runtime_suspend(struct device *dev)
 {
@@ -276,6 +278,27 @@ static int xiic_i2c_runtime_resume(struct device *dev)
 	return 0;
 }
 
+static int xiic_i2c_suspend(struct device *dev)
+{
+	struct xiic_i2c *i2c = dev_get_drvdata(dev);
+
+	xiic_deinit(i2c);
+
+	return 0;
+}
+
+static int xiic_i2c_resume(struct device *dev)
+{
+	struct xiic_i2c *i2c = dev_get_drvdata(dev);
+	int ret;
+
+	ret = xiic_reinit(i2c);
+	if (ret)
+		dev_err(dev, "Reinitialization failed.\n");
+
+	return ret;
+}
+
 /*
  * For the register read and write functions, a little-endian and big-endian
  * version are necessary. Endianness is detected during the probe function.
@@ -1610,6 +1633,8 @@ static void xiic_i2c_remove(struct platform_device *pdev)
 }
 
 static const struct dev_pm_ops xiic_dev_pm_ops = {
+	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(xiic_i2c_suspend,
+				      xiic_i2c_resume)
 	SET_RUNTIME_PM_OPS(xiic_i2c_runtime_suspend,
 			   xiic_i2c_runtime_resume, NULL)
 };

base-commit: 65e4fd942f72a9dba0e4e257290c4fa1aa756854
-- 
2.56.1


