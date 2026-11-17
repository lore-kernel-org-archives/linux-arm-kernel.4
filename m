Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5140F606A337
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 07:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IpHITLMg;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=fzWKQmAo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vIeF9vrR2DgyA1S6iCBievDYCjb9lO6NZyShcWqBnb8=; b=IpHITLMgT3KhEd
	Oe05qT9QgoXPf3DVZhmcELQD4LkWFAgB3yimV8dr6q/XABcaiLw3E4wRzHOz5AEP8HYHmWOr7wdzE
	rQFUCBPSyDdEEQEaaKuRLJTZh8Xr7yXJ6Ct8qzoVHHmmIp7F5O9koqBmmebY4Chyb0mJzus2bpybR
	m143w8XOvUBJHrP3UZo2EPI+jaoldGMg6K/FH0J8rKReAKaUjLOaeYufhPEvvDUMFgj1/vf+fmElE
	ula+1WqQJsPdAclNziKxwahZd/cUJsoQA8xu1aolnf37sotG1m12oO04y2HK+pPL1RqXBD0wOKJbA
	BHWysMHFLQ2oZ8VnMYkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTDP7-00000004kr8-1Toj;
	Tue, 17 Nov 2026 07:14:57 +0000
Received: from out-82.mta1.migadu.com ([95.215.58.82] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTDOz-00000004kmf-1Ofp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 07:14:54 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=H8cqCHYI9Gmfe1/SCs9KFv5NYlTFBza+OEuLdfK12EQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794899687; v=1; x=1795504487;
 b=fzWKQmAoJFh/AMJTMqk0ygTTQTLXH8EXUYcD+jdX8vDL3VeOpjlvbxWTRXjK9wsv0NnmhMR2
 qwls7A00L1wirVr1Iw9AkXud60Wrk67payq7oQdjE39jPzq3jCnMcdmEnseiJnItPKaIiTdA1fn
 CbpPG+0LHheLSgbGChxozfSg=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 99571a1b9b522972;
	Tue, 17 Nov 2026 07:14:47 +0000
X-Mizu-Trace-ID: 99571a1b9b522972
X-Migadu-Flow: FLOW_OUT
From: Peng Fan <peng.fan@linux.dev>
Date: Tue, 17 Nov 2026 15:14:08 +0800
Subject: [PATCH 4/8] irqchip/imx-intmux: Don't WARN on malformed interrupt
 specifiers
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-imx-intmux-v1-4-189e7e0ad98d@nxp.com>
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
X-CRM114-CacheID: sfid-20261116_231449_701131_BF7D44B9 
X-CRM114-Status: GOOD (  12.20  )
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

The xlate callback validates the interrupt specifier cells, but uses
WARN_ON() for checks that can be triggered by user-supplied device tree
data. A malformed specifier is an expected, recoverable error, so the
WARN only floods the log.

Return -EINVAL without the splat.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/irqchip/irq-imx-intmux.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-imx-intmux.c b/drivers/irqchip/irq-imx-intmux.c
index c7b6b475bfb9..31fd895f477b 100644
--- a/drivers/irqchip/irq-imx-intmux.c
+++ b/drivers/irqchip/irq-imx-intmux.c
@@ -144,10 +144,10 @@ static int imx_intmux_irq_xlate(struct irq_domain *d, struct device_node *node,
 	 * the 1st cell: hw interrupt number
 	 * the 2nd cell: channel index
 	 */
-	if (WARN_ON(intsize != 2))
+	if (intsize != 2)
 		return -EINVAL;
 
-	if (WARN_ON(intspec[1] >= data->channum))
+	if (intspec[1] >= data->channum)
 		return -EINVAL;
 
 	*out_hwirq = intspec[0];

-- 
2.56.0


