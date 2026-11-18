Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D5D606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 01:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=n8/8npR5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=IK47gmLXjQYtR3QPjuBqimLTbqJ+3Tf6AL6xgIEzRt0=; b=n8/8npR5UTZjbG1euojgKR9ZzU
	pAJOuZCHxdSPq/m9LhluFZ0RyWwlCg2D7l84HT1v3dPZsH8gwX8lqn6FHIoDC2DXFzIU6iDmZ9jqh
	cBKNIoFNQHBYVvnyR+VMJo5yZullN99iPmRCP5j8IsFknFu98D+ElvULrnpN+E7A+mrh8D5j17jS2
	YexFM7jOdekKCqLZT4p+3zMSVxb04IuMoS5S2syHGGMdGoBoKz+kSJN+L2ib9IXEjmuHRBv93tn8X
	cKLLQ33a9JRByJ96pNU5Kepl+zOZ6kXDL4NWXQOILKHIc7OLTqG8vGygl7bQKQBgLHpY4rr8OUz/v
	rR4kaQmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTUj7-00000007TYb-3Mt8;
	Wed, 18 Nov 2026 01:44:45 +0000
Received: from mail-japaneastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c405::7] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTUj4-00000007TYE-3Xtq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 01:44:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xXzgN6Gd2ECq7NND9/rV8DX2iX/M21NqgNkLu3EY+0l+Ws6lpBgqD3AHgSoFyU/NvqBjdzVais4jdOOUVE64W8YD2ZdDYGSHd80WwJroEHvZabNIJF3PHuXNK6PCZsDCDY87AqoNfh8ddIj6eRWNI2qZ4BHKsp/sZGK4WIvigqfK5tQhh0giKoRAsyDh++BNN0k6a9jMBsIPa9EITNoZAWcVJAP/h+GWzIsEzLZ6BLwFX1Mp9P0Hoh2nsDCCrwq0Ir41RumLj7NE4Hqx8LkYUTZnuFXHvyQeFow/1aKOjLgrAOtHZGWM4lolA5Cs2J3wZPXZHvdvEPCPwyuNy1Ahpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IK47gmLXjQYtR3QPjuBqimLTbqJ+3Tf6AL6xgIEzRt0=;
 b=xRBy2LYSQdTPYBkXQ5pdk7JX02zAogOhfm8l/TpdwXH6KYXfWCVZbyYdXXOApEMF7nScLEZQozw9PZqg+0IHQoQYbTG/NHPBgOJM3pvg6bZWzs52qhUOn0B92oSe9auXUbdECyJ4/S1Aumzlb28gLHAZJNDYU2D8NKM8RmsMpMYb5f4b2kK5RLjU0HCiVMm8A21LNOwYa6Pf6r6ZLyZtWp6e606z31r8Nz3dpFyfnSBuncnh0U+t/iHaa2MucVwZ3zDdgpI1k/QAyesICr8avOn30h1ofsJBXrYXybCN80mFs9ok/9Cu6mEuRimSP2lX5+2ZxJwAyUKZA30eBTJPBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cadence.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TY4P286CA0107.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:380::7)
 by TY0PR06MB5458.apcprd06.prod.outlook.com (2603:1096:400:329::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.8; Wed, 18 Nov
 2026 01:44:34 +0000
Received: from TY2PEPF0000AB83.apcprd03.prod.outlook.com
 (2603:1096:405:380:cafe::ad) by TY4P286CA0107.outlook.office365.com
 (2603:1096:405:380::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Wed,
 18 Nov 2026 01:44:34 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB83.mail.protection.outlook.com (10.167.253.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 01:44:33 +0000
Received: from hongliang-System-Product-Name (unknown [172.20.64.180])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id AF7D5427EFC6;
	Wed, 18 Nov 2026 09:44:31 +0800 (CST)
From: Hongliang Yang <hongliang.yang@cixtech.com>
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	peter.chen@kernel.org,
	pawell@cadence.com,
	rogerq@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	Gary.Yang@cixtech.com,
	fugang.duan@cixtech.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	Hongliang Yang <hongliang.yang@cixtech.com>
Subject: Re: [PATCH v9 2/2] usb: cdns3: Add CIX Sky1 glue driver
Date: Wed, 18 Nov 2026 09:44:31 +0800
Message-ID: <20261118014431.3405198-1-hongliang.yang@cixtech.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <sashiko-outbox-218132@kernel.org>
References: <20261117021705.2202892-1-hongliang.yang@cixtech.com> <20261117021705.2202892-3-hongliang.yang@cixtech.com> <sashiko-outbox-218132@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB83:EE_|TY0PR06MB5458:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 6a1fac70-3cca-4e3f-4e47-08df45157eed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|23010399003|82310400026|1800799024|376014|7416014|261028144727099003|261026140227099003|261026121527099003|4143699003|261022105027099003|56012099006|10067099003|18002099003|261009223027099003|22082099003;
X-Microsoft-Antispam-Message-Info: Z5lZR5EGuU+HLUYA9YGptiqYGHkwLmWPGrKZz85GC85q0H3pG5mcRyNCzxO7VIhMMtl3EbH2Weru88fCTh2O3JLewBLynhTbfwfvczArqpV82IRzpGUYSgz3iAzuI3S0M+DzAmBmJGr7GauDPturNBO+4BJMGwhI3aFHZSNtZbn1LLEVuXopxpfmE+ZNfXQsgZEUWuVV0JT0lCkPEoln0arvxzcKIRnY6q8UpE/nFnWhhA0pwFdk1Td4AV3rO9iewpXU37dcJ6vJ18aHCCyeSNCxpu4RnOQ3sAzTP8D1CMKO+svZ39es528OWYTGH7/X/GAWOwB2EnK5Bz5wJd+95hMdyzyWxuHrR/qyskukh6usRlCZiRCAtuElnkrZLLckQNgHSTx5pDRcCoEhl/L2KbwadtLHmjeir9wF35gcDYxcTL3X+yPxG2bAecjYKzX1wMTB9TQit8LIUGQRxnMtn9dg1oxyOR3sJiUi/8EJs/RK1XiyQ1SIQCr5eF3Hqd5BRSdsEceOFfasql2UDcKmVPCvEQQlCoGwLpBMuabC5XsGe4D/DMC69mHoue3XkBRALV2oc3NadTFtmsB1p904WX9dMExZnHRO1SnWDaApmFEFK0EOnGclm93O4msdPHBCqw4IJ/TI0JfWggLf2HnVC91KgMB2eayGRmNhAozz2ikpYL0zWtFzrFAiOsoDkyffTbJRvz2CDOri0ZiFdPSxBA==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(1800799024)(376014)(7416014)(261028144727099003)(261026140227099003)(261026121527099003)(4143699003)(261022105027099003)(56012099006)(10067099003)(18002099003)(261009223027099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: A89+EZXZcYUTuBccOXOiDzLNA1NEuyES7LhpatZUPA21PVkWGX0sGPTsPfiSMA/QJxbWyfzw+RXEpgopQrZ8EhdmfThEgLo5Iedvn1PDjVCYRQwrSVRLy7DtIzU4MGeb8v7wmyZN8GYYWysrQarJOWfkMbB2SfdyHEY5L/fTt6W2v0rg1EgZlRRfg6E8G3ezQ9/JIPgdxyk3J4I06/T8AADMiuq1n/16j74GTDyucYW9spz3PKaMJokC4SRqUqtLMx9QmseugQz1F2CjQqi0D1LlG84wtpt08nrWj2DaLdeKhKgPO2g/gOsLDD0HDbj0imKlHfX6rRtKOifh5BxNqqBsz6w79v+zrhESAQ9nVZxKQjWNH0U0TW505yGPsQj45qGzXErxQa2kbdAsLGybp/b1nHx8VlNzduVV0uHc17zPRwxK25jCd75USNE5RLq2
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 01:44:33.3547
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a1fac70-3cca-4e3f-4e47-08df45157eed
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF0000AB83.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5458
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_174442_889636_4EFD1170 
X-CRM114-Status: UNSURE (   9.05  )
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

Both halves are real.

> Can this leak cdns_sky1_pdata and silently succeed when creating the child
> device fails?

Yes. With matches == NULL of_platform_populate() always returns 0:
of_platform_bus_create() returns 0 as soon as
of_platform_device_create_pdata() returns NULL. That function also returns
before it stores platform_data when the node is unavailable, when
OF_POPULATED is set, or when of_device_alloc() fails, and only the
of_device_add() failure path frees the buffer, through
platform_device_release(). With the child checked by
cdnsp_sky1_check_children(), the reachable cases are the two -ENOMEM ones.

v10 checks the result instead of the return value:

	core = of_find_device_by_node(core_np);
	if (!core) {
		dev_err(dev, "failed to create the cdns3 child device\n");
		ret = -ENODEV;
		goto err_quiesce;
	}

probe fails rather than returning 0 with the clocks and the resets still
active, and the buffer is freed where of_platform_populate() itself returns
an error.

The one case the caller cannot see is of_device_add() failing after the
buffer was handed over: it returns NULL like the of_device_alloc() failure
and has already freed the buffer. The two are indistinguishable, so the
buffer is left alone there - a one-off 16-byte leak under OOM rather than a
double free.

