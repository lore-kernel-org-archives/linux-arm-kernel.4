Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1388960A2633
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 09:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mMfIG5oq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=X2cMsRZqMQ7M/EZqaDKYLPmZctGveh4gtjthS3iH5zk=; b=mMfIG5oqXj81GFt/XYcc475yV9
	nVNzhWRyJAHcfb8jXZvp9GQ/Bn9IOjQ06Gx+OmaEllh/vHEnS+hkhGlOoE4ZZ+XOip+4b4J+N1UGN
	m/2TaNxFiLk/aV85NqBJjQ/TWZmxhKShxOSq43NOoH44lT/agbJkaLlbyeYxdmr8q/vEW4M2vEH7C
	16F+DMsTeAWmmPLHj/LF+23cjule4PU1gBGNhEfL3zioyo7w/onZxLj0fH98DIOTU7Oum4DJYGqpJ
	s3f/1I9cQNkOOgT1bQ7gSW4JtYyp6UgPoZxO0hKdMSUIxkg66DxYWxshx1udBgpmnLhok4dfSFr0b
	tvOt2kOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFjL-000000058y1-31c1;
	Tue, 17 Nov 2026 09:43:59 +0000
Received: from mail-japaneastazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c405::5] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFjA-000000058om-1Y9J
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 09:43:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HHze/ZsWI3p28i0IR4B03lOSldM9oOGofztnuSWVaPQ3yVQILERtLJTvmvPlhszt6VTt17u9nLIiT4rGqrPnE/WRedOCuchW88qKUujaCfMp82O3hAsB2aR82VmMqUbf42QNq96R+IONSUUKCrJ/dfPTVke0gYYcJvVY80CUdvgQIicwL02Cj+iLhN1CV4wdk/mqQBE9XRLn5jhRJHoWhVsaXo7Q28zpv3Ps5LSphrDsDipK2D59GP4HXb35x7JeTqmrpbR2G+k4hf2KkF2nffPFshfWXiEhkjS4MzdfMYQj3qjDDrewSyWRgSRwlk3DH5Orjh52IJdJv7TLu2hiBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X2cMsRZqMQ7M/EZqaDKYLPmZctGveh4gtjthS3iH5zk=;
 b=mnIskILF77XXqYrVU/nV+Te4GJtWsQ+m9IaR/crxUOsi7FNAjuXDp8AeE+qlrfI9u3otXjOBKMHjazp2JcCjWaMy1Jxj5ohsnqWAppfmVcxmk1fjLFiu/EiQZ2tigImqKsInuaf+AFNqbxyyanCU0U7IBeLloMNObc9qscekOcgH6JFDGYfgnPgducgMv5NVIo2y5cj6BMgk1b/7exGWz+ZhVtoz/aICE5yCkRKh2YTVEiEmkwsZHTCt4sN1rFFqgxSpLojCyi079V3neYFHhqH9NcH7GP4UfiWc1ixwSRm1lllJyqV/zo0C8Ge6kULTy4udzp6Uq9Ni9Uw3hu81nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR06CA0007.apcprd06.prod.outlook.com (2603:1096:4:186::9) by
 TY0PR06MB5593.apcprd06.prod.outlook.com (2603:1096:400:31e::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.7; Tue, 17 Nov 2026 09:43:42 +0000
Received: from SG1PEPF000082E6.apcprd02.prod.outlook.com
 (2603:1096:4:186:cafe::b) by SI2PR06CA0007.outlook.office365.com
 (2603:1096:4:186::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Tue,
 17 Nov 2026 09:43:41 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E6.mail.protection.outlook.com (10.167.240.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 09:43:40 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 388FF40920F3;
	Tue, 17 Nov 2026 17:43:39 +0800 (CST)
From: Jelly Jia <Jelly.Jia@cixtech.com>
To: vkoul@kernel.org,
	Frank.Li@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	robin.murphy@arm.com
Cc: devicetree@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jelly.Jia@cixtech.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v7 09/10] dt-bindings: dma: arm,dma-350: Describe the CIX Sky1 integration
Date: Tue, 17 Nov 2026 17:43:34 +0800
Message-ID: <20261117094335.1393735-10-Jelly.Jia@cixtech.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261117094335.1393735-1-Jelly.Jia@cixtech.com>
References: <20261117094335.1393735-1-Jelly.Jia@cixtech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E6:EE_|TY0PR06MB5593:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 33b4ee82-fb9f-4a19-8ade-08df448f42fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|36860700016|376014|23010399003|82310400026|1800799024|56012099006|261022105027099003|261026140227099003|261026121527099003|10067099003|261021123027099003|261021121427099003|261028144727099003|261102123227099003|261009223027099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: tBNTkTb8V2o5uYaQDM2AnvYZWh8Rr5SF62btL8hwiHgxz+FxGFOdSvxZCSN6FknhwqNQS+QjKY8/UMO9gDWLsJlCpH/QZQ9C/LlpZUtVbcZ34kyuPcUWLjVWD7pYqFSU1SUAc7Ja0YeQWdawzt8JiRJl8UNjj6PvWvXv9qk/m7tfEbDl/6PkLNbAigJjmGTXxAvpBnoffWGofBj9WyQiC+/kXEX3RRqBzbg3axKVC3fb219vaYc7eb67IrAmTrC7RB0oQWyjiW+T9xMjp54rddn63RXhz0iaMWZEr9VN8Hff/RWdSR+adRky4K/b66e7RwPgQWUk6GN4tgnRMpUemS18z/VCXxgoc+yoReOJwr9y4I4bmbACu3rY3CS6hcjjLHZJnz/Wqq02Rdbh25tJcXauCNX0SM0mXw7U1JkLmBOLBvIsK42G4dzBE8E+cNYiWKM64TkFJ7JmVHuMZ8SyEwzHPf2SRo1jIXvZQQcbWHVZ9BZqiOq+n9VlBLlWDiNKzGfkNAYnqEYxVImCymuvUPLj738T07ml50yKmeZYk/44c1ZKqzC4qBmXphZ8m3CimVFOWaDj4lF0/BfC4v7ox5oYZwal3FCDoeqi1YcBUgX06NpuzoFicjTq27UztDPMAPiwrrwyjKbastsRn1r6CcK890OHyWKI80/nSurE5pCSjhumEg5FQO95wb3xBiG/IvrG2IjpzOrA8/wQGEsDcg==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(7416014)(36860700016)(376014)(23010399003)(82310400026)(1800799024)(56012099006)(261022105027099003)(261026140227099003)(261026121527099003)(10067099003)(261021123027099003)(261021121427099003)(261028144727099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: gJj0lUgIZaaN2v3uew75O+lACRpTPuSxwXbBj5BGMLZY/EWuWz5tVimqm/jR+dHuNyOZa+/HTcwTM+juGmhatqK1BbnNsm4hhkajPmyb7ksyskIfcND0qSLY4TxQb9QM0P40DCQwapQW2bEag7vOWtidvbaAskJYHVnN30K5UchBL62PH8VvgnSmb3xx/wo5jIEcbXN4i2kX/Yu+Rcw1sMNEjQfETUm9QLU/kTr09GPYyhVBbFer9S2hl+prDcf+jVgtVmn+PW0o0QKpRAHdkLhedJPW109bZ7kiZATOuV5MIhpUmTXsRMBvTqyheGXfX3C/SSy2xzX4llGDWmVbA34gD+1AvwC+v7wclkHibapdZ4uyODco4+4i5HGEjOPjv1kRXOTmGu4ZT4Za8dY+Xc8KSgsXy1RfWxOEMkpzDLOAY6ZjbBCFk7yKVfyMfdE9
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 09:43:40.0936
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33b4ee82-fb9f-4a19-8ade-08df448f42fb
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG1PEPF000082E6.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5593
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_014348_470106_4D31B1E7 
X-CRM114-Status: UNSURE (   8.83  )
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

DMA-350 integrations may gate the controller with a bus clock or hold it
in reset. Describe these standard resources on the DMA controller node.

Add the CIX Sky1 compatible with an arm,dma-350 fallback. Sky1 requires
a bus clock for both its FCH and AUDSS instances, while only the AUDSS
instance provides a reset. Require clocks for the Sky1 compatible and
keep resets optional.

Both resources remain optional for the generic compatible alone, so
existing device trees remain valid.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
---
 .../devicetree/bindings/dma/arm,dma-350.yaml  | 30 ++++++++++++++++---
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/dma/arm,dma-350.yaml b/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
index 429f682f15d8..eab3b31aeba7 100644
--- a/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
+++ b/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
@@ -9,12 +9,13 @@ title: Arm CoreLink DMA-350 Controller
 maintainers:
   - Robin Murphy <robin.murphy@arm.com>
 
-allOf:
-  - $ref: dma-controller.yaml#
-
 properties:
   compatible:
-    const: arm,dma-350
+    oneOf:
+      - const: arm,dma-350
+      - items:
+          - const: cix,sky1-dma350
+          - const: arm,dma-350
 
   reg:
     items:
@@ -36,9 +37,30 @@ properties:
     const: 1
     description: The cell is the trigger input number
 
+  clocks:
+    maxItems: 1
+    description:
+      Bus clock, where the integration gates the controller clock.
+
+  resets:
+    maxItems: 1
+    description:
+      Optional reset line, where the integration exposes one.
+
 required:
   - compatible
   - reg
   - interrupts
 
+allOf:
+  - $ref: dma-controller.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: cix,sky1-dma350
+    then:
+      required:
+        - clocks
+
 unevaluatedProperties: false
-- 
2.54.0


