Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66CB606A339
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 09:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uI42yc7T
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=tuu5N424jjfT124nXEn/gGgI162SsmpvNJc0xEtehE8=; b=uI42yc7TNtt3IAg2BEAnpEBsRl
	tWKLQcfCsSAUyo+DsL4Lc23F3EYRfE6hYXxT5f2ZH8ypbHdG21c4T/Y1E3lmZPWf0aHzj4aRTmQsg
	4xeWN/BirdXZjhP++QdhF0tr9bgWjlMOqlEe+L1pWGuCzw7wjF8DjhwmxE1BM6vnUyUX3GX5Y4+/c
	rBa7NZHp4/rrUbDD9DmUdF2x+zl3qnACQiGcM7iKNQ3/YKTQyi2prNbFe/+rNHWiK6S66es7Rw1AF
	2VL/zE21ou3xrHcnJcVi0M9M4iWMPmxU18w4LyYONynt4YFOrWEUtNhIomIiH3PmtCeXe8s0HkkCx
	M/MrbESQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFk8-000000059sS-2Cti;
	Tue, 17 Nov 2026 09:44:48 +0000
Received: from mail-japaneastazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c405::5] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFjf-000000059OI-3xD1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 09:44:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eg7fmfN+2lXWZ1UUq5ozLnxEXCP0fV/+pr+qqYW3EBgYcDeOBP3E1zryiK59fYW+/gQTBJST2AMphI4eNcXpifgQJU8Sj47Z42yZFV//3/MWPJAMEgq/UO876JpmPEypisfCG/MiVz1WlbR4FL75oFwtJnAzVQLELkvXhHUr59kVPAIMZiZQicdB5c6Tux6W261YBttnPzKqvjW63rrcpRWO6cRZ1nNolIrIrlSiFgGixT4CLQgolDS0e3p4mnnwEkyZEM8RvLn5Kmnisinc5g8rb7RFx2Ddmwo9VgPPBj7oqVM8QrdDb7Dwt2Cvu2VNo6NLOFtfVTjaqUZNR+bYIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tuu5N424jjfT124nXEn/gGgI162SsmpvNJc0xEtehE8=;
 b=mrs+tPXYyO0/GOwa7koMoTxuTOinp8nFp+nJYooV0KZeQ1uPItP7zSTkNc1Uarl1/pbhWykUEyEx6e1KwXFD7FZ2H+EJhF7y/q0KaJZlHMhJNQUb/WLQ8hu1+1wcXgt1bWzM+6zNCifxE2LhVe4HlmwWLWS33K4PGOETiT0ZpSiARDuERjo2yJ3nv0V8zz5zS97CYQ3/jQM4qK7AWUAi7PEjeHOrOLbUhBacMMMY04ES2AjIGIXR774mGzeq0jnKaHTd787PpBAwbjQ5mU8Y0NGZSLuIaqIJ25uPfCY5c9V+oec1I8NxgSxBrpuwRhhoO7PaNO2GezpdtPZvP7aYpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI3PR01CA0011.apcprd01.prod.exchangelabs.com
 (2603:1096:4:296::6) by KL1PR06MB6164.apcprd06.prod.outlook.com
 (2603:1096:820:d1::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.7; Tue, 17 Nov
 2026 09:44:10 +0000
Received: from SG2PEPF000B66CD.apcprd03.prod.outlook.com
 (2603:1096:4:296:cafe::90) by SI3PR01CA0011.outlook.office365.com
 (2603:1096:4:296::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Tue,
 17 Nov 2026 09:44:10 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CD.mail.protection.outlook.com (10.167.240.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 09:44:10 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 08C72427EFC6;
	Tue, 17 Nov 2026 17:44:09 +0800 (CST)
From: Jelly Jia <Jelly.Jia@cixtech.com>
To: vkoul@kernel.org,
	Frank.Li@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	robin.murphy@arm.com,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	tglx@kernel.org
Cc: devicetree@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jelly.Jia@cixtech.com,
	linux-clk@vger.kernel.org,
	joakim.zhang@cixtech.com,
	radu@rendec.net
Subject: [PATCH v4 1/5] dt-bindings: soc: cix: Describe the Sky1 AUDSS DMA IRQ controller
Date: Tue, 17 Nov 2026 17:44:04 +0800
Message-ID: <20261117094408.1393837-2-Jelly.Jia@cixtech.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261117094408.1393837-1-Jelly.Jia@cixtech.com>
References: <20261117094408.1393837-1-Jelly.Jia@cixtech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CD:EE_|KL1PR06MB6164:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 44cc98de-7bdd-42d1-537c-08df448f54fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|36860700016|376014|23010399003|82310400026|1800799024|921020|56012099006|261022105027099003|261026140227099003|261026121527099003|10067099003|261021123027099003|261021121427099003|261028144727099003|261102123227099003|261009223027099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: BQRLtUlI4TjrmnM7TOHDB5LDw+6CDEtCHhV8+V862Py2ifJC6+bnmw5Zu6JLh7jmE4qAAUbeZ97I01ejGWQkeDOoBlvpfEWaysJjcnk2frv4R4MjHZcMDeHp1Zcne9e0w4wCZiaxrpDUSpR1FtFam50utjVyzUssIVeKGcwHeQfmWcNjDB1wDXahNROrjSenHYt08W3HfTZDoJxzBh5f8cAKK01GxHeqrrxOL+RdoM+I5C6UCbfx2M4q8LO58OL7kUYdGJxQIPSSDnooEebMxVFhqtvhBh+DezunEYSv2d2R8qI0UGFRKG4ARH1H+QES84mbbFWQ/GMgse0g7Ac1fKiM0OnCStOuGvyv0AnFvQj4FOJdgNK0eFrPHDxgK//EebxIGisd7d8I8QEi6Hx3gZQT2gi76oIXpSq2yJaXaqKf0CwGp6lrDA6XNhwm0mA8swfM3bSDBu5XkndeFnTNa2nPAp94eX7x/VHuSOwsjUAhA8B4q7bWmWivnx1FR5nGBavMHhSqz9jN+fw9X9qVz1wdlP2cmQ8fzMRu2+K6ptZ3qMB+eh1Mq/Zvh9dyuBVbjFfrw/I3hdvmXn6l1wx/HIy8cxCrzlbykLY1rKWgytlhJRy2sg3y8uK1MTW5loLXsLyw9fkVstp1yMUjpMcqHSrzBRw+cgm53wT4224DNIggDD5duXFGL5Q2FjYqAFipOAKzMc4S7Pme/A3NSUt05kAk6cmdHNhCdelDfX6Fe2B7iOSCDoB5jiieH/J6DvVP
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(36860700016)(376014)(23010399003)(82310400026)(1800799024)(921020)(56012099006)(261022105027099003)(261026140227099003)(261026121527099003)(10067099003)(261021123027099003)(261021121427099003)(261028144727099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ZEWLkuEx2UQMfLWCKvOJP4wMAdFABBUw/OlPqAE8JQPvq24xABC/scgsVvQTefUn2QHbM9JZMczAWGnHetpg93W/suTgwyOtviEi9+OCcCGpP+noIE6bqB+fYI9LCZ4WchIApPaQ8Ti4xwY5Sbyo4s9PGOMMBBdG5JR2P6a4H9dv2ExTNIFTWnhOqG5Jgd5lC4Zjy1aaGjWWQizSw1rF50qwMe+aq9oLEmG13S2QD+xaAkoFPcULblb6HzHzpY0OgINRC3TjLojMszU8uZPS17tW5fltfL/5joSqYv4QCjZntLiO6StAf/Iqx2QANFBdNjY8bqG25tHwg+c0KU31qpWJaUh4bgmtlpO1fHV466oSma+o0JUGuKB/jhnVh5Z0jOtsZ4Zg7zspzALXq8FEruGXciIjXup8UBgbYfUjrPsdFt5VaDXKbHeJEYALPcTa
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 09:44:10.4804
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 44cc98de-7bdd-42d1-537c-08df448f54fb
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2PEPF000B66CD.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6164
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_014420_039651_3375C046 
X-CRM114-Status: GOOD (  12.18  )
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

The AUDSS CRU contains a separate AP interrupt gate for each of the eight
DMA-350 channels. The enabled inputs are combined onto one GIC interrupt.
These gates are part of the CRU register block, not the DMA controller.

Describe the CRU as an interrupt-controller in addition to its clock and
reset functions. A child interrupt specifier contains the DMA channel
index, matching the corresponding gate bit; the parent interrupt is the
combined GIC line.

Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
---
 .../bindings/soc/cix/cix,sky1-audss-cru.yaml  | 31 +++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/cix/cix,sky1-audss-cru.yaml b/Documentation/devicetree/bindings/soc/cix/cix,sky1-audss-cru.yaml
index 50dd0593e1d9..01fa22a5dd72 100644
--- a/Documentation/devicetree/bindings/soc/cix/cix,sky1-audss-cru.yaml
+++ b/Documentation/devicetree/bindings/soc/cix/cix,sky1-audss-cru.yaml
@@ -28,6 +28,12 @@ description: |
   The SoC syscon NoC (or bus) reset is described via resets. The audio
   subsystem power domain is described via power-domains.
 
+  The same register block contains the eight DMA-350 channel interrupt
+  gates at offset 0x54. When the node is an interrupt-controller, the
+  cell is the DMA channel index (0 through 7). The corresponding gate
+  bit is unmasked while that interrupt is requested, and the eight
+  inputs are combined onto the parent GIC interrupt.
+
 properties:
   compatible:
     const: cix,sky1-audss-cru
@@ -45,6 +51,18 @@ properties:
     description:
       Reset indices are defined in include/dt-bindings/reset/cix,sky1-audss-cru.h.
 
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 1
+    description:
+      The cell is the DMA-350 channel index, 0 through 7.
+
+  interrupts:
+    maxItems: 1
+    description:
+      Combined DMA-350 channel interrupt after the CRU gates.
+
   clocks:
     items:
       - description: I2S parent clock for sampling rates multiple of 8kHz.
@@ -75,18 +93,27 @@ required:
   - power-domains
   - resets
 
+dependentRequired:
+  interrupt-controller: [ interrupts ]
+
 additionalProperties: false
 
 examples:
   - |
-    audss_cru: clock-controller@7110000 {
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    clock-controller@7110000 {
         compatible = "cix,sky1-audss-cru";
         reg = <0x7110000 0x10000>;
         #clock-cells = <1>;
-        #reset-cells = <1>;
         clocks = <&scmi_clk 76>, <&scmi_clk 78>,
                  <&scmi_clk 70>, <&scmi_clk 71>;
         clock-names = "x8k", "x11k", "sys", "48m";
+        #interrupt-cells = <1>;
+        interrupt-controller;
+        interrupts = <GIC_SPI 230 IRQ_TYPE_LEVEL_HIGH 0>;
         power-domains = <&smc_devpd 0>;
+        #reset-cells = <1>;
         resets = <&s5_syscon 31>;
     };
-- 
2.54.0


