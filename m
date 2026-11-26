Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E6C606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 15:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RrRjVL3y;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=ibvzpFdz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=UL9X2rzy/QwNTb0libtJW55sx27evAS9jXRLzPvPlhc=; b=RrRjVL3yMZnLJm+smA2QsEo13K
	iqVyRwxsgj2XAohz82SsCkCN4JAs9xDAj1KprH9vnN5M2EiN5mqeBCGfSgjXqsB3dN2igMUqCLoCz
	rB+UTEOcZbY28lamHYNYLIIDaGejwWBkq4oabnOrvmUjU0WQ0ex8sZ0FX8vLyeTh0VRujFzcyYcQQ
	CQBIozSZkd9PbDzNmphKEcZwPD/9ymK0TxqNnTAguzcN+kWpvuJi7AaFxJsQKbReZVMxYfhFuaPUz
	CdJQN2eIX3M0LqgEWebiPO+wMIBJr4Nz76/lo5DFJgurwBa+xtx8VpjFDdtGhes0ELfJX8wHRYPjt
	a1dzRH5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWbkM-0000000Dnbj-42p5;
	Thu, 26 Nov 2026 15:50:54 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWbkK-0000000DnaT-20d1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 15:50:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tm82QUikXsYdchDyeY9f5hEs2nTNdRPFd7eCCQL6sF4+xa3eRZOO2q2jxJ2WmxjGnItM2t7ckiOJdZ45qHR8RwwAPjxmGo3da5Saen1pSs/HC82h3DYUvoQSZ5t0jIFxVSqROqhNqvTxiOpR/mKyP12IFWs98LpbfjNSL6geJhzKYBFexYBRE2zjK7kBq34vqIrs7yOpOteXtDZFSdqB6gxU+/JvLyndNmjcGIP877q3dK6XI42jHMb56VaI7tdVuH3OcPfSEusyaUllJyHmii3VSC1LvmFZG8DHA9PJ88NCuv8YC8FCo1Nqg9K+8y4Zp6KvFbE2XCB7AwbcqxmdsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UL9X2rzy/QwNTb0libtJW55sx27evAS9jXRLzPvPlhc=;
 b=elyQJcsKAMJinbjwBzg3hbBp7mDs3DRmEyUh68vhmBPAWnfDudXFFS3tf083vbp1JKVO+BYtj+BY9ppx2yIxuJhv4/ZMdNlZlhOXjXD/VI6XKbWgkuj1TFOTuvA2B5AmPbJbCEeg7FLJBI6iumgG2PznLe7LlTnpo9UtGp3Gy/b/oamgcOiu9EB+g9+v5Wd3jPw1LXzClhR2YPW9oOUflGmLeEjLa2Q8oHxA3/hwWwR42749eLXxmTpyBCD+fCAVjkrrlNuC2mITnY55cpRr/gFCd7MLF/vPBCOeWt/P1t3zD7NZwTU19rwIo9FYQX8rMa6UVIBxwE/lXAD2ZHF8JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UL9X2rzy/QwNTb0libtJW55sx27evAS9jXRLzPvPlhc=;
 b=ibvzpFdzBsxMZ26g0fZ7vZzFL6fI7PTzeloIFcHK8GZuY7MlbZcTmqXLMHtdI0QQzUPnQ3pQ0SQV4pDfbXLi+pkD582AOlstyawoTIUr5y4Uqe9L1GkfOLZAOzm6Rx4H+hntwfajhJmGNfgypGH/khijj8Rm+IoVrzFyAttJBI5xskseIy2roj5P0+nEZDWSIApgNaL4UqDefZzYkUFjBDYNxMoZTFT2wuBL45ZicPzybOEArkV2qEs6pEQlnzinYV/3uDBCiGGGAyx9PP93MQpFsG5N90RKd8JDrJ0gs73kUBhCHt6Xbrnkt6FmRx490F5mUb2W8MEBwGEJlB11TA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by GVXPR04MB11020.eurprd04.prod.outlook.com (2603:10a6:150:227::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 15:50:46 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 15:50:46 +0000
Date: Thu, 26 Nov 2026 09:50:34 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	linux-bsp@toradex.com, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/2] arm64: dts: freescale: imx9[135]-toradex-osm-dev:
 Fix SDIO_B interface
Message-ID: <awhVSstE2PCaSppm@SMW015318>
References: <20261122171931.295307-1-francesco@dolcini.it>
 <179562955482.3138640.15368712550107593780.b4-ty@b4>
 <20261126075417.GA12954@francesco-nb>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261126075417.GA12954@francesco-nb>
X-ClientProxiedBy: PH7P221CA0019.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:32a::15) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|GVXPR04MB11020:EE_
X-MS-Office365-Filtering-Correlation-Id: b326508c-ac1b-4e5f-8b23-08df4bd50914
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|19092799006|7416014|376014|366016|261009221227099003|18002099003|261009223027099003|22082099003|11063799006|10067099003|4143699003|56012099006|261026121527099003|261026140227099003|261022105027099003|261028144727099003;
X-Microsoft-Antispam-Message-Info: DNXIQgi+UgtEuHpPh09Vvit+OsoiBg40xXnvMipG0RMYXtNXrpnwV0SWy8wKOOHbatfnheolDgovV3sTXYbMTvpmOtE0lc5HnVeR51Qh3XjaUbmjCFk3icjv3KPmduRiztIU3K3innxLSkGebwXjroCPJ/e231obx7dyZoPsgA7wr7gX6mS7UPRT6uhc508cVVjBLRWUrGUTe0Lqz067gjrm7TMphL8ohNjHMLbBFA9k15mb+eifwLOIbRKc+fPzWxuQEemike/DHyzOB8jWfJ6Ok/+NR0M4Z69AP5FmWtExDwpeYpY18Eq2X6wtsCcovp5h059e3xc+ISgakVG1FwLjQM/yy7Jz/EDzJJ+zW+fkLXSE61yHEPnUuVhYrASaY99xZ15mZQK5GWWFN7w+dDBxWVf6CGJIsl/DkiMj+HIw8Ublb+Gz/0z+dn+J2pcKKeNv2orUxMjai7UuUZRZySsjVMPsfUsHy9h+nl0RmxxKqjrMYYfx6veA+J3hJhqiZtQ3Be74XgJ9NSbIbAXAypwK1nugd/ilMmuPwrBX9DjLaLHNBGFmKoLLVSg6G0xAbm3oDYN9r2NAwBLjp+Tzl0WmNZtBgrNcy/uayvLVWfg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(19092799006)(7416014)(376014)(366016)(261009221227099003)(18002099003)(261009223027099003)(22082099003)(11063799006)(10067099003)(4143699003)(56012099006)(261026121527099003)(261026140227099003)(261022105027099003)(261028144727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?I6iAhsSNGgnWgZ5H7RdDlW3s9KVJZrAGOGcD/W0dvLkOzLyLjomY99pnzmkh?=
 =?us-ascii?Q?CJNT3+voElI+yAtwWWUxrDqkAMDeU6Q6oMU7LcH3PH4yg5Jngc5FRWJtOSWP?=
 =?us-ascii?Q?Q1ZfaKH3aSO3f0YFmpbDsnmzWQOrYTKuhbAV5LTaXkW6QKbDBo9c7Tyw5ctH?=
 =?us-ascii?Q?3o1NWECiiC8mqlq/3j5p0ucCgdD+l3pBNtyIj6DHwjESzSE+/gJgV+Mw820m?=
 =?us-ascii?Q?S+M3wB6c50l3OUlDrWb00S7iZZmOJHPhc/lMOBH1gnSN0PzgH/Z8tHr/lZXt?=
 =?us-ascii?Q?+PFysZoJfeIZx+X6TMpYPivfika/RtqHRFi2WI3IS/hAs5BMGky0d7V1YwZS?=
 =?us-ascii?Q?22E5yz/y3o3KJ4jEVVyrbFJzUgOKaUwITb3Bw0qaKH2OLOuCSRT/QRT/tuQz?=
 =?us-ascii?Q?QtYa69UBQHFaKN2tnxkuvBAhftLaPxoygFhX8KVzbKzcJ/CRksCpcdx2Dk7C?=
 =?us-ascii?Q?MmyUu5zlygFoyYkUqwcmW5Hag88HTA5pL5TAeTOzHT1P+vTjdKph7lN2tC/b?=
 =?us-ascii?Q?6OAhS8Wxi2gpVsV8yagBBd9WbLnGH2li0JlTZvBALGszGCAankMb9QY3Ng+x?=
 =?us-ascii?Q?n+dFj8zIpqzMqDB51E64NPyV1B7KfIsHSN4sPQ0Y5Quso0D7KEEsV66srUko?=
 =?us-ascii?Q?+dujQdQ9UUNvsMDuoUR04xWWAo2TS0jJm3P/M5tPlwsCl4JGv7GX7cBDBUJK?=
 =?us-ascii?Q?L0Xx5mcA/mZRlStXuL+KZmPVCb2T8TVab3GlO/6YSI4qN0pvE0EaDq7D62SZ?=
 =?us-ascii?Q?PU5WKCo+oMcVXkTzie28wRKe5pjKbymedKLDi1GaK2MWfPbL0Gv6qPaNMILL?=
 =?us-ascii?Q?bSQ9HnWMnXbKKJby1eE5/QQmHYBKgCobt7Qo1NlwxTr0Y9/rE2S7TIfYocpQ?=
 =?us-ascii?Q?AYQPSHolPT22CPvKhS1/V54Q94V1m32GoGGhmvPrhuyk1nd33OVkVf9fMHRg?=
 =?us-ascii?Q?o2yxLtG43Yp7uarh4I61sPHD839p4a/gDttdUuL0wYC2oiYLEjQAUrsONxQC?=
 =?us-ascii?Q?N3XvQ+VvSIUQpcKa1aL9xf1MdDSzOMdLlxa0El4XmqxCQ0oBiRR8DQeLslRP?=
 =?us-ascii?Q?i8gPN3g0bfl8YVUOc6LqqY8CQBAAjjKIPqVhqUjE7v4yamqWCm3ffYTmZXsd?=
 =?us-ascii?Q?vecVcrVMF+tSj4yceKcseDm6yGjHwlpWiXFBuUZXjnkYOJbMooN9EDYbfKVE?=
 =?us-ascii?Q?E32bPN5kacyzKRfT6kC4I5SNXu0ntdfN4knPgGJhpICQyF4MqtenuAQAZcll?=
 =?us-ascii?Q?QZnccxlHgIL3MZsBOaN2snNuJ/H7VX+YfbepW8ZlU6a9r2eQqMUzJXybTIA3?=
 =?us-ascii?Q?tvgtSuIyqgDcUrypeef5IkTK08ZtbbIkZjc93YBpQerPA8HG8PoEebWUPdH3?=
 =?us-ascii?Q?pREfaZL+g5h5YbDzerMjiOWJxEsPQaReRXywHWuCVtmPaUW/7erGGcCxBhwC?=
 =?us-ascii?Q?d/0HWZ208g13Sa3Noq4XA+dkcARdTdbysGcnqV48tsogeANk1DasrHjo0o8z?=
 =?us-ascii?Q?jxzPkpdmoBoQeOYOdI5Uy06kLcdmf2hEe9Wnr89ybQ2nAq4qCBbWC5Jd7h6U?=
 =?us-ascii?Q?v09+I/rojR2ZI+8il6fMYNvC5okFMMu1KD9G2KIMv8w486fQ5knWb0j3BBNf?=
 =?us-ascii?Q?WjUk9mxR4WWLouUmleLCIxv1MmCj9Mfx7LdiszuGuffZ39eH4RAfwPujktFU?=
 =?us-ascii?Q?qOk1GyqSP0R9bD+Oa/bwn/iJZvHXayeCLWOoaPf8W0oMYWdI4xtRTFfw+xtV?=
 =?us-ascii?Q?v0AH9VYO70OG6AjYl3nXHAomSu2MR0eOmhF6NEcocqosIJYtxwAv?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b326508c-ac1b-4e5f-8b23-08df4bd50914
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 15:50:46.4872
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ET4eR10shEWQZR7xWHv28GBpKyA5na+ltlhrneanDeREKuJirLGxCnedlEDH7qVV7Vjj1t7xjTSnIhKx6yuYQn6GcatqthApEtNN34cX4Wd4cHsSyQxQjosowEwXksJn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_075052_528136_F6AF380E 
X-CRM114-Status: GOOD (  16.23  )
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 26, 2026 at 08:54:17AM +0100, Francesco Dolcini wrote:
> Hello Frank,
>
> On Wed, Nov 25, 2026 at 01:00:29PM -0500, Frank.Li@oss.nxp.com wrote:
> > Applied, thanks!
> >
> > [1/2] arm64: dts: freescale: imx93-imx91-toradex-osm-dev: Fix SDIO_B definition
> >       commit: a9f5577f21dbdd097f8bd0bade4777cbc2c5b804
> > [2/2] arm64: dts: freescale: imx95-toradex-osm-dev: Fix SDIO_B definition
> >       commit: 25e472ca356c0395d7af26cb325b80bb09b2a183
> >
> > drop tag "freescale", every one know imx is chip of nxp.
>
> Do you want us to drop the `freescale:` prefix from now on (it's there
> because the prefix is the directory path, not for other reasons)?

Yes, most patch have not 'freescale' tags. So keep consistent and make
subject shorter, contain more important information.

>
> So just "arm64: dts: imx9[135]-toradex-osm-dev: ...". Are the DT/SoC
> maintainer fine with that?

Yes, we used that for long time.

>
> To be explicit, I do not mind, I just need to know so that we send
> patches with the commit message title you expect.
>
> BTW, please check https://lore.kernel.org/all/awbs94RtiqAOqhEx@sirena.org.uk/,
> it's related to this "freescale" removal.

I already fixed it. The script wrong remove fixes tags's subject.

Frank

>
> Francesco

