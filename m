Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81047606D82D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 21:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=I49ZfY/D;
	dkim=pass (1024-bit key, unprotected) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.a=rsa-sha256 header.s=mail header.b=XD5/bFsc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vNw98TulTGI8RlWvt5yNDg9lFfwWrwXKijxuB0xHpIc=; b=I49ZfY/Dp6KM6u
	pQEX1UwKKavOEyn5wVFxMDYX2xcaUhf8EcxOtn3kf4SJ7fbawjJgSlqGajHQlfz3dYIU3ZDi1zYsq
	CbxL6KRbe9nGH7D6KzCJg9W9EZzQxHZ2wDhuEUH9/gygoTXg3wmK8GZ6YAemMRFvPbxeLPciB2MHo
	X194R+zK2p54Uw6E+Xs6u/0Y+INUP8BAr5EB1CJsYiMogrp2g15hKlp2uojHlT5gn4LlZE/Q8Zoyd
	ivpCo/xgJWcsb6pPS7Nnc7gZaJJseMSPStydAgske0a6cvFtFeAd/kaJZEjitkKk38J9XEAw08TmU
	8eCd84Tb2wxouO2UXotQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPRQw-0000000Dgbj-2EXC;
	Fri, 06 Nov 2026 21:25:14 +0000
Received: from mail.cyberchaos.dev ([195.39.247.168])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPRQo-0000000DgTL-1Bve
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 21:25:08 +0000
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1794000303;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vNw98TulTGI8RlWvt5yNDg9lFfwWrwXKijxuB0xHpIc=;
	b=XD5/bFscPAHJASvpPL3CHultPB/QfZPTx3vINDcf49knjZ7CHShkHQJ1UXCQwcjVA0RjCB
	pUXTcLAZHsJP1euJ1jKoRxIJZLJhaEB+kkKhVu5D5pn0Jfdb2vKpFY44p9tOz8tXk199ZT
	iCUmO0bWSLWpF3BhGEa6+HyAyifp8XU=
Date: Fri, 06 Nov 2026 22:24:53 +0100
Subject: [PATCH v3 4/9] dt-bindings: arm: apple: apple,pmgr: Add t8142
 compatible
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-apple-m5-initial-devicetrees-v3-4-cee55de54b2f@cyberchaos.dev>
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
X-CRM114-CacheID: sfid-20261106_132507_003754_E20B0116 
X-CRM114-Status: UNSURE (   7.78  )
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

The PMGR blocks on the Apple Silicon M5 SoC (t8142) are compatible
with the M1-M4 SoCs. Add "apple,t8142-pmgr" as M5 specific
compatible.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
 Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml b/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml
index 3967fcfc1663..015a5b6834d0 100644
--- a/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml
+++ b/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml
@@ -44,6 +44,7 @@ properties:
               - apple,t8122-pmgr
               - apple,t8132-pmgr
               - apple,t8140-pmgr
+              - apple,t8142-pmgr
           - const: apple,t8103-pmgr
           - const: syscon
           - const: simple-mfd

-- 
2.56.0


