Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092F5606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 17:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=d5G855+q;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=d5nF1i1T
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=WZ+Ybr+GiPJ8yHE+GILk+KRcuB7/fK8Xmj+RE5QCV6A=; b=d5G855+qouRk8mWjxy8yIiJMUX
	WABM5UNPRsIb/yPJPDOKnDfwncG7EInqoCp6/OU7nheN8QuFPT04D7CuvrHw+SsbcKwpVqLlYB7K6
	U/3LSpGs9UbougZFAB7+G1RHq9b65Phj1gOMKixrLsonEUtpTKjeRU74adZTFmhFQwpDHOE/7u/zD
	Y7gF9StYIRuwqHNFZoPcEcU8gBWcIS8qKZfbZahhdMmVsrA/5W7LTwz5sEru3IUU1SqkEx1i8UptE
	uAGD9l3QkVc4jvlBPag6scZ7z0fdwLXiEE1l605J7qAUdVe+Rui6mghdMeDV4C6tXgkpt7vFWiEDX
	s0OLnq2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHDD-0000000Arpd-2m7i;
	Wed, 25 Nov 2026 17:55:19 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHBk-0000000Aq4H-2EiK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 17:53:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M12K1pl964EqNjQDyc8tsvr5fxHehlxKfkasdxzfiE+w5URIJxLeHUPETSZqrBSUMZBVdEOWoJqISIL5JR8aWQAVdgf9oNbJ5x22bFXz+Llelrf+/ERUzaZU1ImAwh/LOYAx9MemHrWujhr3OV67MmtSSQJOaR2ti8RrHLJTezma1JvXiJifrlAhXcWXNZwW6XVgm7j9dfPR16aWD8g4zV9mcs6iNuFOBmpt5XbFhGIdI2oh9/l7GssCdzZ+MOvXq+BEWtREaFqg7JsYttQbE5b8WUx9rdXnCWTZnDC6ESxjwfMqsQGMElSmflcOIO6rrgKS0v6U4cWADpYgflccCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WZ+Ybr+GiPJ8yHE+GILk+KRcuB7/fK8Xmj+RE5QCV6A=;
 b=Gi1ZXXolZ5QEtMY0SJFVAtHylX+QQcGnWsc5964XcqLphY5sRlHn8MuDKamp9U4QHFwZ8JvUXUUj1iqIiFqLd1R3AgvUDVHhhpjGMVuD2v2sGBywf77qeqnVDVYvcCa2aQeQBSO3AOSWR5gbGPhTStYFVRuUtLeRBkyA5kr4xPkbPqeB/m+Ckahj/yKYCpgVuEpBFQ3vo3kECqRAdguaH2hsEdHSQKUJEOxLy7VqWfV6IJYCTLB0/fbgT/aRtSiK47/vN1u8IHc1Mm81fo/N3h4Vh+4fD5cw2WOGiJmi1vyIhDgDYgZJXsoOOrn70QNubnhABxWW5Ck/2OdbujAXPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WZ+Ybr+GiPJ8yHE+GILk+KRcuB7/fK8Xmj+RE5QCV6A=;
 b=d5nF1i1TAP46bBJo+kSkGRnLu7BofFi8D0suF58WcgD7kd/GKqUFyKDBh5FSSyZY918U5tcInEIC3scJT0jbanEJhEiaxwR/oaaFbZmW8Be56ywjnWo9rS7oSDmF62kvj+AXQTavmOG929HWlVUOD7zeiSevApn1p+D7wjcJvqb/kQNKu6TuExKZ3yoYqp3/vMsh9iaZwN9BVlpxwupuoFz2HvNdBGoISXEFYoI/Iokd5EYB9bEzbi9FaOhVyhWCIUFWvkpmcf+T5be81zHUflOW+LXU+EuY8b0oNjP0oB6lmfE9lwUa0d5hm1Dva2ve9HDBTPfKSXb0eHIv54KmxQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by MI9PR04MB039066.eurprd04.prod.outlook.com (2603:10a6:290:b0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Wed, 25 Nov
 2026 17:53:44 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 17:53:44 +0000
From: Frank.Li@oss.nxp.com
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Mathieu Othacehe <othacehe@gnu.org>
Subject: Re: [PATCH v4 0/3] arm64: dts: freescale: imx93-var: Add Cortex-M33 configurations
Date: Wed, 25 Nov 2026 12:53:38 -0500
Message-ID: <179562921092.3128061.14859076263868776714.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795197853.git.stefano.r@variscite.com>
References: <cover.1795197853.git.stefano.r@variscite.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CPBP307CA0015.DNKP307.PROD.OUTLOOK.COM (2603:10a6:380:2::9)
 To MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|MI9PR04MB039066:EE_
X-MS-Office365-Filtering-Correlation-Id: b18530d0-1100-4563-ea92-08df4b1d0c62
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|7416014|1800799024|19092799006|10067099003|261021121427099003|11063799006|56012099006|261009223027099003|261022075727099003|261102123227099003|18002099003|6133799003|22082099003;
X-Microsoft-Antispam-Message-Info: hlVR95lnQxkcEP1xKPbd7MF7X7bBR3z2skxi1qxElm/or0UR9Lp/pyUrTI0zB4BQLl2eggBr/Px5Li5/4kcJMLUb9oHFhv0bpvMe70OQuIzRG62yxLalnh43kpsl63wFxokm22KTFkIYxZEG6dtxAqZTxmlinLwk+2a7OLT9IAcYGXqlVysTfbbugVZt1HI5aSBex1FvG+htgKrkEgLwNUanBewq4okwYq1ujR2OMeeYIEIpM3GpdJtCZxBHdXIn+74d4cUStgjaSbTJNkP7aC6sj4gzK2q3DGJUMX1g3dZsFSWnzWMtX6g7G937/Oo++8lKwZEUPRbmLnxwOQNdDAPAwb9dgxJAUwcdE432m/M9TDw7gdqIQIw/gfLxIX9tXQU5c1zScscFo5J1i3ZkamcOJrzTztobcWQb/U6r4+PsPIrx3itfrwvurt+7DPrriPjveiFtD/MTRuiHQPLUXi1a+60rP4d1RsRG9NmjfLn4LRMPwrKQqmViDNRVsKdHU+lF5tk50hi+3ouPxGjKoTZSUfrXLoOXmJWXbV63IquthoQfADU+3/LMDKEdRTVh7nrehIof/5tDYhvMb47UkN/i7sduypt3Jo3TVvhuWSAmZFEtKO4QCXvyoa5XlEGyTw/1ZSEAkYPg+bVP0AWe3kUmezWtakXv6JwgDsptgrk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(7416014)(1800799024)(19092799006)(10067099003)(261021121427099003)(11063799006)(56012099006)(261009223027099003)(261022075727099003)(261102123227099003)(18002099003)(6133799003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YnZFbnZtcGNRUDVtcFFsYU1aUzl5WXU2VXZucWl2V2E2REp3SWJTTjIxdDI1?=
 =?utf-8?B?N1UyM3gxQjdDR2piTGJWYmFSTU1FdVdldm9lc2FtSmltKzNsUGMyT1dBMkh6?=
 =?utf-8?B?eHBPb0VhanZSMllDbE40MUZJWDNkYWs2eXIzYngvcXYva0FzMWthV3dqNDlN?=
 =?utf-8?B?TUJNYnNML2ZRSVJoWjJ1OUtlV1Z4TGJFNXJwRzVaYzVXWldGMEdadmsyLzZZ?=
 =?utf-8?B?R1pjcHIreVI4VFY2a29FUDN5OUt6bjN2SXQrNzkwUDdOQjlGbng1SnRMbkJN?=
 =?utf-8?B?UEorTDdkckdSc0dEbEo5aDVEVTFyeUJBbU81Snl5ajZaNklzaFpvOWFwZWxK?=
 =?utf-8?B?MW45QjV6U1J3cHhJL1lVRjBEY2NURHlMMFpNbGIyZHdFTEVjWktJZ0hWQXYv?=
 =?utf-8?B?ZENlM0tZRWRnUWRBZTVVcUNaQ1NPOFk3c0JSZFlPazUvYnZkVmxqNmdtUW9k?=
 =?utf-8?B?WTZXcGRldlluUWh6aUc1eDdsYWJLMEZNdlV0WlJwdjZ6WWQ5Rk1ENis3b3hF?=
 =?utf-8?B?WitxTTJqam1weTR0SGttN1duWDdua0JzWWlMenRWYy9yakdLS2dYZzkybDZ0?=
 =?utf-8?B?OHEwTnBoLzQ3ZmhkeXdBOWtiVjZTeFZ1VDlFK1hOaEU1U0dSQzg5SmJjY0tz?=
 =?utf-8?B?Y2Z0bjJ0QURKWHNDQXZMNEVtUnJrZmJZS3IrWTY0bFBUTTMxOFA5Q3RId0Qr?=
 =?utf-8?B?ZjIxK2padDFtM2QxK0dEM2x5NS9weDFiWWU5b1dNVWR2UDBJbVVOclF0WGwz?=
 =?utf-8?B?TjVzTGFjbnFUTUNxT2NycTZydTZYMmxRS01hVlFqWXFVVE5qVDRMWmUzeWxr?=
 =?utf-8?B?c3pGY20wa29CMEJNVXk0am0rWGtFQ2R5SEx6ZE53bGZ0ZHBUTnprbFUvRm1u?=
 =?utf-8?B?aEhoY1lFQTZBU3ZCUzB2TzEzU2JHRjU3Y3BuaTBZbzJVV05ReDhEdmw5QitT?=
 =?utf-8?B?RUZMS0I2ankvWVp0czBIRUl6OUlrMW1ab1lqeUVxTy9xLzMxM0hBc2hPNmNv?=
 =?utf-8?B?ZVo1eEtWMjlWbUdBUWV2bTNHWkJjMkdwallUM1dqZFZBcEViakhoSnN6WXRy?=
 =?utf-8?B?aUMxMHNqVC9KM2MycUVtMDcyczJrUHNpRW9jQXZjREpUaFJES0h2NmRRSWps?=
 =?utf-8?B?Y0x3ZkFkaUVOTk5lNlNpYmllbmtnRG9IMzVXZDROcWp4LzFodE04T0tUbzcr?=
 =?utf-8?B?cTc5Q3N1VTMyNGQ4ZjhLNzduaVJDSmhJM3RiNklNU0MwNHNYQXA4V0lxTkFl?=
 =?utf-8?B?czlqREQyZ0NmMTV5d3puSVJNemQvOTVRVzR0Qjg4NnNQOHJWRmY3dG1qUll4?=
 =?utf-8?B?dklQT1Nic2VXeWZrZDJZYkdCcm5EM2JBWVlLdGM3TklLWXh6ZVU0VkxlRkQ0?=
 =?utf-8?B?aG1oVE9SMklZL2lsUG9ya2REUXBzWXVlRzBWK3d6RWFOTkxXb1lwWmErSnlq?=
 =?utf-8?B?RC9xMmF2d3lFZkdKaGpSakRDZFhVMWUwRFNtdktxODkyNnZNcXhyNlFUUzdF?=
 =?utf-8?B?bW0xRGVmS2J0SWZ3cjBmY3VuM0lxbWczZG0vWnIxZkcyRGxMS0pTQ2xpWTdV?=
 =?utf-8?B?TXljc05MV2Zad3BCWGNHenM0aGVyMFFIRmExb0hUMVZNenJ1RitYQ2FTb2sv?=
 =?utf-8?B?cjgwNFYwSjNqUUx2NnNPblBYTzU5aFNuMFBDMFBucUNJOTByTGFMVmFITlMy?=
 =?utf-8?B?OGEzZFdzQitCS0cxajRpUklsdVNCd2ljMFNzQVdDU0QvZUJsc1NPZVVVWmUz?=
 =?utf-8?B?Znl1WEJPelBFOXdyY2NpeU44SG5IZGxlRVpHc1BUTllsc2JielQ1TW5lRHJM?=
 =?utf-8?B?bTNxY0xJaEl2dm9LTEptTlUzWmZENTc2cGticDdDT0huRGlNdStPb0VtQ29k?=
 =?utf-8?B?K1dtYmV1OTUyK21SSllsV0txY29peld1eUtQOUFxcDNYRklhTit0aDZXUDNa?=
 =?utf-8?B?ZE9vczRpS2wwTE5HOHB3QXcyciszNWNSZ1ZueENXWWZnckt1a1E2Ky9kNE41?=
 =?utf-8?B?ZGFhL3FVamNsaVlDYnZhbWFlTXk2ckxJRTNpT0Vhd0tNeTk0aWl4dzRwdGhN?=
 =?utf-8?B?MDgxUEtKV2ZjWVNxemxJem9CNHhzT1NISFZFUHpHeTJzQVVnU3FrRWRzcnlF?=
 =?utf-8?B?QVFaRGMrMGdWN05LZlpSYnZFb0NKSHgrRE9xd21EOU5EcXhFSjZBdFQxUGln?=
 =?utf-8?B?YjNtdmxJQ25LV1M0eFB6NVZlK3NwOVZ5TUhOTnZ4UUdaMWFycnRMaGpJWjhW?=
 =?utf-8?B?N3hZdTlJY3p5YTYwWjk2YnFzUmpKVTVSUUF4MzBiTU45NE0xUXdocm9SYzFJ?=
 =?utf-8?B?czAxaTh5c2ExTWpKSTdZRU1nL0hOaFMwMjczaWY5djFWS082RG9Kdmo1bVcx?=
 =?utf-8?Q?l0NjD0x8a9j0vQ2eE5jTlqh1Pg8dSyWHyIm/T?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b18530d0-1100-4563-ea92-08df4b1d0c62
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 17:53:44.4818
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M+iEA3BT9zgWZc3fwH6KTgPonhJkFCQcsDSlHrtJRugD8WpgjjA9NcMHA5cGh71xtu1ZbjU6Pj4PM9mA+WIxBQqKlBBEcp0ELPzpCbW9NY4+TCvZ/MKzFzLx1llWF3K6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI9PR04MB039066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_095350_375298_27797F82 
X-CRM114-Status: GOOD (  12.07  )
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


On Fri, 20 Nov 2026 19:32:27 +0100, Stefano Radaelli wrote:
> This series adds Cortex-M33 overlays and combined DTBs for DART-MX93 on
> Sonata and VAR-SOM-MX93 on Symphony.
> 
> The first patch corrects the Symphony resource table address. The second
> moves the M33 reserved memory and remoteproc configuration into a common
> include shared by both modules. The third adds the M33 overlays and
> combined DTBs, and moves the common include from the module DTSI files to
> the overlays. M33 memory is then reserved and remoteproc and MU1 are
> enabled only in the M33 variants. The overlays also reserve the firmware's
> peripherals and disable dependent devices.
> 
> [...]

Applied, thanks!

[1/3] arm64: dts: freescale: imx93-var-som: Fix resource table address
      commit: 673c77963db746d03fe4a8d4bd996f9d1f434b92
[2/3] arm64: dts: freescale: imx93-var: Extract common Cortex-M33 configuration
      commit: 1297336e072497048e303f78405b09bf84bfc38d
[3/3] arm64: dts: freescale: imx93-var: Add Cortex-M33 configurations
      commit: ea0a01add4c61d799453842c65c7073f1bb89854

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

