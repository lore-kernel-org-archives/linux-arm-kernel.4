Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D16EE606A331
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 17:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0Iga/gR/;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=U6E6KNoG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=jADykbXYQAwXGTi64742UoqUVmtxFOCEqiO3RJeiens=; b=0Iga/gR/DFPTfD
	wIRIfCS62o9E2xbS75aIGE6GrOjDKNMmh6T1SqwO+lwc+atG7fMrDs7GJjQI1d9tSUIJQNKHHz7l3
	OWoutxdlyZYnJvdzKg6xM1EvW34RVPN0A9t0tPQ770I2EklvUglIvVasAPuM3QA4rdJ4rxwVnYp+U
	Pu/0zOO56Bn4re2AyzC4qcmw5tKpyV5+hveAC1R7/TOMbc42+z12iS93oLRzP5q5/9iIucsnWzgJD
	xDvUxZ7iiGmGvbSPM3WWKwhEmyJ+qDIEwct4RlAipGDG8zIaPtRqvHkNzjkQ6y3NOO+/AMda9tU9x
	MVGXcRJ0Q6CcJ+DOptww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUSUp-0000000Fiob-3EaQ;
	Fri, 20 Nov 2026 17:34:00 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUSTp-0000000Fiai-0YrB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 17:33:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HQTJIvDBzEcIKpUqfZc5DFYTipCiv84XAr8+ZEgzgkqNodq4+oWNDMYCtzErPKQpeI9huurHuLZbzKbhoI+KK1n1D9HDBzRWKWZ0BMbdWXh7iXd0LQTCcGtf1XN+a6gNSjTQS7h5rA9tD4FTkdOkVpDclqfB6uBySJ/oY8+iyOp0v8kJi15u9XMGlhduy56D3JcTld1CW0Pe/ejyQOqkkvQL4qMq4nf51eNol6swQRy99ExN8ZBi5ZexPJFeh50MuamDj4OaFe0LiPVoLEWuzqeEHEfvbRCtUtaLgJ9DRvNu4ETzCgrgKkttYX6G+Tgf+BywY/pVdPjLQL1dZMqTWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jADykbXYQAwXGTi64742UoqUVmtxFOCEqiO3RJeiens=;
 b=Mh0y4pDcKf9kjpgj3bBFKoAmi77Ye55HGD+Lc3vU+v8v7iOSvODspL/ZOCzAM7U8gj6w91+Tr32Jesf2eXintijV4123v9JU998CqvGGFb4nt5UdhGbDAdMS5oFeZFrLtwaBdpfDSOOHuffcs1rBfCh8BqHpDjrUkcPN7BFZhK3W4jeEUfTGXHLXFaJbAfZJO1+GXRwAP9koVeELB8w3E8HD2TpsRfFrWtw4ceFfgZcpkbL2em4XaFHVq1KYhL4jRMX34AM10gjLok6DWL385lhEMYyw2u/v93dts67Q0wSjCaDuOMWSEMeAhu5+Fm6Vpz8tdwSK/DjOZdgsW9yjSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jADykbXYQAwXGTi64742UoqUVmtxFOCEqiO3RJeiens=;
 b=U6E6KNoGjvUAr41p//Lhu49LesBsCNggshsICbYo305y2apQuH8Y7A3Ct9CmYzs7frftQnbhQNsBAC3dB4OLQKIUlaXq+INJaHQY19NnHHIpnCm8bd6o0+iWXmqaWSFFZJVwSc3LDzbHLunH++2Y6YarOBAQiYLg/r1r743MZ+xL+Cx5wbJrKtjuqFy+DHFPebYDvjhic21u0iJ4McygQouMwMJ8+hNqfWQBex15W3xKrvn/MizrviJEjJscT9LqXlMa6RXArpbyyN1JwQH3J260p0cWxl0O5V+eN2svDTlt7QfxqOSMJVK3wudXTIBw1ggMdR9dJSxPOUtbTkmwDw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by VI2PR04MB10219.eurprd04.prod.outlook.com (2603:10a6:800:22c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 17:32:52 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0639.010; Fri, 20 Nov 2026
 17:32:52 +0000
Date: Fri, 20 Nov 2026 11:32:42 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: tumic@gpxsee.org
Cc: Lizhi Hou <lizhi.hou@amd.com>, Brian Xu <brian.xu@amd.com>,
	Raj Kumar Rampelli <raj.kumar.rampelli@amd.com>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Michal Simek <michal.simek@amd.com>, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Martin =?utf-8?B?VMWvbWE=?= <martin.tuma@digiteqautomotive.com>
Subject: Re: [PATCH v3 1/1] dmaengine: xilinx: xdma: Fix broken PM
 suspend/resume
Message-ID: <awCEOvNMoXnoA3XD@SMW015318>
References: <20261120172356.5858-1-tumic@gpxsee.org>
 <20261120172356.5858-2-tumic@gpxsee.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261120172356.5858-2-tumic@gpxsee.org>
X-ClientProxiedBy: PH0PR07CA0026.namprd07.prod.outlook.com
 (2603:10b6:510:5::31) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|VI2PR04MB10219:EE_
X-MS-Office365-Filtering-Correlation-Id: e80ecf52-5f22-4d50-5879-08df472c4df9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|23010399003|366016|376014|1800799024|19092799006|10067099003|4143699003|11063799006|56012099006|261021121427099003|261022105027099003|261021123027099003|261009223027099003|261022075727099003|261102123227099003|261102124227099003|261026140227099003|261026121527099003|261028144727099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: 1VrMIXrIbzrC5UBP8zoryJ7PaSNzkykOB/Pz7OdRtbg2/6daNzzIfIUMmMlXmSNlZZviadywvVXqDDmLKvnG6zF0z5ltSmAFQqUgDQMWAyCTHuNaGcsod572pedPnbRjg9Hl0cSWx56gOBf3/IN8WYSGJ9fmOqRbFETfPbpFGwpbvmjT/k3GfgU7xRYwtiA89ZK7K6KFchRJT6C0+WM15mdCPvi9824S4sY4dFAsJpVQEGGOVKQzN7Nc92QKw90nhV4zU7dPN4N7DrGqkoR/bc7G435DW0Y8V8IhKK6kRLx+NhiZzgGnyKaULpISt5Ed2KMojcnOZaERhSjNSVSoMW14H74nq3hmwCJn+TVI2lMtseLrhW51LC57G+bk8+R1Iae31cOd10bk9EIXcDD7M/PsjjxUoKvkiJRTndvWhr2JbTKmBYBltZQwhhyAIuk3Fzl8RfM7ivSV1gSeLsnRWufpB+OSIHmMXqOwoNS/nsVr30rz65dPtoXL8OgYtLgc0QWMNOPzkF2P0xKwrEF99JcGb9Ih5zxJNGliBeyUAIKE6//gDfKDQMSsxm6WbeswLK6lZVmM6URSbkj/95iapJ9S8v+NIWqCUA6lySoJoM8Or99fKSxkIzKjh/ZZoB9MWihPHcrUGL6Xd98vGdpbeFTXOKx6DYqZTe+xFgh3Qjg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(366016)(376014)(1800799024)(19092799006)(10067099003)(4143699003)(11063799006)(56012099006)(261021121427099003)(261022105027099003)(261021123027099003)(261009223027099003)(261022075727099003)(261102123227099003)(261102124227099003)(261026140227099003)(261026121527099003)(261028144727099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aklsWCtsbFFHMm9pYitSOTBwRzZuMXU0RDN5VXg1STdkNktUNXFubzY0emRJ?=
 =?utf-8?B?M0dEOE1MY1pXcGkrNWR2Tzc4NVNkYURKQStmeTJHK0xCYkdOdHl4cWxEVzcr?=
 =?utf-8?B?QmF3cVJWMXZJZUhtQ0Y4VzNSNmNLc21vUjNJS1A3alBjN3dyYkhUSi9OWmdx?=
 =?utf-8?B?TTlKQ1pXSWluVE9rMUxKNHZoZU1taXhEblVISHdpVitWeEpiZURaMU96cnIw?=
 =?utf-8?B?U295bEgzZXJCVUtFUUlkZUFhUmF4TVNxRjBDekdtMjlQUXBTM3k5VXFoWEVp?=
 =?utf-8?B?NHlRS0Rja1R6VVp4YlhGUnFyRWhWNDIrV1RyYzkrUm1rVHBHeldIVGNRTjNh?=
 =?utf-8?B?V3hXUmY5aWladEMwZ21URjZLMkFLbnQzeWkwVmduRXBvM0huTC80cEVZSVBK?=
 =?utf-8?B?cUdSLy9iOER4MnUwZzcrRDZtbW1Ec3FqMFJ2N2hCWWdnRXgvZTFzMHZZQ3hR?=
 =?utf-8?B?YmNVWU5Ua3NFRk8zaHU2TUpQcFlhcjhzZnQ3U1FrOEZaV0tnRmJYdHFBeUh5?=
 =?utf-8?B?eG1WWG13SXZzWkMzaTNuNkRyeDBPVlQ4ci9NQmYzTno3cTNjNWxmQTFudWsr?=
 =?utf-8?B?b1g0V0lvaXVnK0NtNGdsTkRoa3VTM2pGZjRYeHF6WVUxUy9UTjFtT1pQQXhD?=
 =?utf-8?B?UzZaMXdYcldRd3NuRUhJd09UNWZNclVUSEo3RjJsRXowUnc3SnZ0UGhBQTVY?=
 =?utf-8?B?MEk0Y2lId3dxUXM5QWpkd3hZd21zMkFwQUJJcWhTUHFWMzdBa1JObkpIR3Vn?=
 =?utf-8?B?M2JjMXdaZG1SeFZuODgrQWhPN2pncTJvWjFmems3YXR3TjRMcEdyWURaUkgr?=
 =?utf-8?B?R01YVHBBYm9FSXpGUjVZYjExaGFzOHVoNUlZYnllL3RUZEJQbHEzYVpJZThW?=
 =?utf-8?B?b1ZWbnpIMklENmJXQTRtSDViclhkUDhNR3ByZjZscWJnOTNJR1g5NjhoNjdE?=
 =?utf-8?B?aGxRUi83YzY5Qk56U1lDeEl5QmU3d2FTdjdzdlc4VVFhbGo2YTdiTk12L0Yy?=
 =?utf-8?B?QjVseFhNNFFaSm0xU1lxK04vZ055KzJjUzZPWkx1djRZTDc2d1R5SUdxREpW?=
 =?utf-8?B?eFNUdXhCSFdUSmlQbUlMRGJ1Qll5Y1JuMlRYVVliV2FwYXJpckNpeHcvWXEx?=
 =?utf-8?B?eG4ydzV1NWdkaEc3Q1VFb1NXYTJ2QnA0ai8zV2lIa3hMSG9jUEF1U0VBSGJC?=
 =?utf-8?B?djZBUmYrOVlrNS9WQW9tWWI0UHR3NnI4aityTHlHY0E5TnFON2s3Z0pRWkpk?=
 =?utf-8?B?SWsrbEUwaC9iWG03aU8vT0EvVjN6dWhWVTZ1Q1FmM0QxUTRGaG56UzZqT3o0?=
 =?utf-8?B?a2QxbUUrMkhxMUN4eW96MUh0VkJyQjF0dnc1NXkrZzhhbzVZU0FWMHZPdEwv?=
 =?utf-8?B?RzRaWGd1QnVjS3JMK3ZldWZiV3lXaFBNQ2pYYUdDWWx0d2tNeWhDaU1lU3d3?=
 =?utf-8?B?U0FiR0hjWHZIT3lpcDNSWGF3Q2YvUjRvQ29WUFFETFpmV0sva0x3aEYrUzdx?=
 =?utf-8?B?cXB6V3RxOXArZlZCcnR2NVpqL1A5dWVpMXZ2NDVRK1J5SUtzL0JFM2pUbHBz?=
 =?utf-8?B?aEMwL3ZhTVBBcVNudG5EQ3VGN2xEZUtJcmZnSEVGMmhEaDJkOXduNTUzaU9E?=
 =?utf-8?B?T21GbHdGcnlXVW5LcGNjZ3lJTzVmRmdCdkdrcVQvV0FlNW8zTjhMZi9KVDZq?=
 =?utf-8?B?d2E0cHRKWHcvd0dJY3k4ckJsNlYraXluZXp3Qzc3TzN6VHp5WXdhWk5lbW5D?=
 =?utf-8?B?ZFJmK2lFSm1HUTNSZ25BajJ6OVRXNDBXMjVhVlNoZkUxVWppMm5WblpwU3R0?=
 =?utf-8?B?OVpFVkUxbmFJUmdjTU1QWWJrVDQzUk9sSDVwWFVvTVg3My94RnJXeHl2VUtu?=
 =?utf-8?B?dG5ITy9kYjd1WS9uZXlUVUhCSjNGNjRGT1NNeFkvckpvcExLVFA4U1IrNVB4?=
 =?utf-8?B?K3J6M2ozNmlsN1VJSmtWZVRKU2Z1RDBHaGN4dXlMZDRsUnJsTGh2UnNWY3Uy?=
 =?utf-8?B?UlMrcmpDRlhlWGljVlRCSjNCbHA4QkJxQmUrTW1JMUYyQ3V0RHhMaXhsbVVO?=
 =?utf-8?B?TzVpTktTM09ROXM1MGJtQytKQjVldzJCcHgralBUeEhEVENHVXFFcXF6eGpW?=
 =?utf-8?B?T29iSWRYSVRDSzlJN1NhL25VekNDbDRxUFIyZXlDSklsNThmVHl3TTFkTzN2?=
 =?utf-8?B?SVU5dWR4WjhuL29hREM4L1BGS2M3YlFzeTI4TWVKb0VndmxlV1g3cVRRQnpO?=
 =?utf-8?B?amI4OW9TRjRNZ2hCd1pDZWN6SHFPeUFzeW1tNmlQWnN2M0FFNit3SHlFMlV1?=
 =?utf-8?B?Nkltb21vbTFhWDVSSTk1Q1I2VkUveG1zRW0rKzJWT0M4QlBTWTlYNVVxRUpT?=
 =?utf-8?Q?eVCoBLU19Zja4CeuRJ1Oth24jq0e8eorISK1P?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e80ecf52-5f22-4d50-5879-08df472c4df9
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 17:32:52.4568
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KWop/jLM6WA70Tlfjcnyr2t5jsrym9Cqb+aVqGePMkx3maz4RL3iabSpEiAqLtlpDndRwbaKk/ugZxmym5y46x4po9OU25udD0fR/MsowEljSWhhdYqpCvuSsGc8MBmA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10219
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_093311_487837_BE191C46 
X-CRM114-Status: GOOD (  28.60  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 20, 2026 at 06:23:56PM +0100, tumic@gpxsee.org wrote:
> From: Martin Tůma <martin.tuma@digiteqautomotive.com>
>
> Add the missing PM suspend/resume callbacks that properly reconfigure
> the XDMA HW on PCIe suspend/resume.
>
> Signed-off-by: Martin Tůma <martin.tuma@digiteqautomotive.com>
> ---

Put change log here when bump version. And you post 3 version today.
Slow down, post one version at most per day.

Frank

>  drivers/dma/xilinx/xdma.c | 147 ++++++++++++++++++++++++++++++++------
>  1 file changed, 124 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/dma/xilinx/xdma.c b/drivers/dma/xilinx/xdma.c
> index 9d827c9a1267..d6772b38d8f7 100644
> --- a/drivers/dma/xilinx/xdma.c
> +++ b/drivers/dma/xilinx/xdma.c
> @@ -123,6 +123,7 @@ struct xdma_desc {
>   * @irq_start: Start IRQ assigned to device
>   * @irq_num: Number of IRQ assigned to device
>   * @status: Initialization status
> + * @usr_irq_mask: User IRQ mask for PM suspend/resume
>   */
>  struct xdma_device {
>  	struct platform_device	*pdev;
> @@ -135,6 +136,7 @@ struct xdma_device {
>  	u32			irq_start;
>  	u32			irq_num;
>  	u32			status;
> +	u32			usr_irq_mask;
>  };
>
>  #define xdma_err(xdev, fmt, args...)					\
> @@ -398,6 +400,27 @@ static int xdma_xfer_stop(struct xdma_chan *xchan)
>  			    CHAN_CTRL_RUN_STOP);
>  }
>
> +/**
> + * xdma_reconfig_channels - Reconfigure DMA channels
> + * @xdev: DMA device pointer
> + * @chans: channels configuration
> + * @chan_num: number of channels
> + */
> +static int xdma_reconfig_channels(struct xdma_chan *chans,
> +				  u32 chan_num)
> +{
> +	int i, ret;
> +
> +	for (i = 0; i < chan_num; i++) {
> +		/* init channel hardware */
> +		ret = xdma_channel_init(&(chans[i]));
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
>  /**
>   * xdma_alloc_channels - Detect and allocate DMA channels
>   * @xdev: DMA device pointer
> @@ -1018,6 +1041,55 @@ static int xdma_set_vector_reg(struct xdma_device *xdev, u32 vec_tbl_start,
>  	return 0;
>  }
>
> +/**
> + * xdma_irq_config - Configure IRQs
> + * @xdev: DMA device pointer
> + */
> +static int xdma_irq_config(struct xdma_device *xdev)
> +{
> +	u32 user_irq_start;
> +	int ret;
> +
> +	/* configure hardware IRQ registers */
> +	ret = xdma_set_vector_reg(xdev, XDMA_IRQ_CHAN_VEC_NUM, 0,
> +				  XDMA_CHAN_NUM(xdev));
> +	if (ret) {
> +		xdma_err(xdev, "failed to set channel vectors: %d", ret);
> +		return ret;
> +	}
> +
> +	/* configure user IRQ registers if needed */
> +	user_irq_start = XDMA_CHAN_NUM(xdev);
> +	if (xdev->irq_num > user_irq_start) {
> +		ret = xdma_set_vector_reg(xdev, XDMA_IRQ_USER_VEC_NUM,
> +					  user_irq_start,
> +					  xdev->irq_num - user_irq_start);
> +		if (ret) {
> +			xdma_err(xdev, "failed to set user vectors: %d", ret);
> +			return ret;
> +		}
> +	}
> +
> +	/* enable channels interrupts */
> +	ret = regmap_write(xdev->rmap, XDMA_IRQ_CHAN_INT_EN_W1S, ~0);
> +	if (ret) {
> +		xdma_err(xdev, "failed to enable channel IRQs: %d", ret);
> +		return ret;
> +	}
> +
> +	/* enable user interrupts if needed */
> +	if (xdev->irq_num > user_irq_start) {
> +		ret = regmap_write(xdev->rmap, XDMA_IRQ_USER_INT_EN_W1S,
> +				   xdev->usr_irq_mask);
> +		if (ret) {
> +			xdma_err(xdev, "failed to enable user IRQs: %d", ret);
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>  /**
>   * xdma_irq_init - initialize IRQs
>   * @xdev: DMA device pointer
> @@ -1025,7 +1097,6 @@ static int xdma_set_vector_reg(struct xdma_device *xdev, u32 vec_tbl_start,
>  static int xdma_irq_init(struct xdma_device *xdev)
>  {
>  	u32 irq = xdev->irq_start;
> -	u32 user_irq_start;
>  	int i, j, ret;
>
>  	/* return failure if there are not enough IRQs */
> @@ -1060,28 +1131,8 @@ static int xdma_irq_init(struct xdma_device *xdev)
>  		irq++;
>  	}
>
> -	/* config hardware IRQ registers */
> -	ret = xdma_set_vector_reg(xdev, XDMA_IRQ_CHAN_VEC_NUM, 0,
> -				  XDMA_CHAN_NUM(xdev));
> -	if (ret) {
> -		xdma_err(xdev, "failed to set channel vectors: %d", ret);
> -		goto failed_init_c2h;
> -	}
> -
> -	/* config user IRQ registers if needed */
> -	user_irq_start = XDMA_CHAN_NUM(xdev);
> -	if (xdev->irq_num > user_irq_start) {
> -		ret = xdma_set_vector_reg(xdev, XDMA_IRQ_USER_VEC_NUM,
> -					  user_irq_start,
> -					  xdev->irq_num - user_irq_start);
> -		if (ret) {
> -			xdma_err(xdev, "failed to set user vectors: %d", ret);
> -			goto failed_init_c2h;
> -		}
> -	}
> -
> -	/* enable interrupt */
> -	ret = regmap_write(xdev->rmap, XDMA_IRQ_CHAN_INT_EN_W1S, ~0);
> +	/* configure all HW IRQ registers */
> +	ret = xdma_irq_config(xdev);
>  	if (ret)
>  		goto failed_init_c2h;
>
> @@ -1297,15 +1348,65 @@ static int xdma_probe(struct platform_device *pdev)
>  	return ret;
>  }
>
> +/**
> + * xdma_suspend - PM suspend callback
> + * @dev: XDMA device pointer
> + */
> +static int xdma_suspend(struct device *dev)
> +{
> +	struct xdma_device *xdev = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = regmap_read(xdev->rmap, XDMA_IRQ_USER_INT_EN,
> +			  &xdev->usr_irq_mask);
> +	if (ret) {
> +		xdma_err(xdev, "User IRQ vector backup failed: %d", ret);
> +		return ret;
> +	}
> +
> +	ret = regmap_write(xdev->rmap, XDMA_IRQ_CHAN_INT_EN_W1C, ~0);
> +	if (ret)
> +		xdma_err(xdev, "DMA channels IRQ disable failed: %d", ret);
> +
> +	return ret;
> +}
> +
> +/**
> + * xdma_resume - PM resume callback
> + * @dev: XDMA device pointer
> + */
> +static int xdma_resume(struct device *dev)
> +{
> +	struct xdma_device *xdev = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = xdma_reconfig_channels(xdev->h2c_chans, xdev->h2c_chan_num);
> +	if (ret) {
> +		xdma_err(xdev, "H2C channels reconfiguration failed: %d", ret);
> +		return ret;
> +	}
> +
> +	ret = xdma_reconfig_channels(xdev->c2h_chans, xdev->c2h_chan_num);
> +	if (ret) {
> +		xdma_err(xdev, "C2H channels reconfiguration failed: %d", ret);
> +		return ret;
> +	}
> +
> +	return xdma_irq_config(xdev);
> +}
> +
>  static const struct platform_device_id xdma_id_table[] = {
>  	{ "xdma", 0},
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(platform, xdma_id_table);
>
> +static DEFINE_NOIRQ_DEV_PM_OPS(xdma_dev_pm_ops, xdma_suspend, xdma_resume);
> +
>  static struct platform_driver xdma_driver = {
>  	.driver		= {
>  		.name = "xdma",
> +		.pm = pm_sleep_ptr(&xdma_dev_pm_ops),
>  	},
>  	.id_table	= xdma_id_table,
>  	.probe		= xdma_probe,
> --
> 2.56.1
>

