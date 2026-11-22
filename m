Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE14606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 15:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2H7ZKhHc;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=CbDnoZXl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=da6eqqr5+mNyqLPiJjh9XR2U6FENUUFBFqpSoPRBQAU=; b=2H7ZKhHcN9kfkG
	3+vI8XsdzutGt+l5xAhT/YbqKM81EdKgpvwDrvvcI8hNiewyU57nZav8ptLpHqxiuAYUm+ONpAgtB
	VjNaoLzCKwbTTLePBPk4Q08EWBrvJzjK0JxJwy933ji7IPME3EGth5tcgTqCs/98iwtLBtkpT1B+Z
	+OnC+VuJd/w52qbUAkzU+DNCM1io5Q+5np4GIQc/ACa8/VkKYN02NsEcckKGgYDABcG8oaSCjS91K
	Dtjc2R1JerpnkkPR7GiDhpYoOqP4NvTVeigJkIsjxYI77wbkc5fhoR2Cw3lCV/CAtVseE/vT/SEyq
	JK/4Wbh3D5V4n2BPTPSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV9X6-00000001Gkf-3Wb8;
	Sun, 22 Nov 2026 15:31:12 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV9X3-00000001Gjm-1Qtb
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 15:31:10 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so22552945e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 07:31:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1795361467; x=1795966267; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=da6eqqr5+mNyqLPiJjh9XR2U6FENUUFBFqpSoPRBQAU=;
        b=CbDnoZXlGVg48zC3ZvSgLN4VSHyzed4FeBUfi6HnHMMarhzBG6qWN5UqcCvBHoAdnt
         ZhiKsQJ6CI7fBRPS9fNlIVtN0+hLiTGPOU5lyTC4KbFPx1/WuBQitiIKbGWtSM7fae09
         /M7Lp6khpBUmLXI/hiQlgQehckw63fOYgCHzQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795361467; x=1795966267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=da6eqqr5+mNyqLPiJjh9XR2U6FENUUFBFqpSoPRBQAU=;
        b=slztLndeoEchGGzqrenlCBAhK3KLlU3NWWp9JdkHG7s5K/LC4YpxhzPWcqfwTybR2i
         hbTg/MO3y7ST8ZJUrkWPxRaTq+8qldzjNthtlPXgUMf9902GW5YX+0EjJ9mcLK2Jg7nu
         z/XNajFcTi8bfPUxf6ZXLw4rwydROGmVUajFXhbslA5StqotuWdQTgoLQB7iLOKOlr3K
         HTP21kaR+1Fx1OUHRS/P0vuMK8DOV4rgMLTaofSqxYDFbpQFG/E2VzBjdufynJaTkQTA
         n/2sPw22Xlo1ZsWQs3EzLx8nuEMJ5CMIJIruFiZ+VnrnJUkZQ2L1VYasFdJZMRN6fLW6
         H9GQ==
X-Forwarded-Encrypted: i=1; AL+hErEqXvPAcfAMi4YotgQXStkgURa9q8KsBZCdv+0DUNNzgzXMGNoVXHCepFfPYRK4nfZd4SVx4RMIec+xUy/fXbS6@lists.infradead.org
X-Gm-Message-State: APuU4Z8yAqZhlC3P8Vn20nXLWlUjEQ5vz47rWYbyRGgrVMAcJaDV0tY2
	eRGx1eJVYRfYlO74XXHgWWaLqSBXEKK47Uj2JnTItccNftSxfkEhfoFcwHNFchNmSyg=
X-Gm-Gg: AZFdTZcdDqsQr119rwfSu8pIytzi1mfIoj0SqbaG6RN8jlBFS87tX+oX/yrV2a8bM5d
	XKmVHSnNvFIfCPfx1nRlrCHC/D+O8cEru5y/TWz/gibousY35wzOeHSL6r2Xim4ruj2mtZX9oK7
	2tOT3tYhJVCD9fQ2/y7TBH567LG6I2mY016n/IVWKpZHhp4CoaUHm1AbJ1LnEGG7U9dB6FIMnOj
	DQtP28MkJ2HJXhrjPWYXTB8nN7vJo0J365sTE6WI3IhHJrTU8ppapySScC2uwBERZwilumukGpI
	96QH46V8DA256/1c2ovUHX8Ih6hCnKTfW+ACdL2WnjO5vtV163ikeJExPo7aMzGaFYbuy3aLsq1
	8qPFNL9Tr5WNixUhaxU1FcuGbb0MXlVoEipoGxDe/3/XR2qHQrusr8RCd0p8HZEBsHO06mDhxGP
	DUG1FhUJtVmf2tobQggwZVCDMiZDzV2QpVFXbvkAIY9Nm2bGzpQtde9jDyZCaxryui2SDYAObfx
	Y37sMebAEhnJOVzFZgz9GNpoo/REAvmr1usMVi1tF0sue7muLl3ycck8HUJKvRFddEyicgNFF9l
	9BfrWG3/1UV7r2hFTcd2sUlBML8VptwFOe2nuzlyWSsv7h/jz9jWP3++nrFHkO/9B7WU3GIWuMT
	mHA0CKQzzg6JvR2FOc6HbOGmBrrl2xaM8n+Dv25IffsLnjEvkBuwkp+Pmnzb94Z73nzvPacIH4B
	xMsOnrJ/xHCsP+yGQSVwDK/4P9b0f8HEAywDwWgi6rHgm00iI=
X-Received: by 2002:a05:600c:8287:b0:4a1:6992:f861 with SMTP id 5b1f17b1804b1-4bb887e064dmr198299585e9.1.1795361467514;
        Sun, 22 Nov 2026 07:31:07 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a15absm237833815e9.9.2026.11.22.07.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 07:31:06 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	David Airlie <airlied@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Marek Vasut <marex@denx.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Simona Vetter <simona@ffwll.ch>,
	Stefan Agner <stefan@agner.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 5/8] drm/mxsfb: Stop the controller in hw_reset
Date: Sun, 22 Nov 2026 16:30:05 +0100
Message-ID: <20261122153032.2782768-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261122153032.2782768-1-dario.binacchi@amarulasolutions.com>
References: <20261122153032.2782768-1-dario.binacchi@amarulasolutions.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_073109_413456_72AFE743 
X-CRM114-Status: GOOD (  16.74  )
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

When the hardware state can't be read out, a controller left running
by the bootloader is reprogrammed while running on the first enable.
Stop it in the hw_reset hook.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 drivers/gpu/drm/mxsfb/mxsfb_drv.c |  2 ++
 drivers/gpu/drm/mxsfb/mxsfb_kms.c | 33 ++++++++++++++++++++++++++++++-
 2 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
index c8bc79264361..ef4a47d238ed 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
@@ -31,6 +31,7 @@
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_mode_config.h>
+#include <drm/drm_modeset_helper.h>
 #include <drm/drm_module.h>
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
@@ -110,6 +111,7 @@ static const struct drm_mode_config_funcs mxsfb_mode_config_funcs = {
 	.fb_create		= mxsfb_fb_create,
 	.atomic_check		= drm_atomic_helper_check,
 	.atomic_commit		= drm_atomic_helper_commit,
+	.hw_reset		= drm_mode_config_helper_hw_reset,
 };
 
 static const struct drm_mode_config_helper_funcs mxsfb_mode_config_helpers = {
diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
index bbc2a2df9f16..96cd80c6e76c 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
@@ -35,6 +35,18 @@
 /* 1 second delay should be plenty of time for block reset */
 #define RESET_TIMEOUT		1000000
 
+static void mxsfb_hw_get(struct mxsfb_drm_private *mxsfb)
+{
+	pm_runtime_get_sync(mxsfb->drm->dev);
+	mxsfb_enable_axi_clk(mxsfb);
+}
+
+static void mxsfb_hw_put(struct mxsfb_drm_private *mxsfb)
+{
+	mxsfb_disable_axi_clk(mxsfb);
+	pm_runtime_put_sync(mxsfb->drm->dev);
+}
+
 /* -----------------------------------------------------------------------------
  * CRTC
  */
@@ -205,7 +217,7 @@ static void mxsfb_enable_controller(struct mxsfb_drm_private *mxsfb)
 	writel(CTRL_RUN, mxsfb->base + LCDC_CTRL + REG_SET);
 }
 
-static void mxsfb_disable_controller(struct mxsfb_drm_private *mxsfb)
+static void mxsfb_stop_controller(struct mxsfb_drm_private *mxsfb)
 {
 	u32 reg;
 
@@ -221,6 +233,11 @@ static void mxsfb_disable_controller(struct mxsfb_drm_private *mxsfb)
 	reg = readl(mxsfb->base + LCDC_VDCTRL4);
 	reg &= ~VDCTRL4_SYNC_SIGNALS_ON;
 	writel(reg, mxsfb->base + LCDC_VDCTRL4);
+}
+
+static void mxsfb_disable_controller(struct mxsfb_drm_private *mxsfb)
+{
+	mxsfb_stop_controller(mxsfb);
 
 	clk_disable_unprepare(mxsfb->clk);
 	if (mxsfb->clk_disp_axi)
@@ -433,6 +450,19 @@ static void mxsfb_crtc_atomic_disable(struct drm_crtc *crtc,
 	pm_runtime_put_sync(drm->dev);
 }
 
+static void mxsfb_crtc_hw_reset(struct drm_crtc *crtc)
+{
+	struct mxsfb_drm_private *mxsfb = to_mxsfb_drm_private(crtc->dev);
+
+	mxsfb_hw_get(mxsfb);
+
+	/* The bootloader may have left the controller running */
+	if (readl(mxsfb->base + LCDC_CTRL) & CTRL_RUN)
+		mxsfb_stop_controller(mxsfb);
+
+	mxsfb_hw_put(mxsfb);
+}
+
 static int mxsfb_crtc_enable_vblank(struct drm_crtc *crtc)
 {
 	struct mxsfb_drm_private *mxsfb = to_mxsfb_drm_private(crtc->dev);
@@ -493,6 +523,7 @@ static const struct drm_crtc_helper_funcs mxsfb_crtc_helper_funcs = {
 	.atomic_flush = mxsfb_crtc_atomic_flush,
 	.atomic_enable = mxsfb_crtc_atomic_enable,
 	.atomic_disable = mxsfb_crtc_atomic_disable,
+	.hw_reset = mxsfb_crtc_hw_reset,
 };
 
 static const struct drm_crtc_funcs mxsfb_crtc_funcs = {
-- 
2.43.0


