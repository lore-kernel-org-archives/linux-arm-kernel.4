Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 886FE606A335
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 14:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0vA4Z0cL;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IpySxzod
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=9JkqinfSMfohhM6v4SQaMJO8qtgVh5xpR5FOEHTs9mw=; b=0vA4Z0cLiwuy4G
	X460frFqS2quQt56mHvcZ4tPyVjaJivGp1PF72I6QgrgTR08ksUC5DCruNTXtVz2vU1L7fiZGoO7x
	bgbwv+FBtfZ7CYRMgaA/86PvUDJM5V8n0Ad6/WPUK8hgvgppWJxt2CaKbyzWIOtksRzy8YbkaZcUj
	61pcUM7ChGEBd+0ihQ6Rk73U1coGjrM1Wl38rGcGYbR8DnjylqaU9PYzLh+MR1SSfIdyKkqhlg/F1
	YMy9La5qk8N7WQQv8a2NKXadjdjfuIdas//CgmdKnD3mkuLDQv3mHZ+fRSCuhvaLBDqoEC0Mb3Nys
	ULGcFQXB1Sl83Dmn0beA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwbg-0000000GKxk-1EJJ;
	Fri, 27 Nov 2026 14:07:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwbb-0000000GKva-3MOH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 14:07:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4448261213;
	Fri, 27 Nov 2026 14:07:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 365FC1F00898;
	Fri, 27 Nov 2026 14:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795788434;
	bh=9JkqinfSMfohhM6v4SQaMJO8qtgVh5xpR5FOEHTs9mw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=IpySxzoddjUy4NNC8EJm3UGGIeX+bXdXflKEKUOzmLQYbmTjOfrujWrXRF+UixXx+
	 XR7XLVsYp8j4MXQdXaW8tLv+Br6T/BoB+bqrYkOXotaKqun+hI4GWMWo5Xr9PnU6/K
	 mc3oSxTenHFH9N3xWqUP35+161Yqn4lBL8eaY9kRA6JYB/0VKtPlItA9zWK53f6f8i
	 pevvtVbLBoYEhuA5nq01iQ+WlGvuzQLU4rQhKk7Yk9zo0MZZeDE65sPUtC9wfpewNA
	 OSrySLJVlz2OST71OUpeKgwPrh0JoyFMdWFFOQ/TXwTwaBYfVSCvKFrXgdlNGvTFVI
	 UL0s1o8XertvA==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Tony Lindgren <tony@atomide.com>,
	Haojian Zhuang <haojian.zhuang@linaro.org>,
	Linus Walleij <linusw@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org,
	Alexander Sverdlin <alexander.sverdlin@siemens.com>
Subject: [PATCH v3 09/12] pinctrl: single: Reject invalid register width in pcs_probe()
Date: Fri, 27 Nov 2026 14:04:57 +0000
Message-ID: <20261127140602.2790001-10-lee@kernel.org>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
In-Reply-To: <20261127140602.2790001-1-lee@kernel.org>
References: <20261127140602.2790001-1-lee@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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

If the "pinctrl-single,register-width" property specifies an unsupported
width (anything other than 8, 16, or 32), pcs_probe() hits the default
branch in the switch statement and continues without initialising
pcs->read or pcs->write, leading to a divide-by-zero in
pcs_allocate_pin_table() or a NULL function pointer dereference when
accessing registers.

Validate pcs->width immediately after reading the property and return
-EINVAL from the default branch in pcs_probe().

Fixes: 8b8b091bf07f ("pinctrl: Add one-register-per-pin type device tree based pinctrl driver")
Closes: https://sashiko.dev/#/bug/linux-a0303b6e-d0c6-4292-aeeb-fa8a21861827
Cc: stable@vger.kernel.org
Reviewed-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
Signed-off-by: Lee Jones <lee@kernel.org>
---
v2 => v3:
 - Add Reviewed-by tag from Alexander Sverdlin.
 - Rebase onto pinctrl/for-next.

 drivers/pinctrl/pinctrl-single.c | 34 ++++++++++++++++----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index 52734bd7b7f0..6f5113dcdb4b 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -1827,6 +1827,23 @@ static int pcs_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	switch (pcs->width) {
+	case 8:
+		pcs->read = pcs_readb;
+		pcs->write = pcs_writeb;
+		break;
+	case 16:
+		pcs->read = pcs_readw;
+		pcs->write = pcs_writew;
+		break;
+	case 32:
+		pcs->read = pcs_readl;
+		pcs->write = pcs_writel;
+		break;
+	default:
+		return -EINVAL;
+	}
+
 	ret = of_property_read_u32(np, "pinctrl-single,function-mask",
 				   &pcs->fmask);
 	if (!ret) {
@@ -1876,23 +1893,6 @@ static int pcs_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, pcs);
 
-	switch (pcs->width) {
-	case 8:
-		pcs->read = pcs_readb;
-		pcs->write = pcs_writeb;
-		break;
-	case 16:
-		pcs->read = pcs_readw;
-		pcs->write = pcs_writew;
-		break;
-	case 32:
-		pcs->read = pcs_readl;
-		pcs->write = pcs_writel;
-		break;
-	default:
-		break;
-	}
-
 	pcs->desc.name = DRIVER_NAME;
 	pcs->desc.pctlops = &pcs_pinctrl_ops;
 	pcs->desc.pmxops = &pcs_pinmux_ops;
-- 
2.56.1.839.g22a8290db9-goog


