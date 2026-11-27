Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD86F606A334
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 12:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=StLzYAWO;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EoW2Zrc2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LiLmIUs0OkCCdpFo34dseBA6Y4Jh270a70ul1A3BXtY=; b=StLzYAWOsJnbLa
	AEdkik2YlOdm2K1WgD87tAn9JdrgDV4v3sQCPzOXHO24nRZPvjXD8APWWTUTdY+ON1vv33iiGUQOr
	26nm2Zw/n4gNQBpYgEeQE/HJTOBaCix/Vjm6GPRF1uZmgD+YG/RUpkmdy0SFz5Z0MO5CMrwWjZ4Pw
	Obiz69iNz4z1prVOmVtVAfIbuWKKanZlqbMMJYzb1hV0saV9G+VIykBmZBlgvO7O86OPAo9HrZ2wz
	r6jbl+Vt7S/T515NkoiprujL13M3ndADsRL8TPQWbB0vk7Bqf1sIZfJ260RriA7oMzpktfrlxOSf+
	M01yorpG9ozM/+b+iJMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWueC-0000000FwLs-0ADD;
	Fri, 27 Nov 2026 12:01:48 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWudh-0000000Fvzc-0QlT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 12:01:18 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-4a68190a2a7so6802117f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 04:01:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795780875; x=1796385675; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LiLmIUs0OkCCdpFo34dseBA6Y4Jh270a70ul1A3BXtY=;
        b=EoW2Zrc2+Xv+1fO5xPFJHGE3swLVJzJHf613svESVKGim21DH5sdFnZNj7lKtIMFjP
         mNLRY3iYLaoSmN19iktrBMnGX99tIlfiJ0S2Y/7L350+HAMlLTlX6reisGIt3LwzglhB
         QHojDhMJxmj+bbwrIxhkWlFxmZJbsjd5HCCNOQ5PQKw1NyuFh+GFxqX3jowPE43eQtft
         Pbbsrro6emdJmOkrB7CGBwX02VIJrHn/Cijnx2JtkTmgZuEvlYXiAYKMCH3N6vg5rA/E
         KCdFk3qM75wgcmghKzaLrCL/G3XJ4vCF7N2PiKn6ILRxfsrK3YNco/U8FJfctre+gJW1
         9izg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795780875; x=1796385675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LiLmIUs0OkCCdpFo34dseBA6Y4Jh270a70ul1A3BXtY=;
        b=Q0RTsDXp3rMsNUujZ+spAV/pJgHGRn171gS2SjmyR0Zw1ddbgg4JexgfY8TO0Lt5Sa
         xWPuyOLarrNayiktAwh7TcOHlyceIF+nqWLNlhYU7L+VSFcKjVt3SCxp3PTVGhln8Hhw
         lM1Ub7PCs8K3GkZXDU5eHslCAPLYvY418ToDcoW2JbkDA/Q0ec9FVyK02l8M2rL5sqLD
         1iUcHKnyu9ExOMby5etoLhFQeSF16YtSp6Vu7po5r2i0CzsNkso6JxKBx1IJHOS93pF+
         GhLDTkLYM0MHoxoBieSj97eZ0DOT2625W6YUeivOIdMRefZ+aw6k16dhyZmsh23Ttt61
         pAuA==
X-Forwarded-Encrypted: i=1; AL+hErFutfPDz4jnM67sNTYPZAmAQLo1ZcZFaSgaBq48rpJhnxPPUlUJiIxbhjX5wQeFJ39ejafd+egBzIw/dcV13Dmy@lists.infradead.org
X-Gm-Message-State: APuU4Z/Ne65PwZ45qJFDxaMZcbHfTI9CZ12u+/O0OSfCR43QKlYCim/M
	vhlU/Kw5XjKzu2OKhn32s4xbA5REX9sR4x5et4Vhqdswtqu+Zw4H1IC2
X-Gm-Gg: AZFdTZeMlh85/qOpRrwEl6Ms7oDlDbRM5ws09wv7Slbo6jKlr2wOHng/z+jI1O5trtD
	AOWO6E3v2xcxqjNBrlhnEJFs32jg01Ch9nHrnzT5VBsbOPuMdnuON0/0wZiy/fi6eNYtY0yKbgm
	eOx+jemftDuV3lzDBL/+X6VdUZngs9a3q0D8NxBBqBmOU6gZj3joSCBu7nHQ00Os7pZ8ZI1lQmG
	5cqkxXYNE2jZFuvR0BxnQ2ylDU91mKKHK2b4K4JdEu8R3UUnI6KAvEOEc5ERHMsLT/FxPN/RRoV
	KioAq/N2kvt7a2Dy6gTkMUqyh+IhXr7VXiJpypZw8JfXwSZQMhpO3KndN+Y1NbkfvoBHqSCPrVj
	rRKcqexx9Mh1rEHBvdMvyoKyQlCMFeI2t4Wk/KSkEjJk+VcyeXlINSZu9JkHIY9q7a5bQHDGYRd
	4TL3yIX/QiatqyAkaqijEyGJG3mWxmqT6KRyjU/6uDk+4tqqzk53E0YP2Kf1TZK5DKWmsu0je+W
	N1VLS8fma2izrZRnTfoyY9jusiMg+1ke1Ym1BuyzPto9gUV5UKfejNwC/3YhlyOAxacK8HuFeeB
	b83YfAofTDHCb1JVcJ+9j6ISmMwwWuL2T1Uw6VInYqvHdpk=
X-Received: by 2002:a05:600c:5487:b0:4bb:5de1:e92c with SMTP id 5b1f17b1804b1-4bb88813157mr490184945e9.26.1795780874947;
        Fri, 27 Nov 2026 04:01:14 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm393684565e9.0.2026.11.27.04.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:01:14 -0800 (PST)
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
Subject: [PATCH v14 02/30] dt-bindings: crypto: amlogic,gxl-crypto: support new SoC's
Date: Fri, 27 Nov 2026 13:00:35 +0100
Message-ID: <20261127120103.1532882-3-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127120103.1532882-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
 <20261127120103.1532882-1-jnieto.alaber@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_040117_154589_5FDDF86E 
X-CRM114-Status: GOOD (  10.65  )
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


