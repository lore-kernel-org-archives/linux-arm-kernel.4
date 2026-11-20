Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10833606A325
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 01:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vCgsU4AW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=uHTYH0hftu1/GRLYHKJXgTt7gRzt2O6NRsCJlLzAVM4=; b=vCgsU4AWUYLMhyRs0I/hEWbKOW
	OGFosk6ArTDIMZr27fLlM0Zd20V8jKsAgIKn2bdd6czEJLLJtWaQHaAbhr9T5pUO818N4EPFxBc7p
	9ls2zx1tvbkVvPRtt9roGAna53UDMxPNiC/jbhFVSYz7qfIHJWm3LTQBJoJYe9LdVUEmaFY709bkI
	6j2q6H1VXd93jbz5Adn2Mova5wtuCqbLzb0/KmDY5MC09Fyvqbb1TtNZBQS3PqqkbJJZCUKcLwv+Z
	4i5TD/vD49slGGB5VH2ufIniI27bPCCQ0HJ1b3ZW+PN/hUPh24a0PLjHudRIhnFp8M56mP25h/XRh
	Pptnfn9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUDn2-0000000DrcQ-4BZH;
	Fri, 20 Nov 2026 01:51:49 +0000
Received: from mail-japaneastazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c405::5] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUDn0-0000000Drbd-1Gm2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 01:51:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ASWq0Y00RZq2Wyv0HD1YfDMx83oyXICM85o5s3e8tSCouEXp6vsjHf0PYdfps7iMVdxLykqPOOp/o/VC7dVkN2a8jzAI/X1LD1NxkMM3Z9UAQ0mo7XBTW3gDZ955Id6NNb3BgkqhC9kAV52sdCFq1SB5WeSfj1zX99FAlRjOuwYmKnC1nk2vmM6aAY82konATwy2VOpZZQNv4x8jiW80mH7nxJo96nfwlwIAwKkrAIGRE2fIK3ZNPLZUgByotUthoEGViqIJLThRF7YAElV5JjdwuGxZUdVz2sRAjs4bY3kzQY2N+vgNRiOATp4tsfsx5/HRkt6KY0k04AbaD+untg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uHTYH0hftu1/GRLYHKJXgTt7gRzt2O6NRsCJlLzAVM4=;
 b=uZ9oLxXrZt/2ZlcLQk8TGF+NyWYvky6eysZ28wm5UdZxH8eTdc8ymm0f+XF6nZDnQi9URzy5tq4TtrYEjpi3/2vg4Bar0ut6kb0gpzsIHa6NWsHSBX1kVSrznp8g/JXRqg8dpHgzR2hQHC4t3k7ZRgzSDl0YBNZXPk2jogK14vtje1tzvB8mR3fB1el8m2pTkpbV7aMEftlosrZrKbVAEDOL+SIG06FXSRFqNHYvOVTlxFZmjF2/mhmcGN2yFuzGU2jFo4khqu9pt0DFfoWfj2mxMZSXlHb2rABp7tlsSsoTkaFOXIoO2f0UUzYAM0CfFwXG47oJcD+YQj6Z7Hc0fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TYCP286CA0279.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:3c9::6)
 by JH0PR06MB6512.apcprd06.prod.outlook.com (2603:1096:990:3b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.2; Fri, 20 Nov
 2026 01:51:34 +0000
Received: from TY2PEPF0000AB88.apcprd03.prod.outlook.com
 (2603:1096:400:3c9:cafe::3d) by TYCP286CA0279.outlook.office365.com
 (2603:1096:400:3c9::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.12 via Frontend Transport; Fri,
 20 Nov 2026 01:51:34 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB88.mail.protection.outlook.com (10.167.253.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Fri, 20 Nov 2026 01:51:34 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 1B63B40920E2;
	Fri, 20 Nov 2026 09:51:32 +0800 (CST)
Date: Fri, 20 Nov 2026 09:51:29 +0800
From: Jelly Jia <Jelly.Jia@cixtech.com>
To: Brian Masney <masneyb@kernel.org>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, robin.murphy@arm.com,
	sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com,
	tglx@kernel.org, devicetree@vger.kernel.org,
	cix-kernel-upstream@cixtech.com, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, joakim.zhang@cixtech.com,
	radu@rendec.net
Subject: Re: [PATCH v4 3/5] clk: cix: Register the Sky1 AUDSS IRQ auxiliary
 device
Message-ID: <av+noTCzllh8pjJM@ubuntu>
References: <20261117094408.1393837-1-Jelly.Jia@cixtech.com>
 <20261117094408.1393837-4-Jelly.Jia@cixtech.com>
 <179505256752.187996.952601612639868708.b4-review@b4>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179505256752.187996.952601612639868708.b4-review@b4>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB88:EE_|JH0PR06MB6512:EE_
X-MS-Office365-Filtering-Correlation-Id: c5e93db2-c05d-47a5-91ec-08df46a8ce98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|82310400026|23010399003|36860700016|376014|18002099003|22082099003|261009223027099003|56012099006|4143699003|261026140227099003|261028144727099003|261026121527099003|261022105027099003|10067099003;
X-Microsoft-Antispam-Message-Info: CkNmjC5YOtyRsJiKsrhs5Fui7kEwXZUUwXfmpEi4Sl/KSe/9o4e7alOqaer2OrOr9rmaNrikiftjP+2GJQ4qEzl2+MkO7Nh2I1dhryBretRvaaiEUQt7NthLHdQ44N04cZ5ygpkmX7QwIrgjfv9fh0jo+T0CnDyI8hJCzCr9+T6qRreMVWKz5eq5tok8tb7ly+EpiYj59PdoDK7hf5N57ykY6Idk97x0hMNN6yLJmew6+4LHnKPtA5XMfDjMrV9Qo7PhuwKDWN9CfRYsO+9U2D8dsxdWe4uYnZqr7p3f7+IlunchkOkF28ACDFOjvgNtOK6QPr29Oh0q0Zm6DktHKgScpMSebdvCrFY62OfM/CNCaj/KWzmVMcs9bjQv92x4gy89JAKbVCEReWJFgTcq/akHuhgdcWbI8gMSMivOPBW/u3MrKP3JuXdJI3aS7sW/1gA6hZtGQyZLEjBxOe6ROB2mB99obEuZWadECCvv6MNcADLoaX6bB0YJVvSf5AhuMCaxwPbu/6UKtGGGiubdj0ZebBmYe+rtVWRtXONpNjwTpcv0tpXcKjjWh6tCw9/1DdJzDiEonm/ICBnYCa9bVIsek9x8F/P+1ybktlELLCC11IVweyVcB9yYxNvf01i0vxX6RF7ZRB/2PTMhGAQVVK6APTN8F4B4tKqobfzRjxAeOPg6ZFyOWvaO3G1HK0/OjwXmJRDaqvq+Oa8UD4MBhg==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(82310400026)(23010399003)(36860700016)(376014)(18002099003)(22082099003)(261009223027099003)(56012099006)(4143699003)(261026140227099003)(261028144727099003)(261026121527099003)(261022105027099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 3/l58ZoV7OrUx8i7vHABGfpUjpHTr4sdZtimFtg7dbnJMQJ17lYnqXZBI5yCG1rtK+tmoJF3e6vvOE/MRMyfrlYRpNrHTflrHxAuXoqhNsOcTWgGwljMD7O8hhy5rW2ess9Tfm5BC5cyu7O2yFLZ2zzVch4PKQR3dRQM60e1YuLS/4/EyFcxHDwpLDuIvshf0rBVaknjfKPbA8SwAoyrsEfPDg300JmQ0VYFPdynjrdPffYQXSOjS0XZDGF0K+u+MKS/rVvqTB5mL7OoEl7qYo/gvq9LN92+doafCdJIbtPXns2VyYc7I9HYC5H0lvwQFVYTEGOgSkkeDugbzXmuofxH3IZ7esQ5QKoBWmk+hyoo5lo1Nz7TI2YHA0QOAq0SOOnPHBUsvf2NkI5n4kLUSLpl4M+Aoi+sCXrlEDzmQl4DWVXDg1/CH3NIxPguE2Cz
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 01:51:34.1956
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c5e93db2-c05d-47a5-91ec-08df46a8ce98
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF0000AB88.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6512
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_175146_349948_E4D6287C 
X-CRM114-Status: GOOD (  10.74  )
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

Hi Brian,

Thanks for the review.

> This, along with the defines should go in a separate commit.

Agreed. I'll move the INFO_AP_IRQC and INFO_SW_RESETN definitions
and their save/restore entries into a separate patch.

> I don't care which pattern you use but make it consistent within this
> driver.

I'll make the IRQ registration helper follow the existing reset
helper's #if IS_ENABLED() pattern, including the stub when disabled.

> Should this be a separate patch?

The reset_control_assert() error check is independent of the IRQ
integration. I'll drop that extra change from this series, leaving
the existing error-handling behaviour unchanged. The additional ret
variable will therefore no longer be needed.

> The IRQ driver uses the new pm_ptr(). Please use that.

The clock driver already uses pm_ptr() for its .pm pointer, but still
uses the SET_* PM macros. I'll switch to RUNTIME_PM_OPS() and
NOIRQ_SYSTEM_SLEEP_PM_OPS(), matching the IRQ driver, and remove
the unnecessary __maybe_unused annotations. The noirq suspend/resume
ordering will be retained.

I'll also remove the added bits.h include.

Best regards,
Jelly

