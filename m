Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45B7606A8AC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 16:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NRFKPkce;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VDr6mC19
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=OZCIHbTkBuyVirzrgZ0HMwGGiwpqM+aCNKiZrR08Zfg=; b=NRFKPkceg6rWQ2hiWqiI++OYUu
	+hU6WEGqNWmZ5zXVcfJlW3xV2puDOSQq70LOgytcPkIFj/RPq9xmm7hvhxoyOEL/efHrn6nrL+Ggr
	kehmnYdWXr2hvDWwMp1x3800fLYAW8IrYkwSBJ7M+m1qc6X+caMAyb1QHQbtw/gEwCzSyP2MPS01L
	2r+/TRrpBF05/aN6hlBTom1Oh9x7vLb645rvEygOCBJmgr6Cqb7VLEq37zPupKywgLBQ6S3Dduhpc
	pSIjuMfwdvpm6yNtXjmQXxTvJdRwUO7ydP2lrHW04xaBQfMYIf5Ov863o4+GR4FjfaQjyGHp94uAm
	pREQFfig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRuLG-0000000DbzF-2AGa;
	Fri, 13 Nov 2026 16:41:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRuKN-0000000Db04-202q;
	Fri, 13 Nov 2026 16:40:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E5F0462933;
	Fri, 13 Nov 2026 16:40:38 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794588038;
	b=Cg+s8CHiAmQqJZoMioaeQljye45tqVRsDCAsGSp7RLE6eVDJ/mBQHxvMpWflKarPAErj
	 matjhN4si/3kKe64b5e1/tKwhy6uz49bn1NcUijNvEL1u2T8EWSjvQuFjlKAm6yQjtweU
	 IMfJHgZ0g53SasroA7AX/Tm5yhonTnAeiPWfe4gQfywd4GyDQ/LRJFoRpiPiM5OJsk/hg
	 h4HGK53YgdY4uYqQKIqEDAhrYhxUiPeN3Q6QVRRQ8h+c53/8qDF+KHVmcJI1LQmauM+Yg
	 4XYTdpHv40L+9fVr6U0pus5b5WQAt/+I2865eez9UqyL5clSq9oHJtDd75E43ieLo/g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794588038;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=OZCIHbTkBuyVirzrgZ0HMwGGiwpqM+aCNKiZrR08Zfg=;
	b=ttX0AO5rVs460U56d2z4VJtcm0WWGCdOyADekfrmiY8hTFcFobF8HtUkffjr2m35SjK9
	 PpgpaBWhUOhW4BmJJSvYchMGhTZNNyVZonN8oj/bmL9OKA0EFYmriQU/NVZwcF4ijynSO
	 cChAKqajsMhD3ica1YUIqaKUwVcRkv3u03wWjSR3awR1R1smU5AA/fr//PlnR1SwG5cAo
	 vTVejkumMTWrckEJG4bSLvGqJvAliRB9ITTPbBCJYfg+4WzmPNZincoqyr64oYy24rMgB
	 fQYkY6dbqxCcnTvguayHU8fkpNznHMpbBnfH3tWo2EWRWuYmjX2acFRYG0Y4CBI0hew==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 492271F000C5;
	Fri, 13 Nov 2026 16:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794588038;
	bh=OZCIHbTkBuyVirzrgZ0HMwGGiwpqM+aCNKiZrR08Zfg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=VDr6mC19K6U45zJjmotPPcmT28r9SwydFqpl6tKBwAk7axBtVHBWYDm0fyM+KF912
	 o4eLqBqF5lFs6+//O4GN2e9iN6+r5grs5jbkMbtOx8qMJkEkxbGQhkXjo1KZTWGqPM
	 anJmPO1Xh1Vt9XJVWnrdAZgjVmefTklT9bs1nBFoLiWyj++fyILwzzI/cQW6x3kYtt
	 e/uChKntja2628R5vMbDxcGlBycZ8Yx9ySPcPSFL92Ix5NphjDgt3hqnF5RJEcg8eJ
	 dXQejC7cfoRHmKDZZ75/3rI9u7ahN7oF7jT+SOuY3kALUH2dnq5dgxoRc2H+5JlRcQ
	 kXrixRp6Ut8Kw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 25BC8499E7;
	Fri, 13 Nov 2026 16:40:33 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Fri, 13 Nov 2026 16:40:36 +0000
Subject: [PATCH v3 05/12] media: verisilicon: Enable the Rockchip encoder
 interrupt again after a reset
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261113-hantro-robust-v3-5-82383c722ad2@gmail.com>
References: <20261113-hantro-robust-v3-0-82383c722ad2@gmail.com>
In-Reply-To: <20261113-hantro-robust-v3-0-82383c722ad2@gmail.com>
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
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>
Cc: linux-media@vger.kernel.org, iommu@lists.linux.dev, 
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sergei Khomenkov <shomenkow@gmail.com>, 
 Tharit Tangkijwanichakul <tharitt97@gmail.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Arun Iyengar <aiyengar1990@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794588032; l=1763;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=+x7MAvTN4ercbfI9R+yr1fEuEHWiIaV4thCiEwGlL7Q=;
 b=DmmH1x6jQBsbYSOBHBaVgphBTbVvRTk3LmuShnbMWCcdllIPzSyNpvrxNu7zr7MgNbWCHasO4
 qoCujNxrwL7BC1hMjPTAFrPBIE+y6ju5hZnMRno+q5aS/5QDlT+FKWO
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

The reset operations of the Rockchip VEPU1 and VEPU2 encoders disable
the encoder interrupt before stopping the encoder. Nothing enables it
again: the encoder run functions don't write the interrupt register,
only the interrupt handler does. Every later job on the encoder then
times out as well.

Clear the interrupt register at the end of the reset, as the interrupt
handler does after each frame.

Fixes: 775fec69008d ("media: add Rockchip VPU JPEG encoder driver")
Cc: stable@vger.kernel.org
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/media/platform/verisilicon/rockchip_vpu_hw.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c b/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
index 02673be9878e..ce3dbea70a8d 100644
--- a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
+++ b/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
@@ -475,6 +475,8 @@ static void rockchip_vpu1_enc_reset(struct hantro_ctx *ctx)
 	vepu_write(vpu, H1_REG_INTERRUPT_DIS_BIT, H1_REG_INTERRUPT);
 	vepu_write(vpu, 0, H1_REG_ENC_CTRL);
 	vepu_write(vpu, 0, H1_REG_AXI_CTRL);
+	/* Only the interrupt handler writes this register: enable the interrupt again. */
+	vepu_write(vpu, 0, H1_REG_INTERRUPT);
 }
 
 static void rockchip_vpu2_dec_reset(struct hantro_ctx *ctx)
@@ -493,6 +495,8 @@ static void rockchip_vpu2_enc_reset(struct hantro_ctx *ctx)
 	vepu_write(vpu, VEPU_REG_INTERRUPT_DIS_BIT, VEPU_REG_INTERRUPT);
 	vepu_write(vpu, 0, VEPU_REG_ENCODE_START);
 	vepu_write(vpu, 0, VEPU_REG_AXI_CTRL);
+	/* Only the interrupt handler writes this register: enable the interrupt again. */
+	vepu_write(vpu, 0, VEPU_REG_INTERRUPT);
 }
 
 /*

-- 
2.55.0



