Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6AF606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 07:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QqCDGCPL;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=JmX8pIhr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7i5qcP5sxivInnRUrN+Klf/63NaDFtusfexk9BVAIbk=; b=QqCDGCPLrHZrCo
	jXGcAsgsHNb3JcKxf59qRPtYgt3z4drFx1Nup5xFh6MRoE/SFbRD0jkJLpYAtuli7K5jXgOjWCaf8
	9N86Wa+nGLtkBwGOzMUnZUOBQpqPhJPcG8HR8A6Nse1/4rdWN0AwqS9ll+ug7pC8iaJcwuOLRt+Np
	5FqDv6bYc6TNsfm4gxf52Rj7ZWNcnbN0frI33Cf81sPV7m7z+mDDbHUIkkjUI+uienXp5fFGxb7As
	1qVjrt7EnKk7AD2ZoBV990Cvk7zwqb88uXmUi/r0Je8DIE0NjbG3RtWeoYwWw1pXP+bhc4Vsblubq
	5e2vuBys5xPurZMq+keg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTDPE-00000004kwK-1vTc;
	Tue, 17 Nov 2026 07:15:04 +0000
Received: from out-81.mta0.migadu.com ([2001:41d0:1004:224b::51] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTDP4-00000004kpE-2Yf4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 07:14:57 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=grnlVM8NPzNbFsIqKfom85HvWWMDds8Zcuvnsl0twCg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794899692; v=1; x=1795504492;
 b=JmX8pIhrwPheQ+nQ+Tes13ezhkwtqRBYWSivI5fv4q7gwA1VhkzZQSBm9uXr4TUs+GDuuf2G
 6M/dlwnqszO7QXpQqVjtB/8N/qk1XgBFwjDZRlEXNcnf/auCSPRoR+B1mApN+i651Jaz9lkmbXj
 bHI5mRziYCTFGPLqtDpJwraw=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id a95767629e953e9f;
	Tue, 17 Nov 2026 07:14:52 +0000
X-Mizu-Trace-ID: a95767629e953e9f
X-Migadu-Flow: FLOW_OUT
From: Peng Fan <peng.fan@linux.dev>
Date: Tue, 17 Nov 2026 15:14:09 +0800
Subject: [PATCH 5/8] irqchip/imx-intmux: Mark input interrupts as
 level-triggered
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-imx-intmux-v1-5-189e7e0ad98d@nxp.com>
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
X-CRM114-CacheID: sfid-20261116_231456_817236_33D8BA51 
X-CRM114-Status: UNSURE (   8.52  )
X-CRM114-Notice: Please train this message.
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

The child interrupts are handled by handle_level_irq() and xlate()
advertises IRQ_TYPE_LEVEL_HIGH, but the descriptors are not marked
IRQ_LEVEL. Apart from the inconsistency, the flag feeds IRQD_LEVEL,
which makes check_irq_resend() skip replaying level interrupts.

Set IRQ_LEVEL in the map callback.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/irqchip/irq-imx-intmux.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/irqchip/irq-imx-intmux.c b/drivers/irqchip/irq-imx-intmux.c
index 31fd895f477b..ebfff621e5a9 100644
--- a/drivers/irqchip/irq-imx-intmux.c
+++ b/drivers/irqchip/irq-imx-intmux.c
@@ -124,6 +124,7 @@ static int imx_intmux_irq_map(struct irq_domain *h, unsigned int irq,
 {
 	struct intmux_irqchip_data *data = h->host_data;
 
+	irq_set_status_flags(irq, IRQ_LEVEL);
 	irq_set_chip_data(irq, data);
 	irq_set_chip_and_handler(irq, &imx_intmux_irq_chip, handle_level_irq);
 

-- 
2.56.0


