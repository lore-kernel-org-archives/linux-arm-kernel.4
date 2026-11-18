Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4FF606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 20:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Z5Eh5JiT;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=obIktoh5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=y75oxAwlO6c2EjPrPmHn9WTGzz0GY9XzQAVscbqDFeA=; b=Z5Eh5JiTFoSELC
	vl1U1HmIUPd0ELaS3g6fRiHmA3Egq1Er+rHDC0vcr28Svk9MLc4J1444bbfd9k2imiB6rnAzXzQb1
	/YV6cxScBNXsbcQRe0ZhBGAjNfATt0j6HIS01pgOju8tRj7IwtJpIBSgHuY5ESLXRAkpc+LgnJG1Y
	MQT49KoXkh48kcNXRXlaPTfBh9a2MsH6poCfFYaRfyTfngVyTcuzvnoPmaeO6szqaqq4bPpXt8pd5
	iHFToDWTVvuPmZVNv7D6/9ttYwNVHgm1gE8pPIWpKBOU85TeW1VYxSUi4UBlqJWBerFluVHm/VXcD
	SW2g7jIuEroh3KQOLFmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTmLx-0000000ADxa-1Z32;
	Wed, 18 Nov 2026 20:34:01 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTmLr-0000000ADub-3ZAy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 20:33:57 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-8a73075f2f4so74278b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 12:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795034035; x=1795638835; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y75oxAwlO6c2EjPrPmHn9WTGzz0GY9XzQAVscbqDFeA=;
        b=obIktoh5/Wz+4NpmiNCeeNMuqy0ivRLyApvbBxJQJfsZUIOM+D27XQv6dbiRNPulvw
         f/vc2D3HpP6SLeSx/VuSYPyzul7DKgPfirMg0Sk8lwMQbJ6hkCKT+98iKmFvSoh2gXTz
         WSEcqx9t6BBE8hb4+41YgUXAjrdD+WxbmV9EL7iaTz9x0HZOkPTOjS6V+eCBsYvFZ6Rl
         iSP2tQ0uSlK8SFgmqvHX29wxh5LJN5GOf1p5ncYpARGvY+nwA6iG81V/JsZ2PqOgfR/l
         ZqVG46pHpQsqavyuGAptK3mXuNxeTqZrbwPl/NdLbvH+WqWtorTS0uEQjA5Mpyq61UPV
         2PLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795034035; x=1795638835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=y75oxAwlO6c2EjPrPmHn9WTGzz0GY9XzQAVscbqDFeA=;
        b=vWkwal4egUpRTUAv2L5wD9Z6g/3L4xssW3Fl73r6aYAmPUoWHdaKWMsEVb5hARsvrF
         cyUGs2GJT6/qHV2TbmjIbEODTeey8KCoNf+E3zvORCvBYTJzuL/KPoExF68pvYh46Zxi
         2ihqsWKd/oG7xYDfBVQ3hm9vx4T07W+TeB7lbNAh60LsmmUYRuoikMKbNHeMSMWt52ra
         nsYrQygM5LgCT1XGPbMKJakU18N4tDum6k6BmqU2s+l14d2DynWUlClw+n2Ze/tO8J/W
         nCyCxoxHvlazDaDYIMS1x5aRJ9Mprvnapk7B97e2N6c8oTvOnGLEUZa7mU7ffoREyiFV
         inIw==
X-Forwarded-Encrypted: i=1; AL+hErG1cz4yUnJHvjuAXMIEK2Qgrt3V5UQIJYm/K5hwu79rBo6ZKjlY1qltpNF42HkEIAXB9l4pznMh8OEcf3ijYcUg@lists.infradead.org
X-Gm-Message-State: APuU4Z/A6Pxk/HToFyj1VS64EAn05/Tfj8CCWL93ahHoln7v4F2od76V
	u9yt+L5mbiczQgy/wYhdGniUHxfcNmBWjEzSQYultJgp3xvvABO3/SOa
X-Gm-Gg: AZFdTZdPQkERZZCCL665rcpAufcZRIevRAEMau2x+mjcCKoGNm2yQk6GaCpsBSnbus5
	mZbAjbHp+SbzdZaHaWPDa6SRoHbUrATMHCHIQY/mQbvXmF01zIN/6Tat2OWS/c5kGeOH0BWPAPP
	Br3s2PPK87KkbyoUXnpBm5BjAaIH5lddTP9xyaoFgzpN1Qn16m1tkMBX4cvKdOa8kVsEEr5PZs4
	trA57odM9CMB2eazkakpZAbFIJiG2EhmeM3zuFRj7E0k0hto7iAnSwm5qlU//HfQFDKOaf6X3fX
	2sDRasNutcIhki1vyIJdd6HcPvGA248UP6H6XLoUrjBE3raVQayp4BXZqcBsEbLyj9mioB2dEFH
	PR6VO7CsKZXnHPAm8WKMNJte92G3faVvkXB8tVeaq7QEbhFV9t7QrfkHbTUzhVAscxCy0zF+sg2
	xOOn2IBGTp5Ap3KVepuCNn7MMkwIcQcmOTBW68UloVbHdZR4TjvUhWsz5Cz4pwCxGjQe9V5TWU7
	RdbJMcdyCPwPKlRuuhVV2PYgt26MMFPJ0tDGbd6XSrlfXQQ7lgRD4Bn2zEDjCTFJK1VafXX2eBX
	ckFU6ARIhWq9NurbZM+SgkLgk+t7iALkQMhSPm6zqTkohILwd7S/0DeYB+J1JnjrmvGr/RWJduP
	lvVR+Pdo=
X-Received: by 2002:a17:903:2b0d:b0:2ef:d8ce:83e6 with SMTP id d9443c01a7336-2eff6f850b2mr56986735ad.0.1795034035036;
        Wed, 18 Nov 2026 12:33:55 -0800 (PST)
Received: from FAIZEL-KB.. ([2001:569:52f5:4b00:cfaf:4885:b023:6316])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2eff6116331sm19166825ad.22.2026.11.18.12.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 12:33:54 -0800 (PST)
From: Faizel K B <faizel.kb@gmail.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>,
	Michael Riesch <michael.riesch@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	libcamera-devel@lists.libcamera.org,
	Robert Mader <robert.mader@collabora.com>,
	Faizel K B <faizel.kb@gmail.com>
Subject: [PATCH v2 2/2] media: rockchip: rkcif: Honour the requested bytesperline
Date: Wed, 18 Nov 2026 13:31:34 -0700
Message-ID: <20261118203134.315591-3-faizel.kb@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118203134.315591-1-faizel.kb@gmail.com>
References: <20261118203134.315591-1-faizel.kb@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_123355_909224_FE52C41E 
X-CRM114-Status: GOOD (  24.71  )
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
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The DMA uses bytesperline as the line stride, which must be a multiple
of 8 bytes, but v4l2_fill_pixfmt_mp() doesn't align it. Any larger
bytesperline requested by userspace is also replaced with the minimum.

Align bytesperline to 8 bytes and honour the largest value requested
for any plane, up to the limit of the line width register. The Y and
UV planes share the same line width. On the DVP, program the line width
from bytesperline, keeping the current value as the minimum.

This allows DMA-BUF importers that need a larger stride alignment to
use the buffers directly.

Signed-off-by: Faizel K B <faizel.kb@gmail.com>
---
 .../rockchip/rkcif/rkcif-capture-dvp.c        |  4 ++
 .../rockchip/rkcif/rkcif-capture-mipi.c       |  3 ++
 .../platform/rockchip/rkcif/rkcif-common.h    |  1 +
 .../platform/rockchip/rkcif/rkcif-stream.c    | 48 ++++++++++++++++++-
 4 files changed, 54 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-capture-dvp.c b/drivers/media/platform/rockchip/rkcif/rkcif-capture-dvp.c
index dbaf7636aeeb..64a37d6877e2 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-capture-dvp.c
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-capture-dvp.c
@@ -20,6 +20,8 @@
 #include "rkcif-regs.h"
 #include "rkcif-stream.h"
 
+#define RKCIF_DVP_MAX_BYTESPERLINE 0x7ff8 /* VIR_LINE_WIDTH: 15 bits */
+
 static const struct rkcif_output_fmt dvp_out_fmts[] = {
 	{
 		.fourcc = V4L2_PIX_FMT_NV16,
@@ -689,6 +691,7 @@ static int rkcif_dvp_start_streaming(struct rkcif_stream *stream)
 	val = stream->pix.width;
 	if (active_in_fmt->fmt_type == RKCIF_FMT_TYPE_RAW)
 		val = stream->pix.width * 2;
+	val = max(val, stream->pix.plane_fmt[0].bytesperline);
 	rkcif_dvp_write(rkcif, RKCIF_DVP_VIR_LINE_WIDTH, val);
 
 	val = RKCIF_XY_COORD(stream->pix.width, stream->pix.height);
@@ -827,6 +830,7 @@ int rkcif_dvp_register(struct rkcif_device *rkcif)
 		stream->interface = interface;
 		stream->out_fmts = rkcif->match_data->dvp->out_fmts;
 		stream->out_fmts_num = rkcif->match_data->dvp->out_fmts_num;
+		stream->max_bytesperline = RKCIF_DVP_MAX_BYTESPERLINE;
 		stream->queue_buffer = rkcif_dvp_queue_buffer;
 		stream->start_streaming = rkcif_dvp_start_streaming;
 		stream->stop_streaming = rkcif_dvp_stop_streaming;
diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
index 53e62d059764..d5eaedd2c43b 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
@@ -24,6 +24,8 @@
 #include "rkcif-regs.h"
 #include "rkcif-stream.h"
 
+#define RKCIF_MIPI_MAX_BYTESPERLINE 0xffff8 /* VLW: 20 bits */
+
 #define RK3568_MIPI_CTRL0_HIGH_ALIGN  BIT(31)
 #define RK3568_MIPI_CTRL0_UV_SWAP_EN  BIT(7)
 #define RK3568_MIPI_CTRL0_COMPACT_EN  BIT(6)
@@ -1026,6 +1028,7 @@ int rkcif_mipi_register(struct rkcif_device *rkcif)
 			stream->interface = interface;
 			stream->out_fmts = mipi_out_fmts;
 			stream->out_fmts_num = ARRAY_SIZE(mipi_out_fmts);
+			stream->max_bytesperline = RKCIF_MIPI_MAX_BYTESPERLINE;
 			stream->queue_buffer = rkcif_mipi_queue_buffer;
 			stream->start_streaming = rkcif_mipi_start_streaming;
 			stream->stop_streaming = rkcif_mipi_stop_streaming;
diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-common.h b/drivers/media/platform/rockchip/rkcif/rkcif-common.h
index 08a213438d34..63e5a221cd73 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-common.h
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-common.h
@@ -145,6 +145,7 @@ struct rkcif_stream {
 	struct rkcif_interface *interface;
 	const struct rkcif_output_fmt *out_fmts;
 	unsigned int out_fmts_num;
+	u32 max_bytesperline;
 
 	/* in ping-pong mode, two buffers can be provided to the HW */
 	struct rkcif_buffer *buffers[2];
diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
index b117ba57bc75..f700b40ab099 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
@@ -23,6 +23,7 @@
 #define CIF_MIN_HEIGHT	 64
 #define CIF_MAX_WIDTH	 8192
 #define CIF_MAX_HEIGHT	 8192
+#define CIF_BYTESPERLINE_ALIGN 8
 
 static inline struct rkcif_buffer *to_rkcif_buffer(struct vb2_v4l2_buffer *vb)
 {
@@ -334,20 +335,63 @@ static const struct vb2_ops rkcif_stream_vb2_ops = {
 	.stop_streaming = rkcif_stream_stop_streaming,
 };
 
+static u32 rkcif_stream_plane_lines(const struct v4l2_format_info *info,
+				    unsigned int plane, u32 height)
+{
+	return plane ? DIV_ROUND_UP(height, info->vdiv) : height;
+}
+
+static void rkcif_stream_set_bytesperline(struct rkcif_stream *stream,
+					  struct v4l2_pix_format_mplane *pix,
+					  u32 req_bpl)
+{
+	const struct v4l2_format_info *info = v4l2_format_info(pix->pixelformat);
+	u32 bpl = pix->plane_fmt[0].bytesperline;
+	u32 total_lines = 0, max_bpl;
+	unsigned int i;
+
+	for (i = 0; i < info->comp_planes; i++)
+		total_lines += rkcif_stream_plane_lines(info, i, pix->height);
+
+	max_bpl = min(stream->max_bytesperline,
+		      ALIGN_DOWN(U32_MAX / total_lines, CIF_BYTESPERLINE_ALIGN));
+	if (req_bpl > bpl && req_bpl <= max_bpl)
+		bpl = ALIGN(req_bpl, CIF_BYTESPERLINE_ALIGN);
+
+	/* The Y and UV planes share the same line width. */
+	if (info->mem_planes == 1) {
+		pix->plane_fmt[0].bytesperline = bpl;
+		pix->plane_fmt[0].sizeimage = bpl * total_lines;
+	} else {
+		for (i = 0; i < info->mem_planes; i++) {
+			pix->plane_fmt[i].bytesperline = bpl;
+			pix->plane_fmt[i].sizeimage =
+				bpl * rkcif_stream_plane_lines(info, i,
+							       pix->height);
+		}
+	}
+}
+
 static int rkcif_stream_fill_format(struct rkcif_stream *stream,
 				    struct v4l2_pix_format_mplane *pix)
 {
 	const struct rkcif_output_fmt *fmt;
-	u32 height, width;
+	u32 height, width, req_bpl = 0;
+	unsigned int i;
 	int ret;
 
 	fmt = rkcif_stream_find_output_fmt(stream, true, pix->pixelformat);
 	height = clamp_t(u32, pix->height, CIF_MIN_HEIGHT, CIF_MAX_HEIGHT);
 	width = clamp_t(u32, pix->width, CIF_MIN_WIDTH, CIF_MAX_WIDTH);
-	ret = v4l2_fill_pixfmt_mp(pix, fmt->fourcc, width, height);
+	for (i = 0; i < pix->num_planes; i++)
+		req_bpl = max(req_bpl, pix->plane_fmt[i].bytesperline);
+	ret = v4l2_fill_pixfmt_mp_aligned(pix, fmt->fourcc, width, height,
+					  CIF_BYTESPERLINE_ALIGN);
 	if (ret)
 		return ret;
 
+	rkcif_stream_set_bytesperline(stream, pix, req_bpl);
+
 	pix->field = V4L2_FIELD_NONE;
 
 	return 0;
-- 
2.43.0


