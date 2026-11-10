Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB76606D620
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 07:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2JdJ3JO4;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iItqnJb2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=nCNqgv9PYX/bu2eBrr5KHQ3LSuxnSj+JlYBvie8p9IU=; b=2JdJ3JO4cjRy+RvcOxE9rNmtWe
	mxWfK0LVesx4CH2/0aHjSd1hcM2MIcWWqioW7J8rYnJIXfZa9n3WgakZNNfBY0ZCs2i5BPH61/1fo
	svCAOwd11Z4M+O8UUnzfr/OEYQQwdqqEIo1B7bqRyCLnCA5gv2pvfUsQ+8lLMLTIFLfbOBBlo8z1k
	XaO7vPordZ95mcve3eagOC9ar3kRFFWFQdQFUHgS0u8c/tbIMEx07+82xasHwNdxvpFL3YHB1O/Tq
	FfPtuEM3X5G+Iq4b1H2/HO60XuIq+a3l6uJVLHv/U9iMer1atvK2W5mrFQyJ7DBFG5DIsIBi9dyMV
	adLO+quA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQg8Y-00000002r3U-3EnZ;
	Tue, 10 Nov 2026 07:19:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQg7l-00000002ppD-2LmP;
	Tue, 10 Nov 2026 07:18:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0E5FE637C9;
	Tue, 10 Nov 2026 07:18:32 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794295111;
	b=cXu1xgZF+kgpmr6ufbSneTMqBtw6IhYUpByRoRKnxZYbgh4eKNT70U7pk5h243i4o/3j
	 fR4yN3k6SlJ8dgKqdFdJq7U3x3/pT9sEqs1EEeFpAPHKaRJLUdkkUZIiw/ogqxeNg+29N
	 67j4pzVBuNYnxrisgmIwYno9j2vKA4E1JJpeBcFEjmJnwyZfmipF2bxjSlwlucF0Het8b
	 SFp9o/ncTpui27LfN7e4rRtABplBFGWjp7cpobq0HonlPmfRDPJTLlfIGDki1/cqeh9xT
	 deYM/71priL1AQoHY5IObZo8HINAxyX3xC08/IWzARAV3KFNwHISZXkZSCGwKZI/7qA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794295111;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=nCNqgv9PYX/bu2eBrr5KHQ3LSuxnSj+JlYBvie8p9IU=;
	b=QOXsC/u0hyAQoejpml8+uUllPE7WRsbnGyS9dHMFsT9UOdD1S4gCkSai07KhhFxyQkVl
	 hdEBxzUq5qKCqUVeyzqsflua7IGLE/qHhRRzSd054u10sxKh8x7i/0O783DBSCgC7k7N6
	 x01qSArBzipEK0rUrvo0lNqVwlklQkN+ELbZvtbjeqU2AbIaXZPOC43PvR7dLXzrfr9Yr
	 7wcTBOEzLDQtmoJFFIYBjlLNeDFRHORxMtQoTFPJsFUYO5ygejxH0IKng/8rrLzvjrhD/
	 t/oqGFB1KHwK7/4g/TCw+wvdlhSOcARiwDDcS8BHNaUcyUM88/nqIbggySSn+OK9tlQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E87081F008A5;
	Tue, 10 Nov 2026 07:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794295111;
	bh=nCNqgv9PYX/bu2eBrr5KHQ3LSuxnSj+JlYBvie8p9IU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=iItqnJb2Ts0Zy2ZnVdidJbhm8v0n2LpDVNogtmEXbYV4RI2QM+7TCSvAW/icNwKaK
	 iEj3fndZSB+rMtrEWk1YKDKd3sXEoDmp6j4utLg/lNP/pQcpfVABk/DPkBwuGzI1N5
	 rRpIRnlMikuGShuNHUeOO4rtw8509XS3HrSOESrUwQGXIgUUDjtWboN0BltxreCPh4
	 ZVHqDqTvL5jmODDTl4YRMVdN18T3E3pqDuOcFCo5usgBZIg1cKc2wlCABjfjVXS8EH
	 ozUWkzmo54FbD7qmG0ed/87yVb69Ft89lrDFD7SZCb1p1JltQPeooeE1Kh6hTpQw+4
	 jube0AG26S4cQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 7B6DA489A9;
	Tue, 10 Nov 2026 07:18:30 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 07:18:31 +0000
Subject: [PATCH 2/2] media: rkvdec: vdpu381: Compress the co-located motion
 vectors of HEVC
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261110-rkvdec-colmv-v1-2-012b84ea43f7@gmail.com>
References: <20261110-rkvdec-colmv-v1-0-012b84ea43f7@gmail.com>
In-Reply-To: <20261110-rkvdec-colmv-v1-0-012b84ea43f7@gmail.com>
To: Detlev Casanova <detlev.casanova@collabora.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794295110; l=1292;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=aR2E6mm8VmFdhqxcYYQcTYrdQAfdhAGApJk/FfwVCSs=;
 b=Nvipk1pBnacMtoHPhiijMXW93iXUPSvrqtmt0lMr1tJZacZiL4eED7FMRpbuGsIKUa1Msib3t
 TFp4Pa0RMT0Duq3WRTpwMMWQ0EvjVbUxGJdFEv3Dw+olWBZPvBj1N1O
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

Like for H.264, store the co-located motion vectors of HEVC frames
compressed, which the vendor code (MPP, hal_h265d_vdpu34x.c) always
does. The previous commit reserved space for the compressed layout.

On RK3588, a 24 Mbit/s 3840x2160 HEVC stream (240 frames, x265
ultrafast) decodes at 104.6 fps instead of 98.6-102.8 fps, and the
decoded frames are identical.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c
index e1936e87f45b..2473c176b319 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c
@@ -404,6 +404,9 @@ static void config_registers(struct rkvdec_ctx *ctx,
 	/* Set HEVC mode */
 	regs->common.reg009_dec_mode.dec_mode = VDPU381_MODE_HEVC;
 
+	/* Store the co-located motion vectors compressed, as for H.264 */
+	regs->common.reg012_secondary_en.colmv_compress_en = 1;
+
 	/* Set config */
 	regs->common.reg011_important_en.buf_empty_en = 1;
 	regs->common.reg011_important_en.dec_clkgate_e = 1;

-- 
2.55.0



