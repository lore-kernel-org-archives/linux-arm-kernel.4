Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC992606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 21:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tDm6zdFV;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iKDStbMM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=TMjWJojLqq3XorQYjDrTOwvU+KHQ5CXknXxUxLM6tic=; b=tDm6zdFVYAchxI
	FxoKTdc3mi6DkqVXu1Kbec0xt1JQ7mfukT1Gv0WswChvHXv7Vcjd9ApmKY+XfHxiEM4Lr7AUREEcC
	mfEHD1JManfAe65UOltt2OUKdGOvF6X2U6i5IB//63QUMTgsoUMCXXdD9BYTL+DzLKNFhQ2gopXbi
	xez3XDHqs6sQMDE5L7daiPmkig+I5ybS9nV71wK5YysfTRdVJz4KPtHoIi3QoKE2QTUSO8Ih94mPL
	9AxI12kOpmIx6CXx1dxqkl4pRoqzeoyMNntc7518kxHuxZo6q6L0bRJZpH0Hc7noY2l3+47JPhmeT
	XpZZSaSyCyOuj/WiT7iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRGGT-00000007rQf-38ut;
	Wed, 11 Nov 2026 21:53:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRGGS-00000007rQA-0gb8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 21:53:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E64D94468B;
	Wed, 11 Nov 2026 21:53:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 497D81F00A06;
	Wed, 11 Nov 2026 21:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794434035;
	bh=TMjWJojLqq3XorQYjDrTOwvU+KHQ5CXknXxUxLM6tic=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=iKDStbMMhf8I64er8ZomLvhQlc8b5OA/YQCC3iT8gnx/Z5pGtug4uwX1onasbj+nE
	 vWTdXpFsKHlzhN5K1JO8tCeTylCbfBSydYL28LmIJqIgiPjEXBxGu5MMQiOvqOC30i
	 Mmepxeg14KOlK7H1NxsuEPUDW9XtLRec+mn6yoExu5bLXKFsVs6aMEl26u3M8iL88/
	 6bjZdrTrdUWRXX5f+hnSduKQbQCg28bLFgtgpAGJS7b/MXWSi8vvWspMTbW7/yPNtK
	 34ZjPAxw3zWoN64dKuxibiVGCsTny3xbIlKl9ANHt5tMmAYLW+7I2x49xnblWmxyYf
	 0munKaX1QsKcQ==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Tony Lindgren <tony@atomide.com>,
	Haojian Zhuang <haojian.zhuang@linaro.org>,
	Linus Walleij <linusw@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH 07/10] pinctrl: single: Reject invalid register width in pcs_probe()
Date: Wed, 11 Nov 2026 21:51:52 +0000
Message-ID: <20261111215256.1982044-8-lee@kernel.org>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
In-Reply-To: <20261111215256.1982044-1-lee@kernel.org>
References: <20261111215256.1982044-1-lee@kernel.org>
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
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/pinctrl/pinctrl-single.c | 34 ++++++++++++++++----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index e0eb7240a985..13e0ae8bb389 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -1811,6 +1811,23 @@ static int pcs_probe(struct platform_device *pdev)
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
@@ -1860,23 +1877,6 @@ static int pcs_probe(struct platform_device *pdev)
 
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
2.56.0.567.gdb80ae8cd5-goog


