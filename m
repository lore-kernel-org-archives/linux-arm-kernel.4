Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87893606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 08:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lde+23eB;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hYCVeqap
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=fOPM3hh4LBz83e4Z7YTPZTeWTsOtBzW6zMBgimSztBI=; b=lde+23eBAQ4XeIeabVeY3rkvub
	MPsTkoJYZMW9PdAW/Mm6ZNxToIX7E5uecyWfeZnhUONooBd7GqWLrB9o8IfZCoaEBSUVUsyzx+Jgr
	f7vOOPDOIIFf9cWWCvjnYYHDbgdK6wyre4Pwv0IriwdWyc1QkuVp3v5yuxL+4wCc3NVw239f3qIpw
	jztv7oS823DNAY/1UofDdts3EKDo04c123XTof+hSDqSguzO+U39DcleWo8Un6B7AcAfU5YXkb9ZU
	viyfm+pPQzZHgs6QBmKHSPsfCEGjEtLTxr/OyhNRX3mu6PeEhxkFD9m3AHi11Do9pKg0KhhM9Dh3j
	1qROLsmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQDh-000000097l3-00n5;
	Thu, 12 Nov 2026 08:31:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQDN-000000097Zj-0g1n;
	Thu, 12 Nov 2026 08:31:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E5DC6459D1;
	Thu, 12 Nov 2026 08:31:24 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794472284;
	b=K2XqMwKdRb1cDFWMNnKsXIK5kWOSbY9fQKeZw8HU//fOeuvxcuJel/e6CuXPt1jK9fUY
	 hTdCSVQc2nS34uUQFqtPSvVXF6OHWVLbeekIVu8N+JUv7sBow0rarc40IhmI61+shX45p
	 gZVJ3kNDYhFLhxGjUNiDes8/vU+dGSHLpy9Xi2FRYb2vvlwv0BkKYNXaJqrjplD7JMqV/
	 cvJqlH8YJs2N73fwi/aULZTHfiHY3Sh1cCTQ5eqa+lXQKnduu0rjMUnbvJ07+T+lOGTUP
	 BlT5Jn5LqWA6daGv1PfM7B5Tfy9ZVi1vzuhIwYKhLsU/plgWBdFxA/NeIGMLmpR2ABg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794472284;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=fOPM3hh4LBz83e4Z7YTPZTeWTsOtBzW6zMBgimSztBI=;
	b=20r3iKn0C9qpG5zhyl50RdWF17DF7aGm9rwME2oEv6dwoosWe25iQuTleZPoOIauklLO
	 /W8EgTWyayTrsXBeR9YTFN+eUT9Bq7+LwhVTtaXIvdNqtQcXm0UvZwJl5nGg/g7jK+SU5
	 rRARlZeN6gNxAvfyuxtVIJCqQaFnNeOLIvGxIca1mXHNOP6QliHErfpOPibfjLA2/7G2+
	 3hVsWL/bg9LD3kE2efyMwKCRcBKwT6Lw9/8cVe9DrXF83ZKLWSgvJe1s/FhABhl1bMrIQ
	 DKjg+HAkUySz9dlW7T2hA54nSDelIIKiO2lIeuRwJCjGU322wZ9AHOdyzTEUu3oS2OQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0E7101F00A07;
	Thu, 12 Nov 2026 08:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794472284;
	bh=fOPM3hh4LBz83e4Z7YTPZTeWTsOtBzW6zMBgimSztBI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=hYCVeqaputOPHq1bAedt4CpHmKQlWY2iN0yj1cqPMNQinvkGeYPmzuG2rzRhiVACu
	 DdT6J6PioBzvyBeqJZtwZ8ecGXWV0vsgP4vSMEtk+ILiEm4eD7ETr2ar4mXZ8tpRWf
	 3ARFw2J1k7OxP7BtQMLSNIGMt0lMmV7tQBsfJCg4sdfnK7LNpxWCrSrAEPGljQJm9J
	 s7zWJcapt/kBZnYmLTQxa9+JsJcjRhiuop5ugoMCzW1i34STx3VlIhmvp5agnhyU1j
	 z8BXoSxO2s9Wr28VIAoRZHdikSgDniPMJEewPRew5TJ5E87dPMDwv4bXAXFl9XJwae
	 H4ikhmnB5KA+g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 90CE549385;
	Thu, 12 Nov 2026 08:31:23 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Thu, 12 Nov 2026 08:31:24 +0000
Subject: [PATCH v2 2/7] media: verisilicon: Enforce a minimum CAPTURE
 sizeimage for the encoder
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261112-hantro-jpeg-enc-fixes-v2-2-de03e643c75d@gmail.com>
References: <20261112-hantro-jpeg-enc-fixes-v2-0-de03e643c75d@gmail.com>
In-Reply-To: <20261112-hantro-jpeg-enc-fixes-v2-0-de03e643c75d@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794472282; l=2439;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=YQ5ecCRUVeVgOkI6N/CRbGwzdtVVxR9e29iInCuRPn8=;
 b=DkBGBOuCHyV4Q9kcGGxhfFctCWJWujliWLY1tlsvqCTAWl/NgbBA4xFiJNhh42o61ZSQZb2IM
 ddR4yNNre0BDrCvUPL2CmBJzW3PAQcLJ96AuYR7L/kpWKTsfwggoCTm
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

For coded formats hantro_try_fmt() only computes sizeimage when the
application passes 0, and otherwise accepts any value. On the encoder
that lets the CAPTURE buffers be far too small for the selected
resolution.

This is easy to hit: "v4l2-ctl --set-fmt-video=width=1920,height=1080,
pixelformat=JPEG" does G_FMT, modifies the size and calls S_FMT, so it
passes back the 6768 byte sizeimage of the 96x32 default format. The
driver accepts it for 1920x1088, the hardware runs out of stream buffer
on every frame and the encoder only produces empty buffers.

The stateful encoder specification lets the encoder adjust sizeimage to
match hardware requirements. For the encoder, clamp the requested
sizeimage up to the size already used as the default, while still
allowing applications to ask for larger buffers. The decoder behaviour
is unchanged.

Fixes: 775fec69008d ("media: add Rockchip VPU JPEG encoder driver")
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/media/platform/verisilicon/hantro_v4l2.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c b/drivers/media/platform/verisilicon/hantro_v4l2.c
index d033fe0ecef6..c4e36a79eecc 100644
--- a/drivers/media/platform/verisilicon/hantro_v4l2.c
+++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
@@ -386,14 +386,25 @@ static int hantro_try_fmt(const struct hantro_ctx *ctx,
 			pix_mp->plane_fmt[0].sizeimage +=
 				hantro_av1_mv_size(pix_mp->width,
 						   pix_mp->height);
-	} else if (!pix_mp->plane_fmt[0].sizeimage) {
+	} else {
+		u32 max_size = fmt->header_size +
+			pix_mp->width * pix_mp->height * fmt->max_depth;
+		u32 *sizeimage = &pix_mp->plane_fmt[0].sizeimage;
+
 		/*
 		 * For coded formats the application can specify
 		 * sizeimage. If the application passes a zero sizeimage,
 		 * let's default to the maximum frame size.
+		 *
+		 * On the encoder, a buffer that is too small for the
+		 * current resolution only gives failed frames, so never
+		 * let the application go below that default. Larger
+		 * values are kept.
 		 */
-		pix_mp->plane_fmt[0].sizeimage = fmt->header_size +
-			pix_mp->width * pix_mp->height * fmt->max_depth;
+		if (ctx->is_encoder)
+			*sizeimage = max(*sizeimage, max_size);
+		else if (!*sizeimage)
+			*sizeimage = max_size;
 	}
 
 	return 0;

-- 
2.55.0



