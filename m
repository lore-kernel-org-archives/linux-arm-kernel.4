Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C55B606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 06:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=J+oJ0PJ7;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jl4LC/WM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=CQu/v9VbPVOFvypxy+vSIVqVZUuLUc8YlsM7QgQ5RmA=; b=J+oJ0PJ78X74BR
	thLn/7ZK5KYqYUsTLcn2P1g6IidWxigAFnDRBpp5IN0w+txmSVYoypgiFsq42JmBN5sFodtX/pyWu
	c1IW1GuQHW8sOfvlFJ2cq3w+s+eV69kdbtEfTtMSZU5BqMtcXNu6zpxiBsEbY7uWaTcYqgwenCC0R
	MKulkcaLHihIc8Gdt8rAhLMiwTRhMTYrrPC/2vdYZASptm31Luej/oVnjvSlGBrWwFd6/74Ro+do9
	znFZ5vx1hh28znbeGo8mdTonOG/deB/UXH8rp6cgbQDJ1jhQBBzzN6Y7s3S0xAzcmSgDwkfK2R+K0
	AYOWf1HMFY7rNXPnQVmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVNuS-00000002Oo3-3e7b;
	Mon, 23 Nov 2026 06:52:21 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVNtE-00000002Ogf-33NT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 06:51:04 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2f01f296937so22850225ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 22:51:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795416660; x=1796021460; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CQu/v9VbPVOFvypxy+vSIVqVZUuLUc8YlsM7QgQ5RmA=;
        b=jl4LC/WMyfPaNwBQjk1jgJKgKWkm9CJl2eKh2GSoUzk4FsLeWH6L13ZBk1cyoOZxnl
         sVbvX2s/74iHyCmFCLRlvW6MaBhjrNN9p4bWwOEGfdYlW8j8yhQ750jOoXwESa2DG9aA
         oYV0G+Oq4sgz7LCFwgvkrBCiPtLwFH22s0YXoPuq2M4j0QvLLsAwMYmlR9dMpk5FnBts
         V+9hyoxA1mpLWe1eSKsxI5OylbRnlsIpM5nbq3Rk9SpHOfgXzy6ZGHPJaKqkvKBVOqff
         lxpvNBW+M/HcQH8PX6AmIjZtgu9WMuaI8TGzJDWnfmyPTefbZFTH2FaE2Hp/2mIEO0OF
         apxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795416660; x=1796021460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CQu/v9VbPVOFvypxy+vSIVqVZUuLUc8YlsM7QgQ5RmA=;
        b=yWfbLnuSeFfJMs45KK1uRtj92qQlpoPVTtNeBD9bnYRJhje/bcxEdVO6P6I4yKkw0R
         4qqv3ewX4kiD1K1O0Nzi4iN8ccNUxtVAnqunny97LVSb91+/YWkHGn31XG40KInniRCO
         yBfGiLbJrypSqaIu0pHcpb/LcoUu83D9zNDVqpjWc7jCt/0zOvJ1dPvyqR/LDxp6cniB
         BSuVE0CtofZylvhEydc/xOiT7RogenQblWmvHfkVzHkdjNK5gsfz9x9V11QejbtF247a
         fbitXBxAQdJFs2W9M3yKIg76iH3bx+Fu5FTkaAlxjC7A4z8IHqIJy+qctcs7wylwzmsb
         NZrg==
X-Gm-Message-State: APuU4Z/xBDpVvvwA8Ym0A4Y9g8aGrwQYgBqnMOEEVPELJRiZ6J+TCGBS
	QRP3LAktGrjiHEhqKv4/C54yDKkI/LHwMhKGtrYGcIGYlv9A1nDlzBce
X-Gm-Gg: AZFdTZdN/YST7cqsD/mIpAKoUZsY/+9OM6s5ypXLWtahnRlAu8XlY1OnH6am+gMiUt7
	xn6WSkUGFS1uoFxrAF7FVx2Jj058jIpFpTQtFDdNa5+suH3V7x3EcPZjb0m8S1SaWHuZGWqYn5V
	4U9a/YYxkn39VysZ+p4zyaNp5yzHXrr9PZiqn4IO6ksVgJkijNY5mOzfdfCBDupyfAYU/C6ZYEb
	Rcwa27v1RTwgjx3d/mvkLs91jvLQju0yV+KgJpzMzmY3+5fyrCFD+k8N++KnV7z1gSQiue3rPG0
	Ex9viJ+zE1KlVNPc0P04mhlR2QB7tyJr/LVyd4jCVcaQwy+LuP0XZn1ebmWn++Iqf3gu/TDkbZi
	soYUctsVY9eZ9nzD4pJxCMykm/AhHTr+FrqGg/JnOO3P41GCFFLEhXJOhcAZuD4FgZw7bCMVwvD
	8ZY8hm25WcUx6T4eGWuO72fYYoB7KNFhLD1uJ9RyYyl/sQkJp9qd/NBresNqJBMHNNEHsPzaa4R
	CfhrwvN1TV3f6b8JflPANJ6O2Yo8j/FOX35h075pg5F6GXIbc45cC6Opg/Thk4G0v99ZBik9Vgg
	Tfy46RTHD/B03WrrFoRrw71Z16GEfgLEj3bs4BCHXNRZ8ZOUc7Z+vV23Rsw4WABZmEgcT1zFD7/
	6she/fJ7iRQEhpno=
X-Received: by 2002:a17:90b:2ec4:b0:3b4:1934:721a with SMTP id 98e67ed59e1d1-3b41c9613b0mr10185031a91.60.1795416659799;
        Sun, 22 Nov 2026 22:50:59 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b48b41928esm5224811a91.9.2026.11.22.22.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 22:50:59 -0800 (PST)
From: Chi-Wen Weng <cwweng.linux@gmail.com>
To: ukleinek@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cwweng@nuvoton.com,
	cwweng.linux@gmail.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v7 1/2] dt-bindings: pwm: Add Nuvoton MA35D1 PWM controller
Date: Mon, 23 Nov 2026 14:50:05 +0800
Message-Id: <20261123065006.28768-2-cwweng.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261123065006.28768-1-cwweng.linux@gmail.com>
References: <20261123065006.28768-1-cwweng.linux@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_225101_184264_0E126BF0 
X-CRM114-Status: GOOD (  13.27  )
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

From: Chi-Wen Weng <cwweng@nuvoton.com>

Add device tree binding for the Nuvoton MA35D1 PWM controller.

The MA35D1 PWM controller provides 6 PWM channels and uses one register
region and one functional clock. The binding uses the standard PWM binding
with three PWM cells.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Chi-Wen Weng <cwweng@nuvoton.com>
---
 .../bindings/pwm/nuvoton,ma35d1-pwm.yaml      | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/nuvoton,ma35d1-pwm.yaml

diff --git a/Documentation/devicetree/bindings/pwm/nuvoton,ma35d1-pwm.yaml b/Documentation/devicetree/bindings/pwm/nuvoton,ma35d1-pwm.yaml
new file mode 100644
index 000000000000..47a59bdd14d0
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/nuvoton,ma35d1-pwm.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pwm/nuvoton,ma35d1-pwm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton MA35D1 PWM controller
+
+maintainers:
+  - Chi-Wen Weng <cwweng@nuvoton.com>
+
+allOf:
+  - $ref: pwm.yaml#
+
+properties:
+  compatible:
+    enum:
+      - nuvoton,ma35d1-pwm
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  "#pwm-cells":
+    const: 3
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
+
+    pwm@40580000 {
+      compatible = "nuvoton,ma35d1-pwm";
+      reg = <0x40580000 0x400>;
+      clocks = <&clk EPWM0_GATE>;
+      #pwm-cells = <3>;
+    };
-- 
2.25.1


