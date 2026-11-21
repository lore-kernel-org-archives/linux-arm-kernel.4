Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3647606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 07:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=R6XwOGeG;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=BChlDjPI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Date:Subject:Cc:To:From:Message-ID:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=IFNwACmidFToCCNfb4iFqu5ciyIQ6dqGvleob7ligsI=; b=R6XwOGeGOoDpZi
	Y652vvFJzK49ARlUeCo/b6vRm/GWUpi5DtETV6aBeex3KEhO/ANETeY2PlQ5Q1/caFA6j6JkOrL1+
	hM+DFFCWvlRjGXZYC5PJHRV4sbtHrewSk4xuQY+XPAswmCWBSwRTyVNcw1lYHN67ELuOS6sV1wdQI
	OCvFP1UNjE3AgItvZ2D7FXmOtNor7736MUSLGUTku67IALX7mw5sFsFLPQR0ZhutODVmBTPcaU+qH
	KKvNKM0J/mjnq93LM2f1Fyxk5BGzUqklvBC0OAyPJUj9f4bTEvM77RIW7o7Spry0TOwse7XGqYV67
	PLbg03GEgghyDJTzzyDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUfpX-0000000GtPV-3vi6;
	Sat, 21 Nov 2026 07:48:15 +0000
Received: from out203-205-221-202.mail.qq.com ([203.205.221.202])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUfpM-0000000GtKl-468a;
	Sat, 21 Nov 2026 07:48:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1795247280; bh=IFNwACmidFToCCNfb4iFqu5ciyIQ6dqGvleob7ligsI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BChlDjPICHvQ7eX+vhw742v3dwnqhTvARFG8hLTEIYm0oe9A+3oDRVfvbxB7Uebbw
	 4YldIZ4x3RGar2oWelfsY5m4u1fER/iEn2JwIEVuA6u31cJqijxNRzpiGS95r75fQz
	 9tMWzBx9SDY1qy4J+1CghBZlVB1VyvXL81KeIdL0=
Received: from jerry-PC.lan ([2408:8249:5f:7101:71a:8713:56b4:5043])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id BF71E40F; Sat, 21 Nov 2026 15:47:55 +0800
X-QQ-mid: xmsmtpt1795247276tfzuxhlqb
Message-ID: <tencent_1A5C41E9DE4754C0A639FE4A64B1B23AC305@qq.com>
X-QQ-XMAILINFO: Npv5yIQT4nxMRdjQGHBeq7pCwcd+N+ut+TRiHESwHMHR/AwGJruwixJZN6B1hQ
	 HsYmbIkFeXJkbH+ZBRWJz5CIqGFjPMKa7ToIALun3QXaDQqxhi8pCTzI1KppAz/DuVb064gXeU5u
	 W25Z5AardHizFC4ky5XICCBysV1gVO2gdSrYSQJVfR8QDWL1ihKwjMXei/u9N6SS5Iy+bcAWTi6D
	 uZYJMbjkc553ODhbMV/SZYE1VrugUXbF2YsjuRKGqsmIm2E9pHFIrSyNPHYgIxWV6o+dAiU3tf5P
	 o8B3bK62rSBryKY+tnpy+ke4K9sXb/b6DcTpPXsMnT+7bvlOLBJoMa4dLr3HNcxqTCY5Te4bPfjY
	 jHsWr3ciBmTWBuRS+xg80O4urq8gtwCS1L0IxA+W6KFHNjkPygc6cMBrXha8dFdalDukjsaBmnUY
	 FFewkPAB8y/q+5F65I9pA8dMsGP1e+5pVqjfKOqIZ1/NgMKVRKfFIRYn5/FItIs4wa8XkV4KIt94
	 ZABj8XyJR03yUnaaF8Cdj9AJRkjn6VWin74ratKY1DWuE54p1+Dsb2drl4S5s5/aj+pMkQb9XOKO
	 A+qGGI/Bf97P9TIrS0MrK4zJz9wG0Yu+JVTSgotAAahUzk9HYQ251Aq9w84az8vri7Q1F98FpbZC
	 S5hK3WN9E7yzOltWk+0We5r+8uYoASui1gTKfHkJwlI7hjaNZwEjoybjfErT7f4mFBQuddSjn8cT
	 uvEZxBBDBmp3R4YjFbkXtemEZoYdoUMlO6iXTPt6Ds8JZD3i7ijTQRocj/PkbUh7rW39MZ0BZZ+c
	 WtB0hW3gebJWuqKBFs9RFuOiEgu8GP6mS987IvjlRHOvGPxilU5PTVYa6pdFqq7boBaSULPSW+8A
	 aOSzgWXjiXJ9NyymmWt/TbQGprYyfiOc1IfKxsTo4aelY1aIKUguC5NPUpNWQIUqB+lQfpeV5lRz
	 Yvk2XRFSZIepR+aDe7PuB4ALYCStGkOadzRS8l7X2dwQjQHOioENoFjc1h8iDZAEjnVy4eqN4QgG
	 WSAPL4SCEvWhgeEg4wnB6nFaV+Fq7LPMa9WtF7EG5/DzSrcVco3EEjJwh5vpqjnsKJ6TdImNgNvH
	 PEF1gppF0UAmlwUpB9xI8lSY2nmeHF1tSfXkzk
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
From: ZhuXiangyu <1194781887@qq.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ZhuXiangyu <1194781887@qq.com>
Subject: [PATCH 2/2] dt-bindings: phy: rockchip: add RK3506 USB2 PHY
Date: Sat, 21 Nov 2026 15:47:53 +0800
X-OQ-MSGID: <20261121074753.1262819-2-1194781887@qq.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261121074753.1262819-1-1194781887@qq.com>
References: <20261121074753.1262819-1-1194781887@qq.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_234805_613908_C61DDCDD 
X-CRM114-Status: UNSURE (   7.28  )
X-CRM114-Notice: Please train this message.
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

Document the RK3506 USB2 PHY, which uses the phyclk and apb_pclk
clocks and requires the PMU GRF phandle.

Signed-off-by: ZhuXiangyu <1194781887@qq.com>
---
 .../bindings/phy/rockchip,inno-usb2phy.yaml     | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml b/Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml
index f50fc69f..956a82cc 100644
--- a/Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml
+++ b/Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml
@@ -20,6 +20,7 @@ properties:
       - rockchip,rk3328-usb2phy
       - rockchip,rk3366-usb2phy
       - rockchip,rk3399-usb2phy
+      - rockchip,rk3506-usb2phy
       - rockchip,rk3528-usb2phy
       - rockchip,rk3562-usb2phy
       - rockchip,rk3568-usb2phy
@@ -47,6 +48,9 @@ properties:
       - items:
           - const: phyclk
           - const: pclk
+      - items:
+          - const: phyclk
+          - const: apb_pclk
       - items:
           - const: phyclk
           - const: aclk
@@ -158,6 +162,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - rockchip,rk3506-usb2phy
               - rockchip,rk3528-usb2phy
               - rockchip,rk3568-usb2phy
               - rockchip,rv1108-usb2phy
@@ -240,6 +245,18 @@ allOf:
         clock-names:
           minItems: 2
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: rockchip,rk3506-usb2phy
+    then:
+      properties:
+        clocks:
+          minItems: 2
+        clock-names:
+          minItems: 2
+
   - if:
       properties:
         compatible:
-- 
2.47.3


