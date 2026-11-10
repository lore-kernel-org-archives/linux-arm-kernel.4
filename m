Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1232A606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 07:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ARIY8TBf;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=elYXt2+P
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=rx0/LH5qhAA2LG3lvtKGfFdTSz5VzXRoPpDdNhgNQgM=; b=ARIY8TBfu8aUAP
	8UOCeOhhVdBhBMyoWFAEbpyRN/dDmI5WYLYpo+P2UvoFdcoCQhdG09CiGOvOwLiEOrziUQntLtawS
	JAswxnKmTzg+S2U64SkDRlowJpQIilznGregZEyyZXHdmup7qSDVrGAdFktE/eZnlPJq3uXbZynNp
	qkPPmIIc9avHOkTKQbuPKOeq5leI9qrBedAMvvYQzt16utWzLqWLwUUpncXvn+LIz+WKX7FmH1FNg
	4v7XuNn9WS93rqRE4qI3v2PsmshZ9M5KXrkKPcC8yJgog3tG5YHYdiSMQM0ASgFDwc9ebzvg12ClG
	sd0gFMpH4WA8/bXRkDqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQfzL-00000002km4-3iwG;
	Tue, 10 Nov 2026 07:09:51 +0000
Received: from cmccmta2.chinamobile.com ([111.22.67.135])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQfzI-00000002kji-1sr2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 07:09:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=elYXt2+PVZu4mteSl0xDz+UMnjiGWcATpmBNLR1cftuzGMG0NwV/QUP/U1TP3S3OOn6tF/nFw+r8V
	 QiyYTmxlgyV15t9FEMlaYqweoDw5tWk4VklpfyGAIJI7LpzmGn05R96EhM9X8G7LJF5IrCnFCVsfbo
	 EPIK0gGR0G1R4Yhs=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app07-12007 (RichMail) with SMTP id 2ee76af2c33a2ac-ccb3f;
	Tue, 10 Nov 2026 15:09:46 +0800 (CST)
X-RM-TRANSID: 2ee76af2c33a2ac-ccb3f
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from  (unknown[10.55.1.71])
	by rmsmtp-syy-appsvr09-12009 (RichMail) with SMTP id 2ee96af2c3377a6-ab661;
	Tue, 10 Nov 2026 15:09:46 +0800 (CST)
X-RM-TRANSID: 2ee96af2c3377a6-ab661
From: zhaofeng2 <zhaofeng2@cmss.chinamobile.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Zhao Feng <zhaofeng2@cmss.chinamobile.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	linux-omap@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/2] PCI: j721e: Fix OF node reference leak in j721e_pcie_ctrl_init()
Date: Tue, 10 Nov 2026 15:09:42 +0800
Message-ID: <20261110070944.996-2-zhaofeng2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20261110070944.996-1-zhaofeng2@cmss.chinamobile.com>
References: <20261110070944.996-1-zhaofeng2@cmss.chinamobile.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_230949_120362_7112720C 
X-CRM114-Status: GOOD (  10.60  )
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

j721e_pcie_ctrl_init() resolves the "ti,syscon-pcie-ctrl" phandle
with of_parse_phandle_with_fixed_args(), which takes a reference on
the resolved device node, but the reference is never dropped.  Since
j721e_pcie_resume_noirq() re-invokes j721e_pcie_ctrl_init() on every
resume, the device node is leaked not only at probe but again on
every suspend/resume cycle.

Drop the reference with of_node_put() once the offset argument has
been consumed.

Fixes: 7aa256234c4c ("PCI: j721e: Get offset within "syscon" from "ti,syscon-pcie-ctrl" phandle arg")
Signed-off-by: Zhao Feng <zhaofeng2@cmss.chinamobile.com>
---
 drivers/pci/controller/cadence/pci-j721e.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/cadence/pci-j721e.c b/drivers/pci/controller/cadence/pci-j721e.c
--- a/drivers/pci/controller/cadence/pci-j721e.c
+++ b/drivers/pci/controller/cadence/pci-j721e.c
@@ -274,8 +274,10 @@
 	/* Do not error out to maintain old DT compatibility */
 	ret = of_parse_phandle_with_fixed_args(node, "ti,syscon-pcie-ctrl", 1,
 					       0, &args);
-	if (!ret)
+	if (!ret) {
 		offset = args.args[0];
+		of_node_put(args.np);
+	}
 
 	/*
 	 * The PCIe Controller's registers have different "reset-values"



