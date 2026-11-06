Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B65AD606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 21:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fbPfeOdb;
	dkim=pass (1024-bit key, unprotected) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.a=rsa-sha256 header.s=mail header.b=Q0o5G8L7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=UMIk77T6D8aeVXKipe7tHa21wj0Z4+vE4becj0xztjY=; b=fbPfeOdbJhdCMU
	uU1wjm+056KGfANJu75msZSjL2J2wbtMjOVHkzeu1vzXv6gaWVlEi3Mntcrr5KeP0lPpez0e94cVf
	agIHJgSwnhAGz5A9/5fIyAhMSdMZuAV14bUHNFsBP5sCvUZCIoEWg1rdSS/12V+ggBnkTxl+tvLfE
	YUGGZGClMoTUB9YhXMWtwOc1uP3raIKEavS4gpQ4YGDrUjGKzgi3bM4C8FWEXCtiW1Wx2xYV/+tyy
	29jLJSzXilR0cOOmYGHoZE5ahRSfp/oCKuKyryqRXZWpOM6af7QwYrSBMJ6266M1krVz5/iX8y6ep
	X6bgj+1cf5gulfMMuB+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPRQp-0000000DgV7-3lOR;
	Fri, 06 Nov 2026 21:25:07 +0000
Received: from mail.cyberchaos.dev ([2a0f:4ac0::3a11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPRQl-0000000DgSC-1Zln
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 21:25:05 +0000
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1794000300;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UMIk77T6D8aeVXKipe7tHa21wj0Z4+vE4becj0xztjY=;
	b=Q0o5G8L7Y5EjjCs0mhUkqsFOdKD2YSDMCssgqRwbfOZ4duD3VFYoVj0AGfasNcytX+Pj/A
	X1K8ETHkLZ3oKSPRjx6sqX9lTALBFK3kF4wuG0NDcYembUOV4IaBXfmx8vf7Huw1432gOB
	fpcJqJ/7S3SaQVCaP+TQ4cEwHNio3Uk=
Date: Fri, 06 Nov 2026 22:24:50 +0100
Subject: [PATCH v3 1/9] dt-bindings: interrupt-controller: apple,aic2: Add
 t8142 compatible
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-apple-m5-initial-devicetrees-v3-1-cee55de54b2f@cyberchaos.dev>
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
X-CRM114-CacheID: sfid-20261106_132503_681026_4A6B3109 
X-CRM114-Status: UNSURE (   7.25  )
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

The Apple t8142 (M5) SoC uses an AIC3 as interrupt controller, same as
the M3-M4 SoCs.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
 Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml b/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
index 3c2b24be530e..b6ad9d9192a2 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
@@ -49,6 +49,7 @@ properties:
               - apple,t6041-aic3
               - apple,t8132-aic3
               - apple,t8140-aic3
+              - apple,t8142-aic3
           - const: apple,t8122-aic3
       - const: apple,t8122-aic3
 

-- 
2.56.0


