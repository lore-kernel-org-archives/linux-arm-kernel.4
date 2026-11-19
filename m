Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D020606A907
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 20:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zJ4FqvH9;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Px5mt2wx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=oHWOW8G+UnriW2sSLKOhokujUtbgw6vOEtLbwr2KX6U=; b=zJ4FqvH9boLqdb
	09WZiRs4giwhAk598+UabMuz2WQrRMcar8oXzfffHnvzx3Nhc9s2z9+PPtKSVMrdH8G8S3nZOHSZ/
	XoxQ3B0CPNf3dhb188uxmpcaii96SIMT7opzQUZPnKikNvXvL1ttvfQh1URZMIZIYI0jfKmEG/OXI
	gLlcBagmpfxzjQ0Fhn6E/lnf0isLjGxCW+gGq0wzwomGKJ25A0Ntg0Hz60fT2dZDSEh/ah4QeMGOf
	aFMBqEaofqa9fPZiau8VbeipGY8Sqk2aXTCnxLlvzq3kXVql+BAwmKXJtHhL7QkVdyaaz3LLilgXw
	q4D//hkCsPcCguJaNttg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU96M-0000000DQgd-08m3;
	Thu, 19 Nov 2026 20:51:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU96L-0000000DQg3-0LrU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 20:51:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C1065466FD;
	Thu, 19 Nov 2026 20:51:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3D351F000C6;
	Thu, 19 Nov 2026 20:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795121484;
	bh=oHWOW8G+UnriW2sSLKOhokujUtbgw6vOEtLbwr2KX6U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Px5mt2wxp4xZ7KV/d+wOY1G00esTciZYkTZb8M3Ptis/EWn2XPzbuQ/pz6Pjpkz46
	 WRu6qHDSZSWo44wFi9Y6bZyv1tilP1kvvuhHfqbTWlWPcFwEefFOsJk1D8UXstVVug
	 k5eSbFPGsGbLKlplO0JF67JT5bQv1Qu5IdnFg93me3bvTdyKauw4GS2YdfCazIBN1q
	 P/rx4P07qSs3e0v0LDKxOlHw7i9bnL0XAjvuydunUbDynb81L8OBAkO0QosS0+gxtZ
	 nRYJmucc6Sd+A1pzxowvzsY6LK8AuuaEvW7uf6Ctazdfp9b2HxvTh3s+S2+4IeNacm
	 K2TzZ6vr4jO2w==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Tony Lindgren <tony@atomide.com>,
	Haojian Zhuang <haojian.zhuang@linaro.org>,
	Alexander Sverdlin <alex@sverdlin.org>,
	Linus Walleij <linusw@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH v2 09/12] pinctrl: single: Reject invalid register width in pcs_probe()
Date: Thu, 19 Nov 2026 20:49:05 +0000
Message-ID: <20261119205013.2563811-10-lee@kernel.org>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
In-Reply-To: <20261119205013.2563811-1-lee@kernel.org>
References: <20261119205013.2563811-1-lee@kernel.org>
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

v1 => v2: No changes

 drivers/pinctrl/pinctrl-single.c | 34 ++++++++++++++++----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index d72ebb186b89..1779ffbc1181 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -1832,6 +1832,23 @@ static int pcs_probe(struct platform_device *pdev)
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
@@ -1881,23 +1898,6 @@ static int pcs_probe(struct platform_device *pdev)
 
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
2.56.1.750.gf70dc682cf-goog


