Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11228606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 12:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GHq8VvUS;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=HZSCIy+9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=PQRMYI9tnhaBvI/6kmFgrOXV3yQe8Sw/Kuz6pgX98xY=; b=GHq8VvUS+R+c93
	dJ7cGxMd/i7NEu3GaaXx5dchtz3KzwbRfkaaDodu+G7iG1TyD+bJ9KfpCi7XdAkNlFTiz4svG+9BY
	kogc9lKcNatW69kC4PJwehYD1ENTq0sn3+1hoJ7zf8IG5wJLio2BRSFteIxxJVtYYM87gUCaXdVPm
	/1Q5PMheLx6nVEK3cLqFc7C6BBd4Iw7gwRDl357ZSZwEjrmFXqrcLdWEfoOQc2XJUUaPKsJy/6vK4
	MVVo3NMJkSa5pbERe2/EPS7T38d20nMb5Qf2g3/dAJGvSGC/alXXmdHJN9DUrJQ6kzVgvQ6/bkWl6
	IoeizUV7kBmptsyKiwwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWC7F-00000009pV9-0oxz;
	Wed, 25 Nov 2026 12:28:49 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWC6z-00000009pS9-1w5O;
	Wed, 25 Nov 2026 12:28:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795609711;
	bh=hTf3zxsVBwsVNKc4ojFf+pNyJt/ggID91ntX83wBxus=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HZSCIy+9zIPs6+qNw+nYBuF38ApHD1crxEQo2k7ZfUXsbfoGCQjADwHakL90OpIKv
	 hTGdlSopRcZBd5/r1KRlEejt2jx5R3chv++qy3KxV+d4/51pRfUh7ZyRAa+zhuAVMO
	 YWiPiGsTXYxeMFhThyd0UgsvFvJ+FC4y3VpcBjUPnNpPXwjGGZrXQVKCPl0NH5EjKZ
	 B93e45Z36Ccj/aYOxtGCOcXMuOVSAhX1O5Ylq+YJJ/8naLZgo1uyBtmjHteSBGwvV0
	 wUWSnKAgGM35VlHzgI1bh5vnwAN9Pi2v893byb89PE0wpfjYzBPQ5wLrNHnbqPHTQZ
	 eMSm3twpR9T2A==
Received: from benjamin-XPS-13-9310.home (unknown [100.64.1.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6995F17E0311;
	Wed, 25 Nov 2026 13:28:31 +0100 (CET)
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
Subject: [PATCH v9 2/4] media: verisilicon: Use V4L2_AV1_PRIMARY_REF_NONE and V4L2_AV1_REF_FRAME_INVALID
Date: Wed, 25 Nov 2026 13:28:23 +0100
Message-ID: <20261125122825.236422-3-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125122825.236422-1-benjamin.gaignard@collabora.com>
References: <20261125122825.236422-1-benjamin.gaignard@collabora.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_042837_110202_631ABD57 
X-CRM114-Status: GOOD (  13.34  )
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

Use V4L2_AV1_PRIMARY_REF_NONE and V4L2_AV1_REF_FRAME_INVALID instead
of local definition.
Since ref_frame_idx[] values have been checked inside v4l2-ctrl-core.c
remove the useless duplicate check.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
changes in v9:
- Split core changes and drivers changes
- Use V4L2_AV1_REF_FRAME_INVALID

 .../verisilicon/rockchip_vpu981_hw_av1_dec.c       | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
index 2a145433e6d1..087a944b3394 100644
--- a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
+++ b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
@@ -18,9 +18,7 @@
 #define AV1_TILE_INFO_SIZE	(AV1_MAX_TILES * 16)
 #define AV1DEC_MAX_PIC_BUFFERS	24
 #define AV1_REF_SCALE_SHIFT	14
-#define AV1_INVALID_IDX		-1
 #define MAX_FRAME_DISTANCE	31
-#define AV1_PRIMARY_REF_NONE	7
 #define AV1_TILE_SIZE		ALIGN(32 * 128, 4096)
 /*
  * These 3 values aren't defined enum v4l2_av1_segment_feature because
@@ -123,8 +121,8 @@ static int rockchip_vpu981_get_frame_index(struct hantro_ctx *ctx, int ref)
 	u64 timestamp;
 	int i, idx = frame->ref_frame_idx[ref];
 
-	if (idx >= V4L2_AV1_TOTAL_REFS_PER_FRAME || idx < 0)
-		return AV1_INVALID_IDX;
+	if (idx < 0)
+		return V4L2_AV1_REF_FRAME_INVALID;
 
 	timestamp = frame->reference_frame_ts[idx];
 	for (i = 0; i < AV1_MAX_FRAME_BUF_COUNT; i++) {
@@ -134,7 +132,7 @@ static int rockchip_vpu981_get_frame_index(struct hantro_ctx *ctx, int ref)
 			return i;
 	}
 
-	return AV1_INVALID_IDX;
+	return V4L2_AV1_REF_FRAME_INVALID;
 }
 
 static int rockchip_vpu981_get_order_hint(struct hantro_ctx *ctx, int ref)
@@ -142,7 +140,7 @@ static int rockchip_vpu981_get_order_hint(struct hantro_ctx *ctx, int ref)
 	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
 	int idx = rockchip_vpu981_get_frame_index(ctx, ref);
 
-	if (idx != AV1_INVALID_IDX)
+	if (idx != V4L2_AV1_REF_FRAME_INVALID)
 		return av1_dec->frame_refs[idx].order_hint;
 
 	return 0;
@@ -179,7 +177,7 @@ static int rockchip_vpu981_av1_dec_frame_ref(struct hantro_ctx *ctx,
 		return i;
 	}
 
-	return AV1_INVALID_IDX;
+	return V4L2_AV1_REF_FRAME_INVALID;
 }
 
 static void rockchip_vpu981_av1_dec_frame_unref(struct hantro_ctx *ctx, int idx)
@@ -1256,7 +1254,7 @@ static void rockchip_vpu981_av1_dec_set_prob(struct hantro_ctx *ctx)
 	bool frame_is_intra = IS_INTRA(frame->frame_type);
 
 	if (error_resilient_mode || frame_is_intra ||
-	    frame->primary_ref_frame == AV1_PRIMARY_REF_NONE) {
+	    frame->primary_ref_frame == V4L2_AV1_PRIMARY_REF_NONE) {
 		av1_dec->cdfs = &av1_dec->default_cdfs;
 		av1_dec->cdfs_ndvc = &av1_dec->default_cdfs_ndvc;
 		rockchip_av1_default_coeff_probs(quantization->base_q_idx,
-- 
2.53.0


