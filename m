Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107E8606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 13:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3aoB5eAR;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=VRSi1uR4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=fX568TPs8kUQKshLGJog/+ffqrba/CyBoJwfCKQyvrA=; b=3aoB5eARF4ysP4
	WTm1uSECKoTQRCCkJ4pZHIC7JoNPZnFgX4PlV3uuhnxKqh/Wga+DS1QqR0W/1NYbsfvoTg3LrZNmW
	xwmrzM3m85R4UtUey85QY3gijx7AbpcWEQF/5OXce3RyrdzDC7VPTYfD9uOfLyUsElpFIg5pvD5sj
	o+rmZgdVCYeYWLyP8I2ZWRm3UYxuuqd6anCcextMgy+SDzLIVaIhi2hi37bkEtMQUtlWH0d9LtoTs
	Y0SF6bxgPKRQF6XQK8iD+muY+AGDV5K68meI5UHNIlH8RJHZqisXHuSYh5HScFyXHHEAKRPc8hRuN
	g9csp2J/bkTK9k01H83Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVqPu-00000006bqi-3gBi;
	Tue, 24 Nov 2026 13:18:39 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVqPi-00000006blE-3WAs;
	Tue, 24 Nov 2026 13:18:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795526304;
	bh=6ENyECno82An4Ck9+sSE8OK/4a0UVg9XeBvynkWIlPc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VRSi1uR48b79xZq7LJecZtYkn4eis9B+qFfOcpAYGq5SB7a1X5YZrQ+pOxpWKgeuG
	 5Z4s7OHMBCrJ8Jj0ZDTKe2vwDyiv7aZSBByd8UFuTnJ+l7jue7LG3wV3OCXPSBNYKF
	 EednPNaj3N+00+iNH59fko2ZHdUbRioSKkeormq0pwsoHRLYk0l6ZSNFsU00wtOgH9
	 RV2vJBa9GZx+/tzxXMbCb62xHnZ+AucBOVStYvl8mlf8o5Qz/8/D8pb5qbGAZUThBr
	 TDocy+5AIfyaBa6Y6m752iD0hTWbc6zGHHLoui1ONPya0aUEaICYzF9OqepmObCMae
	 WTgHSZfQCbG2w==
Received: from benjamin-XPS-13-9310.home (unknown [100.64.1.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A91AB17E0BCD;
	Tue, 24 Nov 2026 14:18:23 +0100 (CET)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: nicolas.dufresne@collabora.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org,
	heiko@sntech.de,
	hverkuil@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v8 1/3] media: v4l2-ctrls: validate AV1 reference frame index
Date: Tue, 24 Nov 2026 14:18:14 +0100
Message-ID: <20261124131816.115131-2-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261124131816.115131-1-benjamin.gaignard@collabora.com>
References: <20261124131816.115131-1-benjamin.gaignard@collabora.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_051827_029577_1D89A2FB 
X-CRM114-Status: GOOD (  14.75  )
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

The stateless AV1 decoders use primary_ref_frame and ref_frame_idx[] to
to find the matching reference frames.
V4L2_AV1_PRIMARY_REF_NONE is the value of primary_ref_frame indicating
that there is no primary reference frame.
Reject invalid indexes to avoid issues in the drivers while validate other
frame parameters.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
changes in v8
- check reference frame index when validating the frame before
  calling the driver.

 .../verisilicon/rockchip_vpu981_hw_av1_dec.c  |  3 +--
 drivers/media/v4l2-core/v4l2-ctrls-core.c     | 20 +++++++++++++++++++
 include/uapi/linux/v4l2-controls.h            |  1 +
 3 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
index 2a145433e6d1..bbfca34688eb 100644
--- a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
+++ b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
@@ -20,7 +20,6 @@
 #define AV1_REF_SCALE_SHIFT	14
 #define AV1_INVALID_IDX		-1
 #define MAX_FRAME_DISTANCE	31
-#define AV1_PRIMARY_REF_NONE	7
 #define AV1_TILE_SIZE		ALIGN(32 * 128, 4096)
 /*
  * These 3 values aren't defined enum v4l2_av1_segment_feature because
@@ -1256,7 +1255,7 @@ static void rockchip_vpu981_av1_dec_set_prob(struct hantro_ctx *ctx)
 	bool frame_is_intra = IS_INTRA(frame->frame_type);
 
 	if (error_resilient_mode || frame_is_intra ||
-	    frame->primary_ref_frame == AV1_PRIMARY_REF_NONE) {
+	    frame->primary_ref_frame == V4L2_AV1_PRIMARY_REF_NONE) {
 		av1_dec->cdfs = &av1_dec->default_cdfs;
 		av1_dec->cdfs_ndvc = &av1_dec->default_cdfs_ndvc;
 		rockchip_av1_default_coeff_probs(quantization->base_q_idx,
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index 6e751a043a21..f4c2a04fb721 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -817,10 +817,30 @@ static int validate_av1_tile_info(struct v4l2_av1_tile_info *t)
 	return 0;
 }
 
+static int validate_av1_reference_index(struct v4l2_ctrl_av1_frame *f)
+{
+	int idx;
+
+	if (f->primary_ref_frame > V4L2_AV1_PRIMARY_REF_NONE)
+		return -EINVAL;
+
+	if (f->primary_ref_frame == V4L2_AV1_PRIMARY_REF_NONE)
+		return 0;
+
+	idx = f->ref_frame_idx[f->primary_ref_frame];
+	if (idx < 0 || idx >= V4L2_AV1_TOTAL_REFS_PER_FRAME)
+		return -EINVAL;
+
+	return 0;
+}
+
 static int validate_av1_frame(struct v4l2_ctrl_av1_frame *f)
 {
 	int ret = 0;
 
+	ret = validate_av1_reference_index(f);
+	if (ret)
+		return ret;
 	ret = validate_av1_tile_info(&f->tile_info);
 	if (ret)
 		return ret;
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index d17e41d51d2e..82023fbffd6a 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -2940,6 +2940,7 @@ struct v4l2_ctrl_vp9_compressed_hdr {
 #define V4L2_AV1_MAX_TILE_COLS		64
 #define V4L2_AV1_MAX_TILE_ROWS		64
 #define V4L2_AV1_MAX_TILE_COUNT		512
+#define V4L2_AV1_PRIMARY_REF_NONE	7
 
 #define V4L2_AV1_SEQUENCE_FLAG_STILL_PICTURE		  0x00000001
 #define V4L2_AV1_SEQUENCE_FLAG_USE_128X128_SUPERBLOCK	  0x00000002
-- 
2.53.0


