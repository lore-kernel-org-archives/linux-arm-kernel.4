Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71678606A320
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 02:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2N6dxGCe;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=gItERcug
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:
	Content-Type:In-Reply-To:Subject:Cc:To:From:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Unsubscribe-Post:List-Owner;
	bh=S8Ua1ny9b0/+8kXkDUTlmQjSwULblBbZJ91rSikPLEc=; b=2N6dxGCeNtSiJ0552H0dhTqdov
	bIG+u5tq5h+EO2zYFE+rlkSHt35Cu9iacjCDwGWPQKT394iJMoCDCRu3xk2mQ+w+gG8AeqOlwq558
	ajvWB/29JGli48K+YxI4h5nGIFC0AP4dMK2s9HkfmxbZL3kLfvzpdrYWGxzAbOW1/nbKwI+Wa4uw9
	iisCMJ0YGgJAxjkr50zW9cxeU04y+oygdEZqNDcmyHCG7gJ5EMonrwPCxzGrIZqle82shtSpn8B6X
	ARmN3Tvshxb2Bbrsn6A1CPBDcI3nDTRr2GJFvNNn34W3AnJiW/RS0Bm3wy/mDYTnCE00P8Ci/4KnX
	qCbWR9gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQEiL-0000000H5oy-1Ba6;
	Mon, 09 Nov 2026 02:02:29 +0000
Received: from mail-japaneastazlp170110002.outbound.protection.outlook.com ([2a01:111:f403:c405::2] helo=TYVP286CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQEiH-0000000H5oJ-30uk;
	Mon, 09 Nov 2026 02:02:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SJ6O6qXqlZAzXyiBbHmxXisDRSscNTvQAfAwg6BWNvozUIR+DCjkam1Tr3Mfkah13DRSj0JtChLLyyezaecTowtpD/2BBHsoE3qEQ16ps4Ki58fxnW4/Q7EPfmgcxWtqw5ZHa2x5XwuWTV6Qqwir0UadK38fXyxWMZsUszyDQQimjFYk/7kUU6GxZfJmNF6asr69Rd/i5KETYgX9jxt51W/njNCUAIYRAmlmcdsbGxwg1L978Bbpaq6/utsfpChx25nt8aJxN6ip7l6sIx7Jw9bNvXVrWMW5HW9I9jHs5sCNU7QUah90mLd4A2Naqu74UvSVoegus3VexxWVa93new==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S8Ua1ny9b0/+8kXkDUTlmQjSwULblBbZJ91rSikPLEc=;
 b=sO4plmFME74BJMnRSOd7JJXwJZt9xdmWdTDpdFLhU0bYb9pdXKaj0DJoLuIQ/MTQneOEzsdqv0fff2QiB3PUBPJEIYVcejsaHPUr9WCRV/+u30wML8xl5ZJhkKN3ml//f/rjcYg4INkUTZN7nkZQVSBrvzUzt7gBAxRshD8oZmO5vSxTTYrGqEEEd66m9aU+0A+JlKmCnaPoCEOgtQ0bi67i0nDO2AAmrqoWzMaAUWWwpBGWmlMhZbuYkls2K7q4Bnzla1BoJXjRrZgFAiXzHiXMPAhjw5XR0SASqabvgm+z2kFL1fD6AqeS+zsvkxNrU5DvE5ikvxn+k07K57M86w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S8Ua1ny9b0/+8kXkDUTlmQjSwULblBbZJ91rSikPLEc=;
 b=gItERcugRHE1hxf1H/3vpvci9XAXGNZUpP/Cfwu17OqZSumPE981XRi1fQsza+J08CaI/7upZ+krT6s1J/uFRnf9fVYGwdlQtNHy2UB+LYQ7eSRoZ9AUTfkgxxjgODs28m68rcPgBsSBRmy4uVLLGjehlqWwNkrZG6rxLSLpeTo=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com (2603:1096:405:27d::8)
 by TY4PR01MB13993.jpnprd01.prod.outlook.com (2603:1096:405:204::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Mon, 9 Nov
 2026 02:02:12 +0000
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d]) by TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d%6]) with mapi id 15.21.0592.010; Mon, 9 Nov 2026
 02:02:12 +0000
Message-ID: <87wlqmpxss.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: <shao.mingyin@zte.com.cn>
Cc: <broonie@kernel.org>,
	<linux-sound@vger.kernel.org>,
	<lgirdwood@gmail.com>,
	<heiko@sntech.de>,
	<linux-rockchip@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<wens@kernel.org>,
	<jernej.skrabec@gmail.com>,
	<samuel@sholland.org>,
	<linux-sunxi@lists.linux.dev>,
	<linux-renesas-soc@vger.kernel.org>,
	<srini@kernel.org>,
	<linux-arm-msm@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/5] ASoC: rsnd: fix NULL dereference when remote port has no endpoint
In-Reply-To: <20261107160821263n_tb5YdtJX-icNTWJbOW9@zte.com.cn>
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 9 Nov 2026 02:02:11 +0000
X-ClientProxiedBy: OS7PR01CA0309.jpnprd01.prod.outlook.com
 (2603:1096:604:26f::17) To TYYPR01MB15175.jpnprd01.prod.outlook.com
 (2603:1096:405:27d::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB15175:EE_|TY4PR01MB13993:EE_
X-MS-Office365-Filtering-Correlation-Id: f1584023-82b6-437b-7fe4-08df3e0577ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|7416014|52116014|366016|18002099003|22082099003|6133799003|10067099003|11063799006|261102123227099003|261022075727099003|56012099006|261021121427099003|261026121527099003|261009223027099003|38350700014;
X-Microsoft-Antispam-Message-Info: eBcdnyLwzA9cuQlpyybUuwB1YDIfoIdtizf2aEqLv2QHAi4QCfHBS2zBdfLyil95yLB+H3lB4cOFA6ydyFgJvaGCtucE5Z2pSHv4heE9cvj63ZSytRjN/6NI9VseeT5MhzHiPSLjoOlKksaiBlwLWCjmdO2qfBKsHID36L4YvvZ72OMf/AsaXfEwKS6x/B2ge4OdhisrlG61eXtCbxU7r1bELHrooiLHeCxhaxXS+VoF4ADxMDE9thtP9Uy8RNwAV2gwS/NR75Zat2szagN9WOCCPQa/J57sTVK3ZA2u3hb3dUR8sB8oEXPEaMoBXpQ0vuQFdxyeoJS8p0yQ7WdeDzGfCaQhEEtgwH7GmSC8mGUu8JaQn9EQNkBHJbLYTiH3t92I6uhzX7702Sheaijeir4jPQlw0kq0UpiV5h+nsyQ5zNJRsOcKUZyeumIckkRkzkrWnXxL4wNyqdnMWyIUo2xNrhi2WnJpSs+KK07zPi3M3WmIhdoON54hVLw5S+W9Eofk9I8HBCMrUp2rct9MqfnhIApogzw5ckeI7qMz92n8DTA0Ew0phiV+r9ZntLiKD2x+QDxdV9pcqncVpBjPPZW05Un2suGdCCFE80yFPe5g7EWQAEmC+CiZObf0GNE2UaLmmnhuHLMVdwqdqj0dRjC8U44+zHoXxGvLa46ndgRhqyYiY7b2HOyUoATrgQQv3OhuIHm6XudEtwuJA7R0/8eZcChx+QGLGvE2JpaswZQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB15175.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(7416014)(52116014)(366016)(18002099003)(22082099003)(6133799003)(10067099003)(11063799006)(261102123227099003)(261022075727099003)(56012099006)(261021121427099003)(261026121527099003)(261009223027099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9zxWd+j+ULKopfvpVfi3EHtRDx5rvJ7IX5xdkDdS28sjUBsEb0CY/gShqqWQ?=
 =?us-ascii?Q?j2LS82qOkUqI7Xwcb8cp26MxM3zCbaA06oxWt+ZhSSKe9XNdkBJmvrOMEfyr?=
 =?us-ascii?Q?I2ypWExwA/oApGZss2mHA8kHdvTrlpfaYBIm/Eww2q3aUp7PVcARBcDsHUXB?=
 =?us-ascii?Q?VpAYjcfvcPJa5lilbZJ19QmTCCkiatmmgQ77jGh4W52Bv4BMdv1LxsyCEpcW?=
 =?us-ascii?Q?j9JcKneC4oLCRwJpAnLakiiZCqIfkxPtqxCmgE783jvSjEL7/lS8DVY8LTv1?=
 =?us-ascii?Q?oYOr/xCpMn8799DDrjAaUq8MJgoHJwAjsJ16zKwl4gyi7gC7h03ZCtVrZpTU?=
 =?us-ascii?Q?2A1uO1DWvdK9YQA4l4K1L7jD2oNABlYbGwMqXJmIl1TSAD2cXz3ek2Z8JLZ2?=
 =?us-ascii?Q?O3bFOqxuDf0NjkoIjcemPK3Pk+r/mqjT1OAf+0pxw83JpTU3boxZJULc0OES?=
 =?us-ascii?Q?IGSlJUveQ5MNPzxoqB8x0o4hnz6QU0MdOxajWUEugdpMVZWeI0r9wkWRpi2b?=
 =?us-ascii?Q?506m3Yk9NGZ9bdDu2ThVH459nSCqfuXJuvJq0/VkVjk1Xzo4+voWlwG+Snk6?=
 =?us-ascii?Q?IdCqicNp1edW8QjwfkErlNTGKApWuS6+4QvHxar0UB7j0270Gt92hWByF+FL?=
 =?us-ascii?Q?KNJGwiI59NjPmD7XLxLfa3sVxavq3jZtLZHtOdgn/hfHPYK6n5H4nmirTLnL?=
 =?us-ascii?Q?XswoVLg1ze/YmwJknmSeC7TcC5FMc1ZdhfMSvl0hP4iHhlM73J5n9peMwrpg?=
 =?us-ascii?Q?CKCtj4nI95MOFhw8RTPYcJ7YN/eJzlS1A5U18tvsLHBlPLRiV/FTZrkxXWWn?=
 =?us-ascii?Q?Wqv3niqPZtzMF6K2fwAcRymtvhDSutPZSjDdDSTH4zqmweWkoO7ZssX+ely1?=
 =?us-ascii?Q?HqWGACdyu+UaxIcA6bP3eP7Qmg11K4XQiUMGqIh0gPu9ZYBM4/Nm9OzNPvHE?=
 =?us-ascii?Q?Ht8WsVOrFL72/m9D+nJXBrMLnURk+mBQ4H9KOGLjZW8ZPqOYSjs8FJSL7ovi?=
 =?us-ascii?Q?BByTawXINmd+/dXzOtuSHC2VmHgXZUpfZQ3uJ3gUsEUeLfere/IfMXXfaliI?=
 =?us-ascii?Q?kv1PudztQA31ftbOWhoPnWQco4ntvnjpteajM9MViCc78G5hBpPwtDeW05hV?=
 =?us-ascii?Q?0UFrabK8bb3hs8kajneTzuaf4lFrwuw6ziKs5+helNQ7GHSd+jrby6cTIcZA?=
 =?us-ascii?Q?ME4a8Ag2l+FOurGuzzZlgRhT2Z+NgqdMBqsoDbaN+K9PBRnzphH3oobCq4ZR?=
 =?us-ascii?Q?zZC+7ug188vsPPs3jzDpcM8bBJf0oxbqWAbeNWojyFQnxgp4uoydCtD92Zmw?=
 =?us-ascii?Q?o9DEvjdWJRMtbT2m+mlXZMz2r/bHF/IE+LKUgujGHfCQpkbAVRaUCUUveAqf?=
 =?us-ascii?Q?d0ajJSuxmAgTp90jBEmrt0yJ+i25HMCQnp3EAXzVaDr0GalDaKQMfhNXSeA7?=
 =?us-ascii?Q?THHSPWBiJXzmv2z+g/Kb+W6gxhtMFAg4ZIUjNCLfCQa8m8bN0H7F9NvlqMru?=
 =?us-ascii?Q?t1OlzyuIWVPIRApjLoBfAqqbBx1i0dqzvxhYNIVeb81q/ohCjcyvUpFLqWGZ?=
 =?us-ascii?Q?PYWaxD8z8VihP5DCcbNLq54+P2o/g077BVhVfFVazhaA5/53t7J2pZwJs7xd?=
 =?us-ascii?Q?9balA8wF8IDOpzPo6sR4KBDqeP0ngi8XZIkzWhRw4joAs+MLaM9fy3sRhzmy?=
 =?us-ascii?Q?LaxRBzV9+V1hEfxellS3IXomSpNuunSpsAXO4AvHgFv7OyacaYA8DH1MOofV?=
 =?us-ascii?Q?xWCGfy6BJHkNbflflE+Iq4AElA3t/jY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1584023-82b6-437b-7fe4-08df3e0577ee
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB15175.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 02:02:11.9633
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c/TwwXf/8FMUZ+APuow/uIux8D+E4BUnXA8g7NrgqdntWvvP6Sk055OA8tdqC1oOSJ+FmUJA7azFPb8Hl3c0+smInP1/Eg5CTHJF2Zd4Nys8WznDECs5oNJ9JfvNKRUq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13993
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_180225_768166_79A48C76 
X-CRM114-Status: UNSURE (   9.67  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


Hi Shao

Thank you for your patch

> rsnd_parse_connect_graph() uses the node returned by
> of_graph_get_remote_port_parent() without checking it for NULL.  An
> endpoint node with no remote-endpoint phandle yields NULL, and the
> following strstr() on remote_node->full_name dereferences it during
> probe.
> 
> Return early when the remote node is absent, so a graph link that does
> not lead anywhere is ignored instead of crashing the kernel.
> 
> Fixes: beed78aeeb10 ("ASoC: rsnd: move HDMI information from ssi.c to core.c")
> Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
> ---

Basically it shouldn't happen in of-graph case, but we shouldn't believe
sane DT.

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thank you for your help !!

Best regards
---
Kuninori Morimoto

