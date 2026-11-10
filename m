Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1129660A381B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 05:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lC+/mlIO;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jr5PZCIw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1qmmBTGs9JqDhg2KV5f+IlYN+JpILY0qcFVik6CVIpo=; b=lC+/mlIOKjgsD2VmmHpdy5OHK2
	0rzKJozsRoL2wGuSqRoRGMQJOs4N5ahQeq1lUv6+ybSI4Kw2m1b6p9w1AdGOm9GgPOgvaEWNEWq4B
	b+TARMN7lCkymRJC4NF5SNVyoOzeKRdrk7HI4PEtsaJsUnnAqkUgYCU823hyddhL5rjx3pYyo4yqh
	bORUVhXMz1Nw3nbW2VtTEUcCjHB1NgNdJ3nPnQ+vCJIs//x7OBnNXSdk2v75c+GFJYzRsBi94DQU/
	zeRp5fetZqQiWgfv5ZmzThw2HsMtH6pWetXwlkKLA7LoPTmM4lPzKAIJjBFw27ClMMh+tcd9IETxy
	UBbOmD1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQeXT-00000002Xei-435A;
	Tue, 10 Nov 2026 05:36:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQeXS-00000002Xdz-3Bbz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 05:36:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0544D45BDD;
	Tue, 10 Nov 2026 05:36:58 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794289017;
	b=J9FtsbkjJFM7XH+0lt5Q2W+Z1+CEcR39LWJ7eW4vsYUtlOFHx4O+agX3J3/qYFbACvW1
	 7mCRBNhMW9jmgKTjElcsOVBxwP/lILmBRxRORUWfM/Ph51fMKwi16BDzoISJ/5cgkaTGk
	 ja4BqrBKIBUv+8xuX5uLGaYmt9QM+LJi65odh4oFy6zD9B027NXZA7nqCUo2HmHJm/mJg
	 PBX5+jURXffG3ICy+aRIPTqbIJNQ9QLfosiokyLecpA7VTKOAXi/84qWjhM1kvCHWd6bS
	 jOnUTA9LYNpvqn2ZBx0i9NdnSwOr90HpPa2FbxUy4X7HUzMg7TzT57T9GKhX4OMavCQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794289017;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=1qmmBTGs9JqDhg2KV5f+IlYN+JpILY0qcFVik6CVIpo=;
	b=0IueqRRqAwPbfc1gU5Q1QPfmZFIb9Vj2/7iErsLQwLvb/QM+WOznigy0F8y22MJwymkE
	 kpK2PTbK6KHDR2V8rlRDnmHAzbokgXq+QopQSfBloMtKL+xhP225R/M21joUeI18bYNTs
	 5/prfeHEbH4wn80xPn12pAW1thGwzE3EZb6YmvIod9afX6FCOZKUYzFfWKDbFSFo1Kkqi
	 YIC8lQh2Cp3dB0VUUKwiwYLJBpYbmYWzU5C+fe6j2UWGldyhepeXDEHWoCxd0WS0CkgOx
	 5L+jdthk8T1357bQZISShuRLdpnDIaXhmpLecqGhroaw9y4iV7j0fLmTr2drD0V++mg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 19ABF1F008A1;
	Tue, 10 Nov 2026 05:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794289017;
	bh=1qmmBTGs9JqDhg2KV5f+IlYN+JpILY0qcFVik6CVIpo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Jr5PZCIwY0fFRz2nQ4EkFpekkFqHH0aOSvvVW0sZdMmIXyZC+239K1JUdkjUjt3my
	 JnHiYuWqMplIVzDWBOvVrTWNiqMtW3e3eSVx08Tm/+i6VVeXrUozsDUXLrsYHYDiOw
	 OpdhRAgsYw6AZwYNa4FVbqzFN6daMxJW5gxGW5J0jeh3IltdOyUoZlEcha8EEAiJsw
	 Hp/Y2d1CKVWaOktU0qhd7+zfqbNQaavZG1HP7C9Tj9ZvpU2uRbXwkP4VCR2RPze9be
	 vrratBvUWUPi/kZcvGJMJDDJh3h3Rox5xx3dDgN7mMZotX2Q0LPkUoJroHJ0H+rDGY
	 O+APREBv3xunw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 925474889D;
	Tue, 10 Nov 2026 05:36:56 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 05:36:55 +0000
Subject: [PATCH 1/8] arm64: dts: allwinner: h616: Cover the codec RAMP
 register
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261110-h616-zero2-dt-v1-1-05506d760f21@gmail.com>
References: <20261110-h616-zero2-dt-v1-0-05506d760f21@gmail.com>
In-Reply-To: <20261110-h616-zero2-dt-v1-0-05506d760f21@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Ryan Walklin <ryan@testtoast.com>, 
 Andre Przywara <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794289015; l=1252;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=BSR+K6Y2s3B1U4tlKARegXXjsMuZ0Bl9ncjh06Y7t+g=;
 b=F8+sGiy59SecjOOHu2S85UUAAYQ7TffzPe3QK/d/ww7kTf9DBio3QsJ9MF8X8ldXki5ASmFer
 Pqnsac5Ps1BCGvKU10OSa04i6E1DPFTwtCdQA/zUyGjycb8JwviSq/2
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



