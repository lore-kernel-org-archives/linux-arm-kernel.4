Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51BF606A335
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 07:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4rgY40Sp;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=RH5qvwVa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/uMuPe5mgi1Eu4yEWFJYCwVsaSE/AArChxvbCEr7Peg=; b=4rgY40SpHNTD1p
	TIZBbSrTsg778fCxNBBS7p6ZYfSK6yEabLx7a+TEz/hA30Ey+TVttb5JMtbsZxDTtoOoIPbtyHUia
	oWzXORqnk/Hn1mio0cRFOSXMC0NZB9wDpFzesc9E+Jva+6bq6VE/rgAZWbORRz1vp3oC2GFRViaPA
	gut0h0ygc8xH1KPr8hWBqQaQ2nd2ZFGd7pSv7C8kCDI7khFTo06lAuEaNuv2h/wJ3Wj91CgZoa0pe
	Nlp2Js9rvzDqBcHlCQb5hOjQhLjkFYkW9vAHxf410tX+a4Zkdw7iKOgbNZqlON4+qYDSSPf1BtPvs
	AW4h9sKbnMSyCZXM6dMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTDOu-00000004kkD-0Tip;
	Tue, 17 Nov 2026 07:14:44 +0000
Received: from out-72.mta1.migadu.com ([95.215.58.72] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTDOq-00000004ki6-3OFE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 07:14:42 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=IR9VcHeYSsHfv5ifLvABSgrY6uC1+UTctHpRZU8BkOk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794899678; v=1; x=1795504478;
 b=RH5qvwVa96F/+auHiHXI1EJA1N/dFmngsMV3MqYOX3sqouaIrnXCI+ZMJGzg/ULlCQhgOBFQ
 SPKQKDmOHFckjHysxuEC7o39+TnGJBNmsOV2NSEBPfVXQ/TGRWxTV8eTPwYQg/WrpgyvJegeIm1
 DHTrvH6WaYuAzT6EwLQ7J+rQ=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 0e5d159210048f24;
	Tue, 17 Nov 2026 07:14:38 +0000
X-Mizu-Trace-ID: 0e5d159210048f24
X-Migadu-Flow: FLOW_OUT
From: Peng Fan <peng.fan@linux.dev>
Date: Tue, 17 Nov 2026 15:14:07 +0800
Subject: [PATCH 3/8] irqchip/imx-intmux: Handle platform_irq_count() errors
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-imx-intmux-v1-3-189e7e0ad98d@nxp.com>
References: <20261117-imx-intmux-v1-0-189e7e0ad98d@nxp.com>
In-Reply-To: <20261117-imx-intmux-v1-0-189e7e0ad98d@nxp.com>
To: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>, 
 Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_231440_999255_7EC1C611 
X-CRM114-Status: GOOD (  13.50  )
X-Spam-Score: -2.1 (--)
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

From: Peng Fan <peng.fan@nxp.com>

platform_irq_count() returns a negative errno on failure, but the driver
only special-cased -EPROBE_DEFER. For any other negative value probe
continued with a negative channel count and passed it to
devm_kzalloc_flex(), which is broken.

Propagate every negative return value and also reject a zero channel
count, which would otherwise register a controller without any channels.

Fixes: 2fbb13961e74 ("irqchip: Add NXP INTMUX interrupt multiplexer support")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/irqchip/irq-imx-intmux.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/irqchip/irq-imx-intmux.c b/drivers/irqchip/irq-imx-intmux.c
index 644282228f1a..c7b6b475bfb9 100644
--- a/drivers/irqchip/irq-imx-intmux.c
+++ b/drivers/irqchip/irq-imx-intmux.c
@@ -207,11 +207,11 @@ static int imx_intmux_probe(struct platform_device *pdev)
 	int i, ret;
 
 	channum = platform_irq_count(pdev);
-	if (channum == -EPROBE_DEFER) {
-		return -EPROBE_DEFER;
-	} else if (channum > CHAN_MAX_NUM) {
-		dev_err(&pdev->dev, "supports up to %d multiplex channels\n",
-			CHAN_MAX_NUM);
+	if (channum < 0)
+		return channum;
+	if (!channum || channum > CHAN_MAX_NUM) {
+		dev_err(&pdev->dev, "invalid number of channels: %d\n",
+			channum);
 		return -EINVAL;
 	}
 

-- 
2.56.0


