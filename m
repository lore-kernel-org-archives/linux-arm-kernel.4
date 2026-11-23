Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64EF606A332
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 17:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nch5aFDY;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D+U04sFZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=CzA+ST8aLEfD/69rU1J1BqzPV3/gYwSreGIfqCeZJjM=; b=nch5aFDYNudtVy
	qvQ6LhZVCjN1hN2D5TRjXPu/dsCLdMvY4oxFslfMpIZSYEBWYy95l+vxnQ/xQ6txSaFCrVQvW1pfb
	h/7KarahtNGqf2DdyIoQxO9p/geXr2Sg5wjXhom/jC7r+KhEdj2bz2UIKLWMZNtUaJgGTkOlnkdSC
	8Flt8wk9SWUAz1DF0/CR3pfcqpkjPfgNgaXlKORGTqXIaoPBFJbUbw4d68m5vPJtow58+3YG/xlOe
	6L9BEZ8lWe+U0rJ9/LTu19tMV2cplEQo5WG6SoeAfo5Qf4le1/m5gIxrun8oFm+1n/GQRoq6tNb8B
	Nd5Scdp8TXPBABFX2AtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVXkJ-00000004LGu-0mR8;
	Mon, 23 Nov 2026 17:22:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVXkH-00000004LGN-3hQE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 17:22:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C6DEC6013A;
	Mon, 23 Nov 2026 17:22:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CD781F00A19;
	Mon, 23 Nov 2026 17:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795454544;
	bh=CzA+ST8aLEfD/69rU1J1BqzPV3/gYwSreGIfqCeZJjM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=D+U04sFZQ/o9rCpO+Qv21Kpc4I2djAiLwzXLcPvG2pwrIkJddJcJnBwwKxeWfvv6S
	 0RVjn+9p3igcaL3vim8OSO+h1L4yef/0SZPWKUaAD5+vKYA7exlr2lnqWXOZ8ez34h
	 iofoUNcpOfK0l6jdMbrXf3H0h2GLt3SGEIyvZWsgwDcZf9qQ9So28BTkmZblIMfJFQ
	 yTqwhhj/DSUsjsItuYESEQg5QR1nLJA5VNxFKXLXc1Wn3HiT39LIyYR5CIJqX7XqcH
	 nWOB4H+Ky9ZDyuI3oTdrNAysA3fBC79keXboINji0LYTnFAOYhySQ6tDcgKpePQPZW
	 1KzoWW9XUNHbQ==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Peng Fan <peng.fan@nxp.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH 05/10] remoteproc: imx_rproc: Avoid stale mailbox pointers on request failure
Date: Mon, 23 Nov 2026 17:20:49 +0000
Message-ID: <20261123172140.3547896-6-lee@kernel.org>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
In-Reply-To: <20261123172140.3547896-1-lee@kernel.org>
References: <20261123172140.3547896-1-lee@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

imx_rproc_xtr_mbox_init() stores the result of
mbox_request_channel_byname() directly into priv->tx_ch and priv->rx_ch.
Because mailbox channels are freed on stop() and detach() and
re-requested on start(), attach(), and system shutdown, a failure while
requesting "tx" leaves an ERR_PTR in priv->tx_ch, which is later
dereferenced by imx_rproc_kick() and imx_rproc_free_mbox().  If "rx"
fails after "tx" succeeds, priv->tx_ch is freed without being cleared
while priv->rx_ch retains an ERR_PTR, causing subsequent calls to see
both pointers as non-NULL and skip initialisation, leading to a
use-after-free on priv->tx_ch and an ERR_PTR dereference on priv->rx_ch.

Request both channels into local variables and assign priv->tx_ch and
priv->rx_ch only after both requests succeed.

Fixes: 99b142cf7191 ("remoteproc: imx_rproc: Request mbox channel later")
Closes: https://sashiko.dev/#/bug/linux-ac0f248a-bdfd-41da-95f8-44b8f1f7091d
Cc: stable@vger.kernel.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/remoteproc/imx_rproc.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 581bb07f5893..a77a3342e1ed 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -875,6 +875,7 @@ static void imx_rproc_rx_callback(struct mbox_client *cl, void *msg)
 static int imx_rproc_xtr_mbox_init(struct rproc *rproc, bool tx_block)
 {
 	struct imx_rproc *priv = rproc->priv;
+	struct mbox_chan *tx_ch, *rx_ch;
 	struct device *dev = priv->dev;
 	struct mbox_client *cl;
 
@@ -900,18 +901,21 @@ static int imx_rproc_xtr_mbox_init(struct rproc *rproc, bool tx_block)
 	cl->knows_txdone = false;
 	cl->rx_callback = imx_rproc_rx_callback;
 
-	priv->tx_ch = mbox_request_channel_byname(cl, "tx");
-	if (IS_ERR(priv->tx_ch))
-		return dev_err_probe(cl->dev, PTR_ERR(priv->tx_ch),
+	tx_ch = mbox_request_channel_byname(cl, "tx");
+	if (IS_ERR(tx_ch))
+		return dev_err_probe(cl->dev, PTR_ERR(tx_ch),
 				     "failed to request tx mailbox channel\n");
 
-	priv->rx_ch = mbox_request_channel_byname(cl, "rx");
-	if (IS_ERR(priv->rx_ch)) {
-		mbox_free_channel(priv->tx_ch);
-		return dev_err_probe(cl->dev, PTR_ERR(priv->rx_ch),
+	rx_ch = mbox_request_channel_byname(cl, "rx");
+	if (IS_ERR(rx_ch)) {
+		mbox_free_channel(tx_ch);
+		return dev_err_probe(cl->dev, PTR_ERR(rx_ch),
 				     "failed to request rx mailbox channel\n");
 	}
 
+	priv->tx_ch = tx_ch;
+	priv->rx_ch = rx_ch;
+
 	return 0;
 }
 
-- 
2.56.1.750.gf70dc682cf-goog


