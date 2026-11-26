Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48529606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 19:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fACpQcC9;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OGQg6/Fc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LiLmIUs0OkCCdpFo34dseBA6Y4Jh270a70ul1A3BXtY=; b=fACpQcC9jdFeyD
	TBLjFmMU7DQotTZu90Hvn87nzZCiFsZeT+Jx+1gKhXL6//90ZEnjiWAHlCDV455RnG2S8vZARDsKx
	R9YJ0bCElIOrZAPZH6BrZLxtuqgbGryfVsJQN/dR/lWk8XSe5SJ+RBqPJqIJQqUcNQnxoyTaURLYP
	g8Noe0bbxqVSW+cANPUq6kmmeYzxy8tOAIeo0G8MNxSmQPuSZyLnPWSJQ9V+YmPC6nMTwxijTDKYf
	6/U0RHj++eLaFXejXTpSn4ryjAlE9dV0OTsMP9Ujc2jjhESCJgUw7iRVdxmKwg7YKJ2ccFBZHmHDl
	aDu43sEvi+dO1iRs5m3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfDh-0000000EJga-2QyE;
	Thu, 26 Nov 2026 19:33:25 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfDM-0000000EJOK-1O0P
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 19:33:05 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so43216755e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 11:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795721582; x=1796326382; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LiLmIUs0OkCCdpFo34dseBA6Y4Jh270a70ul1A3BXtY=;
        b=OGQg6/Fc0KxekiOFbAbMIhO608iJWOrhyJJgKnuI5hoedw8+odx5PEWbzTy++pNtNm
         1s5lkYuP0fEjWuOQ4tjdza3VwPF9ZaDNbCRRElxnB0PiK3Q7kvfkKQMztLXUy9vxPLnm
         rHM2yq/trh3Veg2TRllROcQTM91K3oDxZWjHq5/mprtDVf0XJetlsFLGrALIJxoHlZ27
         EzMhhD1T7Xt4nrDK+DQjf6qFaNiXrE2DZsHk4DqIs5Ddv14YY1jQ+ViSNOcinIlzlMJ3
         CZPttgc5+RIRY1DDNIEHAmm70Gy39QTS0oMPSQCjURSK6fsXuAk02im8evlUb090l2+B
         u5eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795721582; x=1796326382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LiLmIUs0OkCCdpFo34dseBA6Y4Jh270a70ul1A3BXtY=;
        b=SK2jJbXUKjGnMwIUQwrYD0pMAc4h++HkWVrAm4u0S+y/skjCKFvwYo0dMh7oJ8ldZe
         QnyQ6I/mmpvQgWpiUV1dW5kaKV6ehEWKHZDnOis0ahS/M/5YOaAzWF+REwYCNIonpGiD
         ce+KTTIwP6ZT4MlBVBbp9ZtFmtx7ftk1GlvWu7+D7kpjrlHmLJYLEcQm373AX/0uUGvY
         ++eIpQt2rUo5RgQlD0rrp+ApG7t1qa+XMLz20QNFJ+dxuotWJG3QLLVwyELo1yoBv1lR
         GrenrJe/gjJ9YGicUrO1y/pRJpPGZHX1+FLbcxgNPnVV/1WndHzihycjtw6KXG08ojNu
         ZXmQ==
X-Forwarded-Encrypted: i=1; AL+hErGqzI+XU97arIRIWhVJ9L3BemXjnAsEj5315azoJjwTs0sHyCgdxuu0fnP4SQCtOpPLzWlp/Z3i+ECa9H5hlhVg@lists.infradead.org
X-Gm-Message-State: APuU4Z8C9VElQkDYYQkzgqVzkg9VISe7Di4IBtfk6S1iJe9zsn3MlKAX
	c3r8X5fCSZJs4hu7OSVcEjSZIDaS+svwdkHjqQJ6BgDlclXWPFugRbLO
X-Gm-Gg: AZFdTZdwC4CIgwE7936zDglD3P9v92WXeIN5Yv4bVNyLNmKv5CDqSRQACuKDDxRbQx6
	AtuMvPEhaTKiGscol5TS4b/FhZCm8y2fZ0zHDz8BGM04V6jKdTI25eFxnnXM3o07xfK5F64xJfV
	BZCbKo/s4Ns9QMdEM0wNOnFEktNc/FdShMuhShiexBTsa/r/hiB1LcOP4syy+Irnrrt+g1cO6qF
	7g48NJ/P5/Mq/7/gIf02nUTrBNeGNl0CQszUjjTaFsnRtAYdy6eOZFWuFvW5BaoApcYL/lVZa1v
	F0Dq7kO3VXWWfl0KsNf3llmYoKvcIy460dWk+0PSxFK/WBojFeagBiiS6fScQK0HCLsbtcvQbha
	090SO4ixD3BIK1AJRI6noXrGJrGh4VvLoSaNOzxna88W0xGn+Y4NGXw8aNKzf+Jcl9EB4FstG69
	hnfNSD+o7TS0Emaqq9XiiOuq8lp34V/EuzRbrlBT7wmoZWe8AOoQHqd3vntJu16uT5B3yI5/3/Q
	remm7OaR3nB25p1Vpee9OXIicdDkfYwlJiwID92UM5kDgklXdXvUaSnzwpzKF594KuJsI53l1A8
	KsGvGqPVn1x1fiPNgLApfv706siO+2FfuXIFWAjQNxJYoA==
X-Received: by 2002:a05:600c:4f4e:b0:4bb:6c71:b268 with SMTP id 5b1f17b1804b1-4bb8882672fmr465522865e9.6.1795721582273;
        Thu, 26 Nov 2026 11:33:02 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906cdcc1sm368287675e9.2.2026.11.26.11.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 11:33:01 -0800 (PST)
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
Subject: [PATCH v13 02/25] dt-bindings: crypto: amlogic,gxl-crypto: support new SoC's
Date: Thu, 26 Nov 2026 20:32:18 +0100
Message-ID: <20261126193241.1471372-3-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_113304_670376_875172D9 
X-CRM114-Status: GOOD (  10.64  )
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

Now crypto module available at G12A/G12B/S4/A1/SM1/AXG.

1. Add new compatibles:
  - amlogic,g12a-crypto
  - amlogic,axg-crypto
  - amlogic,a1-crypto
  - amlogic,s4-crypto (uses a1-crypto as fallback)

Difference between this compatibles:
 * Different registers offset and the number of setup descriptors.
 * GXL doesn't support hashing like the others.
 * G12A/B and A1/S4 crypto HW don't support 192 AES key.
 * GXL, G12A/B and AXG require a reverse IV key before processing.

2. Add power-domains in schema, which is required only for A1.
This is specific vendor design: in old SoC's power domain for
crypto HW was not configurable, but in A1-series it is configurable.

Signed-off-by: Alexey Romanov <romanov.alexey2000@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/crypto/amlogic,gxl-crypto.yaml   | 24 +++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml b/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml
index fdc39797a2a9..106a9d1fed69 100644
--- a/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml
+++ b/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml
@@ -11,8 +11,16 @@ maintainers:
 
 properties:
   compatible:
-    items:
-      - const: amlogic,gxl-crypto
+    oneOf:
+      - items:
+          - enum:
+              - amlogic,s4-crypto
+          - const: amlogic,a1-crypto
+      - enum:
+          - amlogic,gxl-crypto
+          - amlogic,axg-crypto
+          - amlogic,g12a-crypto
+          - amlogic,a1-crypto
 
   reg:
     maxItems: 1
@@ -24,12 +32,24 @@ properties:
   clocks:
     maxItems: 1
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
   - interrupts
   - clocks
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          const: amlogic,a1-crypto
+    then:
+      required:
+        - power-domains
+
 additionalProperties: false
 
 examples:
-- 
2.47.3


