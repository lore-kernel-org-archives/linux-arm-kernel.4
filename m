Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D269B606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 17:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PpLx3gWz;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NDc5j65+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Y7oQXXW4iOeWRPRZ9YEQsiDsKsFyaejYKJ2MzAPKYmQ=; b=PpLx3gWz9Vc6nK1YkhRbkr4Ydd
	tIGp0uTz/68UBpk0So+Q3BPf+7epzEDODnmFewboZzfuNiKfmkANR9RvSh5WntHfeq5upRVlpjQe6
	30yVjq/R4Cq0mFZD8BTN6JqMIc0/MUxvOQ+aXKtq5FKur6pCT5lVYB2nkE2RW5QgjmWz6NftWkd/L
	lpYpssrc2Adl86gvpaRgnCfSCeG69RsciHVBsxINPlOG2GDWCSfiExzXonzq/9ytTvwLv672lzkyl
	PeY+BkXru37ViU2kbXLX4dQvtc1gvxfOdMYxgIdq+U23ZuAosrmx1dgzg0YDsCn3F7hLOAY7FAAlv
	F4eDJZEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWcqn-0000000E09Q-1mym;
	Thu, 26 Nov 2026 17:01:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWcqM-0000000Dzuj-1nR3;
	Thu, 26 Nov 2026 17:01:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CB66B60CF5;
	Thu, 26 Nov 2026 17:01:09 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795712469;
	b=2SziPIWIqOibrpz25GyDtt8J86WfM6YTqq36j2pyfjOP4loNBjTCoqxq8UbXf6pXJcCs
	 qaxhwu8HF3vCjr9qbBkJEavIoxUdmxFWq8s5Q74vrUjhTvTa+lLd1hmez8WKWGCDASBEd
	 Y5kOR4pep+qC9s5mhszesrxrDU+r4+frMxmH2ktcuYn5ENiVN1PiiVINo1vC4ekdJR//v
	 199wmAJUnBByjc4AQ77iCKk6+gSxP3mk+ZfE2rB3yt6tZiqeVYz9npPzZbFVL940807rG
	 jeK/SZyZ6Q1jW5YBQhmUNJ/oHmFIBkWXWK9TUKt2dnDABvAfTV5UBGFvbl3HnUf2NwA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795712469;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Y7oQXXW4iOeWRPRZ9YEQsiDsKsFyaejYKJ2MzAPKYmQ=;
	b=KOtvYkBPiTIKOI5eSVi2qxFVuJczRy3YdYGZZ73DIV2OvxPa8Wwh9czww4fjGhSyrIwt
	 gPk5+8tWl/cGV78o9U7fl1VuQbG14KtA1hiHi9GyucHp+fbraWoOL3HBJ5lKpm9T0j/Kl
	 Xq8Wlm/Oqn9YOOpD8wbjVs0ymxxme8zxAlDLpIntxM5MVSBgcmNJqdmLXeBx9qGbSBE5h
	 GCAz4/XXX5QoOsVvbPzDPg8+Doi8ahvIGhiLU6s4mhw8d3KX4TnYNXjnUCk3ks7EAHXBI
	 Om8IvSp8RYgwoU+BScgrKStiMTBa5N2DA/vAh+pBZl6YJ2dGZdxP+KzCHVVOEqxA/TQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 24AD91F000CA;
	Thu, 26 Nov 2026 17:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795712469;
	bh=Y7oQXXW4iOeWRPRZ9YEQsiDsKsFyaejYKJ2MzAPKYmQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=NDc5j65+nEjemCyKYfH0rrA9xI/Bq+NWgdmS/dYceovP6v3lD62rGVhbLBzLGukdV
	 tU0urMWEhGZGtfwCVZD4DOlgddTRFZuG6WRgY0GX91r0Lj0OvDKuP8qmy922QOWOqx
	 3kzimmymjx1tnIebmJDKuohPDNyRiMAcuCqZBK79AI5o6tAx2BEHX18OK1R1x2JCKX
	 ke73t9G0iTeRFLV2Gr/QIFEAoKXxu7cUGLTdFbN6OFLeATyznY8VU8WjdFoa/RRy5i
	 jKIO+3yPWobQrpEt8kHpItwilnSfTZmwaSexBR+uezJMbKrXDBtnDqKHXdp1MgvxzA
	 HjRp2+e+znosw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A18984D753;
	Thu, 26 Nov 2026 17:00:53 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Thu, 26 Nov 2026 17:00:55 +0000
Subject: [PATCH v3 3/5] media: verisilicon: Report fixed JPEG colorimetry
 on the encoder
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261126-hantro-jpeg-enc-fixes-v3-3-07357d84a64b@gmail.com>
References: <20261126-hantro-jpeg-enc-fixes-v3-0-07357d84a64b@gmail.com>
In-Reply-To: <20261126-hantro-jpeg-enc-fixes-v3-0-07357d84a64b@gmail.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Sergei Khomenkov <shomenkow@gmail.com>, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795712452; l=1351;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=jQGwq2ezjyS5OLBIC3b8uIm11FWRMfbVW9fV1IdCb0w=;
 b=tXEbeaN9I4IMEXcW5M9uBtrdJN/78BRij3bVNmt+vhPG1Y8YDzU02itwWpfXoS77yLI3qnVC7
 h8ni9TI72ioBXwrC5F5TOvUG3Xr/Urp2ELusDrnmCcWyM+PARNHxnGn
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

The JPEG encoder accepts any colorimetry and reports
V4L2_COLORSPACE_JPEG on the raw queue, which v4l2-compliance rejects:

  fail: v4l2-test-formats.cpp(892): fmt_raw.g_colorspace() != V4L2_COLORSPACE_SRGB

JPEG colorimetry is fixed and the hardware does not convert, so report
sRGB with full range BT.601 Y'CbCr on both queues.

Fixes: 775fec69008d ("media: add Rockchip VPU JPEG encoder driver")
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/media/platform/verisilicon/hantro_v4l2.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c b/drivers/media/platform/verisilicon/hantro_v4l2.c
index 88b1cf66b713..b91c0ef9b6a3 100644
--- a/drivers/media/platform/verisilicon/hantro_v4l2.c
+++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
@@ -396,6 +396,14 @@ static int hantro_try_fmt(const struct hantro_ctx *ctx,
 			pix_mp->width * pix_mp->height * fmt->max_depth;
 	}
 
+	if (ctx->is_encoder && vpu_fmt->codec_mode == HANTRO_MODE_JPEG_ENC) {
+		/* JPEG colorimetry is fixed; the hardware does not convert. */
+		pix_mp->colorspace = V4L2_COLORSPACE_SRGB;
+		pix_mp->ycbcr_enc = V4L2_YCBCR_ENC_601;
+		pix_mp->xfer_func = V4L2_XFER_FUNC_SRGB;
+		pix_mp->quantization = V4L2_QUANTIZATION_FULL_RANGE;
+	}
+
 	return 0;
 }
 

-- 
2.55.0



