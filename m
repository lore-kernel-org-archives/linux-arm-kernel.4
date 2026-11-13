Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B49FD606A883
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 16:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TQwvBHjp;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FaAh4chl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ftkGVaWmlEcBnSmz/bQQARpxpmtHnb04sqbnV5md88k=; b=TQwvBHjpQ92o41y8g2CiRKcPAk
	6sZU96GQ8l1iM7ONCoM/b0jNv26klKvmfA919Fy4t2rKfMmr15xhcW3dnSgq7gWPMjxWJElff2xxB
	rTKIJG3PqI9WxOpxA9F2Ib8pq9SNQZ2VcWEfEgR8v3Xaw9rzkgrJQxUtVD7lMlVXuSzgVuL+3gpQt
	AwdR/d/BL2PAWUb63HU5P6FGb2PTqQJd0VGNi6j3lwS6sBn1Cdl5I4EmNsKnPn0BqvzVUup7nK0+c
	810ZG0nFYyverufb3JLfS6xWSyoXaoYtGFButOP4HzBK0wmByr6AUMKgGyN+aJJoTdx4Fy0WnBg91
	aVPFhRiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRuL8-0000000Dbkv-106e;
	Fri, 13 Nov 2026 16:41:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRuKM-0000000Daya-0dG9;
	Fri, 13 Nov 2026 16:40:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E1A874641C;
	Fri, 13 Nov 2026 16:40:37 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794588037;
	b=jYQ+qyfYzydhddR+2VlsA2+x8jk2mX05EQCZZHvxM/vqEss335rq9wtH7MYilyEY/qF0
	 p7j0g2vEh7IFAiMFTsYRaOjiC9pmyZj843WzFt2tx71gBseoY6c2mPJHHJKg3vrkxdqoc
	 MRR1w5rOCifdJSGd8pRq+EZSEcqCp1K7jRH9LSWky0WFYCmdWJeSTJryZoP+bKgjTeb6X
	 znKWZeT9KuSlwSIu5ld+CN0Ib4Co4BQZon0gmhLOAtrkcAksJ0yVPRmCM6GYqABdfpA3U
	 mdkKA27SgRJofJGBdnAIHDyY43CrCV8RO9n6KvcabX7orTZO/VTbreCiYJD2OkK0k3A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794588037;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ftkGVaWmlEcBnSmz/bQQARpxpmtHnb04sqbnV5md88k=;
	b=koxsb38HhK07p+cg9DYxk8zWWZLhvQLlVKX4zpGbvD15PXwhg0c1QO41i7Is8x8MU19U
	 e/FdirlPxRZQkh7/z29kP4pnk5Exl2BbyBtPOGg/cYAUau1r7jbLtccUfN/SpuI/rz43+
	 sYsWv1bNrKcp+KpjxfU88flsIH6b8Gyp6fBDvYrXm0MK2NZriHQ5c8foN/lsOJwiDtccK
	 s165E+hG+JSukME8tTHh+xj+EqHri0U9AJ9oV3NLoeOnug3o5apZTz1XVF1rp1OizksTj
	 aXbBlaMBJT6YfQ0fHsxoQVgMd/NeWOOi9BNAggocFGadqD7laRXQkehrIVgw6jutCnQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 124031F0092F;
	Fri, 13 Nov 2026 16:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794588037;
	bh=ftkGVaWmlEcBnSmz/bQQARpxpmtHnb04sqbnV5md88k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=FaAh4chl/Yil0oZC/EyZYFF45BoK7wbj8rYXoVVSOQsksOy9+Z4iuZp2i2jPy53+X
	 fr4F7IPuo3rrMRgTyecyN8ttAp+ZmljX6ghER6avcgi56iP3zhhhKGbzP+r+s/z6KG
	 vk2SgIEEE5EXvxB+Rh3KUgwpKh4qz+n0zylyE1gcbQZau/dtaJfcYPpihCjtQgBlXU
	 pAPzpQMbQUIIMZtkT0aKvXcM8uPZccNR1V6ezt165w8BSGnqWCHiMLb4FaJhL/D6X+
	 A2mERFdOhMQERa/kCaRCVKhZbXocP/44tPZKxzsHY3KHeKiQPWu5Zppw91UA1WtlY6
	 O4K8NM+QDaeNw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C800749A03;
	Fri, 13 Nov 2026 16:40:33 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Fri, 13 Nov 2026 16:40:43 +0000
Subject: [PATCH v3 12/12] arm64: dts: rockchip: Add the reset lines of the
 RK3588 AV1 IOMMU
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261113-hantro-robust-v3-12-82383c722ad2@gmail.com>
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
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794588032; l=991;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=N909YZvJDjc6Eq9/44zn9avdFUylGlgxFkCrBk5+cUM=;
 b=BQaN2uqxim4dpFhP/YfDh38Y5VbQnw/qqCKpdYq505D02a2a7pNhN8nd1rWuZzk6Z/6s7djyT
 2zG3b+iEGYwDzl3rfH1HhcujKURdiCZ04KKgu5HoqY+GBRm4100xBmA
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

The AV1 IOMMU shares the four AV1 resets with the decoder. Describe
them, so that its driver deasserts them before using its registers.

This needs the decoder to get them as released controls ("media:
verisilicon: Acquire the reset lines only while using them").

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index 227465d446a2..96898fefe840 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -1491,6 +1491,8 @@ av1d_mmu: iommu@fdca0000 {
 		clock-names = "core", "iface";
 		#iommu-cells = <0>;
 		power-domains = <&power RK3588_PD_AV1>;
+		resets = <&cru SRST_A_AV1>, <&cru SRST_A_AV1_BIU>,
+			 <&cru SRST_P_AV1>, <&cru SRST_P_AV1_BIU>;
 	};
 
 	vicap: video-capture@fdce0000 {

-- 
2.55.0



