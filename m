Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F4C606A334
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 19:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=t59ETEw9;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fTyye8hF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=yslwO1t9MXGHf6kGSQvi8Jsla7lrMGXHDb1MA6K0JGE=; b=t59ETEw9IxLcbq
	bY9u8wvs3zbs4+nq98lmj2mCGGDowjSzf5UZ07Bpazhre7j/omrKe8uHJgecn2S1heSleI9tGUS+t
	DJ/S4UxK17b8CMQESz1XtjDkp1HnTfsVtNibghVtlWD5VkNUDBybCmFTtKRI8HEx9OtfcAch/t6C5
	D7krjcDt3gId+OrURM4Dop+PuOVfjzfuQtCdP9JEf3dshm5vChPU6CDyXwZ9/1SURAPQuiV8XVNEx
	uIjV7YhiZm0MrekAQOUrGfixBHJoJI194kdaFiSKRVFQPw3ZYyryXx1ZNZlCtS3nOpDtt6FVsHVKQ
	MKKMLGFZXXBOUA7mCVMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfDW-0000000EJVo-3wdU;
	Thu, 26 Nov 2026 19:33:15 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfDK-0000000EJNv-2qBv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 19:33:04 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so66978055e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 11:33:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795721581; x=1796326381; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yslwO1t9MXGHf6kGSQvi8Jsla7lrMGXHDb1MA6K0JGE=;
        b=fTyye8hFFGoI0LQBHn2O8PIkdQgj2THEAdHahnY15y8f9Uf3x76Chsykj+hJi2tDdW
         P9Kjhg1LrpMU0oJmxi7etIYSc09dGitbrbKhfj1MGKLUYjZSOViuzcLYkIe66oQUhqEt
         IH9+YASws2LyYHxqTwY+0JsUva3FaCs5zYoO44EMbFFj591ktAzzTXE8txf766TALBLU
         0fKDfsv+ZxY16gnUzGZ0pQnj64Lsus12d87Uvn8DJfsflXwckdzq9iiYxOKMbGieSJzj
         TgMrPxQu+jNazfY4hvq6LVBbA1x2/ayi9LN8NpuBkNEdGs10HNxG4phJP3eAnEXPYU6u
         /imA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795721581; x=1796326381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yslwO1t9MXGHf6kGSQvi8Jsla7lrMGXHDb1MA6K0JGE=;
        b=edUm5UxvjH0kzPf+NwANT6zsAkdQE8QDVeJUssfBf9OWA/pp2gkqnfKbIO6cvgr6So
         ZWhEI81PL2eObOpEEwBG1Son5wageD/Bk6qdPJs42V37IvcZ+Zo/lhWPi6HOkx5BHTmC
         Oh5lhgB0xv15XonUaDwcRXihHW5R2F7BvQQ18s5f+oSsc7MTAiviCfZzYZKBI29PVEcd
         RV8JWF5mX9nGZ/A94IO/YBAVHriHDTAt1+/GdNkzrBcyBxNnYiLG+583I5qMGJ3ryIoL
         aefAf4kbA4nlnLjTt9Bs5xKw7Kx2Rbm+FIKlmdaN43JRKlSo3Zff43thJamznYk66Qlp
         QExA==
X-Forwarded-Encrypted: i=1; AL+hErE6xipT6acux8wewBSvUZf+toEk83VfW9lJgFgiL5qRmqatTedalnO5UWpfweIbw8B+SGyeW4dt/lwW5EoDHZMa@lists.infradead.org
X-Gm-Message-State: APuU4Z8IMIrdEslL5RfzYYRRl3kBGtkhE38oR0mBhKzzDcwcFGIGybRs
	UmrBO4cyIS488PVRgM8J1PKln2cAfcPcKTI2mFGFLC0XJgBu2bzZ7ENH
X-Gm-Gg: AZFdTZf6QCqVBJ/yhdy4WUAHR4UtHfGIK7TAuFy1YCSQ42Bt77U3WpwGNiEjcKpDw4j
	mPr9RuyoGOgRImosZVuS0TDyW34Q09CfmtloHBj33y5xDaowsUtgeygJc8tcv2TRIeFbeDPWIFQ
	Ddm+jRmv3Lz5F1/8T2wV7DbLmXQhq5lQB1eMpnMLR/AzzPqMcxw2HgJ+vXdEy+SoNiw8zLHNUm5
	NqB1OdHgG2RE/sv8jRq/lI9XlbH+jLnEt43Xekz59Lv6h/Gt/E0sG1K7iBYMKZFO2NTPLlgdise
	jtzl9N9HJbgw/loXRBOKXDPTWExzI6ekCIBSI16MGAl//rYsE2kWVQBHxPW/uoAhjvQNmNctxs2
	NzxgixiFZ59iWS+CpsrmH+0ZAoQbAJJAu2Z2CY2XQ932mvhL+scZPZMUgeYivSSf2ayIdS2SqGC
	wkwI2CLvSkDoqCwun2wTlEUpDEVC72r9LcsSNd7GWGSfalWI2g7mlgnGGIYUtffX5q9FK8TCw1B
	KA7VE1eayCgnedfeYKeWndQZc3GL8uUdNUXww6VX9G5ebvroALtobEcPwwbTmnXk7pM747G6tW8
	0yeM+v74et9TRxDCWVBRepQBXuYaEN/UcaRxJWAiawFabg==
X-Received: by 2002:a05:600c:64c9:b0:4bb:8701:bb14 with SMTP id 5b1f17b1804b1-4bb88804d1cmr475541865e9.5.1795721580895;
        Thu, 26 Nov 2026 11:33:00 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906cdcc1sm368287675e9.2.2026.11.26.11.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 11:33:00 -0800 (PST)
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
Subject: [PATCH v13 01/25] dt-bindings: crypto: amlogic,gxl-crypto: correct clk and interrupt lines
Date: Thu, 26 Nov 2026 20:32:17 +0100
Message-ID: <20261126193241.1471372-2-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_113302_733373_9C6DA694 
X-CRM114-Status: GOOD (  13.10  )
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


