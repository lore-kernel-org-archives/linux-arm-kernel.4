Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 913C2606D835
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 21:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aggCEps+;
	dkim=pass (1024-bit key, unprotected) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.a=rsa-sha256 header.s=mail header.b=3CQlsABc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=FmFhmHqchVrqj+0DB2A1OfSUsKoVGkJJrNsEk9xPgCc=; b=aggCEps+RBa2hZ
	IPCv6yQe0VTM5FD9UlfNw1EGPSEgXeTJKTLCc5timRw5MZYFiRPGYqyY6q3IrWP+KJs6kUmqCUw0n
	uKX2iRLvP1h4UGFzM1+7VvgbplqfN+a6Nr6Os5IbnWYcnxqLUdlLCFHlD/DJCnED3pVy2efLoTnlw
	NQWlnn9Yu2qSZ6SHGw+mNZjgkGdmG7Ur4f4ESwCsTt/IUB1JxulxVbsSgTP5a+fiaKvS4rnewju1U
	72joNcXeIVA89eEl6voK5F7Dhko4AeppXONn2ZdI3TmSXjbJ4BJ6f56vWMyXDbTUaz994hWSAkug2
	J58k5/p99TWTY1vXZk2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPRQx-0000000DgdX-0pvV;
	Fri, 06 Nov 2026 21:25:15 +0000
Received: from mail.cyberchaos.dev ([2a0f:4ac0::3a11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPRQs-0000000DgWx-2u0A
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 21:25:12 +0000
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1794000308;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FmFhmHqchVrqj+0DB2A1OfSUsKoVGkJJrNsEk9xPgCc=;
	b=3CQlsABc/M7fJT77nzNv+Yd+dYK9FHTMMZI6rXM3gPpojUfLHV0y1h+yrUtC6Sv1WvFCCZ
	v4USYsgmHD2fochuTUR3O/ZRDUE1Q1qM8zIqFoxLYXYtOAe+7ySVW46/hb7UDDAFdGfKhK
	bnxM2iVMamNsv36Xs8ZqGBFrQmjUn3E=
Date: Fri, 06 Nov 2026 22:24:57 +0100
Subject: [PATCH v3 8/9] dt-bindings: arm: apple: Add M5 based devices
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-apple-m5-initial-devicetrees-v3-8-cee55de54b2f@cyberchaos.dev>
References: <20261106-apple-m5-initial-devicetrees-v3-0-cee55de54b2f@cyberchaos.dev>
In-Reply-To: <20261106-apple-m5-initial-devicetrees-v3-0-cee55de54b2f@cyberchaos.dev>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hector Martin <marcan@marcan.st>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Sasha Finkelstein <k@chaosmail.tech>, Linus Walleij <linusw@kernel.org>, 
 Mark Kettenis <kettenis@openbsd.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: Yureka Lilian <yureka@cyberchaos.dev>, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-pwm@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_132510_972264_ECB2E9F6 
X-CRM114-Status: UNSURE (   7.03  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Only the MacBook Pro (14-inch) and MacBook Air (13/15-inch) were offered
with the M5 (t8142) SoC. Add the corresponding compatibles.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
 Documentation/devicetree/bindings/arm/apple.yaml | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/apple.yaml b/Documentation/devicetree/bindings/arm/apple.yaml
index da6f043ad07a..f78c89780355 100644
--- a/Documentation/devicetree/bindings/arm/apple.yaml
+++ b/Documentation/devicetree/bindings/arm/apple.yaml
@@ -116,6 +116,12 @@ description: |
   - MacBook Air (15-inch, M4, 2025)
   - Mac mini (M4, 2024)
 
+  Devices based on the "M5" SoC:
+
+  - MacBook Pro (14-inch, M5, 2026)
+  - MacBook Air (13-inch, M5, 2026)
+  - MacBook Air (15-inch, M5, 2026)
+
   Devices based on the "M1 Pro", "M1 Max" and "M1 Ultra" SoCs:
 
   - MacBook Pro (14-inch, M1 Pro, 2021)
@@ -364,6 +370,15 @@ properties:
           - const: apple,t8132
           - const: apple,arm-platform
 
+      - description: Apple M5 SoC based platforms
+        items:
+          - enum:
+              - apple,j704  # MacBook Pro (14-inch, M5, 2025)
+              - apple,j813  # MacBook Air (13-inch, M5, 2026)
+              - apple,j815  # MacBook Air (15-inch, M5, 2026)
+          - const: apple,t8142
+          - const: apple,arm-platform
+
       - description: Apple M1 Pro SoC based platforms
         items:
           - enum:

-- 
2.56.0


