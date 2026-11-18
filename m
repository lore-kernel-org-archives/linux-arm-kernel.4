Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8412A606A33A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 11:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JYKOJYAw;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W8SAR8Sy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3GvLecrDY2H3kso6C66DvG+vyP5D+kTS+VYHd/DxRd4=; b=JYKOJYAwBw1lvFiOv75q/kTwJC
	smlPkfOY8bSmtT+5n7E/ULEd7Iy+sVgr27nmRmjgzySkxX3pKxyO05CiMnp8rTX+0eqRNVzE/abfI
	u7ofgBK4apOVbCCDq1izW/3kqJkfHFCF0wdN+MbKVyGW7hofof/zcdKmRkal+NZneGVqxQgbORmfT
	NEZaGG83PDnJt7iEMoMiUY+mDFCtgqVLkE0nY5qqXROQ5R8DI5Mzt9Wx0kxSsFdVozdOINNzyaxnw
	VfN9oIftuPQ1C9LesbUyyGRGuVuR/mtoeg0E2M6pAAtIm8gZZ4sCzNzNlpdgKbLI/dL9hqx8XbMJ+
	SiJuEkwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTdOt-00000008eyG-2bvh;
	Wed, 18 Nov 2026 11:00:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTdOm-00000008euM-2UJu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 11:00:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0C76861DEA;
	Wed, 18 Nov 2026 11:00:20 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794999619;
	b=ZqxZvmBhA7bMLnVBFic4ZL9sHX9+wkxS4gJcq2FD6FjxZKHSO3vzVvuOtIctEeC3z+Ry
	 xc2VjhhjpYw+eeuY7V5OoEvIwR+KNdGkUnZ88KA7EmAUc1NySvC9FdVLdvL6kXhJNNoeN
	 c4Blfve2TAZNCQPBXCiRi449lk4xfUTuAqM06u+XJ0to8RYbB6R+42KaHocS5np0w+L8X
	 m9hc0nH9gzQz3DC/ZgDTMNGHc/CxlL9VhG06+w/ZXaskADDipnguNmwSOcRCk/lGrlwVt
	 vD6CoE6A5rgM9CPzIIm8Lu5N+ERMcNA7mjScJ2Cfj5sVT9jNovpYxH6/93Rqw6rcYhA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794999619;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=3GvLecrDY2H3kso6C66DvG+vyP5D+kTS+VYHd/DxRd4=;
	b=T44NG247JQJWe5zDb2RTqW9q8RLO0I/oRcgiIOppv03wVYm4Es1OmC6mQlqKo+S3FczW
	 xJILrAzYoeh0NIwvt1Zlb/WWSZzyDV50TEBTpxL6vLDCJ5BIkk9AfqPlVZtIBgkoOKtKJ
	 F+5QLFKRLIfe9XSP/W4KC6ieURB0/p8JNytIjc5Ug3EgS27lapz3xyqnPZKvfF6Npu7ec
	 a6CQZKHRGx0MkQvKWv3MtOx/j1mx+q3kOV4bl+C6H5UBgZXm/7q9cD9amtr8qtZZxhAiW
	 JwuVQl4+DieafMqtZ9y5f335Y9BhJjfBFyRV0UmyPYQKBRZtVUgxs7wZ8oDA7tZgZ6Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 915CC1F000CF;
	Wed, 18 Nov 2026 11:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794999619;
	bh=3GvLecrDY2H3kso6C66DvG+vyP5D+kTS+VYHd/DxRd4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=W8SAR8SyYDhWN5sT/JIKHrkq4BaKID84A3ltt9smrd0QNq0Q4/MKB0NopgdE50SUS
	 EjThg55B2t3eG35XHFzfeRi0h2ITNRD2OZCSgncDC+n/GXBUhEOLA2tC4MHpGY6noF
	 Bp46oRsv1QfNgg3QwCU2JdHzoaafNN42GMur7OPAsJ2+Fop5OG/uwkZDP81AO1ARqf
	 T0HRRs0MtMaqFIxmOy3RExVJEoGYuJmOQuJpgOAqjQZum0XAe+PddHxRb/gvxCNfmf
	 n/wLqe6R6jKbbttU3pSLvbNmky43jgyB1hM6fwYANKjSwGngOg8hTtADtSdElOLBXn
	 AtiBDAHM9hrUg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 32F614AD3A;
	Wed, 18 Nov 2026 11:00:17 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Wed, 18 Nov 2026 12:00:20 +0100
Subject: [PATCH v8 6/6] arm64: dts: lx2160a: note that i2c6 and i2c7 share
 their pad mux
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261118-for-upstream-lx2160a-rcw-pinmux-v1-v8-6-d01bc837593e@free.fr>
References: <20261118-for-upstream-lx2160a-rcw-pinmux-v1-v8-0-d01bc837593e@free.fr>
In-Reply-To: <20261118-for-upstream-lx2160a-rcw-pinmux-v1-v8-0-d01bc837593e@free.fr>
To: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
 Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 NXP S32 Linux Team <s32@nxp.com>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 Vladimir Oltean <vladimir.oltean@nxp.com>, 
 Ioana Ciornei <ioana.ciornei@nxp.com>, Vincent Jardin <vjardin@free.fr>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794999615; l=1826;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=yeushjxUh8hTfyjoadt5CEZb8ixL/R3BgEaH0ncLzqA=;
 b=70ZXOVv+w6B5PBj90dlUKI9rCkjVWwkQzQm3AvdGn1g+/uSRKSEinlbaTuHI4YXZhytwwK5SC
 Yx3WUMO/04oBjnqH8Nc224oNcYJM+JmHmGqV+6BMOxO8B4JPXiKzrY/
X-Developer-Key: i=vjardin@free.fr; a=ed25519;
 pk=hppgLeFpGpKOi7LNwGEZ4jOYofJCoGd4Jf1ltAabiLw=
X-Endpoint-Received: by B4 Relay for vjardin@free.fr/20260525 with
 auth_id=871
X-Original-From: Vincent Jardin <vjardin@free.fr>
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
Reply-To: vjardin@free.fr
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Vincent Jardin <vjardin@free.fr>

IIC7 and IIC8, the i2c6 and i2c7 nodes, exist only on the SDHC2_DAT[7:4]
pads, and one RCW field, SDHC2_DAT74_PMUX, muxes all four of them:
 - 0b010 gives both buses
 - 0b001 gives GPIO2[18:15]

Both nodes point at the same two pin states of that field. A board that
enables one of the two buses gets a working bus recovery from them, so
they stay in the SoC dtsi.

A board that enables both cannot use them: the pinctrl core gives the
field to the first controller and the second one fails to probe, and
the bus recovery of one would switch the pads of the other one to GPIO
too. Say so above each node.

Suggested-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Link: https://lore.kernel.org/all/avzGrorxOg2GmYOl@lxl00025.wbi.nxp.com/
Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 arch/arm64/boot/dts/freescale/fsl-lx216x.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx216x.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx216x.dtsi
index b0bb7bf944059..7bb593c01bd18 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx216x.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx216x.dtsi
@@ -1029,6 +1029,11 @@ i2c5: i2c@2050000 {
 			status = "disabled";
 		};
 
+		/*
+		 * i2c6 and i2c7 share the SDHC2_DAT74 pad mux: these pin
+		 * states, and so the bus recovery, work only while i2c7 is
+		 * disabled.
+		 */
 		i2c6: i2c@2060000 {
 			compatible = "fsl,vf610-i2c";
 			#address-cells = <1>;
@@ -1046,6 +1051,11 @@ i2c6: i2c@2060000 {
 			status = "disabled";
 		};
 
+		/*
+		 * i2c7 and i2c6 share the SDHC2_DAT74 pad mux: these pin
+		 * states, and so the bus recovery, work only while i2c6 is
+		 * disabled.
+		 */
 		i2c7: i2c@2070000 {
 			compatible = "fsl,vf610-i2c";
 			#address-cells = <1>;

-- 
2.43.0



