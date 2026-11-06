Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABCBE606D839
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 21:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FCVo0u1d;
	dkim=pass (1024-bit key, unprotected) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.a=rsa-sha256 header.s=mail header.b=wVbVL2mg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=2AYHzRX018yeT4DRUy6H3UKeO548rYehdzwG2De2FNc=; b=FCVo0u1dDvhr22
	ulgbUlDBTlJEQ53CxXPsydyrssRYLS87BWSpqzwQuFSCcFo0cQC4r/pFp/7C+kpFT+2+Eo78l/cJx
	WCotRMTZN5fYY0USFgBGYw9lXi3cnPDtAJqA+2vpXcty6LB29VTSSZgFoqizFtNZykhWiiLctZnX1
	x9sEJ/mTJdx0BOQoxJ94/XO20AVsqaSCXaSKgmRnpC+qhy6TsVYNWgTP3REReO4agLyCaMM4At65F
	4a6jx+GZrlEl61R3aXp3VijF607gLbEBiyFSBcuuIGmPYFSHzqn2BQgn1Qerz+3TZD1zNwOeVGTRz
	i2xNJofHjpGljX0YSDYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPRQw-0000000Dgc3-2jJ0;
	Fri, 06 Nov 2026 21:25:14 +0000
Received: from mail.cyberchaos.dev ([195.39.247.168])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPRQq-0000000DgUD-0xTh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 21:25:09 +0000
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1794000306;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2AYHzRX018yeT4DRUy6H3UKeO548rYehdzwG2De2FNc=;
	b=wVbVL2mgoH4HIUcPprPedUHGYjgprKwHDMWOXKFpW15wJdRXxXdSaoIu182S1TR4XeYZ8E
	K62B7hB6w3EKQ0XZ7guL3UyNnWq7m8IubVnsIGDsNQcJDGRJs1E5AJEaVvtGGWgfH9ovAR
	mIIG2zPAox0HcE4tMILdK3gDyE0iolA=
Date: Fri, 06 Nov 2026 22:24:55 +0100
Subject: [PATCH v3 6/9] dt-bindings: pinctrl: apple,pinctrl: Add t8142
 compatible
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-apple-m5-initial-devicetrees-v3-6-cee55de54b2f@cyberchaos.dev>
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
X-CRM114-CacheID: sfid-20261106_132508_521899_16ECAFFB 
X-CRM114-Status: UNSURE (   8.01  )
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

The pin controller on the Apple Silicon T8142 (M5) SoCs is compatible
with t8140. Add "apple,t8142-pinctrl" as SoC specific compatible under
"apple,t8140-pinctrl".

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
 Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
index 0984e4e58af3..13ece17eca9c 100644
--- a/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
@@ -27,6 +27,9 @@ properties:
               - apple,t8122-pinctrl
               - apple,t8132-pinctrl
           - const: apple,t8103-pinctrl
+      - items:
+          - const: apple,t8142-pinctrl
+          - const: apple,t8140-pinctrl
       - items:
           # Do not add additional SoC to this list.
           - enum:

-- 
2.56.0


