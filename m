Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51EB0606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 12:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RsxJhKyT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=QKLY2jXyrAx2FalvWMFlssOa0JIKEGBWkZkA9F1hY2Y=; b=RsxJhKyTV6hkFmg5FZ69ObsVuW
	RrEPKzr5F4T1rfxlcp1mLKGRDKiTdlBBKSlHtapfqnnHUGC0FWAAoKcnJpyYcG786dYpW/vRn32Et
	sHKguOD/L9RvBr3KD+hHtplsbxTXh6boX5kRy8qpiu7SXxClzaJNax3hp5A9NBNjhPawxGbVDPDcw
	5x/OvPyAz+G7GMbC0vXz5RdVyfW0RV0HDgUoOrDIIJPVV56TFNVLgJUWa+UjZ6oKUp0DmZXFNpJKs
	fFxuP9wN1lDhMsEDAegStQq/1kiOhToeZQQ7ldMLYekN1ytjQo/o7BLYEBZYL2/V3Nbw4J1mQgd0s
	m68dvh1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSvsC-00000002MQc-3tsD;
	Mon, 16 Nov 2026 12:31:48 +0000
Received: from mail-japaneastazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c405::5] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSvs9-00000002MPp-06c0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 12:31:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yclTqoHlCOtBVHSStUftblHFMXkkgSUldog+Dpf7MTEUJgoULOCZMH8MLMFEy9FM0SLkZWVaIRxYCaB3obO5KqaLKf3S5Q1b+EG4XseZxztx3qBg/L93LfJeAwFaMUCsTkasmC33UIlY2YGZt2D8dg1r7bUl8Rl2yLPSiZWUZ1P2VN2KgzWpUx8yyqydBTW/aZouFrk6nfzJx8hB27X4EJHOKH3dnQpBtOGhTK2KAVPEnYXckr8JhKlM4AICPJDZa06NlgEeVeUiyQFkiObuL9H23h3oYESbYEN99PmJgtyN7/uHt9LmZHGGijzp+BM1O5za4/ZOecvmWrDmipAUSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QKLY2jXyrAx2FalvWMFlssOa0JIKEGBWkZkA9F1hY2Y=;
 b=nasDwe8mu0HHdkqbQ/uMQNzoSdNsw8Dj1hnS3ZNohsXMg4I1xLqLcZOevcZLklQ2tNmQrGpl7DqZCBesc7D1R5siMqbegfw6sunrTWnX2L9E+iPEzNtkmMXEMTJgTrB479PLiAgUCenT2oCs0GC84ZqbMsT+WpgFfcVuS7sZO7OHxIW+oiPipHOg3FoQdtvT/FL/OXJ2E2VqyUO4DzUF3B/ToKHztw6bxSdLZ/ksT2jfKkwqX5BcDOcVL7dq1buu56zk0KZ9opuDIXv0f0ncSW2jvqxdMWMDQVZLEl4NKeW/azCmgoFBwk0JlkeoH5lnXImSpd24a1bVG7LKsSTejw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR01CA0012.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::8) by OS8PR06MB7322.apcprd06.prod.outlook.com
 (2603:1096:604:28c::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.6; Mon, 16 Nov
 2026 12:31:36 +0000
Received: from SG2PEPF000B66CF.apcprd03.prod.outlook.com
 (2603:1096:4:191:cafe::16) by SI2PR01CA0012.outlook.office365.com
 (2603:1096:4:191::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Mon,
 16 Nov 2026 12:31:36 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CF.mail.protection.outlook.com (10.167.240.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 12:31:34 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 6EBA8427EFC6;
	Mon, 16 Nov 2026 20:31:32 +0800 (CST)
Date: Mon, 16 Nov 2026 20:31:31 +0800
From: Jelly Jia <Jelly.Jia@cixtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: vkoul@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, robin.murphy@arm.com, sboyd@kernel.org,
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com,
	devicetree@vger.kernel.org, Frank.Li@kernel.org,
	cix-kernel-upstream@cixtech.com, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, joakim.zhang@cixtech.com
Subject: Re: [PATCH v3 1/5] dt-bindings: soc: cix: Describe the Sky1 AUDSS
 DMA IRQ controller
Message-ID: <avr3o+uIV6llV8yw@ubuntu>
References: <20261106013520.1134450-1-Jelly.Jia@cixtech.com>
 <20261106013520.1134450-2-Jelly.Jia@cixtech.com>
 <20261111-victorious-persimmon-chimera-de9e4e@quoll>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261111-victorious-persimmon-chimera-de9e4e@quoll>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CF:EE_|OS8PR06MB7322:EE_
X-MS-Office365-Filtering-Correlation-Id: ddb5f2bf-bdcb-46c0-c6af-08df43dd8dad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|82310400026|36860700016|10067099003|4143699003|56012099006|261022075727099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: Pf0zm+RYeCYxviEVSMwjkWdxPNpyFyEXs1i2C4PIrdnu1whXG2aLTMKMw7fUGnKN0oSEXMUzJDvDrxsCqNiP4e71cBFjyjqX2laUhql6hqApo17hJHgQDNIrEf9m/J4RtF+CwaOOnhtUdwnCxgL6gpaaMcolrK5JL2yVzShzoVLWdXtyd3rynwxo2OL9WCJd8lpAW2TsIaryXFb7IIWaDBVXVeFPDtuEsr8OnPqUnqbd0KjqRPS3ccrdrCXZfbiWHFGYPaTxZLcEQOLP31SObm9PoAaEW5GwrSBe5gQxi0SzFrSTpIdbIIC8DmzHPK11qzVQgzlhnMOtI0lL1Dfg4WypiKYGeFqyaqNm93R7fxdxwZ3yh+FwGgsKLrD1JuP+fohWNlw3GqzOuLXM5Ji1/NquXTAnNgyZ4UZ0/PBgOhY8tRStmjtG+YAgLHck0zeSDItjdMaG1r1wMX+MHAW80pZRaT2PaSfr+S9c+OGewg6buVJOHhMfY0ClVZ1GG+IzXkHR9UzMgoFEhIy38KWNCBCCGcMvNeN3W99iIFIZt4iqvoAbL/aGKuIDXG140Dvdo0cI8RSLBS+xl4yPhzsF3VB4lbgGbx0yCzDYuVlqXIU1ctGdvgRLrDihau3hIhq4bkKt0mD47NP7o/vh1zns5vck/pNlO/SxGNF+kZFQ59qwF0/pEHOJ6ORgCv6+C3tWMa9Zw+8TZwiFVD7PoHjNsw==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(82310400026)(36860700016)(10067099003)(4143699003)(56012099006)(261022075727099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: q0OxCsUTiZ0PfdzvSfUzksAXy/S0fXobh2bzl7mBwesSt1+VKJPE4g7pXLlV9o8SQ7T/0ZGVqq1oxU1FOyZylJ+pM7la51NREiuSzGlGl28TSHN9EiiwWlU/iUlGuEhu5uON8wXkkSMHJqGjVlAwp3Ibxf3UsVUgHWY+KF7QdJXAGT7DmHfiF7uWOpBK0EAd1OkbpSljKifP7dSuPpWhcYYVKZsNBzyAOz6SgCa9agIh2VF0nKejcMSIUncY06g7HiO6MPTdoGjbg27nm628+SxZcKliX6YA0GAMQFRdIQakkEX4jaLuoJM6dflC73Hn4BCzwnCKLhyifNha/TIwpF8kLbAJtkjAPvc9ZbxzL9jX97+JlH1hOCEwgHyD3RogB3ZH95woU8dqqNzmi67SUHKIofU1kxgIJl4aZbk9Q+zjPe3kXqebQmhGQ7gzKuUY
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 12:31:34.4863
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ddb5f2bf-bdcb-46c0-c6af-08df43dd8dad
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2PEPF000B66CF.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS8PR06MB7322
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_043145_066261_E4C97549 
X-CRM114-Status: UNSURE (   5.84  )
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

Hi Krzysztof,

> And everything could be simplified with:
>
> dependentRequired:
>   interrupt-controller: [ interrupts ]

Thanks, I'll use dependentRequired as suggested and drop the redundant
conditional requirement for '#interrupt-cells' in the next revision.

Best regards,
Jelly

