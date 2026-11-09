Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A07606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 18:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PFE7YqYI;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IVbd8NLb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=dRPAaRbuPiDQoNbXSXuTf0QKQZLyeuwtHbl0ZEG8jNI=; b=PFE7YqYIS956P1
	DFiQPpZPHrPkscpNtDR5JSm6GBzXggB3qLybpCJ6R+vR6US3TMQ4asC7kN7y1mSXgvNa/VLKnIBjj
	fwrTgiHTQRM2alSEPUJ3IQWcV5cXQ9usvGRlBlIMA4AgCD6EBtyCNmRFHr4I+ueoxmGFp5rwr9zwR
	8YPq1vUzVVAU4QAgfEbKjazi2TyOTd2czSOsBFXJ4GsiEIernDcipra/1HMwcj2fbFXxDXk0cv+4i
	xUQhWYIOe9zh6TXyJeyi6XNbosCxo0/03eSJHWedfScfAC6VPZvkn5g230KPuejt6TpwAIpLd1BYa
	6n4X6x97h4abRulporXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQTWT-00000001OMx-3cFd;
	Mon, 09 Nov 2026 17:51:13 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQTWR-00000001OJz-3Uvs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 17:51:13 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-490f38e9688so957960f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 09:51:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794246670; x=1794851470; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dRPAaRbuPiDQoNbXSXuTf0QKQZLyeuwtHbl0ZEG8jNI=;
        b=IVbd8NLb3pVYLdBIIW8jXf5efcJCDfmcYKwVxSKc8r+O2HwxZgtPBNb0P29Ss5UmLZ
         2CjMpcek+oFVhyL9xU05SV3A0ctNaH/8vUdZTX4fOfA2SWBkxsG7E1YOBIMm/nhmYJh/
         NYamTAyd8MTiXNUjiwW4/O3dqlucw9jhrvYY3Ru8rxqfAFj5j/BLYiY0Fx96WDkr/Fp0
         sQNdakBe4NGb2aLbPo5b3pWyYLk55MxWR0ONCPsrzV3pu/t6oR+wLjDkNf4/cNYJZRPb
         LT2pNhCgT3aAR6K/AFvlu5OPLFr+aOggalp+yPc4xBVceKAJ+htP8EcXNltSaQMQ5MqX
         hejA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794246670; x=1794851470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dRPAaRbuPiDQoNbXSXuTf0QKQZLyeuwtHbl0ZEG8jNI=;
        b=M8ARp91gZOH1LlWlbSw8Yst2bznhNfkbkXwDUHUHQSm2P9rjs5Y5Qj6CyWcS1X9XP0
         12+9jr06yJxTT/bs+zmQ6BgN0AUcGGqittvFHrKe9o0CLOP+LwConY1cchypSoLZMFMx
         GUziCShSY7vxiUK1yMQxncxKY/dbuM5A8lmr5J60wiZszVGlJkdxeJalR3QnH4yQN5jQ
         lwWsXhtou2nHZ2+E/MoCVxQOy1fHSDLSzflj1fMH2B0CepD3JsZEBU5fIgZu9PLZbDBa
         +S2I8WNkmgMaq8vX9430xHrjfaL61RTZoCPkF5vEvuLuSRqTelHO2V+gFbhqynvNBz4u
         sRbQ==
X-Forwarded-Encrypted: i=1; AL+hErENwZ6yAWL5IJOIGVphiSyqM3Mf5qpEh2tTw2rzKXJi9IkgHlEbbVapXGMMtzCYKSkpCFIt1SZWGCM6MkndS5px@lists.infradead.org
X-Gm-Message-State: APuU4Z+xqdF/gA8OhuvJPPIcIsL7yzd8J4XVuWvXyC/SHVrwLD4ZgiHR
	1i0SVon5QZ3gXMzaiQFfUjt6d4TbjfUJB3A8mpnDBQia5+fMTG6+pegh
X-Gm-Gg: AYBFou3l1Y7+NLTJST/d3Bcmm1bTDw9zSv/r/MC2ytRWZV1x2JrFbpS3HW58OOm28ZZ
	uzsFjC6WR9ws02TnsnBdmxdHSdlg6sT7fkLiLVmyyZv0qua5bgUNPJI2XWBGTwc25WCjjWuoIme
	pw7Ri6c1CRhwvRYIv+xZjAQjtZb31o63Pj5Pjs7sbQTZ6oX6XdF1dTvf+tJxF/KysYGja2EN0ma
	YR3O4RaWJ0sRWupCM6GWfh+b1zv+njjafTvv7jS4lX+l/CMNHBjGkRgAvEYUWiam+SMv+xzo8ay
	cqvk3Jj9TbmU39oQ4ifqiAukieq747sNnlVsOn2RQR06qrELdwIgZqbx1iaP0X923r2ZZyca3VM
	raevh83KtgKvniBRgIsHClZKDHPSSPgpoZvmAEYheuJIzzw0Wb1mSr7ah5KS3kxL1crBLIiekgB
	jWoM3pmkHKWB89eJWR4vcNPwNr9KGXeZmciz1Ng2I2918gzDeyKzSXwTHlHdGwsMGRLEMOjvrlc
	cgJvk2RaqRkUZmCvh/IYXp4KhTzGdt6wCwjeLKcY7h5z1iBgl/o6i6CFLReDdgXLtauO3rSDokl
	1Q3yobnwxpDdqff0uEra6HAI2nBRHApnOr6RSvhbIOSwZ1ycqG7QF/jptCthdBxPegNeVmpCuHs
	LqLGG7ypsEFlW2gej3jpIWPmvrAvo7yO5b4DWKTI2tFNQIISYvbzayXbeG8oHz/cv23gCjjOyuZ
	9cXNLtPPcDvW2gpNhjRxi/cKuIVF8yq817GbpB+tZLdYKSEeIKiFPxMB3NO71U5qxKLvwZqAvgD
	HesMe7o8g4UCSPuglXSVMN5QqeZdNDZGknQnIU9wKN20Hq55bc=
X-Received: by 2002:adf:e184:0:b0:495:b427:1e6f with SMTP id ffacd0b85a97d-4982e920d55mr359034f8f.0.1794246669666;
        Mon, 09 Nov 2026 09:51:09 -0800 (PST)
Received: from jernej-laptop (86-58-12-36.dynamic.telemach.net. [86.58.12.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a4238sm200717f8f.54.2026.11.09.09.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 09:51:09 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 03/11] staging: media: cedrus: h264: mark long-term references in the frame info
Date: Mon,  9 Nov 2026 18:50:08 +0100
Message-ID: <20261109175016.42061-4-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109175016.42061-1-jernej.skrabec@gmail.com>
References: <20261109175016.42061-1-jernej.skrabec@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_095111_971199_56B99E59 
X-CRM114-Status: GOOD (  21.13  )
X-Spam-Score: -1.1 (-)
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
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The frame info of a reference has a reference type for each field, in
bits 1:0 for the top field and 5:4 for the bottom one, which is 1 for a
long-term reference. The driver never sets it, so the hardware handles
long-term references like short-term ones, also where they differ, like
in temporal direct and implicit weighted prediction. The vendor library
sets it.

Set it from the DPB entry of each reference. When the second field of a
pair is decoded into the buffer of the first one, the entry of the
output buffer keeps the reference type of the first field.

This fixes MR8_BT_B and MR9_BT_B of the H.264 conformance suite.

Fixes: 6eb9b758e307 ("media: cedrus: Add H264 decoding support")
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 .../staging/media/sunxi/cedrus/cedrus_h264.c  | 24 ++++++++++++++++++-
 .../staging/media/sunxi/cedrus/cedrus_regs.h  |  8 +++++++
 2 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
index e8229c60d3f5..97958ceee8d1 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
@@ -69,13 +69,19 @@ static void cedrus_fill_ref_pic(struct cedrus_ctx *ctx,
 				struct cedrus_buffer *buf,
 				unsigned int top_field_order_cnt,
 				unsigned int bottom_field_order_cnt,
+				u32 ref_type,
 				struct cedrus_h264_sram_ref_pic *pic)
 {
 	struct vb2_buffer *vbuf = &buf->m2m_buf.vb.vb2_buf;
+	u32 frame_info;
 
 	pic->top_field_order_cnt = cpu_to_le32(top_field_order_cnt);
 	pic->bottom_field_order_cnt = cpu_to_le32(bottom_field_order_cnt);
-	pic->frame_info = cpu_to_le32(buf->codec.h264.pic_type << 8);
+
+	frame_info = VE_H264_FRAME_INFO_TOP_REF_TYPE(ref_type) |
+		     VE_H264_FRAME_INFO_BOT_REF_TYPE(ref_type) |
+		     VE_H264_FRAME_INFO_PIC_TYPE(buf->codec.h264.pic_type);
+	pic->frame_info = cpu_to_le32(frame_info);
 
 	pic->luma_ptr = cpu_to_le32(cedrus_buf_addr(vbuf, &ctx->dst_fmt, 0));
 	pic->chroma_ptr = cpu_to_le32(cedrus_buf_addr(vbuf, &ctx->dst_fmt, 1));
@@ -83,12 +89,21 @@ static void cedrus_fill_ref_pic(struct cedrus_ctx *ctx,
 	pic->mv_col_bot_ptr = cpu_to_le32(cedrus_h264_mv_col_buf_addr(buf, 1));
 }
 
+static u32 cedrus_h264_ref_type(const struct v4l2_h264_dpb_entry *dpb)
+{
+	if (dpb->flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM)
+		return VE_H264_FRAME_INFO_REF_TYPE_LONG_TERM;
+
+	return VE_H264_FRAME_INFO_REF_TYPE_SHORT_TERM;
+}
+
 static int cedrus_write_frame_list(struct cedrus_ctx *ctx,
 				   struct cedrus_run *run)
 {
 	struct cedrus_h264_sram_ref_pic pic_list[CEDRUS_H264_FRAME_NUM];
 	const struct v4l2_ctrl_h264_decode_params *decode = run->h264.decode_params;
 	const struct v4l2_ctrl_h264_sps *sps = run->h264.sps;
+	u32 output_ref_type = VE_H264_FRAME_INFO_REF_TYPE_SHORT_TERM;
 	struct vb2_queue *cap_q;
 	struct cedrus_buffer *output_buf;
 	struct cedrus_dev *dev = ctx->dev;
@@ -117,8 +132,13 @@ static int cedrus_write_frame_list(struct cedrus_ctx *ctx,
 		position = cedrus_buf->codec.h264.position;
 		used_dpbs |= BIT(position);
 
+		/*
+		 * The second field of a pair is decoded into the buffer of the
+		 * first one, which keeps its reference type.
+		 */
 		if (run->dst->vb2_buf.timestamp == dpb->reference_ts) {
 			output = position;
+			output_ref_type = cedrus_h264_ref_type(dpb);
 			continue;
 		}
 
@@ -128,6 +148,7 @@ static int cedrus_write_frame_list(struct cedrus_ctx *ctx,
 		cedrus_fill_ref_pic(ctx, cedrus_buf,
 				    dpb->top_field_order_cnt,
 				    dpb->bottom_field_order_cnt,
+				    cedrus_h264_ref_type(dpb),
 				    &pic_list[position]);
 	}
 
@@ -174,6 +195,7 @@ static int cedrus_write_frame_list(struct cedrus_ctx *ctx,
 	cedrus_fill_ref_pic(ctx, output_buf,
 			    decode->top_field_order_cnt,
 			    decode->bottom_field_order_cnt,
+			    output_ref_type,
 			    &pic_list[position]);
 
 	cedrus_h264_write_sram(dev, CEDRUS_SRAM_H264_FRAMEBUFFER_LIST,
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_regs.h b/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
index 05e6cbc548ab..961fe023bb43 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
@@ -616,6 +616,14 @@
 #define VE_AVC_SRAM_PORT_OFFSET		0x2e0
 #define VE_AVC_SRAM_PORT_DATA		0x2e4
 
+/* Frame info word of a frame buffer list entry in the AVC SRAM */
+#define VE_H264_FRAME_INFO_PIC_TYPE(v)		SHIFT_AND_MASK_BITS(v, 9, 8)
+#define VE_H264_FRAME_INFO_BOT_REF_TYPE(v)	SHIFT_AND_MASK_BITS(v, 5, 4)
+#define VE_H264_FRAME_INFO_TOP_REF_TYPE(v)	SHIFT_AND_MASK_BITS(v, 1, 0)
+
+#define VE_H264_FRAME_INFO_REF_TYPE_SHORT_TERM	0
+#define VE_H264_FRAME_INFO_REF_TYPE_LONG_TERM	1
+
 #define VE_VP8_PPS			0x214
 #define VE_VP8_PPS_PIC_TYPE_P_FRAME		BIT(31)
 #define VE_VP8_PPS_LAST_SHARPNESS_LEVEL(v)	SHIFT_AND_MASK_BITS(v, 30, 28)
-- 
2.43.0


