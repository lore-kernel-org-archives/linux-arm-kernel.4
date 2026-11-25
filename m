Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D3A606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 16:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=w38TOBCd;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=doebPFNN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=pJ3jiXjc0dbtp1gpHGxkuxTP4xnJ6p2qseuosud8wjU=; b=w38TOBCdxfUi28
	/KoDdMaInh9fUla9oN7Y5zTUNpBYiEoJ97TiO7RqRqfnbN+1af2vyd7TN5hLF8HFft8knYWnLu5xO
	5I3Q3+oZJp7PMZ90GqMPLmoLOLO7lX9GpFDs4HSktK4HNL9ScTOLYO/azEahVktfprur+E9m4XmiI
	onqEEWnRaCleYWAXxsAD2o0g5WGtTNhsVzqqqFJYnRd9Qc3URxuJfP+AiDqk2WOSnlrvcmx/u9JsZ
	EbrEbMBDxciJh74urE3o9Vif72AV9k9guvZxTdHU5InYSLLLIcTe5J8KcPo03f0xmmFdYlqcZU4Mi
	lR1tlLe868YHf5fAxhpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWFd9-0000000AW0D-288I;
	Wed, 25 Nov 2026 16:13:59 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWFd3-0000000AVxb-3W2Z
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 16:13:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QU8vWYO49ODEYo3SZLB3jrvs54b8Tzz7eU1sbiGqqIxSB1enltqQQZiJAC7LE4Me87fCQYH43wkvX0QypgLv/qk2DredOA6E/uyk0UwPP/fX1yaDBhrM/XgEI+aLoeqxdZYdwwt9bCfVm4RZ+9JScCM52S02f+wsTu5t7TsA/FyfKCOCPj8y+aS5BgjicJIGvVcRbB3kW7u07imjpw87g5i3K6YXk1KcRxRsFF4FxNk89bJmxnZ+qS32N3hkFxubLucaXrEgL+UnJ0+9ur4h76j4KIdON8ljpII3Oe5D2DQd04Y9Fr+cwSdtYsaqXHgFbBVvJZpiovW1EWrtOAyhAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pJ3jiXjc0dbtp1gpHGxkuxTP4xnJ6p2qseuosud8wjU=;
 b=ZlEcpCZhsvUcq4UdhELKMXa31UH33O4NFWZGk/psjHDoF6xVV5aWHLFLK7ajV8o3p5YhLg6QTNB1lr5DFvxC+wH00betoxzEB1yDtNrouPrhwTD7cLYu5fZX8liEcjZZ0zmdT9gwT4qYFdtBAi9dJYUE6PhLZ/3NGGO8Iya+5cbTNmF2mpTZrDltIfuCcMVJBknFC+bc4e5HVfWBV6G1fJu1f7pZnIozohHqfe0DcwNG/hewSefChNyizFCRw25KbjgA0JX6I5Lk/PqmSq0awEREK3x2UrefOhlbJ6Hh8MvftT/OMSxWihxtCoTDLtkQIKdJ6srmBOwiHsE+WuNx2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=teslabs.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pJ3jiXjc0dbtp1gpHGxkuxTP4xnJ6p2qseuosud8wjU=;
 b=doebPFNN01sLtM9IAGXYBwlyA1V1C7t0zDp7AaujRBgtCIJkRVvNIxosqGl+M1KQCrRvpUQzz+MPmUIHYXpX7M820et+hnb5DbJmA8WLBzNkHO9dCFI5XtgsPO4EFWDbtN568rsbdL06bjq4Vr6btMu5A/C8jRqr+XFm5tyS6Js8JlRSqfYAo0CwGBcW7HDJWXqR3hGLlm7APEm7HkFP1pA2Ctk1vySFO0FOQ2ryxZroZ7aUeeqaJoqqOeQGGHKS3/cO8QDTgsrs+Ewkn42LhzEvvH/0FYPovvnHSm/zTzB51dRgwZSeoiLSYxpJz2dIJbSjRpQkvbnjiqr4TwJyDQ==
Received: from PA7P264CA0279.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:373::20)
 by DB9PR10MB7292.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:460::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.3; Wed, 25 Nov
 2026 16:13:47 +0000
Received: from MI3PEPF00008559.eurprd05.prod.outlook.com
 (2603:10a6:102:373:cafe::1a) by PA7P264CA0279.outlook.office365.com
 (2603:10a6:102:373::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.7 via Frontend Transport; Wed, 25
 Nov 2026 16:13:47 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 MI3PEPF00008559.mail.protection.outlook.com (10.167.240.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Wed, 25 Nov 2026 16:13:47 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 25 Nov
 2026 17:14:42 +0100
Received: from [10.48.86.251] (10.48.86.251) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 25 Nov
 2026 17:13:35 +0100
Message-ID: <40e3077d-8562-4340-804a-43691b62a9cb@foss.st.com>
Date: Wed, 25 Nov 2026 17:13:35 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] iio: adc: stm32: describe the STM32H7 temperature
 sensor calibration
To: Gerard Marull-Paretas <gerard@teslabs.com>, Andy Shevchenko
	<andriy.shevchenko@intel.com>
CC: <jic23@kernel.org>, <robh@kernel.org>, <conor+dt@kernel.org>,
	<mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>,
	<dlechner@baylibre.com>, <nuno.sa@analog.com>, <linux-iio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <andy@kernel.org>,
	<krzk+dt@kernel.org>
References: <20261124202220.23721-1-gerard@teslabs.com>
 <89f43760-01c7-43e8-9682-b7363ffc931f@foss.st.com>
 <20261125135500.5306-1-gerard@teslabs.com>
Content-Language: en-US
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
In-Reply-To: <20261125135500.5306-1-gerard@teslabs.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF00008559:EE_|DB9PR10MB7292:EE_
X-MS-Office365-Filtering-Correlation-Id: 3eb68775-971e-4be4-74a0-08df4b0f15d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|23010399003|376014|7416014|1800799024|82310400026|261026121527099003|261026140227099003|261028144727099003|261022105027099003|10067099003|4143699003|56012099006|11063799006|22082099003|18002099003|261009223027099003|13003099007;
X-Microsoft-Antispam-Message-Info: HDjSsmBTCYu+lA6UoTfO1zKGJhPnA+BCpPWOME7tRmqdH02wCvtGvLR+YeVUsQIBebpSNevJ4Y88eCz2udtoZJrH6IV9d46yMRNE+N9DR+UjMIWPRWuekb3XBM2aKr2W9U9A37ico37bCPdbael5eQziuD9KgnYSs0GMEzEAKBATmAYvrd7bMdlefoqOzW+FQAz/dJHGsJomiiigG0nWtSf3g8EBYBvbrrp7aosRNvOw7nqVEC0yeF2dK7vZNzX/C39Dvb5KG1I023mlgD07VjN5zxo88x5o33g3HSvwRcL+ljdcmbt7O9vKV9rMgjyPI8KvXG2ZOPilk3yKPpnsG1/FXK6dCRyCzjUJIdHVXqcXoIEN3SZFzi70nwiopaxf5Ejbtz9BcWfkeuw72CTTyGcxzYMAGTrkRcAUmK2j2IghFLy9UQ7WZ6cDWXHyRYSONj5uT09NGkPsKGFbRmhiHIucyvSHv1/gIL8YyynvgsnmX9TxJzdJqMdG8w/F3Q/+GmA/0xz0bK/qD3USGUPW8BfSXv1k4MQA/1ehX+Ab7QhC1VIt5/jSXeq+s9LQdxtias8TJgqHPENQESJatvuf2aPhqFG9A/o45peqQEmfhOOlw+b0DAQTzzSRE9hMJv8DkY6GDVML76mvHekaJZW8ui0Rbb0+XRrzk5x5w1GWAOE=
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(7416014)(1800799024)(82310400026)(261026121527099003)(261026140227099003)(261028144727099003)(261022105027099003)(10067099003)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003)(261009223027099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: mhRtbMUyRb/ctrbKAEaqpd0QBWFCHMmZriuQ9bWf4lhffRJym+u6fSFAmA75Urm9tj3cWeY/GzWlURQ0tgHlhdSzLbc+8yCWL9/ax/K9u+GmNnq2A0ch9JGCJe7MWtqx6nUXvSehajS0hrikKiPcJBTT7HEYJvX5A10F9R5ag+VszKyk1hq+xq6LzhZQiGzC580xmXCO7gnjlmmmjjhlNE/jjYsGQYJ97sWyO9j+dTe/XU21u5Xbncxb+hDFKWwI/8G+FD8qOVOreCM27Udw3bEVSoRVinaTY5JJMr9WyCeIFFr8i9UKRMbgNKB7ISSvwSSafGN+2dIMMG8/NqiWjO5LAcdUpi+Wt1bK0MOFkypKyPJHfzTJErgstFDpjT/HtCvaCbXe8yIGl1spuaEBVtL9Hee8TW+Cq3s0s1qkXXtg4aCPAjZNv0E4dkmkPCBy
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 16:13:47.1957
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3eb68775-971e-4be4-74a0-08df4b0f15d3
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: MI3PEPF00008559.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB7292
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_081353_992897_4D296D28 
X-CRM114-Status: GOOD (  13.50  )
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/25/26 14:55, Gerard Marull-Paretas wrote:
> On 11/25/26 13:56, Fabrice Gasnier wrote:
>> The DT is deprecated and are going to be removed [1].
>>
>> [1] https://lore.kernel.org/linux-arm-kernel/2afd5f78-0174-4955-8c1b-be18aea3800b@app.fastmail.com/
>>
>> So I'm not sure the dt-bindings update is useful.
> 
> Hi Fabrice,
> 
> Thanks, I wasn't aware of the removal. I'll drop the dtsi patch then.
> 
> The binding itself stays, as it covers the STM32MP1 ADCs too, and it is

Hi Gerard,

Yes,

Well, on STM32MP1x, there's a dedicated "Digital temperature sensor (DTS)", used
in Linux for thermal protection. Hence the ADC based temperature sensor has not
been pushed/supported here, as ADCs are usually kept for other usage. I don't know
of usage for it in Linux currently, I think it's quite unlikely.

That why I wonder on this is useful or not, w.r.t. stm32h7 dts removal.

> used outside Linux: PebbleOS describes the STM32H747 with it, so the

I don't know PebbleOS. Just for my own understanding, I guess you're using kernel dt-bindings
to validate the external h7 dts ?

> temperature sensor calibration cells would still be useful there. Would
> you be fine taking patch 1 alone? If so I'll send a v2 with just the
> binding.

The binding (patch 1) seems correct to me, also regarding STM32MP1x.
Just as mentioned above, I think it's unlikely going to be used here.

I hope others can comment, on taking patch 1 ?

Best Regards,
Fabrice

> 
> Best regards,
> Gerard


