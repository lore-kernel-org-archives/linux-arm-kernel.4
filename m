Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF43606A334
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 07:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BpycJN52;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=zPl8okH/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Date:Subject:Cc:To:From:Message-ID:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Koju0qPt9fKMm+7kXLbrbiJyDSbVhbvXFb4WSB8Qbzo=; b=BpycJN529KqSUN
	743Zp7Zv6yyFv34l2XK+m4o5kjBjEBsB3pzqXFfmIcw3puRbmrth3hZX5PbP8GjbI7vzdQth5PlDf
	sjWeQAea5gBlONp42EbuGfzPKh8L/exNixKb97+rQ0jOUNWJRGB2C9L1J0C7muRnGrlSZVeaK3Wau
	7auEF3xqnAw0tFEXxaKuoHbymrlzu4bMl5zGhMKf/Pu5HHPKrnRIi4mqry/QEeO7h1qqVGUMuDB3J
	yrSPefe2SgdZI/ckPerfZD16sj9J5XVNQw0KOpUDFPZuh3/Meur7wchgBqRC9l5bPRjCs7Qdc0T5N
	6DL4Bp43Hx8Jo92E6eqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUf4o-0000000Gozl-1IWn;
	Sat, 21 Nov 2026 06:59:58 +0000
Received: from out162-62-57-49.mail.qq.com ([162.62.57.49])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUf4h-0000000Govl-1k3p;
	Sat, 21 Nov 2026 06:59:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1795244385; bh=Koju0qPt9fKMm+7kXLbrbiJyDSbVhbvXFb4WSB8Qbzo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=zPl8okH/oAVkc9qMRpg/okJocQnd6ocQI4OosZTK18lAkPAKyKfMzY1ciUIffKDjo
	 AuEmcbnP/gtbPcsDgwiseBotmaXGEDj2Lq3tYTlXdX16W69KSbo4/yLjZJiuni4zdA
	 IkE6DKYq72uRmMqLhtL/jtcbUTyduBDy4itpO2vU=
Received: from jerry-PC.lan ([2408:8249:5f:7101:71a:8713:56b4:5043])
	by newxmesmtplogicsvrszc56-0.qq.com (NewEsmtp) with SMTP
	id EE72042D; Sat, 21 Nov 2026 14:59:39 +0800
X-QQ-mid: xmsmtpt1795244380txnqd759c
Message-ID: <tencent_85AFCE164FAAD1CCAB95DC7CD804CA9BB309@qq.com>
X-QQ-XMAILINFO: NnYhxYSyuBnLgVnKCHPq4TJRX9EGGXwmMozjcwxP0/j/7DG/gqsvD5K21JBK3a
	 pap9y5kXKDQy7seYcvGsFgUJKk1DxkZSglfl/2+pgNil0T/IFcer25XcOKmyZqghmJr2VlVbUWSj
	 hzVqxCgInKWKB+KYqhfqJ1ExYVIQeQBUkmXBTrtSuTH2BuRyu0ERshoQW44ZvOUrR8eqlnSQk6dE
	 YNBC8+mWoaJJF7Wux/M5pAigMZEM2CcRpJrCZON5F8bXaqWwCyXrwN2sE3ynEqBYI21kGgf7qoRP
	 87qO5F+Ya5lGSfy9HhWyScgfgB7ZQxenWjB0BkHjR4hgUVjVaprLTyG8dp8nDEYxfXQcPSowl7iZ
	 VHy0V3HBxe45q/sp7i2mnA/3K4fdBCmICirzEdDLddhC6a7oiJT8RGX1WYKsw4de59IO70OzN3JF
	 EsSv+CvUT/0rlm7FBXJGbAXnQaAucUR82VgR5Aw6HNXHEsUgA0nI4oemzwmmA33vJ8OuVr3zX3XG
	 xHeMhkERAYno020BnWbyCm6/O6lvZ7sVD/Ah3cVvitSJCtUafnmVWeZmCY1SUecmiAyHeZBhEW53
	 RLGZCtRoSquZG+ysxORMus63SNP40vxdFhSTYWCJZ3RRGaK7lS5ZiELd2dP/Zzt0fEJaxoz849gM
	 aJ26Fvvkbr6+OBdbNzplLVzaZp9o/tJ1z+h5C5dEtwPZQI7i6pupHjmNV3vsFBeZUzfZMs7kPjtZ
	 TvGngM4SRn7hwZViRi+GPi/GrY1A9XhqyQj6euPULV09ioOhVzhKNEPBMAaO/j+pvspqk6CSrJ2q
	 a3GgLxwA7E9on6IoWMCzhvdHVVKpMaAGyoUx+a+mHaU9/e0u/s9Lk3je3ppNXJV14fpiGj5oVDCg
	 Pc18T294Go0wmNlDyx9Oum7zdtCX7iJOyHyOlvGVwezz+0VEhsIKRn12ordIQLiT9gLOzXV+WuC2
	 ZK/P/DrfgeXUD66cp2B6BDRf5rjsyBOnIvhONy0bUSirI+8QwliYS+pEa2dCz5jkGyc1D5Oh5vVB
	 oaqukonOep/jm0blWOxo8SJVlAZRN2HIjUVkP1aTiwmUUmpoFxZfdrcGAb+7UzFwwgdnSHybvFjd
	 qPgeaHy1OXx4EUROf9lHpUq0TYVQ==
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
From: ZhuXiangyu <1194781887@qq.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-pwm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	ZhuXiangyu <1194781887@qq.com>
Subject: [PATCH 2/2] dt-bindings: pwm: rockchip: add RK3506 and RK3576 PWM
Date: Sat, 21 Nov 2026 14:59:36 +0800
X-OQ-MSGID: <20261121065936.1125919-2-1194781887@qq.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261121065936.1125919-1-1194781887@qq.com>
References: <20261121065936.1125919-1-1194781887@qq.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_225951_997782_AE530ABC 
X-CRM114-Status: UNSURE (   9.56  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.8 (-)
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
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Document the PWM v4 controllers found on RK3506 and RK3576. They use
the pwm/pclk clocks and may additionally provide the osc and rc
clocks used by the extended features.

Signed-off-by: ZhuXiangyu <1194781887@qq.com>
---
 .../devicetree/bindings/pwm/pwm-rockchip.yaml | 54 +++++++++++++++----
 1 file changed, 45 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/pwm/pwm-rockchip.yaml b/Documentation/devicetree/bindings/pwm/pwm-rockchip.yaml
index c8cdfb72..ea6622d9 100644
--- a/Documentation/devicetree/bindings/pwm/pwm-rockchip.yaml
+++ b/Documentation/devicetree/bindings/pwm/pwm-rockchip.yaml
@@ -15,6 +15,8 @@ properties:
       - const: rockchip,rk2928-pwm
       - const: rockchip,rk3288-pwm
       - const: rockchip,rk3328-pwm
+      - const: rockchip,rk3506-pwm
+      - const: rockchip,rk3576-pwm
       - const: rockchip,vop-pwm
       - items:
           - const: rockchip,rk3036-pwm
@@ -42,10 +44,16 @@ properties:
 
   clocks:
     minItems: 1
-    maxItems: 2
+    maxItems: 4
 
   clock-names:
-    maxItems: 2
+    minItems: 1
+    maxItems: 4
+    items:
+      - const: pwm
+      - const: pclk
+      - const: osc
+      - const: rc
 
   "#pwm-cells":
     enum: [2, 3]
@@ -66,25 +74,50 @@ allOf:
           contains:
             enum:
               - rockchip,rk3328-pwm
+              - rockchip,rk3506-pwm
+              - rockchip,rk3576-pwm
               - rockchip,rv1108-pwm
 
     then:
       properties:
         clocks:
-          items:
-            - description: Used to derive the functional clock for the device.
-            - description: Used as the APB bus clock.
+          minItems: 2
 
         clock-names:
-          items:
-            - const: pwm
-            - const: pclk
+          minItems: 2
 
       required:
         - clocks
         - clock-names
 
-    else:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - rockchip,rk3328-pwm
+              - rockchip,rv1108-pwm
+
+    then:
+      properties:
+        clocks:
+          maxItems: 2
+
+        clock-names:
+          maxItems: 2
+
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - rockchip,rk3328-pwm
+                - rockchip,rk3506-pwm
+                - rockchip,rk3576-pwm
+                - rockchip,rv1108-pwm
+
+    then:
       properties:
         clocks:
           maxItems: 1
@@ -92,6 +125,9 @@ allOf:
             Used both to derive the functional clock
             for the device and as the bus clock.
 
+        clock-names:
+          maxItems: 1
+
       required:
         - clocks
 
-- 
2.47.3


