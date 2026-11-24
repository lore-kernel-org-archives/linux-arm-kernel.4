Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E19606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 03:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gbw8ERQj;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=svITgr+G
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=fcD/VjDIYMsET00/CLVouFEnQiuO5b/aivOcc1p1OoQ=; b=gbw8ERQjQPAVl5y8acJq/TpFoc
	TBl/X59hSHzfKrWiLzm5qyFsZhcYExn9fz79iulTc7PnNgqOXQ7TmUYjURHANEQ+nAe/J6if82gyy
	CcUEIGNtPSaHylC9cEpXYOle15Zezz874J1EegJSdzRVRB2MnCc8SjglFsIe8/sRay8rHkHOr7aQx
	gEubRxd6SzK1OVDRpSM05umeca32i39hSV/54j8vOei2mRCOG34eoBQnIGr/oLcPnyOSPXbRtb7mG
	q27Dctv0QNNFXXJs7WcIqLaapO3EIMpYEjP9//PL1LdXHhfzjMN7m/eK+cwormsQ//cMCpCmaekW3
	khCNq7SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVheB-00000005TSZ-1FCI;
	Tue, 24 Nov 2026 03:56:47 +0000
Received: from mail-southcentralusazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c10d::3] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVhe5-00000005TPW-1VI7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 03:56:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sAItrmVj0SCU3PUDD8WtMwR94+HSKJuyTCXFZV11vLVgd13L9RrYqXmz8bhA3odWI7vbyqA5von2Qi4peqjRhJJhL6TIrjQwLJKY2c+8yJqm+dVJVfnlCUCobaHAcd75qn0Jf6VFnZ+moRmN571zSC5o1GmFfwQqHAkdOiYtflkhqDCDyiPl411zijjfC96/RXRtuH+mMc41hHjhmbmhHPFrEavQIr4hLbgKJVOaIydB8fJ5OhETg8w8xTO5u1iFodIlVt0g1OoHXK6cxJTMHDMul6Wko1YuNB8khcU/g7MTxfksBiQoy74hpT0PjrCyg8aCfXDvnWv1AWEBBoBhKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fcD/VjDIYMsET00/CLVouFEnQiuO5b/aivOcc1p1OoQ=;
 b=fCYPO1MjnxsEr8eZef73CYPgQOxfzuc64WznusmbDf2gEAKI8ozRgngI2s8LKGeRf8fcJFcixA50Vp6+tXjmVFLf2AREpjbYlMXGSTJPR0TLOlyHoklX6PuR16cWBC6TeWkEpM4Q4oQSlzY8xS/Iy87ZEko26u9GQPZZBaQHlYQIy5DvNKbkWk+QhygtiTjgFumqgC6EBC0GVWy0PcqYIR0TbiaJDgPk3vZmeHf3yB6fxFczInopxd5zL/DuIm6ZVy3jLlXqtsR6tx/W1dKQ87aRpirammLBufd8c/ybteMPXMVWUiunp8KNMs12W/TU/dIR0TylKTo8WFbRbYbLoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fcD/VjDIYMsET00/CLVouFEnQiuO5b/aivOcc1p1OoQ=;
 b=svITgr+GS06WgtA2sMdLK13pu7jrPLdsOmlSSI8hYqoyo9g8ZTvdbzAdnVXBpkLzHWW6ojwiiqduRuEDQpqrYXpkNCCq1wUVxOJLQDySejb2Pu7d0NL6GSDpv2K7Ru7uwM+cM6n6KGVQ1w+jDc8xnav+7yZLQNfb0mk0154ZPTc=
Received: from MW4PR03CA0190.namprd03.prod.outlook.com (2603:10b6:303:b8::15)
 by PH7PR12MB6762.namprd12.prod.outlook.com (2603:10b6:510:1ac::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 03:56:32 +0000
Received: from MWH0EPF000C618A.namprd02.prod.outlook.com
 (2603:10b6:303:b8:cafe::a1) by MW4PR03CA0190.outlook.office365.com
 (2603:10b6:303:b8::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.14 via Frontend Transport; Tue,
 24 Nov 2026 03:56:31 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000C618A.mail.protection.outlook.com (10.167.249.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 03:56:31 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 23 Nov
 2026 21:56:22 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 23 Nov
 2026 21:56:21 -0600
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Mon, 23 Nov 2026 21:56:17 -0600
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <git@amd.com>, <shubhrajyoti.datta@gmail.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>, "Shubhrajyoti
 Datta" <shubhrajyoti.datta@amd.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v4 1/8] dt-bindings: clock: clocking-wizard: Add static-config mode support
Date: Tue, 24 Nov 2026 09:25:46 +0530
Message-ID: <20261124035613.1968260-2-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.44.4
In-Reply-To: <20261124035613.1968260-1-shubhrajyoti.datta@amd.com>
References: <20261124035613.1968260-1-shubhrajyoti.datta@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C618A:EE_|PH7PR12MB6762:EE_
X-MS-Office365-Filtering-Correlation-Id: 14de7660-b38b-4d53-aa1f-08df49deed0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|376014|7416014|23010399003|36860700016|6133799003|18002099003|22082099003|261009223027099003|3023799007|261021121427099003|261021123027099003|261022105027099003|261026140227099003|261026121527099003|261102123227099003|261028144727099003|56012099006|10067099003|5023799004|11063799006;
X-Microsoft-Antispam-Message-Info: nHmjYP4VV/ou9Q52u13nopALLmBJmOANV9fV++WKEpnnx4YgrDzKD/0VKeJbhbDj1wylYYdgpCD5MoUouuxFHi+6sC05eaUISLR2T+vecvJ0lJ2lMaxMrWeNVlYY20MhD1bAlE5nqhGqiBXQdZ66whjG5Gq+O+P6UYzOw2Azu+zILbwG7CGDk3NjmVfq0OTeC1Vwz6YjyR6nejWKg+ARLHnQSsIcsmuntwSbP6SnjdSPJWfJkh4C5sAXMEDycoNeQCOsOKf2zvn19YEKZwmdntggBMPW79PiqMbF9yd68/VTDlRFFMwiPTx3Eqsc6pYoWZ3fZs7H0fyTQ8nrVb3eyKgGhDyhd95LsfGSeNRI19SumnCIVVNUe93lZukH1xzx7/nj4wGpGem0PdODCTo71NCrH7kVPRb2pguXRmVTW9wvf71yU8rQQz4l1DeoebkE3McjXDNqmXHYsHnghz7Hwbh30NWLhpELP+g5zDhYj+ko+Yew/nnM4Cg0sHkCayhvaXx0kBPRlaA9goNbq2sycN0WkT0kRmGPQXzlCyP1A3nEkYOA+6YQwSOC6wbCcQ9x4cb2miUMb9Le2QN2WqI+NRgGdOhIqV9tOq8jh/qeiTTMtJuGKIUtpddHTb8oQTahlTsXVWJyXDx0mzw0gmjc4yXxUj4yx+fQPr6YajD/L3YCfMbz0HTPiT2I94YEB/EfZmgBl6mgLo8Sf8FzzIcPtA==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(7416014)(23010399003)(36860700016)(6133799003)(18002099003)(22082099003)(261009223027099003)(3023799007)(261021121427099003)(261021123027099003)(261022105027099003)(261026140227099003)(261026121527099003)(261102123227099003)(261028144727099003)(56012099006)(10067099003)(5023799004)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: rJA4K3I7z0lfuemkoNOfINYh+1xrE7t8xuEfrdGeyb/RD0XLOyatNL6/PyqC/g10T1DuqJ+KHZjL1Ctwo/pm7hdhe7wp+kq45bZ6/pMeQj0e5NhJmQGHgi35scLllQujq7B29z83mgc3p5Flex8aspaNPdm/VwGLejLTi3fci64XLMXCO4341kPzSnfPWIunkb0WJ3m3eXygYJL354SYLzerYyFvr6Nw2r/qR0XbM/SshWgoG6MDCBzwctk5I7bRv7O3EjRcGtKvdJJBr/DxVUSGySXfmx5wHKfNDCDfQ7gA0ap0nA/KLgzeB+cKQsP9SHyD6V4TJfwEpKV+BA5Y/DFupccL/jeANhZDrDvYhnrkMauZhYCCmRkTAJC6QmC8ZNF5LJrzfwHbsn6u7V69spZxAUn0/gxVYdvsOMrK696AsTA4vl2Up1il364lEzfm
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 03:56:31.7146
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 14de7660-b38b-4d53-aa1f-08df49deed0c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000C618A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6762
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_195641_408583_C3CAA7CF 
X-CRM114-Status: GOOD (  14.43  )
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

Static-config MMCM/PLL ratios are fixed at IP build time, so the kernel
cannot read per-output multiply/divide from registers and needs DT pairs
to register fixed-factor clocks. Also add the tuples by pair in example.

In static-config mode the IP exposes only fixed-factor clock outputs and
has no runtime-programmable registers, so reg is not required.
Make reg optional for static-config

In static-config mode the AXI bus interface is unused, so s_axi_aclk
is not required. Allow clocks/clock-names to have only one entry
(clk_in1) when xlnx,static-config is present and enforce two entries
otherwise. Update the static-config example accordingly.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

(no changes since v3)

Changes in v3:
Added reviewed tag

Changes in v2:
Merged the similar patches
Allow check for current dt even if it is unused.

 .../bindings/clock/xlnx,clocking-wizard.yaml  | 51 +++++++++++++++++--
 1 file changed, 47 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml b/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
index 3f311f90294e..865927b9f1be 100644
--- a/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
+++ b/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
@@ -29,11 +29,13 @@ properties:
     const: 1
 
   clocks:
+    minItems: 1
     items:
       - description: clock input
       - description: axi clock
 
   clock-names:
+    minItems: 1
     items:
       - const: clk_in1
       - const: s_axi_aclk
@@ -57,15 +59,45 @@ properties:
     description:
       Number of outputs.
 
+  xlnx,clk-mul-div:
+    $ref: /schemas/types.yaml#/definitions/uint32-matrix
+    description:
+      Fixed MMCM/PLL multiply/divide ratios, one (multiplier, divisor)
+      pair per clock output relative to clk_in1. The number of entries
+      must equal xlnx,nr-outputs.
+    minItems: 1
+    maxItems: 8
+    items:
+      items:
+        - description: multiplier
+          minimum: 1
+        - description: divisor
+          minimum: 1
+
 required:
   - compatible
-  - reg
   - "#clock-cells"
   - clocks
   - clock-names
   - xlnx,speed-grade
   - xlnx,nr-outputs
 
+allOf:
+  - if:
+      required:
+        - xlnx,static-config
+    then:
+      required:
+        - xlnx,clk-mul-div
+    else:
+      required:
+        - reg
+      properties:
+        clocks:
+          minItems: 2
+        clock-names:
+          minItems: 2
+
 additionalProperties: false
 
 examples:
@@ -74,10 +106,21 @@ examples:
         compatible = "xlnx,clocking-wizard";
         reg = <0xb0000000 0x10000>;
         #clock-cells = <1>;
-        xlnx,static-config;
+        clocks = <&clkc 15>, <&clkc 18>;
+        clock-names = "clk_in1", "s_axi_aclk";
+        xlnx,nr-outputs = <6>;
         xlnx,speed-grade = <1>;
+    };
+
+  - |
+    clock-controller {
+        compatible = "xlnx,clocking-wizard";
+        #clock-cells = <1>;
+        clocks = <&clkc 15>;
+        clock-names = "clk_in1";
         xlnx,nr-outputs = <6>;
-        clock-names = "clk_in1", "s_axi_aclk";
-        clocks = <&clkc 15>, <&clkc 15>;
+        xlnx,speed-grade = <1>;
+        xlnx,static-config;
+        xlnx,clk-mul-div = <12 1>, <10 2>, <8 1>, <6 1>, <4 2>, <2 1>;
     };
 ...
-- 
2.34.1


