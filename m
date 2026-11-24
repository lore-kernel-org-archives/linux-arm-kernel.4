Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE6E606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 08:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lHSiZJkg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=hqRSb0ylNLV6vD4z5XoIrPEgClP+9sq7dQZHqPqG42s=; b=lHSiZJkgYMNaLIlThLch1fBX+r
	4vK6Ryxu4YfrGrO3oiOi7F3nX+VB7/6heX2nVcU9MU3Ofnm8hJrfIJCGmZ0vPsPMAxh2uWYlwMwXD
	FR/9ed5ukKVquuVd3D2DZAcjasR+mBO41UN5NqWSpckuR0Jj7Yzmv/BIXYdxIdMCjIuyLsMxg36W1
	wivlbca5ZRy2XuRedIBmN4t83/ZJBpvGpZqKQXX3duj0TpmDWq8G+pf+fJ+mhP/l3HEPUGY109JSM
	2yNoNwl7lPaMQpO5XOEoCuWOoq0qIwl73CyNgT+IhcXQP/09k767y8RLM+IBk6QEXWiNu0op6d2WI
	7mTgiwLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVljQ-00000005rew-0crt;
	Tue, 24 Nov 2026 08:18:28 +0000
Received: from inva021.nxp.com ([92.121.34.21])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVljN-00000005reS-3YjR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 08:18:27 +0000
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 5140320002A;
	Tue, 24 Nov 2026 09:18:21 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 1C83E200006;
	Tue, 24 Nov 2026 09:18:21 +0100 (CET)
Received: from lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com (lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com [10.52.9.99])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 410751800088;
	Tue, 24 Nov 2026 16:18:19 +0800 (+08)
From: Joseph Guo <qijian.guo@nxp.com>
Date: Tue, 24 Nov 2026 17:18:17 +0900
Subject: [PATCH] arm64: dts: imx8mp-frdm: Remove unused realtek properties
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-8mp_realtek-v1-1-3da734007eff@nxp.com>
X-B4-Tracking: v=1; b=H4sIAEhIBWsC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQyMTXYvcgvii1MScktRs3TRjc9PkVLPURMukVCWgjoKi1LTMCrBp0bG
 1tQC3X75iXQAAAA==
X-Change-ID: 20261124-8mp_realtek-f375ce6ea9be
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Fabian Pfitzner <f.pfitzner@pengutronix.de>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Joseph Guo <qijian.guo@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795508299; l=1058;
 i=qijian.guo@nxp.com; s=20250519; h=from:subject:message-id;
 bh=rgm1aRFFWQrRE+f1gbnVp8iVbSLtNQiOlcAcqDGTNSo=;
 b=huXENi4J/NRcZn+qh5ZNfDIYqfwdL1TrFbkTbT7+Enlszgg2W075eII+8gJVXzB8nAH2isvE9
 GBfijoG8qgBA3hAP6xdbst13yNT/N45SI9Ejc81GNSpKYsXw9LE/4Tq
X-Developer-Key: i=qijian.guo@nxp.com; a=ed25519;
 pk=VRjOOFhVecTRwBzK4mt/k3JBnHoYfuXKCm9FM+hHQhs=
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_001826_047316_43A9FE58 
X-CRM114-Status: UNSURE (   7.36  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -4.2 (----)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

FRDM-IMX8MP use Motorcomm phy instead of Realtek PHY.
Remove realtek specific properties as it is unused.

Fixes: 95d7d7d2ad27 ("arm64: dts: imx8mp-frdm: add sd, ethernet, wifi, usb and hdmi support")

Signed-off-by: Joseph Guo <qijian.guo@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-frdm.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-frdm.dts b/arch/arm64/boot/dts/freescale/imx8mp-frdm.dts
index f43330d1ff8b63a86d84bb6e5cbba72b313eb634..e621b6fdaa77996b0837a3545e1d92e0cb44015f 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-frdm.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-frdm.dts
@@ -233,8 +233,6 @@ ethphy1: ethernet-phy@1 {
 			reset-gpios = <&gpio4 2 GPIO_ACTIVE_LOW>;
 			reset-assert-us = <10000>;
 			reset-deassert-us = <80000>;
-			realtek,aldps-enable;
-			realtek,clkout-disable;
 		};
 	};
 };

---
base-commit: 3191063649dbf7c0d0b768e1f3655e4c5fc6edb5
change-id: 20261124-8mp_realtek-f375ce6ea9be

Best regards,
-- 
Joseph Guo <qijian.guo@nxp.com>


