Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8DE606A335
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 14:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=g1r3fjqW;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=HMFtC04U
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=fX4x/DwPozKPTud5FkAAKQrO1M5Mc9gEHPAUZrZ+dhU=; b=g1r3fjqWff5jo8
	zgti/NQjeMVX3+COTHh/b1Srwwx6QrmtXry2pnQPS8S61QGrPHWSEgzWBluexC8VRCeJ0mF4uCfkw
	mkWzakOOkAZ8oszm1SHBc4DCa5Ch0Fr/kS9AO8Mofu9b61yl/EzIbsYLIL2G+YN1RuIJURNEsl85F
	nrjw99Xo6xn5IDmNKALerUCkvBNBhe/eVYT8WuKeEdFI+0FlEIWndtVxHOI+TXKUhhNA4iQ5syGyT
	va4rEOjDzyT596CzWpbSo0YZzSH7qsBjAj/cZON5qPUqs1YNabgxPVxWc/dgvMWtLDPqzgOq7bRmg
	djBDGawcaVRrqm00Ftyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSaxR-000000001QM-2bv4;
	Sun, 15 Nov 2026 14:11:49 +0000
Received: from out-84.mta0.migadu.com ([2001:41d0:1004:224b::54] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSaxO-000000001PJ-1VtF
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 14:11:47 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=dYZVjHUUnYJbCP3BEmxFNbYbsLJb5S56W4DO//XaLI8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794751903; v=1; x=1795356703;
 b=HMFtC04Uf+2QnwCff9CM65z7x9EnmQ/4oIK+o6iTNwJK4zdPaDuvygZ2NIP3ED2jFy8M28p5
 BpxKBDDT87szR2FwqdETrrPmtk7mUs++bEt1HCjSuzPCOwB3kb7rAlwYNk6c6xG9gIiEtbpFSfp
 v0A/J8LEdGQEUf2lzH8m1eLM=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 616e2252748b30ee;
	Sun, 15 Nov 2026 14:11:43 +0000
X-Mizu-Trace-ID: 616e2252748b30ee
X-Migadu-Flow: FLOW_OUT
From: Peng Fan <peng.fan@linux.dev>
Date: Sun, 15 Nov 2026 22:11:25 +0800
Subject: [PATCH 1/2] irqchip/imx-mu-msi: Fix MSI dispatch through the
 parent domain
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261115-imx-mu-msi-v1-1-8beb58854ca4@nxp.com>
References: <20261115-imx-mu-msi-v1-0-8beb58854ca4@nxp.com>
In-Reply-To: <20261115-imx-mu-msi-v1-0-8beb58854ca4@nxp.com>
To: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Shivamurthy Shastri <shivamurthy.shastri@linutronix.de>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_061146_587426_D0776283 
X-CRM114-Status: GOOD (  10.39  )
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

Since commit 7b2f8aa005bc ("irqchip/imx-mu-msi: Switch to MSI parent")
the driver creates the MSI parent (nexus) domain in
imx_mu_msi_domains_init(), but never stores it in msi_data->msi_domain.
The chained interrupt handler therefore calls generic_handle_domain_irq()
with a NULL domain, which resolves the hardware interrupt against
irq_default_domain instead of the MU domain. Depending on the platform
this dispatches an unrelated interrupt or drops the MSI completely.

Save the nexus domain so that the handler resolves MU channel numbers
through the domain whose reverse map was populated when the MSI was
allocated.

Fixes: 7b2f8aa005bc ("irqchip/imx-mu-msi: Switch to MSI parent")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/irqchip/irq-imx-mu-msi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/irqchip/irq-imx-mu-msi.c b/drivers/irqchip/irq-imx-mu-msi.c
index 6d7baeeb2bc8..c42ea0797624 100644
--- a/drivers/irqchip/irq-imx-mu-msi.c
+++ b/drivers/irqchip/irq-imx-mu-msi.c
@@ -238,6 +238,7 @@ static int imx_mu_msi_domains_init(struct imx_mu_msi *msi_data, struct device *d
 		return -ENOMEM;
 	}
 	parent->dev = parent->pm_dev = dev;
+	msi_data->msi_domain = parent;
 	return 0;
 }
 

-- 
2.56.0


