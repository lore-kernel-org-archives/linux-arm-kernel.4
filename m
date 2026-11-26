Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0086606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 21:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=g6bJ6tg6;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=mpbIFdcN;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=00pwyuaY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vAPLB5wINg8+k5DF0d3PoxcepaPENAHu+hHbKIVA9v8=; b=g6bJ6tg6JawCzK
	SaLApzJRZ8adzKMZ0XdQq6cKXS0sfDgLnYEGqc/Yg9Fc7C8aZDfFL1uGBIXumvPBKVsZtCekPQMY4
	bYIAc7XOh1hI9SqckiObdN0r1O+pRnUV6BfjWqYJbphCN/IChqwaTQWZ4gApO5AKBQz5aXzoVkSSg
	JwjVy2e5dvFEHWhFlQh+y9IC4W3chBHlPHoLNlnvb7GnW6cHGt+/OqwG8Pfq2kLJPQ3pF6sFcp3pV
	QTJsB1JbtOa1N6eGHtxpHVwqgHlwXWG1WsgHXQNtEyjj4Px30nsVtddH98GWEhFLnX60rc8PKP7OY
	pZQ9sl7GmT1zHscQjkBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWhHF-0000000Ea5w-2XAA;
	Thu, 26 Nov 2026 21:45:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWhGw-0000000Ea04-1snX
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 26 Nov 2026 21:44:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=vAPLB5wINg8+k5DF0d3PoxcepaPENAHu+hHbKIVA9v8=; b=mpbIFdcNyACx3338PHRoeDzgW5
	shWE//h2i+fed5jfY8i4svGTWCsXvaN0DgCIP2ff84H3/vJVMrpssv3yE+V7L32+1hsz+nS+u6JRz
	GvdNdqEjHO/Zk4xKeEq4HpEir5f6VePJp+EthzC7pWANSJLYtRVBsYsNxNpFhTYqjnBS2u2rNzvHF
	WuBS2w+LXvLLxOx+zsQ1P7GZaPfbqMLJQdOnAydrxIuCGjso4RH2eMbpUjnHX3ZAofcuV+guQAfgW
	EiuZv+rlCb/JJHjZpc+veMPO6Qf4o5oAg3TuSFKoTgy/JVEURmjgqFMTfOEQTHjphFs7rOVcjKbVf
	qBLHjWtQ==;
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWhGr-000000074dS-1vIQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 21:44:52 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so96304955e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 13:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795729481; x=1796334281; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vAPLB5wINg8+k5DF0d3PoxcepaPENAHu+hHbKIVA9v8=;
        b=00pwyuaYgMLwizAMKmRNBe88lFyOAv6tG7E8HgW8pVVq7ZiNDEvx69EcLenZshpRBn
         s4wruG7/W8NVnUpG8H8/SciB9/uipgkYyxnjpAbHLUKI6Gk0tuio95yuP/o++lYheGGS
         wfqwrvDErFHFHmmaNFd0uysiDgIbwArjHvncB7BV48EbkSUzzoSLOyCltnqTWkHI8Dmw
         gf/JiX4vRpaY/HqnQlQHuie/ptVod/zThmdV6Yrh47zNs/jW5cygeCy7rItiGh+z0cMd
         T85Q84d6bufiK/tsEkzMkhJqse3+s4EQHLyao7JqS1sD93PFuknLwpH22sfCJkTLoEnE
         S3OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795729481; x=1796334281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vAPLB5wINg8+k5DF0d3PoxcepaPENAHu+hHbKIVA9v8=;
        b=1eng/3Hjvl0sJGfNXZmBoRgan/dLjLNe/N5Jsre0D4XKCPm01qETUB8VzYBzCXM6Ua
         cxFLuSJO/Hgbyr/cZo3fxXY0GJht69cL6so265v72xvdZwZ1LDya9Fr6UCuN/l/T/npW
         PUGVQ/hyucQX2zOXyWvQSnIChZ6DyHkEKf/tsW73FGHnN7OXpR/iazhTae+HxOg6cmRa
         PWsmS77GZR+uFoV9A2EnOA2/TTjQy9d9SUJtA0Es14FvjBKoPhcrD77rlydx/kAsHARd
         n4zYlvouAeIzhIlZisADcvtllrfgtzQHRbHwigmnM0j3FuGWzzDEhe4tUR8oG4SPy5z6
         4EZw==
X-Forwarded-Encrypted: i=1; AL+hErFbX2lc+pNnFr5dhH7RwvTmIUccusbEE4O29lPwrKWleOIOvyQMlWYmDJIN5eh4aLL+9dQHhiDm1DT/7CgeClPd@lists.infradead.org
X-Gm-Message-State: APuU4Z/uYYYYUd0s6ad2EBtHCd4TCKFD1A/vkWautcwaeZqaSxxqQj/b
	O+LCFYVBajakRdTLtWveY54sn8Y+L2O3ehnUbA9YLyzB534GTj82UIHK
X-Gm-Gg: AZFdTZcoT/sJg5MtGI9Cd+FVf7/eTVMnZ7I2PGGNV2ADTqtpQ7LT8Cu0JgU22mEARiu
	3mJTzbvxZ+EryhPCewB9XsdlXhmWuNWVeXyLXA/MAT067Ce1nV1LeUGNorZOUqBu6cLetYH18vf
	F7J8eCHwO4bqY8qMhfeGdgu8HTBik/4MvYDIji/fNYDmVqnq6kCNPpDaL5kSOb+1XQHFm32H50g
	Jcy3J0Q8fsKFCxaYcYe4JCmtrq1DXZH8NNi6K81C2JnAvxDVTaQr10289Jji+ciCv7RYDpo8ehE
	2N/wSpBCFfc2BpJhmfWNjENtWDVxOLYEFSXLpYWR3Dx7D3JX0QuJjNaoZDPjXVYQy+kFEdDd89L
	AFBfXVPCZbW4n8SJYZ4qxhlMOr6mK5yQxnX2yGmYlQF3XY5LRgT/x2k+CIGzYCGuRUxzK76wDW1
	KHictrVSLWXVq4u/MizhbmJutcNEfCuRa8z5w7XscfjV/SuvMWrshzcaawdCWVAbixm89oDAv0b
	0RYdgcH9vfi6lPu/rM+QyMCCFhvWP+W5t7YSAXBDya35UBIqqpi9TjpYCjQkK9l6PCzbtZkPPxd
	sOz8lO22MYz9dbj3rYCMjNsBW3ZotMAhcjPs6FGi64ntBsJPwR1lIIK6FzgQcQ0RsQ28ECp3A/I
	YyY9XGQi6mNv8anUi3cVJ2fJ6oEAM94aMVkrzAGeR1+VYtqOhI/uYHH1PEUKnGU0Yn3Bsat4QNl
	Gcl1oj0/4I0bgCB279ViAqccK0krtscR213nkD/zL1iXwq72bSGnMEF427XWOAJJC/qxOFcnmP/
	U2RbgXm5cxtDMUrFzIRVpSsiMEgw8wrNCxrADDHeQ==
X-Received: by 2002:a05:600c:4f53:b0:4bb:68cc:7b94 with SMTP id 5b1f17b1804b1-4bb8616516cmr559444565e9.18.1795729481269;
        Thu, 26 Nov 2026 13:44:41 -0800 (PST)
Received: from jernej-laptop (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4abbd84e661sm40403963f8f.18.2026.11.26.13.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:44:40 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	jernej.skrabec@gmail.com,
	p.zabel@pengutronix.de,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 02/11] dt-bindings: display: Add H616 display engine compatibles
Date: Thu, 26 Nov 2026 22:44:24 +0100
Message-ID: <20261126214433.3562326-3-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126214433.3562326-1-jernej.skrabec@gmail.com>
References: <20261126214433.3562326-1-jernej.skrabec@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_214450_657244_FDA23709 
X-CRM114-Status: GOOD (  12.91  )
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

Allwinner H616 contains a display engine 3.3. It features two mixers and
four TCONs (2x LCD, 2x TV). Supported outputs are LCD, LVDS, HDMI and
CVBS.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 .../bus/allwinner,sun50i-a64-de2.yaml         | 20 ++++++++++-
 .../allwinner,sun4i-a10-display-engine.yaml   |  4 ++-
 .../display/allwinner,sun4i-a10-tcon.yaml     |  7 ++++
 .../display/allwinner,sun8i-a83t-dw-hdmi.yaml |  4 +++
 .../allwinner,sun8i-a83t-hdmi-phy.yaml        |  1 +
 .../display/allwinner,sun8i-r40-tcon-top.yaml | 33 +++++++++++++++++++
 6 files changed, 67 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml b/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
index 232252e8825e..18ec57448edd 100644
--- a/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
+++ b/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
@@ -26,6 +26,9 @@ properties:
       - items:
           - const: allwinner,sun50i-h6-de3
           - const: allwinner,sun50i-a64-de2
+      - items:
+          - const: allwinner,sun50i-h616-de33
+          - const: allwinner,sun50i-a64-de2
 
   reg:
     maxItems: 1
@@ -49,11 +52,26 @@ patternProperties:
     additionalProperties: true
     properties:
       reg:
-        maxItems: 1
+        minItems: 1
+        maxItems: 2
 
     required:
       - reg
 
+allOf:
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              const: allwinner,sun50i-h616-de33
+    then:
+      patternProperties:
+        "@[0-9a-f]+$":
+          properties:
+            reg:
+              maxItems: 1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-display-engine.yaml b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-display-engine.yaml
index e6088f379f70..6e26f184ab24 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-display-engine.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-display-engine.yaml
@@ -65,6 +65,7 @@ properties:
       - allwinner,sun20i-d1-display-engine
       - allwinner,sun50i-a64-display-engine
       - allwinner,sun50i-h6-display-engine
+      - allwinner,sun50i-h616-display-engine
 
   allwinner,pipelines:
     $ref: /schemas/types.yaml#/definitions/phandle-array
@@ -74,7 +75,7 @@ properties:
       maxItems: 1
     description: |
       Available display engine frontends (DE 1.0) or mixers (DE
-      2.0/3.0) available.
+      2.0/3.0/3.3) available.
 
 required:
   - compatible
@@ -96,6 +97,7 @@ if:
           - allwinner,sun9i-a80-display-engine
           - allwinner,sun20i-d1-display-engine
           - allwinner,sun50i-a64-display-engine
+          - allwinner,sun50i-h616-display-engine
 
 then:
   properties:
diff --git a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
index 05ed4ddcff3a..eb8d1fd9d8a3 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
@@ -36,6 +36,7 @@ properties:
       - const: allwinner,sun9i-a80-tcon-tv
       - const: allwinner,sun20i-d1-tcon-lcd
       - const: allwinner,sun20i-d1-tcon-tv
+      - const: allwinner,sun50i-h616-tcon-tv
 
       - items:
           - enum:
@@ -59,6 +60,11 @@ properties:
               - allwinner,sun50i-h6-tcon-tv
           - const: allwinner,sun8i-r40-tcon-tv
 
+      - items:
+          - enum:
+              - allwinner,sun50i-h616-tcon-lcd
+          - const: allwinner,sun8i-r40-tcon-lcd
+
   reg:
     maxItems: 1
 
@@ -256,6 +262,7 @@ allOf:
               - allwinner,sun8i-r40-tcon-tv
               - allwinner,sun9i-a80-tcon-tv
               - allwinner,sun20i-d1-tcon-tv
+              - allwinner,sun50i-h616-tcon-tv
 
     then:
       properties:
diff --git a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-dw-hdmi.yaml b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-dw-hdmi.yaml
index c43b02ec884f..44cc5c2beb04 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-dw-hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-dw-hdmi.yaml
@@ -28,6 +28,10 @@ properties:
       - const: allwinner,sun8i-a83t-dw-hdmi
       - const: allwinner,sun50i-h6-dw-hdmi
 
+      - items:
+          - const: allwinner,sun50i-h616-dw-hdmi
+          - const: allwinner,sun50i-h6-dw-hdmi
+
       - items:
           - enum:
               - allwinner,sun8i-h3-dw-hdmi
diff --git a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-hdmi-phy.yaml b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-hdmi-phy.yaml
index 1b47f3d99a78..fc88c5e2a3f6 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-hdmi-phy.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-hdmi-phy.yaml
@@ -21,6 +21,7 @@ properties:
       - allwinner,sun8i-r40-hdmi-phy
       - allwinner,sun50i-a64-hdmi-phy
       - allwinner,sun50i-h6-hdmi-phy
+      - allwinner,sun50i-h616-hdmi-phy
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/display/allwinner,sun8i-r40-tcon-top.yaml b/Documentation/devicetree/bindings/display/allwinner,sun8i-r40-tcon-top.yaml
index 7d849c4095a3..41324e1376ee 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun8i-r40-tcon-top.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun8i-r40-tcon-top.yaml
@@ -43,6 +43,7 @@ properties:
       - allwinner,sun8i-r40-tcon-top
       - allwinner,sun20i-d1-tcon-top
       - allwinner,sun50i-h6-tcon-top
+      - allwinner,sun50i-h616-tcon-top
 
   reg:
     maxItems: 1
@@ -201,6 +202,38 @@ allOf:
           items:
             - description: TCON TV0 output clock name
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: allwinner,sun50i-h616-tcon-top
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: The TCON TOP interface clock
+            - description: The TCON TOP TV0 clock
+            - description: The TCON TOP TVE0 clock
+            - description: The TCON TOP TV1 clock
+
+        clock-names:
+          items:
+            - const: bus
+            - const: tcon-tv0
+            - const: tve0
+            - const: tcon-tv1
+
+        clock-output-names:
+          items:
+            - description: TCON TV0 output clock name
+            - description: TCON TV1 output clock name
+
+        ports:
+          required:
+            - port@2
+            - port@3
+
 examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
-- 
2.43.0


