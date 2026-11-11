Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 240D1606A327
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 14:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YJzI7Ft0;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=afXu/Be/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=PxiG0vYjBvAPwvPa+T1dR5DMoDYMoXM5SR2pagqHWyA=; b=YJzI7Ft0l/MQcg
	Uqll8ad2A+GvWngetLI/Gf0uBwBVaIT6KCKHAvvpbNR6updFcDmKFNZubFWsadoaKj31v20yKyoaK
	Ymr6+Q0ot/1d7+o6ZnfVQXQs5+SPp1Puzqs+RRdQh8hKca/i4rNqDc8NRNCve+NPrQ6ouXXn6ClVg
	29rHOX5J/d9T29zSAOqQplwEqRlRgMAc+8Q3sNXcWDr6+xCaiSS2GUhlGMehHZOM0PL35JqQABC2c
	uT8fGcOeGZhRgIw4y9FIi6kdrbrjO0zU3OLIfQWXaggVDEW/oGrhMqqfXj0JyQcN+MTfdD/pWMers
	Ts7DUUUFRyOBkTAEUSLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR9Yz-000000070Dt-41e7;
	Wed, 11 Nov 2026 14:44:38 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR9Yv-000000070Bf-06Kr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 14:44:34 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4afe2d546f9so40791215e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 06:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794408271; x=1795013071; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PxiG0vYjBvAPwvPa+T1dR5DMoDYMoXM5SR2pagqHWyA=;
        b=afXu/Be/tfWDOPUBU6cmBfFtOX0sRocluzgoH/Lxs7zUnlr/FSushkAE3sRaw2C1Zp
         QI2mgmDhH0apvbv7rbwL+5FPw8X83gVwTFOqlpmEqfxj92Y1/sfBD2T6IHyfIYqVURms
         5pCkpjviP9VjUBhzMK/OTdYQ5IC2Vsvg5vnEfdN38c4UhApaXalD70w3g6Xvj+HHsqxO
         n6hD03UW9Xj3HZ/RRZCTdNxzT3u4M98nOQLyvl7DVrFbO5qGRyEEUBK3kWRQ79LH9WNV
         YbUsNNjhPrA+XP5EneAdSKhOZfwvbpqtNecVXAMXP5APdZl3ruYuEsHlhkoHiBSrWS3s
         4bPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794408271; x=1795013071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PxiG0vYjBvAPwvPa+T1dR5DMoDYMoXM5SR2pagqHWyA=;
        b=UxVOiDbXtv3ZMEhGyh4OBoLHattzCiGYFMWJ33cVGeeqyHDMq3olfYRMrFnocOcJeb
         L4DW28aaLH9hfpPcB59JSFE8OfAWk31Ii/J51e1LuSglLXBhG7TSjAHkjkkKwqx1l7+0
         /v3aJHX3jYLdBLqpgeAR+xMbvJqnHH/Bhd6+VRJrW3CcqBTbCkFNxZiU4NWNu0QCna9U
         Z49SkysrRf1qA05X662PbYAR/ABA5Jxd8f9gaplpRZICXBJYDw8PRnsmQRSWbxO5ceQU
         DR29t4hUkGvnfmx+9YsTN4iAS87VqriMN/Zb28Sn9jestqJFLP7Z97F3SEr0XTqwWv8X
         CxNg==
X-Forwarded-Encrypted: i=1; AL+hErGIaJCfzceKLOmPPqf6OX6DDQfY3a2fUJHFE9ieHWBwBfvSc65Jio8ZFG0pQmjkOU61H4VVvJoeboK6P9jxvZIu@lists.infradead.org
X-Gm-Message-State: APuU4Z+uxVxFL8RGCSXBeB3oB4no5+TWkmodaTL5H9C8tMJWYSheB5dm
	PQzMLBsgShHNYGuIb/sYqZG3Jy7uAzO9v+nDoh7uPwmAjP1ci535DN7k
X-Gm-Gg: AYBFou3YIdjP2irZEBRr9qBZnPg+4swZOpQFUfdTJ3P/NrAx/XQdu8GyE5H8jsELzVx
	kJqayWzaVsn8P6GvgTZ9clcGpMCOVigkqOTNgMx9yh7Gms+rVeTj70LqseG3MZuiLmhIuimPvsG
	FPFSLhFYbNh8hV7AuSONcI7Fhx1sAqpqIeLO3/EOx5ZlEojmBFCSq4sDuMeovoGXDx/tcioSdga
	5aYt2BuON8fL4NaPvVA1+pk60tilohLWz6jMeHzvpav94t5LF508ZBcOacHZ63unkuUqpYyFPQA
	odchWZuKDZW/vhaex8CA3qgSDOXz2Ixm9UxRlmO0KItxnWT3mHZJ6NV2lqLrk1z3r4nGTro2/7H
	WR00+wIxmWwxd+2fgrlqXZEQITO0mDTanO5FHvgZafdnzhiu7b4fzj/42OVkHJCSyVZ5/c/Pd4T
	Fy2iTgIRUT2Gq7NFCfdW1yf4IsSOZMPSfZTAReIp1++o+3STMQydFZg5c1cGWAoYs+tqtfdXcju
	LIQEert2RXBKuONoyisBhFIYFdxYoXwyJAKIPSZWgBPjiT7GwnCCh72FH8lrj/NaIR4adY45RC0
	b0OWHRgVz1Bk7h8vVLMuFRbRYFQN8ZjjF9PyX0FKUW2a6mx4NjXmloN6
X-Received: by 2002:a05:600c:4e0e:b0:4a6:eca1:7d5c with SMTP id 5b1f17b1804b1-4ba093ac8f6mr46752285e9.32.1794408271122;
        Wed, 11 Nov 2026 06:44:31 -0800 (PST)
Received: from dev.Default ([86.127.229.203])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba08de826asm46656495e9.0.2026.11.11.06.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 06:44:30 -0800 (PST)
From: Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>
To: Navid Ghahremani <ghahramani.navid@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Junyang Han <han.junyang@zte.com.cn>,
	=?UTF-8?q?Stefan=20D=C3=B6singer?= <stefandoesinger@gmail.com>,
	Felix Fietkau <nbd@nbd.name>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH net-next 1/5] dt-bindings: net: zte,zx279128s-gmac: add the WLAN DMA interrupt
Date: Wed, 11 Nov 2026 15:44:22 +0100
Message-Id: <20261111144426.1321237-2-isasmendi.agus@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20261111144426.1321237-1-isasmendi.agus@gmail.com>
References: <20261111144426.1321237-1-isasmendi.agus@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_064433_098676_D3DD549A 
X-CRM114-Status: GOOD (  11.46  )
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

Besides the traffic manager's interrupt the switch has a second DMA
engine with its own interrupt line, the ring pair the vendor firmware
uses to exchange frames of offloaded flows with the WLAN drivers.
Describe it as an optional second interrupt, named "wlan".

Assisted-by: LLM
Signed-off-by: Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>
---
 .../bindings/net/zte,zx279128s-gmac.yaml      | 20 +++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/zte,zx279128s-gmac.yaml b/Documentation/devicetree/bindings/net/zte,zx279128s-gmac.yaml
index fcbdbafa766d..b9a419e5d44a 100644
--- a/Documentation/devicetree/bindings/net/zte,zx279128s-gmac.yaml
+++ b/Documentation/devicetree/bindings/net/zte,zx279128s-gmac.yaml
@@ -23,9 +23,19 @@ properties:
     maxItems: 1
 
   interrupts:
-    maxItems: 1
-    description: The traffic manager's interrupt, which signals frames
-      received for the CPU.
+    minItems: 1
+    items:
+      - description: The traffic manager's interrupt, which signals frames
+          received for the CPU.
+      - description: The WLAN DMA ring's interrupt, through which the
+          switch exchanges frames of offloaded flows with the WLAN
+          interfaces.
+
+  interrupt-names:
+    minItems: 1
+    items:
+      - const: tm
+      - const: wlan
 
   ethernet-ports:
     type: object
@@ -98,7 +108,9 @@ examples:
     ethernet@92000000 {
         compatible = "zte,zx279128s-gmac";
         reg = <0x92000000 0x400000>;
-        interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
+        interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "tm", "wlan";
 
         ethernet-ports {
             #address-cells = <1>;
-- 
2.30.2


