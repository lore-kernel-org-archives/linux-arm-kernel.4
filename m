Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED475606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 06:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=34WuvRG+;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ixn1KYR3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=togVOXp+Ydg/br8KT/x6g+AKENI3qvKeU0FFIYM4R/o=; b=34WuvRG+i9MXRE
	0SK9C8L06QcuZ8SMKTvOFG1WNHmm928fK2kt/bX2GJAI4/PYx1UobTqLyKFDy/gjj6ARaqNy1V8zC
	XST+xu2dqlqn/ExvifTaHTPPT5MBN6RsXAkSi5SAledOZ1NfXKQCsPxb3wBmagq2AnGZIWcvZOnAA
	VK/rZwwg+ou1JTrl59Be5AoBM0WzpVTE3M2EhVyOzqZiffDRInRUFt9Rj14T/P4Q5QpzlVj7DXmFf
	3YXGU2fuXLntALgURv9wCbOgMXry7t9/QRrTP0fkwkqRUZVtKHNx09/J6SNQSHyRfiy4BhWu/sQ/7
	GFpzR/jCBKeqLdtp5Uzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSTT0-0000000H6qW-3J9G;
	Sun, 15 Nov 2026 06:11:54 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSTSf-0000000H6dp-25mI
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 06:11:34 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4bb61185057so6499765e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Nov 2026 22:11:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794723091; x=1795327891; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=togVOXp+Ydg/br8KT/x6g+AKENI3qvKeU0FFIYM4R/o=;
        b=ixn1KYR3sIcKlJFjQiak8WqydUEQ8tVpl3Z08dPznmg/Lhmh9cN/DCpjPg/3qujf/9
         51sObNgn90rGv6/EOB/PkX7H4vWHgZWVpVYO1WymTjM8LY96mZntbKL8iEa+Kz3IyWEm
         eSPLjn8G5L/SbsT5ewVHyZgU7Wi66YjoCsuv7/8mgdJQdxvncihKaUuA9e7vDhUok4Ud
         KbTiM6PlvEShMG+sNEwFZsuQS2Is0cwpAbLMHqozaBUnkaaehJbaWEYKKEIh2p60n5bG
         SlE+kzlRfPz2cQYYpJOk4K6ZH1aaN26XIMRnN+7dXx0hnWYmJMNxJGEfHs408CNqI8i0
         w68Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794723091; x=1795327891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=togVOXp+Ydg/br8KT/x6g+AKENI3qvKeU0FFIYM4R/o=;
        b=DgJc541Z8rCE18pSCxQQ8NiMX0NaYPFu1h3EvvEBIRZRTlF3XaGTXzDM9b+IbpNOU7
         hPyAWg21S1cdUkjSTzZngkDEzIWA2ZR4RP2V2ixlAjiFkN4NeF85oZESdH4hZoF+ujOJ
         6Sa8JKF6XXY8VpS070GvWTmSULwFuVooHGqfhuHtvfnWRulat2wYz3AFPxyAe0OGCo4Z
         ozMd2iYaHMmoWF3oUqMGbmb1lgsAvzJIaItPmr/um/4qzOHgC1yQISA75OyfnKOko/YC
         GL0fBDN9Ceo5iixu7CbeMXEN5cQW4f83IvnQmw92CNayEmpDTnfgXzcCnm4PAJfw+4SE
         bq/Q==
X-Forwarded-Encrypted: i=1; AL+hErHTT3KgwptQNWY0Byf3QGUWIyPFyKHZQXn05qvKoQxVLnRgoMKjAfT1je6MGnIwHyWz4IyWiUsFjnIENx2Q/zFa@lists.infradead.org
X-Gm-Message-State: APuU4Z9d8c0ohqwwYBCIcjEgRkdklNesDDptPKBFKM2P7nUSF1nXpQX8
	yjkTe9t1GpnHNQ1Am4o/I4UrnjDbqxm6WlR3g42INqgLLFFncelvHaLC
X-Gm-Gg: AYBFou2me2EiOn1acNc8ux2SQX7Z+JcY0CxsosP/EZHt0MYFOnjB31JYRxlFMtKAMiC
	TvO9pivTGOjL3pXeSIdhfFaJ7pr5ysDJ3XQf5wD2ItXOOdCbE04uPzbPOvLhuakjTw91URT2V44
	vUgq1gl2sw/C9oQ5hNV3+FEFRaS/U8ViQlGiy6xoJTFdylfkUwY9D/8zAPmV3OR0bChlS/p3jPE
	QrMnUry7NKcB66k1aSlq+V7G9WcUWFYRAKk1bDX/pc4lvzuq4kdik+hd51CofTecYHOuMlwYGLn
	ve+BzPeEg/n1kUEdvdCCXMs1iaZSRWTJfQAYlNWsg7rfZAHV4SDrN3qjbdsTtx8k0YAdDeuow56
	Rui89k9HAvO2fcc7Sv7qEgqMbjL9X2uTX0OyJOIbTVaasde9juJuLColKncDXa+c6ZQNX7aMSG7
	XGptji5temQIcwjGExkO7AS1mGgQtjmRdhLoG1Kfl36dVP7GHsmVLurEBcB/ztRcrNEtE0ck+5H
	pUFtW1Z5/g9xAnLvxqKEViRQVP51imIL5Y1D9ke6fWpJ23Mkr9USQ4gvV/nl9v/QhkNnnggW5gU
	1SDQjY8q3rOjzF5OeNW+r1PfgctyMVdOfL2V28qN65o9Av34yHGI5sQJdkSa1qPdHsPzrKDmCqE
	Th95OjsosV/EY9e9uFKj0rgJoj6NaXRgstLt8W1+srO3xeB5WXGkhVadkkvEvHqngVlVjCm0z9z
	6ZSODYR7zzE5sl+h1QwmIgZ+yjghQJFpm8MHwTRba+6q9XwsM1X6Obvq6mSrN6E6J9E9Ydn1Wcg
	9l2pOYhpYLjvA==
X-Received: by 2002:a05:600c:3112:b0:4a2:150f:1607 with SMTP id 5b1f17b1804b1-4bb55a4ebfbmr158351435e9.13.1794723091535;
        Sat, 14 Nov 2026 22:11:31 -0800 (PST)
Received: from jernej-laptop ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5ba25b50sm139331075e9.14.2026.11.14.22.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 22:11:31 -0800 (PST)
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
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	sboyd@kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v3 7/8] dt-bindings: display: allwinner: Split H616 DE33 layer reg space
Date: Sun, 15 Nov 2026 07:11:01 +0100
Message-ID: <20261115061102.229680-8-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115061102.229680-1-jernej.skrabec@gmail.com>
References: <20261115061102.229680-1-jernej.skrabec@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_221133_567927_96950AB6 
X-CRM114-Status: GOOD (  19.28  )
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

As it turns out, current H616 DE33 binding was written based on
incomplete understanding of DE33 design. Namely, planes are shared
resource and not tied to specific mixer, which was the case for previous
generations of Display Engine (DE3 and earlier).

This means that current DE33 binding doesn't properly reflect HW and
using it would mean that second mixer (used for second display output)
can't be supported.

Remove layer register space, which will be represented with additional
node, and replace it with phandle, which will point to that new, shared
node. That way, all mixers can share same layers.

This change is intentionally not backward compatible and the old binding
will not be supported by the driver, for the following reasons:

- It can't describe the hardware. Plane register space is shared
  between all mixers, but the old binding puts it in the mixer node, so
  only one mixer can ever claim it. The second mixer can't be supported
  with the old binding at all. It also has no way to reference plane to
  mixer mapping registers, which live in display clocks register space.

- Supporting it would mean keeping a second, mixer-local plane
  management path in the driver, with hardcoded plane mapping, which
  doesn't match the hardware and which can't be tested, since nothing
  uses it.

- It was never used. Upstream H616 DT has no Display Engine nodes and
  the rest of H616 display pipeline (TCON, HDMI, PHY) is not supported
  upstream yet, so the old binding never produced a working display.
  Vendor BSP kernels use a completely different DT structure and no
  other known DT consumer (U-Boot, *BSD, Zephyr, TF-A, ...) implements
  H616 display support. Only out of tree WIP patches used it and those
  are updated together with the kernel.

The driver will print an error, asking to update the device tree, when
the old binding is detected.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 .../display/allwinner,sun8i-a83t-de2-mixer.yaml  | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
index cbd18fd83e52..064e4ca7e419 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
@@ -46,6 +46,10 @@ properties:
   resets:
     maxItems: 1
 
+  allwinner,planes:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Phandle of Display Engine 3.3 planes node
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
@@ -74,22 +78,22 @@ allOf:
       properties:
         reg:
           description: |
-            Registers for controlling individual layers of the display
-            engine (layers), global control (top), and display blending
-            control (display). Names are from Allwinner BSP kernel.
-          maxItems: 3
+            Registers for display blending control (display) and global
+            control (top). Names are from Allwinner BSP kernel.
+          maxItems: 2
         reg-names:
           items:
-            - const: layers
-            - const: top
             - const: display
+            - const: top
       required:
         - reg-names
+        - allwinner,planes
 
     else:
       properties:
         reg:
           maxItems: 1
+        allwinner,planes: false
 
 required:
   - compatible
-- 
2.43.0


