Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3752606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 06:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AFicIqs1;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=dWvkARxy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=8mbQTvtrZIi49PDytRQi6d2CD0lZbL/3QWzafrofBmQ=; b=AFicIqs153Pjkg
	kwhc8XIUtovoCulaZKRCKaPRW1FkKBxz3jiRmb6Z2zCehNCccpZui1ERgiYaRUjPjM1nRz+IH1CRO
	fsz+uRt5Ss0B1SNNwPwwC7cfnVYCOC0XSlD6zY7V5X0hmgg/cfn+uKtR+ufWEJ1PYfiMGR2Mro0uV
	d29yVtooalb8yVnxlz7iQ2xdd3SQOYq6P0dD9JCH4dMNGpLKjg2J97F+oXDurg7DZRichEom1O1T6
	icXI0mJx/reR8g2s8RHHAJrSNmT9fQydoPkv4vovyWiu48xkXDl31bFVykZdZX0euH4e4kfBc9j+l
	cDlwXNdHIbWcZ26GtJRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVNsu-00000002OcX-2vmE;
	Mon, 23 Nov 2026 06:50:40 +0000
Received: from cmccmta6.chinamobile.com ([111.22.67.139])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVNsn-00000002Oby-3d0i
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 06:50:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=dWvkARxyR0QvDgfJqZs74eYMOK4isqDvpggE5BB4Wc6HleGrUvdqlMeq5i9ZRtxLs+s3os8n3g2j0
	 EV1m1qPrRS9cJIlpa6rY1ZDOeSbKg3ivEbwaaNRE0ouADC9XagfNgeyD1+4fA/C2LgXMqM30qxp/Dm
	 3qlJMSCSVqH+oLR0=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app01-12001 (RichMail) with SMTP id 2ee16b03e222650-16391;
	Mon, 23 Nov 2026 14:50:10 +0800 (CST)
X-RM-TRANSID: 2ee16b03e222650-16391
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from Z04181456177947 (unknown[10.55.1.71])
	by rmsmtp-syy-appsvr10-12010 (RichMail) with SMTP id 2eea6b03e21f673-8a128;
	Mon, 23 Nov 2026 14:50:10 +0800 (CST)
X-RM-TRANSID: 2eea6b03e21f673-8a128
From: zhaofeng2@cmss.chinamobile.com
To: Nishanth Menon <nm@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>
Cc: Zhao Feng <zhaofeng2@cmss.chinamobile.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] soc: ti: knav_dma: fix device node leak in of_channel_match_helper()
Date: Mon, 23 Nov 2026 14:50:06 +0800
Message-ID: <20261123065006.275-1-zhaofeng2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20261110101131.443-1-zhaofeng2@cmss.chinamobile.com>
References: <20261110101131.443-1-zhaofeng2@cmss.chinamobile.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_225035_298843_F7BB6529 
X-CRM114-Status: GOOD (  11.35  )
X-Spam-Score: -2.4 (--)
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

From: Zhao Feng <zhaofeng2@cmss.chinamobile.com>

of_channel_match_helper() takes two OF references: one via
of_parse_phandle() into dma_node (for the ->name string handed out
through *dma_instance) and one via of_parse_phandle_with_fixed_args()
into args.np (for the channel number).  Both are leaked:

- The three error paths (property match failure, fixed-args parse
  failure, missing args) drop neither dma_node nor args.np.

- The successful path leaked both prior to the initial fix.

Drop dma_node on the two error paths present in upstream, drop
args.np on the one error path where it is obtained, and on success
transfer dma_node to the caller so that knav_dma_open_channel(),
which only uses the ->name string to locate the matching DMA instance
within the function, can release the reference once the lookup is
complete.

Fixes: 88139ed03058 ("soc: ti: add Keystone Navigator DMA support")
Signed-off-by: Zhao Feng <zhaofeng2@cmss.chinamobile.com>
---
v2: also release dma_node on error paths and transfer it to
    knav_dma_open_channel() for release after last use, per review
    from Nishanth Menon.

 drivers/soc/ti/knav_dma.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

--- a/drivers/soc/ti/knav_dma.c
+++ b/drivers/soc/ti/knav_dma.c
@@ -364,7 +364,8 @@
 DEFINE_SHOW_ATTRIBUTE(knav_dma_debug);
 
 static int of_channel_match_helper(struct device_node *np, const char *name,
-					const char **dma_instance)
+					const char **dma_instance,
+					struct device_node **dma_node_out)
 {
 	struct of_phandle_args args;
 	struct device_node *dma_node;
@@ -378,15 +379,20 @@
 	index = of_property_match_string(np, "ti,navigator-dma-names", name);
 	if (index < 0) {
 		dev_err(kdev->dev, "No 'ti,navigator-dma-names' property\n");
+		of_node_put(dma_node);
 		return -ENODEV;
 	}
 
 	if (of_parse_phandle_with_fixed_args(np, "ti,navigator-dmas",
 					1, index, &args)) {
 		dev_err(kdev->dev, "Missing the phandle args name %s\n", name);
+		of_node_put(dma_node);
 		return -ENODEV;
 	}
 
+	of_node_put(args.np);
+
+	*dma_node_out = dma_node;
 	return args.args[0];
 }
 
@@ -403,6 +409,7 @@
 {
 	struct knav_dma_device *dma = NULL, *iter1;
 	struct knav_dma_chan *chan = NULL, *iter2;
+	struct device_node *dma_node;
 	int chan_num = -1;
 	const char *instance;
 
@@ -411,7 +418,7 @@
 		return NULL;
 	}
 
-	chan_num = of_channel_match_helper(dev->of_node, name, &instance);
+	chan_num = of_channel_match_helper(dev->of_node, name, &instance, &dma_node);
 	if (chan_num < 0) {
 		dev_err(kdev->dev, "No DMA instance with name %s\n", name);
 		return NULL;
@@ -425,6 +432,7 @@
 	if (config->direction != DMA_MEM_TO_DEV &&
 	    config->direction != DMA_DEV_TO_MEM) {
 		dev_err(kdev->dev, "bad direction\n");
+		of_node_put(dma_node);
 		return NULL;
 	}
 
@@ -437,6 +445,7 @@
 	}
 	if (!dma) {
 		dev_err(kdev->dev, "No DMA instance with name %s\n", instance);
+		of_node_put(dma_node);
 		return NULL;
 	}
 
@@ -457,6 +466,7 @@
 	if (!chan) {
 		dev_err(kdev->dev, "channel %d is not in DMA %s\n",
 				chan_num, instance);
+		of_node_put(dma_node);
 		return NULL;
 	}
 
@@ -464,6 +474,7 @@
 		if (!check_config(chan, config)) {
 			dev_err(kdev->dev, "channel %d config miss-match\n",
 				chan_num);
+			of_node_put(dma_node);
 			return NULL;
 		}
 	}
@@ -476,6 +487,8 @@
 
 	dev_dbg(kdev->dev, "channel %d opened from DMA %s\n",
 				chan_num, instance);
+
+	of_node_put(dma_node);
 
 	return chan;
 }



