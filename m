Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 366A8606AA5F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 10:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ka+rxhFq;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=cZifF+1D
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Em2sJRpNOElFcNjFRLmtzTqgZy234orfIB2xhsberPw=; b=ka+rxhFq7Y/01UjzYNrACr/47v
	zFgmDcSFa12/JNnLH2SdoW7tZ7RYj4sniSY9N6ISoohpPkd4EGY4kgr30prlUTEmPhPYjYxTOtF5O
	0frMGF2KHG2NDKRhfLowFZ6Jvi1HUOITgbKPvQj6ithOk66weyeZ+jQCQfZM4dh1bEneCWI9s1+Zi
	jGXMbbQRHZoEqt5FXzOq0psy04t5Z1B6butKEAEM35mP5RTsZQOUMzqBeP0Cz7MROPGVBGoOtump+
	F9OE29ZIlkJYsQqgj3NMB77E6gAjhrHEpa7zeGCIQ/S7MHU2C8+m2YR84YVxMIUym7LC6Sq8IuQoP
	zraJKeTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQipE-00000003QIs-3s9X;
	Tue, 10 Nov 2026 10:11:36 +0000
Received: from cmccmta6.chinamobile.com ([111.22.67.139])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQipC-00000003QIZ-2nwz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 10:11:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=cZifF+1DlDdT0/nc89d/5zBuT/vCn11CG5v24KVuRvgE166peC/z3EViBCmzqei2SUPS0MoxTuVC/
	 bbI361cPMA2xlOH1yrr/NegpAGWOkYcKq54/yTtarJpC2UrzWQEwPPwftFwueBcAjDlxtjiSYB1uik
	 pUCmkTT4wjXFgZj4=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app09-12009 (RichMail) with SMTP id 2ee96af2edcd936-d3c1c;
	Tue, 10 Nov 2026 18:11:33 +0800 (CST)
X-RM-TRANSID: 2ee96af2edcd936-d3c1c
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from Z04181456177947 (unknown[10.55.1.71])
	by rmsmtp-syy-appsvr08-12008 (RichMail) with SMTP id 2ee86af2edd38e8-b16c4;
	Tue, 10 Nov 2026 18:11:32 +0800 (CST)
X-RM-TRANSID: 2ee86af2edd38e8-b16c4
From: zhaofeng2 <zhaofeng2@cmss.chinamobile.com>
To: Nishanth Menon <nm@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>
Cc: Zhao Feng <zhaofeng2@cmss.chinamobile.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] soc: ti: knav_dma: Fix device node leak in of_channel_match_helper()
Date: Tue, 10 Nov 2026 18:11:30 +0800
Message-ID: <20261110101131.443-1-zhaofeng2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.55.0.windows.5
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_021135_277598_B2CB6915 
X-CRM114-Status: UNSURE (   8.68  )
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

of_channel_match_helper() resolves the "ti,navigator-dmas" phandle
with of_parse_phandle_with_fixed_args() to obtain the channel number,
which takes a reference on the dma device node in args.np, but the
reference is never dropped after the channel number has been read
from args.args[0], so the dma node is leaked on every channel open.

Drop the reference once the channel number has been retrieved.  The
phandle stored in dma_node is deliberately kept, as its ->name string
is handed out through *dma_instance and compared against later in
knav_dma_open_channel().

Fixes: 88139ed03058 ("soc: ti: add Keystone Navigator DMA support")
Signed-off-by: Zhao Feng <zhaofeng2@cmss.chinamobile.com>
---
 drivers/soc/ti/knav_dma.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/ti/knav_dma.c b/drivers/soc/ti/knav_dma.c
--- a/drivers/soc/ti/knav_dma.c
+++ b/drivers/soc/ti/knav_dma.c
@@ -387,6 +387,8 @@
 		return -ENODEV;
 	}
 
+	of_node_put(args.np);
+
 	return args.args[0];
 }
 



