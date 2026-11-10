Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5239606A9BA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 14:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Av+svutK;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=a8y3qDEK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=CIxOq45m7rsP/7NoeEg7Q6EYz4gddk+CB1POgIINjc4=; b=Av+svutKz0jMWT7HwszSxhRZbI
	vf9fVuWpshmhZVY8ZZivfpRiMGiZF/lxgpVsFf7KavWu9sMHYa7Y4NyHuGih72Wmg8RnFBQXIUnpo
	M6q65ZjE5Sd1z9CjcN+9NaJXHs3T5XdsDl4Fi4TaR1SnCDgIh8ti2dg0Ex63s2Aavw5wWmgFN8qaz
	+eAISBWjkw8zWhkd/OTjpS/3fwnJGvy5Mdhjl4VDadD6VS5z4/OeMdQxG/yXXNzJQOhHn0OAMHFhM
	HdPv9e6s10KjygLjdm3FCZMwmTgpO6easaIaNzbP+yxX89BrV2QvHey/CABQwysHfUuPvAfItatwr
	X4/ODYLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQmpz-00000004CcO-1FwY;
	Tue, 10 Nov 2026 14:28:39 +0000
Received: from mail-westeuropeazon11013025.outbound.protection.outlook.com ([52.101.72.25] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQmpt-00000004CRk-2f8k
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 14:28:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PI57U5GkWAbkpRB1xtBX+Or9+LeRR3mll1Rjqy0CBAQwfKTIMK3cmVinhlu1qWasmr60AQZvGisGYLj96KUhV7ZDBBIsHsL+atCO3hyiKjyJuw12aawG3QkaqksO87O4va26eEfi/8W+0fCcfqxv1BNt2JTSlqnAwioXlP6HjSIJqxdJyPkctMNmH5z2RLrPZwpLRlHai2yfGq2CTiRnQGnSlXdzGbRYpcUWvKleGze/vC2Yx04ZIVZZhVCkxklG5BBiSm9zehCo8bf0GaSuBwRtSFCFn/MgPVmc6Kku7RAsCkxjSIpEHT05JFS5XG8tnshn6i7SNyS5i9Ha7qHsBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CIxOq45m7rsP/7NoeEg7Q6EYz4gddk+CB1POgIINjc4=;
 b=iO3RJvLLj/K0dABvcdW2k7MNSWSwP7i5uil01cb7glnRiapnCYt1hNL92y91NuyQLhTgHJe8BopnfMDYBVvFK0atGYB8EjN9fZ1lyQXXKoeoHoyJH+APSN8LVcYxgZHs+kKJAhZQhKKJ1Cvp0QzGuadDs3HdGE24WBd9ZFiD/iGxsAvduZVp0hS9qPvDufzucq9gZaLq8NLYLmVhcXNAH6BJrX6ha1SHMi1WVFqXB6BQLOdbMM9GANs0BBXNWlLShObD7aIUrzCU28c1VIHOBw9vj1FqMnzSRJc9xYYEJN5QvuxCS3P9itVCWvQjWisfzIh4pLawMtVWY0SAeOq1hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CIxOq45m7rsP/7NoeEg7Q6EYz4gddk+CB1POgIINjc4=;
 b=a8y3qDEKDUh3YRHRXXOMB0/fq2cfLmNcci0+MUSuQ9l5qaFaY4xab9g2Z0Bn10HPV+6lYk3fxooN7/ehOT4q/28fWTGcLeb+d9iVi/5ywy6LrKjU3BwjET6giDeuTuwe/WSyjBuZ6GoAuhlpZ7HrqgOUgj4Rh/xlsx81e4b7TK1tCIvKDD/h0T2Vs+ECYTX2jOR1F2p0OJBAZkQ1EIaAry4Hot/ES0wZ42AJexk9C/FEJ+oLChiFEUiofpKg5VgPx4+RxrAyc88LimXJVeXGXjzTHZ1QeTMpKzNDwxOOnXt4jF2zY62Zv5iNLamwbotTxSIKzUVq0GpT8vOOyULtKg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB12318.eurprd04.prod.outlook.com
 (2603:10a6:150:32b::19) by VI2PR04MB11196.eurprd04.prod.outlook.com
 (2603:10a6:800:291::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 14:28:22 +0000
Received: from GV2PR04MB12318.eurprd04.prod.outlook.com
 ([fe80::a498:2b5a:cbdb:d6fa]) by GV2PR04MB12318.eurprd04.prod.outlook.com
 ([fe80::a498:2b5a:cbdb:d6fa%3]) with mapi id 15.21.0592.012; Tue, 10 Nov 2026
 14:28:17 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v11 5/7] dt-bindings: clock: nxp,imx95-blk-ctl: Add LDB bridge child node
Date: Tue, 10 Nov 2026 14:27:45 +0000
Message-ID: <20261110-dcif-upstreaming-v11-5-9e13c85ae0d8@oss.nxp.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110-dcif-upstreaming-v11-0-9e13c85ae0d8@oss.nxp.com>
References: <20261110-dcif-upstreaming-v11-0-9e13c85ae0d8@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4PR09CA0027.eurprd09.prod.outlook.com
 (2603:10a6:20b:5d4::17) To GV2PR04MB12318.eurprd04.prod.outlook.com
 (2603:10a6:150:32b::19)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB12318:EE_|VI2PR04MB11196:EE_
X-MS-Office365-Filtering-Correlation-Id: 384cc8e0-77a4-4b79-b8bc-08df3f36dceb
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|7416014|1800799024|366016|19092799006|921020|10067099003|11063799006|56012099006|261021123027099003|261021121427099003|261009223027099003|261102123227099003|261026140227099003|261026121527099003|261022105027099003|261028144727099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: QQSLfBCN7Nby/T1f6sNuqyApm8JG8kTH4+8TjrYjUXBQOz2sr1DESOMjRzzJxoSks7Zx4qM9NQcYHkXb2NN3liySf0GmZh1PYnsmYiU7ykZoomGdsAh41TwgEkKVxT/ZrM+qRhTwNMMeMJ31qiJoxYrvA1RR2gS52SkwCqOgGcMEXDS14jG+9yVTg0/AbOU3fZ69iaaXw792tn6bMXtHv7okbgx1PHGpYTRW5w46PpVM8l9HxY+c46jAo8nJiTo39DQrrjKIrtFAsccwm5d2A+q9sKyhLpKCd7L1OQBYdwHmIZu5lS6NyRBL4GELTLNn5STkGvXetXkEREqKcnn+3z+VmG+GaUvZNxCsg3YV6IpcIlN+ZYRcdiUu5zqmTno4GEmokbRXENSeetInSq83z7/H5Cg6lkC3TJq14UzDX73Pf9ThoW0/RNPfh3Gs++pw0U/6MncQV/0DIL/Xin3XCMCh/jsALhHWquEbf96ZrCzZU9r6ek3F40wdRkfrVyI+BzICBuGTK/BHPKRDgQcEG/w/U2QJRm1+naD0g45mbe+F0ruki90cOyfEPes6GuzuNST0clqMvR7SVfKMh6KVs1Hk2E/RX/+a7WPDvT2Jf+fldqZkvU/irlFooYUytPZZ2bqGy5uG7WLZIIjWea49wv8jZzjHniPFva0I0GloJCnCPIXvargOGUIp0r5ClDW4vY5n9oXuyUPaZVFBkjspqQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB12318.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(7416014)(1800799024)(366016)(19092799006)(921020)(10067099003)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261009223027099003)(261102123227099003)(261026140227099003)(261026121527099003)(261022105027099003)(261028144727099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UkhqT2YwSWxzV2x6NW13MGRERkNETnZrNXU2cHlqelIxWlNIZDZQUW1qWUFN?=
 =?utf-8?B?N3NtUFhUK0JZTDl3NmVOSXloYzNzUkgzTFYvdjZibmNjUFZUc1lETGwrNWt0?=
 =?utf-8?B?WHFzUlZnWlUyMGZrV3VjN3Q1L1NnYmhKVWNldXdzbFF3TUlpdVpQMWlJVmdC?=
 =?utf-8?B?bWJEd0hENDFuT0VDVjl2K1F6QzhycGdGeWkrczJPcjRqYy82WkJ2eWhDYUZM?=
 =?utf-8?B?NldhTGU3eFdWSlhkSHJ1TmVIdzMzdk5ESHM5enU4OXpEWEY5NzdiU05mbXFw?=
 =?utf-8?B?cHlXbGN3dWpLbUs0anRzMExMU2Z2T3M0OFNEMU4rVFdXR2NFS0FWSmhhTUlz?=
 =?utf-8?B?cWRFNVhFeHpVVWpEZDYyMG5BZHlYa0dyK05vMjFqTXRFeGFaWnkwRHB1TEky?=
 =?utf-8?B?b2QzdHpHWlYyYkVpMFRrR2locXowQzl3UTdiZWM1dWt6eHlLTlpyTlNYenBZ?=
 =?utf-8?B?R0p1bTZpRFZlNm1aR0hVS3N1Wk53NjkvQWRwbGVmOERCSm9ucTB6ODdGZEVK?=
 =?utf-8?B?eVltcFJXU2k1ckhxSVFFM3lzK1pyNWZ3eVoxb1cyV291YmpJM3lJeTZ0ZkVB?=
 =?utf-8?B?Q0IzMnJGWHNHeXpHRU51S2lqQzRQeWFUQ2VXWEttdEZHRjMvRktxMTh1NE45?=
 =?utf-8?B?STNLQ1M5WFVKMmh0QXdSbmt6YjYyRCtlQkYvdXlqQUpOMVhtb2RGRlhFbk9h?=
 =?utf-8?B?Q294SkFBL083aEJDUXZUaTB4NWhwSzJuYnFDMDl4dGtvZHhNQ0VncWJJOEFN?=
 =?utf-8?B?Y25PcmVubFBHRGNUdlNZTUE0NmgzS2JiaFhwamtOc2VVaWJsNzZIYThjejZD?=
 =?utf-8?B?M2djM0dza2xrbDRXV3BOWGtneFFUMW10TGlMTmcxRGgwYkdncjJsR2hvRE43?=
 =?utf-8?B?bWlZaXJKeVhPWjY4L1BtWTVSelhBaTYvNGE1MXZNbWJyeXFlT1F2NER6NmRQ?=
 =?utf-8?B?eUd3TlZxU0lsVDRkQUZiOVRSQmxZRVZyTGxRUXMyRnltOHVuSUxGSzBOOXNK?=
 =?utf-8?B?cGs1K3FyT1crRmphUTl4d0gxd2tlcUZQdzd4SGlMWFpBRzYydjg5NEk1VHpv?=
 =?utf-8?B?ZDBrb00zMTJFcTkzR0l2R2F4eDN0ZWpCbnFydytScFowS21ocFJsb3RITzRM?=
 =?utf-8?B?azcvUGNzUEpTQWU4ejljSVBUOHpac0tMSkV0bWNBVi9OVThTYitlQ1pLZEg3?=
 =?utf-8?B?TERnTnJpS2N4dnRrSUROVk5TZDZsWGk4WEVGWVF0NEh0bWZmWlJ1eUowNDM4?=
 =?utf-8?B?bzQ3cWR1bUw0ZzZJV29LTVB3eEZNSVFzMy9lREZOUnNvWGd1ckQ0QmtrUnI4?=
 =?utf-8?B?L20vT1hCZHBzaWhJZFQ4bVNsREhtbWhTYWp2SHBMUmg3WUhKL21xbTBkMkI1?=
 =?utf-8?B?bmE2ZW91ZnZoNG0zbGgwb0NiWGdNQzE5ZEhMdlhueFg4UTlSUzdBY0twVGlR?=
 =?utf-8?B?L1B2Nit3K0tkaGF2ZldtSll4Y2NWU0FDZTZKNkg0OGp6VkFoZDliRlYybjNj?=
 =?utf-8?B?UkQwSFNNR1JzMjNicE55SDVJNDYwM3BVelJLZi9tT1ZrYlcxdjZ4cktFa1dR?=
 =?utf-8?B?Q1E1eDJ2VkVWSWo4djRKUDlIQWprdDFxem5PSDJjWEhnM285RkRFRCtnclB5?=
 =?utf-8?B?TXFvRzRQcmRhdkJZNEl1UERNaDlSNTlULzZ2c3NTTG11Uy9NMU5oWFY0MUxy?=
 =?utf-8?B?RVI3MWhSaSt2ZmhqT2drQXgxaERTM3dmUGtqNjJpNWdPOUloYXBTazNFNGdt?=
 =?utf-8?B?NXczZitDS2pyTGYzZnBOTk03Zi96VVBFSHg0QmwwMDd5eS9RanBaUHh4cDk4?=
 =?utf-8?B?VkRWdlM5ejExdG1IMklrWnVHbGQ3b1g3UHRWcjNsNUIxT2tVeU5Vbno2Rk5L?=
 =?utf-8?B?djVwaEFNRzcvSWQrY1FHTFcwdG9vM2Y0WnA3NXVMNkx0Szhuc05ROWduTG9W?=
 =?utf-8?B?eVRYaXAxeC9GYVA2RGdNdmN2YVJSNHVvQjNzMnZ6UFNZaUplYzRtL1pJU0tK?=
 =?utf-8?B?QzJBWFZldnpMZG5DMjRUc3oyR242QnprQ3lMMktvZDJ1RU8yK3B3RnZaQmJP?=
 =?utf-8?B?TE4rRHgxTUFQa0hRZHh4bktaNVBoNC9lQkNtejM1bTJGeUNvMGNOS1l4SEph?=
 =?utf-8?B?RmFBL2pjb1ZkeTJORjBrWUV5ZlQ2UmZZNyt0YWM3dGU0SnRaWkZCQit3Wmtz?=
 =?utf-8?B?YU04Z2hwQjNkcWdHUHphNjFPemU5SmM3VS9TNjI5alljOVZFZGJkSjF1emtK?=
 =?utf-8?B?N200Wk1yL0p3V0swL2c2S1NnakNueHRHS2xHMGZ5eVZSdkc2VmpzUHpDek9F?=
 =?utf-8?B?ZlhPWDJBa3NLSzcwdEt3cFpIVEtSRWdpaVBYNlhLMXI3VktiSFkrYWU5NnNV?=
 =?utf-8?Q?nqmlLI6zMogBy8+s=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 384cc8e0-77a4-4b79-b8bc-08df3f36dceb
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB12318.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 14:28:17.8774
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZiFHyCOjfhdRgyAW5zn5f+BKgODkncTQAe/xgXeoyUPXXQXoBraGRzAYtjaAAn/NlOZw/mikS0vRSISvKNl6xQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB11196
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_062833_836230_97263F13 
X-CRM114-Status: GOOD (  10.18  )
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Since the BLK CTL registers, like the LVDS CSR, can be used to control the
LVDS Display Bridge controllers, add a 'bridge' child node to handle
these use cases.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
---
 .../bindings/clock/nxp,imx95-blk-ctl.yaml          | 24 +++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml b/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
index fbbf1b3f17904..c2aeb434a8102 100644
--- a/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
+++ b/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
@@ -51,6 +51,10 @@ patternProperties:
     $ref: /schemas/media/fsl,imx95-csi-formatter.yaml#
     unevaluatedProperties: false
 
+  '^bridge@[0-9a-f]+$':
+    type: object
+    $ref: /schemas/display/bridge/fsl,ldb.yaml#
+
 required:
   - compatible
   - reg
@@ -63,7 +67,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: nxp,imx95-camera-csr
+            enum:
+              - nxp,imx94-lvds-csr
+              - nxp,imx95-camera-csr
     then:
       required:
         - '#address-cells'
@@ -72,8 +78,24 @@ allOf:
       properties:
         '#address-cells': false
         '#size-cells': false
+  - if:
+      properties:
+        compatible:
+          not:
+            contains:
+              const: nxp,imx95-camera-csr
+    then:
       patternProperties:
         '^formatter@[0-9a-f]+$': false
+  - if:
+      properties:
+        compatible:
+          not:
+            contains:
+              const: nxp,imx94-lvds-csr
+    then:
+      patternProperties:
+        '^bridge@[0-9a-f]+$': false
 
 additionalProperties: false
 

-- 
2.53.0

