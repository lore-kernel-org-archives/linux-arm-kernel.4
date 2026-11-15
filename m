Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B3A606A332
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 08:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rPuMj/n5;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Cr2FnshP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Q11j2VkaEM5Ovrnuja3qmq8R2hLcPNETrJC/VIRf6pY=; b=rPuMj/n561Pbbav5MbilIfPvOW
	YTmW8DVpK2D7ezZDPSoZi3rqfy1oehOQCTIwD/bJumy5NOYDOC0MpgTlbWrEDeCZMbJ34g9I0iJuc
	hDAovfRTWk/NMz8pjez9R2vGxRkCf7Lyj6msbGyr2Bytl63hMfmok44emU9MJ0ZNm8pRC0n/U0Av2
	eTUgPIdCYnPAPcmR6nIddNjQurP5rU0I0AI5t1aQ2csy0y/YPPf6lNO3xDbzaYqEzKgRh/O/gq3+g
	JiV+VO9bYjOiEQ7D6Vmg9WUhkaaCIO21ByUcfaWpTOgwMQNEBTo1wSYyleKLh0e9p4XL46yPA+2mv
	nYvNgtVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSW4o-0000000HHN3-2WjV;
	Sun, 15 Nov 2026 08:59:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSW4n-0000000HHMW-2GxK;
	Sun, 15 Nov 2026 08:59:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4CA634465C;
	Sun, 15 Nov 2026 08:59:05 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794733145;
	b=m7oQ71WV63qH1Kkty0AXlhJ3883xArgb9xfNJzHrKAN4AlglnoTCKb9OyO1Kmrtm5H5Q
	 0PQbDcDJTXW3Ms4J5CiytP7I4G31rRDFb2QPjvyuFWOvqgRQrtfIX4mttIDJixfY/h3ot
	 CP/D63VUH8h/9053BpjmbHBU9GvbrHsCDsmGZpYpdN68W+45Kn/2PoeQXaQ1vXflAtrIo
	 UBjY1/PHPNw4AcNK37eK6Q+/lQvuxQqbXziGkTsGtBSXNyzW/R+8Qif5x1Qi87RySuBsB
	 Sfxm2GHFrvu0HU2zyQk8YUh0MsofOPyuyN1PTX65ItPpL8ipFGdRroNCG5hXUAjcvQA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794733145;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Q11j2VkaEM5Ovrnuja3qmq8R2hLcPNETrJC/VIRf6pY=;
	b=lA8XRJrTXWFJwBF3W32saXLvRfVQhd9DLajQc06zgIg0a7wfjc7usabivzhcLh5Yj8Jr
	 4p3HSJL6nR8GopyxjBWHWF/X3rjwk/Ln900dQpTjjqL8PoQsu/L7t098pk+YsZH8yADE1
	 orCrPvlc+F+KCxhFnIzDgvfCazGhb55vKaozLrkoXCLJI2t+QfOBmfegfR8CU8nNSFwZN
	 vDobt5nb9dj2SOUzQf4T3inQEXtWbr0Pmqp8JFrYQUyB7jZn8Edcnkh3oHfs/ZLlUGCsu
	 qMTsWfptkaWtO94A9HaQsrbMZXyKMNxmslEms7cpH9De17iiceVJjTF62zuFz83oP8w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4DC571F000C6;
	Sun, 15 Nov 2026 08:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794733145;
	bh=Q11j2VkaEM5Ovrnuja3qmq8R2hLcPNETrJC/VIRf6pY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Cr2FnshP9Fc6k13kIuYEETNWOkG0AIT6IZ0KRlmZYjbK0cb/KVdZHo00yoAApImjo
	 Mo1DkR3fMgxSn2ZfA6ld7MIyKmu6VyfmynpDM7+hEyHs6ZkrAvVONJ4K/yhlzWLeRA
	 H4+VRSfHu5RTt21ipYtL8d0gCTuzQM/FAjitT+s/a9iqOqbSPKIO5kg6F/GRfmDlgS
	 npE6Nzl25uUZM+z4hiUhWzL4Gkj90tntck6CN7nSvo1+7yJuPBZu3TJoOAGZcl4CrT
	 UwGmQRIYzyAYnXbpE8a3CUW1mQBICq1oXzAPBubVxNxo83Sm3Lop3gMRkISg5g0bZV
	 TBZwEvuhzfxqA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C74E94A021;
	Sun, 15 Nov 2026 08:59:03 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Sun, 15 Nov 2026 08:59:04 +0000
Subject: [PATCH 1/2] media: verisilicon: av1: Find the reference buffers by
 timestamp
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261115-b4-vpu981-av1-refs-v1-1-c65769715db9@gmail.com>
References: <20261115-b4-vpu981-av1-refs-v1-0-c65769715db9@gmail.com>
In-Reply-To: <20261115-b4-vpu981-av1-refs-v1-0-c65769715db9@gmail.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 stable@vger.kernel.org, Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794733143; l=5334;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=nRwuv7ZOUhXWAqCeQr6LwCeSgpkrEt0gULCQ43OMD0g=;
 b=fJ/ecB6NvRMd8bXQ6bmKJeEKmmT9WHfqmSSKsnPyxv07xVXlz8yztL4x+jkqf9S505hxoQOYL
 nhvyokCntfkAJ4B8yugDAXgNWEGwQ9EXIB0ZT9F9I7GjG3Vw+1iKM66
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

frame_refs[] keeps a CAPTURE buffer pointer per reference across jobs.
VIDIOC_REMOVE_BUFS can free that buffer, and a missing reference falls
back to slot 0, which can hold a stale pointer.

Look the buffer up by timestamp at each job, as the other Hantro codecs
do, and use the current CAPTURE buffer and frame size when the reference
is missing.

Fixes: 727a400686a2 ("media: verisilicon: Add Rockchip AV1 decoder")
Cc: stable@vger.kernel.org
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/media/platform/verisilicon/hantro_hw.h     |  1 -
 .../verisilicon/rockchip_vpu981_hw_av1_dec.c       | 37 ++++++++++++----------
 2 files changed, 21 insertions(+), 17 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro_hw.h b/drivers/media/platform/verisilicon/hantro_hw.h
index 13e573f1f19d..36df8caa077d 100644
--- a/drivers/media/platform/verisilicon/hantro_hw.h
+++ b/drivers/media/platform/verisilicon/hantro_hw.h
@@ -287,7 +287,6 @@ struct hantro_av1_frame_ref {
 	bool used;
 	u32 order_hint;
 	u32 order_hints[V4L2_AV1_TOTAL_REFS_PER_FRAME];
-	struct vb2_v4l2_buffer *vb2_ref;
 };
 
 /**
diff --git a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
index 2a145433e6d1..59f2adf74850 100644
--- a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
+++ b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
@@ -169,7 +169,6 @@ static int rockchip_vpu981_av1_dec_frame_ref(struct hantro_ctx *ctx,
 		av1_dec->frame_refs[i].timestamp = timestamp;
 		av1_dec->frame_refs[i].frame_type = frame->frame_type;
 		av1_dec->frame_refs[i].order_hint = frame->order_hint;
-		av1_dec->frame_refs[i].vb2_ref = hantro_get_dst_buf(ctx);
 
 		for (j = 0; j < V4L2_AV1_TOTAL_REFS_PER_FRAME; j++)
 			av1_dec->frame_refs[i].order_hints[j] = frame->order_hints[j];
@@ -182,6 +181,18 @@ static int rockchip_vpu981_av1_dec_frame_ref(struct hantro_ctx *ctx,
 	return AV1_INVALID_IDX;
 }
 
+static struct vb2_buffer *rockchip_vpu981_av1_dec_ref_buf(struct hantro_ctx *ctx, int idx)
+{
+	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
+	struct vb2_queue *q = v4l2_m2m_get_dst_vq(ctx->fh.m2m_ctx);
+	struct vb2_buffer *buf = NULL;
+
+	if (idx >= 0 && av1_dec->frame_refs[idx].used)
+		buf = vb2_find_buffer(q, av1_dec->frame_refs[idx].timestamp);
+
+	return buf ?: &hantro_get_dst_buf(ctx)->vb2_buf;
+}
+
 static void rockchip_vpu981_av1_dec_frame_unref(struct hantro_ctx *ctx, int idx)
 {
 	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
@@ -829,7 +840,7 @@ rockchip_vpu981_av1_dec_set_ref(struct hantro_ctx *ctx, int ref, int idx,
 		pr_warn("AV1 invalid reference frame index\n");
 	}
 
-	dst = vb2_to_hantro_decoded_buf(&av1_dec->frame_refs[idx].vb2_ref->vb2_buf);
+	dst = vb2_to_hantro_decoded_buf(rockchip_vpu981_av1_dec_ref_buf(ctx, idx));
 	luma_addr = hantro_get_dec_buf_addr(ctx, &dst->base.vb.vb2_buf);
 	chroma_addr = luma_addr + dst->av1.chroma_offset;
 	mv_addr = luma_addr + dst->av1.mv_offset;
@@ -894,7 +905,7 @@ static void rockchip_vpu981_av1_dec_set_segmentation(struct hantro_ctx *ctx)
 			struct hantro_decoded_buffer *seg;
 			size_t mv_offset = rockchip_vpu981_av1_dec_chroma_size(ctx);
 
-			seg = vb2_to_hantro_decoded_buf(&av1_dec->frame_refs[idx].vb2_ref->vb2_buf);
+			seg = vb2_to_hantro_decoded_buf(rockchip_vpu981_av1_dec_ref_buf(ctx, idx));
 			luma_addr = hantro_get_dec_buf_addr(ctx, &seg->base.vb.vb2_buf);
 			mv_addr = luma_addr + mv_offset;
 
@@ -1983,16 +1994,13 @@ static void rockchip_vpu981_av1_dec_set_reference_frames(struct hantro_ctx *ctx)
 
 	for (i = V4L2_AV1_REF_LAST_FRAME; i < V4L2_AV1_TOTAL_REFS_PER_FRAME; i++) {
 		u32 ref = i - 1;
-		int idx = 0;
-		int width, height;
+		int idx = AV1_INVALID_IDX;
+		int width = frame->frame_width_minus_1 + 1;
+		int height = frame->frame_height_minus_1 + 1;
 
-		if (allow_intrabc) {
-			idx = av1_dec->current_frame_index;
-			width = frame->frame_width_minus_1 + 1;
-			height = frame->frame_height_minus_1 + 1;
-		} else {
-			if (rockchip_vpu981_get_frame_index(ctx, ref) > 0)
-				idx = rockchip_vpu981_get_frame_index(ctx, ref);
+		if (!allow_intrabc)
+			idx = rockchip_vpu981_get_frame_index(ctx, ref);
+		if (idx >= 0) {
 			width = av1_dec->frame_refs[idx].width;
 			height = av1_dec->frame_refs[idx].height;
 		}
@@ -2185,16 +2193,13 @@ rockchip_vpu981_av1_dec_set_input_buffer(struct hantro_ctx *ctx,
 static void
 rockchip_vpu981_av1_dec_set_output_buffer(struct hantro_ctx *ctx)
 {
-	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
 	struct hantro_dev *vpu = ctx->dev;
 	struct hantro_decoded_buffer *dst;
-	struct vb2_v4l2_buffer *vb2_dst;
 	dma_addr_t luma_addr, chroma_addr, mv_addr = 0;
 	size_t cr_offset = rockchip_vpu981_av1_dec_luma_size(ctx);
 	size_t mv_offset = rockchip_vpu981_av1_dec_chroma_size(ctx);
 
-	vb2_dst = av1_dec->frame_refs[av1_dec->current_frame_index].vb2_ref;
-	dst = vb2_to_hantro_decoded_buf(&vb2_dst->vb2_buf);
+	dst = vb2_to_hantro_decoded_buf(&hantro_get_dst_buf(ctx)->vb2_buf);
 	luma_addr = hantro_get_dec_buf_addr(ctx, &dst->base.vb.vb2_buf);
 	chroma_addr = luma_addr + cr_offset;
 	mv_addr = luma_addr + mv_offset;

-- 
2.55.0



