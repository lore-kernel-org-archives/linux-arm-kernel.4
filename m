Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C04606C57B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 19:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hXsIdN7P;
	dkim=pass (2048-bit key, unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=PEn9+7Zi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=pYwXxD5MgatSE+puLnhIi9nFAFrR9w/nmUJTmwQBOy8=; b=hXsIdN7Pkuc78P
	Ad2GxY4JN7VZl4Cv04Pf1uj5xm2JPAhaQ4VwhzFOrA+lsC1dqYseVOZmFYulCEfXVQXa68Tyh3eL5
	5b8slXbFmeCDKhWYbKjlRlS+8+jxs6NMDfUpRrNfb+J5dOoMMxzmFZYwest19FJJH03qSM0AjNw/i
	TcW6tZMAZXNEDdkjsBwjFDxBcmBXpye/xvrKar1YIoonSgEmBXbQuE3vbZDJbCprhKu1Xr1fGhJf/
	e4Rj4JRkyhXawuF+JywOlgtAkr76IKTzR3GT0nqmlMfY3PgL+cxucLDJM/2I2cIbphge/h37hUaCd
	E1aCX+wjXpzh0GQ/i4hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT22a-00000003hlN-0kku;
	Mon, 16 Nov 2026 19:06:56 +0000
Received: from mail-westcentralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c112::5] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT22Q-00000003hhG-0bDP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 19:06:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sL9cFH3Q/A0P0uI9hzuKhBgH5uRQnwoFjt5LVVqadzzdAQzU0KeeC73WfPjjtgs9x9lmX6V8m61aRgVHoBtbYr8wxK31ikhdEcRlVnishLRek95/uqvvXrNGJavTwm9PXh/ErcPjzhHm9UsThVtDkRF9/cY0XUccw+R04bcplDxH3KNGrEhSP2ZsjBP3yzJAobtjM0P5tEyVmjVELsH2QU3nbR6s9Pqy4tmbyt1Aj16f2UzUqGVNuCuimHcY0ILeWMFPzz73iprjOWrO7KiEphJAc51UwIv31wphsMShnJfe8kmdOiu0LDA6lztEdFnIo4CApOMATQXlEpVILXNFaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pYwXxD5MgatSE+puLnhIi9nFAFrR9w/nmUJTmwQBOy8=;
 b=WtEsBFdacSlIHLMAGRsv1PimDgQFOOz8i1U3s730tddcw27YQZJFibvfr3q+z4XCX3Tn8bUo4XqdM+DsaWQ2mKIYuq3gkojK5g0wyF4P1AvUt0ciWTy2Qu+xf1jvUsk5O1Gk23VW5mTZ0bhskII7Lt9afyqhITy7kiwZ4yn1qIw5dfM/KoWR5fE/nE3zyCgHjsOwNx1XetztRmGmpA+w2AAm61OgqfMqIb6nOBHzGnou8VrE1At0oLm/Wiw+3XxRNxG9TrGFPt6FYlayTSpPGR5wJbVhyGzaCBxgjmZuYFw46T8XQ4zNiZetHYghu89qIobzgyNNg1Q++7ZFZODDqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 64.62.143.114) smtp.rcpttodomain=axiado.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pYwXxD5MgatSE+puLnhIi9nFAFrR9w/nmUJTmwQBOy8=;
 b=PEn9+7ZiIjHXNDcMkJhz3pmP/Cs7RP3Gfe9jn5fSJfDvVqi82vC8B+PFb/r2/EMkT3srJDclkQxrjH3QMaE1+Ls4Gv6ImyuP/QZhciGLnUKoihLV7f98yRMW8CKTczeR4RA3ny4wipdGOHlikF5/Vn5cPoKdigq6JQtBzS5h0Tf7WN4eJqJw+jp+avo4vhDYHmXqaA07LD0uiN1B9HlnNZRTt8k4rII3gZXdZ+l6cHClrwS3JwBWX14CNLfDxZOeoKEFX4qgQgn+0SQeOyIqPG2U6/Rc/UvvHELhmSdmZiTvWxUBesoJDreZZ7hesq//LYgX2D3KeP3rUqJMJpA29Q==
Received: from BL1P223CA0016.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:2c4::21)
 by PH7PR18MB5666.namprd18.prod.outlook.com (2603:10b6:510:2e7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Mon, 16 Nov
 2026 19:06:40 +0000
Received: from IA0PEPF0000003E.namprd03.prod.outlook.com
 (2603:10b6:208:2c4:cafe::43) by BL1P223CA0016.outlook.office365.com
 (2603:10b6:208:2c4::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Mon, 16
 Nov 2026 19:06:40 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 64.62.143.114) smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 64.62.143.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.62.143.114; helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (64.62.143.114) by
 IA0PEPF0000003E.mail.protection.outlook.com (10.167.249.75) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Mon, 16 Nov 2026 19:06:39 +0000
Received: from axz-uw1-build-vm02.corp.axiado.com (unknown [10.14.1.22])
	by smtp.corp.axiado.com (Postfix) with ESMTP id 155414186B58;
	Mon, 16 Nov 2026 11:06:38 -0800 (PST)
From: Petar Stepanovic <pstepanovic@axiado.com>
Date: Mon, 16 Nov 2026 11:06:15 -0800
Subject: [PATCH v5 1/6] dt-bindings: usb: gadget: udc: add Axiado AX3000
 and AX3005 UDC
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-axiado-ax3000-usb-device-controller-v5-1-49271ed5c793@axiado.com>
References: <20261116-axiado-ax3000-usb-device-controller-v5-0-49271ed5c793@axiado.com>
In-Reply-To: <20261116-axiado-ax3000-usb-device-controller-v5-0-49271ed5c793@axiado.com>
To: Prasad Bolisetty <pbolisetty@axiado.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tzu-Hao Wei <twei@axiado.com>, 
 Karthikeyan Mitran <kmitran@axiado.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Neill Kapron <nkapron@google.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org, Petar Stepanovic <pstepanovic@axiado.com>, 
 Krutik Shah <krutikshah@axiado.com>, 
 Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794855998; l=3700;
 i=pstepanovic@axiado.com; s=20250916; h=from:subject:message-id;
 bh=2xo20+OJyKYJmmo/bodACZzslBB1bDqdJY8tRkXvdGg=;
 b=dKHLFiOsXwp7bc+8snU4KbDHpkyaL7E4IfdCbe9kcwg36vg9YCIh2gVIyTCvpJ/YmA0UPpGLk
 WIkbsRW6wYtDoO4oYnzWVQStXq6ytQsG9Y5K41LmdtMlL9VtRRcTdQ3
X-Developer-Key: i=pstepanovic@axiado.com; a=ed25519;
 pk=70f1UJOGT9U11ZK6o+ENXtv0I5wBE3e+Y9YWODzRsdI=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PEPF0000003E:EE_|PH7PR18MB5666:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d631401-8698-4389-608f-08df4414bec4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|376014|23010399003|36860700016|7416014|22082099003|18002099003|6133799003|3023799007|5023799004|10067099003|261022105027099003|261026140227099003|261028144727099003|261026121527099003|261021121427099003|56012099006|261009223027099003|261102123227099003|261022075727099003;
X-Microsoft-Antispam-Message-Info: 2DRjGRRFLLcdmXu+tNc4V9rZqFoTDHrJr2yNrLH1ZdtfAWpLhE854PbSik53v2TkzoTkK8JQbdkRIgn8OBXDq4iFx0eMayi+rY9C1EshNUFRhIww4Dp38GGfCsupVNepTGnGmgq/s86qtF1CYLGvdlieoIpKTu3Yz06GLMHyoNV5HH7EyAYvnXOifq5cCX221NhTXRCQ2vRfgHxGWzVSiaDcAA+gXOKdLhOZOTmLlTPz/iblXuKXAT1SpsRlkfBBWI3mDXPOG8Hmyok8a+B11Qkc2dXcvswiVFzEarVImWHI2CO2j+/Q0w3EK5MMP6xMWkbWPl15c9Ctiz8IbNw0Kz6xf9NB/9+mHgjhrT6braJhgjHMyo22E414LevIeLOpuXIIGlJzgvV3trslndWJtLca1c3a/Y7uUk/OiZMbU8Foqz+LITr3Rl8afOSWTIEBLZONRpBGNlmqA1rBA6JbvDR6fgUq7PbWcom5mVPVXPA1XLR+QCdGYJ7WhDkwzAjEmYLya91Fu9O0bZGCY6eTyIgzdlFiY5vWKtbk4o6Z4kaqB4dC6StW5ky3B8jcz/2mvkoifa+Ff81Z2i4sGO76BEL4PlrfBIWp+2mXzmftF6kZpZljYcacrWNjdAOwCSbH8aRSmngb33JMadvsL4Wwyw==
X-Forefront-Antispam-Report: CIP:64.62.143.114;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(23010399003)(36860700016)(7416014)(22082099003)(18002099003)(6133799003)(3023799007)(5023799004)(10067099003)(261022105027099003)(261026140227099003)(261028144727099003)(261026121527099003)(261021121427099003)(56012099006)(261009223027099003)(261102123227099003)(261022075727099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 2W49DFPENh2ZrtEDO9T9+E25/GvMnzB5ceJ8ZbnwL5QZD1FH8Lqr0lmC62lYcV5FAoIPnJGgQiDejE1cW8CTj9tO7gKbac6rwmrU4m39FEtbKvMMZgGyc5Lz8VevRVA6uKBJRdkXKTpu8movUqFoxzqDzZSYBPdTVQ11WsVzO5n0tHlfY+GThosiPtmEVxlb0uIiI0nQC4G655GvPbbEKbF12PlS2571y+CVRh4a5cF9/r2kVoQdMkRCVKkekUaVXCp4q5rlS9XtJxrroSOvoF3rF0fJAj+xo70dp0/PZquYZ3sblkotsD0MffMxUP/EgKQdS+11uvEVBWN6BY36FX+8PjlbSGAA44xXm0pNkovf3wUbmiUzNsBpSpDEGpUmFN6Cgg+D4nT/F4gDbCOC8iFxG2kG8Pnu7RXYHwd0T+sKuMYj1YGh1FoaMaHnayDU
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 19:06:39.8789
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d631401-8698-4389-608f-08df4414bec4
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[64.62.143.114];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource: IA0PEPF0000003E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR18MB5666
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_110646_200281_4CED5737 
X-CRM114-Status: GOOD (  12.82  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add a Devicetree binding for the USB device controller integrated into
the Axiado AX3000 and AX3005 SoCs.

The controller is based on a Corigine USB 3.1 IP core that is
dual-role capable (device and host), used here in device role. It
provides SuperSpeed (5 Gb/s) or High-Speed (480 Mb/s) operation, and
supports control, bulk, interrupt, and isochronous transfer types
across multiple configurable endpoints.

Co-developed-by: Krutik Shah <krutikshah@axiado.com>
Signed-off-by: Krutik Shah <krutikshah@axiado.com>
Co-developed-by: Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>
Signed-off-by: Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>
Co-developed-by: Tzu-Hao Wei <twei@axiado.com>
Signed-off-by: Tzu-Hao Wei <twei@axiado.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>
---
 .../devicetree/bindings/usb/axiado,ax3000-udc.yaml | 69 ++++++++++++++++++++++
 MAINTAINERS                                        |  8 +++
 2 files changed, 77 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/axiado,ax3000-udc.yaml b/Documentation/devicetree/bindings/usb/axiado,ax3000-udc.yaml
new file mode 100644
index 000000000000..8b9acdb81907
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/axiado,ax3000-udc.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/axiado,ax3000-udc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Axiado AX3000/AX3005 USB Device Controller
+
+maintainers:
+  - Petar Stepanovic <pstepanovic@axiado.com>
+  - Tzu-Hao Wei <twei@axiado.com>
+  - Prasad Bolisetty <pbolisetty@axiado.com>
+
+description:
+  Axiado USB dual-role controller based on the Corigine USB 3.1 IP core.
+  Supports USB 3.1 SuperSpeed and USB 2.0 High-Speed device operation
+  with control, bulk, interrupt, and isochronous transfers.
+
+allOf:
+  - $ref: usb.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - const: axiado,ax3000-udc
+      - items:
+          - const: axiado,ax3005-udc
+          - const: axiado,ax3000-udc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  phys:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        usb@81200000 {
+            compatible = "axiado,ax3000-udc";
+            reg = <0x0 0x81200000 0x0 0x100000>;
+            interrupt-parent = <&gic500>;
+            interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
+            resets = <&reset 0>;
+            phys = <&usb_phy>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 222b7fc2c3aa..1bf0408e00f3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4662,6 +4662,14 @@ F:	Documentation/devicetree/bindings/hwmon/axiado,ax3000-tsadc.yaml
 F:	Documentation/hwmon/axiado-tsadc.rst
 F:	drivers/hwmon/axiado-tsadc.c
 
+AXIADO USB UDC DRIVER
+M:	Petar Stepanovic <pstepanovic@axiado.com>
+M:	Tzu-Hao Wei <twei@axiado.com>
+M:	Prasad Bolisetty <pbolisetty@axiado.com>
+L:	linux-usb@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/usb/axiado,ax3000-udc.yaml
+
 AYANEO PLATFORM EC DRIVER
 M:	Antheas Kapenekakis <lkml@antheas.dev>
 L:	platform-driver-x86@vger.kernel.org

-- 
2.34.1


