Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A53606A686
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 21:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cL3Gxiub;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=ktKXMB8l
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5e6EcuNm0ZkOgStYUrg6lXJe6+814wtb8wgdD5CMCG8=; b=cL3GxiubvVlukloiG3msE7hI/R
	e574E1UoX73svBFjWGS+mLpmaoxP8g5m3Q3qf3gX5gL1WCnPrMznXESeyFg34FnX3ZyhTUuBR3oRf
	l9DOcqNCbgv6lgHGYM7sqiNG1nNboFwTMYfz8iZYKOtK0M8sd3cUKZ2b4kxiWHdztUdqTodWjm8ED
	l0yyXqL3gk43U7D+pUZCHRiYYnAKdZTvmoVhcu1SdwYCdUnkeakBY6xvy+ExNN+mK4rfUce0cpvOF
	l/osT15UppKeZnzizLVtJTLdIHiBgm/cnKFz9213vLNIpVPLwCesYYA64AdtFCaJWCxmmtMK1qvlW
	bkn/m/Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVbfL-00000004zEV-0ZOd;
	Mon, 23 Nov 2026 21:33:35 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVbfG-00000004zDP-1Lbf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 21:33:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AC4G6nIcxXPJL0FsKfskd0BmXKcZEq1hdzJjUiwFl98j12rpR0m+0aDUZBbk4ROU1M/13vO/tJFbKxq9NVkDpYQTTwpEhO6D4xgIamNZ8m0e8kEtFhbsicHFMg9SP2WcqTza5SV3nnA/QLe1fx3kFjFjcbHbcC82RbOBGnhN6/9Ufxa5eR81J3SAYnxXOafOiAZE+mQyPZDaip/9hWqzrR1C6eMq9bEATKK/unYzoYs+UPoHgpFq+gghq9zcMiBc1MAgnibPU+aEG94qJxBnCg4rR6FUelEljjJMhp6m9MR+6f9nCXRn7DQM/5GgBO1EC4RTyb7fujxDa8Xmz1Vdrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5e6EcuNm0ZkOgStYUrg6lXJe6+814wtb8wgdD5CMCG8=;
 b=OuD0F7f8lwuZuXr/rn/KiFZe53Imlw5EM1ur4MS3q+g7SssSQvE6Qu/CtyVeu8MHcClpxTgQhBZpdgisB53praRhRWgl5UFMULRkOPE/L1Rk7+ZiOUVb8kW3IIslpY2i1+4u2zUVyu22X0PYFM9Tabq+vhUp+1ufL82AwTvnHRQ4KS3wkznD9sTGn91e5Umsn/lRC2steIc6TcCtUdKSThTyHzZWMqsyEoQh1BzT3lk9Hey8BAQcGSHr1pT4+1B9diVhbpzObRf3l3qUAlVED931SHe06iiZpzElH+RnBtYklmT62Br6iZJaSgiCPLRNHkZok9lSOJnbIY9MVTF1qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5e6EcuNm0ZkOgStYUrg6lXJe6+814wtb8wgdD5CMCG8=;
 b=ktKXMB8lx78SZvn7KJQyt4e3hjKI0APo/UKWYF/zh2suvc5zSMakOq4QXNkI8db3jGtdXt5mAGPwngg9LSXWkH7nloe2VW3iltzW+mmm1XkZYs0AywLUj43Kboj6M5aifd9kl/MLhsSyI536GDw8JJiTKZm8vC31wm7/wlXhASwM9/2olNW5ekIYh6GeeEXK8TIWBQ564gKLDurltYckAmcNZFSQ5X4ZTKnzzjm4et5pG8Ui6YEzJx3RNTgNRVS6dyf/DTETJP/mn1vU/EBwBwRPrfeXuNReUskJIIkm1/Bj3Irx66z1qCkByIidqCaA7f9G98pLRS6Wmq0iSRGcNw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DB9PR04MB9750.eurprd04.prod.outlook.com (2603:10a6:10:4c5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Mon, 23 Nov
 2026 21:33:21 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 21:33:21 +0000
From: Frank.Li@oss.nxp.com
To: Sascha Hauer <s.hauer@pengutronix.de>,
	James Clark <jjc@jclark.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: imx8mp-frdm: Add overlay for EQOS PTP event pins
Date: Mon, 23 Nov 2026 16:33:14 -0500
Message-ID: <179546959062.2964163.9810269912866329969.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119062301.1778558-1-jjc@jclark.com>
References: <20261119062301.1778558-1-jjc@jclark.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7PR10CA0015.namprd10.prod.outlook.com
 (2603:10b6:510:23d::17) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|DB9PR04MB9750:EE_
X-MS-Office365-Filtering-Correlation-Id: b0557782-b42f-4271-a6a6-08df49a965c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|19092799006|23010399003|1800799024|366016|22082099003|18002099003|261009223027099003|3023799007|11063799006|56012099006|261021121427099003|261102123227099003|10067099003;
X-Microsoft-Antispam-Message-Info: wCSIdWq0meaFuxcyVYX8XWj0zd8mmOg0+2Nv/InZ2TYDuAMQTB/Ejwut+jEiBCpivJEKfJrsu7xJk1Li50hz1tbm0e4z07J+1P7WmIxxXgCVlW/iLT+0pedA1m3F72Q0j2Le7V08cgy0EUiZSCg5Uqq9WXAXzoWrXUpP87ZQ7moJjsBFSKnDhLBCCP34En2ryLZk/8M0hfOU5qqgGbM+pjWf4tFRVskdmxbdki6trwIfX3EXsfILqf5VWGfX4R9lpOUyc0+EasOmXT0esxufDQJbZpZjlRUiXuQlE8qPikxKwKfueWTwNTpVhvRKkXHEe5vZaXUzUF53JSk9OInUnqqCyPzcsMlAIXkoVuOOcMg8Gb3BrU7M5zk+XEyEfJBxwwVVE5sGrBZ8alpIvEnM1Epm/1UhV6lsUsf0KAo2AXv4v+fjbEo7Fsz91B+WwLJo4A8AqoyPfQJ+r1hm4hfb+K9PHtqRKVhbKiAgBVh3+ZghUVdxOdC1/eKEKB63DVPhfyfM8JIomzwa+Rx+wXaAtyETfe3F0Ht5m+tdmr6U3tR/ohdh6M8CO4sh8PLGr4Jn7I6Ty+sxWPZp1DIVAxaxONP3gpx3B3y4Ke0ed/Wsw+SLj8vUb2xYq+u9VMLmg9r/EfnvTp88z9xLULpovnr6RQErjOTfItbEyiY62ivHeZI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(23010399003)(1800799024)(366016)(22082099003)(18002099003)(261009223027099003)(3023799007)(11063799006)(56012099006)(261021121427099003)(261102123227099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VWlDd3k4YkpEUVpHUC9TaGNOT01EYXREYUNnc004R1RQenFHVWlNcHVySXpv?=
 =?utf-8?B?aUZ0VXhHamp0cE1mR1hmM2NCRjRMbUlmWUg1ekt1SThxSUhoY3AyTE4wdmlL?=
 =?utf-8?B?TGJjdTF4Y0tNSUw1enIvd1JUc0JJOUQ3WmNkRlJZWmZzT0ZlRUdJYzMzR1BN?=
 =?utf-8?B?blhTaXd0Y1AzcEtwbkhqQUc2K1hzeTdEbEl2WkdvazE0cDQ2YkpjTlhOYWlB?=
 =?utf-8?B?elNib0h1NXZCTXBPNmlnb3VabG1RSHZ5NEJKc0tndmdCUFJSS09NblFhUnBM?=
 =?utf-8?B?WjJUelRydlVYWHpOZFMyM01BU2NYTElrdVVrbGZPNWtwUmxjazIwaEV5QlZi?=
 =?utf-8?B?bHRzSHZNMDlaRjBScTZQNDRVaUhXdzJtaHpSUWpGT1krd0hmZFhKN0hQS2sr?=
 =?utf-8?B?L0MwNjJmUFJ3cDBLZnhsK1BsaWtmZnRZeTJRN3Rwekppait2RHBMNkV4ME5S?=
 =?utf-8?B?SkRjUTVXWnBjZE11OHRaQktHSDNXa0xQaHloL2ZTOXUxejFHSnNpK0pNdmJv?=
 =?utf-8?B?NzVrQ0hhakJ4aW9EY1FoQjlIRS8vUW9ka3Q0VGhTK3ZDNFVvYTZyR09xUUpX?=
 =?utf-8?B?UVBsZEgxN0plcDdCYzhmeXVLazB3STNvSkI3YWdyZmRoNjdVYkVPL01CNGJu?=
 =?utf-8?B?RlJZL0NQaTRLSW1ib3Y4Wm16anBwT3p5cFZTcFdrS0RKK2xYY3NUekc3c1Y0?=
 =?utf-8?B?OXlhRktNalpPV1huT3JSdTJubUg2VnJLcWJvTmJ5cGZHMEhsa0pnWDdQWE54?=
 =?utf-8?B?WUZOUkY3dFhxVzBFWnNPb1dOM2ZHWG5lL05wb3pIb2phVzdWeEpaeGphS0p6?=
 =?utf-8?B?K3hIYnB4clNwRjJsQnlPNnVkVzdCYmgxbkMzdUlEZTROYnBkQ2h4N3M1c1Iz?=
 =?utf-8?B?b25kOHJLa1laQ2xNckVzdGQ1NGI2YWVTbk1DeWp5K0RZOVJ2bWF1aWppdjNn?=
 =?utf-8?B?WS9LS0habjRzb2cxMmhheXBYWmhlblhTd0NKQnFkNmZjTmFLbmhkRCtIbHZB?=
 =?utf-8?B?OUE5MG12OWQ3dldPNUFXUnBCcVhvM2xoNDJxanhGZTRnb2JVbVdMUnJQZDA5?=
 =?utf-8?B?dEluWFVXQTJqK0dKZ3BXRk5FV0JLeHBKL1U5bnUxQ0dsMXU3WEFXcWg5QlE0?=
 =?utf-8?B?UWN5Vm1xWTA4VnNPeWs2aTJMbU9nZy9RbFVzakdwaVFETWFtUFduZXYvNmt2?=
 =?utf-8?B?N2tQMXVJeFgyUnlPVTdNZmNGMFVGU2JGOStWVG1vTURzZDVRb1lEc05xUnVS?=
 =?utf-8?B?a1NjYTFTVGw3Qk5nWVJyUEM0WWpKbEFaeGxDMzA1QjRtMnUzVEFuNS95ekRr?=
 =?utf-8?B?Wk5BWndOdjZyWFk5cjZRaWYzYlNzMDNBMU5jc28vQnNVQWg3VFlnemZwKys2?=
 =?utf-8?B?K1I2aVZOQVhQaktPK2FzdndnTC96VFBsRFNxT2ttVmZuTm1aQlY5ZTNaeC93?=
 =?utf-8?B?dTBMSjRyblJRbTc0UzJ3WGR0cDYwUU5xV21KUENyUXltREI2RUV3bmI5QVN6?=
 =?utf-8?B?LzZpQ0NCMjFGSVUvMFZ2WEptb1BMRCt0SGJpWEM3Rm1aeEVZSWY2SlEwOS85?=
 =?utf-8?B?VnF2Y0MxaCtaSU52Q2V2TEpEa3g0a09EVjl5bjUzWWloaUZnVitLVUtEY0wz?=
 =?utf-8?B?UndxU29LYk16RlY3VXNuS1YrZkpHREVoMG1uYm00YUkyK0JNV2dNUFZxUXpH?=
 =?utf-8?B?RXcwa253WDF6QmhYY01UczVYN1IwM3RiU2VHTFZ3bEUrNlhrMml6WDk4cnJz?=
 =?utf-8?B?WWRESnBIc1BLTUV1d0RINGZFM3VaUzhXSDNZNXFmeStnL3RvT2VWUDBJaFlB?=
 =?utf-8?B?dDV3ajQ3Z2lacnd6WFJCby8weVMzRW1IZE1TaXN2dy8raHFpTko5dGZVRVQr?=
 =?utf-8?B?QjYxamlYZlVIcTlTeW5DVEVJLzR0SnllemorUXIyQm5CUjJva0RQUE00Ri9Q?=
 =?utf-8?B?VVJVdzBSbkNLMEdoL3kwNEt1ZGgzbGVpSXdtNEdQalhRdFlZZEYvTk5UUG1Y?=
 =?utf-8?B?bTNTaGtobDIrakMvb01JYVJwSy9GQzVJakZTbXZyVGgzRERRN0hxNEJ1c1ZM?=
 =?utf-8?B?elM5V0dSTjdVQy9NamVLRW1lREtVa2pSdHB6OXZQa1NqakFtMlM2em9CUG9E?=
 =?utf-8?B?MHNCYTNncVZ2azhqczZVNjltS3BpWCtndGpOakRwMHlnY0Z0L3hMazdJRWZP?=
 =?utf-8?B?QzgxS0RGbXpTZExQeXhPbVlrN2R0bE5vWlpvTW9FOFdrY3Q0Vys3VmkzSFJR?=
 =?utf-8?B?N2tTb0VRMlpRZ2dHbjNxMzJFY2FBdmhWRHVJa2tVKy9sdmxaeDBIcWFhTFRz?=
 =?utf-8?B?YXRJOVk2K2grWEVHTk1SdzBKQUFRTVZ0YnArNXY1eU1mbHZURDZlZGtFTE9a?=
 =?utf-8?Q?IlNaf7XSsWZuQCqh2Bn1qpMOqW1jKsI+Mj9vh?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0557782-b42f-4271-a6a6-08df49a965c7
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 21:33:21.6610
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QRpvSw2/ThSGgQMXYybE/+c8uT7d0nY9OVhg8w2CALTm1v0pQPngFRB1wU4k6J+ccGbbvSE6Ln9QT63J0ao0NvQ/AWsbZJ2oMRfWGWx86sx2otGerKHkyLudTZi8W9U3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9750
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_133331_592849_927727C3 
X-CRM114-Status: UNSURE (   9.63  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Frank Li <Frank.Li@nxp.com>


On Thu, 19 Nov 2026 13:23:01 +0700, James Clark wrote:
> On the FRDM-IMX8MPLUS, pins 13 and 28 of the J18 expansion header are
> wired to the SoC pads GPIO1_IO08 and GPIO1_IO09. Very few boards
> bring PTP event signals out to a header, so this is a valuable feature
> for PTP work. Add an overlay that connects the two pads to PTP event
> channel 0 of the EQOS Ethernet controller:
> 
>   J18 pin 13 (GPIO1_IO08): ENET_QOS_1588_EVENT0_AUX_IN, external
>                            timestamp input
>   J18 pin 28 (GPIO1_IO09): ENET_QOS_1588_EVENT0_OUT, periodic output
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: imx8mp-frdm: Add overlay for EQOS PTP event pins
      commit: 3132dcab068c2e366069400615981312ca791434

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

