Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C68606A334
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 12:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0sIrkWxb;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SDyFU37T
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=i09EVYkN3X8Qw7KV5e6VdKei58gZnsyVQwm1zc9UbTA=; b=0sIrkWxbzomQMTMwxFnq0lOjpa
	OvgZAOEmseGXedc/+JUJJ1GFNnLPjvylRX3PcDfnHlsHpZ6EmW7XdYwzTEs8tbnUYERXBCK/CFz0Q
	BBXUJXVw7UsHubk7xtnPK8l3ndv0ozlUzqRN3BzjbfyATikCkZFZcj6Ifmo4lVUmsTAjtCYqZvxyF
	NhdOalqyViBXd6+f2MfBLQ+e4LHEYI9zEzpZX2lbHv6hM2f+9NufJXa0XukZV1VaGC1gfj1jzcARj
	U4Zz2t03OcdsSvRRkRmkSKOs/ZymZhC3hWH1co0OzF174uDjyRPXRUn8Y1XGFnlDeYgxIxi5OBfaF
	qeRtynng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQlAf-00000003tFk-3eSU;
	Tue, 10 Nov 2026 12:41:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQlAb-00000003tDL-49BQ;
	Tue, 10 Nov 2026 12:41:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6F8DB6388A;
	Tue, 10 Nov 2026 12:41:49 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794314509;
	b=muh7HJWnwEHCQtN6+bRJxY6kr4XQx1ztXHmwNUTmG8/FVNzZmu7kceNVX8Qj4vr8eLeF
	 eXB7U0cgfDdLQVmCNNYmmbqDjhDhg+xSHz+notGzkDtqSDhYvorg0mcTbAIdqXtIPJxjx
	 Y3COrYyimlO5InHpd92zqWYmCQlBIyx7+wr+Z4yOawNwO8uYiwtw7I6D6gWplS/eQEkNR
	 ++/1dFzt36Ka8LgYBt0B8UN93kXKdW6duIVUMnXfaUCmSR7RhH1GpfXpf1EXvOvjGnfiT
	 iu77qoinJjDO2u3LQygGxmniSWowNlDrdthF2baE0sTOXZs9+nT7ozxp8vKU/8vSZzQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794314509;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=i09EVYkN3X8Qw7KV5e6VdKei58gZnsyVQwm1zc9UbTA=;
	b=YMUMR7+YruH3rt9oMPvFhd3oqW+g3EGVMVhs4X91A6k/tRCBGCki9cLVGy2suNZcd+u9
	 0J3pLLtXyD9OLXJgeHhJP3UuOpywuh9EzcyzuyJ6GMoK8WRlXd/oQcYKiS27oStOBZh4H
	 s5e4hUtHEkS80nVkawjTTo14uyxZVb7leDNG4Hl528M2pj2EyDl8ycJznv61ifUEdalwH
	 p8X5qJD2dMrRvAe6V7Hrz77SvZtYrx3OFqiRkved69yhDr/zv/eZQtA7K1V+3lK/sNrOY
	 VpmMNbpBfBunFYf1uNabFg3dLO9LDR0aawcHdfqEf4KeUz8P/ZZcDfw05+o8+W5722A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D224B1F008A2;
	Tue, 10 Nov 2026 12:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794314509;
	bh=i09EVYkN3X8Qw7KV5e6VdKei58gZnsyVQwm1zc9UbTA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=SDyFU37TscF0oD6Pm56C3Cks2z1TToStlWkcIzSiu7k2UZ5qt/gnl3Uld/JLtVE6P
	 URHUpZ/SmLHENaRNFSL3XUGOQXUwieU9A4eM0Vr8cssMKLOgHjXZywpiu5bdIHkdAk
	 aXcjDUQu+X/2C5K59AcT35qRaeKVhWbVSg7LXaH8YMfPSK+kHhiENZnks3nWnWTgB+
	 8J5hHYvLt8L5m7Ey5neJIPRgTyFgsna/wIpCAHyW0SYnYZQR5DF3W7yumLqVox3LzP
	 PBjKQg3fpvA7stNFm+2Xd93eDA0dPQqhdIHnQzYV+pw2zP+ih+t5rEF+ZN8zRlYynF
	 ze1kEpr59lmWA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 5D04748B52;
	Tue, 10 Nov 2026 12:41:47 +0000 (UTC)
From: Sergei Khomenkov via B4 Relay <devnull+shomenkow.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 15:41:45 +0300
Subject: [PATCH v2 2/3] media: verisilicon: program the H1 JPEG stream
 limit in 64-bit words
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261110-hantro-buflimit-v2-2-ff7790def9fc@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794314506; l=2059;
 i=shomenkow@gmail.com; s=20261104; h=from:subject:message-id;
 bh=rSixJW+4SIvnxSyMoeLcNv71TQPTVPSPPdIZPn8IhxE=;
 b=rZnn4NFdWljPtdenIbYFVQCzkOroyvKYlmdGUI5ooGa+U4zK58oD4WfY32zIqxq2Hfq4rWxuN
 8s+/6csbyvVA6SX20juy4wkJtJWVLjQoFbNCblknsk6EKf4Mi32K267
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

H1_REG_STR_BUF_LIMIT counts 64-bit words, but the driver writes the room
left in the CAPTURE plane in bytes. A stream that does not fit, such as
a quality 100 frame of noise in a default-sized buffer, is then written
past the end of the plane, up to eight times its size.

Write the limit in 64-bit words, rounded down to whole 64-byte bursts:
the encoder finishes a burst it has started, so an unrounded limit lets
it write up to 56 bytes past it.

Found with an LLM coding assistant while porting mainline Linux to a
Rockchip RK3026 board; the assistant also drafted this change. Tested
on that board: overflowing frames now stop at the programmed limit
without writing past the plane, and frames that fit are byte for byte
the same as before. Not tested on other SoCs, including the STM32MP25,
which shares this code.

Fixes: 775fec69008d ("media: add Rockchip VPU JPEG encoder driver")
Cc: stable@vger.kernel.org
Signed-off-by: Sergei Khomenkov <shomenkow@gmail.com>
---
 drivers/media/platform/verisilicon/hantro_h1_jpeg_enc.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/verisilicon/hantro_h1_jpeg_enc.c b/drivers/media/platform/verisilicon/hantro_h1_jpeg_enc.c
index 86cc1a07026f..665a87e9fe92 100644
--- a/drivers/media/platform/verisilicon/hantro_h1_jpeg_enc.c
+++ b/drivers/media/platform/verisilicon/hantro_h1_jpeg_enc.c
@@ -55,7 +55,12 @@ static void hantro_h1_jpeg_enc_set_buffers(struct hantro_dev *vpu,
 	vepu_write_relaxed(vpu, vb2_dma_contig_plane_dma_addr(dst_buf, 0) +
 				ctx->vpu_dst_fmt->header_size,
 			   H1_REG_ADDR_OUTPUT_STREAM);
-	vepu_write_relaxed(vpu, size_left, H1_REG_STR_BUF_LIMIT);
+	/*
+	 * The limit is in 64-bit words. The encoder finishes a 64-byte burst
+	 * it has started (measured on the RK3026), so give it whole bursts.
+	 */
+	vepu_write_relaxed(vpu, round_down(size_left, 64) / 8,
+			   H1_REG_STR_BUF_LIMIT);
 
 	if (pix_fmt->num_planes == 1) {
 		src[0] = vb2_dma_contig_plane_dma_addr(src_buf, 0);

-- 
2.53.0



