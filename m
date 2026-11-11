Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC4D606A89D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 10:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PET6AGm3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=5dU63iyK2TdlVk8neNqkJILw/3rQx/WMk4I9zLgIavw=; b=PET6AGm3okPCOekRQH1eUPGWgv
	sZVx5lcZ7HynQs5Fg9PRcAFrmWydohGpTlQUOejYKor/0WwZcokLImpJptr4r3wzMI1SaItGnCha5
	b3v9ttyc/+7KuUpNs6WWFcVX6WV/kL724gY43oIDGCbz/183fvwz/Rht71xorfZuaMi7egFwnHeVG
	lfj5XAtxHdxOoUrEaUJFoqx363ePIopDbzvAfg6EaSc4RwauukYu6SzgTqZlr7ddJJgBeB/sus+ha
	DtKbNtOmGmJkXwLdNdc5P5SZYuOi9v808lkvzTphKI8FZCq+bn+YjEq3DuUImTsJT9uNC/gLyqjJ+
	h8cZUp7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR5kS-00000006ND7-0BvK;
	Wed, 11 Nov 2026 10:40:12 +0000
Received: from mail-koreacentralazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c40f::6] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR5kO-00000006NC2-15LO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 10:40:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZPIy8Q3iVrImABOuZZF695GXPDxwjhglQGpSr7OvKg48PMPRgN41XLw8ze9Ki517N0LAS8E7aOuY5umx3s4RecTTWqMURyibP3wUP5tNRTNgrXSHDJz/y5fuFpn1fRg7wgzpXwUFVv/J/fE5k1DaIQpIzr54pAf5BVTNglyooXwxUqJXn++nG9prOu4vsztt7HGQ5RqeviooBL329t+y2BliarbfHOS8ZBOtcPKwA8EIYAIVazcxSF0q3uMo4FG3z/GaZE8zFEnZgbpkYzfseECpnI9Yl9ePD7NMNfq9vvxvAKYp+uqax+76Z2lAHOnRz3AivhWR56idOxbErNu9Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5dU63iyK2TdlVk8neNqkJILw/3rQx/WMk4I9zLgIavw=;
 b=KlgAzMSQc1T0cSMr5gTc7ayB2fMJnNh/M5YdX7WduxI03ichGUCKnyC298/nQLfWL5BzJDrIYCrNFHouagqmMJSuO1nln/b8S9N7+ghrLTnLEwUfqE8nL+0/A3JjZ83fWSZOzP4t1lLxBzUBS30yULUvwps54X1/2tlfMslBBFt5ZQ53X2h197d8JlFr/0u33eiPZ5uS6tMCBafwjWmHXr5/xNlYl7qAYjShOGu3KhhxS0M47RWTDHv98n7dZqEoGZ+USrRksVN03MEaZKR846U8KPPeOxo6aKH8G7ltGSY7V5kgvpm2LSwY+jz3GeNW3Chzm6QnwVmPEMDHsR/lGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR04CA0003.apcprd04.prod.outlook.com (2603:1096:4:197::23)
 by JH0PR06MB7295.apcprd06.prod.outlook.com (2603:1096:990:a9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.7; Wed, 11 Nov
 2026 10:39:57 +0000
Received: from SG2PEPF000B66CE.apcprd03.prod.outlook.com
 (2603:1096:4:197:cafe::30) by SI2PR04CA0003.outlook.office365.com
 (2603:1096:4:197::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Wed, 11
 Nov 2026 10:39:56 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CE.mail.protection.outlook.com (10.167.240.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 11 Nov 2026 10:39:56 +0000
Received: from cix (unknown [172.18.64.61])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 239674102E74;
	Wed, 11 Nov 2026 18:39:55 +0800 (CST)
From: joakim.zhang@cixtech.com
To: tiwai@suse.de,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: cix-kernel-upstream@cixtech.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Joakim Zhang <joakim.zhang@cixtech.com>
Subject: [PATCH] ALSA: hda: dt-bindings: cix: add hda dma memory-region
Date: Wed, 11 Nov 2026 18:39:24 +0800
Message-ID: <20261111103924.3395516-1-joakim.zhang@cixtech.com>
X-Mailer: git-send-email 2.50.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CE:EE_|JH0PR06MB7295:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 5d0a490e-7db4-4882-475d-08df3fe0210f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700016|7416014|23010399003|1800799024|82310400026|10067099003|261026121527099003|261026140227099003|56012099006|261102123227099003|261022113327099003|261009223027099003|261022075727099003|261021123027099003|261028144727099003|261022105027099003|261021121427099003|18002099003;
X-Microsoft-Antispam-Message-Info: iy5/a4pXvnjUB1h89oNS1nDoawaOVoDjFCkZhdbONY9eTo2Hk3JH9pvGjpTWUOPRqPtxCrXl7M+XglbIhFCEt3ZfK4PqbJXLBHczRDEqrYc0gWEhLzVS1Hd/C3Y2vHR1nzJ5RM9nBzTYaNGhddXFb3a6v0tmfKt3Gy5+ZEsTFplwvJbxdQ4eoyB4QPWGT1YxQZgZ+7+MJnGoq3/50nwV63+aTa0JvSTRB0E2HYwYRKF6AWwS1Go+uxW/MmOonM81Z5Ka7IpVTcz7hlY7f5+/nluJAA7ZdDHpX8FFHp0qnR+Mf/yb+LMZyjnz4fIGqqhBM7Kkub0PRajyolDAN0+s6cVteudhqDr5vaSjE2KWyh0MJf2mMPrTEBMgA1p6gqO88raIXfvHRssZx4FMxTeVti60mrgVumqFwdYCUuWtSk3hkMmGcB2XmWXgPOnkea2h3x1jVOBEyANRkPAbznLg1ELo1jVU8Q0B+VY3EWm1j7wK99tNv77zvDc+IFU9/blSmv3UxBO2RhTCEb55XBC9mm/otRgDmDmV+AiXcEdtXLwDdWJKOJUZePw/3zUGZDO0dl25i8vOvH6zw0cN9o2jBOO4UdLoolSbzpS+XRwCsX4jMkSzQOIHJFQymPhn15qN+fVDwUS+L1Wtv+Q9oAdoRC4FN8qm/Yu6euAIIMsNySWlLAOA30Hty2sWHn4kQIUv5XBSgzdgbEs2BGrPz2ZY1w==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(7416014)(23010399003)(1800799024)(82310400026)(10067099003)(261026121527099003)(261026140227099003)(56012099006)(261102123227099003)(261022113327099003)(261009223027099003)(261022075727099003)(261021123027099003)(261028144727099003)(261022105027099003)(261021121427099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: v57NzvjQwG7RygBZ67M3639krswWEvkHKdwcBKyzYtm9f0OKR/JmD92KeRQfQzt4ozhpozR9fLWj1pI24S5c+mnIrRAxoLtBjWR38qUl8ZkpU61G34n9osRAEIbwRBgIAceBMYtK0c2iGr1chl85Vp9rz/hAHjtJm0jXYED42lESl0f7Rjelwg7v1KhdPwNI0bpA5MzBnZcM/i+XXvXuDI/mv6mRutukVOt+gxW1x2Bgbx+RhQ7taMOtWNMfw67pK/PZVUDx6ESzLXRJNhZYVMfrc/xxRBQnG8ANAgG1e7vhaTlOw/Kd0RJWIRjEsrK5IAPu4pXUeHHzJ+JhFundknP/8egsYVn1dpwwrKOLfAjdkLjBRUoc//dDpF+Yma/nN6mkv+TxV1gQ2gJC6VB8RbImG49JgRk6+c4iYP6ztvcFA+71Zv5UG3LN/nFLgU7+
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 10:39:56.7881
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d0a490e-7db4-4882-475d-08df3fe0210f
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2PEPF000B66CE.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB7295
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_024008_301941_9C7B9CA5 
X-CRM114-Status: GOOD (  11.01  )
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

From: Joakim Zhang <joakim.zhang@cixtech.com>

Document the reserved memory region used for IPBLOQ HDA DMA buffers,
since the memory accessed by HDA DMA has certain limitations.

The property is optional: the controller driver falls back to system
memory when it is absent, but the limited region should be used when
the platform provides one.

Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
---
 .../devicetree/bindings/sound/cix,sky1-ipbloq-hda.yaml    | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/cix,sky1-ipbloq-hda.yaml b/Documentation/devicetree/bindings/sound/cix,sky1-ipbloq-hda.yaml
index 02ac5f1aa926..045e1a517f6f 100644
--- a/Documentation/devicetree/bindings/sound/cix,sky1-ipbloq-hda.yaml
+++ b/Documentation/devicetree/bindings/sound/cix,sky1-ipbloq-hda.yaml
@@ -36,6 +36,13 @@ properties:
   resets:
     maxItems: 1
 
+  memory-region:
+    maxItems: 1
+    description: |
+      Reserved memory region used for HDA DMA buffers. The property is
+      optional; the controller driver falls back to system memory when
+      it is absent.
+
 required:
   - compatible
   - reg
@@ -59,4 +66,5 @@ examples:
         clock-names = "ipg", "per";
         resets = <&audss_rst 14>;
         model = "CIX SKY1 EVB HDA";
+        memory-region = <&audio_alsa_hda>;
     };
-- 
2.50.1


