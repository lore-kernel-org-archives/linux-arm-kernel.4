Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD56606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 15:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KBAfC9Qx;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SqYhe9QF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=NoVu7Qr7mpzCqXJ/0i2lPIF/ZqVSTtvTa2MvTuyMJDE=; b=KBAfC9QxDStSDCSVWW+dO67VB1
	F0y5gTqj6T5rJxG1uX2TSd/LXarCcxkclDBTzGnPdGaVXUUOeCVspXTf8Zxoa6p6tcGhqWOO81DCc
	vMIA9D0bkEPLPsN8ob8UMV/3hGVVpXb6nGL+w6ONdxDLjKjSWf6KPPERZm2FLlEXWY8l/SBZyMbgq
	6j9oCiestYZhIylUEHuGNHCt7NVy5z74fUmZy6aEiFdiD7CogS1m0pU5luDs2Fz2xQWGfMLmeoA/q
	dzB3hlibfnhG43iWxsT8wt9yfxbGcGp631MRz8GNK4KMEmXj2n8oc6cib0sUUeo+yHRvttcb23auw
	qPRy91Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxmY-0000000GkX0-20Th;
	Fri, 27 Nov 2026 15:22:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxmF-0000000GkQ8-0Jz0;
	Fri, 27 Nov 2026 15:22:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 558C760267;
	Fri, 27 Nov 2026 15:22:18 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795792937;
	b=ODodhJijAeFfkfnZO4CyjLmxRuUEHmLg9BrECuGDXB0iy5ACF74TnF7U/tQCH+0Efdhq
	 psBZHsBFcdYgVQdKrl6wpV+loOl1FLXr0HsdbJ2jhWAwx5k0LcSNoinCfUVQaMnagcR4C
	 5tkYkH99e0IhVVv5ZJGgjrenTXkPq5QUH++oiKfTgq0FU3fOy9Pfus8LCWQIF4bdtxuoB
	 Z26+lrPQei0o06Xx4UTvvVmXSqanfGjXpEtbJ4dkvheOorwvw9l/r93wVMFpQgmBnd+Pq
	 V/q8bMsZpaX96894bKLktu3idRXSiX3rHBqsqLPXowl+VhlAK3FnphBX+iSEBTXz2pQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795792937;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=NoVu7Qr7mpzCqXJ/0i2lPIF/ZqVSTtvTa2MvTuyMJDE=;
	b=jBy1Tmd2nVlNvex6aw4tVYS3yjMemzT4Z94N1UlSrwbcUkEf/s8h+xbj2soe1BMiG7bG
	 QrSc4sjG1ur35sfy4S8OeEGYIHbTTFGYIahTXv3e+rSwts5GfdR2sEgHUzbno1dsC8vh5
	 F+qpKidj0SO3q0/GmLyJKQzUJw+uIG1wTWrkfSToosH4JEYOBvCTvZEprJev2Yyb4Rdew
	 PHQxJ3UUCUTcSdgr35cg9ZRZh9O+sNiuEsyoa+8TEiGUiwf/3UsOkrgATEf96CuNiO3+b
	 Q1gPEaUg3v6wZY16XWAsI3nqy0NOFRHv3nZYXZowX9leiZMNgDpSpGXWAiQ+uye9LcA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9EBE81F0089C;
	Fri, 27 Nov 2026 15:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795792937;
	bh=NoVu7Qr7mpzCqXJ/0i2lPIF/ZqVSTtvTa2MvTuyMJDE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=SqYhe9QFHV32lgdHyh48a5j7EFuLWkFx65xfiKMnUX9geBpHRhz3LfB+8eO8qp35g
	 D7+hpfSMQBX7N2TrEwFGmhu3sEKqTyouBUnKppsTFpAIygFWd9nSauDFWmElSfTRD9
	 2FuVfvVjlIh1A0rbw3/j97tEwTGlehukwL5ccGA02YKghTqDGrh89hf0STuRX0/9cI
	 QzzIB4IRtzc7waYqNPbZP5/TObk/oKmrE+hoKc4YzQTctJaPZ/MC8ISuJnijfqzOPH
	 msFk0Fr7EPq6KGIvAwYqDRam6VKkPG/bAEYOr0C4A6EeEV4bL3AUQQs7p5duzDdhDp
	 kdXyq91CnLnNg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 2FBEF4B85E;
	Fri, 27 Nov 2026 15:22:09 +0000 (UTC)
From: =?utf-8?q?Kry=C5=A1tof_=C4=8Cern=C3=BD_via_B4_Relay?= <devnull+cleverline1mc.gmail.com@kernel.org>
Date: Fri, 27 Nov 2026 16:21:06 +0100
Subject: [PATCH 1/4] spi: dt-bindings: brcm,bcm2835-spi: Add dmas and
 dma-names
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261127-bcm2835-spi-dma-v1-1-8b134991ba2e@gmail.com>
References: <20261127-bcm2835-spi-dma-v1-0-8b134991ba2e@gmail.com>
In-Reply-To: <20261127-bcm2835-spi-dma-v1-0-8b134991ba2e@gmail.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <ray.jui@broadcom.com>, Scott Branden <scott.branden@broadcom.com>, 
 Kanak Shilledar <kanakshilledar111@protonmail.com>, 
 Stefan Wahren <wahrenst@gmx.net>, Florian Fanelli <f.fainelli@gmail.com>, 
 Eric Anholt <eric@anholt.net>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-spi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, Miroslav Ondra <ondra@faster.cz>, 
 =?utf-8?q?Matou=C5=A1_H=C3=BDbl?= <hyblmatous@gmail.com>, 
 =?utf-8?q?Kry=C5=A1tof_=C4=8Cern=C3=BD?= <cleverline1mc@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795792928; l=1665;
 i=cleverline1mc@gmail.com; s=20261121; h=from:subject:message-id;
 bh=qVwzj9YtYL53uYDnPyCdzi1pxK78x9hB7h8+EBasjyc=;
 b=W5YThTyWtWNBznWDQ5RjgWHC76GiJzR/P/5D9VGh5DK5IchJJ57bcKp0bmIjCOj6VEYZ+0oVo
 hyr9v1AtyrsC9+0Ean6h/ASIx469R27KQ8kzrpg80JfyYatwJVM7W8e
X-Developer-Key: i=cleverline1mc@gmail.com; a=ed25519;
 pk=2UEUVmQyfsiFZkNS7dkgFg0rUmhbcMIytM6NYhxFt/Y=
X-Endpoint-Received: by B4 Relay for cleverline1mc@gmail.com/20261121 with
 auth_id=1594
X-Original-From: =?utf-8?q?Kry=C5=A1tof_=C4=8Cern=C3=BD?= <cleverline1mc@gmail.com>
Content-Transfer-Encoding: 8bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: cleverline1mc@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Kryštof Černý <cleverline1mc@gmail.com>

The driver requests optional "tx" and "rx" DMA channels, and
bcm2835-common.dtsi has set them on the SPI node since commit
cbbe88333062 ("ARM: bcm283x: Enable DMA support for SPI controller"),
but the schema from the conversion to dtschema does not allow them.
dtbs_check is silent only because no in-tree board enables the node;
with spi0 enabled on a BCM2837 board it reports:

  spi@7e204000 (brcm,bcm2835-spi): Unevaluated properties are not allowed ('dma-names', 'dmas' were unexpected)

Document both properties.

Fixes: 85ce0dc28ffd ("spi: dt-bindings: brcm,bcm2835-spi: convert to dtschema")
Signed-off-by: Kryštof Černý <cleverline1mc@gmail.com>
---
 Documentation/devicetree/bindings/spi/brcm,bcm2835-spi.yaml | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/brcm,bcm2835-spi.yaml b/Documentation/devicetree/bindings/spi/brcm,bcm2835-spi.yaml
index 94da68792194..8d2919ce6096 100644
--- a/Documentation/devicetree/bindings/spi/brcm,bcm2835-spi.yaml
+++ b/Documentation/devicetree/bindings/spi/brcm,bcm2835-spi.yaml
@@ -30,6 +30,16 @@ properties:
   clocks:
     maxItems: 1
 
+  dmas:
+    items:
+      - description: TX DMA channel
+      - description: RX DMA channel
+
+  dma-names:
+    items:
+      - const: tx
+      - const: rx
+
 required:
   - compatible
   - reg
@@ -45,6 +55,8 @@ examples:
         reg = <0x7e204000 0x1000>;
         interrupts = <2 22>;
         clocks = <&clk_spi>;
+        dmas = <&dma 6>, <&dma 7>;
+        dma-names = "tx", "rx";
         #address-cells = <1>;
         #size-cells = <0>;
     };

-- 
2.47.3



