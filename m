Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6684606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 08:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JM8my7A8;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ozyO5n0n
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=CRzHgqSJ6wnWT7aGMz6+06OqkwIsCJsoPRU6TVLW0Ic=; b=JM8my7A8FI+nWy2Lvtjnm8t0Fp
	NuJQ0o2uyhOth1gfRAbWq5hcpc9M+NnanQPdYn+hQOUqCZ7zl2/I3QMhPtmEa1YkHdmVZbcBoCz1F
	pO7atAPB9n/OeLBn0sKie6h9oRHe45B6md3EbSP+G40qRmTVzTwu12vgp2YMyry5B0ot86d6x3MF9
	/RXqaUaGOeqdfr0rM8iFP5N1sdffaPCn97GMwMH+FFIAbwbjjWt1k+eXQmCsHiT6W014Wmmr1poh6
	G53+mvuDy8dmJyDflOsENQjfic6P/LhPZFHghoX9aQNJ2GL6yBidP574THZGm3xYdbyDZeruBSlli
	x2w1djoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQCq-0000000970a-1DPk;
	Thu, 12 Nov 2026 08:30:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQCo-000000096zB-0kkM;
	Thu, 12 Nov 2026 08:30:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9C0CA63B16;
	Thu, 12 Nov 2026 08:30:49 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794472249;
	b=cMQhTKFHZx7emVp2zxeMvXJwGeCUwdjW7fgO+y7ettZCwgHmc0opVImyYkkBjz+dB1Ut
	 Maq8ng77/ROgPdcF2sIl168RJOmCeVm9SQMVgwS0cZHusMt4NZymX0ofV31GCA9Mkmgs0
	 KTPaiLGnWNAknipCuGD/QWDXC8GFIfCrTnJ0PNTXPk7oJicFujDICY+LNrVbkLkYBJCO8
	 qpSr4AjYnO2NgoyogC0AA7T7K11SsdguqbIUuHAXiqD7KAWume7bbDnUDy09JCIcDr1GN
	 XWta6mENeGtGco9HlTMhFfc7ZzkFeuvUVXDrIZFvJuGdkQSLmnlTn8zaycVwdnKwcxg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794472249;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=CRzHgqSJ6wnWT7aGMz6+06OqkwIsCJsoPRU6TVLW0Ic=;
	b=Pfb50rmG3sKHOgVg9qkB5u7YlRImhf6Rh/z3OL6BuNCVNqfSJ3HYvAuguCI3cyREs97F
	 QirShG6mnWlirriu6YixVF/eubbq1N0W61EcjKuhZ96sNKrDlUS97tTpajgF/GWf5MsWB
	 Y4EGTC/5kNcQZp5Jiq7oUT3E/+xPRCJ1Ue+HHTtX/kYO63mgGpiBnZbMHYQ4aEZ3KsUAM
	 VRAM0yytMRmWvJJfNVB9TqHKViQ823uPpK3dBtMMUjs/T0GCdaK7mNhgUrpdij5Tcdzik
	 PIe3lfs7lKmDNIm18m5ZiAl3YXztq6KO6TopZJSJ88KxRVAHtY2ipcpIs+FTEpY8Bmw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 855EB1F00A07;
	Thu, 12 Nov 2026 08:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794472249;
	bh=CRzHgqSJ6wnWT7aGMz6+06OqkwIsCJsoPRU6TVLW0Ic=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=ozyO5n0nGEOwxaiVaUvnBqn8QEJ8z43xOB9rjcNRiQN3HmPYVcgqNGWGOuUHsRmHy
	 NsAteX759gwljceZ+z/ittsKGIL3YFRRTxwTKllWnaLJKVOaAhUcTaxu12E4u2xrmq
	 984UTvIfE3EqRpQz3J+yMYVZ8V29Ne+r7iu5v4135o2hGzKYJZS322dpA7LYq5kiDV
	 uEYRNtzADdSrYOnPlXadwa6hw/OzxzqTlyJOjJKo+xX8Qpnp8ytXXHAxRjCRS1vso+
	 ZZO7YVu2g8Cae/E75fH9R1KypwD9fcldg1fkK+LCg53aVs08R5HohDaQzJMWStK3fA
	 t7GG56LDoU2Fg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id ECC4E49378;
	Thu, 12 Nov 2026 08:30:47 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Thu, 12 Nov 2026 08:30:47 +0000
Subject: [PATCH v2 1/6] dt-bindings: media: rockchip,rk3568-vepu: Add the
 reset lines
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261112-hantro-robust-v2-1-18561fd48838@gmail.com>
References: <20261112-hantro-robust-v2-0-18561fd48838@gmail.com>
In-Reply-To: <20261112-hantro-robust-v2-0-18561fd48838@gmail.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, 
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Sergei Khomenkov <shomenkow@gmail.com>, 
 Tharit Tangkijwanichakul <tharitt97@gmail.com>, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794472247; l=1139;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=ugbiMmzavaBp42/wsrF8NeFbBYCV92Ge5prcqLnmtpY=;
 b=AqK100SNGkdVVsspnozjL+VIRw8W0Iu0XIueO/Y+6dVg1eQFb0Gt/pUZv4gLQ2vp3S5+j0IyO
 cdM4ItpfYoWDgyyEPLBdbkw5S6fiVQW2hYTpRKIw0R6PnvEPMCF5N9q
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

The VEPU121 encoder cores of the RK3588 each have their own AXI and AHB
reset lines in the CRU (SRST_A_JPEG_ENCODERx and SRST_H_JPEG_ENCODERx).
They are needed to recover a core that is stuck on the bus, which its
registers can't stop.

Describe them as optional, so that existing device trees stay valid.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 .../devicetree/bindings/media/rockchip,rk3568-vepu.yaml        | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-vepu.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-vepu.yaml
index d246f5d38427..e9fda4373f0f 100644
--- a/Documentation/devicetree/bindings/media/rockchip,rk3568-vepu.yaml
+++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-vepu.yaml
@@ -32,6 +32,16 @@ properties:
       - const: aclk
       - const: hclk
 
+  resets:
+    items:
+      - description: AXI reset line
+      - description: AHB reset line
+
+  reset-names:
+    items:
+      - const: axi
+      - const: ahb
+
   power-domains:
     maxItems: 1
 

-- 
2.55.0



