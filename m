Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F37606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 12:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4jfJg7VU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=u+MJ2UAgWlLd4u7ouaduPW/8nG6ijzHdsulNJMWKwIE=; b=4jfJg7VUP97UW2SWPoeyiz4nyR
	rm/KKwDXYcDQVsI3LU8wZZp1oSGGDJdiRIv4X6PkxKnla9abJrAnlgdOgGfCAUYNFZGAZMAuJKptZ
	r/kt1AErcYXfqdsJcXPvXQI2UiWcRj256sOH8E9c0zgJ6zNN2gO/znPdrXt0M+tMhr6/FKiZEic6+
	FIelJX3uTX19nEiOGxjOOWKeX6HhVGb3j1ltXls2Ve2RGdsFcRQl0Fd5XwJRofvlvmcjL9jHZUEul
	0pWzRKUewzsQtFYJC2tM+kt/wlHd106tKFc3C+dwsGTHqlUCEGhEDzTXRYvDaFibYVjTwF5pTCogY
	A0EUHLcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSvsX-00000002MWl-0aHq;
	Mon, 16 Nov 2026 12:32:09 +0000
Received: from mail-japaneastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c405::7] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSvsP-00000002MTX-0u5W
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 12:32:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OWHX5o1MVEfVcZT7+JA1/GDRm8SQCL1CcODeTkHVDfSS5jAGXNSLEvjK/aggTCEqv4dyuY2VYsiLuioRw9hdZ9JQ2i2tpZjyRbnUQUA84u0MORmqHTQqwP5NCpYo3Zsa8YGLKToC0jdlGH2dyVPFxUYg5hth6KV+h9IDXy4M1v4h7CwiCrB6tuDSEUPwI1tfMdDsUyJGtuwmIO3flUp++JTDw7IBdzUeI1zZZ93uLefezNgmQ1piY21CFMMSdn5wd+J3jdAXQPnCZSHb/Bu51HkS12nwrUwWjRK7vcmBkO053P88h2vQKUnOMT9pmqTKn5XmKGs2X4L2jWA2j+hPAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u+MJ2UAgWlLd4u7ouaduPW/8nG6ijzHdsulNJMWKwIE=;
 b=lWJlV7NO0BvyJfdhjrGAdNzwPxJ18yW+zgbss5EhBw9HSylyJTNKWLcmXjALXilYPhARRT5I9YTs9db1Qud1v0JuTTUhRfeYHwCZKqLaywC3bxciW5c8nsyfZAwlozAGf+02BsEkZ9ahmOdMoqtpY9BXrESfaxQ+RyEwKW8Sxk9oMtT/WoGB2HMNoHcpCawu/H6VJV4YCWT6Az566baUyra88Lfar9KkIqN1PScveVFGdGEYvE1oblakZvHCQdSGK8cUMti1z/YdeiaHr4QVvdBG7qog4fsGFvOhlyUn0i40ER4LDMhQs0K+Odi7nu4pdqYn9vrUr1VvrDfUTfPCyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from JH0PR02CA0022.apcprd02.prod.outlook.com (2603:1096:990:76::7)
 by SEZPR06MB5117.apcprd06.prod.outlook.com (2603:1096:101:4d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.7; Mon, 16 Nov
 2026 12:31:54 +0000
Received: from SG1PEPF000082E3.apcprd02.prod.outlook.com
 (2603:1096:990:76:cafe::2e) by JH0PR02CA0022.outlook.office365.com
 (2603:1096:990:76::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Mon,
 16 Nov 2026 12:31:54 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E3.mail.protection.outlook.com (10.167.240.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Mon, 16 Nov 2026 12:31:53 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 8A8F4427EFC6;
	Mon, 16 Nov 2026 20:31:51 +0800 (CST)
Date: Mon, 16 Nov 2026 20:31:50 +0800
From: Jelly Jia <Jelly.Jia@cixtech.com>
To: Brian Masney <masneyb@kernel.org>
Cc: vkoul@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, robin.murphy@arm.com, sboyd@kernel.org,
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com,
	devicetree@vger.kernel.org, Frank.Li@kernel.org,
	cix-kernel-upstream@cixtech.com, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, joakim.zhang@cixtech.com
Subject: Re: [PATCH v3 2/5] clk: cix: Handle Sky1 AUDSS DMA interrupt gates
 as an irqchip
Message-ID: <avr3tuaSUxAZObcz@ubuntu>
References: <20261106013520.1134450-1-Jelly.Jia@cixtech.com>
 <20261106013520.1134450-3-Jelly.Jia@cixtech.com>
 <179443508445.1143992.8301638068435530250.b4-review@b4>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179443508445.1143992.8301638068435530250.b4-review@b4>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E3:EE_|SEZPR06MB5117:EE_
X-MS-Office365-Filtering-Correlation-Id: fecade71-5377-46db-3237-08df43dd9896
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|36860700016|1800799024|23010399003|82310400026|10067099003|4143699003|56012099006|261026121527099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: YXqvfzh8zsvmqNJzGZ6AW2rLm0OMyp6T8tbPiE1+XRrzYMcgf2chHBx/O4dpFqGV+Ekz7E5q4pdDsgxIQffnS0KuA7Aq2J0nNGr/NVXIASqZmJwHUZ6wNtNWvwjYLbjv8ITFwBLN//7XnV8GBY46G6sCJOLkFgMyEgtKWbCCG0GsG2AITlW9ic1OwBkuFpZfTVBryrJlLuRmGF4Ixvjap/1qOuF/wdbyIcZjUmVmbKdiI3EY1HjkCRfXxu1Gu/yyKS9jQms9Rg6PaYwR2q/GUyALlNisT3kmT8Uket8rvYYqDYAB2EGk+aHavR30KTqldyLi7sN84So1pGs1Y5Ux1mr1A/R/eTfyQWckbq6sd2z9/y2LzSU+5eVEALLny/uA/abAZN/Pv8TToIzPIrD0GWtYqAFqup9xjSc/SsxYL+cu3i/CjLkD+KCz5+5VIGEvQfB1u7zMLYNT1OSyM+P4oJowWgoS43X3dcUDpEiQWQMnewNDmhRkZMoKsErWxpwzQGbG9+gHWzVBEh4Cc/8xerroaRZdcQQZ+hk6vJfLNPROknpK+hOCjv5C7gdolXIMZP4NqHNWOoPYO9tL4F2VxbHkh93bEUYiRO4fdeYauKPpfYxfrvuUktZ6pCAM5kNUl3TZgJIFJIZta6FWm79Z9p8Hf+HDaKbZTCDazvcmEtsqMnlkguC3VkHeCl82N4ZT
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700016)(1800799024)(23010399003)(82310400026)(10067099003)(4143699003)(56012099006)(261026121527099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: kuFTGtok5FwWoA9fEtzvZDh+n60Fuh5sxCVM/Fg4Qe3ShDgvTfUK3qJqI/OCp1tSk8ljsvlDhb7dHDm6NtkkT8jNk0U0//ad4AnRtjbOBDroXgu2ogWnUEpm0RAkH3dYO2TypuucuDjM1yawPgQih9jXvZcoaxqwRJbd3wHVWwjfrDZMpLloYjgR+pn+fsBQ3wA7oiQlyj6hW/1J+aBSeYaoVZrdCtenD7UhCo9FbPlSBKK7e/5W+a5/ZbO49VFT3KBmNvXoDpCWfW/Ma7VbuhJ6eFNLqtsVCv7QLOazlXoqs+2O12MHLM51x28fjsHSwxXvK/hpWIvzrmQv+wjWRjP5fwQwR0WLBRnNg4z33RaGItn/2+qiyayqUsLny2AUYpcxnh5jY9jMjWoMJOjZuNlwxuAkcqqtWo7GtvNf2QjDAFHFmLe07mMy6oBRD8j3
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 12:31:53.2846
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fecade71-5377-46db-3237-08df43dd9896
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG1PEPF000082E3.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5117
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_043201_257842_1BC70ED3 
X-CRM114-Status: UNSURE (   9.65  )
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Brian,

> The irqchip driver doesn't belong in the clk subsystem, and it needs to
> go in the irqchip subsystem. You can use the auxilary device like what's
> done for the reset driver today.

Thanks, I'll move the IRQ implementation into a new auxiliary driver under
drivers/irqchip/, following the existing reset driver pattern.

The clock driver will register the auxiliary device, and the IRQ driver
will use the parent's regmap and the same CRU DT node. No new DT node or
changes to reset-sky1-audss.c are needed. I'll preserve the CRU power and
IRQ quiescing protections when splitting the implementation.

I'll include this in the next revision.

Best regards,
Jelly

