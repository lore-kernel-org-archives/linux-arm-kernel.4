Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB44606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 07:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qwN8KLZy;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=NFfvQe2s
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=U2+SodBIaHMuWdorFSAdkZgaGLGBkZxWWlyQ/kLwRFc=; b=qwN8KLZydc278P
	IcPVh9HSNX9UG/F5XpRGiHaNjZ5TPiL2InPvsSscgus0uSKORsj0tNf/9fzOORhYTrso4r9swm2T6
	DOBwqxQugTwS6DYSzzDVzE8MpdGAaKQuXAl8/sJJRykUsczrwZLUVgjOpGQhowry4xdZoFkuWRDOo
	5i4kaG+LWMd1VBjW9iHjTcy/Lw1HrFUs8SJRG7eMxicaYe+Mqk/PQgcAxmxS4yUgwWLYc1l8x+K8R
	V7s+8P8Sw+H6jWoiu6WKL9iGQxJ6GV13afdT1fb68ieWig1TTwSnezg9+EsAlFLtggmxuekupyv/K
	kxmk745puhbpLX5Nh6+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQfxo-00000002kDH-2Lwm;
	Tue, 10 Nov 2026 07:08:16 +0000
Received: from cmccmta6.chinamobile.com ([111.22.67.139])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQfxk-00000002kAp-0Ce1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 07:08:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=NFfvQe2sOhMcO+ZvSyyGf3r0YdZqbWhOyQtsn04cLnvDGQWpvQulU+7GlVSK4nppi6de5j8dPuSL3
	 L1wM1G3SfXkJi2sDB9o6FMcUgSmuk7hTT9vnPV3OiSMiQRb4tHOyq03wHm9Kz56S0U7TuG3mv0p9Gf
	 ynkrYb3IZjp+8Y1E=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app01-12001 (RichMail) with SMTP id 2ee16af2c2d768c-a7a80;
	Tue, 10 Nov 2026 15:08:08 +0800 (CST)
X-RM-TRANSID: 2ee16af2c2d768c-a7a80
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from  (unknown[10.55.1.71])
	by rmsmtp-syy-appsvr01-12001 (RichMail) with SMTP id 2ee16af2c2d35b4-ab42e;
	Tue, 10 Nov 2026 15:08:08 +0800 (CST)
X-RM-TRANSID: 2ee16af2c2d35b4-ab42e
From: zhaofeng2 <zhaofeng2@cmss.chinamobile.com>
To: netdev@vger.kernel.org
Cc: Zhao Feng <zhaofeng2@cmss.chinamobile.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Linus Walleij <linusw@kernel.org>,
	Imre Kaloz <kaloz@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH net-next 2/2] net: ixp4xx_hss: fix OF node leaks in ixp4xx_hss_probe()
Date: Tue, 10 Nov 2026 15:08:02 +0800
Message-ID: <20261110070803.1099-3-zhaofeng2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20261110070803.1099-1-zhaofeng2@cmss.chinamobile.com>
References: <20261110070803.1099-1-zhaofeng2@cmss.chinamobile.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_230812_704236_D59BB9C2 
X-CRM114-Status: UNSURE (   8.01  )
X-CRM114-Notice: Please train this message.
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

ixp4xx_hss_probe() resolves the NPE and the six TX/RX queue phandles
with of_parse_phandle_with_fixed_args(), which takes a reference on
the resolved device node, but the references are never dropped, so
the NPE and queue manager device nodes are leaked on every probe.

Drop the references with of_node_put() once the phandle argument has
been consumed.

Fixes: 35aefaad326b ("net: ixp4xx_hss: Convert to use DT probing")
Signed-off-by: Zhao Feng <zhaofeng2@cmss.chinamobile.com>
---
 drivers/net/wan/ixp4xx_hss.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/wan/ixp4xx_hss.c b/drivers/net/wan/ixp4xx_hss.c
--- a/drivers/net/wan/ixp4xx_hss.c
+++ b/drivers/net/wan/ixp4xx_hss.c
@@ -1426,6 +1426,7 @@
 		return dev_err_probe(dev, err, "no NPE engine specified\n");
 	/* NPE ID 0x00, 0x10, 0x20... */
 	port->npe = npe_request(npe_spec.args[0] << 4);
+	of_node_put(npe_spec.np);
 	if (!port->npe) {
 		dev_err(dev, "unable to obtain NPE instance\n");
 		return -ENODEV;
@@ -1437,36 +1438,42 @@
 	if (err)
 		return dev_err_probe(dev, err, "no txready queue phandle\n");
 	port->txreadyq = queue_spec.args[0];
+	of_node_put(queue_spec.np);
 	/* Get the RX trig queue as resource from queue manager */
 	err = of_parse_phandle_with_fixed_args(np, "intek,queue-chl-rxtrig", 1, 0,
 					       &queue_spec);
 	if (err)
 		return dev_err_probe(dev, err, "no rxtrig queue phandle\n");
 	port->rxtrigq = queue_spec.args[0];
+	of_node_put(queue_spec.np);
 	/* Get the RX queue as resource from queue manager */
 	err = of_parse_phandle_with_fixed_args(np, "intek,queue-pkt-rx", 1, 0,
 					       &queue_spec);
 	if (err)
 		return dev_err_probe(dev, err, "no RX queue phandle\n");
 	port->rxq = queue_spec.args[0];
+	of_node_put(queue_spec.np);
 	/* Get the TX queue as resource from queue manager */
 	err = of_parse_phandle_with_fixed_args(np, "intek,queue-pkt-tx", 1, 0,
 					       &queue_spec);
 	if (err)
 		return dev_err_probe(dev, err, "no RX queue phandle\n");
 	port->txq = queue_spec.args[0];
+	of_node_put(queue_spec.np);
 	/* Get the RX free queue as resource from queue manager */
 	err = of_parse_phandle_with_fixed_args(np, "intek,queue-pkt-rxfree", 1, 0,
 					       &queue_spec);
 	if (err)
 		return dev_err_probe(dev, err, "no RX free queue phandle\n");
 	port->rxfreeq = queue_spec.args[0];
+	of_node_put(queue_spec.np);
 	/* Get the TX done queue as resource from queue manager */
 	err = of_parse_phandle_with_fixed_args(np, "intek,queue-pkt-txdone", 1, 0,
 					       &queue_spec);
 	if (err)
 		return dev_err_probe(dev, err, "no TX done queue phandle\n");
 	port->txdoneq = queue_spec.args[0];
+	of_node_put(queue_spec.np);
 
 	/* Obtain all the line control GPIOs */
 	port->cts = devm_gpiod_get(dev, "cts", GPIOD_OUT_LOW);



