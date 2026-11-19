Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969DB60A3831
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 16:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XzQZh6g9;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZSogWvU5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=TASXj8wsMRiuTiWS9CZldYuNl5sRLL8gOkJehr3ZTXs=; b=XzQZh6g9JbIeu0Vb9/+6kgD2gA
	PsroT4tLZYgeKd0Gpf+ekGIMFh8C7hFX6d2pHIFg9f6uu+x/wqSjEu5vzgx5VB21c9L5WnSiwWwAe
	fKuClh7onjOn3Sn4Qo0uIoXKFfgke0S/uMEaLi5iJZCope5AJIpUKVipzbe/4skpc4YacDaDFnPm0
	f3HHNqZWwx5KUnY9Vsxq2b+GwBgmGvRzQXY7747po5Oaf/U5zYq0CSF++fScYAbu1CCa9OD4TuVQk
	7W9bGHi7tTTuwrbIYgpbv//is7eOmmvpNIlySzvI2yu2KOI0EWCoqQ82tSR3xJ4zhOBpInbQqkA9e
	2pS54A4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU562-0000000Cen8-2msm;
	Thu, 19 Nov 2026 16:34:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU561-0000000CemA-2usC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 16:34:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2EA3944733;
	Thu, 19 Nov 2026 16:34:49 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795106089;
	b=L4t5dan3pmX+JnWgTQEFpYut+kUDbNJN7v0yeOwCIHF2EXXvaxNPAFreP5BQGZrsWerl
	 uGFASlF0Y84quENcIHv9K61Wj8q7BC6R154HQyzcmEaAecFwK8iGSQO5lfrpq5hBlVipT
	 SrSQ/9Al8lRKuiKvG8L6zYUgSMUnRVjgSsPBCmxhkzOV4Qw+e5/dZlPWj0p0Sz9XYt7jV
	 vMi4wYUSnBh9dlPrmekCa+FNnBVi7V+MAKCaCR+Q6PjundyLAAf3NcT9+3tLQeeVql/BU
	 LslHPxkuqda+GKk61qa1m2kjqjFr5gKPnWDONAMhUhoc8oDnzuUReRZyR+k1UQkE6pg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795106089;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=TASXj8wsMRiuTiWS9CZldYuNl5sRLL8gOkJehr3ZTXs=;
	b=WIDEp6eREEqGEzHyfClIz3gXgirA4U0ijnCzl/GHPCkIdbIVJVn9smKGKjWCFtruEiTe
	 2UKs81VlsQGFMVIDvaHOcM+Syf1x3OzWIVHmkbyQOBTzOEhtLlCDtADCjTg+nFwA1TGDH
	 jFWx9Zx1kSKwQz784QDIvqy84JMteU7JMW3rxkZjFY7u2NZiu03JyZ3ajssnJkkgeJpv2
	 YQC14yjfWDTNPZHAhPD/dFQc9ua3YJTKg+5e0e6wGfyksyxOBEuk2bsr7R2ZovAit3SRn
	 lcyAqxr6OjrQAMcAgKIVQJJd1SrS9JTAptRLYpRC+P4VL7g+eIHdEOFoqpoH322cB5A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E06B21F000C4;
	Thu, 19 Nov 2026 16:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795106089;
	bh=TASXj8wsMRiuTiWS9CZldYuNl5sRLL8gOkJehr3ZTXs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=ZSogWvU55Q22Tsn3BTlEV6kFWKjiTpepEeedHaifkNt/JRWfolLvLvivSa+uj8znn
	 rVDPKkQBkp5ZMRYSUAtkeROF4jSmVHDLmBtMapIOIILlccde7wE6Al6vMamIYt901p
	 jQoKuSA13+Ave6er+5Nvn8yp5O8mvDNmtbJy7Uce6P3rfZTsAgSuT8gbBCD5DSJ7Xd
	 rafx5xwKloh4mn9EiHyGQihileZ2gEqq1/7g2tfJrRL6E5szfn9z26O3H0DR0yPyoD
	 k8D4gHF6xA18wWMTH0X/aiQMhFj01bB/4HD3Zvixl9PLxlx9pbRSmozxUIpR5+DOIH
	 zlWh5IYInVaGQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 695A74B340;
	Thu, 19 Nov 2026 16:34:47 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Thu, 19 Nov 2026 16:34:48 +0000
Subject: [PATCH 2/2] media: cedrus: report only the picture as capture
 payload
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261119-b4-cedrus-generic-fixes-v1-2-f9f50812c85b@gmail.com>
References: <20261119-b4-cedrus-generic-fixes-v1-0-f9f50812c85b@gmail.com>
In-Reply-To: <20261119-b4-cedrus-generic-fixes-v1-0-f9f50812c85b@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795106086; l=1453;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=lSQqpNTqUN3KRP025JzeD5HjWBP/5kJZvzmwU8xlcgw=;
 b=00WljHGglT5egohrYdOgq2pH9RldUbgdDe5g5Dz9/47B5lNqevbDqAy08FT/fuUltqaXLfp9B
 urA326EmJLEBpPXNRX+hE7m800eVBKwNcfw1YYiIYkhBU4UoJ4p/We0
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

For 10-bit H.265 the driver appends the low 2 bits of every sample to
the capture buffer and counts them in sizeimage (extra_cap_size).
buf_prepare reports the whole sizeimage as bytesused, so userspace that
copies the payload gets the private plane as part of the picture.

Report only the picture; sizeimage stays the allocation size.

Fixes: 65429ba82572 ("media: cedrus: h265: Support decoding 10-bit frames")
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus_video.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
index 9b2d24e77fdb..b7e0cbe548e6 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
@@ -511,8 +511,15 @@ static int cedrus_buf_prepare(struct vb2_buffer *vb)
 	 * (for OUTPUT buffers, if userspace passes 0 bytesused, v4l2-core sets
 	 * it to buffer length).
 	 */
-	if (V4L2_TYPE_IS_CAPTURE(vq->type))
-		vb2_set_plane_payload(vb, 0, pix_fmt->sizeimage);
+	if (V4L2_TYPE_IS_CAPTURE(vq->type)) {
+		unsigned int payload = pix_fmt->sizeimage;
+
+		if (ctx->current_codec->extra_cap_size)
+			payload -= ctx->current_codec->extra_cap_size(ctx,
+								     pix_fmt);
+
+		vb2_set_plane_payload(vb, 0, payload);
+	}
 
 	return 0;
 }

-- 
2.55.0



