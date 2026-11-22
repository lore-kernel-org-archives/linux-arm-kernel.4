Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F06606A339
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 06:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0PMwhRp8;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IYJTNcHS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=G76uwmlV29WfUfEk6u6C04FgzxDoxsMbvwdZwFS9cwM=; b=0PMwhRp8aW0+Pf
	/GTgU4cE185vGES9Ly70NCLOecfG1SJ2dWjQ4F6QPUem/l3izV/wFo3ewoMKfhTb2pl1EABS5yZ5Q
	W0MiAFZQF5hmHAgYAjmkMOn/v/kEuJfKs0kHrFMn8Fo4WEvELNKh4Fsog11ZNnMYsHGx/0JR36N48
	IgDNU0YCjxfPywoGPKa6g2SS3PihlUN2y/n4YxxGtDFg/GIp0k+F5eFVMPriVHxGvoAeGBygIx+7P
	0Mww9TleNZ6yje7gW1CjK/u7N4qo7Q/mnh347MeaFmHROy1xRLEdd2y+LTnCeVJWqEeKx2BqxEXaJ
	1PB9N1V4v7yzdIOUMQrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV1WT-00000000nym-0ejj;
	Sun, 22 Nov 2026 06:58:01 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV1WP-00000000nyE-0Wk2
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 06:57:58 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2f03f3631b2so12409745ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Nov 2026 22:57:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795330676; x=1795935476; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G76uwmlV29WfUfEk6u6C04FgzxDoxsMbvwdZwFS9cwM=;
        b=IYJTNcHSu3018b6eYxrPSKUtLpVSVhlAmoJa23GDwBBXvmysvkvdFCSByRD3nJ6oIn
         kbyOif1JJgUiMEhV+FmDsILk6n3fmxOlYBCstPsoQdT6mLqL52jK/L3sdOR42eayjI7a
         /cuynp/jQfjrrPN1VZribMRN+b7Or4IDJl96pZhkY0+dPET0drEjW8zVWT+WeAxYnHx3
         8W5QafIgxhrSeGzqf4VHYDKF4DrZo/axakRtYqodBzIKFMJufnR7xdaPosCvSs3+nags
         WlLAPwuIuJ2/pjitZNKgbfEwoKwId9UN3KN1BzOm+XbPmbf75RNSGxhYIgERPFgxP48b
         pG4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795330676; x=1795935476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G76uwmlV29WfUfEk6u6C04FgzxDoxsMbvwdZwFS9cwM=;
        b=s67a/NjebejCYf9diObUqQhhzkI5XpIIaHbZ9xNnY0NzPD6q7SvOcVscNfUfV7CXYA
         kR59FcmML2jraeMaOXGLBIW1IOO82aDFQxm8hu/2R2khUDRCDvuDCO/Z8y9bIkBBCPcM
         Djvb49/aXmU6UhQHX3kdEicp6/20Hth9Mj+a45Yqh5tJpna3rWpUCOGBU4gnPv12GpbX
         Am5F/Ks8ttu/QcWz+qUqjHc0BQ42PxrwQfM7psM3yA9X9q7quL7RplvhzwrIu1WsY4C2
         4DyLaHBB0c4iJM3P/9k9LK7n1ZH6riqZnQXNmbnGq7yd36UeoAsFiKxs2DzXlx8slkc/
         /oTQ==
X-Forwarded-Encrypted: i=1; AL+hErHewTxIOYUBru8ufDnuKxQxM87E/95O528XghVWJm2GFSxTWiCwctgInAxJQAxXEhDo73N6PbT3PhjJ6k6dOedo@lists.infradead.org
X-Gm-Message-State: APuU4Z+iDEV9QWUWITQ1BEoSiq/PmuPEzh5UuRWtCzLMVPi0rZOYxwQt
	21G6Catcqn7zDZdwvs/n9CXdR4mzaR1UMl4AvACr18DMrk5GzSLIGiCa
X-Gm-Gg: AZFdTZc0M0OYCj3iSTtdTgd4W7W4gJgBkQQ7yw2fQ3+caqsRZ6/dSGmCbTpuSfY5XkT
	IhiQ8hdrareNkF2QWPFnT4cnwUTk1WLMaTKpm1q9eCAfy4DUDzFr++81P20dJvotC/20mXGZTYD
	8tzeXzLZrEWgkiEoGiFpHPqAoL8OHbTrHxqfhLE/q3lk1mcSSsKvoe/YcLo4MZDqHFzV6PNPuyc
	OCwULOxTXPt+BMl5asAXzI1yKnM9s/uoaS7XMJE1KVkErkZoYIZ40KODlf5WOsREGjCVNeirDE1
	Vj1P2dsEzOFBWKO8P399tN7jTWaQWQHM+aG6UMO3u91pPBnMq6FU39Zd0eYQYIFlJT85cZi8Am6
	+PHEXZARWsRwagVevCYC/Wn5mmW5NalBoFXr7zfC1RpeA5elQuVZH1kFT3ONXtPbEnwL2iVQt8b
	DFpkPv6bak6V9nMhgxFcZeyKj0BSsz4RXm8t6aup5cPCh/BIQ0iWgJoQmtL3WoGrSJIoblZPyh2
	MLkLkyCo7dNdLQqVK1UbVhU2J1M0fJXSrwEHEt7gXDdaZ6VGdov2qmYKtsl4br2V1q233f9G2Dr
	hH+qn5exE7DZ5O/Z6HSUl/mGwXe7+IT0gePyUz/5Xr/LFgkfHRje
X-Received: by 2002:a17:902:dacb:b0:2e9:95c0:7c50 with SMTP id d9443c01a7336-2f03f271e00mr75498935ad.71.1795330676087;
        Sat, 21 Nov 2026 22:57:56 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac5:6213:28::4:379])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f120016sm34287345ad.58.2026.11.21.22.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 22:57:55 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: linux-watchdog@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wei Xu <xuwei5@hisilicon.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/4] dt-bindings: watchdog: Add HiSilicon STB watchdog binding
Date: Sun, 22 Nov 2026 14:55:20 +0800
Message-ID: <20261122065549.3265519-2-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122065549.3265519-1-mmyangfl@gmail.com>
References: <20261122065549.3265519-1-mmyangfl@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_225757_172916_19A4E54D 
X-CRM114-Status: GOOD (  14.01  )
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

Add Device Tree binding schema for the watchdog controller found on
HiSilicon STB SoCs.

While sharing the register layout of ARM PrimeCell SP805, this block
does not implement PrimeCell ID registers and has non-standard reload
and lock semantics, requiring a dedicated platform driver binding.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 .../watchdog/hisilicon,histb-wdt.yaml         | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/hisilicon,histb-wdt.yaml

diff --git a/Documentation/devicetree/bindings/watchdog/hisilicon,histb-wdt.yaml b/Documentation/devicetree/bindings/watchdog/hisilicon,histb-wdt.yaml
new file mode 100644
index 000000000000..c0a8ccdb482a
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/hisilicon,histb-wdt.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/hisilicon,histb-wdt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: HiSilicon STB SoC Watchdog
+
+maintainers:
+  - David Yang <mmyangfl@gmail.com>
+
+description:
+  HiSilicon STB SoCs (Hi3716, Hi3798, Hi3798, etc) integrate a watchdog device,
+  which triggers an interrupt after a configurable time period. If that
+  interrupt has not been serviced when the next interrupt would be triggered,
+  the reset signal is asserted.
+
+allOf:
+  - $ref: watchdog.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - hisilicon,hi3798cv200-wdt
+      - const: hisilicon,histb-wdt
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-frequency: true
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    watchdog@8a2c000 {
+        compatible = "hisilicon,hi3798cv200-wdt", "hisilicon,histb-wdt";
+        reg = <0x8a2c000 0x1000>;
+        interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&crg 0>;
+    };
-- 
2.53.0


