Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7D260A381D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 06:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uwcYErrG;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mz64vY5J
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6mbZCUTv70VlpZsgPw+uhGGcoEUvKC9H4qZpsqc1/Xw=; b=uwcYErrG+5gn73FyCq2iiL+WNf
	gxHTN2HJBsVxBlJ4piKl0CXzl3sskpqODeNBvRNo5BM0PrnGOEoZ3RmQBQLTfpFO4EGA6g/Oeb5f2
	6hsFm7xl+tYaGMjPUbIN66d7DRjPCEQuzBCujVULvvHMCwm3iIOq2XtflrHpuq1AHxwgx/D2QMx/O
	bVr3LOotjQvEQsNAghpqkEyC20v7XMaKPGNJgvJY1ycErRzRqC4wMg47008AMu9cIsU/quvGRbYug
	stmvmo99yaxg7lITR6V2O9tIU/Qw0muUBJ1L0SkYQlrsCmAkpwwnxBljR4ft+pLkCEMf142OU70Tu
	d8Yq0JSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR1Nf-00000005gtr-3OGA;
	Wed, 11 Nov 2026 06:00:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR1NV-00000005gqM-0iWZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 06:00:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E618545BFA;
	Wed, 11 Nov 2026 06:00:12 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794376812;
	b=fkMhi4tLveRcxN0I5V3micrydD47uYEKqoHRlpKP5ZfnVuSAY/fBNB0WgcxDY9R98XK9
	 YHslNYQ+gUnfHjrzIWFxpsRcQlPxqoOaN8pZbpfXFuX424OQKZUZiHXGbtO42kZEbJc6V
	 yi89y5DhXuczyIBq28v/lPzgiMEn1wNeA3eO2+t65OIUY/Q45TutA6HbdR40GyYp88HP2
	 XnmjJS31rCbNczmaxw5xA9FhnAcD8Nxy81z2Tl5qtVF7BsqAXv7tYL32R6kos7hYmZTGx
	 aU0RemovuzTP3BeQ5IrnLWfOX5bFDKJfRs6qPlUkMjUgsP4IuriHBDHMa3VYdzDao6Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794376812;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=6mbZCUTv70VlpZsgPw+uhGGcoEUvKC9H4qZpsqc1/Xw=;
	b=sWkbMXHBqOKersZwLNUbWhTHYXReaxxCW+QTIzaMs5rluIO8MeE1GyT/9dOUifjTrftL
	 wgtyi7WJCTFJPnc/XC91fqjvRXpI899IfxayU9ckZL2MHnZE46+wMK1CLR+g9AZdJeo2q
	 gR5xyyV4MKaq27ZxTwOBqqTiBfueH5CXXhMAX25XAl5Ixmr6PT4MtXCQ3l28LRh0H+AqF
	 UBzMPzMbkBoGyvr4LGRKdy06V66F4cS6CeylPgW65bzuBsvUrW3Zv/QPviFFl09Gl/545
	 T7yp0GkD07RzZcAYzwbvh8574nX2JRYlF8AC5yrcp38v7DR5YP2p0a39IRZTEJrMH5A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 226201F00A07;
	Wed, 11 Nov 2026 06:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794376812;
	bh=6mbZCUTv70VlpZsgPw+uhGGcoEUvKC9H4qZpsqc1/Xw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=mz64vY5JhtCAR/RK436dF/IhAVCtM+1emI8/WeTT5cbjy25HPr71bbWkAzy3cnZ7t
	 BAC8RgUpYrZbDSSk3h4pljNLuN7C6nLgkDF2QwS3SV4GVyh5iVa2onnWnz/O40ILjH
	 iM0VxWMc+plkUXqm8Lh8O06eQZCNiV2ZFFJobekVmiiVmFMeCScfH+J/tlEqavMSjy
	 4hQupwNJVhK7IPaNHuWF+v9iGSPJQKRIh7lrzN0HPa4SyG8Gcn+UIlh7KnXQ+BbkV8
	 1oK1uLc6QxqqjEXUdZp1QnKRhciJqgXQJ7frYDNejDcCogRkI8Wc00mLaUJL+pjeDx
	 ziLsH9JeNVjvg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 2165348DEE;
	Wed, 11 Nov 2026 06:00:08 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Wed, 11 Nov 2026 06:00:12 +0000
Subject: [PATCH v2 6/8] arm64: dts: allwinner: orangepi-zero2: Enable GPU
 DVFS
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261111-h616-zero2-dt-v2-6-88d8030fc975@gmail.com>
References: <20261111-h616-zero2-dt-v2-0-88d8030fc975@gmail.com>
In-Reply-To: <20261111-h616-zero2-dt-v2-0-88d8030fc975@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Ryan Walklin <ryan@testtoast.com>, 
 Andre Przywara <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794376807; l=990;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=5MPJQC1S+CHiR8Bt9vkp2Zk5ZwEghmC4r8Nx+9ugUME=;
 b=87DXPy99NnGEeLVD0wtNkkEfGbzg7aHpEpdfOqHgzEVS3BS5k5Ps5iDC7Mr9PY0dpH9SFYz7H
 lWW2d9+2J7qDZ/kHX0wHgWiLG6xJ3+HHXqfdQmkVsCYT0/SFBjjg74X
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

The Mali-G31 on the Orange Pi Zero2 runs at a fixed clock. Include the
H616 GPU OPP table so that panfrost registers a devfreq device and
scales the GPU between 306 and 600 MHz with load. The voltage window
of every operating point overlaps the 900 to 990 mV range of the GPU
supply (AXP305 DCDCC, mali-supply).

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
index 719d6dadf7bf..ca78d094c431 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
@@ -7,6 +7,7 @@
 
 #include "sun50i-h616-orangepi-zero.dtsi"
 #include "sun50i-h616-cpu-opp.dtsi"
+#include "sun50i-h616-gpu-opp.dtsi"
 
 / {
 	model = "OrangePi Zero2";

-- 
2.55.0



