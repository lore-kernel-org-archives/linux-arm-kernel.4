Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19798606A6D9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 20:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=H3MuoeoR;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sDYGS9tU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=T9Xx4usP8rm74KCRP+cc35Zk5oNMrUUP5XG8xRlvNZA=; b=H3MuoeoREVZ0pY3ENSQ1H+wemI
	PkZeh7z+MbEAqSRmmg/ghynh2rvAMXTIcu58vvo+FP5P6aagOVYPfNMzRoaoo6F4vkrxWu6m7ZcW8
	6VHmwLfYjxsuW9dKlpmmCikhGP9qisW+z9g+1BxMY2O7C1eot43I50nSPy5fF0oVgdrVSiHppqvFR
	BMuaC2gKNaHdYg6UniPPno37LUOCMt0pIEkLNEt4tihe3T1ch5tzNDB4BCsws+4a1li/5INgXu2xJ
	epI50G/CpU8APA9u8JA99k++nFtuzcR8GOPmApqklH547MJnD7Qyc64xrzRBcEkoRkmpfSjWWRLCj
	r4o+4yRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUUrL-0000000GBa6-3Zs0;
	Fri, 20 Nov 2026 20:05:24 +0000
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUUrH-0000000GBYi-31So
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 20:05:22 +0000
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-4932b13c4ccso801658fac.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 12:05:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795205118; x=1795809918; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=T9Xx4usP8rm74KCRP+cc35Zk5oNMrUUP5XG8xRlvNZA=;
        b=sDYGS9tUIkpfLQ2TABnAvK6KkAblfCwqrC/jsRJtjLDnbmPcDOIZwLtAOxCDCcHKBT
         fBYFf9YEqqTE022KCN3tdx2jo/K/2LoBxJgPUE/61pLOx4cS/pRPgFLbh9gJ/+MlxBf1
         LhiI+fCBiqwo+IWhVlilLRvrA22jp4RbXFMYTQOoDMN+Ol5vdLCI3PWYlQ3aqw6Y5SgG
         OFyGJnoi6CKTDiFK1Hx4OXRFKTj/pffbrpIaNaZIHXoGcowZkW/Jm3LKBaS3jTRbQTUd
         lvQ/IuGmxk9KyqXw5LuJyjUFAs4b8x+dFYhQmwtJj+QRHVrorbmwpIvZaSKdFGeuWUSm
         yK+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795205118; x=1795809918;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=T9Xx4usP8rm74KCRP+cc35Zk5oNMrUUP5XG8xRlvNZA=;
        b=OPzz/Ph6GSfL8BvMmeeEouuQD1CJs92f8Q5ZcS1GwCyWcSgw/eXXyiNRCE24tmmHkO
         tJzD1Tn2+6n7dPqzCSdEDGUiowl/Zc3U6w+2v9hlsQeQMyDyiwsWnFmh0cFTOpyzIwiU
         6/Koyy+Y3hRyFE5h6qE8SEx28KlwmcmiLngh4f573Vfl6ZdbqsZJv7llmnpb347Y0cAA
         rOqEVMOIsC8ckf1aAA+MB60VZQ90MYZA7aRUEke9pndangQgKp5FK0WMrJXVV+ijZ0rj
         mkjpA/pPBlSDyACX94+PXfSW0ptsteFHQTaljnUSORqD12zsetNYQ5+lfRPEgUOxtvf+
         Q39Q==
X-Forwarded-Encrypted: i=1; AL+hErG43VNKipP3erD7xAQ97QUMntkI1mUIgFZknxLn8o+A2VNWnJVrHbCdUUXJuVwmB2B1YULTqJG9klBqN6aMKfmL@lists.infradead.org
X-Gm-Message-State: APuU4Z8iTUoY7b45LLl1BFE0fBk6xRfYLrzBh6ECE8iQG8C3SO9MzNig
	GR14R3l31QcxxDgSRL9uMYMQaBb3Wzawq05sAaSDnKyolOKYHAOkPDu7
X-Gm-Gg: AZFdTZedGgWW686riJxmYeMW0pdEhxlBOP+m7drL3uRM9VhsZx0gOtR2rYrphTdxGKV
	eEk3eM14phKRwrovrWClEMrT37S0t6bt0/syCREhaifD3ArEup6QrR8rwjdiFnZh/j3kZ6Rovu6
	6fHxoj0c1hKUnKgt3wBbZ4uvXWqt4G71/bBedkqgTED25KqXMCwBb03JuV/jg9HS5azNI+nXEDs
	OZcc+89pQD04OAFcXI9kAeayZbt4h7scMBChrsi9mzi4ZBqGMkXcSkkiSLfCim0EY6Olo7z4XCn
	6G96JTTBRKOnG+2shRdjKeVo8ApQERMDPTcOFXhH4rCebi7XHiy042LiWhxKJq7wzRLzHjq9cK7
	lzYcSk5si9iGQ4FfT1ywpnOjHe+N+e0oRBKvphlB/c2ueqBIj3EhImhZoz+WsCdeVksUTen94Vz
	nxYCKpohKslKK4X8Jy6dLHAhBtGDRFYwEeWOOcZQ1HoZ3UrX28fZOBEWYpyTCrs5AFxdly9lXp2
	c4Xw8Yb09I+8lQrjkdcOSG8xYvE90WlrLkOepkIfiz82HZWw+vo9dhNqAeDRSlYWgfdwrsyamgC
	L49sKZGnZlpHQvmlgliSCWxBw1bv08MJ23THWBgW2zeKNNLFakuJqBjFBLqB6tCs8fCEmxyJjpt
	y1rg+W/bQzgopDYX4wFA=
X-Received: by 2002:a05:6870:4db:b0:4ad:8d9f:98a3 with SMTP id 586e51a60fabf-4bc87de13e3mr3153094fac.35.1795205118467;
        Fri, 20 Nov 2026 12:05:18 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc5edc52aasm4122200fac.4.2026.11.20.12.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 12:05:17 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Fri, 20 Nov 2026 14:05:16 -0600
Subject: [PATCH] drm/mediatek: ovl: Report coverage blending on older SoCs
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-rbrue-suez-mtk-ovl-coverage-v1-1-35040085fc37@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/x3MUQrCMAwG4KuEPC9ghkjtVcSHtv7OoK6SuiKO3
 V3wO8C3coMbGkda2dGtWZ05kg7E5ZbmCWIXjsTjbjyoahDPvkDagq8833ep/SGldniaIHoMRTW
 nkHXPA/HLcbXPfz+dt+0HCGu2Qm0AAAA=
X-Change-ID: 20261118-rbrue-suez-mtk-ovl-coverage-198c11ba8b14
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795205116; l=4367;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=h4Tvd2gLk6BmOFdUxw3JC3W2Yz6nDyqzW/jYqV5h1bo=;
 b=jygRYnIZ6A4BG1IGZuzzTo8JDeciKHrqpHygmrw7zjCsTulx4jjcQ4bzto4hZFbM6Q7yhLwFt
 4qkyVhGaLPOCo2whLDjeAKzLnJWJLoLWJ/JFUVijZG41BSFtOvQ8ye8
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_120520_537323_11E2EC72 
X-CRM114-Status: GOOD (  17.02  )
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

The plane state now defaults to Coverage instead of Pre-multiplied. Both
are non-zero, so mtk_ovl_layer_config() programs the same registers as
before.

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
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index 5445870716f9..81a4143f294d 100644
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
@@ -667,6 +663,7 @@ static const struct mtk_disp_ovl_data mt2701_ovl_driver_data = {
 	.gmc_bits = 8,
 	.layer_nr = 4,
 	.fmt_rgb565_is_0 = false,
+	.blend_modes = BIT(DRM_MODE_BLEND_COVERAGE),
 	.formats = mt8173_formats,
 	.num_formats = ARRAY_SIZE(mt8173_formats),
 };
@@ -677,6 +674,7 @@ static const struct mtk_disp_ovl_data mt8167_ovl_driver_data = {
 	.layer_nr = 4,
 	.fmt_rgb565_is_0 = true,
 	.smi_id_en = true,
+	.blend_modes = BIT(DRM_MODE_BLEND_COVERAGE),
 	.formats = mt8173_formats,
 	.num_formats = ARRAY_SIZE(mt8173_formats),
 };
@@ -686,6 +684,7 @@ static const struct mtk_disp_ovl_data mt8173_ovl_driver_data = {
 	.gmc_bits = 8,
 	.layer_nr = 4,
 	.fmt_rgb565_is_0 = true,
+	.blend_modes = BIT(DRM_MODE_BLEND_COVERAGE),
 	.formats = mt8173_formats,
 	.num_formats = ARRAY_SIZE(mt8173_formats),
 };
@@ -695,6 +694,7 @@ static const struct mtk_disp_ovl_data mt8183_ovl_driver_data = {
 	.gmc_bits = 10,
 	.layer_nr = 4,
 	.fmt_rgb565_is_0 = true,
+	.blend_modes = BIT(DRM_MODE_BLEND_COVERAGE),
 	.formats = mt8173_formats,
 	.num_formats = ARRAY_SIZE(mt8173_formats),
 };
@@ -704,6 +704,7 @@ static const struct mtk_disp_ovl_data mt8183_ovl_2l_driver_data = {
 	.gmc_bits = 10,
 	.layer_nr = 2,
 	.fmt_rgb565_is_0 = true,
+	.blend_modes = BIT(DRM_MODE_BLEND_COVERAGE),
 	.formats = mt8173_formats,
 	.num_formats = ARRAY_SIZE(mt8173_formats),
 };

---
base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
change-id: 20261118-rbrue-suez-mtk-ovl-coverage-198c11ba8b14

Best regards,
-- 
Ryan Brue <ryanbrue.dev@gmail.com>


