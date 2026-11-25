Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1B2606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 18:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EgYHB1dj;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=H12Euimf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=JPC2Imx/8GoW+jI4iX3m/zXnPL3Iz1w5eT3+/bwmp14=; b=EgYHB1dj6FW6E2EstaKmkFUKWp
	cquJdavzKuKBETBRhI5HrhGEAA/v61VxTubh4s4NnN4SUD8gcdd38PWcXhefu4NhYEVotIoGTsmNV
	r5kB46/qHa2Lq073g9qyGYfPnGmXSWdmKvkRf/LeAKwlsNB+8X8YsiWTmbuT3rIXVwz0L74XR+mFP
	+JW/0LNPUAxe/4NMwV0owCuu92gNukVHBv1B8FuQhpOoRzjMmDfW7NtCsbUETloFh7dLy+l3To4DX
	9pDeFr8FWXibfwTlaZbO9TgmjZoKzwNOomV8IE1Ko1teLe5082MrT0d9B9T9OOc5pdVxn/9kBNQoQ
	8THCd/bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHJP-0000000AutQ-2KP4;
	Wed, 25 Nov 2026 18:01:43 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHIP-0000000Auiz-0AM0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 18:00:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SrHOe8giKhMhSSGJ7pd2GILm2waTujyYva4wJfXcDasnfPgmRZvnhPgMKQYGOi+zBdVs9gdBRwyhzFVS/ncJL2omPJ2Ca4Ca1FHz/6qTWCFybtzCbRmbqgCoK2k5dMmLscNOJ3oEgCGmJEnAsXeYtKWyOWwr8D4oMQmX4ix4v9YNG9bcUfW7tr/NgThvqv1hItCSrVz+7A0lsIyuP5yiee4Ctb1I2Lq59WWPF+s/WCEcQrBCSP/Ys24+brJTLa5lLOxU4R0uEB/DY32cNyBv3ucYUI/13XFFijuGPeDaysYWEeeyqq4wuSRj1Qln/ze2o763eJRUKJY1kqRJJ60gpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JPC2Imx/8GoW+jI4iX3m/zXnPL3Iz1w5eT3+/bwmp14=;
 b=oUsJDEvbVZXvAQJJqMJMXin4cNFxUXVwd2/EXKPmuZwdfa7Dv2+lcirsoQbJDoJ8juS1BaMSdHY72QHoldA2IGYDLwANk3WUvzeiTrPi4LSDqAm7SthRACG2h5t18tzeRfI/A405OMiWYMBRGLbgWIykH2XZyusOT+/LIzsa0FXKrgpJWtPBeHrymeKMJlHgJCPbbAqq5YkwrIquNAk19pPwOLX1IGvtSOpzyxncZBlSL5TiEF0aPwMAvE/GapiX/aAAm6DEenV4ylHf1WbwTIjEx4DUlVl815Ne8e9BVmzGTIOpV8Fc1F3EtjWItd/3XgyPJ0tLEbodtRljc6hzAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JPC2Imx/8GoW+jI4iX3m/zXnPL3Iz1w5eT3+/bwmp14=;
 b=H12EuimfzR0UzxB+HsdRBQezTpZK63hFasoIWMI6H3g3bOqtZ4dfNe28ea+HFZQxQM5oWxDvWrZt2HB1iMy/joVBSiK88adRFMGC8IKGVClPbRDhPeKjc7xlT9RGaTDca1hFzOMayuwdy3eEetw8p1HUfZ9zE6/tT/yRJnzTWUQj40BQtdVcYLESu53rHkR7ZN3L6R3YTlszRqOOpyEZmF7lgIeDokdWGBn7+wOhbxcyjeRPLrRE16nKY/uWD8/i287pJwNeNledWE4KxZoE1okEGdhSsT3Tm+altkOqwVe8DGyREBeVrn9AQKM+6oEopdrEPps5BLSGIcE3lWW6Hg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DB8PR04MB6890.eurprd04.prod.outlook.com (2603:10a6:10:117::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Wed, 25 Nov
 2026 18:00:36 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 18:00:36 +0000
From: Frank.Li@oss.nxp.com
To: Francesco Dolcini <francesco.dolcini@toradex.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco@dolcini.it>
Cc: Frank Li <Frank.Li@nxp.com>,
	linux-bsp@toradex.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/2] arm64: dts: freescale: imx9[135]-toradex-osm-dev: Fix SDIO_B interface
Date: Wed, 25 Nov 2026 13:00:29 -0500
Message-ID: <179562955482.3138640.15368712550107593780.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261122171931.295307-1-francesco@dolcini.it>
References: <20261122171931.295307-1-francesco@dolcini.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8P221CA0019.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:2d8::8) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|DB8PR04MB6890:EE_
X-MS-Office365-Filtering-Correlation-Id: 65da4d65-50df-4471-edd2-08df4b1e01b9
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|19092799006|23010399003|376014|7416014|366016|261009221227099003|261009223027099003|18002099003|22082099003|11063799006|10067099003|56012099006|261026121527099003|261022075727099003;
X-Microsoft-Antispam-Message-Info: C0lA2YDjj8BG3Ez3It9zrBDmquy87qSRlNFa2eiUG8wbY+55z8K66zWTMMnXSpsIl8rGsHzbFSicXPvCVw9w6I+iatOr+wshwghSt69DeCFoA5Ak13TENMS03QAYKaP8xzIvWk26FC5rPE5Vrd4aS5+mhyYyrHF4RPhM2Cq1XJlUzp1uScYlxKHpD5mtHvcvT1METsrjN+825kAnWsuY/iQ6UPNBQCR16v+5KaXOFUEVGUT61xvBopXI2m33877GkGPKv/nkuyV/AjGy0C5ZhQRz1AZ/tisKWQD0/V3ST4bMNy3yLC46sJbiw3YLauoooYMdwQJCSvgwJxe3McHDHhoLwXj66PZZNa9Sng2DnB9qf82OrMXjw2uNZbnzgr9eiVKhm9t8tgLRqEE9H+ujajQ3+FQyvA1PVwbn/wv55sN6o2j5NG0D2SNJHUKlOUOhkZVRHC2XcYSQDstY8GCueNy5s+o9mjivtJU/1Sdn7udQxnihwmoKIG9eVw5Z/TC41pIGEYkl/a5VUcEkywK2cW7gIjZVeT2ytjWu0Shgt3lBeiA6C/BkP4vhLwS+4az6HebqSbsV8O22VeDF1DEEMyEmUA3136aQ59fff3Tqg7fgWrpvA9ObjJlN3QMLg2gduCeorzT1XLgMU5lZSVN13Gk5NgrjNHMdzXruwcgaB6g=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(23010399003)(376014)(7416014)(366016)(261009221227099003)(261009223027099003)(18002099003)(22082099003)(11063799006)(10067099003)(56012099006)(261026121527099003)(261022075727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TTlRazNXeHlMNC9kTE5rVTdFdVVLbkdHK3NvVDhDb2VqTks1ZE9SNkZFbkRU?=
 =?utf-8?B?SnNBb1ZWaFBFbndjTVJmb2hMeHF3eUJ3Tmx3SU5ORk9wRWo1YkxTTXlvdW8r?=
 =?utf-8?B?d0NPaVVxQksvMHZkUmF1SXdKYmoxRWdEL3ZKRDF4OFhyRWdySElMTW9ETEU1?=
 =?utf-8?B?bk1YdVhLWDBuNks2RFRRS0dGSmhEUFJXUzdUQWtxTU5ET2IzMlphbGZMRlhZ?=
 =?utf-8?B?bTVxWmJkZ1FZeFAwSlloc1IvVDhwQkI5ajdweUVrSjVmVVBFa29XY0RCZjNT?=
 =?utf-8?B?NE5vZFdvVklMMW9XQ1J0UFFYOFNWNDg3OVRJdTVReU9FejU4ZCs4amx5bWpZ?=
 =?utf-8?B?UnVieTNvb2pjalhKTEQyWTBibGY2a0hyR2dQbmJJMC93Z2M1NEpkQ2ZVSnpR?=
 =?utf-8?B?S2dOdHFDV2xDUm1Ya2FQM1FuMWU5cEp3TVFpaTVDTlkzU1JVZjViUXpxa3Zk?=
 =?utf-8?B?dFlvWStrZUpSdS9Nd205Q3NpY1A4OE9LbFIvS1RTaFZoMGZ3SFA4UlRRd0g5?=
 =?utf-8?B?YWJ2bjR4U2RXaDVpTTd3RlJSb0dWcDh6L3dWSGRRR09CUlF2cmI0bnQ5R2Fy?=
 =?utf-8?B?Mk91RDdFOFpVYzRsM1VkaHltM2xGNzlhY3V3akhhN3hFK2xwK0tadkFPL2s4?=
 =?utf-8?B?cWxpenkyV2FiaGtQbGRCVlplOUh0MlVMMFBLNVZPbG10WE5INzVQazRCdDE2?=
 =?utf-8?B?VE9sZm1UcGtxdGZTYzJkNGl4UEkzWmwyK1NMdmZVZWNVVGxZQ0JhZmZBWUtv?=
 =?utf-8?B?VWs1T0lHbi91N1cxTFVUV2VqcUxRZHJTVEl5bFhUWWJUVUdPMnhjUTFJVU9S?=
 =?utf-8?B?NDZmSmRLdTdtaDc0UWcxVWRCYVRMSkdlK3JaYTUva3FVOHpiZ3hpcnB5Tkhr?=
 =?utf-8?B?QVljSTErTVRGWFhXNzU4K3I1eXkxVGpxTHA3aXk2VytHSitXYkpKQ2hyUlBw?=
 =?utf-8?B?TWQ0RVZwNW1LY3FTZkhmVnBEQ21zV29SVllNN0kwYm5lZzV4VmRONEhHRGxP?=
 =?utf-8?B?Ti9GZVpqelZnd0VwdUhIckVqRGltZUF0L2dwcGtNbGgwTEZDVi9mZVNPMGxM?=
 =?utf-8?B?dzNvSnY2amFUSDZ6MFRXMmkxajUxQXp3c2o3Y0FqeWFjdExPM3FQWnFXUzBF?=
 =?utf-8?B?ano2OXNBd1NjWHBoK0NZS05GZWl5U2s2VnozclRNR0h4ZGlCUTY2ZDl6UW95?=
 =?utf-8?B?Y3drcDJSdEJqd21ML0liYThGei9EZlpRSmlFUWkrV0VYRm5GRVcwN3ZSd005?=
 =?utf-8?B?M24wZzVUYldoUi9hd2Zpb3ZwRllXaTBKK3NuT2JjTzNDSXlybTRlOHQ0ajZy?=
 =?utf-8?B?VTZ4bFhjWXl0T002THcrcDl2UXREaFArbWdSbVJ2Zk4wSHlLa3l0YXhyeW5n?=
 =?utf-8?B?UjBpVnIxUDVkb1Q1Z0ZOOWVNWmxYdkxUMm5rNnBiVVVac1FranBiSng1YnZU?=
 =?utf-8?B?bENJRm5vTFpnZ1E0TWhrblNyYVJUeFRsb0hzU3ZWV2dubDRwNkhNYUFwM1Jl?=
 =?utf-8?B?WU54QzYyZDMzVGpueUxkYzcxc0F3cWFLc0tyUmFtYm0weDhZYUtuU2VMUGov?=
 =?utf-8?B?WkZ1aVpidW1zeVJpandVSERmTTRqcXFyRjE4MEZlS1N3TnNpeXJ1TS8rVlQ4?=
 =?utf-8?B?WmViczVURTVGS2NINndOaExUQzZ1QTBVa1VDZWM4bUJRM1lLc1VXWTFJSERx?=
 =?utf-8?B?eXNIYXV6ejN1R2hqbFNNYlhOY2FSbjdFYmhEZllySUx0bTBmejlZcXhVSXFm?=
 =?utf-8?B?Q1dxcGIramNtcWl2Z1FKVmVBS3lLZmNDZjVLK2xxM0dtOXNEUFg4M2JyR2dZ?=
 =?utf-8?B?NHhLczJiQW91VUVGSENvOWk4dC9GS0kxakR6czVYeHkzNDJmV01oNVV5VGE1?=
 =?utf-8?B?YmRXWTZkTEEwbUhLd0ZqcERQaDdObG8vSFVxVkVZc2VpZzFOYzJTMXhlbmhY?=
 =?utf-8?B?UG9DTmdydlNwbXVWdFlhZmNYOEZabmt6OU1JUFRZQjVlZTBGMlMwR21pczc2?=
 =?utf-8?B?L1BBd3pzUWl6YUZ2RkpaWkZHOVI0UXNaSmFtMXFkRUVoNXFyZm1FM0F4RHJW?=
 =?utf-8?B?YlBFTEcydXFUTFhHdWNRUFdWS2gzNGpxbFVKRXJIQlF5QWIxem9qenZ0b0pi?=
 =?utf-8?B?SEt4K1dvMk1EcndHQUdBYWJFc0VURjRVdXFTYUxIOU5na2JXTjF0YnZYeVpq?=
 =?utf-8?B?VXlMWk56RThBZStCOVBrbzFla09jOTRaSnF0dG81TkN2Z3Iwc3M1Ym9xVjZw?=
 =?utf-8?B?azBYd0pBU0RQSkxkWGV0OWgyREdwazRwWnhxcFRqSEt4aGlza3AxT0JYMkpW?=
 =?utf-8?B?NTlXSFFQSmtiWWtIbmxMc3BQWVp0SHNLaXFqaDNUQVJCak42bUc0R04zaFNa?=
 =?utf-8?Q?xoDJuC75n4zNlLgu//+EFk9/vSIGEXHrT3WC1?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65da4d65-50df-4471-edd2-08df4b1e01b9
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 18:00:36.0726
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KgOis+c4/suR7TdCl3E+38HdYQOlu0hykrKu5M34S3wUzhCxTuAEliXU8K5NpY6FEZ4qo77alkK+6W9GB/wbBAiIpbrvU6vepyIWxErBMycRYmPo81AYsQ4c0Tck5oED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6890
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_100041_084794_52E0CFD4 
X-CRM114-Status: GOOD (  10.23  )
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


On Sun, 22 Nov 2026 18:19:27 +0100, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
>
> On the OSM Development Board, OSM SDIO_B goes to the M.2 Key E slot for
> a Wi-Fi/Bluetooth module. The slot has no card detect signal, its supply
> is not software controlled, and the SDIO_B signals are fixed at 1.8V.
>
> This was noticed from an anomalous interrupt rate on an idle system:
> with the slot empty, mmc2 fired about 45 interrupts per second, because
> the empty slot was polled every second.
>
> [...]

Applied, thanks!

[1/2] arm64: dts: freescale: imx93-imx91-toradex-osm-dev: Fix SDIO_B definition
      commit: a9f5577f21dbdd097f8bd0bade4777cbc2c5b804
[2/2] arm64: dts: freescale: imx95-toradex-osm-dev: Fix SDIO_B definition
      commit: 25e472ca356c0395d7af26cb325b80bb09b2a183

drop tag "freescale", every one know imx is chip of nxp.

Best regards,
--
Frank Li <Frank.Li@nxp.com>

