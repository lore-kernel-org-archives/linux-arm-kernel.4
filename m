Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4851060A2611
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 10:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0it5uO/h
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=XYI6sfHAFTQB+81aBOW/oYbOaXKiK9idXGwkek2Kd9c=; b=0it5uO/h+9fQjrRTbJ03S8kvR2
	ahaPkEgTbQmilJxKhKB4rrL/ZhbiRsWO3U3BrHNSf4bHx/MAMOCL3QF9iQuERt+5bZkz3vP6nVBvP
	8yPe5QLew7dRc4+MFGvkgluMGQrXOAk/IAI/kY8NeZTCUPlMfb4DNXD6oa/ul/bd4r4ASPOANcO/S
	Wn1NkZ3h1JuEjY9gHpll8MWM6vHFmT9e5xHV8pkIIwV8ElcMMU7gKkB9wMGwqc4pAO5NwXB3AHNOj
	UsMSJWpN/B2v9+0yLNRRMzQAgFwSNHjBit9S/er1PBQE2+PV8IgytvTxoD1fJ6I7QKPCMzsbqt91k
	CvkF/E/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR58T-00000006HO5-05NZ;
	Wed, 11 Nov 2026 10:00:57 +0000
Received: from mail-japanwestazlp170120003.outbound.protection.outlook.com ([2a01:111:f403:c406::3] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR58P-00000006HLW-02k0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 10:00:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XI076ZQ0LxdAt9SRFIqYML2JqxbxstWw+6tXcSHKcZPOHM6Ols5K1Qv2Q9QlBPC7jx+6ES6eoQIemK7wK7endyjRfXi1jrNZVI1bXBU2imVNvvTISPM9GEruZYmyqhx0/qajZQQJFHlhwwRbNvcaJBt76lpJ6XGX5vOuWRq5519zvY+7Tx5sQKQonzNJIxPKhZRKkOFnJSNrXNugD45uoXQckv3l/sTHByS2Z5YGQOui+2rsL0FlhPz45tW/VxqHCVsmBf7l/oyNNBDqff8WWeLN4iWfKJNYkYFUTNiGpIi4cA9wnxb/wA4/a+W4Iwmq8TAqQuZJLQXY1JywG40izQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XYI6sfHAFTQB+81aBOW/oYbOaXKiK9idXGwkek2Kd9c=;
 b=RctbGz/TXSGTgjrgdJBmei0SkKJA/4ntoXRuA2dKLw7LOlZ7n8Z6cv5iHythBZD58sXXeqgN5kg7dS0X3dvSlNySR1EoPwr+TvO1cBk3oyBSXtmqSkDp53xQj96MQXRsT7WmadSkMMauTEC75SQOlmGcqVjwjqf9lYpehFFBoQf7tqXLU3VdmxuID1LBfC7Z1QGLmj00C/v99axY2jWNTlPguZaPoeQgetaNzNX3hyBwqQXhe144g2Nw0dlpE13nByDpmcuyIaSRwapBeh6gC18+DG10RE8MDHy4ovMRa4oJGdtolLl8QdTE6fxRTl5Iu7pIAWL/w0IX9rOui2Vw4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cadence.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI3PR03CA0006.apcprd03.prod.outlook.com (2603:1096:4:297::8) by
 TY0PR06MB5427.apcprd06.prod.outlook.com (2603:1096:400:218::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 10:00:42 +0000
Received: from SG1PEPF000082E6.apcprd02.prod.outlook.com
 (2603:1096:4:297:cafe::13) by SI3PR03CA0006.outlook.office365.com
 (2603:1096:4:297::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Wed, 11
 Nov 2026 10:00:41 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E6.mail.protection.outlook.com (10.167.240.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 11 Nov 2026 10:00:40 +0000
Received: from [127.0.1.1] (unknown [172.20.64.180])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id BA2EA4102E65;
	Wed, 11 Nov 2026 18:00:39 +0800 (CST)
From: Hongliang Yang <hongliang.yang@cixtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Peter Chen <peter.chen@kernel.org>, Pawel Laszczak <pawell@cadence.com>,
 Roger Quadros <rogerq@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Gary Yang <Gary.Yang@cixtech.com>,
 Fugang Duan <fugang.duan@cixtech.com>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, cix-kernel-upstream@cixtech.com
Subject: Re: [PATCH v7 1/2] dt-bindings: usb: Add CIX Sky1 USBSSP controller
Date: Wed, 11 Nov 2026 18:00:38 +0800
Message-ID: <1794391238.309976-1-hongliang.yang@cixtech.com>
In-Reply-To: <20261111-fictional-vigilant-serval-eea5bd@quoll>
References: <20261106101210.1059256-1-hongliang.yang@cixtech.com>
 <20261106101210.1059256-2-hongliang.yang@cixtech.com>
 <20261111-fictional-vigilant-serval-eea5bd@quoll>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E6:EE_|TY0PR06MB5427:EE_
X-MS-Office365-Filtering-Correlation-Id: f89a75b7-0e80-4b0b-9060-08df3fdaa4cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|36860700016|23010399003|376014|7416014|22082099003|18002099003|10067099003|56012099006|4143699003|261028144727099003|261021121427099003|261026140227099003|261021123027099003|261022105027099003|261026121527099003|261102123227099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: eKkn0XuRXchmLVnedhSqmaCPmMKqw3j0uM1V/Haw/nfyPVnlZ5qpgcZCZ+xlBiUdv/d9MxQjpQvL1buirCM7T2TyOLFgwC+E9gzbeM6Yrl/k6FGS1fCTuII7OgJ6FRj7k7NfBQtV0tiZszimw5RnlTZD5n+bOc09c+5cNIQdK3/Fv3AV86W7+fkNtJshATBGQJsoFfNl5JhhG/BWKUHHsnqjJmeV+X7JBY6AsWjaa7Wgmkw6AH1YKn6ReCXXiqSh7dISqGN2Ik0OR9PxonnVZUmHkMRJUBw42ftvwSzLfSODV8JFNYEAOZAK/bpNlrI2IaoVsPdoAzwD+QO+D51iGqOnZyTuu6XxBXWNrav/tPEsaO/Wz2GhOO6tKtPJQbLo5YE5p6CqGui1L3uiqa1lQb8rOzOr/gyGDMLOd0fHGcXj1yIRxrSWzNuXZj8makLFWgUPy41SbndIVhzAGRx1ocDFiVi5jLBkCpJIZHIL8gH0kplmOrl78kt7K4BM25DlXbOrXB8KFMe0XN/a5QrTkpXOqMyhTPkmsG+HKqkO757DzuCSIlPPiSNqNxXVOCU9v6qjXSaqgAM3QwZGirRYbQ13XytfdkHToUzOQVdpA97Sy/zb/+n0C3d0MsjONlwlNYN1jxZntJvHGE3AKmYpN076qz0gshnaEcVguFaAm3bu5BDUScNlL+tAxryVK3y6gX1Lz7scF5xsNz2l5US2cg==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(23010399003)(376014)(7416014)(22082099003)(18002099003)(10067099003)(56012099006)(4143699003)(261028144727099003)(261021121427099003)(261026140227099003)(261021123027099003)(261022105027099003)(261026121527099003)(261102123227099003)(261009223027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: AljSyohj8aXiqrNuukx47QSMrYRBc1Uc6y23+E6aHxJPkxN92J+8qKSV/VZ0N44VxBSajtAd/YnVMbu4U4XpFFKp72gVlu6jq1F1TUYMZJbvYUFz1RadnCAAAJBLx1JaUZPmYp9Z5VNbjGpAxkS20YNf8F0Kw3KeXNf5gu2Et87azCIntS0ODywT+XUk/xXj3WKrPph64y1BZhkPxLEv/ea/oLtGznS3lG4BzFGk7ZUatwH9JwUAUY2SxJ3Y0aPdCxyZr2zNkcHGXcnIAlSr1CGDTEVR/wpo5UqtBZiK83FOhjZBzsI+gax9hp4iFkstLJfXqyHREJERjs24TWGked+gyjtAIZfOJ2tmHrTr8RUqK3lG7WOrqa11La0Lbt1SauJEPiTZ/sClZITYa68W3xb2aonrj++s+Iry498LL7zqxKlskYpHbBbh8rzuBtnp
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 10:00:40.8212
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f89a75b7-0e80-4b0b-9060-08df3fdaa4cb
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG1PEPF000082E6.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5427
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_020053_142228_7AB99A09 
X-CRM114-Status: GOOD (  17.02  )
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> Unanswered comments from Sashiko, dropping from DT Patchwork.

They sat for five days, that is on me. I am answering both reviews in
separate mails; this one is about the binding only.

On the overlapping reg windows: the USB30 Type-A DRD RCSU block at
0x091c0000 holds the straps of the two controllers and of their PHYs,
interleaved:

  0x300  STRAP_PIN0     stream ID           USB4
  0x304  STRAP_PIN1     stream ID           USB5
  0x30c  STRAP_PIN3     clock enables       USB4, USB5
  0x314  STRAP_PIN5     awcache/arcache     USB4
  0x324  STRAP_PIN9     awcache/arcache     USB5
  0x328  STRAP_PIN10    USB2 PLL            USB4
  0x400  STRAP_STATUS0  AXI clock state     USB4
  0x410  STRAP_STATUS4  AXI clock state     USB5

USB4 needs 0x314 and 0x400, USB5 needs 0x324 and 0x410, and 0x324 falls
between 0x314 and 0x400. There is no contiguous window that covers the
registers of one controller without also covering a register of the
other, so the overlap is what the hardware looks like, not a shortcut.
reg describes the window of the block that this instance's glue lives
in, and the instance only touches two words of it: the AXI cache
attribute at res->start and the AXI clock status at res->start + 0xec.

The driver maps that window with devm_ioremap() rather than
devm_platform_ioremap_resource(), so no memory region is requested and
the second instance cannot fail with -EBUSY on the first one. That is
deliberate, and it is why Sashiko's failure mode does not happen here.

I did look for a shape without the overlap:

- syscon for the block: you already rejected that in v4 - "If you have
  here MMIO for some glue over IP block, then it is unlikely to be a
  syscon." I agree, this is USB glue, not a miscellaneous register set.

- a container node with the two controllers as children and their index
  in the block as reg: of_platform_default_populate() only descends into
  simple-bus, simple-mfd and isa nodes, and a container with no driver
  would never have its children instantiated.

So v8 keeps the v7 shape. I have it ready and am not posting it before
you answer this, so that the next version is final on this point. If you
think the overlap should not be described this way, please tell me which
shape you want and I will send that instead.

The other Sashiko findings are driver bugs and are fixed in v8; they
will be answered in the other thread. The PHY series is unchanged.

Best regards,
Hongliang Yang

