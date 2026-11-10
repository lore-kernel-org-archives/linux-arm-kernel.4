Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2704606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 10:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=V8TkOR/i;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M60kRYMi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=OIAwUPeDgVAUQjZJJHRxiVdb/6E99UF+PPnk9SItYZU=; b=V8TkOR/i8U8UHrr36AEdB+tiJb
	POe5FUufdLXH1FH8wN3BTJgXhRYxyB1/SzGunWZVSLSym3eNhp4jEHXCWe80BUcxwBRbsGD0YF+eB
	8w5POzmMBOg63w9B9QGszI6BqAqxThjAwIHhBHIhKNjJCbCNIX4YKUvYNZRhYk9KcOeLo4ktdfa2G
	8aVpy53p/hdoUlKfCdZVClhnOsAE+0qckNofWQo4GP0VBkAkdYMRAmSZUVuRiWDzsodW1rVkkSPVY
	L9yY4dZptCWwANWD1z83dmSHI9/RQlXSTRl173egys1Tpz0ysXGismciIJVD5ldT424jl8GXsEZo1
	at6v3GVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQilv-00000003OKs-1Cz9;
	Tue, 10 Nov 2026 10:08:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQils-00000003OIW-0eic;
	Tue, 10 Nov 2026 10:08:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E2B974365C;
	Tue, 10 Nov 2026 10:08:07 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794305287;
	b=Pdir/ogTOow7zQtWloTf1PBjv/W5je8sWZiG9TlmP/idzdnOM+HCdptHCGqq1BOVIte6
	 +0dlP73C1O/aCQ2Brn5Ae48PeFiab6u0zm1tK6BXd7LS1XTRemdGhyk0l0jkQvKYHxZdi
	 3P16c5V0knRrToPMoPySdI2FYsBKfEe4Y2JTMckj4tl3G908uO3/WbHYDgVNDiFQKxguc
	 mn7JatlIRH7SFk59UoAnfr45sT5t+3cNIAkrTg5y2ufUGaczeuTT8tE4jA43eo6KX8cNA
	 Mbon+oNvPQ8EmBCmmMsW7gu5K0X6x1BjfMd8aMuNAilxF/uF5QYiFXkNOmuG+2ExnYg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794305287;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=OIAwUPeDgVAUQjZJJHRxiVdb/6E99UF+PPnk9SItYZU=;
	b=VdlDaI+FYAaVEsX/YuuQXli5wO1KcdRRgi2FkFl1jBooomG6jUpHdDHB/+ntj81kOk1f
	 nA2xLpm1WvdyU52v3esO6W0DOV3MqMqqXGd0EweUbPRJTts1slicBwxS0uVA7GZHRyVdt
	 Sam8k4LcjH0s8gb+0RbAGjFR2Y5YigYDl7xlkGQoO1VgR1FO8nIPusR8LFvRI8GSiHyve
	 myPKP3Fp7hM6yWXN48UvqJBYJEiSEg0VSe0xurPQdimBqHcqKfUnucf5zgBwwkL6sy08H
	 ayqBR7tksDcFTARBU28oUw2iOKA6TCwS7rHsMKSDmhdDqsfmWHsghh6AcjnufltcGHw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EC0331F008AB;
	Tue, 10 Nov 2026 10:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794305287;
	bh=OIAwUPeDgVAUQjZJJHRxiVdb/6E99UF+PPnk9SItYZU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=M60kRYMi/Wgxu81XaBo+pna3RfTAmoy7boC4YFN81lzf23rSKS/yO1DBPJlgKmLxe
	 o6rQaewquSrobtFeoHheAZNkRd/fdEOzqCXh/r4rC9UUMBg2kHl2HCj94EdxT3q4wK
	 H527Y+iaxOrAqjHprCYOt2BXBNE5F5MUrvtmS1aY5FMZVixs4FSmcrn8f1HtREUjkH
	 ZokoqXCU4sTI06k58q8nVqJ3XUw6e4ZHCc4HJsuZ8UBlTL2f2ZXyVRK/vCehOJw5Gs
	 vRn6422SKVdkMPTzjj8brgsC7OJS2MtUciWI7Uj5z69d2aHRCNeve+ntX+AwgbGd2u
	 h14BXRP/sFMfw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A49CB48AD7;
	Tue, 10 Nov 2026 10:08:04 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 10:08:08 +0000
Subject: [PATCH RFC 06/12] media: rockchip: rkvenc: Use MPP's moving-scene
 H.264 RDO tuning
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261110-rkvenc-v1-6-ea8b47122d8c@gmail.com>
References: <20261110-rkvenc-v1-0-ea8b47122d8c@gmail.com>
In-Reply-To: <20261110-rkvenc-v1-0-ea8b47122d8c@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Paul Kocialkowski <paulk@sys-base.io>, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Detlev Casanova <detlev.casanova@collabora.com>, 
 Hans Verkuil <hverkuil@kernel.org>, Jiaxing Hu <gahing@gahingwoo.com>, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794305283; l=10003;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=2mw4fp9eMoAO0CrQU4c2+B4z7EEsgAFGVFEXM/O20kw=;
 b=paoNF5ZudwK6p2Tk8iSHdHtRSgGEssYY+DzItu9+ZFZHhMj3nI7cnOo7udY2cJ6Aa+qMMDax7
 csnbLh0nHsCBmefgjQ4Hux9wTu+dQZSZGref7gjPs7QmraPewaUy/I8
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: aiyengar1990@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Arun Iyengar <aiyengar1990@gmail.com>

The H.264 mode decision and motion search registers had the values of
MPP's still-scene tuning set. MPP keeps two sets and switches per picture
from a motion detector (hal_h264e_vepu580_tune.c): the still-scene one
biases the decision towards intra and skip blocks and toward the zero
motion vector against flicker in surveillance video; the moving-scene
one is neutral: ATF weights 16, ATR weights 20, CIME/RIME cost
multipliers 4, no anti-flicker skip or intra, zero PMV off, no CIME SAD
early exits, move lambda 8, P dead zone 341/1024, ATR QP threshold 51,
intra cost thresholds 0 and the intra chroma weights.

Use the moving-scene set for every picture, and start the RDO lambda
table one entry lower than MPP (index 5, lambda / 2^(1/3)). At a fixed QP
(22-36, 1080p60 clips) this needs 7% (animation) to 11% (natural video)
fewer bits for the same PSNR-Y than the still-scene set with MPP's
lambda.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 .../media/platform/rockchip/rkvenc/rkvenc-h264.c   |  3 +-
 .../platform/rockchip/rkvenc/rkvenc-vepu580.c      | 79 +++++++++++-----------
 2 files changed, 41 insertions(+), 41 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvenc/rkvenc-h264.c b/drivers/media/platform/rockchip/rkvenc/rkvenc-h264.c
index 227d341d060b..665c54278029 100644
--- a/drivers/media/platform/rockchip/rkvenc/rkvenc-h264.c
+++ b/drivers/media/platform/rockchip/rkvenc/rkvenc-h264.c
@@ -333,8 +333,7 @@ static void rkvenc_h264_setup_syntax(struct rkvenc_core *core,
 	rkvenc_set(core, VEPU580_H264_SYNT_REFM2, 0);
 
 	val = VEPU580_RDO_CFG_INTER_4X4 | VEPU580_RDO_CFG_CHRM_SPCL |
-	      VEPU580_RDO_CFG_CCWA_E | VEPU580_RDO_CFG_ATR_E |
-	      VEPU580_RDO_CFG_ATF_INTRA_E;
+	      VEPU580_RDO_CFG_CCWA_E | VEPU580_RDO_CFG_ATR_E;
 	if (sps->profile_idc == RKVENC_H264_PROFILE_BASELINE &&
 	    sps->level_idc <= 30)
 		val |= VEPU580_RDO_CFG_RECT_SIZE;
diff --git a/drivers/media/platform/rockchip/rkvenc/rkvenc-vepu580.c b/drivers/media/platform/rockchip/rkvenc/rkvenc-vepu580.c
index 86703dc659f6..f14d5ae0b7f7 100644
--- a/drivers/media/platform/rockchip/rkvenc/rkvenc-vepu580.c
+++ b/drivers/media/platform/rockchip/rkvenc/rkvenc-vepu580.c
@@ -336,12 +336,18 @@ void vepu580_setup_h264_tuning(struct rkvenc_dev *rkvenc,
 	const s8 *aq_step = intra ? vepu580_aq_step_i : vepu580_aq_step_p;
 	unsigned int i;
 
-	/* Intra prediction cost / mode decision */
-	rkvenc_set(core, VEPU580_IPRD_CSTS,
-		   FIELD_PREP(VEPU580_IPRD_CSTS_VTHD_Y, 9) |
-		   FIELD_PREP(VEPU580_IPRD_CSTS_VTHD_C, 63));
+	/*
+	 * MPP has two H.264 tuning sets and picks one per picture from a
+	 * motion detector: one for still scenes (surveillance cameras), which
+	 * biases the mode decision towards intra and skip blocks against
+	 * flicker, and a neutral one for moving content. The neutral one is
+	 * used for every picture: at the same QP it needs 7-11% fewer bits
+	 * for the same PSNR on moving clips. With it the intra prediction
+	 * cost thresholds are 0 and the chroma weights start at entry 0.
+	 */
+	rkvenc_set(core, VEPU580_IPRD_CSTS, 0);
 
-	vepu580_setup_klut(core, intra);
+	vepu580_setup_klut(core, true);
 
 	rkvenc_set(core, VEPU580_MADI_CFG, FIELD_PREP(VEPU580_MADI_CFG_MADI_THD, 25));
 	rkvenc_set(core, VEPU580_MD_SAD_THD, pack4(4, 9, 15, 0));
@@ -363,23 +369,23 @@ void vepu580_setup_h264_tuning(struct rkvenc_dev *rkvenc,
 	rkvenc_set(core, VEPU580_LVL16_INTRA_CST_THD1, pack2x12(9, 36));
 	rkvenc_set(core, VEPU580_LVL8_INTRA_CST_THD0, pack2x12(1, 4));
 	rkvenc_set(core, VEPU580_LVL8_INTRA_CST_THD1, pack2x12(9, 36));
-	rkvenc_set(core, VEPU580_LVL16_INTRA_UL_CST_THD, 0);
+	rkvenc_set(core, VEPU580_LVL16_INTRA_UL_CST_THD, 2501);
 	rkvenc_set(core, VEPU580_LVL32_INTRA_CST_WGT0, pack4(48, 60, 40, 48));
 	rkvenc_set(core, VEPU580_LVL32_INTRA_CST_WGT1, pack4(48, 60, 40, 48));
 	rkvenc_set(core, VEPU580_LVL16_INTRA_CST_WGT0, pack4(48, 60, 40, 48));
 	rkvenc_set(core, VEPU580_LVL16_INTRA_CST_WGT1, pack4(36, 42, 28, 32));
 
-	/* Quantisation dead zone: 683/1024 (I) or 583/1024, 171/1024 (P) */
+	/* Quantisation dead zone: 683/1024 (I) or 583/1024, 341/1024 (P) */
 	rkvenc_set(core, VEPU580_RDO_QUANT,
 		   FIELD_PREP(VEPU580_RDO_QUANT_F_BIAS_I, intra ? 683 : 583) |
-		   FIELD_PREP(VEPU580_RDO_QUANT_F_BIAS_P, 171));
+		   FIELD_PREP(VEPU580_RDO_QUANT_F_BIAS_P, 341));
 
 	/* Adaptive transform (H.264 only) */
 	if (intra) {
 		rkvenc_set(core, VEPU580_ATR_THD0, pack2x12(1, 4));
 		rkvenc_set(core, VEPU580_ATR_THD1,
 			   FIELD_PREP(VEPU580_ATR_THD1_THD2, 36) |
-			   FIELD_PREP(VEPU580_ATR_THD1_THDQP, 45));
+			   FIELD_PREP(VEPU580_ATR_THD1_THDQP, 51));
 		rkvenc_set(core, VEPU580_LVL16_ATR_WGT, pack4(16, 16, 16, 0));
 		rkvenc_set(core, VEPU580_LVL8_ATR_WGT, pack4(22, 21, 20, 0));
 		rkvenc_set(core, VEPU580_LVL4_ATR_WGT, pack4(20, 18, 16, 0));
@@ -387,19 +393,15 @@ void vepu580_setup_h264_tuning(struct rkvenc_dev *rkvenc,
 		rkvenc_set(core, VEPU580_ATR_THD0, pack2x12(4, 16));
 		rkvenc_set(core, VEPU580_ATR_THD1,
 			   FIELD_PREP(VEPU580_ATR_THD1_THD2, 81) |
-			   FIELD_PREP(VEPU580_ATR_THD1_THDQP, 45));
-		rkvenc_set(core, VEPU580_LVL16_ATR_WGT, pack4(22, 19, 16, 0));
-		rkvenc_set(core, VEPU580_LVL8_ATR_WGT, pack4(22, 19, 18, 0));
-		rkvenc_set(core, VEPU580_LVL4_ATR_WGT, pack4(22, 19, 16, 0));
+			   FIELD_PREP(VEPU580_ATR_THD1_THDQP, 51));
+		rkvenc_set(core, VEPU580_LVL16_ATR_WGT, pack4(20, 20, 20, 0));
+		rkvenc_set(core, VEPU580_LVL8_ATR_WGT, pack4(20, 20, 20, 0));
+		rkvenc_set(core, VEPU580_LVL4_ATR_WGT, pack4(20, 20, 20, 0));
 	}
 
-	/*
-	 * Motion search quality / cost multipliers. Where MPP's tuning differs
-	 * per scene mode, the values of its default (non-IPC) mode are used.
-	 */
+	/* Motion search quality / cost multipliers (neutral set) */
 	rkvenc_set(core, VEPU580_CIME_SQI_CFG,
 		   VEPU580_CIME_SQI_CFG_SAD_BIG_BLOCK |
-		   VEPU580_CIME_SQI_CFG_PMV_SET_ZERO |
 		   FIELD_PREP(VEPU580_CIME_SQI_CFG_PMV_NUM, 3));
 	rkvenc_set(core, VEPU580_CIME_SQI_THD,
 		   FIELD_PREP(VEPU580_CIME_SQI_THD_MVD_TH0, 32) |
@@ -407,49 +409,48 @@ void vepu580_setup_h264_tuning(struct rkvenc_dev *rkvenc,
 		   FIELD_PREP(VEPU580_CIME_SQI_THD_MVD_TH2, 128));
 	rkvenc_set(core, VEPU580_CIME_SQI_MULTI0,
 		   FIELD_PREP(VEPU580_CIME_SQI_MULTI_LO, 4) |
-		   FIELD_PREP(VEPU580_CIME_SQI_MULTI_HI, 7));
+		   FIELD_PREP(VEPU580_CIME_SQI_MULTI_HI, 4));
 	rkvenc_set(core, VEPU580_CIME_SQI_MULTI1,
-		   FIELD_PREP(VEPU580_CIME_SQI_MULTI_LO, 20) |
-		   FIELD_PREP(VEPU580_CIME_SQI_MULTI_HI, 20));
+		   FIELD_PREP(VEPU580_CIME_SQI_MULTI_LO, 4) |
+		   FIELD_PREP(VEPU580_CIME_SQI_MULTI_HI, 4));
 	rkvenc_set(core, VEPU580_RIME_SQI_THD,
-		   FIELD_PREP(VEPU580_RIME_SQI_THD_CIME_SAD_TH0, 50) |
 		   FIELD_PREP(VEPU580_RIME_SQI_THD_MVD_TH0, 3) |
 		   FIELD_PREP(VEPU580_RIME_SQI_THD_MVD_TH1, 8));
 	rkvenc_set(core, VEPU580_RIME_SQI_MULTI,
 		   FIELD_PREP(VEPU580_RIME_SQI_MULTI0, 4) |
-		   FIELD_PREP(VEPU580_RIME_SQI_MULTI1, 16) |
-		   FIELD_PREP(VEPU580_RIME_SQI_MULTI2, 64));
-	rkvenc_set(core, VEPU580_FME_SQI_THD0,
-		   FIELD_PREP(VEPU580_FME_SQI_THD0_PU16_TH, 2));
+		   FIELD_PREP(VEPU580_RIME_SQI_MULTI1, 4) |
+		   FIELD_PREP(VEPU580_RIME_SQI_MULTI2, 4));
+	rkvenc_set(core, VEPU580_FME_SQI_THD0, 0);
 	rkvenc_set(core, VEPU580_FME_SQI_THD1,
-		   FIELD_PREP(VEPU580_FME_SQI_THD1_MOVE_LAMBDA, 1));
+		   FIELD_PREP(VEPU580_FME_SQI_THD1_MOVE_LAMBDA, 8));
 
-	/* RDO lambda, intra prediction weights stay zero for H.264 */
+	/*
+	 * RDO lambda, intra prediction weights stay zero for H.264. MPP
+	 * starts at entry 6 (its lambda_idx); entry 5, one 2^(1/3) step
+	 * lower, saves 3-4% of the bits at the same PSNR.
+	 */
 	for (i = 0; i < 52; i++)
-		rkvenc_set(core, VEPU580_RDO_WGTA_QP(i), vepu580_h264_lambda[i + 6]);
+		rkvenc_set(core, VEPU580_RDO_WGTA_QP(i), vepu580_h264_lambda[i + 5]);
 
-	/* RDO intra / skip thresholds and weights */
-	rkvenc_set(core, VEPU580_RDO_SQI_CFG, VEPU580_RDO_SQI_CFG_ATF_PSKIP_EN);
+	/* RDO intra / skip thresholds and weights; no anti-flicker skips */
+	rkvenc_set(core, VEPU580_RDO_SQI_CFG, 0);
 	rkvenc_set(core, VEPU580_RDO_INTRA_CIME_THD0, pack2x12(28, 44));
 	rkvenc_set(core, VEPU580_RDO_INTRA_CIME_THD1, pack2x12(72, 0));
 	rkvenc_set(core, VEPU580_RDO_INTRA_VAR_THD(0), pack2x12(25, 64));
 	rkvenc_set(core, VEPU580_RDO_INTRA_VAR_THD(1), pack2x12(25, 64));
 	rkvenc_set(core, VEPU580_RDO_INTRA_VAR_THD(2), pack2x12(70, 100));
 	rkvenc_set(core, VEPU580_RDO_INTRA_VAR_THD(3), pack2x12(70, 100));
-	rkvenc_set(core, VEPU580_RDO_INTRA_ATF_WGT(0), pack4(22, 21, 20, 0));
-	rkvenc_set(core, VEPU580_RDO_INTRA_ATF_WGT(1), pack4(21, 20, 19, 0));
-	rkvenc_set(core, VEPU580_RDO_INTRA_ATF_WGT(2), pack4(20, 19, 18, 0));
-	rkvenc_set(core, VEPU580_RDO_INTRA_ATF_WGT(3), pack4(16, 16, 16, 0));
+	for (i = 0; i < 4; i++)
+		rkvenc_set(core, VEPU580_RDO_INTRA_ATF_WGT(i), pack4(16, 16, 16, 0));
 	rkvenc_set(core, VEPU580_RDO_SKIP_CIME_THD0, pack2x12(10, 8));
 	rkvenc_set(core, VEPU580_RDO_SKIP_CIME_THD1, pack2x12(15, 25));
 	rkvenc_set(core, VEPU580_RDO_SKIP_VAR_THD(0), pack2x12(25, 40));
 	rkvenc_set(core, VEPU580_RDO_SKIP_VAR_THD(1), pack2x12(25, 40));
 	rkvenc_set(core, VEPU580_RDO_SKIP_VAR_THD(2), pack2x12(70, 100));
 	rkvenc_set(core, VEPU580_RDO_SKIP_VAR_THD(3), pack2x12(70, 100));
-	rkvenc_set(core, VEPU580_RDO_SKIP_ATF_WGT(0), pack4(20, 16, 16, 16));
-	rkvenc_set(core, VEPU580_RDO_SKIP_ATF_WGT(1), pack4(16, 16, 16, 0));
-	rkvenc_set(core, VEPU580_RDO_SKIP_ATF_WGT(2), pack4(16, 16, 16, 0));
-	rkvenc_set(core, VEPU580_RDO_SKIP_ATF_WGT(3), pack4(16, 16, 16, 0));
+	rkvenc_set(core, VEPU580_RDO_SKIP_ATF_WGT(0), pack4(16, 16, 16, 16));
+	for (i = 1; i < 4; i++)
+		rkvenc_set(core, VEPU580_RDO_SKIP_ATF_WGT(i), pack4(16, 16, 16, 0));
 
 	/* Flat quantisation tables */
 	memcpy(&core->shadow[VEPU580_SCL_START / 4], rkvenc->h264_scl,

-- 
2.55.0



