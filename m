Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F954606A337
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 12:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4whp9oqJ;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JmG+EXuD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=X0IFJVOtpbpXX9qyQ+NjxAK8tq5FRFVx6Y0AIb9bC6k=; b=4whp9oqJYDFllXiVYcyXQLfcBC
	/EdW7pgWyc67bi493yr6STP7imHU8y6zpv9sCzRB6nVFh6wuJ/pRqTfHsBCNzcNla3awp8niw+rzv
	LmE4BA965dbVmYEAPAijnlmkuOak2cl/I+L5/LnHQGdQBAHYSqnHXKqun0KRbvJHodcK2B4qpAPTR
	217fNaz/Qjj5vDVVhFfLA3CrAriviL4Tv/0dMM+dVEuoKZYVsEHBCzl62KHi14wREHjO3qoD0iR/J
	ytLtJL1MU5x22kLS3UGwJiu4dR7JGtvnveDlZN75MU1LGa7gPhJVqbWpdSvD4XM5gZpUR9ciyXR4r
	t40OyMow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQlAf-00000003tFS-34VF;
	Tue, 10 Nov 2026 12:41:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQlAc-00000003tDE-02PV;
	Tue, 10 Nov 2026 12:41:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7728047136;
	Tue, 10 Nov 2026 12:41:49 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794314509;
	b=M137ffYybQgHxgZ5t4Ep37YiXbcieuak31EH96TvIyzumhxuP7Y9TGfFUrauYxFV6EKP
	 GlKfXM2OEM+sup9l/Zo7Tp/1uQuiWSHMUkfjJV4SR11Tc718Fa8K0SXZdE8EyKN48Jz+6
	 b1oskZve5ReshnNDBVeCx8JywV/uTar8T2XPhtZczNQb5hlApy0p/3CSgUXVdcFu8e13n
	 Ho54ay3SbNtoEBPx3iQTyLvoPmyPWEjMW7buGE8E2TiEHgjKR1TnpfXMghCFalOmVAKYg
	 6VOro9OL6TZLAz5UDnZ17E1jZ250P1kB4HLSs54E8GQXQPgn/WnQQ836VMv+r58F+oQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794314509;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=X0IFJVOtpbpXX9qyQ+NjxAK8tq5FRFVx6Y0AIb9bC6k=;
	b=lP1xupstwNQM51g4SwT1ayas2sR2LH8tYVF7tMCzvOA+KZcT0+9gid+aHOQlXsZy9GiU
	 edhLwMP0arARUCe9DvxDAyhlfAEJ2iEQn3OoFV10n2Q4GKAhw5FRLK6emRztiqdhdGjKr
	 fH0n+sDYgIhdlxfoh9tudldoUXC8o53a39DsCo2DvV6ACmY1dFu5Ce4IeZRQnxjzSXTZA
	 BMoTOftEDX/9i5dNd4pnAAx7Q97v+7d2cRxkbhL8AXlyhaBM/MKPVSvUrvvtobJwxfNtA
	 PGZPdgs7py6JAqefciqRHjUUZSuVXPvGob8QetOj9/tBSSciuUM61XJt7B7CPgwn+CA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E19151F008A3;
	Tue, 10 Nov 2026 12:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794314509;
	bh=X0IFJVOtpbpXX9qyQ+NjxAK8tq5FRFVx6Y0AIb9bC6k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=JmG+EXuDaPcGCnO8ZtMVp91vlTpI2kjGTEPB1nr0JRHewE4JiMaQ3T+Vk5RrMtu0N
	 P+F4TQBSkatPNlKLuI0/345UvXLsNlUzvnvi3kQ8gUSVCrXEFnWHanpGXjPAd31zRR
	 ANS3LxMtOmDyGIdLXrJZCUFRResFpkoXyr1qMcoylac2cDrhP5YpfbIZ0bJW2omrT7
	 ftHOEbHVBamAx8HT7OJvO8K8elHil0F3qBgqdOKPpQgLgt3g3tdZC5jtX4WkcLmLUf
	 74dUj7FGvC2ZpSECUNXiKVPxrC4S5cwTNuD9rhdtkYKTHJuSWE8e2LPSP4kfN/+K71
	 XBjTv496yn1zw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 716E048B56;
	Tue, 10 Nov 2026 12:41:47 +0000 (UTC)
From: Sergei Khomenkov via B4 Relay <devnull+shomenkow.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 15:41:46 +0300
Subject: [PATCH v2 3/3] media: verisilicon: leave room for the JPEG header
 and one stream burst
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261110-hantro-buflimit-v2-3-ff7790def9fc@gmail.com>
References: <20261110-hantro-buflimit-v2-0-ff7790def9fc@gmail.com>
In-Reply-To: <20261110-hantro-buflimit-v2-0-ff7790def9fc@gmail.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Chen-Yu Tsai <wenst@chromium.org>, 
 Hugues Fruchet <hugues.fruchet@foss.st.com>, linux-media@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Sergei Khomenkov <shomenkow@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794314506; l=1858;
 i=shomenkow@gmail.com; s=20261104; h=from:subject:message-id;
 bh=CeJV7WTdl8YyEt6UT/A5SLtk2CJudxLaFIgLvsKKuB8=;
 b=a6Kl0B0YyzxhYqxv/b89jliXBQrKiAALwDgE0BamEs0dxGx9Dj/wZSns3/8hB3anPmZ4cp3a/
 WDD3Wbae9U3DCBHdA8Zs+B3G/zVCgIKLABK1qhp6RWL8uvwdivejO63
X-Developer-Key: i=shomenkow@gmail.com; a=ed25519;
 pk=FwuHDVe7aiISDMLmQEcMC+RflEIJ6kEp/ekwznWXmI8=
X-Endpoint-Received: by B4 Relay for shomenkow@gmail.com/20261104 with
 auth_id=1409
X-Original-From: Sergei Khomenkov <shomenkow@gmail.com>
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
Reply-To: shomenkow@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Sergei Khomenkov <shomenkow@gmail.com>

hantro_try_fmt() keeps any non-zero CAPTURE sizeimage of the JPEG
encoder, however small. The CPU writes the 624-byte header into the
plane, and on the RK3026 VEPU1 the encoder then writes at least one
64-byte burst even with a stream limit of 0, so a smaller plane is
written past its end. A plane smaller than the header also makes the
WARN_ON() in hantro_h1_jpeg_enc_set_buffers() fire on every job.

Raise a smaller request to header_size + 64.

Found with an LLM coding assistant while porting mainline Linux to a
Rockchip RK3026 board; the assistant also drafted this change. Tested
on that board: a sizeimage of 1 or 600 now reads back 688, and frames
that do not fit a 688-byte plane stop exactly at its end. Not tested on
other SoCs.

Fixes: 775fec69008d ("media: add Rockchip VPU JPEG encoder driver")
Cc: stable@vger.kernel.org
Signed-off-by: Sergei Khomenkov <shomenkow@gmail.com>
---
 drivers/media/platform/verisilicon/hantro_v4l2.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c b/drivers/media/platform/verisilicon/hantro_v4l2.c
index 83af9fa1ce94..6a6d27443a5e 100644
--- a/drivers/media/platform/verisilicon/hantro_v4l2.c
+++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
@@ -394,6 +394,15 @@ static int hantro_try_fmt(const struct hantro_ctx *ctx,
 		 */
 		pix_mp->plane_fmt[0].sizeimage = fmt->header_size +
 			pix_mp->width * pix_mp->height * fmt->max_depth;
+	} else if (fmt->codec_mode == HANTRO_MODE_JPEG_ENC) {
+		/*
+		 * Room for the header and one stream burst (64 bytes on the
+		 * RK3026 VEPU1), which the encoder writes even with a stream
+		 * limit of 0.
+		 */
+		pix_mp->plane_fmt[0].sizeimage =
+			max_t(u32, pix_mp->plane_fmt[0].sizeimage,
+			      fmt->header_size + 64);
 	}
 
 	return 0;

-- 
2.53.0



