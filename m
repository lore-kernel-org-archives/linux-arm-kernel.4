Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB33E606A335
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 21:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BUVmKfi2;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=FiV4IR8w
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=NzRUoTXpWf7GN5EVdAQMXSJy5DQijPmJKeAO6m83U70=; b=BUVmKfi2f9pHNGgk/fef3yhJS8
	aN4yE2lB5AgDIVeUod/K5OuPh3snvMiUseqXJcd3N2WED6t9XVKUCh6rcvP2uoKqFT5h/usR0pqWo
	H4U+IWapC33pXBGUWN/KJFZufSBSkK3MgNnjYS3SfXfCqkJKCCCaVyc4kvXxd4Z+ZMpihBnrl2EDY
	oVYW/4PP58okyESI7uSnw6Iik/re6PzKaLPTaMifXxaZL8ZWA/l143V3RX1c/rGjPT41IE9JVEU9t
	uljd5t1ZCqMk6VDlDlQDXE3mmSaY+ThJN4c9NQ2iH8RSaC4VVlK84GwF8Xbh0bKKVu6Ue2LKnucHl
	iTx+Ppiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU9YI-0000000DSp5-0MnO;
	Thu, 19 Nov 2026 21:20:18 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU9YF-0000000DSof-3fCg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 21:20:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UAdK1PFqrmS/O/wtVp6WC4EcxWvajdmThEnoxsEUt05suqvwMF4o3E3UjGzemBBA8MQN7hPvRR7yNEs3LDYyemXndCv6lbWQcnHX661KTYV8wQ+Wybr8+xRV8FE70RF+DBwMIInP90k4BG9Dq6oL0RR7vtcnebzulao8d6BcrGMWVzDgdn+4hup/zzpgs9Qm6pu5pA3RwvpxxAcJiUVcLx4qOxNmfcl6ta1qHF6XEIqwv+9gndTSjvNFViEZsR5RiynfhhFXlBNVrl3FJOdI8YAKRwmZ2Ic3NHDkGHt/8vGmJ2AU23e7CfjLqU4pghxHqTAxDu3sWwROVxJb1ZL4uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NzRUoTXpWf7GN5EVdAQMXSJy5DQijPmJKeAO6m83U70=;
 b=dP/+fMAqua4PH3B5ohSL9IpYrWibWhfRC6MMDn3rBmPvvdSm3sCa9i5QYUCUEJbUNr7b4qUqLbrM1whmLZZs+1l9a09jWes4UBF3WNfXVmt+drF+UDFGFf2R+/ZaDFLHEVow8aJ1TGwAmKVXmUXZGgRHBGpca1PBdsA7NMVkVP1puQfq2cEhW6JT4eY8i6dOOM8GOqD4FEurtKtCx3K9rEzuRst5asVvsfB+QPaAgNAj+bHPq/VXbM/W2K8nEiXCYbFVLO5gIXTLdLHDWq15CyBctMzfru7c5rO2eKX2Zjn7z3axXXb0ED6D377Tr8wfGV5FcHU7CzayhGULAfnm8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NzRUoTXpWf7GN5EVdAQMXSJy5DQijPmJKeAO6m83U70=;
 b=FiV4IR8wyqkDaN20UhmzfjuZRHy50fO2WzcKHSNC+VK+svI27nkp2ksYLR5mgVl5NvVAnwYtBb3ZGZPs/GG5RgQbY8Bp0R0cEACQETdtHTcxjYzjg3BGbDlSUnUY0hk/TqyIwrUGvjer2SHx3nyc/9SIjg5Z47HgyhbS8F3LQPP0Iz7uCWKSmBjXY5BXeASwTCu+afTtzTYmF8R2giw2BpM/vGGZn2ei8l906zkW4OE4QNHSBl2o/WR/Xkg9tORCSLmDr9A5FHFPps+C6ZwIw+jgqrTZPbYYMV+NK8UWWjg+JZfPZOfFAD5xNCiqFiVakenL1PUhBzc9DeYtUCTzkQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AM9PR04MB8570.eurprd04.prod.outlook.com (2603:10a6:20b:435::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Thu, 19 Nov
 2026 21:20:10 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0639.010; Thu, 19 Nov 2026
 21:20:08 +0000
From: Frank.Li@oss.nxp.com
To: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Wentao Liang <vulab@iscas.ac.cn>
Cc: Frank Li <Frank.Li@nxp.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] soc: imx8m: unregister the soc and cpufreq devices if action setup fails
Date: Thu, 19 Nov 2026 16:20:00 -0500
Message-ID: <179512316469.1863647.17192797657203918857.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104021432.1468280-1-vulab@iscas.ac.cn>
References: <20261104021432.1468280-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8PR15CA0001.namprd15.prod.outlook.com
 (2603:10b6:510:2d2::13) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AM9PR04MB8570:EE_
X-MS-Office365-Filtering-Correlation-Id: f20a22a5-6669-4434-b3c9-08df4682e38d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|376014|366016|23010399003|1800799024|18002099003|22082099003|11063799006|56012099006|10067099003|261026140227099003|261028144727099003|261022105027099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: Hvh77GNnZGlfgchC02m2wJJqzCja8j1RMfi37erRKK4xlKUqKhFzEg0mlQ6rJF60nmTJBS1FrLcn8Qro6L5kIqtzJccen4IWYy6HsDv18ejINF2ubJGfvfdW5b0Ds6DNBsT6zP81/uOv2/FnSFYNh5DK3Gw+k5/xtxYikEY4jddnm7Nb495sIfD7ChCcOWIqnU9jM9jQBBDu4YD/jwLK9VNd4JdL/2u9AjiwlHjVbbBtuUoIxMRESpfXuHcPhnIraUkg8lycgWzATr3k5Qox9qG/ankCJideXvY0NmWCZqeH0SptWvKI8TOp5L9p5mQWPT5mqiyC6exW3SH207VvChbGAmi7olXlCHOOHJwi2ZgvCteRHE+JPMyzzGLNX41qzEmEvvYDMk5LH0CYHih7XjxL1MFUcvGC15KZHOcjcGzVZAcK1j7Kog3lafklzJ7C0bUkIwGympbUfPGW8DFmCnAQGOflvwN/AoQFxQXDoWlPJwjvbvZZbOXpjhmCwL+jklS6VvYBr/DvEZLMuU+yWnOhNket+lNot9dM+yn4ubUsa3FigHEANW3kbMj/EN2WsZ8F8pTaWTWdiW0xyvevjIUy1t6h6E9gF2GfcgLW+cavZEEzmG7QAGrgFiyWGCNev/zIFjRQkOakcpyElyufJWirM5ZhUN8NZdeWmrJ7Pzk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(366016)(23010399003)(1800799024)(18002099003)(22082099003)(11063799006)(56012099006)(10067099003)(261026140227099003)(261028144727099003)(261022105027099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?akppSUJBVDdDZzhUNGZURjJ0QUhybWwwaHVkeWF4TG9NSTVSaml2aWc0Z3k2?=
 =?utf-8?B?cGc1Z2lzeEk1RUNkRGh1RWJoWDNXRXZ0emhtSW1DUWJiWnUyODd0aUVSdjl1?=
 =?utf-8?B?NTVDc25VU3VHcGl4QVFxMzZOSS81WTVQMk9zTC9DRHI4YlhmelhYaFpxcDZN?=
 =?utf-8?B?WU1KZWplVS94VGZiYjh2QnI0U2lWbjlzR2xBTVIwQWRWcVBLclRpbkp6Q3Fv?=
 =?utf-8?B?R2JzNmQxUkxYYW1WZTJMV0pFREh3Q1FHZFVDcXM5SE5mcDh6RXlnRnpXQ2dM?=
 =?utf-8?B?Umw4cEhLNnJUOENzcHltUEN1dFYrcjZGSzZHaTd2S3BaNjhKTitzMmlHenpi?=
 =?utf-8?B?MitoUEVPQWQrTHNvSTJlTytUUXJqcndhVFdzM056MjZyQnMyam42VnFDMFZU?=
 =?utf-8?B?QzV1QS9uVFh0MGJkRU9MRlNlYTdjUzBUbWxZTG5SeUtVUG5Dc2FSamQ4K1Fv?=
 =?utf-8?B?ZExBOGR1U1lrVU1QRWdTNi9ZNUJ6eG9ZNzI2VWNZQjg3YWZ5YVNWRUlyNStQ?=
 =?utf-8?B?SmdIeExxdDUwNzJNZHZaQWJJOE9sZWkwVElnWTNPZ29WbE1Lc1NQays1Q045?=
 =?utf-8?B?ekZCeTAzMXF5cUtUelA2VkdFUFljcWpWZTFaR0tIdEZGTHNyNUpOTlo4bU56?=
 =?utf-8?B?WjBzZ2MrOHZnQXMxcTF6OWRyMlFQYTFHdWo4Wk5uamFwNENvUENDRW5PMTd2?=
 =?utf-8?B?c3dQeUpadFpzUitvdGhYZGd1NUdCbTBuSTdCUnk1TGd2MHdJSTdxVUt6NGtO?=
 =?utf-8?B?bStvbTRpdlFYNGh6NnB4cmNUTmlsKzMrNEJiVkpySmxyZ2NUT2RzWVd1bm93?=
 =?utf-8?B?S2JkR2RCdUtRakFOV0wxS3pBNlFZVmZmVmJZUTdmb0srRkxqandPMzdEaEx4?=
 =?utf-8?B?ZmtNY245NWN4eXhnQmlsc0F5c0pQclh5V04wOFF3YXFUK3ZXaWFyQWs0SXBR?=
 =?utf-8?B?NGRkQjhlQmNjRW4vTGwyVE1RSlRzYm9tQ2xOSVJ6ZWxuK0pHQkx2Z3IvQW5p?=
 =?utf-8?B?cVFPV3VwdmZNdGRta21peURJOERiM0p5MzYxMDZ6WlRyRnBXbGRWU082eSt6?=
 =?utf-8?B?dG9JSThBZm9vNlhGd2ZnS3Q2aUphU2RjNkpNSkxjbVlTL3l6dzhRV0RZT2NL?=
 =?utf-8?B?MmhsNkZsaCsvcHhwdFZZbE9vVkZlbHMwZlY1d1hNODFzb2trbzNjNDdhcXFZ?=
 =?utf-8?B?cGxjR05EbUxpR1pjQldhMkFNNW9sUXdBV2hYNXFMU2t0OGIwVUZmWno2Vno0?=
 =?utf-8?B?bExJRnpUanRBZDRDVUYwY2FjNitnWlRZbzE0UTUvU3gvOGpaemtYczhicTFZ?=
 =?utf-8?B?N1ptaUNleGdqZzhSZTAyQnFiK1hYaE1hZUVmUlU4L05zY3dvM1JPelZJWlJV?=
 =?utf-8?B?cWJlTFN1UWtUd0dZY1NwbGdLeEdFMGMvbnhGSVJ1MWlSVDhKR1lrWUt3NitF?=
 =?utf-8?B?ZzhMVzZpcmhmS2I4cGxkeXJRZkt3RVkwS1EvS2l4Q2JPMFpOekxxMnEyOFk5?=
 =?utf-8?B?dDNJazVPV3V1QjVZeFU4WXd0UG5rRVN1dmZ4UzZGY3BnZ3dheWJVbExQYjBx?=
 =?utf-8?B?cHVvWjZsMmsxMVZBR2wvTHFZNjN5MXNHc0Y1eG94RGFNYlB2OU44dVB0Rk5W?=
 =?utf-8?B?RkF1YXcxYjVsbVMxNmxKTStDRENkcTUwVGxWVHpnT1N6U2NZRm9LV0puZWlG?=
 =?utf-8?B?QUU4VWQ0cTl4YU9ORkRyNjFTcHdKQzh6dGdqTi8reHBSUC8xQlkzbzFwY1lX?=
 =?utf-8?B?VW8rS3JuZ3NTbEs4UXFmU1dlZytNTkx5eUlSZHQycFZwUFJtUXVqLzd2Ykh6?=
 =?utf-8?B?Mnp0M1d5NTNRTmduYXp6bjhZa250WGRWY0hNN0ZzaTA0M3MvMHBVYm1UVjZL?=
 =?utf-8?B?Z0gvdGlvdTBmVTA0YlA3ZkkxdVFNR0RJcnk5MkwyOXZVRHYxZkNlMWtMcG8x?=
 =?utf-8?B?OUo3Nzk1S2QzWmFVcmljMGNORldvbWZ2TlhKcGxFTjh2dk4yYktDQ3JpQVg5?=
 =?utf-8?B?Q3p6YnlXS0FybG10eWdjczdlOTlyQ0d4N2E2ck96ZDlPbjlkYUk5OFlROGhN?=
 =?utf-8?B?TENYcmpONXlYV0VnaXlMeXMzUXpvTUlkNW1HMGo1SExIaE9WU09Wc2pWS2Y0?=
 =?utf-8?B?TU0yVDRFZlM1YWs0YU5zbW9sN0ZEMGxFZEs2SlNPWEhvNDR3MnpxejNDaHZm?=
 =?utf-8?B?b3lhMHhOeE85OWpob3c2VGhGRWsvbUtKTlZEWHpmb2IwTitLZkYzU1g0UXEx?=
 =?utf-8?B?MmFKdjRuN0dMaCtrcnhSVjYvZExBUklmd3ZGRFRNbjZRV0RsKzIzUmdxWkk5?=
 =?utf-8?B?eFFyVWJBdVFTb3VzZUxtaUx6bERkdWdKUTc5Y1lVbGFLRmlCLzJMY0RCaW1N?=
 =?utf-8?Q?9WvmKoCWVcsFxTeRlBUXu4jaGez+gFtGaei/T?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f20a22a5-6669-4434-b3c9-08df4682e38d
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 21:20:08.8306
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8DNrdgflaeV5jJXnCZDLGJvO4bU7hmworeMT/WCG9FmwWym0+4blJsiL6cteZVe7bBVcgziEEwGPG7PpqYplK10tbIklu3wvQfs5H0ZLiAVYEVaVTalc92RC1SRx4Ic5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8570
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_132015_940081_5F140E7C 
X-CRM114-Status: GOOD (  10.26  )
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


On Wed, 04 Nov 2026 02:14:32 +0000, Wentao Liang wrote:
> imx8m_soc_probe() registers the soc device and the imx-cpufreq-dt
> platform device and then installs a devm action to unregister each of
> them.  With plain devm_add_action() a failure to install the action
> returns the error without unregistering the device that was just
> registered, so the device is leaked and its sysfs name stays occupied.
>
> Use devm_add_action_or_reset(), which runs the unregister callback when
> the action cannot be added.
>
> [...]

Applied, thanks!

[1/1] soc: imx8m: unregister the soc and cpufreq devices if action setup fails
      commit: 398d92968e2c35be7788df3885ab6bd885b0b6ab

Drop unexisting tag Assisted-by

Best regards,
--
Frank Li <Frank.Li@nxp.com>

