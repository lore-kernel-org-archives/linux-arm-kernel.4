Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C560C606B9C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 08:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uTEugW4N;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=ItYCH+sa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=xh8F630yN77eRVLFRW+731lWzZ0fRCWqNCGE0dp/ZXc=; b=uTEugW4NWDy3VaHy7hcvuwZqVZ
	2xjssoXGzJOTPwbJDACcJw21omVBzgo7QWTkvjyIPPk5Orp3fiQtZba7x8vnBGO4UAjIWvjBDmYXG
	6CA26eK7j/0y2XtyhE8y4USgkrCnBUOwP6Za/8U2tAREYfURVy3YUHJ4y8EUjA81h/AU7yhMl+pKH
	yKTWKpN3XCWJfH5QY5qK+4UzWN6pbxUwkuUyYt8ONkfhW+cWGUSD5qYwi9CtqyrC4c+5lBHF9hqiP
	LK/FD0tO9til9JKn9zdx1s4pj0agpLcMSK9BW4lKtP4wgU9xlF6hiODJs9W28bru3Sk1WCqMEbAp6
	z+wgaD8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQhHz-000000038Df-1163;
	Tue, 10 Nov 2026 08:33:11 +0000
Received: from cmccmta8.chinamobile.com ([111.22.67.151])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQhHv-000000038Cy-1RFp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 08:33:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=ItYCH+sas3HlcRu2sLhhlP5SXir0JwIAk4K2qif0N60G2LLd13VUdHoBXVkn8YFW9VNnh48Hgb6Su
	 au7Pm9dN61xf5+hZecirANgBN87z3DYyaVvrHq5ABY+ieT5qv+7keswx5XmN1ZeW0JwLsiFVE2jn38
	 XEcG386r1dbxm8p8=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app02-12002 (RichMail) with SMTP id 2ee26af2d6b52a6-0907e;
	Tue, 10 Nov 2026 16:32:55 +0800 (CST)
X-RM-TRANSID: 2ee26af2d6b52a6-0907e
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from DESKTOP-3K8GUTQ (unknown[223.108.79.98])
	by rmsmtp-syy-appsvr04-12004 (RichMail) with SMTP id 2ee46af2d6b551b-ae357;
	Tue, 10 Nov 2026 16:32:54 +0800 (CST)
X-RM-TRANSID: 2ee46af2d6b551b-ae357
From: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
To: antonio.borneo@foss.st.com,
	linusw@kernel.org
Cc: mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	linux-gpio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
Subject: [PATCH v2] pinctrl: stm32: Fix reset control leak in stm32_pctl_probe() error paths
Date: Tue, 10 Nov 2026 16:32:52 +0800
Message-ID: <20261110083253.1525-1-laixiangwu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_003307_938680_81D2C068 
X-CRM114-Status: GOOD (  13.08  )
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

stm32_pctl_probe() acquires an exclusive reset control for every GPIO
bank with of_reset_control_get_exclusive(), but none of the error
paths release them again: the bank loop returns directly on
-EPROBE_DEFER and on a failed clock lookup, and the
clk_bulk_prepare_enable() failure and the err_register path also
leave the already acquired reset controls behind.

On success the reset controls are kept for the lifetime of the device
and are never released either (the driver has no .remove), but that
is harmless.  On a failed probe, and in particular when the probe is
retried after -EPROBE_DEFER, every attempt leaks another set of
reset control references.

Release the acquired reset controls on all error paths.

Also release the clocks of the already processed banks on the
-EPROBE_DEFER path, which was missed by the earlier clock leak fix
dfd8259507c5 ("pinctrl: stm32: Fix clock reference leak in
stm32_pctl_probe()").

Fixes: 2254e77665d5 ("pinctrl: stm32: defer probe if reset resource is not yet ready")
Signed-off-by: laixiangwu <laixiangwu@cmss.chinamobile.com>
---
Changes in v2:

- Point the Fixes tag at 2254e77665d5, which introduced the reset
  control acquisition in the stm32_pctl_probe() bank loop and the
  -EPROBE_DEFER return path; bb949ed9b16b only replaced the child
  node iteration helper (suggested by Sashiko AI review).
- Also release the clocks of the already processed banks on the
  -EPROBE_DEFER path, which was missed by dfd8259507c5.

Link: https://lore.kernel.org/all/20261110065722.1340-1-laixiangwu@cmss.chinamobile.com
 drivers/pinctrl/stm32/pinctrl-stm32.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index 98cf9c6f4..2a54a0176 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -1966,15 +1966,18 @@ int stm32_pctl_probe(struct platform_device *pdev)
 		bank->rstc = of_reset_control_get_exclusive(np, NULL);
 		if (PTR_ERR(bank->rstc) == -EPROBE_DEFER) {
 			fwnode_handle_put(child);
-			return -EPROBE_DEFER;
+			clk_bulk_put(i, pctl->clks);
+			ret = -EPROBE_DEFER;
+			goto err_put_rstcs;
 		}
 
 		pctl->clks[i].clk = of_clk_get_by_name(np, NULL);
 		if (IS_ERR(pctl->clks[i].clk)) {
 			fwnode_handle_put(child);
 			clk_bulk_put(i, pctl->clks);
-			return dev_err_probe(dev, PTR_ERR(pctl->clks[i].clk),
-					     "failed to get clk\n");
+			ret = dev_err_probe(dev, PTR_ERR(pctl->clks[i].clk),
+					    "failed to get clk\n");
+			goto err_put_rstcs;
 		}
 		pctl->clks[i].id = "pctl";
 		i++;
@@ -1984,7 +1987,7 @@ int stm32_pctl_probe(struct platform_device *pdev)
 	if (ret) {
 		dev_err(dev, "failed to prepare_enable clk (%d)\n", ret);
 		clk_bulk_put(banks, pctl->clks);
-		return ret;
+		goto err_put_rstcs;
 	}
 
 	for_each_gpiochip_node(dev, child) {
@@ -2009,6 +2012,10 @@ int stm32_pctl_probe(struct platform_device *pdev)
 
 	clk_bulk_disable_unprepare(banks, pctl->clks);
 	clk_bulk_put(banks, pctl->clks);
+err_put_rstcs:
+	for (i = 0; i < banks; i++)
+		if (!IS_ERR_OR_NULL(pctl->banks[i].rstc))
+			reset_control_put(pctl->banks[i].rstc);
 	return ret;
 }
 EXPORT_SYMBOL(stm32_pctl_probe);
-- 
2.50.1.windows.1




