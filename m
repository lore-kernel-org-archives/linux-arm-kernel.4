Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD592606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 21:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uH6ZnlGo;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NATfXn7Y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Gvf3IdDLDeRNj9nlhALrJ/CcwWCiWPj0Ri5V51Dn7x8=; b=uH6ZnlGoZbqw0/jD0sqMFM035V
	yS/k+r2f/FxyiDycqX1zka46gBB1BO2eBCFCi97BOXiO3+bGENRgPgY/h4wJ7mVqx5bwgfPcxkEix
	7SSRywI0+9m6tGXey4TXm2giAIa9N4bNcyVFKIvZo3D00HvUomIZQSmq0QgW3ZBp8SmTihSnBc4c/
	PEMOH8oDv9DH1BaWLh1+axdex4ANXrCUlY+nfisuf0eTaxmzxIA4B99Bt4y3J+aZWzgtURRhbOKVT
	rBaLOY11dDhQhdBkAVVyeNKEoVcVUL29opmhdTkT3ozhjNF+6ZOXh7za7dV2R5HPwfcEYB9r9r+7N
	tscVocGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUsEG-00000000IcH-3ZSJ;
	Sat, 21 Nov 2026 21:02:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUsDu-00000000IPg-0iYS
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 21:02:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9C98B61D01;
	Sat, 21 Nov 2026 21:02:13 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795294933;
	b=uepjgrM0oh2zfTFHzNDg5vc4J0yzbVBdbe94hovPLGaifR8YsD/FaHBtBKABe8hp6R/+
	 TctZu2v+EomdwctJeZJSt589P6uRBtR3osNyoFEetOnOYWW6GLaDTV7tjf64oWaWqS267
	 bK2IiRgSaPxwsAOxJEHp0dIbOMfjxbhChU5DkKckOInjcneFfmMx2ZW3T2NiP9i7DaOkZ
	 kCHCoLCqNV/YGHOM7YO5w3lzQy8/42cPIGYjMwvQsmXYOVRkgcNbTZWxI7nxL0oYluZ3+
	 QOPJQYWzeB3tNP9SVm0XM2aY2lUR4NnQaKC2BAbon9uqPdfvyYLAcJHLRX73UgFnd0w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795294933;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Gvf3IdDLDeRNj9nlhALrJ/CcwWCiWPj0Ri5V51Dn7x8=;
	b=RiXdwUYNXinrdc3gmDneYj3j0hGWMQjVv5ucLR08vvjYHPvuG8SCYu5/LIr4DSNH917A
	 WBqscSPLWKHju6S9QWU3tHcVERYEZ219I5UTYRLf7Y8LXjCuO7407wjEikOXdxG8343QN
	 1EJU6/MttDuWsk6l4CD09ni2V6UhYLog+g8KkLHKhTSemvpqYJlk8qqSLZhNxiTc/OoTu
	 vp1prCYyN32wBSgacVDZlDWX/JYfLrTeGbhnqZ4eCaOA3i3oiaQFuxwS4eqXfJ+4vTPOs
	 ytdJnPHWlblzeoaj7gFOmNVTWBxJVvF6zhYvV8y7wod+pPhSMSMDwYJdlDpGN9QolqQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D83E81F000CF;
	Sat, 21 Nov 2026 21:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795294933;
	bh=Gvf3IdDLDeRNj9nlhALrJ/CcwWCiWPj0Ri5V51Dn7x8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=NATfXn7YwJD6t4rsNY69dnuHHbGWdKPpmZp8hv/F7YKSQ0yJRwqibuNUnjt3WTk1k
	 bP91Ag8MCSxEbS8pvtVaGhIQdE7uCr1rQRA44pBuNsJEP9mH5Chjm1eYlPk3WtpxUM
	 fiFrqIEqzBLMMlVRUZxjJK5G8YXl1EppniGP/D+ZAFzbJydN05AEF44C3t/JR+EjNc
	 nJraG5EfZqipFpbJ1qtiyEdcfLTgk5VgHkzT3GpcPALgL4ca6FObGYJgZ9TvTtF8GO
	 6LUi4GVVJPitVc/jQA3YNg2xTwuO3ZskXF7cpgsPK+Sbc+w56eFlCxbdXltCVnSvbZ
	 xJKPLe1tJ/Wuw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 656304BDAA;
	Sat, 21 Nov 2026 21:02:11 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Sun, 22 Nov 2026 00:01:47 +0300
Subject: [PATCH v8 02/10] dt-bindings: arm: Add Cortina Systems CS7542 and
 Securifi Almond+
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261122-b4-cs75xx-v8-2-5f971b0dc69c@gmail.com>
References: <20261122-b4-cs75xx-v8-0-5f971b0dc69c@gmail.com>
In-Reply-To: <20261122-b4-cs75xx-v8-0-5f971b0dc69c@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linusw@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Drew Fustini <fustini@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 Jason Li <jason.li@cortina-access.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Fil Dunsky <filipp.dunsky@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795294929; l=1646;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=ur5Y90DJUCyqB+ubnyEmmsptLVPvVwYRa4Bevb+7QSg=;
 b=B5/+P0DJsOW/YHdPo//fCPFgKUQixMQbYcIlqD+bgRJXcRJMXCKJa5fH3XrbmRIcrZBmnG2tV
 0bEsaHtWg7KAFyrxjSaBzsCqQey9+AeRg9e+B/zGFwccQ/w2l+IV45/
X-Developer-Key: i=filipp.dunsky@gmail.com; a=ed25519;
 pk=JAYP8e2rJ54DHOmhNtXud8rl1igAaAXoOHxtJmVXI1g=
X-Endpoint-Received: by B4 Relay for filipp.dunsky@gmail.com/20260930 with
 auth_id=1085
X-Original-From: Fil Dunsky <filipp.dunsky@gmail.com>
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
Reply-To: filipp.dunsky@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Fil Dunsky <filipp.dunsky@gmail.com>

Add the top-level binding for boards built around the Cortina Systems
CS7542 ("Goldengate G2") network processor, a dual Cortex-A9 SoC, and
the first such board, the Securifi Almond+ touchscreen router.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
 Documentation/devicetree/bindings/arm/cortina.yaml | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/cortina.yaml b/Documentation/devicetree/bindings/arm/cortina.yaml
new file mode 100644
index 000000000..1c04b1781
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/cortina.yaml
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/cortina.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cortina Systems CS75xx platforms
+
+maintainers:
+  - Fil Dunsky <filipp.dunsky@gmail.com>
+
+description:
+  The CS75xx ("Goldengate G2") family are network processors from Cortina
+  Systems. The CS7542 has two Cortex-A9 cores with an SCU, GIC, private
+  timers and a PL310 L2 cache controller, a packet processing engine, three
+  PCIe root ports, a NAND flash controller and low speed peripherals.
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+      - description: CS7542 based boards
+        items:
+          - enum:
+              - securifi,almondplus
+          - const: cortina,cs7542
+
+additionalProperties: true
+
+...

-- 
2.53.0



