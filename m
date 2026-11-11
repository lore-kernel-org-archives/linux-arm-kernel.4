Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418E960A380D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 15:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Pm7osN83;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=CL6ubKcf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=gzQhxxhjyjv9tKf5vJYJXkFugI8bIvDmQWZbamV41UA=; b=Pm7osN83Evms33OS/uXv4YW9cU
	o6KwuUAowlu0XoowGHKdPP8uP/f8mUSQAuHrKf/6SLJ6IiJQ4SqczguvLHnnw9pevTJhDojRgy1pE
	PQTW9EcR7EaThyDEbF9EbxKo9zEQIh1XVWDlSic7TQTjeCK8eOEjERMF3+smY90tQxrC3F+O0ymMz
	yJldcRDvw2uQ4TMOpJD9t7IvRkd5svXOcBsoxgpN45yga4lMV4j3VaHrHR9yBOZTXcvtYGiVf6w8T
	ilNJanQjeD/a7xYl3Ac047HyaVZlcHFKe6tZWBlPQoghqt5mzcw0dvOlFIYzK6gH621I8CFzApspA
	Klthxd8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR9wf-000000073RW-43MV;
	Wed, 11 Nov 2026 15:09:05 +0000
Received: from mail-southcentralusazon11013066.outbound.protection.outlook.com ([40.93.196.66] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR9wd-000000073Qd-0euP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 15:09:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M3F6Sy/xigCzzs869iSaZrD+TmYTUTfAj7un362TryTHmle4VQAzvCuMsdDBg942BMYk6+32b7YJjNIpxjKeV7RFoPIPnNrMo8L+fFsRMLC6CfXCbJQstJOXKUYnLskaFSyYmJcJZ4dVAvhHILnIb82+LFG9m5tMidjyfuOxdgFenXEPEKMTHoDgeo77My9vC4cKynebRt8jon7pTSHl7TrWPk0/HschC9zCdBiQRDHCD47NHq6eOoN2cvXxD60ZKX9XedcDG6z8Gs5qZjLvHYPc/DlEr/Zi2mVgJ5FBmdb40qy7TS/SA24P/J7nFnfA5v5vg0HkpUuBBjQR0RBj9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gzQhxxhjyjv9tKf5vJYJXkFugI8bIvDmQWZbamV41UA=;
 b=XFjicT5dp0iohPEhoYJsDR6dcC2yBqwRPStUKrbAjTeuRkrcoi0rxKl+LaiqbLV7VkujDH5c/UO92ZS5Uq8L82CXaHxaRkJWkh+ZhdBdcXTC56XsHmctu8wFUXJ94ylsJK5SVYHR/2sE97mCnQ7fqz7+xlc8Z2odGEULOAHfC3e0Z97D7lXKB6IWY6eo06JJyw8yll6G0bcI4729aYt3rwnLrFfv8W931KsjWcgFlTPt3QCA00+Y/9DmTv84kqBvFBXq7VZFCXgGDj2BdvJ9owBVW6Qp083h2DZyWQ2zb1QZsRsQJjeMKQEoSqqURuUXKG03fJWk99cWhjBqRsVAdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gzQhxxhjyjv9tKf5vJYJXkFugI8bIvDmQWZbamV41UA=;
 b=CL6ubKcfYdVIHvuMIxgbX0WhfnHqn/eo7Akc6z0yajGq92hMEfNM205jN85ljzPv13dPD5s0IHIRkau2JjKLXNtNLpmobCzjXSZAXjpS82pBocfHBfZtDHbUAPp5+4dAY3hj0Vsu7drl79ZG8OFuOEPP0G6Y0ivz0nj519jUWZ4=
Received: from MW4PR03CA0047.namprd03.prod.outlook.com (2603:10b6:303:8e::22)
 by DS7PR12MB5765.namprd12.prod.outlook.com (2603:10b6:8:74::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Wed, 11 Nov
 2026 15:08:54 +0000
Received: from SJ1PEPF000037AF.namprd03.prod.outlook.com
 (2603:10b6:303:8e:cafe::3d) by MW4PR03CA0047.outlook.office365.com
 (2603:10b6:303:8e::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Wed, 11
 Nov 2026 15:08:53 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000037AF.mail.protection.outlook.com (10.167.244.187) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 11 Nov 2026 15:08:53 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 11 Nov
 2026 09:08:45 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 11 Nov
 2026 09:08:45 -0600
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Wed, 11 Nov 2026 09:08:42 -0600
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <sboyd@kernel.org>, <bmasney+clk@redhat.com>, <jbrunet+clk@baylibre.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<michal.simek@amd.com>, <p.zabel@pengutronix.de>
CC: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [PATCH 1/2] dt-bindings: reset: convert zynq-reset.txt to yaml
Date: Wed, 11 Nov 2026 20:38:11 +0530
Message-ID: <20261111150812.1874449-2-radhey.shyam.pandey@amd.com>
X-Mailer: git-send-email 2.44.4
In-Reply-To: <20261111150812.1874449-1-radhey.shyam.pandey@amd.com>
References: <20261111150812.1874449-1-radhey.shyam.pandey@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037AF:EE_|DS7PR12MB5765:EE_
X-MS-Office365-Filtering-Correlation-Id: 763346d5-e507-474b-5524-08df4005b318
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|82310400026|23010399003|376014|7416014|1800799024|13003099007|56012099006|11063799006|261009223027099003|10067099003|261102123227099003|261028144727099003|261021121427099003|261026121527099003|261026140227099003|261022105027099003|261021123027099003|22082099003|3023799007|18002099003|5023799004;
X-Microsoft-Antispam-Message-Info: ipX/aNw+54Y2YsSnch8xIe8XdxwkiKYWdXotBzBy6T5hUIZDvdR0nYLcRS2I3Cd2vqq+buhRKiOhjFRtOvDkAy4bxKf121DPtGeCTc8HvbT7pegmM4lngBR14Y92R3wsTom/PF01MiyPgpr7lP/9dy85AZ2UjfogdjGU7NVivxTlWTMCFWonyTuhZoR5C9SNWhAHwRzp+bYyhWAnB/vIU3a4GcXPhiS310u1PwO/rNjSNaf3dlG1NNGKhqfNzxeTOH+UJvjNzZCkLttEYJOz3N150UJa7Ie7GuceIRhl9l1hfL/fUfm8uilMBBsb+0BfEss4GpNo4oIu266TrnW1/174cdTya/TcXP4yjCT/pHXopy7MEtrkiIQs5+31GG4FMlEKX9nvvANNo8DPh+2GGxuOE1g+mYBg4yqm2gvp74aArX/P5qseOYg2xKMykuivzZe+K2KM8ly71wdjXxpSmiHZ04NnYRhxFv9bQ1Cm8bsS66sBeg/Hnc2KLJwctpwhe3IHa+VYzXm0NMmZ7qjd/eQnRmo5dH3zF2GmUE5wKNBsG1OD1BS52nrFpCbTR73mLFXlSs3qogW975tk1fFaPPxnNFaH/KsSKZ/wQDJdOYOwqQ9rA1CZmv/znLpoz7MSz5HIWW4lxxk0uDl3ei8F1g==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(376014)(7416014)(1800799024)(13003099007)(56012099006)(11063799006)(261009223027099003)(10067099003)(261102123227099003)(261028144727099003)(261021121427099003)(261026121527099003)(261026140227099003)(261022105027099003)(261021123027099003)(22082099003)(3023799007)(18002099003)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: IXsLvVsmLuRVCqV9AF21DL7Vasct2REYxo1vfJ2zo9qpVnKY6ki7TSgBeVZ1EfHH21PQ1Nd0iwp3qEgzIzZnvsq/1i48T/4CxuR+9XZSDNncuT3BV084OBlLWmLufsy+a85TzOYd4ybh2Y1nY8FoS70yi0Kh5ahRG8TcI1e1Zj+8TXB/mtajVm5np4Bb8WwGHVVAUuqIA4xeCcfHBpmUlvyO7JnUq3grc4rqXGIjz5sAFAT0SXwfLBTtdkaGYNYNmmGl9n9iM1johON20Hx00kG+IPKdwqZrk4IjJs6S4tNhRdRtkA6vONoMj/y8Mdigv4fsf3Kx+O+03S1VRsfkScvrFeNxDhGBPRBTcMiyCHO68Csf3w7HdDR4qnjKgzTq28aJnRfIgktcDun4bOBhcEyTFrt6MiMvqrccrGTAvP7/rCiaoPxRLaiHT5R562Y/
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 15:08:53.2606
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 763346d5-e507-474b-5524-08df4005b318
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000037AF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5765
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_070903_206247_659BB973 
X-CRM114-Status: GOOD (  19.39  )
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

Convert the Xilinx Zynq reset manager binding to DT schema format.

The reset output list is kept, hung off #reset-cells since that is what
the numbers describe. It is preceded by the encoding the text version
left implicit: the cell is the register's position in the block times 32
plus the bit number within that register. This also explains the gaps in
the list, which are reserved bits and, in the case of 0x23c, a reserved
register.

No dt-bindings header is added. Unlike the firmware-defined IDs in
xlnx,zynqmp-reset, these indices are derived from the SLCR register map
in UG585, and no in-tree device tree references them.

Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
---
 .../bindings/reset/xlnx,zynq-reset.yaml       | 99 +++++++++++++++++++
 .../devicetree/bindings/reset/zynq-reset.txt  | 68 -------------
 2 files changed, 99 insertions(+), 68 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/reset/xlnx,zynq-reset.yaml
 delete mode 100644 Documentation/devicetree/bindings/reset/zynq-reset.txt

diff --git a/Documentation/devicetree/bindings/reset/xlnx,zynq-reset.yaml b/Documentation/devicetree/bindings/reset/xlnx,zynq-reset.yaml
new file mode 100644
index 000000000000..a91c999f6243
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/xlnx,zynq-reset.yaml
@@ -0,0 +1,99 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/reset/xlnx,zynq-reset.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Xilinx Zynq Reset Manager
+
+maintainers:
+  - Michal Simek <michal.simek@amd.com>
+
+description:
+  The Zynq AP-SoC has several different resets, driven from registers in the
+  System Level Control Registers (SLCR). The reset manager is a child node of
+  the SLCR. See Chapter 26 of the Zynq TRM (UG585) for more information about
+  Zynq resets.
+
+properties:
+  compatible:
+    const: xlnx,zynq-reset
+
+  reg:
+    maxItems: 1
+    description:
+      Offset and length of the reset registers within the SLCR.
+
+  syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: phandle to the SLCR registers
+
+  "#reset-cells":
+    const: 1
+    description: |
+      The single cell indexes the reset within the register block at 32
+      resets per register, so it is the register's position in the block
+      times 32 plus the bit number within that register:
+
+        0   soft
+        32  ddr
+        64  topsw
+        96  dmac
+        128 usb0
+        129 usb1
+        160 gem0
+        161 gem1
+        164 gem0 rx
+        165 gem1 rx
+        166 gem0 ref
+        167 gem1 ref
+        192 sdio0
+        193 sdio1
+        196 sdio0 ref
+        197 sdio1 ref
+        224 spi0
+        225 spi1
+        226 spi0 ref
+        227 spi1 ref
+        256 can0
+        257 can1
+        258 can0 ref
+        259 can1 ref
+        288 i2c0
+        289 i2c1
+        320 uart0
+        321 uart1
+        322 uart0 ref
+        323 uart1 ref
+        352 gpio
+        384 lqspi
+        385 qspi ref
+        416 smc
+        417 smc ref
+        448 ocm
+        512 fpga0 out
+        513 fpga1 out
+        514 fpga2 out
+        515 fpga3 out
+        544 a9 reset 0
+        545 a9 reset 1
+        552 peri
+
+required:
+  - compatible
+  - reg
+  - syscon
+  - "#reset-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    reset-controller@200 {
+        compatible = "xlnx,zynq-reset";
+        reg = <0x200 0x48>;
+        #reset-cells = <1>;
+        syscon = <&slcr>;
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/reset/zynq-reset.txt b/Documentation/devicetree/bindings/reset/zynq-reset.txt
deleted file mode 100644
index 5860120e3064..000000000000
--- a/Documentation/devicetree/bindings/reset/zynq-reset.txt
+++ /dev/null
@@ -1,68 +0,0 @@
-Xilinx Zynq Reset Manager
-
-The Zynq AP-SoC has several different resets.
-
-See Chapter 26 of the Zynq TRM (UG585) for more information about Zynq resets.
-
-Required properties:
-- compatible: "xlnx,zynq-reset"
-- reg: SLCR offset and size taken via syscon <0x200 0x48>
-- syscon: <&slcr>
-  This should be a phandle to the Zynq's SLCR registers.
-- #reset-cells: Must be 1
-
-The Zynq Reset Manager needs to be a childnode of the SLCR.
-
-Example:
-	rstc: rstc@200 {
-		compatible = "xlnx,zynq-reset";
-		reg = <0x200 0x48>;
-		#reset-cells = <1>;
-		syscon = <&slcr>;
-	};
-
-Reset outputs:
- 0  : soft reset
- 32 : ddr reset
- 64 : topsw reset
- 96 : dmac reset
- 128: usb0 reset
- 129: usb1 reset
- 160: gem0 reset
- 161: gem1 reset
- 164: gem0 rx reset
- 165: gem1 rx reset
- 166: gem0 ref reset
- 167: gem1 ref reset
- 192: sdio0 reset
- 193: sdio1 reset
- 196: sdio0 ref reset
- 197: sdio1 ref reset
- 224: spi0 reset
- 225: spi1 reset
- 226: spi0 ref reset
- 227: spi1 ref reset
- 256: can0 reset
- 257: can1 reset
- 258: can0 ref reset
- 259: can1 ref reset
- 288: i2c0 reset
- 289: i2c1 reset
- 320: uart0 reset
- 321: uart1 reset
- 322: uart0 ref reset
- 323: uart1 ref reset
- 352: gpio reset
- 384: lqspi reset
- 385: qspi ref reset
- 416: smc reset
- 417: smc ref reset
- 448: ocm reset
- 512: fpga0 out reset
- 513: fpga1 out reset
- 514: fpga2 out reset
- 515: fpga3 out reset
- 544: a9 reset 0
- 545: a9 reset 1
- 552: peri reset
-
-- 
2.44.4


