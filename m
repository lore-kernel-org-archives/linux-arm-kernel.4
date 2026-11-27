Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D954B606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 12:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BqDgd0lR;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b7HmQUHm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=yslwO1t9MXGHf6kGSQvi8Jsla7lrMGXHDb1MA6K0JGE=; b=BqDgd0lRC8dlIu
	hFfN5ihnXl35veKW9TnzzvdqnrZ+EPiCjG5+fUPHL8Nxwkaq1zEnF0jn8dhyMNz55K38+d9lQMG2A
	U3DYs6vpD8aGJpyEyotLm0/9RlYC/KstWnUQ/jUPYcYgy6TyxvBi5KjIftcvytF7tXsUbuUMRblbm
	N1HKP17LBDqB4kYNVLpcAUPtuPI2nHsOLBR04AxvbqK9mB4UK8PnuNqUTMPiUSjq47H9M2oz99gLH
	uQY+XCl0v2TERoFx9E7bC2Mu8sESP18WPRSwA12zvbPWqTcyV41Q0oeIf/+OrX/1MINapSH2kwKF4
	/6u8qBowhsY5zQF596zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWudv-0000000FwAi-2uEH;
	Fri, 27 Nov 2026 12:01:31 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWudf-0000000Fvyk-1quH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 12:01:16 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4bb9d8e8e90so51552695e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 04:01:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795780874; x=1796385674; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yslwO1t9MXGHf6kGSQvi8Jsla7lrMGXHDb1MA6K0JGE=;
        b=b7HmQUHm1Q4LP4e7cPsKGexxGy2VK2LHfJON53R0l99RciIFozIiE4xpQXNIhmcGIp
         v6v1uvZPk0oxETkJiPxpbl6nRWBAt8gX9vCBLHWsPYdnmfmz61QhwHjnNcdn8uu6nd9I
         nOgfRWNksnY96jCgT8Gt3BuF9hHd97e29zJyfczSKAfEqvpKrc0N+K4LIKdImBQpYT/k
         0C84UxpgUUsqKZkJEqwNXE2HSFVi7z58gCvX7fulbfUUCSwTNCE0mSU87/eEYXYKk9gT
         55zt/UU3xHkYnYNCEsuLIefMdjgvMmAHKD2eL8Zz0BBOKWZ2NYD7tbB8L9ax2FLzyFUv
         rM/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795780874; x=1796385674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yslwO1t9MXGHf6kGSQvi8Jsla7lrMGXHDb1MA6K0JGE=;
        b=CO4XaDM/la56pxl7nGamnEBqyh7SX+5YCMe/BWFPijpl3A0ufY0BUlpLNu8LTgVpSU
         3JRtMsnKlMvmQuJRmiMJpJMRpz4oRNPWDHJSu06cGHp/tyqQoF+zqDnokjFxJJ5rZw4O
         xOuzCKJuL5IWs/iZrCjH9uUQuz0fpzSDoHzu0C1/CR98MIeSDasT3HFUG9NOpzKKdnr4
         ekt2uyBwS73bHs7kkYmiqmL+nriUhfzpaht27ME6wmU1RestwvlRDWJLFBkQ1yfcN+Ng
         HVLw55oefxsutZ93JxarjWqKyZQU8oY8U5BeZk2Og7XaTyvQjiRZdjW49vJv6FBW8oiF
         Q6FA==
X-Forwarded-Encrypted: i=1; AL+hErHXmJNifXoCEBtHM9kxb2a1zG0ZNXB2SHmUIAfI1Rsla+y0JH1oB++Dnp2jle1GlvtvyopPVnwsJQvhrc1FpVMC@lists.infradead.org
X-Gm-Message-State: APuU4Z+iV6pGHnJqLjcIX5aW7deXB0OoQTEdj6qdRm7PUQN6U3feFx4h
	n/Vw7dKsazLFBbDIxK2d2Yb7iR5i2cp/XDL9yL2Vn78cFeZHcGb4M2N0
X-Gm-Gg: AZFdTZcQOKRHf4yEfGEv4XZi9QpABPCy0IIpg9gPuO+WHUVETnaGqO/ZW4oUkC2N0p6
	YWDiVy0e7W8yzGqMtt7gsPJkJdm2weRS2V/0+hppyNFUKkg+32JbmxNxuWbEaZHe4/8eB2f/Rgm
	dCf/SWlOg7YoNKQwWrvYB126d/XphPESbKyiIzXunqTkfJTUUX2nlP8jiNG6M4RsuWuP1hZDflg
	rWjYD//LcwpDjZ4Seh8leUSJORtCcQD+7IC99/GVxMT5KA4TjRL2EBOJRB70dTXWgmwY+avLiCl
	XmqKAdjHz83wbY/azW7ObSC9856YH6KgDbs3MDa8RS9+PhH+YhaxNLdnT05k9ao59hz8we6Tf0G
	iZIAdOfcVhYKXLhSILrD+pDdtp8E41kKkRuSbbaTKaC7hWawAgMbGCxlFNAQBGLVwaWCRej0N/g
	VoGwdEN45tnAIycTNfGRlLBDP3wxSmIkjS9HuWSczLP/FE1+wr5UnoehozFQWySRKHbcdhJlOMF
	/KR9AmRrBCxRPAYMIef/jhGwC4r74YdP1AfVhM5wkE9om61CkPPk7ArPgCBPDPTeBhN3msvNvvL
	luvaIY/KwlTLJXIiKc8mOAtzUW739aPEkYqLnkGxoL4nk6M=
X-Received: by 2002:a05:600c:8486:b0:4ac:aae6:6401 with SMTP id 5b1f17b1804b1-4bb8880606fmr497694375e9.12.1795780873562;
        Fri, 27 Nov 2026 04:01:13 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm393684565e9.0.2026.11.27.04.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:01:11 -0800 (PST)
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
	Alexey Romanov <romanov.alexey2000@gmail.com>
Subject: [PATCH v14 01/30] dt-bindings: crypto: amlogic,gxl-crypto: correct clk and interrupt lines
Date: Fri, 27 Nov 2026 13:00:34 +0100
Message-ID: <20261127120103.1532882-2-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127120103.1532882-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
 <20261127120103.1532882-1-jnieto.alaber@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_040115_515788_D875CE7D 
X-CRM114-Status: GOOD (  12.92  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Alexey Romanov <romanov.alexey2000@gmail.com>

GXL and newer SoC's uses the DMA engine (not blkmv) for crypto HW.
Crypto HW doesn't actually use the blkmv clk. At RTL level, crypto
engine is hard-wired to a clk81 (CLKID_CLK81). Drop clock-names
field from schema: name "blkmv" is invalid and "clk81" is confusing
and sounds like something global.

Also, GXL crypto IP isn't connected to the second interrupt line.
This binding is useless, there are no users of this line.
We must remove it from dt-bindings.

Fixes: 7f7d115dfb51 ("dt-bindings: crypto: Add DT bindings documentation for amlogic-crypto")
Signed-off-by: Alexey Romanov <romanov.alexey2000@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/crypto/amlogic,gxl-crypto.yaml | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml b/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml
index 948e11ebe4ee..fdc39797a2a9 100644
--- a/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml
+++ b/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml
@@ -20,20 +20,15 @@ properties:
   interrupts:
     items:
       - description: Interrupt for flow 0
-      - description: Interrupt for flow 1
 
   clocks:
     maxItems: 1
 
-  clock-names:
-    const: blkmv
-
 required:
   - compatible
   - reg
   - interrupts
   - clocks
-  - clock-names
 
 additionalProperties: false
 
@@ -46,7 +41,6 @@ examples:
     crypto: crypto-engine@c883e000 {
         compatible = "amlogic,gxl-crypto";
         reg = <0xc883e000 0x36>;
-        interrupts = <GIC_SPI 188 IRQ_TYPE_EDGE_RISING>, <GIC_SPI 189 IRQ_TYPE_EDGE_RISING>;
-        clocks = <&clkc CLKID_BLKMV>;
-        clock-names = "blkmv";
+        interrupts = <GIC_SPI 188 IRQ_TYPE_EDGE_RISING>;
+        clocks = <&clkc CLKID_CLK81>;
     };
-- 
2.47.3


