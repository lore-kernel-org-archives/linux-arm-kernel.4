Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B8460A3807
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 08:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wP2rattz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mTfgj2CmwI0zwXIIcxpk9MzLpnvv+ScbPhRUi9Au4K0=; b=wP2rattzN5+2jU
	JXHbH08sEdt+YrnU73SHT9q8hkg95k/aiDD6TCUk8N8IjMVCxL/RqPj3qUTAmc7cnODj8mkO4/Ok0
	R4WjHF/S/o4q1DQg/yEUq/Bd+lWI5cf3Ixw8thpFj4qSyjAJ2aWQTVq+rVLDhXvzM1eOaLzrjjNbw
	EbbDwQVhuN+RYb6ygXhI1Auek24DIQ9bZWCbF70/C3E65TiFS53I11bZTjfAkkXjDmgHIjEAJzCiu
	3AmdmCqLn+jA55roLK2Pxr++sIkmY8QD9gY37pLmQRLoweGoW06HczijOMcfoSSlJyPjjXgXJkuV9
	FjO/hVgzxXYwA/PH2lNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR3g5-000000062Z8-3U1n;
	Wed, 11 Nov 2026 08:27:33 +0000
Received: from mail-japaneastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c405::7] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR3g2-000000062XW-3bmF;
	Wed, 11 Nov 2026 08:27:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TGJ5ZoBiFUwR1R/m1MLm0WyPnFyQ3SP6TnDFZ0sao4LaRJpUUtoNtj3rVcmDpoJebqq9abwlMd6Kgzz/Fb7QN3JwKS+qSfcDtdZGTaNTXCIGOme5iv9hggXsQkap2XA9djGBu+zOJzKQCMkq2vzWtaY7ldG+Bbjc8UlK8ZiDFauPCW7JX2uuQHljkLJ1Ja9ZZX2GbtTbCh1fZRt2h27ouw3eJc67+Pva1AKxwFp0jVvjxsr4zhEBJyF08P+nzdPCKVAYjwLRVTl4baqDze9DyB5WxX+TbYKwevK9fHMx2XdAgSI60TnbrRjPh3dQQS9rzWa2c3DLxegbU37g24EZwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mTfgj2CmwI0zwXIIcxpk9MzLpnvv+ScbPhRUi9Au4K0=;
 b=KTghf0+UK7NUoCP6LgrCLIuYjb749FSyXUe1CWO1x+iepkPMGZ5maEaKuK5OONmBRjpF97d7xdJSTL6wk3sOevqTOuIixzee+sbhGzBJjlXi9aq4PTuBLU7T0HY73YYmDGKdlH/KDLZyxk0adjb/hRrEM6Bg0orIc0A5O2HrqXme8izZ6TxtcTPOB7qhXYBZlfgGkmGpm/N6uYSoMw4cO62sDBGqDRoaLhgNUH0c8jBF13h8swm4UBoWUyKa5I13MPMywI6Z7QZnKlWCjhdSM8YyYxRh2Q8NTVryDfQDiyW1BHvuDPqXSpNgxKnWsBL7a13Lv5CwyrCGip5kSSom0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR02CA0040.apcprd02.prod.outlook.com (2603:1096:4:196::6) by
 KL1PR06MB6347.apcprd06.prod.outlook.com (2603:1096:820:ce::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.8; Wed, 11 Nov 2026 08:27:21 +0000
Received: from OSA0EPF000000CB.apcprd02.prod.outlook.com
 (2603:1096:4:196:cafe::9) by SI2PR02CA0040.outlook.office365.com
 (2603:1096:4:196::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Wed, 11
 Nov 2026 08:27:21 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000CB.mail.protection.outlook.com (10.167.240.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 11 Nov 2026 08:27:20 +0000
Received: from hongliang-System-Product-Name (unknown [172.20.64.180])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id CA6174102E65;
	Wed, 11 Nov 2026 16:27:18 +0800 (CST)
From: Hongliang Yang <hongliang.yang@cixtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Hongliang Yang <hongliang.yang@cixtech.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Gary Yang <Gary.Yang@cixtech.com>,
	Fugang Duan <fugang.duan@cixtech.com>,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cix-kernel-upstream <cix-kernel-upstream@cixtech.com>
Subject: Re: [PATCH v6 1/3] dt-bindings: phy: Add CIX Sky1 USB3 PHY
Date: Wed, 11 Nov 2026 16:27:17 +0800
Message-ID: <20261111082718.3425848-1-hongliang.yang@cixtech.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <66d48a6d-00c8-42fc-889d-d0901c8d85a6@kernel.org>
References: <20261105011751.4058411-1-hongliang.yang@cixtech.com> <20261105011751.4058411-2-hongliang.yang@cixtech.com> <20261105-kind-macaque-of-enhancement-ee0365@quoll> <20261111030926.2954510-1-hongliang.yang@cixtech.com> <66d48a6d-00c8-42fc-889d-d0901c8d85a6@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000CB:EE_|KL1PR06MB6347:EE_
X-MS-Office365-Filtering-Correlation-Id: 6eeedfb3-4d62-47af-83e5-08df3fcd9b02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|23010399003|376014|36860700016|1800799024|82310400026|5023799004|56012099006|4143699003|261021121427099003|261022105027099003|261022075727099003|261102123227099003|261026140227099003|261028144727099003|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info: kkKQth1kxVxQyY99IozGlLtTx+y5pk4Tp/BZQjtqVDbQJq19Cl29xsTUJ9bo9fIeaexv96/1ACE38JEEJKzUqZ7l2Kc0MItB82DiA776tDvGYjGSAigmxxmjCVXzEwv7x61W16CdD8bImS67LplLJdDiLlLh4Z6cfA2UcAOzwr0uCjV+d33kMQvEZa/SuSQM4iD4ZVIRkeTTNvcJ2NgY3qVQXxRU0k1bHZ+jtgwWGexgfH03ZVUgUPlY6Qvz0es4RgriNgjPxdnJ43sB+rzNBErwACoA3vOopBDQXOy+CE8BGKSHCvz7OUvS1nqNsaTygcDZKX0Ak1Oj9Yg7UUvkmLJyWPOOTSCsS0Hyrrm64S5peTF1OYfeQzCnlnezuBCR/y7f8PfvsXtyP/DbV45doweg4MDA56Q6KOulx5NGmbTs+U02yhKhYGv/ee/uZqPb3I4/cljrYfryPEz2FCKpzJ8rmklucYmu5Cwejb7uEBIfx3bfvMX71sRNTy838ssA0AP2iJ6s+gRjWQI6Px9hiopUkIHY9xyd8kGmnrPLrDFJyRT/EhO9V7fRuKTAwthGdP2sG5WyMHMqg19YDPozsJvIB9JzjpMvsRCLZPVD6ACtQS/b7eK6lE8oYfzgTvbMiIfrAlGdCkgYV/AF4xCB3KnayaUomoCQhjbd0E26XbvPKU0UhUlPshhVXlKeGZ3fovvkXr5/HstVkU7Owy0MWQ==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(36860700016)(1800799024)(82310400026)(5023799004)(56012099006)(4143699003)(261021121427099003)(261022105027099003)(261022075727099003)(261102123227099003)(261026140227099003)(261028144727099003)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 4MVDXGSkPeew5wYd7G/TmMu88KuIxtyV5XmFzgeqBU3DzJHiLx3dnwsQEAzYQTsHHOMP9SRvoRMHinTk5g0aTrlkWjfiXsQmCjIU0QgmhNVbnDCmHyKbftILA+X7E9mlMzGPW7yarKGMr/3TxoYwrtFNfy6fln6pi/Ra6zm3SuneUYa4jQ4sHijTUkDTSZDXJsbYMZXMJZZDFpWF0BBAI6RUCQ27MPYlX407TpPEZvOOnNDkFshqvsds950VaoPnFaWrYi17XvUa9bqkkJav3j5IeFMOuuj1JMYLZa+3/Dl+f1LHcI/Y4Sxsx8LgUWYEnDrShHoLG7tTg5tmC8APeZzIWiTpZ9UMgMd/CUJncCvYtdcqTlHGhlAklkQio3jEc7ZxkEH7dhhd4c01l9B8ul4zW9FGU13TxJJpT0/o0Ca3u1Fq48jahfjMoQntm5o9
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 08:27:20.5637
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6eeedfb3-4d62-47af-83e5-08df3fcd9b02
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: OSA0EPF000000CB.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6347
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_002730_900332_FCA3B74C 
X-CRM114-Status: UNSURE (   6.83  )
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
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> This clearly shows two phys - each node with cell=0, means each having
> one phy. Two nodes, so two phys.

Right, v5 made two phy objects. That was the bug: they were the same
PHY.

The block has two lanes, one per Type-A port: USB4 uses one lane, USB5
the other. Both lanes are programmed through the same register block,
with the same clocks, the same resets and the same init sequence. In v5
the driver created one phy object per child node and gave both the same
drvdata, so the second object programmed exactly the same registers as
the first; the only difference between them was the of_node they were
registered with.

v6 removes that duplicate. One phy object remains; both lanes are still
programmed by the same init sequence, and both Type-A controllers still
get a working PHY. Nothing was dropped.

Best regards,
Hongliang Yang

