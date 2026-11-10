Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B17606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 07:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=f4LHxAxP;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=HA9dhkoB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vNcdGNMR9h25+07+FbJJL+KnzsQKob8YFMXFVv6Av4k=; b=f4LHxAxPVYe8wj
	ZsVUiR8RgPuTb+zq5WCDTI+LDlaPlF/G1khdlk5rpwJR5l/prhCTcdSykU6wsEJ7D0fQHlexswpGe
	m2P0Reo8K2z9MVFjyxx68H4F52y709pTeL4pnlvZAkkh66pw8c3LizSSx0mBHgLPve4K8ftHKuONv
	Ij4UUtF81cSwVcIpxcQ8HoLPhpaq/sVArkvfCmtthOtzSMZAZApbiaUCWi5Y+mtrtXAVg1ZuJaVaA
	Jxei/sY78XY4ozBytgG0TSgZNQNdDKTVKxwNOyp5syLmQYQxxYoBwmKmXSZ3U3ZkrQQS2s3xCek+t
	+mxjsRt/knmvQfSgwtrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQfzS-00000002kpH-0XAs;
	Tue, 10 Nov 2026 07:09:58 +0000
Received: from cmccmta4.chinamobile.com ([111.22.67.137])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQfzJ-00000002kk0-17Pu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 07:09:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=HA9dhkoBJKbS0iKzQznDKoSyLDHDueiXA7XxNyxzWR8esJtud3hzxOUMrIWES27eudWtDcDIm3vYS
	 JP0/v44LmCajab5PrVWF7MvQ9IlVGN9DK5wY3eR3Jg90A1ZD8ECV4Cwmv3MEqo6dsR4bF68RroTPEV
	 9C0WfYNfNu2orUqo=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app08-12008 (RichMail) with SMTP id 2ee86af2c33ad05-6bdfc;
	Tue, 10 Nov 2026 15:09:47 +0800 (CST)
X-RM-TRANSID: 2ee86af2c33ad05-6bdfc
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from  (unknown[10.55.1.71])
	by rmsmtp-syy-appsvr09-12009 (RichMail) with SMTP id 2ee96af2c3377a6-ab663;
	Tue, 10 Nov 2026 15:09:47 +0800 (CST)
X-RM-TRANSID: 2ee96af2c3377a6-ab663
From: zhaofeng2 <zhaofeng2@cmss.chinamobile.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Zhao Feng <zhaofeng2@cmss.chinamobile.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	linux-omap@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/2] PCI: j721e: Fix OF node reference leak in j721e_enable_acspcie_refclk()
Date: Tue, 10 Nov 2026 15:09:43 +0800
Message-ID: <20261110070944.996-3-zhaofeng2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20261110070944.996-1-zhaofeng2@cmss.chinamobile.com>
References: <20261110070944.996-1-zhaofeng2@cmss.chinamobile.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_230949_922709_AD5F0C8E 
X-CRM114-Status: UNSURE (   8.41  )
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

j721e_enable_acspcie_refclk() resolves the "ti,syscon-acspcie-proxy-ctrl"
phandle with of_parse_phandle_with_fixed_args(), which takes a
reference on the resolved device node, but the reference is never
dropped, so the device node is leaked.  This is called from
j721e_pcie_ctrl_init(), which j721e_pcie_resume_noirq() re-invokes
on every resume, so the leak repeats on every suspend/resume cycle
as well.

Drop the reference with of_node_put() once the mask argument has been
consumed.

Fixes: 82c4be4168e2 ("PCI: j721e: Enable ACSPCIE Refclk if "ti,syscon-acspcie-proxy-ctrl" exists")
Signed-off-by: Zhao Feng <zhaofeng2@cmss.chinamobile.com>
---
 drivers/pci/controller/cadence/pci-j721e.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/cadence/pci-j721e.c b/drivers/pci/controller/cadence/pci-j721e.c
--- a/drivers/pci/controller/cadence/pci-j721e.c
+++ b/drivers/pci/controller/cadence/pci-j721e.c
@@ -247,6 +247,7 @@
 
 	/* Clear PAD IO disable bits to enable refclk output */
 	val = ~(args.args[0]);
+	of_node_put(args.np);
 	ret = regmap_update_bits(syscon, 0, mask, val);
 	if (ret) {
 		dev_err(dev, "failed to enable ACSPCIE refclk: %d\n", ret);



