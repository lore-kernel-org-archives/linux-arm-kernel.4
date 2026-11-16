Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8261D606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 07:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vuw3oC8N
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=V8BcBDsPk+eh+DBtfgGyO/UXvpH+SAIrb0kbnM4HFXc=; b=vuw3oC8NKNzuSqIZCV81b/anoE
	vlZy7wNm1o3f4axmRwj8QAjrkXktTuUk5Xm4nENTLqioReWJaYggEXBgmwAc8looDSKnAhduVT359
	f920ZkH/dhd/RJIUUAf9Db4gWD7aUw/GHKBf15TMviOBsLdX8rvdBeuEMfiHqYGJI6BM5TUDobn/p
	7oDjBH0F/AkZBN4SZkGuY2zM6Y08kQocTDMgZx1EENrb72WOCrmWUkUK+EMzoHnvTyBk/wMQ7E7Yd
	gUGJVTzgVPV0j5uHTkXhcy3wuJcbsiV+YIrqMuJiFf2DOlJI/DYw81jcC398fixdMUt9g/m3osUI1
	Q7Niz8rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSrIF-00000001QNG-1TPa;
	Mon, 16 Nov 2026 07:38:23 +0000
Received: from mail-koreacentralazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c40f::6] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSrI6-00000001QFh-3qRr;
	Mon, 16 Nov 2026 07:38:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y1trFaxR5m8zctd1cK4qRhzf4i/te0kBBE/qwdwprTZUslreV3jxxGzY3OAzMKf1BWgMgLyeivUAf8pGEZnzeeckxh2XyjCvl8CNXNE+ofoEEMYMehpw3RcIlhr9ZJVoZ/p63jrHoDAV2bDNK3I5H6k9+pfz7v8A0wthlx0FAW6dMq49c1UAtN7MJX0oPfbCdzM9kbHAZ5AEwKXpAxPT/daxROwDsFoi3tPGd06SNShf6jA8yYAA238BQ+W26SBzj2KQmINSBc40HchI2iVLFJUF2ca/jAuDcG5MaRyJWbXviEofXafk259LhOJpbpi8va0K3BN5yWy2ww0wH3j2wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V8BcBDsPk+eh+DBtfgGyO/UXvpH+SAIrb0kbnM4HFXc=;
 b=fLbFT670CFtTZWLWOo9Vt3w19xuJ+Zabbv4FZg/VOWwsoEdr4Rou/eoPtJthBnQwToTTDEf6Ar82q8hf337bf18vAvyj/T8ax5yf3/T636ReU1lGMQucNBXGWRE3FmS2F5ABtRI3TKSBlH5DUcRELBT/U04xiWIgLtv0335ycE3J/PxZWD716OUNYJyCgcDdcu9jZ2H0uwwAp45fAwRCuyFLk6uDw+FmDqLkOB3b29x0gOK1gWjoZPGUD2ZZRDTeqbHWO+iNfyhS5mCJXnhmD5NRoaRNiTjgB0rtd9kVxasMnWBQyL0KPGZp183lNTdO3dFZlqcYgolFXGkZYE01MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI3PR03CA0009.apcprd03.prod.outlook.com (2603:1096:4:297::17)
 by JH0PR06MB6437.apcprd06.prod.outlook.com (2603:1096:990:2d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.7; Mon, 16 Nov
 2026 07:38:05 +0000
Received: from SG2PEPF000B66D0.apcprd03.prod.outlook.com
 (2603:1096:4:297:cafe::23) by SI3PR03CA0009.outlook.office365.com
 (2603:1096:4:297::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.4 via Frontend Transport; Mon, 16
 Nov 2026 07:38:05 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66D0.mail.protection.outlook.com (10.167.240.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Mon, 16 Nov 2026 07:38:04 +0000
Received: from localhost.localdomain (unknown [172.16.64.56])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 11801427EFD0;
	Mon, 16 Nov 2026 15:38:01 +0800 (CST)
From: Luo Liu <Luo.Liu@cixtech.com>
To: vkoul@kernel.org,
	neil.armstrong@linaro.org,
	mani@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	gary.yang@cixtech.com,
	fugang.duan@cixtech.com,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: cix-kernel-upstream@cixtech.com,
	p.zabel@pengutronix.de,
	linux-kernel@vger.kernel.org,
	Luo.Liu@cixtech.com,
	Wuyi.Shen@cixtech.com,
	EastLake.Yang@cixtech.com
Subject: [PATCH v5 1/3] dt-bindings: phy: Add CIX Sky1 DP PHY
Date: Mon, 16 Nov 2026 15:37:58 +0800
Message-Id: <20261116073800.2396894-2-Luo.Liu@cixtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261116073800.2396894-1-Luo.Liu@cixtech.com>
References: <20261116073800.2396894-1-Luo.Liu@cixtech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66D0:EE_|JH0PR06MB6437:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e7d52e7f-54bf-4145-0567-08df43b48d4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|36860700016|1800799024|23010399003|82310400026|42112799006|921020|10067099003|56012099006|261022105027099003|261026121527099003|261028144727099003|261026140227099003|261021135927099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: 2u+fEFgXxgg8MDtfPM6yU8u7P4ImjPQblp0dG6kNZKWdVXSuDIgp99pBHI6ln5HwEQ9XhPj2f9q8bEU+5ZODRlshgqatHNx4mCmX4aYpruou4sOpxBX7AuTDYydHKMBUgLuxqN40b5WedF/EoZGiEjPWNjVfFnWGs1C0dFLdE6Amh2HOKcyXQXVJpQTiKNSxIRbCkeK4SGBazJZk6jcmIzWgFuyICMe5113HcMFjiBfpn/+bh7m6pSdbiHG7JHjYTlbMbA12al7qpuAD07Gooa3WVRBSGZwieX1E1d99y5EqcNJu6ak4KHf2ljBg09aRgsZ0VYqePncGosVzemb0U/zsA6LoaBwZ8wR4mgkfzPfL38XXMjN1gzZKan3308Ufa5C5WiKE5M5cakKeF6l0F9lhjU9sojE3hW5Z/FBo+MevmvoBdnBwtzWclCmaWfI33exO456WNQyRdRLHYYlmeSuKdTXKVIRZ9/kpp7zp2JuTsN/aUNb7fgI2JdRnid0tsQD9QfJLGOM4a2gSZKW/TXtm4kABInGIicpcTuyPoOfaGJy5Ye9UdBoNG2GCqLHLlZV4n1O+zz32ISt1DypGpLd/N8wsHeVFmhGBrvKysR/N2UCoiQqQP1ZvIigWl1LznN9t2Ap8SHNEAH/TF/XfpqKb+O7eISUhwdpnZlzhAnOA7vvylCYd9nXWRIIIx0U6
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700016)(1800799024)(23010399003)(82310400026)(42112799006)(921020)(10067099003)(56012099006)(261022105027099003)(261026121527099003)(261028144727099003)(261026140227099003)(261021135927099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: RW58ocCZQAZl1BWpm0pos7Qx1BG2fmL9BcXsWhvplBefSk24VLdEEJWNmUG4P+3yqhbDWfrQbVt3APmby2DKXaQSd2cZZNtSQuvus4vB+3yj78REKp5ELzc7t61EQlDAHx8xfwTkf8mPdwF1Ahu0C2PvhYlzmn2WNeKf61gVkfRIiXLkvs1R+OMWrGZtDM8vjO7zVvTjlEdzRuT5GaY7Z+gOPV6yTuIPWg+KHAhb10chwZ+MChKdk97PFyuOSX67b30cGepDVjJg4uwY5OSinUMbfKben1ApvvJJtSeLvzmRdkMND5PUKKEb8Y088vmoB2T1p3kSlMsPCxRS7SR5SLYIBSRZY2gESSYOOaNrqFXb5dlSP+pmOXJjWfozebePJOxqaJo+Q8RkHDfjFJQGEJJFeE2hPmjCYG2EEHlvPEkyLccgvjXGiTnVrdqGznEE
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 07:38:04.8294
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7d52e7f-54bf-4145-0567-08df43b48d4c
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2PEPF000B66D0.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6437
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_233814_973720_D5523555 
X-CRM114-Status: GOOD (  14.07  )
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Document the dedicated DisplayPort PHY on CIX Sky1, including the
required APB clock shared with the DPTx controller, reset, and the
optional cix,external-dp property to select the external DP swing
table instead of the default low-voltage values.
Add a MAINTAINERS entry for the binding and driver.

Signed-off-by: Luo Liu <Luo.Liu@cixtech.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
Changes in v5:
- No changes.

 .../bindings/phy/cix,sky1-dp-phy.yaml         | 67 +++++++++++++++++++
 MAINTAINERS                                   |  8 +++
 2 files changed, 75 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/cix,sky1-dp-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/cix,sky1-dp-phy.yaml b/Documentation/devicetree/bindings/phy/cix,sky1-dp-phy.yaml
new file mode 100644
index 000000000000..ea19f0aa0b1c
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/cix,sky1-dp-phy.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/cix,sky1-dp-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: CIX Sky1 DisplayPort PHY
+
+maintainers:
+  - Luo Liu <Luo.Liu@cixtech.com>
+
+description:
+  The CIX Sky1 DP PHY provides the PMA/CDB register interface for the
+  dedicated DisplayPort instance on CIX Sky1.
+
+  The PHY APB clock is physically shared with the DPTx controller.
+
+properties:
+  compatible:
+    const: cix,sky1-dp-phy
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+    description: APB register interface clock
+
+  clock-names:
+    const: apb
+
+  resets:
+    maxItems: 1
+    description: PHY hardware reset
+
+  "#phy-cells":
+    const: 0
+
+  cix,external-dp:
+    type: boolean
+    description:
+      Use voltage swing values suitable for an external DisplayPort
+      connector instead of the default low-voltage values.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - resets
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/cix,sky1.h>
+    #include <dt-bindings/reset/cix,sky1-s5-system-control.h>
+
+    phy@1414c000 {
+        compatible = "cix,sky1-dp-phy";
+        reg = <0x1414c000 0x4000>;
+        clocks = <&scmi_clk CLK_TREE_DPC2_APBCLK>;
+        clock-names = "apb";
+        resets = <&s5_syscon SKY1_DP_PHY_RST_N>;
+        #phy-cells = <0>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..d05771fe5bb2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6522,6 +6522,14 @@ M:	Satish Kharat <satishkh@cisco.com>
 S:	Supported
 F:	drivers/infiniband/hw/usnic/
 
+CIX SKY1 DISPLAYPORT PHY DRIVER
+M:	Luo Liu <Luo.Liu@cixtech.com>
+R:	CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>
+L:	linux-phy@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/phy/cix,sky1-dp-phy.yaml
+F:	drivers/phy/cix/
+
 CLANG CONTEXT ANALYSIS
 M:	Marco Elver <elver@google.com>
 R:	Bart Van Assche <bvanassche@acm.org>
-- 
2.25.1


