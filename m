Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12ABE606A337
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 12:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FyVgSS3S
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=jWnzUGiIbPrhniQ4CHXSDTf6yUa4H56rTrEtn1wVuls=; b=FyVgSS3S3v4n/j5QC/uUbBwxrT
	yPNGnV/jDlbcP21hUmtlBUNPdnnDetHDgGtYB1AJVCkOcwYZts07rNWdgnUf6gCmzISzk9N9W2Jlv
	FCvxUjtvzhifYIfajbRir02tXl1aMMZ5EtekneILtJtDq4nvENjwZ5IHfegaAzr3LzeK6MONBJxDG
	5vVxZDAnI027WEBKu9rrRBPLy0beVBbj4Z1ffdIgEu+i00jFEJLHTb29mGLUWa91Ab7lIfcH6/pcH
	vW4LTWOqd9uCepe6a2+MHQzgwKhhmevAwfGQRFgeWa0LhRZ+tQdQCenBExbuhdTPVyiYJpExtIX0H
	jfaVBpkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1Q0-0000000BsU1-3yff;
	Thu, 19 Nov 2026 12:39:12 +0000
Received: from mail-japanwestazlp170120003.outbound.protection.outlook.com ([2a01:111:f403:c406::3] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1Pp-0000000BsNU-3Pwt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 12:39:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T/unrKx90DNSD2fiqW3P4z8p+/Nj03TRveFsFIrzvfjzlIUpKkUl7y1621xe2O6EQaFDmfzWIiE5h3TnoMv8IQYWeHiutueJq9YFcpyFHotQf1loEyP6tBAmCvD5DmDjihA4Mmqg3LhIYicPEBZhZ1zTRUBLkRN44F77qDoKu1W0PL1+9PKJbACkIGh1wv7D34sEWeb51KdgVyt3bos5PMziwDjH/B7IrU3lOOqV+DpqGgXuMiqafb0WCrYWIQh5jzg7JWhpdci6xlp0fIxe/U6Wl9scjMtd7FHi+sidXVctB92y7Nsv70a8QLAz6IgPVB0xksYyXpdHO5PTLsubsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jWnzUGiIbPrhniQ4CHXSDTf6yUa4H56rTrEtn1wVuls=;
 b=nciFJfwAuC8UBgv+MqkC1DV5mXuQuMy0M8OJJcux+zwt2LeMROsN49VWTY8qhcgbulBUt6ThId/9FcabkmPOFsEUWxJIffzEdU0I16UUbaDlow+JD0dE6d8ZXAGgBunrJ7wdwugKPms4EFvQTL8zChc+DM8yP0eZGjH9uv6uyzxxscYc9S2Eryg6ZNrIeUBXwRpStCA5xR0K6Koq6Dh/VoKXS5Y9y+NHmK8bA9PkWmyUBYifuX/aqP79s+Mhk3gOTeZJhW8YX/VwzY/ahnvyI+OX6CjITgPa/hRDeT6N1yYxTbPamQtKzKh0hDUKJvXirX8PU0BPr8PFGE/f+jK+Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from JH0PR01CA0121.apcprd01.prod.exchangelabs.com
 (2603:1096:990:54::9) by TYZPR06MB7039.apcprd06.prod.outlook.com
 (2603:1096:405:3b::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.1; Thu, 19 Nov
 2026 12:38:54 +0000
Received: from SG2PEPF000B66D0.apcprd03.prod.outlook.com
 (2603:1096:990:54:cafe::9a) by JH0PR01CA0121.outlook.office365.com
 (2603:1096:990:54::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.10 via Frontend Transport; Thu,
 19 Nov 2026 12:38:53 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66D0.mail.protection.outlook.com (10.167.240.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Thu, 19 Nov 2026 12:38:52 +0000
Received: from cix (unknown [172.16.66.176])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 5C2A740920E7;
	Thu, 19 Nov 2026 20:38:51 +0800 (CST)
From: Cunyuan Liu <cunyuan.liu@cixtech.com>
To: boris.brezillon@collabora.com,
	steven.price@arm.com,
	liviu.dudau@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	gary.yang@cixtech.com,
	fugang.duan@cixtech.com,
	daniel.almeida@collabora.com,
	aliceryhl@google.com,
	p.zabel@pengutronix.de,
	daniel@fooishbar.org
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	robin.wang@cixtech.com,
	cunyuan.liu@cixtech.com
Subject: [PATCH v3 5/7] dt-bindings: gpu: Add CIX Sky1 Mali support
Date: Thu, 19 Nov 2026 20:38:48 +0800
Message-ID: <20261119123850.2994625-6-cunyuan.liu@cixtech.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261119123850.2994625-1-cunyuan.liu@cixtech.com>
References: <20261119123850.2994625-1-cunyuan.liu@cixtech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66D0:EE_|TYZPR06MB7039:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: bc4a6958-439a-40ba-e322-08df463a116c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|82310400026|36860700016|921020|10067099003|56012099006|261022105027099003|261021121427099003|261009223027099003|261102123227099003|261026140227099003|261026121527099003|261028144727099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 2VuZN7UQsqwVA1+VXzSfK6AxyAJq2Cc6FRdDRPvLLYRP+PGtGOrKjvI3FnQHuFUsJ/H2LrZWDOaoEeyZnRJnfyxdqcj46BBKMARunjlygrjBn5Ibxnpd0oiVPJ17ZXYYvsu7bJT2ZDiLDOQ/QPK0v9Psk1UQHmWeHDO4Dz814Tcmg6hg/6IOLkfSHEwN/Nrcg6lkbEsLZ2Vw6nBTidZpGtt4bLKOtQGpxMr89ANB8L+iZ0NyshpHwfgMDhEAD2MxSN0vANxK5PgAo1jjOahbQwkXFwEZlbEPf3aPJvmezgyrTkcUDrE4VLH/09FAoAWJKmy8qQ3yG4ClbsCaMIyYrNqPkEkQBMdjF3m0B3UV8dFUfGFQ7uDQjW61+dRVTqBYbSRXJB72ydb+PIN9VNO0Ju8iv36aytzxwsVFP1TuD3Yk1wDPg0qlNLu+ujkhCbKnc2OFHN+6Nq+U2ssOt2tAjgS0tlrGjcIFg1vozkrMJWsi2RaJrbYmkFCmeUD2pmi09ooE+GP/QT04vftdG+s9o+6aFjx8iCUr0gocUEAk56zk6WxVrp3V+QyeVEScNGcqZn9ZgZuTM5U+lvhy9WioLJ+Y5rlQ3//nF18HijVUgeWrGegEFz+42YSlcMS/yA7wmPyY3Ho+LHIBaOjDtR6nOmJ0mF4SxJQneD/qNvmOtrU1nqNvMGEYuPXns9msi/tiSrDAQ5xKNqV0jbMkThv11D07FIzyJ9mchFZnMWnwcJpOncfN6OI+8p/buZYZbD2O
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(82310400026)(36860700016)(921020)(10067099003)(56012099006)(261022105027099003)(261021121427099003)(261009223027099003)(261102123227099003)(261026140227099003)(261026121527099003)(261028144727099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: V6upVhr1uGv4hxufitvZ9RAflgThY9TKMlrClammgng62muQHAYDmm9vXYPCVARzWH42hGtgW9x9v1zlev3XesLwGWKX30vNHxTdSZgo4iqAvzPtoKojp98KnSGvz5uVgZZvXR+8FL20+egqdDSa0l4a5iX2HSRIPZ31BtLM3Ylg3N8uxACKeCrKzVp8BtwymcU1yVgwQ8C/kCb1euel7cSwcdwziqR2XeuSKGJagNwzrHHFqifviWnLPIYZspExpx+WoQ+/cDdAz8A6zSrCHsTHcWkgEG0WCgp8BMoex1Wr4376/lkciZ/7KQ1c2GmhuGlwRPSnIrqrx7lSIwcKo78HfwR6hzPBJQHEUs57Zn7RCwVLxtiRyhCDQLxfSOLnyyPce+KjbmVfPLQfbJxsUghXTCQAWAKyUhNFL18ad+XA4kpZTytXmwTAXTuyL/wa
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 12:38:52.2611
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc4a6958-439a-40ba-e322-08df463a116c
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2PEPF000B66D0.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB7039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_043901_893048_29C31EF3 
X-CRM114-Status: UNSURE (   8.97  )
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Describe the Mali CSF GPU on CIX Sky1. It uses core and stacks clocks,
an external reset and a GPU power domain.

Add the compatible string, resource requirements and an example. Require
the system-cache allocation policies needed by the Sky1 integration.

Signed-off-by: Cunyuan Liu <cunyuan.liu@cixtech.com>
---
 .../bindings/gpu/arm,mali-valhall-csf.yaml    | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
index 4d50427edd87..0c558fc6c779 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
@@ -18,6 +18,7 @@ properties:
     oneOf:
       - items:
           - enum:
+              - cix,sky1-mali
               - mediatek,mt8196-mali
               - nxp,imx95-mali            # G310
               - rockchip,rk3588-mali
@@ -51,6 +52,9 @@ properties:
           - stacks
       - const: stacks
 
+  resets:
+    maxItems: 1
+
   nvmem-cells:
     items:
       - description: bitmask of functional shader cores
@@ -170,6 +174,35 @@ allOf:
         - nvmem-cells
         - nvmem-cell-names
         - power-domains
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: cix,sky1-mali
+    then:
+      properties:
+        clocks:
+          minItems: 2
+          maxItems: 2
+        clock-names:
+          items:
+            - const: core
+            - const: stacks
+        power-domains:
+          maxItems: 1
+        power-domain-names: false
+        mali-supply: false
+        sram-supply: false
+        nvmem-cells: false
+        nvmem-cell-names: false
+      required:
+        - clock-names
+        - resets
+        - power-domains
+        - arm,sysc-alloc
+    else:
+      properties:
+        resets: false
 
 examples:
   - |
@@ -220,4 +253,26 @@ examples:
         power-domains = <&gpufreq>;
     };
 
+  - |
+    #include <dt-bindings/clock/cix,sky1.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/reset/cix,sky1-s5-system-control.h>
+
+    gpu@15010000 {
+        compatible = "cix,sky1-mali", "arm,mali-valhall-csf";
+        reg = <0x15010000 0x480000>;
+        interrupts = <GIC_SPI 237 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 238 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 239 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "job", "mmu", "gpu";
+        clocks = <&scmi_clk CLK_TREE_GPU_CLK_CORE>,
+                 <&scmi_clk CLK_TREE_GPU_CLK_STACKS>;
+        clock-names = "core", "stacks";
+        resets = <&s5_syscon SKY1_GPU_RESET_N>;
+        power-domains = <&smc_devpd 21>;
+        arm,sysc-alloc = <2 3 2>, <4 3 0>, <16 2 2>,
+                         <17 2 3>, <18 2 5>, <21 2 3>,
+                         <22 0 5>, <24 2 0>, <28 2 3>;
+    };
+
 ...
-- 
2.53.0


