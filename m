Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA66A606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 10:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2pJ840TR;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=F2R2bmyu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=jMsdtwCbV5v0zb6ZC86ZF2reRzr1NvmCVm7BDIN6O6s=; b=2pJ840TRAtNYHzXK7dosrxAJ2a
	gF05vQMurjXF9GWh0tbiYVBtpKAp9GybuO6FLn1JWxtzIllRO2vkMQIcX3XvD7jYrmmZGp0EwjY1Z
	tsL+hsmsueJ8jEv45N6WFXxeaqzVOoYUL+M1CwVRLPd/AyfgVHNk8/H22nRdxj2SyVfsXQX53hrdu
	468S6RZaVYKYRpE1BPQWDd9udt72EnnlbDNAd/CIWT0jAB5Rzp0gjDxXs+6Hy5JjFv6h7y8cXLpLZ
	bmbENgdBwUoM4kRLtzwVsQgPhvw6WVcXYpKu5LJSMz+LQOZ2+PgFrfyjUTmHhBf2hJl3tsRyZ0uqS
	O2sb5AMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWX3H-0000000CmO7-3kYN;
	Thu, 26 Nov 2026 10:50:07 +0000
Received: from watt.d-silva.org ([119.15.109.137] helo=www.nmnhosting.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWX3F-0000000CmM5-2XGk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 10:50:06 +0000
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id 43655403EF;
	Thu, 26 Nov 2026 21:49:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795690194;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jMsdtwCbV5v0zb6ZC86ZF2reRzr1NvmCVm7BDIN6O6s=;
	b=F2R2bmyugO9Wik6VrsqtltgrnjxLDfBrWB/7KeEYHci7kKRs960fMakOamSRLjTb+YRp7F
	o8UKPVpts3PBiISm9oiH8ehslTKZIHOxEqJmCZtoRMkD9fTonvyW3gPp8pm2GN9hUNeyoW
	j3YTDZVaUPqPZf4n+2yJjZ1xW+bNfXJwkwlE+L6Dh6Ya5MpknNmF0ICebUeU921rt5lvxw
	QlX6i8l0aLluiTF3sirVhu1UlADxVtQit9bXYTwl8H5DKp7Vr24W/WCWPi/ZfAb4X5NkoJ
	vfHy+E48UgO5W9o/ylVVHtl86g3D5sGBd7847oLJ7zjvbcCFun3RFDwa08ViPA==
X-GPT-Reason: legitimate_personal_technical_content: The email
	is a standard Linux kernel patch submission containing a functional
	code diff regarding pinctrl driver refactoring. The sender
	(alastair@d-silva.org) matches the intended recipient domain
	(alastair@d-silva.org), the subject line follows standard developer
	conventions ([PATCH]), and there are no indicators of marketing,
	phishing, or urgency.
From: Alastair D'Silva <alastair@d-silva.org>
To: Linus Walleij <linusw@kernel.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-gpio@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Alastair D'Silva <alastair@d-silva.org>
Subject: [PATCH] pinctrl: sunxi: Drop unused parameter from sunxi_grp_config_reg()
Date: Thu, 26 Nov 2026 21:49:54 +1100
Message-ID: <20261126104954.441427-1-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_025005_791200_3DEA1CE9 
X-CRM114-Status: GOOD (  10.78  )
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

sunxi_grp_config_reg() takes a pctl parameter that is never used.
Drop it to match the original signature.

Fixes: 8b367fc08be4 ("pinctrl: sunxi: refactor IRQ register accessors")
Assisted-by: LLM
Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 5 ++---
 drivers/pinctrl/sunxi/pinctrl-sunxi.h | 3 +--
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index bf4ec4665e2b..d30a562315aa 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -763,10 +763,9 @@ static int sunxi_pinctrl_set_io_bias_cfg(struct sunxi_pinctrl *pctl,
 		else
 			val = 0xD; /* 3.3V */
 
-		reg = readl(pctl->membase + sunxi_grp_config_reg(pctl, pin));
+		reg = readl(pctl->membase + sunxi_grp_config_reg(pin));
 		reg &= ~IO_BIAS_MASK;
-		writel(reg | val, pctl->membase +
-		       sunxi_grp_config_reg(pctl, pin));
+		writel(reg | val, pctl->membase + sunxi_grp_config_reg(pin));
 		return 0;
 	case BIAS_VOLTAGE_PIO_POW_MODE_CTL_INV:
 		inverted = true;
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
index 7c2f29e75519..3060cef3705d 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
@@ -328,8 +328,7 @@ static inline u32 sunxi_irq_status_offset(u16 irq)
 	return irq_num * IRQ_STATUS_IRQ_BITS;
 }
 
-static inline u32 sunxi_grp_config_reg(const struct sunxi_pinctrl *pctl,
-				       u16 pin)
+static inline u32 sunxi_grp_config_reg(u16 pin)
 {
 	u8 bank = pin / PINS_PER_BANK;
 
-- 
2.53.0


