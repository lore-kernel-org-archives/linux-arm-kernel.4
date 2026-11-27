Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA76606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 12:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=37YaPJ/H;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=nJqdR8jA;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uzfCh0qs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=QCpB4RhzNL1T4jjBraVD8Rve99tT2QYwwNJiLODS5Wg=; b=37YaPJ/Hj4pA5T
	lVcCEct7sAUw9ECbc91e1KGUiRji0WsFTBasWFIMG/0+UW1Rq2ypEUTZykKGUUyGCBWIZy8Gx223f
	S4KUh6OFicrtsoyk8VLA8hi0GHMuYpKt5QgyU7+Mf5c1OsIZnTFU0MWShJegqKFVnlpqZP2XO4t47
	/Jo6EPmuxPwG0Pq2lU0JvYfL8+AKZWeLDZW3NBiJKi6SiMFz4OtZmzk5KvFXxXiPz3NCwq1beB2hC
	Z/RH8hyGNReP5PK9rlmIAZAXyE6GxseDjvrXm8Ef1dcaQMF0wHxvMu/4EvDOocIlQh87lFWQL6m7K
	pZy2mKfbRTy7dVYnjmIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWugm-0000000FypR-3ZBy;
	Fri, 27 Nov 2026 12:04:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuef-0000000Fx86-33xZ
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Nov 2026 12:02:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=QCpB4RhzNL1T4jjBraVD8Rve99tT2QYwwNJiLODS5Wg=; b=nJqdR8jARCmdvYCDx9WbGWR/fz
	XmpT1nkKgAKWf35uSUgtAgBWkX78JtNpV8x4OoYu0OVBvAnU4n6C/GRe/d0Aqvi/o3CjDZ2I6m0xF
	U+DyrtWv7+25oG3Fdyq0JU6Nz60FCqJR1WEjF0e9rRV36DGbaWvHyAhQnwOvfzqwmwWEPbYsh7lVp
	dhShiYS8WMA7lgOO1onV3LIVPDxF3NSXdtHicSzCm4sQCXcy8K5uRr4IZ2NOaLGFBJlbOmZJM9SdZ
	2bv/Iq1xwa/yVFDUGOVo/Lxno5XrpwUplsgmytnbN/PjU7KkFleO5BPHzMlaEvtECsx1iJN9lQKHd
	8TBPobPw==;
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWueb-00000007fkg-2Psf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 12:02:16 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4bb69f5b161so52402625e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 04:02:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795780926; x=1796385726; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QCpB4RhzNL1T4jjBraVD8Rve99tT2QYwwNJiLODS5Wg=;
        b=uzfCh0qs5lDx38rG2+C3oHtDNIS4x8FJEMhZVkBBZiiAG/cayVhMz5pNlclQ3x7M/n
         un7DAqNf/WdQkEPRzmrs3pvw1EjKqcrYLUJhu64pqx+oimRgmeAU15NMM2DYACmh/R+K
         y60+HNM7sW080WsYZtVqyoD8xgcw3qMWnnptcmSg3OTXiEmYNdPVn/5SmTAIg9AcyJEv
         ei4CqQKDgqvNCZqW1nUhoxt+MfaQlDHNV+kDTGiFF4I/re745+WGmWZjBfcGvd0Ez1B+
         pc8H7Iv8h/8bLOPQQ3DuAJAHB7pvlvFIKkQZU/MX5cnbTSCEthboqA4RFsLt6vowQvim
         DXxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795780926; x=1796385726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QCpB4RhzNL1T4jjBraVD8Rve99tT2QYwwNJiLODS5Wg=;
        b=lBOZaY3cPPmE+2SVj+Qvqo4f16snfAn2v7Y3jSnDLu34t0LWHwo4cN/5KoC2qHU2Df
         QU9ay/8lMGSDlT+yffbS6D/l5IkDwsj3CNPDAD/tbtrDb5h9jm5G+gVw+kMN6eAh6uPp
         Dkyzdz8iPqhzhntFfFHp05OqbWdfQxAg3qtI1HIWMS0VBNei85CICUy3HtJNjHcsKI9r
         TPa+IUUkus44Pdt1VruFRgD+J3GcoRQF23xLpUMln4+mhFO3ksEr2KlqeSN84BZIinsW
         KrEYHPscjDrIEDwY7pX7L3qEVr7RuFgnKyBYmNArzKjWAkrhnSiD4y4xQ7VTlx+i6UYO
         8VGQ==
X-Forwarded-Encrypted: i=1; AL+hErG8ELzfTCEoiZ9HhCpjfgM3YsrIdrg+cEbSVv8bV7ahunuIwL8ZC6TeaWRYA0368iSdiAuOnr2qLTs4fzT0fL6F@lists.infradead.org
X-Gm-Message-State: APuU4Z8eZwuLTyddWjUW8z0vAZEs9ePlVU7TsdIkmXL4Q0rWddx/PS/+
	8iye28aSEgbfIVUxcsXwIN4wDc5+PKjKurAjv/hfKig7xlAP0HlQfunb
X-Gm-Gg: AZFdTZeeHtPtVso9YYZ3a9JLeH/FMLtz6ubPcAVSRSgfbZy07x8EYrrPqdBP1LJh7oV
	O2eOaFdOHiZF91KJcgPyicNOfq/K80U1VaEMyBfEnKJCBJHqAQkCPHXjPU7Ed2MqqyoG6GZTZ47
	XpMwQ4EmnEpbpVgmvLtREyHclDBHQaj38n/OouM+HJNI7Cx176GoOMOB0s41LUzFpdsdJpR2w/N
	w0hvfro8ucHMiX5YK/TXAj5g/EreZcQ/SpCk5uat+qkU+Gq/4zZsfBe9std5K1+lqTKgyz1JRrV
	oIrgwR/dKXQFvaLavkEb+q71aRJEtLT52qqZvhcanNZo8+C2s6GUrHsujRO6+s8qfTsL8wUcrxI
	xXTrJN0QLcPrj6P18XD6Iwq2FMh8ciODzW1NiIYRM5ei/uq8y4rnX/BCRoXlNzfRE3pOq2Pmlg1
	yb5IOhEguC4B6YG9uY6tgbgmSwn1KXMe0hOX21/CU3ExnrjVk91SYxTOH3IqaNgcl8YvSahZEXN
	610sszlHzJfb28KUi0QIBpkqB2o2mWzkGD6UHO7ZmXoM3jpyYM8JPBCYAF4JbJNvuBd5ongAvpw
	gS+B6q0yfop+iylcl6KBHgISePpDQ5pa
X-Received: by 2002:a05:600c:6749:b0:4bb:5f95:c014 with SMTP id 5b1f17b1804b1-4bb8880f283mr492027085e9.19.1795780926108;
        Fri, 27 Nov 2026 04:02:06 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm393684565e9.0.2026.11.27.04.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:02:05 -0800 (PST)
From: Jose Nieto <jnieto.alaber@gmail.com>
To: Corentin Labbe <clabbe@baylibre.com>,
	Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jose Nieto <jnieto.alaber@gmail.com>
Subject: [PATCH v14 26/30] dt-bindings: crypto: amlogic,gxl-crypto: keep standard property order
Date: Fri, 27 Nov 2026 13:00:59 +0100
Message-ID: <20261127120103.1532882-27-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127120103.1532882-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
 <20261127120103.1532882-1-jnieto.alaber@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_120213_555595_C67A34BA 
X-CRM114-Status: GOOD (  12.31  )
X-Spam-Score: -0.2 (/)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

List clocks before interrupts, following the usual ordering of the crypto
bindings.

Signed-off-by: Jose Nieto <jnieto.alaber@gmail.com>
---
 .../devicetree/bindings/crypto/amlogic,gxl-crypto.yaml | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml b/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml
index 106a9d1fed69..6f19e790ec0c 100644
--- a/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml
+++ b/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml
@@ -25,21 +25,21 @@ properties:
   reg:
     maxItems: 1
 
+  clocks:
+    maxItems: 1
+
   interrupts:
     items:
       - description: Interrupt for flow 0
 
-  clocks:
-    maxItems: 1
-
   power-domains:
     maxItems: 1
 
 required:
   - compatible
   - reg
-  - interrupts
   - clocks
+  - interrupts
 
 allOf:
   - if:
@@ -61,6 +61,6 @@ examples:
     crypto: crypto-engine@c883e000 {
         compatible = "amlogic,gxl-crypto";
         reg = <0xc883e000 0x36>;
-        interrupts = <GIC_SPI 188 IRQ_TYPE_EDGE_RISING>;
         clocks = <&clkc CLKID_CLK81>;
+        interrupts = <GIC_SPI 188 IRQ_TYPE_EDGE_RISING>;
     };
-- 
2.47.3


