Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C1D606A339
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 17:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AVh3gBIo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=fw6HIaLUqYOLkgYhQl2HDTow8Vcw/13Jd4x/Iu29Xgw=; b=AVh3gBIoWbkMgX
	vrpPPIJWb0J8kZPdkXpXwDHAS1UF1bWgpZmZpyMiwCFYKhPzWJZOvzhYkTP23ZLGOxEhRPXlvKyqc
	c6HGoAp+BCIO/7zRUabWihjMKLgC/rt8wB4jKfK/VPI5Y06h63RtEFiYvyqNj+B2ap1xnT2ZnizHA
	GWB8jkoraMDfZ69eoP88oULQ9ctskk1ofLa0ibLwa/OWYZmk2ZMK/BhN4ho3nHo8bn98T0H6Ix+wH
	sXVFt+8Q1iQdv5pDk/RMlWc+T/Vbb5Ee0mkFm6abW8VxAiATRPmSj+aPJDu40YVXuUJKHdiubajKQ
	QZealQ08g08z2ZseKH6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUSLm-0000000Fg71-0aSU;
	Fri, 20 Nov 2026 17:24:42 +0000
Received: from mx.gpxsee.org ([37.205.14.76])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUSLX-0000000Fg3U-30rd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 17:24:25 +0000
Received: from localhost (unknown [62.77.71.229])
	by mx.gpxsee.org (Postfix) with ESMTPSA id D55BFC04E2;
	Fri, 20 Nov 2026 18:24:21 +0100 (CET)
From: tumic@gpxsee.org
To: Lizhi Hou <lizhi.hou@amd.com>,
	Brian Xu <brian.xu@amd.com>,
	Raj Kumar Rampelli <raj.kumar.rampelli@amd.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Michal Simek <michal.simek@amd.com>
Cc: dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	=?UTF-8?q?Martin=20T=C5=AFma?= <martin.tuma@digiteqautomotive.com>
Subject: [PATCH v3 1/1] dmaengine: xilinx: xdma: Fix broken PM suspend/resume
Date: Fri, 20 Nov 2026 18:23:56 +0100
Message-ID: <20261120172356.5858-2-tumic@gpxsee.org>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120172356.5858-1-tumic@gpxsee.org>
References: <20261120172356.5858-1-tumic@gpxsee.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_092423_969697_420B7F09 
X-CRM114-Status: GOOD (  18.87  )
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

Signed-off-by: Martin Tůma <martin.tuma@digiteqautomotive.com>
---
 drivers/dma/xilinx/xdma.c | 147 ++++++++++++++++++++++++++++++++------
 1 file changed, 124 insertions(+), 23 deletions(-)

diff --git a/drivers/dma/xilinx/xdma.c b/drivers/dma/xilinx/xdma.c
index 9d827c9a1267..d6772b38d8f7 100644
--- a/drivers/dma/xilinx/xdma.c
+++ b/drivers/dma/xilinx/xdma.c
@@ -123,6 +123,7 @@ struct xdma_desc {
  * @irq_start: Start IRQ assigned to device
  * @irq_num: Number of IRQ assigned to device
  * @status: Initialization status
+ * @usr_irq_mask: User IRQ mask for PM suspend/resume
  */
 struct xdma_device {
 	struct platform_device	*pdev;
@@ -135,6 +136,7 @@ struct xdma_device {
 	u32			irq_start;
 	u32			irq_num;
 	u32			status;
+	u32			usr_irq_mask;
 };
 
 #define xdma_err(xdev, fmt, args...)					\
@@ -398,6 +400,27 @@ static int xdma_xfer_stop(struct xdma_chan *xchan)
 			    CHAN_CTRL_RUN_STOP);
 }
 
+/**
+ * xdma_reconfig_channels - Reconfigure DMA channels
+ * @xdev: DMA device pointer
+ * @chans: channels configuration
+ * @chan_num: number of channels
+ */
+static int xdma_reconfig_channels(struct xdma_chan *chans,
+				  u32 chan_num)
+{
+	int i, ret;
+
+	for (i = 0; i < chan_num; i++) {
+		/* init channel hardware */
+		ret = xdma_channel_init(&(chans[i]));
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 /**
  * xdma_alloc_channels - Detect and allocate DMA channels
  * @xdev: DMA device pointer
@@ -1018,6 +1041,55 @@ static int xdma_set_vector_reg(struct xdma_device *xdev, u32 vec_tbl_start,
 	return 0;
 }
 
+/**
+ * xdma_irq_config - Configure IRQs
+ * @xdev: DMA device pointer
+ */
+static int xdma_irq_config(struct xdma_device *xdev)
+{
+	u32 user_irq_start;
+	int ret;
+
+	/* configure hardware IRQ registers */
+	ret = xdma_set_vector_reg(xdev, XDMA_IRQ_CHAN_VEC_NUM, 0,
+				  XDMA_CHAN_NUM(xdev));
+	if (ret) {
+		xdma_err(xdev, "failed to set channel vectors: %d", ret);
+		return ret;
+	}
+
+	/* configure user IRQ registers if needed */
+	user_irq_start = XDMA_CHAN_NUM(xdev);
+	if (xdev->irq_num > user_irq_start) {
+		ret = xdma_set_vector_reg(xdev, XDMA_IRQ_USER_VEC_NUM,
+					  user_irq_start,
+					  xdev->irq_num - user_irq_start);
+		if (ret) {
+			xdma_err(xdev, "failed to set user vectors: %d", ret);
+			return ret;
+		}
+	}
+
+	/* enable channels interrupts */
+	ret = regmap_write(xdev->rmap, XDMA_IRQ_CHAN_INT_EN_W1S, ~0);
+	if (ret) {
+		xdma_err(xdev, "failed to enable channel IRQs: %d", ret);
+		return ret;
+	}
+
+	/* enable user interrupts if needed */
+	if (xdev->irq_num > user_irq_start) {
+		ret = regmap_write(xdev->rmap, XDMA_IRQ_USER_INT_EN_W1S,
+				   xdev->usr_irq_mask);
+		if (ret) {
+			xdma_err(xdev, "failed to enable user IRQs: %d", ret);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
 /**
  * xdma_irq_init - initialize IRQs
  * @xdev: DMA device pointer
@@ -1025,7 +1097,6 @@ static int xdma_set_vector_reg(struct xdma_device *xdev, u32 vec_tbl_start,
 static int xdma_irq_init(struct xdma_device *xdev)
 {
 	u32 irq = xdev->irq_start;
-	u32 user_irq_start;
 	int i, j, ret;
 
 	/* return failure if there are not enough IRQs */
@@ -1060,28 +1131,8 @@ static int xdma_irq_init(struct xdma_device *xdev)
 		irq++;
 	}
 
-	/* config hardware IRQ registers */
-	ret = xdma_set_vector_reg(xdev, XDMA_IRQ_CHAN_VEC_NUM, 0,
-				  XDMA_CHAN_NUM(xdev));
-	if (ret) {
-		xdma_err(xdev, "failed to set channel vectors: %d", ret);
-		goto failed_init_c2h;
-	}
-
-	/* config user IRQ registers if needed */
-	user_irq_start = XDMA_CHAN_NUM(xdev);
-	if (xdev->irq_num > user_irq_start) {
-		ret = xdma_set_vector_reg(xdev, XDMA_IRQ_USER_VEC_NUM,
-					  user_irq_start,
-					  xdev->irq_num - user_irq_start);
-		if (ret) {
-			xdma_err(xdev, "failed to set user vectors: %d", ret);
-			goto failed_init_c2h;
-		}
-	}
-
-	/* enable interrupt */
-	ret = regmap_write(xdev->rmap, XDMA_IRQ_CHAN_INT_EN_W1S, ~0);
+	/* configure all HW IRQ registers */
+	ret = xdma_irq_config(xdev);
 	if (ret)
 		goto failed_init_c2h;
 
@@ -1297,15 +1348,65 @@ static int xdma_probe(struct platform_device *pdev)
 	return ret;
 }
 
+/**
+ * xdma_suspend - PM suspend callback
+ * @dev: XDMA device pointer
+ */
+static int xdma_suspend(struct device *dev)
+{
+	struct xdma_device *xdev = dev_get_drvdata(dev);
+	int ret;
+
+	ret = regmap_read(xdev->rmap, XDMA_IRQ_USER_INT_EN,
+			  &xdev->usr_irq_mask);
+	if (ret) {
+		xdma_err(xdev, "User IRQ vector backup failed: %d", ret);
+		return ret;
+	}
+
+	ret = regmap_write(xdev->rmap, XDMA_IRQ_CHAN_INT_EN_W1C, ~0);
+	if (ret)
+		xdma_err(xdev, "DMA channels IRQ disable failed: %d", ret);
+
+	return ret;
+}
+
+/**
+ * xdma_resume - PM resume callback
+ * @dev: XDMA device pointer
+ */
+static int xdma_resume(struct device *dev)
+{
+	struct xdma_device *xdev = dev_get_drvdata(dev);
+	int ret;
+
+	ret = xdma_reconfig_channels(xdev->h2c_chans, xdev->h2c_chan_num);
+	if (ret) {
+		xdma_err(xdev, "H2C channels reconfiguration failed: %d", ret);
+		return ret;
+	}
+
+	ret = xdma_reconfig_channels(xdev->c2h_chans, xdev->c2h_chan_num);
+	if (ret) {
+		xdma_err(xdev, "C2H channels reconfiguration failed: %d", ret);
+		return ret;
+	}
+
+	return xdma_irq_config(xdev);
+}
+
 static const struct platform_device_id xdma_id_table[] = {
 	{ "xdma", 0},
 	{ },
 };
 MODULE_DEVICE_TABLE(platform, xdma_id_table);
 
+static DEFINE_NOIRQ_DEV_PM_OPS(xdma_dev_pm_ops, xdma_suspend, xdma_resume);
+
 static struct platform_driver xdma_driver = {
 	.driver		= {
 		.name = "xdma",
+		.pm = pm_sleep_ptr(&xdma_dev_pm_ops),
 	},
 	.id_table	= xdma_id_table,
 	.probe		= xdma_probe,
-- 
2.56.1


