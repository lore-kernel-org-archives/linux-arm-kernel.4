Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6FE5606A337
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 06:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YA7utOXu;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=WQSqMnwi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Date:Subject:Cc:To:From:Message-ID:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vrWn0Ixp2M1jrHpRUCkv+bLIfyIujqapxXCKCxU/7AE=; b=YA7utOXuNO+2g6
	/FnZ6evGFiuIuObGZRsOnsbaNwwg2PMgecQqHxsSvHqhQpIcl+tMMPXbOMcovSoOvjli0EdXCky1D
	vWa5eAS53zncHgRbzNCDpfojqJjVTOwx+1D1i7sYSFvuL0MEkb6SoeEoxi2Iqs03wG3q/n2HNbR0d
	EeOTRQar6BnZHyjfq1AKnncdZOSk0VIeXp93+WXv0D01RJRSh271pfnT546YMSiHoET18p1U9spkq
	QDeJ4uANrJK7HjYaEI+4/vMZrtVEl62n9+ghjl889rh3qiAWjSmEpKCiOQQ+KSzSfrVcYHAVal11u
	OK55C3VfdEeHDP5v/AAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUefU-0000000Gnug-0ILf;
	Sat, 21 Nov 2026 06:33:48 +0000
Received: from out203-205-221-231.mail.qq.com ([203.205.221.231])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUefR-0000000Gnt8-0Qw3
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 06:33:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1795242820; bh=vrWn0Ixp2M1jrHpRUCkv+bLIfyIujqapxXCKCxU/7AE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WQSqMnwiam/ueGtzWs3rSyy5JGCtzGCbTL2peHaLgFNwoG1+rmCbS04luCp+xT7U8
	 Y+LpbEB6eWBPqSPXfq0pFBHWHat0wyNJtyrMXb8Z8tIPjME9OcqNUjkL0CxBCVAuJp
	 UaB+gbItilDWzYirrXi+70JpQU9N/WZheMO3RHCc=
Received: from jerry-PC.lan ([2408:8249:5f:7101:71a:8713:56b4:5043])
	by newxmesmtplogicsvrsza53-0.qq.com (NewEsmtp) with SMTP
	id 86136C4F; Sat, 21 Nov 2026 14:33:33 +0800
X-QQ-mid: xmsmtpt1795242815t7b4l3f5q
Message-ID: <tencent_362D76566799132999F95C09AC34775D0D0A@qq.com>
X-QQ-XMAILINFO: Mb8jOXBTO9mFtvXd4x42BWdNJrJAhWsAQ4eNSsIFjy94jB3IpWBPVnsOUyULK3
	 Y9l6y3PnpRvdHjyuKGo5oQNzTvOGxC0zdJ1kxLM8DrxohF+DndfSO0PG/phjqkkzakieirK/+pmH
	 Cr+gi9qNtGxkxHMEcSDlUvMx8w8TE0ryP6Y4wlZyrmqin1Lg5b7dCrToDzS3gUxfoT11GFxlveTQ
	 fQzya8V3pKdolnFI1f+1SFdMF4101oEvjs5FhkeYu149PyhUKhQRpJr4LA2bVBIUNDoJ1r+aP0EY
	 m+bkZS3g3tXqpmzwmh+PeQ927jv38fKchWzIEVB0tAM5+4gVB/kUbgTchdtt5x+NFSkIvq/t67BM
	 cbSnSfZIQ6us+PZGkGsoUL6BH8jFXpq9Axrmc9LiGyr7PMmwg82O4LAQlHEczTL+cRZngAhWmanS
	 2yqp3TO5nZ7V/UFTe7yOSgtypkGWX6R+NDlEUKRfl8rPhKAe3xJIHA75F6DIlhx/Fcct/PEEF1RB
	 9MErmFeYi9SEQ/vEVkVtRl9Hs8kLsIBfvG9Asv6WtAu/KBA1yv/zNCzYs8jdfcmsH/5F/LHgzo5V
	 /PTxl9IFmORTonfG+cOcwN+RLXcC/POHTQV5c2mtiZ2LhQXoPn4tueV3Unv55glPkpgte1X1wNl/
	 SlOx3+afQcy8e7BtSld5gVlWK0WSMgTgaXq0FWs+FzkIzjkbDzDuvh37WYAL/0bt0+LYFKSYo6Gb
	 EM89vpGfkkCrqTI1hUUi/h3eFwNJY80j+fyzGxpcEsVCapUmTrMyMeX4JrdBHWBP0NrpHbDLKBD+
	 udShGJ8S4SBfWr+JL3OnQ0WVKeO4q+ScnPMp8LlJO3nhl1IvuXO14ItC0Aq9KkqT+HO7p8i6Kg/D
	 pvyKfkbsGzcoeNgix3gid9DffsMfR/wSNo5/Bv04bCNqFF5dk0qguIZUma+AB4rd/aV5r4OdapjA
	 1+UhqcMGu5G6yMEpwqgCnPi2Y1bQfg/h7oojbhbe4b/tfVIyHyZVRsxC2CSGZYBfA5KeOFVCFd1b
	 NiEPKEHkCZfUmbAKZCcmmaUpLim7Frl9v52xhNacYLQLUZiiADEI8hlu1+Xcf3BCLNNF2azWywFI
	 ShUVyul4mKG1UbMeWW1gcEVcckRTvJD1yaLr2a3k1E27e4PJIUFJl1ZosVcMG6TvPifleYAZyCFx
	 UgL8q5G4TsRzFVE76Uzey+ZSvf
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
From: ZhuXiangyu <1194781887@qq.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ZhuXiangyu <1194781887@qq.com>
Subject: [PATCH 2/2] dt-bindings: thermal: rockchip: add RK3506 TSADC
Date: Sat, 21 Nov 2026 14:33:30 +0800
X-OQ-MSGID: <20261121063330.1094548-2-1194781887@qq.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261121063330.1094548-1-1194781887@qq.com>
References: <20261121063330.1094548-1-1194781887@qq.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_223345_563779_E3278060 
X-CRM114-Status: GOOD (  10.01  )
X-Spam-Score: -1.9 (-)
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

Document the RK3506 TSADC, which uses the TSADCV13 register layout
and requires the TSEN clock in addition to the controller and APB
clocks. Like the other newer Rockchip TSADCs it needs the GRF to
enable the sensor analog front-end.

Signed-off-by: ZhuXiangyu <1194781887@qq.com>
---
 .../bindings/thermal/rockchip-thermal.yaml    | 23 ++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/thermal/rockchip-thermal.yaml b/Documentation/devicetree/bindings/thermal/rockchip-thermal.yaml
index 9fa5c4c4..f7fa4b60 100644
--- a/Documentation/devicetree/bindings/thermal/rockchip-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/rockchip-thermal.yaml
@@ -20,6 +20,7 @@ properties:
       - rockchip,rk3328-tsadc
       - rockchip,rk3368-tsadc
       - rockchip,rk3399-tsadc
+      - rockchip,rk3506-tsadc
       - rockchip,rk3568-tsadc
       - rockchip,rk3576-tsadc
       - rockchip,rk3588-tsadc
@@ -33,12 +34,14 @@ properties:
 
   clocks:
     minItems: 2
-    maxItems: 2
+    maxItems: 3
 
   clock-names:
+    minItems: 2
     items:
       - const: tsadc
       - const: apb_pclk
+      - const: tsen
 
   nvmem-cells:
     items:
@@ -127,6 +130,7 @@ allOf:
               - rockchip,px30-tsadc
               - rockchip,rk3366-tsadc
               - rockchip,rk3399-tsadc
+              - rockchip,rk3506-tsadc
               - rockchip,rk3568-tsadc
     then:
       required:
@@ -155,6 +159,23 @@ allOf:
     then:
       patternProperties:
         "@[0-9a-f]+$": false
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: rockchip,rk3506-tsadc
+    then:
+      properties:
+        clocks:
+          minItems: 3
+        clock-names:
+          minItems: 3
+    else:
+      properties:
+        clocks:
+          maxItems: 2
+        clock-names:
+          maxItems: 2
 
 unevaluatedProperties: false
 
-- 
2.47.3


