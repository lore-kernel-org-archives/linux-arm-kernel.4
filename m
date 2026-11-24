Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0722606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 00:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FD7mIHSe;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AMI0hqwh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=wpD+A3zS6yZKtxBGq/xZfogVf4Yr261dCIU+g/u8beI=; b=FD7mIHSeJ5ui3XMMEIdtDG10kh
	xBODOG+KcgQasM1f259HUMLO5U4achEyFsrKpyKzhKKV1br5A9Obv9QbmhZGsLsA0cO1bfW719G2w
	cx3ZUy4siDMqxHWN4t2bYQ2NIhkzNJDLVcQcOuv5aIgLsr+EUzuuG9AT1VE1SYvp0OiNxuYyXcWA3
	uWQhBaTQG/0MtdnBnKJduHGKyNLkYneKd3C88Y81WCnYDomAGZjrerR6U07gjIIIHBtXFTTn+qCvN
	2DbMkUljhyoYqkguHd1QFvRCoLJcgZWraGA7KliOejleCdZZhflHxu6qRINJCwq9Mj0Y9rI6+sk5m
	Zczyfgpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVeW5-00000005Gpk-0C6r;
	Tue, 24 Nov 2026 00:36:13 +0000
Received: from mail-oi2-x08.google.com ([2607:f8b0:4864:32::8])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVeVz-00000005Gob-0QlM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 00:36:11 +0000
Received: by mail-oi2-x08.google.com with SMTP id 5614622812f47-568042aaf90so557037b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 16:36:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795480566; x=1796085366; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wpD+A3zS6yZKtxBGq/xZfogVf4Yr261dCIU+g/u8beI=;
        b=AMI0hqwhbXcJKudy3iWe4b3jD/tSdcaWBIuqedL9QB5T4gJw9HzfOYjPhru5DHBhSR
         Lz+DdTFYsBllVy1xT5q8BKhcX/Gxsa41iqAzs7FfCq7mZRVHKFFegMVB5414Jhdqbg4U
         QZ17gml7BggS26k1P0I4g2NLwuUp7e8Q2+dlC1EnIOCNMOfT37AaJYwg/uPd9GNRjQu4
         HXxZ9MuK/xqUpAXTyvpF27DuFDCAlNssgEvyWMy2pfBb+VviwxA+fu9/5IRGC+QXceNI
         xN3We7lZ6NLqrgpbyBAsE7Aw5YgR+pGU6f3yjwFj7go9tT88CmQRNPHicQ5uSScB0ytV
         3QpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795480566; x=1796085366;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=wpD+A3zS6yZKtxBGq/xZfogVf4Yr261dCIU+g/u8beI=;
        b=ZEg/TMFiNKo3q2AxYmlh5Q3Xv6pwAwYdTZ81D1ChjXM51jYMQ5ifdCicC3RtOplAvy
         fZxyz9a/ZgilHEsX5Jh9CATwLGme3fCdDNRt/KU1u3TgTnzqXS/r92O4wc9xBaqZ06fc
         ezAvJR9XakC5db5Tyt/Rwc8zI96ZE4x6lhqFx2qRKLt02H+TTU9VOl4SDpVY84ryJGWf
         tgJRvoSno3ZKLbZhiLA/GqUDwQKh2HuPYas/1WuQh4UDpd4w5nssTQCg+7jcbc7nVWMP
         d9jk00N0RQ8+gjHLMNz8iqET+n2Famov0ZzZb32STpX1r0Vo5uqd/4yeCxypfcULjM1W
         kHlg==
X-Forwarded-Encrypted: i=1; AL+hErHJo9WkOpC3oAbf36YNmF6GvdvKiwyBy5MHFq2IM1NTZF3BpAHK1TqZkG9Jgs2UrNH5RjDQaQWANpybeTMXrL2p@lists.infradead.org
X-Gm-Message-State: APuU4Z9Ln6TT8YDdUig3ezkMmBgwy1skGnQSJbHKu8/YREOYKwVjTNdm
	t3BS31g1nJBrSl7e8UFr2+77JwgM7YinwfrzS88qxBfWsPrAYkhaOU9+
X-Gm-Gg: AZFdTZfuGH2b/H3XcRxeELAnxM2HGTkKijvwgrtg/r4DqqVLv3AuGzCtZPWaUXkxJAm
	LdEm8cmkr2+ovc4QK5YrRcqvEal5fDPovLbP0qxfeJve+wToley/w+N0dVn0LdiDNnnX2B4wrVd
	ViNisVq/tplQcLXg8MW93FSseUCx1LbX+vpubfbwLEVqw/hig+xu5s84Ajkg0J5vDvDTnFslXPH
	1G3l0wqIWiGViABM9eLcAf9+H263hNdq5dwRyaDBwbtYHsm8SlcXz1ie8Tpf4DZtoD7lPdaAW/p
	t0m1QY2Nv7UMReDSnLp56QMO4rFma5qGxPdZ8QSk85sUfdyoCrpW31iLDZqLubh7Pgxx3w2WMrn
	v9JR3pxaz7+Y44uco0F3jFvzRLv6qDXaATO7ncWDEp5Wl4nfTeUtyn0A4ckS6X1Wx7JnQSDsB9p
	+fV69rrowORcicBEpFk+tNWWD2v/ao86rG5iNQVJv6YqjKgPLY5wmBBVLqL4KFIK+OKyDTvnyx8
	mCs6N7slcNMZj4ik5TN7ORUIzhakstb+UBQzJpq90SHe33rBQ5sqZO4ZPPdI+XzyskzbeMaRFqT
	D4IB7nRoHlH36cXFLdLk6GWC
X-Received: by 2002:a05:6808:1483:b0:4d6:9283:1bdf with SMTP id 5614622812f47-57a0c29f7bamr14157637b6e.60.1795480566115;
        Mon, 23 Nov 2026 16:36:06 -0800 (PST)
Received: from [192.168.18.164] ([2600:8804:5716:d800::d500])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a34250fa1sm9563952b6e.5.2026.11.23.16.36.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 16:36:04 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Mon, 23 Nov 2026 18:35:55 -0600
Subject: [PATCH v2] drm/mediatek: ovl: Report coverage blending on older
 SoCs
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-rbrue-suez-mtk-ovl-coverage-v2-1-4149e2ed5fee@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/33NQQ6CMBBA0as0s2ZMp4BWVt7DsCh1gEagpoVGJ
 dzdSFy7/Yv3V4gcHEeoxAqBk4vOT1AJlQmwvZk6RneDSoCS6khEGkMTFsa48BvH+Y4+DWh94mA
 6RjprS9QY3VABmYBH4NY9d/1aZwJ6F2cfXvss0bf+XCX/uomQMC9lIaUuW5ufLt1o3HCwfoR62
 7YP/uIBXsYAAAA=
X-Change-ID: 20261118-rbrue-suez-mtk-ovl-coverage-198c11ba8b14
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795480563; l=5868;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=rWPjygIN23+DBnZBmFUqc49c7iHVLHNqhnAs+aTYCK8=;
 b=XSMIVCcnAR5FgtDLKy7jJhaRZTYV9dECaHiOwLWsXl0N1yoLco/3sS9q6cQ7ebgO71F8ogNWn
 QX6pNuS/SfhDl3o1aIGoSfZHPSN/6CZj0RAYQvL+A9cjaAgseBWl6Ew
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_163608_880868_E96E6EEE 
X-CRM114-Status: GOOD (  20.92  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Since commit 860e748bddcc ("drm: ensure blend mode supported if pixel
format with alpha exposed"), every OVL plane on MT2701, MT8167, MT8173
and MT8183 warns at boot:

  [drm] [PLANE:37:plane-0] pixel format with alpha exposed but blend
  mode not setup. Please fix.

These OVLs expose ARGB formats but don't have blend_modes in their driver
data, so no "pixel blend mode" property is created. They can't blend
premultiplied pixels: mtk_ovl_fmt_convert() always selects the
non-premultiplied color formats for them, which is the DRM "Coverage"
equation. Since commit 9813e158d13d ("drm/drm_blend: allow blend mode
property without PREMULTI") a coverage-only property is allowed, so
advertise it and drop the comment saying it couldn't be created.

The plane state then defaults to Coverage (1) instead of Pre-multiplied
(0), and mtk_ovl_layer_config() enables alpha blending for any non-zero
blend mode. On these SoCs that would set OVL_CON_AEN for XRGB formats
too, which they can't ignore the pixel alpha of, the breakage fixed by
commit 995d4d558eea ("drm/mediatek: ovl: Fix XRGB format breakage for
blend_modes unsupported SoCs"). Only look at the blend mode on SoCs that
support premultiplied blending, as mtk_ovl_fmt_convert() does, so these
SoCs keep enabling alpha blending for formats with alpha only.

Tested on MT8173 (Amazon Fire HD 10 2017). The warning is gone, every
plane reports a "pixel blend mode" of Coverage, and the OVL0 layer
registers are unchanged.

Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
Since 7.3, MT8173 and the other OVLs without premultiplied alpha log
"pixel format with alpha exposed but blend mode not setup" for every
plane at boot. They blend in coverage mode, and the blend mode helper
now accepts a coverage-only property, so this patch advertises that.
No register changes; tested on MT8173 (Amazon Fire HD 10 2017).

This patch was developed with the help of an LLM.
---
Changes in v2:
- Keep OVL_CON_AEN off for XRGB formats on the coverage-only SoCs: the
  blend mode now defaults to Coverage (1), not 0, so only look at it
  where premultiplied blending is supported (Sashiko).
- Correct the commit message, which said both defaults were non-zero.
- Link to v1: https://lore.kernel.org/r/20261120-rbrue-suez-mtk-ovl-coverage-v1-1-35040085fc37@gmail.com
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index 5445870716f9..efa19d02ccc1 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -412,12 +412,8 @@ static unsigned int mtk_ovl_fmt_convert(struct mtk_disp_ovl *ovl,
 	 * and supports premultiplied color formats, such as OVL_CON_CLRFMT_PARGB8888.
 	 *
 	 * Check blend_modes in the driver data to see if premultiplied mode is supported.
-	 * If not, use coverage mode instead to set it to the supported color formats.
-	 *
-	 * Current DRM assumption is that alpha is default premultiplied, so the bitmask of
-	 * blend_modes must include BIT(DRM_MODE_BLEND_PREMULTI). Otherwise, mtk_plane_init()
-	 * will get an error return from drm_plane_create_blend_mode_property() and
-	 * state->base.pixel_blend_mode should not be used.
+	 * If not, the hardware only blends in coverage mode, which is the only mode
+	 * those platforms advertise.
 	 */
 	if (ovl->data->blend_modes & BIT(DRM_MODE_BLEND_PREMULTI))
 		blend_mode = state->base.pixel_blend_mode;
@@ -516,10 +512,11 @@ void mtk_ovl_layer_config(struct device *dev, unsigned int idx,
 		con |= state->base.alpha & OVL_CON_ALPHA;
 
 		/*
-		 * For blend_modes supported SoCs, always enable alpha blending.
-		 * For blend_modes unsupported SoCs, enable alpha blending when has_alpha is set.
+		 * For SoCs supporting premultiplied blending, always enable alpha blending.
+		 * For coverage-only SoCs, enable alpha blending when has_alpha is set.
 		 */
-		if (blend_mode || state->base.fb->format->has_alpha)
+		if ((blend_mode && (ovl->data->blend_modes & BIT(DRM_MODE_BLEND_PREMULTI))) ||
+		    state->base.fb->format->has_alpha)
 			con |= OVL_CON_AEN;
 
 		/*
@@ -667,6 +664,7 @@ static const struct mtk_disp_ovl_data mt2701_ovl_driver_data = {
 	.gmc_bits = 8,
 	.layer_nr = 4,
 	.fmt_rgb565_is_0 = false,
+	.blend_modes = BIT(DRM_MODE_BLEND_COVERAGE),
 	.formats = mt8173_formats,
 	.num_formats = ARRAY_SIZE(mt8173_formats),
 };
@@ -677,6 +675,7 @@ static const struct mtk_disp_ovl_data mt8167_ovl_driver_data = {
 	.layer_nr = 4,
 	.fmt_rgb565_is_0 = true,
 	.smi_id_en = true,
+	.blend_modes = BIT(DRM_MODE_BLEND_COVERAGE),
 	.formats = mt8173_formats,
 	.num_formats = ARRAY_SIZE(mt8173_formats),
 };
@@ -686,6 +685,7 @@ static const struct mtk_disp_ovl_data mt8173_ovl_driver_data = {
 	.gmc_bits = 8,
 	.layer_nr = 4,
 	.fmt_rgb565_is_0 = true,
+	.blend_modes = BIT(DRM_MODE_BLEND_COVERAGE),
 	.formats = mt8173_formats,
 	.num_formats = ARRAY_SIZE(mt8173_formats),
 };
@@ -695,6 +695,7 @@ static const struct mtk_disp_ovl_data mt8183_ovl_driver_data = {
 	.gmc_bits = 10,
 	.layer_nr = 4,
 	.fmt_rgb565_is_0 = true,
+	.blend_modes = BIT(DRM_MODE_BLEND_COVERAGE),
 	.formats = mt8173_formats,
 	.num_formats = ARRAY_SIZE(mt8173_formats),
 };
@@ -704,6 +705,7 @@ static const struct mtk_disp_ovl_data mt8183_ovl_2l_driver_data = {
 	.gmc_bits = 10,
 	.layer_nr = 2,
 	.fmt_rgb565_is_0 = true,
+	.blend_modes = BIT(DRM_MODE_BLEND_COVERAGE),
 	.formats = mt8173_formats,
 	.num_formats = ARRAY_SIZE(mt8173_formats),
 };

---
base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
change-id: 20261118-rbrue-suez-mtk-ovl-coverage-198c11ba8b14

Best regards,
-- 
Ryan Brue <ryanbrue.dev@gmail.com>


