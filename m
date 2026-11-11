Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 320DF606A33C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 06:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nGjL/iQ1;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CpMtYLk0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=FKWK2tfwOubwz0NYfMnsGtzNrT9KfhXRngDWEiE1I+k=; b=nGjL/iQ1ir7q6U29Gv3rVtynVy
	rSSYYqIczC8HNOgVmULRK20vsOy01wAK2iFHg2sTGKpIstOBxaB4kORjE9vK954ou4AB+mangt+Yf
	JBRC5C4JCRQ4Tfgj1xCqn6vUgyQqeSNiIOIXf03WZ1/ppBvTM9V5XT2MbYXpddWk308L76mDh71dc
	CLSV18IHQ79MvsMuqpd5c+Q+YDqruaJrV+65X53ujMXysbjCkq0RSMzMVPAkGQVJKBJPhSznn/I/6
	alN++BXyyp/hflzyAFxTGuukhEtWtz/slcNYDfwOoLTgkS47Gb0X3nFnKLV6HfJqmNbwTLNCt58RP
	DH/CN1Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR1Nf-00000005guK-44Li;
	Wed, 11 Nov 2026 06:00:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR1NV-00000005gqX-1qTL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 06:00:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 356DC46ACE;
	Wed, 11 Nov 2026 06:00:13 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794376813;
	b=tGluTC7Q4yGRDyL1UX8mXkQrJsOH687bQi1Ug9Auz57rXBJB34pNVnujEGVNbAvNlTN7
	 +NkMAkGGtFeBclLCbFZaSrY8TBWyMTw2Q38MTvDYVzNLkpEd3Jxvv6+axnVnsBhNefwSd
	 Lf43UMoZQaRO7TS/rqhWCwd+KJ4RMjjMNopbX0H91oykvkQsI1UNTFIj4XGNm3KNemKWH
	 AyD0nqzOI19OB0T6+WkgMeNosFRZRCFXHOJqToxyBGLF2M+etZOQbsUBoYjlE/R99h5Ce
	 r8nuXe3ifGjnsVp2VjlGzFnBlOo4a/GRYX8ZxXwaXnX89l8cgp8lvznKZo6NqZYTebg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794376813;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=FKWK2tfwOubwz0NYfMnsGtzNrT9KfhXRngDWEiE1I+k=;
	b=hcLR2NzQ8e9hr5FEhmZr7iujlp3A7dBwRMesUWQrlGNFV5dI3fQbyoV/oWTJODUjzaka
	 DaWPPqOiSs3Ev4pEkWIIP0lbwToKAkevzVmTRzKAdD2VzRzuWYK+CT80Yu6XUo4hO+nO5
	 s+vR959QxlnxdGjN3X4crVGncXhQ3sXYHlzkFrbqwSFcfGWkbedMBmmP5MdJGotkjkSbd
	 iwGnueOK3O0WaCxlyaLVa1NFlrr4u3G9JDSeZNqDLn/spzpPjjSZZExmT5YPsjSRP9IqU
	 6h33iCtwEOxUy9Ia5gq8FnI920CqPegSlIbewFlDJkmi0Mi3vB0l4rFcVot9J/ycXaQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 287031F00A0D;
	Wed, 11 Nov 2026 06:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794376813;
	bh=FKWK2tfwOubwz0NYfMnsGtzNrT9KfhXRngDWEiE1I+k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=CpMtYLk0SZ9JMGD0MaKWfupCmjfTL4UZxIu+tJNYjfHMMtk8iDthD+U+K10DX9FKB
	 S39sybRTWFsQJzmA8JKiwZJWGlRiWgqCpr1IOJJz8lI69D1nydoAvn0u5vBjYy+0/P
	 KFFDD0f9A3X91vD0rxDc6PaZrSoGzchxmAcwQYeVni+Tz6lCXcQve0ZJvCZd0ni7xb
	 +3dZqvjXVz4xsak8Vz639JCroDbt3IBdCQk4m1L9Cye4NHVYG+fDz1gy2J4qHR8U10
	 ayitwyv1G6hamtiGlLB1ZWYO3pB7UfrumYqLFZMrLF0P65oe6mvtZs6PLlgr7n9WeY
	 8+w9MIp4TujIw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 323DD48DF2;
	Wed, 11 Nov 2026 06:00:08 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Wed, 11 Nov 2026 06:00:13 +0000
Subject: [PATCH v2 7/8] arm64: dts: allwinner: orangepi-zero2: Describe the
 SPI NOR supply
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261111-h616-zero2-dt-v2-7-88d8030fc975@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794376807; l=1094;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=koI5LGgxBRvtt44PpABti87vN3ELbNOlU9mgjrDscGI=;
 b=2CQ6LDVGiv2EC0iUm+5zPuEgt3Jsm8LTq/f7YbI63awhqKxYsof4T27Fn2j6wOGkMLVOM7DPJ
 eMOEMt+5bvXDriM7m6KvXhv2+ATUMLPbg+hEE+04XgcFP6fPzmtx84C
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

The SPI NOR core requests a "vcc" supply for the flash. It is not
described for the Orange Pi Zero2, so the core falls back to a dummy
regulator and logs at boot:

  spi-nor spi0.0: supply vcc not found, using dummy regulator

Per the Orange Pi Zero2 v1.3 schematic, the 2 MiB SPI NOR flash on SPI0
(port PC) is powered from the 3.3 V VCC-IO rail generated by ALDO1,
which already supplies port PC here. Describe it.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
index ca78d094c431..d5d39bac5915 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
@@ -148,3 +148,9 @@ &pio {
 	vcc-ph-supply = <&reg_aldo1>;
 	vcc-pi-supply = <&reg_aldo1>;
 };
+
+&spi0 {
+	flash@0 {
+		vcc-supply = <&reg_aldo1>;
+	};
+};

-- 
2.55.0



