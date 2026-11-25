Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12923606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 15:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RJb3u+BS;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=bPokzDsK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=fpKrj9aLFoRLQc2Isa04ELT/eKqyjPXKSP62lAH+kfo=; b=RJb3u+BSqObFQPKdv3g9AqydRV
	rlKv9BomPCujZ5eb//BwL8Q6AFBa5VuCJd9WKLUXSeOhj1vzzkND60W5P1kPTvXVR/fYv65qtGHw6
	Wh9L9ivNFstIS19sN007W1ROeN8qZJ5ErSzIzAwIqZBeU4hpsUSG4E1O2RIHEAw7TBULxblM119cd
	htv1IwD4CTSBOah/G5oK/wkl2/q1vZsLU6QZ/2qXsvPaz518/zM75KH6vT3B/zRcEx8C5Omu5MRce
	HcjOUxbMRje07Afb5a20EIAK+zqS9wMbuWjkh3rD18SQW1pV7Hp+7mxNgrB619cK+9EuoNADHBh3A
	UwCiZYuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWEnt-0000000AKA3-3a6f;
	Wed, 25 Nov 2026 15:21:01 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWEnm-0000000AK8n-49no
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 15:20:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MCSQOZfdG2M1+DOOUUO+WiWhH14daCS7hW2TzIyg1MlgqWHe8kKJwhmbUMe6GIUXHw240ci9g3iTBybCX8XcpjIu9crUBbpU0vm3VkltnNcMOyfbzFAphQ8ldocdV3n32XQPMp9FBbEPI6UvEUfn2hJjfMUguy5ElND6K07xsQ/lJjX33rTKYrtsgiFnxPFsAw9u16OsOECZqSqvAEFjyrMvfOl0PVt8CX2d2HGhLuqYav3/a5+fFkLEeWSuI5pOBbuKNW5iQGeRXbcGhQtwtpEhfdVjCQJjqoDftfUpTG0DdPekutOhNtK/g+BCk8ppJbYhjubxnl2mKKPygoZESQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fpKrj9aLFoRLQc2Isa04ELT/eKqyjPXKSP62lAH+kfo=;
 b=qoUbJEJW7GNQeLc/JMojIkglRnlF0AmcNAnmeQ5e9zcf6OIGdSLVmZEY9yiQzxuTLSEvUixUshU5tyjl8pzfAcdp4cu0FP0ltbwu0WbYCORBZBgDR+CmMWR84hvmU7kI9hXu8DvOCHthBThUqOuNw+uVD2ZrPu35qmbhdYUL/StIhfwBF8yI6o1JV+6KjQs58wRYMx8e9Z9J7FvHV6JQxNedWbU92VA8RaN95bCjXnUynsNN0MeeZ1AV6Wz52dQiXtxT5TcXQXarPvOGiSYTfUGDzOH1Gt4Q0KhwxPxBpI9h/fyE5G7FfGEwP1+8oYVr2QP6UVtlTLjfubCpHXkOSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fpKrj9aLFoRLQc2Isa04ELT/eKqyjPXKSP62lAH+kfo=;
 b=bPokzDsKgxzbyEmJfFwsl4iaif1ZLVZfgc+V8gOWRZmchPOpvYvy2WYMwm5ZtMzsIP7xxOWDGWsbtnom+XjJYUiirJmjriOW5hdzIq9U2FpEn99j6oGXfG+XoEYHQUMzqCJw9UEwDxKritxpuQqdRGFsLqljoZiNxRT+Xohu+MFz6Mic/GAc5XgZGwZGGuvUIWw+I6iYcpMLwbCyGNHAdOK9dIfXw9gVGmN+ZgtH+vxpD+gk3pntLfYxWW2S2ustBjvFWbUkZSmzbk+IdFjLiCOhy2fJTaocMsMhCdhWJf9RG1pUVCGtrEMp/Ph13G5Xqot3dUarMxvBcKV2y5G6XQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com (2603:10a6:150:2c6::8)
 by VI0PR04MB651443.eurprd04.prod.outlook.com (2603:10a6:800:367::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Wed, 25 Nov
 2026 15:20:46 +0000
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4]) by GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4%5]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 15:20:46 +0000
Message-ID: <54e86196-57dc-453a-bc5a-ef2441f242a9@oss.nxp.com>
Date: Wed, 25 Nov 2026 17:24:29 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] nvmem: imx-ocotp-scu: assign nvmem_cell_info::raw_len
To: Stefan Ghetu <stefan.ghetu@nxp.com>,
 Srinivas Kandagatla <srini@kernel.org>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 kernel@pengutronix.de, Fabio Estevam <festevam@gmail.com>,
 Peng Fan <peng.fan@nxp.com>, Christian Eggers <ceggers@arri.de>,
 stable@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261125072736.769516-1-stefan.ghetu@nxp.com>
 <20261125123222.839732-1-stefan.ghetu@nxp.com>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20261125123222.839732-1-stefan.ghetu@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0287.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e7::12) To GVXPR04MB12316.eurprd04.prod.outlook.com
 (2603:10a6:150:2c6::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12316:EE_|VI0PR04MB651443:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f55a122-afb5-4fad-da4c-08df4b07ad83
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|23010399003|1800799024|366016|376014|22082099003|261009223027099003|18002099003|4143699003|56012099006|261028144727099003|11063799006|261022105027099003|261026140227099003|261022075727099003|261026121527099003|10067099003;
X-Microsoft-Antispam-Message-Info: ZoGdCrlLjelrCeGwik2JaMcwd9I/r/zL07Rih098KlLkql+wC8WlNAg399ma7r+l7Q2OcJE7O/HjoPtVH5lqC3acL05rMUg2m1DcQNlje7eXrRZpllmEeq5C21rZFHBQx8icbLL/soKi0qSjmCH4xAh1lT1ofNrvQG0iTV91+I0bFPFrouZDBpBtyyp7WSDdTcXLVIZQYXi0MeGvPOn4mqDje7yJ93qM5aN35hZEnn6wAZcHdsf+p6dcMIK5UquCPldSJULs2YDZerFJSqCV57ffCxEIeEBAjd/fgwWBHCVP0FKTXBB57x5Bh8fKRnai4bOFSOL+y6K5ytFGb0A2iI0iLPbNpRrSEyrfpUauxMKR35yz8Pho7t7eDDtS74OvuCG/nKA1GFKObZJ3BwGbTQfKjJh8lRjuKfMxgbfHwCkk1q2pFoHZx2kRErpfHkKV8RLKnnt5slceo28iwXywb9IB2BwOFcPjYJqrOyce3ySrmJg6gMEJziQ4vSAyU/zpGVVA+r9FM1lp4Q27OlJOn95I7ilITiz3nR+I08mwYQG7dU8LgCJR3AgbO8MfcJLqDXGSgF9dHZduH6j3w2VSJjrnnkmuvSSUFFQOh+gL92QoxNkshj30eTsxiCiWoIgqwBVNsBBkE8nP4glJ2Q8flnQRmTDcG5h1dg5BWWm5iyo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12316.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(1800799024)(366016)(376014)(22082099003)(261009223027099003)(18002099003)(4143699003)(56012099006)(261028144727099003)(11063799006)(261022105027099003)(261026140227099003)(261022075727099003)(261026121527099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b2tpNitxOWQ1S0ZhbDFLY0RUclFxb3pyMXphS0lHcHEvenJVWDJKdU52RThY?=
 =?utf-8?B?OVI1YVgzSVNuSjBuaHV5ZUtLeWFZeU80OW1BeDBvaUR5M1NxZG5XbytYQ1Y2?=
 =?utf-8?B?UUZORTVZNks3d21HWVRtVFJzNVltdlNkaVpYY2JJcW1oOENKckdSd2NQNjN2?=
 =?utf-8?B?cXVWTDZTekJiMVd3U0lrdktqSU8yTXVxemNsbEtpa0p2dXA0ekwrTjVHUUhq?=
 =?utf-8?B?VysxbmoycHJkQ2xRdGExRU9uS1JpYU55NHdMVkYwemdNT2tlZnI1dXBkbGZm?=
 =?utf-8?B?Y0Q2UDZydFkvZWVUL2E5TU5mSTg2TGZjZjFLWjkvczVVNS9SNjZCT3Z4T1JB?=
 =?utf-8?B?Vm1hVVVmZE8vS3QzYUFjSFVJYU9UenhuM3NQS3l1cFdBOEI4R3Ztc3BnWmds?=
 =?utf-8?B?ZUpvTXU5Z29NMkVFK2t5bkJ4MWJjeEhBN2ZYNjZMVUlEOVNFWk92N3I0aTNj?=
 =?utf-8?B?QzhyL2pHSnRvQmRYV0sxM09tUFY3cGZHeVRlZXQ4MXZ0eFVLeXBJeSthYldG?=
 =?utf-8?B?RnZsT1pLbkVCL1hibUNCeFd3SDlGRUdTU3ZuZ3BLUXlyVEpiN2RxUlIxZzVa?=
 =?utf-8?B?YjVQOXFjOThvOHA5U0pBRWVpbVc3V3IwZ0UvK0toUEc5RVl4a1JxUlRiVjJt?=
 =?utf-8?B?N3FyQ2NtQjluWmEwaTdBMllXR01PdFVGTWtJVDY0ZCt1ZjVYT053UFlKSDUx?=
 =?utf-8?B?TkxyMmpDU09wWXhFTCs4dXVxZ1Fmb1FiV2ZYSnp6ZUJ0WWZSQ0JENTd3SlpV?=
 =?utf-8?B?S0lzWkRsNnZPWXVPdnB1V09kOHRLMEE2dVdITGxvTVVSNzRsOUlhMSt4a2tm?=
 =?utf-8?B?OVZodVNVV013dFJyaWJOa1A3S0lNeFFUUXZiWC84YkdKbUphcjZNMklEVU5T?=
 =?utf-8?B?SkZiNVVSRkNKRkFNSHZES1N0bGxIVHlZeFhUcmtIb0RHVklwRnpWUnVaaHRX?=
 =?utf-8?B?Vk5YeWwzVHU5R3p0M0hIN09UTnd4eHByYVl1MWN1U09jOUtUOFVjL3N1VXdC?=
 =?utf-8?B?M2VId1ZRUktsbnlZNFdUWWQxVjMzU0NBbkc5OG4rd2E4NjFvMy9GTEdJZTF5?=
 =?utf-8?B?Z29KVk5nYjBwd2Y1U3RGVUMwUWFLaTF1cTV3ZGFPYkdFUTRLT2JnUHpoVEND?=
 =?utf-8?B?SmNpZUUxUGpkYTFaSU1XSWlpUWU5clRXY254QVJ5SGZrQUZGZ2NIbHZGaklM?=
 =?utf-8?B?TmVXaEZHYW9ubk5IVFdZeEJqak9wRUZrYnBuTHg4VlFGRDFNNW9FTDlTbzVy?=
 =?utf-8?B?YTFBWXBKcEJCS1hSR2RMUUFIdzZVWURDK0NRaHFzWmY5VjFpanlLWVZaTTUv?=
 =?utf-8?B?YTV3K1VQQTdvWS9nMFNxTU96ZGNBYjBrS1o2UFR0OHAwVmVNeGVtZ2ZsM0Ni?=
 =?utf-8?B?a09FdW42bWZiY2ZUY3NaWXA5T3UwV2pnbTVpNGRNRGVlaXN3T0dtUU56d1dV?=
 =?utf-8?B?b0NQR3B2VnRZaksyMTAvMHZTV290K0pYMkxaQ2R3TjVEOWtVakJ3bHVlZzll?=
 =?utf-8?B?UjQ4M1BSaFpyWHNzcEE1NU5vS2ZPVmdBUWtxeGprTkRIMHJhQ1d1UGxZZENL?=
 =?utf-8?B?bkNDYXdVL1haTHNlakdWMktjeEs5UXI5YlpEUWFhL25GNzNvUVhGYzJOeUVl?=
 =?utf-8?B?cVFWQm9iWFJ2YTlYUEtwS0piVThRNDRKZXFjUDhnZTNITGo0U2IzK2NGN0k1?=
 =?utf-8?B?d3RyeFBtTWJxb0xleWhzeThWSW5wcWhWUFpmaW9YbXFvdm82c09xN1NBalpq?=
 =?utf-8?B?eGVyY2VkbXNXcDBHOXEyeHRWNTEveVc5L1AxeDB6REI5dXlpVnRwa2xjV0RO?=
 =?utf-8?B?UTQrN1k5Ui82bzh5dUtrTDg1d0xIY0pUOC9TbHZkQWFVV1prTG96U0FNSGtH?=
 =?utf-8?B?WmJCbkRlWXh4THBNOUtoWHhYeG85Zk5aeFJMcFBnRWhOTzcwNXI1UklnUEVt?=
 =?utf-8?B?c3IzM2NBTVcwM2RhVFE4MjAwV095OFJka1p6ZmxVN2kvYUNjSGNzTGxRditQ?=
 =?utf-8?B?YXlXd3BTaUNmSXFHMEF2SEs3bVU3YzNQa0lCUzJYdTZKeHptMXp5ai9RWEQ4?=
 =?utf-8?B?WjJ3bUUwQk9wemJsY0Ewa0FLUkpZVmlxMWE2aW9LSnhhQllSWkRLL1ArcFhh?=
 =?utf-8?B?MXRhNkViWHBBVjZndGtmcmRBeWgrL3hSR0Vqa1NjRFBxcXVCNHRxNS9kSG1X?=
 =?utf-8?B?SHJZNEtHdmhTclRHcXdUNWc2RndjVmo3VXk1WWpkeHZ4UUFPVFJydThmRHBp?=
 =?utf-8?B?SVp1ZjRwM3B6LzlYUTBPSHRGZXdZa2lKMkV2NXVMNnFWQ3NqT2RIL0NiQk15?=
 =?utf-8?B?cWVLRkZHRFBuTm1ubEwrR1FoRXlkamdZNWl4MEJpSTJZbXMwRnRXQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f55a122-afb5-4fad-da4c-08df4b07ad83
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12316.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 15:20:46.0036
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Knbbg92r1cqXg0OCUTy+1/ATTRDhRccRPYlv4cEecGYKzHFNWuzsXPhnibOUbHsd51SQpZJIxh21k8mRbIhF0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB651443
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_072056_503067_BC58FFB1 
X-CRM114-Status: GOOD (  10.54  )
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
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/25/26 14:32, Stefan Ghetu wrote:
> Avoid getting error messages at startup like the following on i.MX8QXP,
> i.MX8QM and i.MX8DXL, printed once for each MAC address cell:
> 
> nvmem imx-scu-ocotp0: cell mac raw len 6 unaligned to nvmem word size 4
> 
> The same was already done for imx-ocotp and imx-ocotp-ele by commit
> 48b5163c9575 ("nvmem: imx: assign nvmem_cell_info::raw_len"), but the
> SCU based driver was not covered.
> 
> This shouldn't cause any functional change as this alignment would
> otherwise be done in nvmem_cell_info_to_nvmem_cell_entry_nodup().
> 
> Fixes: 13bcd440f2ff ("nvmem: core: verify cell's raw_len")
> Cc: stable@vger.kernel.org
> Signed-off-by: Stefan Ghetu <stefan.ghetu@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

Please check your git-send email settings. It looks like this emails was sent in reply to version v1
which we don't want. 

A new patch version should be a new email thread.

