Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA96606A329
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 09:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=i1c6uTSS;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=3aN400iC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9cgxFUD35xxC0oEEKI4aWaMrt5OYPKHLBsoS22dFbxQ=; b=i1c6uTSSmlzIlpyb1IZN5dg7nM
	Ey+QUkf0YAB/BmzTpvaqIHptonos0r8+maN5YOKXXuxKh4AfHqziHSG1jCRO0wk2FGYK0MGUpykbe
	upTz1UCijfgRxCfIOG5HHaVqRDrTuCWdt1tSzhg5wIump3V245gYh/VqoOhTbc3lc1Kr4qxwdoemf
	0PtvXLJOITjc91diGrSeAVFgQ5fwQF/WRL52uvRV4cEpwvDMa6fQ0TeK9aPiNGWQgBYPe11NDo8K7
	dHMPYrGVRjT67mG1+ohZETF8KEbiy0IIzZLY4gc/nA0Mvv/TqNK9gVX9SjNozuyWq9CjKoNKCxe40
	x/bN0nyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTF2x-00000004zpG-0GFX;
	Tue, 17 Nov 2026 09:00:11 +0000
Received: from mail-northcentralusazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c105::5] helo=CH5PR02CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTF2r-00000004zko-3FYV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 09:00:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZFKlJqReqH7vSxEoOrE0jJeboVbsIOJN3HC21QNIz1OyZnOMC6ZtFNQ38zxnLGjYou9aOPU3MLcZd/La9U74Kq49+lQvOnMp3w2Wdviy5DCjH/1dovfgDq5wTjR9p0strG4X5M/N+ui4+b0UQKaXTG/xo5XmpHeZv7MdMZDyuxT9nz+afqYgghk8nR3GFyJljQUGCKmSYjfbgOPHF5JVkKkSbiqesoLbh1rQcyV7pLIXOTxezwYvrKaIaUz2iufxTyGfHAConnQpd9ok9xjDByAuqBa+kcHAd+XMwc/bxXVZWlBbyIODiJWRV3IKNF5/TU0lu1WhewvlWoe1NY/c/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9cgxFUD35xxC0oEEKI4aWaMrt5OYPKHLBsoS22dFbxQ=;
 b=FmmITGPix9pVPU/EBa0bLVSfg6ug4gakE6gVwbggeokG0H2dCKE/2XkSwYQe1+TctgizZcD8h46YO1/mZFLNR8C1fnDDz73LFh85RJiAFITltTaDL0L16PkEOFG+3zr+G+AqcoeUnK7nnNFnJNcVgKjLCh9uC7OOOJC4Oo+lInZjh/EGIdIhJ27ZujspfmRAjokPSBYgp9OOK07xrfCt055F09SGj9e5dFecccBJrMbYDg4UyBGHzxjC9xb4ZiMguWqrjHj9hXaSMnRlybYJhbGAQ7SKCd/rpLfqnq9fkMZfwektHj/8U/XzTnUF3Z57uTiipi5umbBYLQpkSZO52Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9cgxFUD35xxC0oEEKI4aWaMrt5OYPKHLBsoS22dFbxQ=;
 b=3aN400iCqUOL0W9PIya2r97ZC1bzvsKXlIoLLyp/wA95UG5TLO43E0vjZOn4mvDMgC3/DEdZ80rdtN2qgrbjffVz3hrKoOxLoVD4qyjuGzou5d500ametWhZqS7kjS4OtNrWgpFO1OvvCZu4p6YzD5HiTscuQ/oTHEYY1BcbWds=
Received: from BN9PR03CA0585.namprd03.prod.outlook.com (2603:10b6:408:10d::20)
 by SJ2PR12MB8184.namprd12.prod.outlook.com (2603:10b6:a03:4f2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 08:57:53 +0000
Received: from IA0PEPF0000003D.namprd03.prod.outlook.com
 (2603:10b6:408:10d:cafe::2) by BN9PR03CA0585.outlook.office365.com
 (2603:10b6:408:10d::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Tue,
 17 Nov 2026 08:57:53 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 IA0PEPF0000003D.mail.protection.outlook.com (10.167.249.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Tue, 17 Nov 2026 08:57:52 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 02:57:52 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 02:57:51 -0600
Received: from xhdrdevl202.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Tue, 17 Nov 2026 02:57:47 -0600
From: Dhanunjanrao Katta <katta.dhanunjanrao@amd.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	<linux-sound@vger.kernel.org>
CC: Vincenzo Frascino <vincenzo.frascino@arm.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, Michal Simek <michal.simek@amd.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <git@amd.com>, Dhanunjanrao Katta
	<katta.dhanunjanrao@amd.com>
Subject: [PATCH 1/3] ASoC: dt-bindings: xlnx,spdif: describe AXI4-Stream and audio clocks
Date: Tue, 17 Nov 2026 14:27:37 +0530
Message-ID: <20261117085739.3807943-2-katta.dhanunjanrao@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261117085739.3807943-1-katta.dhanunjanrao@amd.com>
References: <20261117085739.3807943-1-katta.dhanunjanrao@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PEPF0000003D:EE_|SJ2PR12MB8184:EE_
X-MS-Office365-Filtering-Correlation-Id: 780c880a-bfcc-4325-7301-08df4488dd61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|36860700016|23010399003|82310400026|10067099003|56012099006|11063799006|261026140227099003|261028144727099003|261021123027099003|261021121427099003|261022105027099003|261026121527099003|261102123227099003|261009223027099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: eAkFuIV6VEcOPxdubH4B6uZWW/S/oSy9l3f0AXyyZCE7b7rbgHGcYemNmuk1ehWRmNaqQtHbDsDCAJ5MKKLDu1RJgvGTkgSnX0mfL3xk/PM7WPAjxR0zTaj0e9jfCys+mnmopyiJG3v6IBbdDnJoPaACzMUZ0EJj6kQJD/W09HIFddSnvHIN9pueO0cJ2/J7Nw9qWAFYd/ie400MWK/zO2KFQeFPbLYWtgB2WwCXkoIJQim7wJ1brteY31mpBBv9EfgD2d+7ujDF5CjnnvGIMJ0Oacd1slrxwPwoHDuwptGQ3Z/Wzr5Jqu58iJkJxFoGGD7Drc2pl4LMjNzJhdoEqz0JfqdCM/HLbpqm3PM34v0w9/tdJrXTYaQE3ZA7WYrM39w8KwNPkauZUVI2pV0droelrzigIJksRYi9P1mkTwviqqdW5A7L8udRxTwto9hC+10SDZ3c1HQeg7/DegZqoX8QtLy1dknoE2m1gSSPPKoc+NS5zbhgYODYhUJWWy5Y64XgH84gxUqpKG3tcHDSNwZjWMrahnNvJC/M4ThafBCMWk0CnzPU4V6CEd7gT+tDEObpwHvZSxvYPFqAxI3aOHMFjGjd0UHnGaLOlPan0NC9bzivT8z4KUonsB4xTvnrEp8GJrCqiX0dcDhaYfVH4Zce4/7URw1vc0TQMdUF1lBKEOzMRuppMkfwQgcOpMQq6ujo/OvxbRYxUkYX9Qjyew==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(36860700016)(23010399003)(82310400026)(10067099003)(56012099006)(11063799006)(261026140227099003)(261028144727099003)(261021123027099003)(261021121427099003)(261022105027099003)(261026121527099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: lA0v3efLF969mEgPDeiQsE/iPUfgcOGbCIKcrgDMGa0qFlHaCDTNeulaZhcrzC7uyVzzfb30rCS0PaUbGWJ+h26At0Agbf2K9uFVDYkDkFYhFf82Ab2inobRmKHktYc4Vl1C27m9NDaujlrR2yLKhT7xhnxLwcK38RtFONrqIHmGJBziZC9gsnU6XN0Ux2tiPQ2JOj4jepLhFfwIihiTwXNAeju+tahbDlHfmMmCWENT5Wy1ukeiYHJ7a9kkcu6n+aC+7Xq7umGqA2bcrp5s2wdYbZ3A+LfkaKvjM271e15AoIFHapoTzpgeLF/hcV/PAnF2CYVFRwwTmdlcSvQxLs0f8YO4fHwQg8BF1JKNGy9/c6ySYuMYMqb3uxKqvE4ztyQBm55mCEcB85rEMl9NvpEXao+RtgY9xYeQ1X0HwwqrYYX9oxPWK2KR7OnMR8sS
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 08:57:52.9967
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 780c880a-bfcc-4325-7301-08df4488dd61
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: IA0PEPF0000003D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8184
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_010005_933788_7B227F49 
X-CRM114-Status: GOOD (  16.21  )
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

The SPDIF IP is fed by three clocks: the audio clock used at the
SPDIF/AES3 interface, the AXI4-Lite control clock and the AXI4-Stream
data clock. So far the binding described only two of them and carried
the audio clock frequency in the custom "xlnx,aud_clk_i" property.

Describe the AXI4-Stream clock and pick its name from the IP mode,
s_axis_aclk for the transmitter and m_axis_aclk for the receiver. The
minimum clock count stays at two, so that device trees written against
the earlier binding keep validating and the third clock is effectively
optional.

Mark "xlnx,aud_clk_i" deprecated instead of removing it. The frequency
it carries is available from the rate of the audio clock, but the
property is part of the published binding and device trees in the field
still pass it. As the binding sets "additionalProperties: false",
removing the property outright would make those device trees fail
validation.

Make "xlnx,spdif-mode" required. The conditional that selects the
AXI4-Stream clock name keys on that property, and a conditional with no
"required" entry of its own also matches when the property is absent.
A device tree omitting the mode would therefore have been held to the
transmitter clock name by default. Requiring the property turns the
omission into a clear validation failure instead.

Signed-off-by: Dhanunjanrao Katta <katta.dhanunjanrao@amd.com>
---
 .../devicetree/bindings/sound/xlnx,spdif.yaml | 54 +++++++++++++++----
 1 file changed, 44 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/xlnx,spdif.yaml b/Documentation/devicetree/bindings/sound/xlnx,spdif.yaml
index a45d8a0755fe..a4abca2027d3 100644
--- a/Documentation/devicetree/bindings/sound/xlnx,spdif.yaml
+++ b/Documentation/devicetree/bindings/sound/xlnx,spdif.yaml
@@ -14,6 +14,28 @@ maintainers:
 
 allOf:
   - $ref: dai-common.yaml#
+  - if:
+      properties:
+        xlnx,spdif-mode:
+          const: 1
+      required:
+        - xlnx,spdif-mode
+    then:
+      properties:
+        clock-names:
+          minItems: 2
+          items:
+            - const: aud_clk_i
+            - const: s_axi_aclk
+            - const: s_axis_aclk
+    else:
+      properties:
+        clock-names:
+          minItems: 2
+          items:
+            - const: aud_clk_i
+            - const: s_axi_aclk
+            - const: m_axis_aclk
 
 properties:
   compatible:
@@ -28,15 +50,15 @@ properties:
       - description: SPDIF audio interrupt
 
   clock-names:
-    items:
-      - const: aud_clk_i
-      - const: s_axi_aclk
+    minItems: 2
+    maxItems: 3
 
   clocks:
-    minItems: 1
+    minItems: 2
     items:
-      - description: input audio clock
-      - description: clock for the AXI data stream
+      - description: Audio clock input used at the SPDIF/AES3 interface
+      - description: AXI4-Lite clock
+      - description: AXI4-Stream clock
 
   xlnx,spdif-mode:
     $ref: /schemas/types.yaml#/definitions/uint32
@@ -49,8 +71,10 @@ properties:
 
   xlnx,aud_clk_i:
     $ref: /schemas/types.yaml#/definitions/uint32
+    deprecated: true
     description:
-      Input audio clock frequency. It affects the sampling rate.
+      Frequency of the audio clock input. Superseded by the rate of the
+      clock named aud_clk_i.
 
 required:
   - compatible
@@ -58,6 +82,7 @@ required:
   - interrupts
   - clock-names
   - clocks
+  - xlnx,spdif-mode
 
 additionalProperties: false
 
@@ -66,12 +91,21 @@ examples:
     spdif@80010000 {
       compatible = "xlnx,spdif-2.0";
       reg = <0x80010000 0x10000>;
-      clock-names = "aud_clk_i", "s_axi_aclk";
-      clocks = <&misc_clk_0>, <&clk 71>;
+      clock-names = "aud_clk_i", "s_axi_aclk", "s_axis_aclk";
+      clocks = <&misc_clk_0>, <&clk 71>, <&misc_clk_0>;
       interrupt-parent = <&gic>;
       interrupts = <0 91 4>;
       xlnx,spdif-mode = <1>;
-      xlnx,aud_clk_i = <49152913>;
+    };
+  - |
+    spdif@80090000 {
+      compatible = "xlnx,spdif-2.0";
+      reg = <0x80090000 0x10000>;
+      clock-names = "aud_clk_i", "s_axi_aclk", "m_axis_aclk";
+      clocks = <&misc_clk_0>, <&clk 71>, <&clk 71>;
+      interrupt-parent = <&gic>;
+      interrupts = <0 90 4>;
+      xlnx,spdif-mode = <0>;
     };
 
 ...
-- 
2.34.1


