Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5F760A380A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 09:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yePidvCf;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BpEISMkX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1qmmBTGs9JqDhg2KV5f+IlYN+JpILY0qcFVik6CVIpo=; b=yePidvCfvDDcbUv8bSSWCkLdkS
	JrYzDJ2TDda73SRXvq9UibpUzTjeS724l0j19qGustxzTINqCPdVWIGu1mDxiAjOqSB+0rR+s3fXI
	HWp1XTEc69OKBH4Nzk9AaNHQTNw6ZqU6PLz1e92e2T5eLF1Y1xXNYPwG6VzRIx6k92BlM42NUlTTe
	f8g5Rcnd0xKGp7kO1YTzarGDQDoUZ5/vV8A+OWV6DmUE9mGzS8AIFVL3S8w3aGz3wHEUQWHkpuzp/
	is2kJW0wqi7zHx5ieNAMl5qbdppqY+FFDbMN+jONnVaELHY+MkSemcL1OIutcslDfL12TfOX2K2i0
	BsM1zfRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRR0s-00000009LIE-3Npd;
	Thu, 12 Nov 2026 09:22:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRR0r-00000009LGu-23sV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 09:22:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 43B144595A;
	Thu, 12 Nov 2026 09:22:33 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794475353;
	b=qJ43XcreuWV9TZm9iALDHkFiT2l6BGN43GSw7RBLyphU+EZzHR0T2eIBYeW73ziwoWSw
	 epGD7hvC8nOlSOvayqADmcz0AsIVJXo5BMkU+Idy9QVvBkMSS92J3Aq+a4noBKloS5cDM
	 eI/YPX89+RbOzXsGYYbyqKo2/hcb/pMt3GyMFOkaKWjg3seJhPGyQnYI8uOTW3A2rBm7r
	 B3hw5GBzn5QbEzKS9do/1VpzgRU8HjiiOU+0dIxm18g+wInN+4DaSy9H/R6v91gLWhLRV
	 2fGQab3ItGYNtYTZ2vR/E8yEyIPwUBz+MeSjTCAni+gplffbB/hV9lVh1VRG4bF9EqQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794475353;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=1qmmBTGs9JqDhg2KV5f+IlYN+JpILY0qcFVik6CVIpo=;
	b=WRXwOCo7fvTYKXWxNpUdBhhda3p41m32zt0spd/AONGORuj2kS9dN9PQ3chz9hZyUx63
	 fB2+ssdwFyztg1f2wiB0GN3bWDooUL0pbhFmla3rUB+99ZKw+SyhPqKX0i9ADy1LQ0kNQ
	 vwCWuMZmfiNLwqzM+VRcSXYlhdp2gydQLdHDMmptncfSmFXSy4eYDW5l9jz6mp7ejE7DS
	 exx8VhnT+/9nN1ITeSLy4cHpTyxxu5tzsanWtfZjCa3JbEfw0qi+i1nh4vk02JF7ngMgK
	 Us7QhuefJIYr/Yy4BPfGAcj3IiuXJd6bS3wQuaoZsYs64AvOcL/Wn082GPiiX6zex6w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 08E851F00A05;
	Thu, 12 Nov 2026 09:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794475353;
	bh=1qmmBTGs9JqDhg2KV5f+IlYN+JpILY0qcFVik6CVIpo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=BpEISMkXprugSRPnnTxs4oGtHH1j1+k0hQ5tlGyWRvPj2SSwfWwm9seGJxw5EDrm5
	 /ifk1yzelKb5BGWuuyHjD+F/tTLKj4T1uuo+M7BVo2/17xNU7SgXMkw9H1qJ25UOCt
	 JAMPVL31jPf5dzjnQd5MTgc7qgyGDEKLCE2NG8qMCMfjw8+feeYL0j5LEjufXZB2xB
	 DpJoU3+OkSBfvo3zg0xHpIPyK3p+eyfnSTWg2kAvghHyTKAXHD2o1pK2lNo9AsH4KM
	 Qwc8LyyyReyCGbYM9Re6gsNMAd5nwDMnsX1bRAxY+oDLYQr1bHd9dmD5Ibm02BRzYx
	 U1jJYpVgto4Dg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 74EC649427;
	Thu, 12 Nov 2026 09:22:31 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Thu, 12 Nov 2026 09:22:31 +0000
Subject: [PATCH v3 1/7] arm64: dts: allwinner: h616: Cover the codec RAMP
 register
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261112-h616-zero2-dt-v3-1-1cd2664230c8@gmail.com>
References: <20261112-h616-zero2-dt-v3-0-1cd2664230c8@gmail.com>
In-Reply-To: <20261112-h616-zero2-dt-v3-0-1cd2664230c8@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Ryan Walklin <ryan@testtoast.com>, 
 Andre Przywara <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794475350; l=1252;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=BSR+K6Y2s3B1U4tlKARegXXjsMuZ0Bl9ncjh06Y7t+g=;
 b=KNTXMXut4viy9TY452JyRdQBHoNlpYPraV+pYZXj6iHthXrUN9sFQdPj54XGtu6KBbbHe/bci
 8VjlTat1qFqDwyJc0ZYw7eGKuJrtlDLtT/ly2az+tVK6uZm0NiKF7+6
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

The codec node maps 0x31c bytes, but the H616 codec has its DAC
RAMP control register at offset 0x31c (H616 user manual v1.0,
section 8.4.6.56), and the sun4i-codec driver uses it: the H616
regmap has max_register = SUN50I_H616_DAC_AC_RAMP_REG (0x31c). The
access only works because ioremap() rounds the mapping up to a page.

Grow the region to 0x320 bytes so that it covers the register.

Fixes: 3eef85034c96 ("arm64: dts: allwinner: h616: Add audio codec node")
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
index e4e0b999473e..68bd6137c316 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
@@ -806,7 +806,7 @@ spdif: spdif@5093000 {
 		codec: codec@5096000 {
 			#sound-dai-cells = <0>;
 			compatible = "allwinner,sun50i-h616-codec";
-			reg = <0x05096000 0x31c>;
+			reg = <0x05096000 0x320>;
 			interrupts = <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&ccu CLK_BUS_AUDIO_CODEC>,
 				 <&ccu CLK_AUDIO_CODEC_1X>;

-- 
2.55.0



