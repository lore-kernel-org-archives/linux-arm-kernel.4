Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D53C8606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 07:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QWV3Ohj9;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=xcDvjQsF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=jzOyMwXQUb9rLQyDRbGzKyjjsNQyDBf+bYzH9snqknQ=; b=QWV3Ohj9pgYfl10OPU/iTrzgP/
	NsB/QjswFv0C4WAaeR/DTNRrnUdAY+BrSMN9cYzpOflV7l3AwugURV53b5JmKzZnHnPyFdk/G4tcY
	gUcNKl+O8dp/Mie1/wrNKqJ9YLJxSohsNbA+696olZsoQ9Q0xHsbP0VOs64sVv/M4ffMCPfQgVs4a
	0/a/jHwtix50IC5eMhnq6pAC+wIdTyZV3HtI7wiABEdZLOTJ9Eh033KnL2XlKmM7GkIpvzrExM1vw
	57mwborn++qwKewzGDzcfHchhtdOVXc4LT7E/cmGnUQwxY3SwdgOC0r5hXVxi09Hgh8O8Qm1yFeKZ
	FtZLOLQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRPZC-00000008xx8-3Ssk;
	Thu, 12 Nov 2026 07:49:54 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRPYX-00000008xUX-3psn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 07:49:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l+/Dtd76490QqCSPUmS7EHXQK+LtTC4+8MDkx72MjSdxgD5Zk1iRoWHEkTTdEsw7ULjjvzhQdh+SCM9U/d/4J6BgMaYTfY3ZJU+NkQ0c0Vy0LTbRDjdb5sZJbT41ZU4K0DBLx+f5n96hGyEE5mgU2swKxnRdkYZdnvPmNq4D/ZhRMxyOzkZpoJS+XSdZ7hY+In/0R4CI3q4gA7RuDckAizNWwun/amHGi7jrAr20QQ+c2t/OCuKaNqndi3zbCWh0TaDf3rcBO+gbnYSSYYixn5NDc7F6bSQQBIVkzpjPf8vK8vnFLLDSOuGhaVjR6gAksUMJvZKJdr/AaMJts5fa2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jzOyMwXQUb9rLQyDRbGzKyjjsNQyDBf+bYzH9snqknQ=;
 b=sYxl6STSy26PqCYfSkpo+2212YonBIUpk/33ChwRB5bzsTammVHZsmdT4FYrJiOFiJihCbGDSsqJKlWS1LVcoFI6KBX6usi3Q38uwGwl6NOcOJZ7a+K6viBEphWRFGPgAQAp5L5adGMexGZkjr4UoE5QVk8RDvdsVLtMI2Wejj0UZeRVjxfHCfSUrd+SWZePUBIAtBFONcIl+Ooxb0L7DLYd3hnEmPA3LvQIsuSJpaRPPk3BsecXaboViEgdHQ4dcJ1lOBnw4CmQq7W3yjEbzDJ6xsqSsI7moLqp0JbSGuafHtHpd0C5Vi90AbwGKitjFe5B40FnjfnJLcgrFO6IjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jzOyMwXQUb9rLQyDRbGzKyjjsNQyDBf+bYzH9snqknQ=;
 b=xcDvjQsFUz+ukxFzwe2alJLlWnxssJMtPMqN+td4xVTJCikKL8Tb/seDZEKuZRnfRc6uw7pIs2hLE+vw3TjZbqQfPeGt7TFym9n4OQJFkiQ9xHzrYoeLaVsFVWNaN6kKy03CnFsT6z9/sqKzypNM8OVZNixZgJmxq7MGO6qsBT2e5EzfyRR/GFHr5TlkOvYv+sJWQqGd+eiSb+hgDY9xoWaLuhivvnwZBMjMftyPv3PdjEvFu8UGDllVLILvfS/vjq9pWCXVh01NJYWzVtuardm+I8n1cFLKNuZ8uMcMMK0ZGTIKT9O7XIuW89Cbdn7MWCrdMq5kT89pq/Sf0xe98Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DB9PR04MB9645.eurprd04.prod.outlook.com (2603:10a6:10:309::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Thu, 12 Nov
 2026 07:49:11 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%5]) with mapi id 15.21.0615.008; Thu, 12 Nov 2026
 07:49:11 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Thu, 12 Nov 2026 15:53:11 +0800
Subject: [PATCH v6 8/9] dmaengine: fsl-edma: support per-channel DT child
 nodes
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-edma-iommu-v3-v6-8-b038edb8ce6f@nxp.com>
References: <20261112-edma-iommu-v3-v6-0-b038edb8ce6f@nxp.com>
In-Reply-To: <20261112-edma-iommu-v3-v6-0-b038edb8ce6f@nxp.com>
To: Frank Li <Frank.Li@nxp.com>, Vinod Koul <vkoul@kernel.org>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Laxman Dewangan <ldewangan@nvidia.com>, 
 Jon Hunter <jonathanh@nvidia.com>, 
 Thierry Reding <thierry.reding@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Frank Li <Frank.Li@kernel.org>, 
 Larisa IIeana Grigore <larisa.grigore@nxp.com>, imx@lists.linux.dev, 
 dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 iommu@lists.linux.dev, linux-tegra@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.16-dev-7bc12
X-ClientProxiedBy: SI2PR01CA0012.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::8) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|DB9PR04MB9645:EE_
X-MS-Office365-Filtering-Correlation-Id: a9969c25-2b5f-4b6a-470d-08df409170ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|19092799006|23010399003|366016|921020|10067099003|11063799006|56012099006|261022105027099003|261022075727099003|261028144727099003|261026121527099003|261026140227099003|261021123027099003|261021121427099003|261102123227099003|261009223027099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: WCjQER1zXA5Rmlz+apbo7td6sMJ0I7DT8OfmtABMbZcqorN23WCfZ1sdD5IcRr6Z8sw+N0leh0aSmz/6QZNMY8E+WPiNC+ytqhaob7nx1ZBi5uZ2YHOftGaJyXHTiUQT1wprWCOCf7txQ5nJ5/hJmrcWxaSPhK8G/omd7Dx0mCTWXiAKl0ef24y0UdX+Gn8fXL0cvE1SQaARmwzWbLlrt81zZTLV07CXZYN+AVVKf6gnnkQDX/ZM7tFFCHSC7aYJqunBwpnwCzTarokF3Yw0jZWO8iPZDk7zBJW/saYrWqFaBXEOWFe/26de3ds+NCocgZbcOHH1Va8DebHC7Qj+c0nH9bR7/j4zAyHLUCIDVQ0Elw4tdICt1ilJYh080ciP2hFOO6Ddfk7N8ED/mVIEKvzKwcK2cywL81wYzTeMM+n10BH5Huo5kvHCnQJyd54njVqRTKtm4DfFpAdy9yPUmTudmUplm4C13OGKym+53M3tjoVweJttuJTrUusrep7NbYgzPyKOj7iOCIY+kGqnTCfgR3vaJlXE5Ek8nFtuuuzXLdSgH+9bF8rOuykC+ngD1b9dNA2J2aqACef0vQ5kssSBcsYCBbHZgsZMGB9VORMxoejBJFTfM3soLv9995XtwKaQ8DpsWVOh0Zxy3kwEXQIJlywxh+kAUJMkX2SMEycmto7eMFNz/KMuEjXIPyiss6+aU1KsIBpreUAJrUQAEg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(19092799006)(23010399003)(366016)(921020)(10067099003)(11063799006)(56012099006)(261022105027099003)(261022075727099003)(261028144727099003)(261026121527099003)(261026140227099003)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S2hmZ3VlQWNTYk9DSTBGcmtBQVVpWUg1T3N1dWNhNjZ4Y2Q5NHNrWkM3NlVq?=
 =?utf-8?B?dkJqbnJsd1czcDJiTjl2UTloY1V4RUM3NlNwSk5SQ2VYM3hSb05OZ0xTaWZr?=
 =?utf-8?B?QS9NbDV1TU84WkVWdmNZT0duY3hFd0cwZlF3L0FRNTNqYUhqakdpT2kvcVZq?=
 =?utf-8?B?bUFlMWdEeEt0cFF1VHVrQzlJQ0ZuZUJ1U0ZmZmg1a0xCWDV3dTR6aDhlQm5W?=
 =?utf-8?B?TDB4ZTJGSXk3b2twUGE0clFRMUFYMDZlMUVCL3BaMkExcVh4OWEvWGR5M0RW?=
 =?utf-8?B?NkMvaEUrWnlCRmU5VlhMaXgxNnhLdEVqZUVNbVBGSHBhaDFUbU9xdEk3eTFq?=
 =?utf-8?B?ZDM1cGdDK2lrOWdmYnl2aGhhNUNpVVV6bEJ6MEhjdTdPMnQ4NnlQRy96aVR0?=
 =?utf-8?B?ZVRWbEsyVTNQQWNweVNlaFg5ejY0eldBaDYyUHhocS8vOGRrWlhTVTFQakRo?=
 =?utf-8?B?QWxGQkhVb3NqbUNCRm52SlBUZmwwU25EcjNxcnMzWklMWjJlMGt1Y2o4QS80?=
 =?utf-8?B?R2dpek1EWjA1a2MrTkNiUXpyczV1NCtJVEtCQ2dhMzBvUkRhZzZRTExidnR0?=
 =?utf-8?B?Z0hDZ0RvOFJyUC9YNkIzNjlDalRmSzBUNzhtbVFuTHlVc2l3NjFIUGFJL0Zh?=
 =?utf-8?B?S3htdHUybDd1SGJidTJ6L2h0OWw2SXdDR090cURiYjJTbTl4Nm1nNXlJbTRE?=
 =?utf-8?B?L1QydEJPMWQ3b1VBMVR4b3g0cytWcmtZRHB5bm4xMnpMTHNwUzBTM0N6ajh6?=
 =?utf-8?B?T1BqUGRHQkxBM1BWczNpY1Y2TFRPRTByUUNLNGErb2dJY0FQM01HemxZbi9N?=
 =?utf-8?B?WFdDVEdCb1JrUEtlY3JpRGFFSmppNlFSTGVDU05Rc2tLZmtubmdtNi85bGRU?=
 =?utf-8?B?R011SHBBT1ZPd3FLMjBLSlZkK1hkNDY3N0hMTktFa3J2Q2p2WU9WRWRONHRM?=
 =?utf-8?B?UW9CaVJrNVJjd05Bam5tWWs3bkxYeXVhYjlVcFJ6d3FRQ3ZtblNXUndZa1pl?=
 =?utf-8?B?aGJQRjVZQUQ4ZW9KbXJqaTZBbWRaUmVqdGk1dFJvYWVCSUlmc3VXYWNoMFRO?=
 =?utf-8?B?MENTTHUwVktzZzNmaEsxcmhvRThIZHN4dUFkaEdKbk9kb1lHcXM3MDZCWnha?=
 =?utf-8?B?cjdyeXJpNWgrMExmcCtuODJDL01CS2pwL0UxSVBYZkJWVm9KMnRTVGcwQVgr?=
 =?utf-8?B?bEU4ZWp1ekk2YU9qbVNHSHMyaDlsZ1QyeEtUZDNnT0RsMzRvRHZnRWFUM3RD?=
 =?utf-8?B?WXZDb2dMaTdaM3ZSZ1QrdFJDNHVwdVh1MjhNTjd5THBFYlpEV2xBN0ZaSnlM?=
 =?utf-8?B?dU1rdTdGd0FjeU5VQmd3WjB0anJXNHdMWnpvU042ZEcwa296WjZiL2t1OXlY?=
 =?utf-8?B?ZE5HSVV0d0pWYnA2dzJxY0ZoU1VEWGRGdDgzU29VZ0pZQ2VYanlzRmVieVpV?=
 =?utf-8?B?OFVBQXV2UkIxWFdoc2pTc3luMStBZHI2QlFsZFVpR2tnV09tVWtPZTdzMFdy?=
 =?utf-8?B?QjhZV05rcVJaZlNYN2VpQ3VLaFdlYlJMSUFTVzZiVFVPYThZaGhOZmdBOEl1?=
 =?utf-8?B?aWlzTjQ1dCtPUTcyOTJNSW9rTVRHbFlScE93czZsK0Y5SysrUDRiYVZJM1dH?=
 =?utf-8?B?L0RYbzRhL2VsSWpXcWRlZ2E1VnhYMGZxajJIZGhIcXl6Y2M3cE9CWTdyVUVB?=
 =?utf-8?B?RUFsMlVEVmxTbVhNc2s1RXNueHVsZlRaMkFkYVBwMzBSOExLSTFOVngzK1Ux?=
 =?utf-8?B?OS9hMUlLWEVHRTN6cmdUTnE4VG96QkJ3R2FjQWdteEcwRTYwQUNMMnJhQ2g1?=
 =?utf-8?B?aDRqdjZNdXUvb3p5Z3JCSGxVdUs3emZ2UWJNeENycCtFbW8vY1VXWUNRb012?=
 =?utf-8?B?MUQrUUpNZldpL08xenJ3VzdteVdzQ3NEbFR6K2lvQUVzaU13ODZYdWtpYWxh?=
 =?utf-8?B?TjE4VUxmd21Uak1QTS9yTGpHMWlYeUtiSUZiODhIeUUybXVXajM2K2cyQjVy?=
 =?utf-8?B?NkFURnZUcHFnajNVMnR6SGhjUHd4TzRNckFiWVEvZ3BzY2EzSk5QMExGOWlp?=
 =?utf-8?B?V3JsaGw5T2ZydU5ORFdjdlp4YnBZb1R3aG1MNlVpNTJzemNJUk5uZWlLbzlM?=
 =?utf-8?B?SGlIb1E2RWdzOUNYcXAvSWlrWWtsNXNYTnBXb2pxL05oeXBqSXAxYTYwRmRa?=
 =?utf-8?B?RUtqRzBEajR3T0ZhcmQ5V3lXOFB0dlI2ZCtPWmxmS1AySVFTQTlqRW4raW1E?=
 =?utf-8?B?RDhFRFlITVliRklRSW9raXgvckJaRW0rZDFGZWw2Y2dpbXF6VVB0V2dUcEM4?=
 =?utf-8?B?TytPT1hrUnhzUUwyK0cwaDd4U29PQWF5ZlJlZ0U4UGR5UkQ5d0VVVTNHRWxW?=
 =?utf-8?Q?AuukPyh2U79hWzxlhMeoYRK/R3onntyeINEj3?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9969c25-2b5f-4b6a-470d-08df409170ab
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 07:49:11.5900
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JMLY3v4R6I8e2BdOQ1KOmVUXxJsEw+J6azTQnJ8xtdB4popgEdIKN39NhhVBIBvY6OWCUT+N3N6zfJuxpT3jFXtfcYkTidCvOdebeMIwHc6oHFBtg19m3wQFpG9YJhGb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9645
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_234913_974675_7071169A 
X-CRM114-Status: GOOD (  21.57  )
X-Spam-Score: 0.0 (/)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Peng Fan <peng.fan@nxp.com>

Add support for parsing per-channel child nodes from devicetree.
Each child node can carry its own interrupts and iommus properties.
Child power-domains are not handled here; power domains remain attached
at the parent level.

The implementation is split into three functions:

- fsl_edma_child_to_chan_id()
- fsl_edma_configure_chan_from_dt()
- fsl_edma_configure_chan_iommu()

Child nodes beyond the configured dma-channels are ignored, which allows
boards to reduce dma-channels without disabling every unused child node.
If child nodes are present, every unmasked channel must have a child node
with a valid interrupt; otherwise probe fails with an error asking for
dma-channel-mask.  In child-node mode fsl_edma3_irq_init() does not fall
back to the parent's flat interrupt array.

The shared error IRQ remains a parent-node interrupt.  A child-node-only
DTS without that entry simply has no shared error IRQ.

Use dev_err_probe() so -EPROBE_DEFER is not logged as an error, and reject
a channel whose iommus property did not result in an IOMMU mapping.

Existing DTS without child nodes continues to work unchanged.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/dma/fsl-edma-common.h |   1 +
 drivers/dma/fsl-edma-main.c   | 199 ++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 194 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/fsl-edma-common.h b/drivers/dma/fsl-edma-common.h
index cbb077e98f55..8843dd5661fb 100644
--- a/drivers/dma/fsl-edma-common.h
+++ b/drivers/dma/fsl-edma-common.h
@@ -271,6 +271,7 @@ struct fsl_edma_engine {
 	int			txirq_16_31;
 	int			errirq;
 	bool			big_endian;
+	bool			per_chan_irqs;
 	struct edma_regs	regs;
 	u64			chan_masked;
 	struct fsl_edma_chan	chans[] __counted_by(n_chans);
diff --git a/drivers/dma/fsl-edma-main.c b/drivers/dma/fsl-edma-main.c
index 818b9b986f13..88d2b9d6b6ab 100644
--- a/drivers/dma/fsl-edma-main.c
+++ b/drivers/dma/fsl-edma-main.c
@@ -12,11 +12,15 @@
 
 #include <dt-bindings/dma/fsl-edma.h>
 #include <linux/bitfield.h>
+#include <linux/math64.h>
 #include <linux/module.h>
 #include <linux/interrupt.h>
 #include <linux/clk.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_device.h>
 #include <linux/of_dma.h>
+#include <linux/of_irq.h>
 #include <linux/dma-mapping.h>
 #include <linux/pm_runtime.h>
 #include <linux/pm_domain.h>
@@ -400,12 +404,21 @@ static int fsl_edma3_irq_init(struct platform_device *pdev, struct fsl_edma_engi
 		if (fsl_edma->chan_masked & BIT_ULL(i))
 			continue;
 
-		/* request channel irq */
-		fsl_chan->txirq = platform_get_irq(pdev, i);
-		if (fsl_chan->txirq < 0)
-			return  -EINVAL;
+		if (fsl_chan->txirq <= 0) {
+			/*
+			 * In child-node mode, missing child nodes are rejected
+			 * by fsl_edma_configure_chan_from_dt(); do not fall
+			 * back to the parent's flat interrupt array.
+			 */
+			if (fsl_edma->per_chan_irqs)
+				continue;
 
-		fsl_chan->irq_handler = fsl_edma3_tx_handler;
+			fsl_chan->txirq = platform_get_irq(pdev, i);
+			if (fsl_chan->txirq < 0)
+				return fsl_chan->txirq;
+
+			fsl_chan->irq_handler = fsl_edma3_tx_handler;
+		}
 
 		if (!(fsl_edma->drvdata->flags & FSL_EDMA_DRV_ERRIRQ_SHARE)) {
 			fsl_chan->errirq = fsl_chan->txirq;
@@ -415,7 +428,11 @@ static int fsl_edma3_irq_init(struct platform_device *pdev, struct fsl_edma_engi
 
 	/* All channel err use one irq number */
 	if (fsl_edma->drvdata->flags & FSL_EDMA_DRV_ERRIRQ_SHARE) {
-		/* last one is error irq */
+		/*
+		 * The shared error IRQ remains a parent-node interrupt at
+		 * index n_chans.  A child-node-only DTS without that entry
+		 * simply has no shared error IRQ.
+		 */
 		fsl_edma->errirq = platform_get_irq_optional(pdev, fsl_edma->n_chans);
 		if (fsl_edma->errirq < 0)
 			return 0; /* dts miss err irq, treat as no err irq case */
@@ -703,6 +720,168 @@ static int fsl_edma3_attach_pd(struct platform_device *pdev, struct fsl_edma_eng
 	return -EINVAL;
 }
 
+static int fsl_edma_child_to_chan_id(struct fsl_edma_engine *fsl_edma,
+				     struct device_node *child,
+				     struct resource *parent_res)
+{
+	const struct fsl_edma_drvdata *drvdata = fsl_edma->drvdata;
+	struct resource child_res;
+	u64 offset, ch_id;
+	u32 rem;
+	int ret;
+
+	ret = of_address_to_resource(child, 0, &child_res);
+	if (ret)
+		return ret;
+
+	if (!resource_contains(parent_res, &child_res))
+		return -EINVAL;
+
+	if (child_res.start < parent_res->start + drvdata->chreg_off)
+		return -EINVAL;
+
+	offset = child_res.start - parent_res->start - drvdata->chreg_off;
+	ch_id = div_u64_rem(offset, drvdata->chreg_space_sz, &rem);
+	if (rem)
+		return -EINVAL;
+	if (ch_id > INT_MAX)
+		return -EINVAL;
+
+	return ch_id;
+}
+
+static int fsl_edma_configure_chan_from_dt(struct platform_device *pdev,
+					   struct fsl_edma_engine *fsl_edma)
+{
+	struct device_node *np = pdev->dev.of_node;
+	struct resource parent_res;
+	u64 child_mask = 0;
+	bool has_children = false;
+	int i, ret;
+
+	ret = of_address_to_resource(np, 0, &parent_res);
+	if (ret)
+		return ret;
+
+	for_each_available_child_of_node_scoped(np, child) {
+		struct fsl_edma_chan *fsl_chan;
+		int ch_id, irq;
+
+		has_children = true;
+
+		ch_id = fsl_edma_child_to_chan_id(fsl_edma, child,
+						  &parent_res);
+		if (ch_id < 0) {
+			dev_err(&pdev->dev, "invalid channel in %pOFn\n", child);
+			return -EINVAL;
+		}
+
+		if (ch_id >= fsl_edma->n_chans)
+			continue;
+
+		if (fsl_edma->chan_masked & BIT_ULL(ch_id))
+			continue;
+
+		child_mask |= BIT_ULL(ch_id);
+
+		fsl_chan = &fsl_edma->chans[ch_id];
+
+		irq = of_irq_get(child, 0);
+		if (irq == -EPROBE_DEFER)
+			return -EPROBE_DEFER;
+		if (irq <= 0) {
+			dev_err(&pdev->dev,
+				"channel %d child node has no valid interrupt; add interrupts or disable it with dma-channel-mask\n",
+				ch_id);
+			return irq < 0 ? irq : -EINVAL;
+		}
+
+		fsl_chan->txirq = irq;
+		fsl_chan->irq_handler = fsl_edma3_tx_handler;
+	}
+
+	if (!has_children)
+		return 0;
+
+	fsl_edma->per_chan_irqs = true;
+
+	for (i = 0; i < fsl_edma->n_chans; i++) {
+		if (fsl_edma->chan_masked & BIT_ULL(i))
+			continue;
+		if (child_mask & BIT_ULL(i))
+			continue;
+
+		dev_err(&pdev->dev,
+			"channel %d has no dma-channel child node; add one or disable it with dma-channel-mask\n",
+			i);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int fsl_edma_configure_chan_iommu(struct platform_device *pdev,
+					struct fsl_edma_engine *fsl_edma)
+{
+	struct device_node *np = pdev->dev.of_node;
+	struct resource parent_res;
+	int ret;
+
+	ret = of_address_to_resource(np, 0, &parent_res);
+	if (ret)
+		return ret;
+
+	for_each_available_child_of_node_scoped(np, child) {
+		struct fsl_edma_chan *fsl_chan;
+		struct dma_chan *chan;
+		struct device *chdev;
+		int ch_id;
+
+		if (!of_property_present(child, "iommus"))
+			continue;
+
+		ch_id = fsl_edma_child_to_chan_id(fsl_edma, child,
+						  &parent_res);
+		if (ch_id < 0)
+			continue;
+
+		if (ch_id >= fsl_edma->n_chans)
+			continue;
+
+		if (fsl_edma->chan_masked & BIT_ULL(ch_id))
+			continue;
+
+		fsl_chan = &fsl_edma->chans[ch_id];
+		chan = &fsl_chan->vchan.chan;
+		chdev = dmaengine_chan_dev(chan);
+		chdev->dma_parms = pdev->dev.dma_parms;
+		if (fsl_edma->drvdata->flags & FSL_EDMA_DRV_TCD64)
+			dma_coerce_mask_and_coherent(chdev,
+				DMA_BIT_MASK(64));
+		else
+			dma_coerce_mask_and_coherent(chdev,
+				DMA_BIT_MASK(32));
+		ret = of_dma_configure(chdev, child, true);
+		if (ret) {
+			dev_err_probe(&pdev->dev, ret,
+				      "IOMMU config failed for channel %d\n",
+				      ch_id);
+			return ret;
+		}
+
+		if (!device_iommu_mapped(chdev)) {
+			dev_err_probe(&pdev->dev, -ENODEV,
+				      "channel %d is not behind an IOMMU\n",
+				      ch_id);
+			return -ENODEV;
+		}
+
+		chan->chan_dev->chan_dma_dev = true;
+	}
+
+	return 0;
+}
+
 static int fsl_edma_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -835,6 +1014,10 @@ static int fsl_edma_probe(struct platform_device *pdev)
 			clk_disable_unprepare(fsl_chan->clk);
 	}
 
+	ret = fsl_edma_configure_chan_from_dt(pdev, fsl_edma);
+	if (ret)
+		return ret;
+
 	ret = fsl_edma->drvdata->setup_irq(pdev, fsl_edma);
 	if (ret)
 		return ret;
@@ -897,6 +1080,10 @@ static int fsl_edma_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, ret,
 				     "Can't register Freescale eDMA engine.\n");
 
+	ret = fsl_edma_configure_chan_iommu(pdev, fsl_edma);
+	if (ret)
+		return ret;
+
 	ret = devm_of_dma_controller_register(&pdev->dev, np,
 			drvdata->dmamuxs ? fsl_edma_xlate : fsl_edma3_xlate,
 			fsl_edma);

-- 
2.34.1


