Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6678B606A335
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 17:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yx97Ex83;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s/HPKC4Z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=HyRQC7LCLt2aLLScf7p5/WBb90iUzNQpHgR+zoYi5DQ=; b=yx97Ex834SCpFV
	unKWLvFE4RIWlAozm/YZB+dSXKzTzBbFadRUEklWJMZmj5BM44azYvkv70vOMKLsxnGHpJeZHIKtD
	eGsp76+R7q0MRcMgm5kYH4dSPcI6f0eBwZwnZZn3SerwUKeNh5QQ/Uip+6qHv+nAU1CY5luVoQhit
	36iDHLMD6wToT1hNsYubz5mnbrHTzWjp2CD2eYoyHR4zOlTEXz5EZpDdc3K1TPn+k7e0vhis/XlMC
	E8Xkcsdd3Q1XXDXdI90U9El2i9y+4XMF0JUFs8LQAdlvJhTjq73fWo+AxYpqrTp10W1ID5hPDmWRv
	TpYUg84KAdtO6GA6MMRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU6LW-0000000CuH5-1pSm;
	Thu, 19 Nov 2026 17:54:54 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU6LQ-0000000CuE6-01VD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 17:54:49 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-4a9be758734so734494f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 09:54:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795110886; x=1795715686; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HyRQC7LCLt2aLLScf7p5/WBb90iUzNQpHgR+zoYi5DQ=;
        b=s/HPKC4Z0F/UfE+RqXfr7zoh6JyB1X9vo7QrZtEZ6/8FMOqAV5KEj3pdLU6W7uKBak
         Kj5RRwd7Y1R9JZngXP48/t/6MwsRyBm5/W+7DHusSIepyw7RZ1lnhH37cqWEj3Odl6Nd
         DSN5woA8g076mT2PfLkXZvBjVANhmZBNna4uAhQfMSzaNIb/xKNZqldhoeVZ8cA7kJZG
         NiNlLuvayNJSigIXAMNaTw6sgeOUpBwAL/tXLgWTsAYc/WfZ56gE4hjStbgVcyX9pBlx
         NPYRuIt9VygclBbvr0fkiuFjyXSlDLLqCpWpiBOr7o2oRnPOS99uPmU5OelmL9g5kZ6Y
         OFOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795110886; x=1795715686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HyRQC7LCLt2aLLScf7p5/WBb90iUzNQpHgR+zoYi5DQ=;
        b=1Zdap4P6uXlEFUcoskGD6QJFmLK13rnYP7j7dbQr/loBSdlfH2ag/vRvb5lYM0k+k9
         ID2NAtbrMLXTMqG0kboKT6GAZQg5EsjNBA7i3CqqZX2uplPoDX5x03EAispkTcrio5bM
         9x6vBDyIciuUAINcc9hgrYp1+KZq9FxK0qYsdMJd05LZjWmt0uAHRGblvZAHyvBhXrSQ
         IEl2AyA1Exg4N+M3u5AC5qIQo4nQAEFnZBxELDzlKb7a0P1wzyNT8WPxiNCbM75qvwLq
         C0vrOXGlM9cSGGrda4t6jxnmZRMvJkhKwKvoI3rBuzUU1jmQKKV+oPvY7tRnXvHmMy64
         MdtQ==
X-Forwarded-Encrypted: i=1; AL+hErEX4kzmjrGuzyoUdi88z9qHzt1Ce1eCICThNqAeEEXtH21RHDQeRdPXvBV9QbnYzutCs6l7pqY9q4JnZ3deDrvJ@lists.infradead.org
X-Gm-Message-State: APuU4Z/bIpqQMxUvQF2ld7u73tLVp06CgS1y8TvGY0oNSOWf5he7SgMb
	CLQCEE6hKDPQcmSOmH4/xwM9N6HTONBpKVpE3oPY17HQaL5/upyyxNKQ
X-Gm-Gg: AYBFou3YrZ1r2c1vvzrs9TEBUnpbaw6uLcR4SC4rTKPs2h3lV4GARFJ5UyDawGGKgOv
	IwTzyLZ2bCOZD3yfGPJpVSzjLnaWKdYJAMo3pQyzv29uZ+7aRnYGVmAaDVa3Vm9PzyQTFuIWKUQ
	85BrJaaZCb3EwBtCHByjHp+2YszCRpGOW5jrd6f8gO0+4gQys6qZUlXeAGTGoF/OFN7y0qVKh8/
	3B1c7td967fH8B7bDZmM50hXZCjL9QXDDlvaJOm1x1YekdT/91r2S40J0gp0BFaYWAfY33xeYgg
	1cDExacJ1z3rDQC00cQ09GbqdZVkBACIG1x2odqRd8B8WZ19YncECjAhzTbpPxQ8IOtqYpdhJsv
	UkOo8gw5L1SUu4/uL2eOTRjbjEdOCIJfmTgGwDMvdRqZixrLgXGqZ7QwQlVO4cT2ywQxx03khB0
	dlgc4jjmoZqgg5r/8xqNpWccY0HtyrdDBC8ii8UpCPGLy5ZidhjhC4/aiLo6GLevo21dHQV2blQ
	jWjkcuRd2q8XhGl/b/ycdBExvwIlURmGIvQXNWZQ1X9YBm/NpsVubwsap6XegFNha57VOc2kOwI
	IVMxXpJVuXEzKBZNB9CCIHR71K+LIWjn5AvA7PumI4v2hfCanV5h4r+OIw304B1tTKsY2DqXWI1
	h1Jh84j3oY9hwGq6cii+7OV6DtJ0Pi+gRwQ3zFCyuFZnGQCbUTfwFPr3glfUTfen9z3XbdXYgtx
	xQqr/viZqbqeOIFZiSAf82tOF5VvhH/viUdN7XnqJEy8BOeleYtWE+ipqXJ8/yT5Alh51BQUso5
	CdMY0lqhdfY8vRO3Sn+EZvx2vSPbLYaZf2/YG7QgWO2I99WSAI9qPiu
X-Received: by 2002:a05:600c:a55:b0:49f:ce78:356d with SMTP id 5b1f17b1804b1-4bb88827db0mr6257205e9.30.1795110886049;
        Thu, 19 Nov 2026 09:54:46 -0800 (PST)
Received: from jernej-laptop (95-143-148-21.dynamic.telemach.net. [95.143.148.21])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb84e50512sm29390035e9.3.2026.11.19.09.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 09:54:44 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 2/5] dt-bindings: display: allwinner: Add DE33 planes
Date: Thu, 19 Nov 2026 18:54:34 +0100
Message-ID: <20261119175437.2520400-3-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261119175437.2520400-1-jernej.skrabec@gmail.com>
References: <20261119175437.2520400-1-jernej.skrabec@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_095448_059204_0C344701 
X-CRM114-Status: GOOD (  13.81  )
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

Allwinner Display Engine 3.3 contains planes, which are shared resources
between all mixers present in SoC. They can be assigned to specific
mixer by using registers which reside in display clocks MMIO.

Add a binding for them.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 .../allwinner,sun50i-h616-de33-planes.yaml    | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/allwinner,sun50i-h616-de33-planes.yaml

diff --git a/Documentation/devicetree/bindings/display/allwinner,sun50i-h616-de33-planes.yaml b/Documentation/devicetree/bindings/display/allwinner,sun50i-h616-de33-planes.yaml
new file mode 100644
index 000000000000..0a07cb8a5f79
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/allwinner,sun50i-h616-de33-planes.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/allwinner,sun50i-h616-de33-planes.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner H616 Display Engine 3.3 planes
+
+maintainers:
+  - Jernej Skrabec <jernej.skrabec@gmail.com>
+
+description:
+  Display Engine 3.3 planes are independent of mixers, contrary to
+  previous generations of Display Engine. Planes can be assigned to
+  mixers independently and even dynamically during runtime.
+
+properties:
+  compatible:
+    enum:
+      - allwinner,sun50i-h616-de33-planes
+
+  reg:
+    maxItems: 1
+
+  allwinner,plane-mapping:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle of the device responsible for assigning (mapping) planes
+      between mixers.
+
+required:
+  - compatible
+  - reg
+  - allwinner,plane-mapping
+
+additionalProperties: false
+
+examples:
+  - |
+    planes: planes@100000 {
+        compatible = "allwinner,sun50i-h616-de33-planes";
+        reg = <0x100000 0x180000>;
+        allwinner,plane-mapping = <&display_clocks>;
+    };
+
+...
-- 
2.43.0


