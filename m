Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2245606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 10:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rTv58IFh;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=ONLg3CZy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9sDkmYR2R0Uu2QYn8J7pV08RFFlnmvwwohoU4C6Y1CE=; b=rTv58IFhQKPf2Vd2G6qA7wnTMH
	BIRGitWiSzUkRM8WM9RUrhp1USSjlPLBrPBXEGDMAstcx3XUdMUpT9WaTfPdlXA8Gtg6GcrpnyMas
	tohSIeJbTJJ89+3x6R8r4Z/scTeZDH7S0jP+Rdo5af6QYbbDeLtV1xX+zJo7bPTTjhNeKBLXLv1XB
	7wavFhIWuNNbRZblYyPiEq7wRJ9v2+otHVryvnBMDn9Yu8NlkHXri6tHliXwK13yOuTo0CiWKhguV
	hpUb0D4KF9e/z/66P2zJBxDqK1UOHd4RSHlBT+usmVC9bD+tq9P6QEeL3qixA/XwnD534DuPbTFJS
	LmJTARcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW9yx-00000009QNX-0op7;
	Wed, 25 Nov 2026 10:12:07 +0000
Received: from mail-westeuropeazon11010030.outbound.protection.outlook.com ([52.101.69.30] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW9yu-00000009QMv-04lw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 10:12:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=co1jWqM+gwXlzVvvBBt7Ro3Ino5SXBcioBh2BG0In57+78dbQVs2YFU19DZyCTAGmU2v7LLavABNSvDzatHebhrkCu0XiucsGvolGVZBVa3ePt6fCjtYM9PYmmbbEXtaNfbxACfdwweYsZY15/qihvvvbge88ok9hCGp9zJdQ62CTnlTw3wImnYFqJi9kmScglIK+WZsbY+L/XOaM4u6q3XNTnXVrMnnhsL2jTAqD6PqSSxJ6JtmrPrijAglnpM7sw4GsFFOj/yvaqZftzFwPOXK7Bk7Y8NOlg+OqqlbK/qDhiVK2dEJn2SQmU25H67VVtYF2cIHkuiyCCdLv/fq9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9sDkmYR2R0Uu2QYn8J7pV08RFFlnmvwwohoU4C6Y1CE=;
 b=YaavMX5g9z88+i/2hqlEIQ+d1WPxI/BjFTCL6ai2mS7Kpnv+i+7e9DuxoFrkYnZhfzclbYdcl+9mKR8+KIZRmN89RTkBjgWTuWT8pRwnZbCtyAPOrQdWnGmKO6YOXr6eNZe51ecmr8YvHqO6HoRJVjB19Z0OVQcZTnyi4lBCCMDcMuRQJKgJyWX8NuiqU5KYJibqeQBFJ6SwJG7/lGUotQXVNg2egrQC7/V9j8zesM9vb3ZANfOVoTooquxcHCWIX01Qhy/ohTKLegEmmkzn/IEbsNUoziH+pNniQGG1LWpvfqUs7gw7LCMFRqDBxbcpXN5rebA0Ay2EWW+S9tzhig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9sDkmYR2R0Uu2QYn8J7pV08RFFlnmvwwohoU4C6Y1CE=;
 b=ONLg3CZyx8Fq0a5D+5uunrys+oOZISGlAoV7ZhedSgivokg8IsDIwEptvWXoZwuaV6ZGNwUw3hYJNmgbV3ur6bIpQ6Fer8pjVNk1yIpSuJbdKIQaLynREtm6rdY8LpY9iXafL1HiE6LMJRdasAYP7wsP3DKvBysaAaHM4zkbDRugHzUoVobDEHjpuyvSlEr40GNoqGTKDr580yIZszTYFu1AonLjto4ygqZkA8cfLB4Z4Wogk6SMXtkacWqIBekeBGW3Cc+CfWFVeDFkauiko+6kze3S5n24FZuu9PLORnzSccWGkxF4jlHrr1SYA3s2ALjxPQL8TCUD8l18mmekSw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com (2603:10a6:150:2c6::8)
 by AM9PR04MB8746.eurprd04.prod.outlook.com (2603:10a6:20b:43f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Wed, 25 Nov
 2026 10:11:59 +0000
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4]) by GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4%5]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 10:11:59 +0000
Message-ID: <a5af086a-2112-4a51-b478-999c505b6dfc@oss.nxp.com>
Date: Wed, 25 Nov 2026 12:15:42 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: vendor-prefixes: Add ADLINK
To: Dinesh kumar v <dineshkumarv85@gmail.com>, Frank.Li@nxp.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 s.hauer@pengutronix.de
Cc: imx@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
 festevam@gmail.com
References: <20261125082222.136238-1-dineshkumarv85@gmail.com>
 <20261125082222.136238-2-dineshkumarv85@gmail.com>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20261125082222.136238-2-dineshkumarv85@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P189CA0016.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5db::8) To GVXPR04MB12316.eurprd04.prod.outlook.com
 (2603:10a6:150:2c6::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12316:EE_|AM9PR04MB8746:EE_
X-MS-Office365-Filtering-Correlation-Id: d0bc8ae8-3ad4-4b77-ad2d-08df4adc8ab8
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|23010399003|1800799024|19092799006|10067099003|56012099006|11063799006|261022105027099003|261022113327099003|261026121527099003|261028144727099003|261026140227099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003|4143699003;
X-Microsoft-Antispam-Message-Info: JzCdyqopkzDopaCy87IDaYQRjDtAdhhGB+NONwKmLyfFerQlckiv8rM3bfh/mgopI42Y3gJhiIlszOXqx7vB7xiqd/rxGrTY7tQCSaiwgNlYdaDxE4SbeK/JdDQQzTwEIlPlxZY6YOKtY/KOfEVEhHMpwXEsq6JWfyYdpoBds7m274/vM7mfysGHiwpEGKj4LGxsj7ef7AWiHfjS3MTCgj0ps0ykQtTCZzZNYgVaQ2oRHvY1ROBfeA+/uBmAn+1qRD4xKABs664nq7JTVYau2LYQUFfzJ00NusBiOo65A6mEsfJ9LTz7v2909A64mv+tz8Lx0iJSrdJd45lBUXRZXCUPq/xsRVv39FhE1cbpOrzr22l+OpZGUhpsTdLn0fkV+3DJagY/uUxMmhPfB/RvjDrzlSU6qHZEb/dTZnSOMyU3LL0J8rOL6otE8lEh2ONFTeU51I/Hi8+8ZL69TUQXi6ulMOnOXUmH59P+SplZi/z/uP0ZIt78V29TRJPM3TXqKzqxPeknU4Dzpo2lKBo9jTCp+bRlr3LNCZ2+HIKZFLyx64SKGbG2XXNfGnlhhgAZP4mRhwQS/ofEe17g6g3KfrfODpfJzXHcfaMi/CPfHTx00lVQrqlok+5izCgECHwLwQKRsgXoZJXO9UPquwWVhW37B/DGIQMvS2SaV+zpXXo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12316.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(23010399003)(1800799024)(19092799006)(10067099003)(56012099006)(11063799006)(261022105027099003)(261022113327099003)(261026121527099003)(261028144727099003)(261026140227099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V2dvZWp2STRWN1hYWGpVUDJ0RmNRanpEb1RaZ2pZbi9iWDRwa2FFbjYrdFRU?=
 =?utf-8?B?bmwwdGg5VzkyU0xyUG1DL0FTNWl3eDJNK05WRGZtdXJaUEMxajBYdHNkZFJs?=
 =?utf-8?B?VEUxR3dvYlJGTTRSZmk4Y0JpWU95RDVMUmNQVFdMY081WWRvVFF0TERzUDJV?=
 =?utf-8?B?a25uMjJTNFZZQkthM0Fhdy9Ca05KMnE3aEJzV0ZnQ1pxSE5BMEJIRUYxQlQ5?=
 =?utf-8?B?MVNFMnliem9LQmtEVmFXaGRQSGRaTkdoNGtGdmRaWDNieXRqRVIvV0t1aDEz?=
 =?utf-8?B?M2pSeHdYcWE1bWZQZlYvM3hxQUJNejlDMURWU2g1VE1lV1c3dWdDNCtVZHRx?=
 =?utf-8?B?ek1FOEJYNUNyUDEycFFtM3hISDdiY1pSQTZrZC9uaXhRekJxUS9PQ1FFNUlo?=
 =?utf-8?B?Z2dZS21PVGlwSFlpRGhicVg5OGlBUVZLbWZzaTYxMEZFeTNDcHdLQy9ZejVJ?=
 =?utf-8?B?NVhRdFlkVzhrZ0lwSVY1SHpKS05nVWtoamJIQ3JvYVlsWUlzYXhpeENEbmYy?=
 =?utf-8?B?d0NkUi9qU0ozS0pVU3UzQ3cwVUd6ZDFaNlpmVi9vSitGU3NVelM2b0l0eWsy?=
 =?utf-8?B?bmNDaXJYV1BTYUVtUEd3VGUzMGJLUFdCVGNTR29PMWw5b3RrZlJNN2k4QVBZ?=
 =?utf-8?B?TlBCVnVyZzY0M0ZYWHJ4ZXVwTWVIQ1AwQmhWY1o0ZE9lTnRTTzFVNFpHSldW?=
 =?utf-8?B?TmFwcGRtZDdUNWJmVlpCNHVBYjJ3OGNkeUxEZkhNYlNJRkV1Smg0SDI2Smx3?=
 =?utf-8?B?TkpIdGI0RmUxbFpoOU0zSmQ4dGpYUG1vTFI4WUhaMG5UbXptajlHK0tXOUVz?=
 =?utf-8?B?eXh2MFVtUDkzNHRRVEtTR1pvaFdtWXBNMWtoWEFpUkV1bHh1N1pHT25zQUJ0?=
 =?utf-8?B?dWhtZ2UwU0drbVVWV3RtbkwraTQ4ZXBxeXhqaE4yN2J0NWdkVXUwSXkrS3VR?=
 =?utf-8?B?azlMRFl6L0k1ZUJVVVd3dWRCN3Q2MEIrM0QzZzgzKys0bDhRc3ZxZlNtTndv?=
 =?utf-8?B?a2gxT0pZRGd2TGFsa1NheHZjVERqa0wreDhFd2VIK08zVXp6T2RHQWJYUkZr?=
 =?utf-8?B?Z0RGNldzdWxkTmVLUW8ycVlxa1ZIZVd2QW51QWtyNEhlTFNSOGsrN0ZzNENT?=
 =?utf-8?B?WXNpTkVLNHdYRU1Ed3h6SWtDYnlncnc1OWdpY3g4S01WUGxscmlGcUZudFJp?=
 =?utf-8?B?REx3ZnEwVm4yT0Nwd2cxdTlSejRIc2tFek5BYmQ1UGVjaEd1cUNCUFB4aStp?=
 =?utf-8?B?cU5FZnNidGk3RlF4VzJzVVRrdCtyQWg2bXFmcmNxaE9KUDhhOG5YQ3FYY1VI?=
 =?utf-8?B?aSthekZRMGtBYTQzVVFSdTd5RDQzZjhZd2NJVWRVZmxnVXRjZmlmWnJjamds?=
 =?utf-8?B?N3FzQytDcGhTdnpIM1pYdjJYblVDVDFGQ3BHaEdaMU1TdnZLMTY3N3FFZUpW?=
 =?utf-8?B?dE9OelZEZmF5MHdSVTh5cWZHZmJQUVdMMjVRN0dLSDFGemZkSllsc0lGZDQv?=
 =?utf-8?B?bmV6MVgvWE8zNG1SNHl3YStGK3hXZ3lnaUxsbXAxWlU2UGtrT1doZ2VXd2R0?=
 =?utf-8?B?alRZYjJPVlluYm1WcXdXVWhWc2hWM0pFOUN5VnJlOUI3dWgrOFlIUFRoWjQz?=
 =?utf-8?B?ajJRV1NhVHIvcW5zQm4wLzY3L0hFRWFYNndHSEdCazZaR2MzRC9ZQ0tsaWFU?=
 =?utf-8?B?UVhEalNTQmViRUk1UkdoNU1ZbjZyZkNod3IxN3BFUDkxWE9lZ2VtTjlPRmk1?=
 =?utf-8?B?UjhPci90YkpaVjQyc203UDZPSmhVZHFUcFl5N01LU0ZhWjNwV3g5YTRIQ2Qy?=
 =?utf-8?B?a2lSMEtwbWF4UDArZFliK2ZPamhqblNCUEJhbUlMeHpUbi9maXhFM0RuUWNw?=
 =?utf-8?B?NGJITmlPMzhnQUtaUm95dmZPV3l0cnUyYmZCN2JoeFFodkR1T2VQTHRxL2gv?=
 =?utf-8?B?NkNIKzRLTVZXOE9lMXA4aUZ5TG01elZWZWU3K3hYTUx0Q1d1aWJFVlF0aURz?=
 =?utf-8?B?OHNiRDdMQXZLa2NDTmkvOG5xbzg0TkJuaGxtSHRrTmVteFpGWjhkZVdUb3k5?=
 =?utf-8?B?WmVPQmJwUjFtRmUyU0xyWGdxYUtoZFNvemx6NVpqTitscmZRa3JmOGI2ZnZP?=
 =?utf-8?B?Vy9STGREaEJIb0pMd2FiYVhZV1IwK1pzMDA2ZnYybVFGdGdmMXFnTlFFR01t?=
 =?utf-8?B?MUNaNGt6Rys1OVNjSlIyMGJnZ0lVSzF3ZW04alA2NFV5UmtnUk4walhKZXFI?=
 =?utf-8?B?bGw2WlNrSHphUW9BVS91dURGckZqZGxaU1NVYzgwaVVWbHlHZCtLL0FJU09p?=
 =?utf-8?B?WUlUT1UxNGJXWXNKTnF5UTR3cXR2OGZkRTlZRFUyckdqa25aQWd3Zz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0bc8ae8-3ad4-4b77-ad2d-08df4adc8ab8
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12316.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 10:11:59.1855
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3LO6l7ZR+q3q9qJm6I2fzkmWz5OyIyRDuUGAsZT/SHdqVXaUg3sDNXYVsNFC7bOzYoyas+QP0PPCZAwG/BtSvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8746
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_021204_063990_88B08BA9 
X-CRM114-Status: GOOD (  11.38  )
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
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/25/26 10:22, Dinesh kumar v wrote:
> Add the ADLINK Technology vendor prefix for device tree compatible strings.
> 
> Signed-off-by: Dinesh kumar v <dineshkumarv85@gmail.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index e467da45cd7a..6bbfa5619ee4 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -70,6 +70,8 @@ patternProperties:
>      description: ADI Engineering, Inc.
>    "^admatec,.*":
>      description: admatec GmbH
> +  "^adlink,.*":
> +    description: ADLINK Technology Inc.

This doesn't look to be alphabetically sorted. adlink comes before admatec.

>    "^advantech,.*":
>      description: Advantech Corporation
>    "^aeroflexgaisler,.*":


