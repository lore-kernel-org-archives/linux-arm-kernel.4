Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3B6606A338
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 14:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=h5Llt5Jk;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=akpc5e6C;
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=JTTmA5tF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=fzMkXnNXz3b/txQAW8x4j2EX7BmRRkVwdG+2Y0sH7q0=; b=h5Llt5JkkFQfd1RKLAVz7ZGHXr
	Wac2i309F6c8drpyWI+U+JCE6J7P2z2ZI1Kyhfp1hzsAZ+ggIY5YVE164sixuG2D1wm9T7xwzd90z
	ZuDMVv8aq574CyHuPL/EfsxlHmlq0Jsjek8Oku2pAL9WleCgyDghgpszsUFYOZ8Ug/ikVIX0pO27O
	SOrLEsQVeJV9ed0BVUilaNCz3TQ5wo6sW3l2M+WXtEAtMS+K8wQU/ghNFNSvoSnxffAPp/emepbry
	gxVHKcfNsHb1qNvPDhaFhOeefMW6AwKaP1lIbI8nglBV2v3atWrNqpIUyWm01C2dnjo+GZWCgdZGU
	WJGPEflg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUmOE-0000000HMKq-2CvC;
	Sat, 21 Nov 2026 14:48:30 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUmO3-0000000HMJZ-0M0y
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 14:48:21 +0000
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ALCZ6KQ2182652;
	Sat, 21 Nov 2026 08:46:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=fzMkXnNXz3b/txQAW8x4j2EX7BmRRkVwdG+2Y0sH7
	q0=; b=akpc5e6CuPceRk0g9qJXYR4pRyrGFSV4P8I0eb8pF48X3V18jh6CKpVv8
	6nWaU+7AETHfuFQmyPm71OIXOAW4FyvNEQd2AZ/JXyzlwMSliNJmXqBoTFyftd/K
	YxdfugB3uomNiaXWg0E0LaD1dRUqSAJTKmm5ReyrMG+WSoljMYZLZ/OayBVARbot
	vxtIZ/vQ3p+PlcF9+U/2smyPOIO9h044ro86r17gyt7HPWJ/Cd2Ow0r9z7Wzq00v
	OJbY53nXMRCcUtGcAkv8Zehm7Ms/bcsmCrOgD28+Jtj+X+Pp3YZJL20FRLGSpQdD
	yUFIEgBLQSUeYkOSQSqqttFEqQxdA==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010035.outbound.protection.outlook.com [52.101.85.35])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4j3bed0d8t-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 21 Nov 2026 08:46:51 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RBm9Y+238D/kjHSKrOoysyCL0EEWXFA+lFjr00RToojJem7l7Mih8rGWM2Nj06UeB5SMKqLozKyXi9euqHkjg+B056SonI37gqV7vnPQrWdqcr9/uwdNtgWzjYfHnEUSi99hjXlg9ThF8PqG9rgAcPcFg+2DZtrE+nwPykUZLgd4dAQ+wBLAMim2bihS5vtS0HyNCnsOiyHap7oXdBmTQwoix4MXZ24T37yx6L/BVohX4fQpdP7MSyN/voBpQeQKnr+Pn8uxP3k39whJrXc2xJSl+2QOiM69FKxefOQSYCfrPZkDeckdp7aGeSpB8UDQK1Vr5246oB7YQ0xaGklC5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fzMkXnNXz3b/txQAW8x4j2EX7BmRRkVwdG+2Y0sH7q0=;
 b=en4BXn/cbbblBozkKkU/LwZZvQ8gPd3sB39WWwfY1tfFd2t69n92OoYPKVTVqvRVCWzqzj94AZ8kbO1No+qshwlmBINu6iINu3cegCRWaNJe45RafyVdIS+ogf86nOejYWY9rCLMZ8dPHG92vJ9AFqmcLyBRqolH82XgDmSNqT3fZtO201KVJMxKSb5o3fQEsiTPiX0ElCfUYpAtnFPb0crlXjNC7tQWp2tk04vIhV3Dw4VNhFw3KoCmlkZ4apKnczSp0eujfpKOeUv23u3ROXlRE3FnPmqv/qDZM9RP47kfFYfz8G4rJ3qeuY0GCxNSQCxN6EgZWFLzrwWvy2AvuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=suse.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fzMkXnNXz3b/txQAW8x4j2EX7BmRRkVwdG+2Y0sH7q0=;
 b=JTTmA5tFoieXwAwAzULy3TeM/c4KFB7hTmkE1VpI6tFKnNBlhY3iTjaEEGonEhGZZiI7kbg0BRhs1wCg45NqV6H+BoK4CGulHnTjki6y0EYuB3QOqXY/Zz9C/ZU7I5htbmaOELxwkd+aIiC7oswd7h+eW4KhGFnWmBZxr4Gt5OQ=
Received: from PH7P223CA0024.NAMP223.PROD.OUTLOOK.COM (2603:10b6:510:338::26)
 by PH0PR10MB5732.namprd10.prod.outlook.com (2603:10b6:510:14e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Sat, 21 Nov
 2026 14:46:41 +0000
Received: from MWH0EPF000A672F.namprd04.prod.outlook.com
 (2603:10b6:510:338:cafe::83) by PH7P223CA0024.outlook.office365.com
 (2603:10b6:510:338::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.13 via Frontend Transport; Sat,
 21 Nov 2026 14:46:41 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 MWH0EPF000A672F.mail.protection.outlook.com (10.167.249.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Sat, 21 Nov 2026 14:46:41 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sat, 21 Nov
 2026 08:46:27 -0600
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sat, 21 Nov
 2026 08:46:26 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Sat, 21 Nov 2026 08:46:26 -0600
Received: from fllv0122.itg.ti.com (fllv0122.itg.ti.com [10.247.120.72])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6ALEkQuE016190;
	Sat, 21 Nov 2026 08:46:26 -0600
Received: from localhost (meghana.dhcp.ti.com [172.24.231.93] (may be forged))
	by fllv0122.itg.ti.com (8.14.7/8.14.7) with ESMTP id 6ALEkPxL013097;
	Sat, 21 Nov 2026 08:46:26 -0600
From: Meghana Malladi <m-malladi@ti.com>
To: <marco.crivellari@suse.com>, <haokexin@gmail.com>,
        <kees+treewide@kernel.org>, <laixiangwu@cmss.chinamobile.com>,
        <m-malladi@ti.com>, <arnd@arndb.de>, <horms@kernel.org>,
        <basharath@couthit.com>, <parvathi@couthit.com>,
        <vladimir.oltean@nxp.com>, <rogerq@kernel.org>, <danishanwar@ti.com>,
        <pabeni@redhat.com>, <kuba@kernel.org>, <edumazet@kernel.org>,
        <davem@davemloft.net>, <andrew+netdev@lunn.ch>
CC: <linux-arm-kernel@lists.infradead.org>, <netdev@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <srk@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>
Subject: [PATCH net-next v9 1/2] net: ti: icssg-prueth: Add Frame Preemption MAC Merge support
Date: Sat, 21 Nov 2026 20:16:16 +0530
Message-ID: <20261121144618.180542-2-m-malladi@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261121144618.180542-1-m-malladi@ti.com>
References: <20261121144618.180542-1-m-malladi@ti.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A672F:EE_|PH0PR10MB5732:EE_
X-MS-Office365-Filtering-Correlation-Id: ee7e41d3-4f75-4d91-4f60-08df47de4162
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|7416014|376014|23010399003|1800799024|6133799003|18002099003|22082099003|3023799007|13003099007|921020|261021130227099003|56012099006|261026140227099003|261022115727099003|261022105027099003|261022075727099003|261026121527099003|261026135527099003|261021135927099003|261028144727099003|261021133027099003|261021123027099003|261009223027099003|261022113327099003|261102123227099003|261021121427099003|261102130727099003|10067099003|261026130827099003;
X-Microsoft-Antispam-Message-Info: GtHao3JbG0Ofx3aBfGCx/zjdLJEi51SU40Dgk8hBPao3wcUCd7yMG3ZJ8BvivYgZ0BoIiYChR2HYc617ZHfkCzeWxi1UkBSTN8WOsDOsJI3HIHKrbCkeGLptjzCRfVdbUn0O3jXtyYx7JVBxb8h43KyWzREUnCplqUJUQXOJ/W2XhOmlnFJTicxoyTJZiJhvpOiBwAC6HeC+630RfloVL49QhkCZ8fL8hcQL/9QlSCvJ/QeY9zIwpaae1Hxm8VHBRfRDuzL60+FW5GJ2JyVe2u3brZa5avqkRdhZhHU1Y9uhs2LpkzkGsuglFO4bFwq7PSMPCQB5ZwV67DLy5yteMD0gJ+qIyYzI+DIwXwkeJ9z1PmmJbKNBkUkPOHgaCoGniPplfA8xmJnWgUj4upD1LGDsKeY0CVWIeOADPAZzrNkJwQ39epy4Pos2g02Xj+BlI5T90+ypIPrzucOTZruWVFGXwHFPqI8anYMkiMdD1NPkSmcyu5+4r+7YpV9xp/f7qqKJRfSKaA/fe80pelqK34xv7saOvc2QhHDCgEqSrxWHXMp6lL51ue+rIKKreqbd5OhYlKyP4IGWfqKDqd5nXTyg/GQbSQSjHEcUyp+BLDhqnnOiUUxXLwHAP+U0cHUt97BitaCJyNeaF08DNXrm5jnTf+uCsaeflby9MRI2qgVUgtcg494L+n2S5I20bMeu
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(7416014)(376014)(23010399003)(1800799024)(6133799003)(18002099003)(22082099003)(3023799007)(13003099007)(921020)(261021130227099003)(56012099006)(261026140227099003)(261022115727099003)(261022105027099003)(261022075727099003)(261026121527099003)(261026135527099003)(261021135927099003)(261028144727099003)(261021133027099003)(261021123027099003)(261009223027099003)(261022113327099003)(261102123227099003)(261021121427099003)(261102130727099003)(10067099003)(261026130827099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: jlCpNZg17pwFg3dvM0vnIEPxfBalTUIjFmcW38TMXF6/u0bzRtJyrhtRJL0kV6B8lk2tVEEhNPiC255LbJ+695N4j/EejNpugIB9VS+RL4Ky8gCHCbj8y7AeJzxDwo0hDIBlT+ybki7HgQNNh6JCia4z+lvDK0CIf/aHwdmatwblDq7o5RrUoNmbA0LFUHcgggkJ6SpVPYuGr5I3KeC1fsxlPSPEi6iLq0vIwK9GZS8D97IJ0E/f/6H78d8EtadQ+JGs2QgwdWgTQppVkeW22OCH+ntZhaa8OcC3ZJg7t2ft0j1CbMiZDVOqrxfOKAy85pyPrjmesSqE8Xqx+GkKxwlxXcjGUm18hzKuJ9Bwlq6VvA6Gn2/QcKGJU5HZH12I7BvOAUXtcV7EVjoKXodzojPd9jo8b5m32j6LAKQV/ZS+4SYOTMwKiSCWYcSPmaC7
X-Exchange-RoutingPolicyChecked: hLqV3paeGuZZ/dxRR01oFsJFZQD/hT6ZjfCFy5jiAS+3o6B7fFLWn3Z3wjHSIeoXnpbRciRMuKSupMFTEb2TL6sUUivmWG9SxBJ2d5b2hwskELw0A1F04wDwWKKE0iJSnb6/NVTXxvgj3M4NduKsB3moKpxZ9as+u0dcIGgSb0ikJh0gkyGAg/iRB3cOfdSHAOsUkFESmIFf9EsuYn/4JaGy2FW4Fdx40miEGkvOwhcocn4shBQJAS9wcrxKIEvzAA+0BCRJ07zAhdP6CzEJQJdEPNuulpBN80UVHMqJRv+Yh52kjt+iQ1mSsr7oLzD8V95I55QVsJOqh4TqZrfJ8Q==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2026 14:46:41.3850
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee7e41d3-4f75-4d91-4f60-08df47de4162
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000A672F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5732
X-Authority-Analysis: v=2.4 cv=b/sncdGx c=1 sm=1 tr=0 ts=6b01aedb cx=c_pps
 a=pHgAWWeLuDyFdJvI4ceQVA==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=_AOl8etSQlcH88ZuGUgA:9
X-Proofpoint-GUID: pTqpKhFjsdQzxwMjmuIcdV6n6MSj68Lj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIxMDA1OCBTYWx0ZWRfX4kkLE6Yot13J
 zSsm4ox0gOpB65Lkt9xMFpemz0uoHhqDl+AWWc5586vzlRjTpjUK2qSkQwM4/Z9lvUTaWu/U1TU
 5sSSYkCpFsVJCr0AiED+dOVZl6DoJRz8GEx7m/ZouuRp8JH6oxENi7knc4KczR9NjeVGJlnE8S/
 oRJbivxjwvbPlxif7VgVRI7tket31ml9nXbu8eCwIotHXxAl6khojyry5idLEHmUcHa8hnUxJf2
 2/7xphF3WnUKlsrqAfR9WjFUqaeNU38orVpVsGlPfszUCd52d8GsU2Qe4cmioKZDrP3rp0UWiA/
 xAuck5YWEDjrRkF0KaIAKFJelo4v61S+09flootYNM5rqiehmcDBcdykU9rFr+I8nHf2Z1FELnK
 SsRVe56+BmQg29PsY6gPyff4h+UnDb9TLMbwG6opg+XAGWLXJc9vtTx/jKTS6NFrzoA0koS8o8s
 +J66EPnsisGCtRs/i7A==
X-Proofpoint-ORIG-GUID: pTqpKhFjsdQzxwMjmuIcdV6n6MSj68Lj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIxMDA1OCBTYWx0ZWRfX791nAdayH5nS
 2FmHJw9WyPZWS4H3EY8WDx2ZM9dJzXL0wnu5k/e/eyE2xeYur0TnAkBbqd655NN8MkbArL31+/n
 lfzrWt1+FX/1DqmKhzomzqQAp+zAq1U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-21_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611210058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_064819_262663_F3415337 
X-CRM114-Status: GOOD (  15.32  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: MD Danish Anwar <danishanwar@ti.com>

Introduce QoS infrastructure for Frame Preemption (FPE) support in
the ICSSG Ethernet driver.

prueth_qos_iet tracks FPE enable/active state and verify state
machine status via firmware-reported enum icssg_ietfpe_verify_states.
icssg_config_ietfpe() configures IET FPE in firmware, triggers
verify state machine based on ethtool MAC Merge parameters.
Polls firmware verify status up to 3 times with verify_time_ms
intervals and driver handles timeout by logging error and returning.
In case of any failure during configuration for enable/disable,
IET FPE falls back to disabled state.

For MQPRIO qdisc support all queues are express by default later
gets override by user-provided preemptible_tcs bitmask via tc
qdisc mask. Preempt mask configuration: Maps traffic classes to
queue express/preemptible state and applied only when FPE is
active (Tx enabled).

Verify state machine re-triggers on link up/down events based on
fpe_enabled and fpe_active flags, and for memory protection,
fpe_lock serializes all FPE state mutations, preventing races
between ethtool config, qdisc setup, and link events.

Default values for verify_time_ms and tx_min_frag_size are set
during init to ensure get_mm() returns valid state before the
MAC Merge ethtool uAPI (.get_mm()/.set_mm()) is wired up in the
following patch.

Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
Signed-off-by: Meghana Malladi <m-malladi@ti.com>
---

v9-v8 changelog:
Sashiko comments addressed:
  - Fix mutex_destroy/mutex_init asymmetry: add icssg_qos_exit(),
    remove mutex_destroy from shared prueth_netdev_exit()     
  - Clear PRE_EMPTION_ENABLE_TX and PRE_EMPTION_ENABLE_VERIFY in
    firmware on link-down to prevent HW/driver divergence                      
  - Fix plain emac->link = 0 store with WRITE_ONCE() in
    prueth_emac_common_start()                                                        
  - Fix EXPRESS_PRE_EMPTIVE_Q_MASK encoding: initialise prempt_mask to
    ICSSG_EXPRESS_Q_MASK_ALL and subtract preemptible queues, so unmanaged
    queues remain express      
  - Add rollback in emac_tc_setup_mqprio() on firmware config failure           
  - Update commit message to note MAC Merge ethtool uAPI (.get_mm()/.set_mm())
    is wired up in the following patch

Sashiko comments skipped:
 - enable path is intentionally unreachable within this patch; uAPI lands
   in the next patch (false positive)

 drivers/net/ethernet/ti/Makefile             |   3 +-
 drivers/net/ethernet/ti/icssg/icssg_config.h |   9 -
 drivers/net/ethernet/ti/icssg/icssg_prueth.c |  16 +-
 drivers/net/ethernet/ti/icssg/icssg_prueth.h |   8 +-
 drivers/net/ethernet/ti/icssg/icssg_qos.c    | 327 +++++++++++++++++++
 drivers/net/ethernet/ti/icssg/icssg_qos.h    |  69 ++++
 6 files changed, 416 insertions(+), 16 deletions(-)
 create mode 100644 drivers/net/ethernet/ti/icssg/icssg_qos.c
 create mode 100644 drivers/net/ethernet/ti/icssg/icssg_qos.h

diff --git a/drivers/net/ethernet/ti/Makefile b/drivers/net/ethernet/ti/Makefile
index f4276c9a77620..d19bcd25c9d07 100644
--- a/drivers/net/ethernet/ti/Makefile
+++ b/drivers/net/ethernet/ti/Makefile
@@ -46,6 +46,7 @@ icssg-y := icssg/icssg_common.o \
 	   icssg/icssg_config.o \
 	   icssg/icssg_mii_cfg.o \
 	   icssg/icssg_stats.o \
-	   icssg/icssg_ethtool.o
+	   icssg/icssg_ethtool.o \
+	   icssg/icssg_qos.o
 
 obj-$(CONFIG_TI_ICSS_IEP) += icssg/icss_iep.o
diff --git a/drivers/net/ethernet/ti/icssg/icssg_config.h b/drivers/net/ethernet/ti/icssg/icssg_config.h
index 60d69744ffae2..1ac202f855ed4 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_config.h
+++ b/drivers/net/ethernet/ti/icssg/icssg_config.h
@@ -323,13 +323,4 @@ struct prueth_fdb_slot {
 	u8 fid;
 	u8 fid_c2;
 } __packed;
-
-enum icssg_ietfpe_verify_states {
-	ICSSG_IETFPE_STATE_UNKNOWN = 0,
-	ICSSG_IETFPE_STATE_INITIAL,
-	ICSSG_IETFPE_STATE_VERIFYING,
-	ICSSG_IETFPE_STATE_SUCCEEDED,
-	ICSSG_IETFPE_STATE_FAILED,
-	ICSSG_IETFPE_STATE_DISABLED
-};
 #endif /* __NET_TI_ICSSG_CONFIG_H */
diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.c b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
index 9bb67e185a3ea..d8431132c34b0 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_prueth.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
@@ -285,7 +285,7 @@ static int prueth_emac_common_start(struct prueth *prueth)
 		 * change and will skip critical configuration like writing
 		 * speed to firmware.
 		 */
-		emac->link = 0;
+		WRITE_ONCE(emac->link, 0);
 
 		mutex_lock(&emac->ndev->phydev->lock);
 		emac_adjust_link(emac->ndev);
@@ -357,11 +357,11 @@ static void emac_adjust_link(struct net_device *ndev)
 		}
 		if (!emac->link) {
 			new_state = true;
-			emac->link = 1;
+			WRITE_ONCE(emac->link, 1);
 		}
 	} else if (emac->link) {
 		new_state = true;
-		emac->link = 0;
+		WRITE_ONCE(emac->link, 0);
 
 		/* f/w should support 100 & 1000 */
 		emac->speed = SPEED_1000;
@@ -392,6 +392,8 @@ static void emac_adjust_link(struct net_device *ndev)
 		} else {
 			icssg_set_port_state(emac, ICSSG_EMAC_PORT_DISABLE);
 		}
+
+		icssg_qos_link_state_update(ndev);
 	}
 
 	if (emac->link) {
@@ -1652,6 +1654,7 @@ static const struct net_device_ops emac_netdev_ops = {
 	.ndo_hwtstamp_get = icssg_ndo_get_ts_config,
 	.ndo_hwtstamp_set = icssg_ndo_set_ts_config,
 	.ndo_xsk_wakeup = prueth_xsk_wakeup,
+	.ndo_setup_tc = icssg_qos_ndo_setup_tc,
 };
 
 static int prueth_netdev_init(struct prueth *prueth,
@@ -1686,6 +1689,8 @@ static int prueth_netdev_init(struct prueth *prueth,
 
 	INIT_DELAYED_WORK(&emac->stats_work, icssg_stats_work_handler);
 
+	icssg_qos_init(ndev);
+
 	ret = pruss_request_mem_region(prueth->pruss,
 				       port == PRUETH_PORT_MII0 ?
 				       PRUSS_MEM_DRAM0 : PRUSS_MEM_DRAM1,
@@ -1793,6 +1798,7 @@ static int prueth_netdev_init(struct prueth *prueth,
 free:
 	pruss_release_mem_region(prueth->pruss, &emac->dram);
 free_ndev:
+	icssg_qos_exit(ndev);
 	emac->ndev = NULL;
 	prueth->emac[mac] = NULL;
 	free_netdev(ndev);
@@ -2475,6 +2481,8 @@ static int prueth_probe(struct platform_device *pdev)
 		if (!eth_node)
 			continue;
 
+		if (prueth->emac[i])
+			icssg_qos_exit(prueth->emac[i]->ndev);
 		prueth_netdev_exit(prueth, eth_node);
 	}
 
@@ -2534,6 +2542,8 @@ static void prueth_remove(struct platform_device *pdev)
 		if (!eth_node)
 			continue;
 
+		if (prueth->emac[i])
+			icssg_qos_exit(prueth->emac[i]->ndev);
 		prueth_netdev_exit(prueth, eth_node);
 	}
 
diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.h b/drivers/net/ethernet/ti/icssg/icssg_prueth.h
index df93d15c5b786..f73b8f5fca956 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_prueth.h
+++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.h
@@ -44,10 +44,11 @@
 #include "icssg_config.h"
 #include "icss_iep.h"
 #include "icssg_switch_map.h"
+#include "icssg_qos.h"
 
-#define PRUETH_MAX_MTU          (2000 - ETH_HLEN - ETH_FCS_LEN)
-#define PRUETH_MIN_PKT_SIZE     (VLAN_ETH_ZLEN)
-#define PRUETH_MAX_PKT_SIZE     (PRUETH_MAX_MTU + ETH_HLEN + ETH_FCS_LEN)
+#define PRUETH_MAX_MTU		(2000 - ETH_HLEN - ETH_FCS_LEN)
+#define PRUETH_MIN_PKT_SIZE	(VLAN_ETH_ZLEN)
+#define PRUETH_MAX_PKT_SIZE	(PRUETH_MAX_MTU + ETH_HLEN + ETH_FCS_LEN)
 
 #define ICSS_SLICE0	0
 #define ICSS_SLICE1	1
@@ -254,6 +255,7 @@ struct prueth_emac {
 	struct bpf_prog *xdp_prog;
 	struct xdp_attachment_info xdpi;
 	int xsk_qid;
+	struct prueth_qos qos;
 };
 
 /* The buf includes headroom compatible with both skb and xdpf */
diff --git a/drivers/net/ethernet/ti/icssg/icssg_qos.c b/drivers/net/ethernet/ti/icssg/icssg_qos.c
new file mode 100644
index 0000000000000..55ddf7669530c
--- /dev/null
+++ b/drivers/net/ethernet/ti/icssg/icssg_qos.c
@@ -0,0 +1,327 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Texas Instruments ICSSG PRUETH QoS submodule
+ * Copyright (C) 2023 Texas Instruments Incorporated - http://www.ti.com/
+ */
+
+#include "icssg_prueth.h"
+#include "icssg_switch_map.h"
+
+static void icssg_iet_set_preempt_mask(struct prueth_emac *emac)
+{
+	void __iomem *config = emac->dram.va + ICSSG_CONFIG_OFFSET;
+	struct prueth_qos_mqprio *p_mqprio = &emac->qos.mqprio;
+	struct tc_mqprio_qopt *qopt = &p_mqprio->qopt;
+	struct prueth_qos_iet *iet = &emac->qos.iet;
+	int prempt_mask = 0, i;
+	u8 tc, num_tc;
+
+	if (!iet->preemptible_tcs)
+		goto reset_hw;
+
+	if (iet->fpe_active) {
+		/* Reset all Q_MAP entries first to clear any stale preemptible
+		 * entries from a prior wider TC mapping.
+		 */
+		for (i = 0; i < ICSSG_MAX_TC_QUEUES; i++)
+			writeb(0, config + EXPRESS_PRE_EMPTIVE_Q_MAP + i);
+
+		/* Start with all queues express. Only clear bits for queues
+		 * that are explicitly mapped to a preemptible TC. Queues not
+		 * covered by any TC (untagged, XDP, special priority) remain
+		 * express by default.
+		 */
+		prempt_mask = ICSSG_EXPRESS_Q_MASK_ALL;
+		num_tc = p_mqprio->qopt.num_tc;
+		for (tc = 0; tc < num_tc; tc++) {
+			if (iet->preemptible_tcs & BIT(tc)) {
+				for (i = qopt->offset[tc]; i < qopt->offset[tc] + qopt->count[tc]; i++) {
+					writeb(BIT(4),
+					       config + EXPRESS_PRE_EMPTIVE_Q_MAP + i);
+					prempt_mask &= ~BIT(i);
+				}
+			}
+		}
+		writeb(prempt_mask, config + EXPRESS_PRE_EMPTIVE_Q_MASK);
+		return;
+	}
+
+reset_hw:
+	/* Reset to default: all queues as express */
+	for (i = 0; i < ICSSG_MAX_TC_QUEUES; i++)
+		writeb(0, config + EXPRESS_PRE_EMPTIVE_Q_MAP + i);
+	writeb(ICSSG_EXPRESS_Q_MASK_ALL, config + EXPRESS_PRE_EMPTIVE_Q_MASK);
+}
+
+static int icssg_iet_verify_wait(struct prueth_emac *emac)
+{
+	void __iomem *config = emac->dram.va + ICSSG_CONFIG_OFFSET;
+	struct prueth_qos_iet *iet = &emac->qos.iet;
+	unsigned long delay_us, timeout_us;
+	u32 status;
+	int ret;
+
+	delay_us = iet->verify_time_ms * 1000;
+	timeout_us = delay_us * ICSSG_IET_VERIFY_ATTEMPTS;
+
+	ret = readb_poll_timeout(config + PRE_EMPTION_VERIFY_STATUS,
+				 status,
+				 status == ICSSG_IETFPE_STATE_SUCCEEDED ||
+				 status == ICSSG_IETFPE_STATE_FAILED,
+				 delay_us,
+				 timeout_us);
+
+	iet->verify_status = status;
+	if (!ret && status == ICSSG_IETFPE_STATE_FAILED)
+		return -EIO;
+	return ret;
+}
+
+/* Direct synchronous configuration of IET FPE.
+ * Caller must hold iet->fpe_lock.
+ */
+int icssg_config_ietfpe(struct net_device *ndev, bool enable)
+{
+	struct prueth_emac *emac = netdev_priv(ndev);
+	void __iomem *config = emac->dram.va + ICSSG_CONFIG_OFFSET;
+	struct prueth_qos_iet *iet = &emac->qos.iet;
+	int ret;
+	u8 val;
+
+	lockdep_assert_held(&iet->fpe_lock);
+
+	if (!READ_ONCE(emac->link)) {
+		netdev_dbg(ndev, "cannot change IET/FPE state when interface is down\n");
+		return 0;
+	}
+
+	/* Update FPE Tx enable bit (PRE_EMPTION_ENABLE_TX) if
+	 * fpe_enabled is set to enable MM in Tx direction
+	 */
+	writeb(enable ? 1 : 0, config + PRE_EMPTION_ENABLE_TX);
+	writew(iet->tx_min_frag_size + ETH_FCS_LEN,
+	       config + PRE_EMPTION_ADD_FRAG_SIZE_LOCAL);
+
+	/* If FPE is to be enabled, first configure MAC Verify state
+	 * machine in firmware as firmware kicks the Verify process
+	 * as soon as ICSSG_EMAC_PORT_PREMPT_TX_ENABLE command is
+	 * received.
+	 */
+	if (enable && iet->mac_verify_configure) {
+		writeb(1, config + PRE_EMPTION_ENABLE_VERIFY);
+		writel(iet->verify_time_ms, config + PRE_EMPTION_VERIFY_TIME);
+	} else {
+		writeb(0, config + PRE_EMPTION_ENABLE_VERIFY);
+		iet->verify_status = ICSSG_IETFPE_STATE_DISABLED;
+	}
+
+	/* Send command to enable FPE Tx side. Rx is always enabled */
+	ret = icssg_set_port_state(emac,
+				   enable ? ICSSG_EMAC_PORT_PREMPT_TX_ENABLE :
+					    ICSSG_EMAC_PORT_PREMPT_TX_DISABLE);
+	if (ret) {
+		netdev_err(ndev, "TX preempt %s command failed\n",
+			   str_enable_disable(enable));
+		goto fallback;
+	}
+
+	if (enable && iet->mac_verify_configure) {
+		ret = icssg_iet_verify_wait(emac);
+		if (ret) {
+			netdev_err(ndev, "MAC Merge verification failed: %s\n",
+				   iet->verify_status == ICSSG_IETFPE_STATE_FAILED ?
+				   "link partner rejected" : "timeout");
+			goto disable_tx;
+		}
+	} else if (enable) {
+		/* Give firmware some time to update
+		 * PRE_EMPTION_ACTIVE_TX state
+		 */
+		usleep_range(100, 200);
+	}
+
+	if (enable) {
+		val = readb(config + PRE_EMPTION_ACTIVE_TX);
+		if (val != 1) {
+			netdev_err(ndev,
+				   "Firmware fails to activate IET/FPE\n");
+			ret = -EIO;
+			goto disable_tx;
+		}
+		iet->fpe_active = true;
+	} else {
+		iet->fpe_active = false;
+	}
+
+	icssg_iet_set_preempt_mask(emac);
+	netdev_dbg(ndev, "IET FPE %s successfully\n",
+		   str_enable_disable(enable));
+	return 0;
+
+disable_tx:
+	icssg_set_port_state(emac, ICSSG_EMAC_PORT_PREMPT_TX_DISABLE);
+fallback:
+	writeb(0, config + PRE_EMPTION_ENABLE_TX);
+	writeb(0, config + PRE_EMPTION_ENABLE_VERIFY);
+	iet->verify_status = ICSSG_IETFPE_STATE_DISABLED;
+	iet->fpe_active = false;
+	icssg_iet_set_preempt_mask(emac);
+	return ret;
+}
+
+void icssg_qos_init(struct net_device *ndev)
+{
+	struct prueth_emac *emac = netdev_priv(ndev);
+	struct prueth_qos_iet *iet = &emac->qos.iet;
+
+	mutex_init(&iet->fpe_lock);
+	/* Set default values to prevent garbage values during .get_mm() */
+	iet->verify_time_ms = ICSSG_IET_MAX_VERIFY_TIME;
+	iet->tx_min_frag_size = ETH_ZLEN;
+}
+EXPORT_SYMBOL_GPL(icssg_qos_init);
+
+void icssg_qos_exit(struct net_device *ndev)
+{
+	struct prueth_emac *emac = netdev_priv(ndev);
+
+	mutex_destroy(&emac->qos.iet.fpe_lock);
+}
+EXPORT_SYMBOL_GPL(icssg_qos_exit);
+
+static int icssg_iet_change_preemptible_tcs(struct prueth_emac *emac)
+{
+	struct prueth_qos_iet *iet = &emac->qos.iet;
+	int ret;
+
+	mutex_lock(&iet->fpe_lock);
+	if (!iet->fpe_enabled && !iet->preemptible_tcs) {
+		mutex_unlock(&iet->fpe_lock);
+		return 0;
+	}
+	ret = icssg_config_ietfpe(emac->ndev, iet->fpe_enabled);
+	mutex_unlock(&iet->fpe_lock);
+
+	return ret;
+}
+
+static int emac_tc_query_caps(struct net_device *ndev, void *type_data)
+{
+	struct tc_query_caps_base *base = type_data;
+
+	switch (base->type) {
+	case TC_SETUP_QDISC_MQPRIO: {
+		struct tc_mqprio_caps *caps = base->caps;
+
+		caps->validate_queue_counts = true;
+		return 0;
+	}
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int emac_tc_setup_mqprio(struct net_device *ndev, void *type_data)
+{
+	struct prueth_emac *emac = netdev_priv(ndev);
+	struct prueth_qos_mqprio *p_mqprio = &emac->qos.mqprio;
+	struct tc_mqprio_qopt_offload *mqprio = type_data;
+	struct prueth_qos_iet *iet = &emac->qos.iet;
+	struct tc_mqprio_qopt *qopt = &mqprio->qopt;
+	int tc, offset, count, ret;
+
+	/* Validate parameters */
+	if (qopt->num_tc > ICSSG_MAX_TC_QUEUES) {
+		netdev_err(ndev, "Number of traffic classes (%u) exceeds hardware limit\n",
+			   qopt->num_tc);
+		return -EOPNOTSUPP;
+	}
+
+	if (mqprio->flags & TC_MQPRIO_F_SHAPER) {
+		netdev_err(ndev, "traffic shaping is not supported\n");
+		return -EOPNOTSUPP;
+	}
+
+	if (mqprio->flags & (TC_MQPRIO_F_MIN_RATE | TC_MQPRIO_F_MAX_RATE)) {
+		netdev_err(ndev, "per-queue rate limiting is not supported\n");
+		return -EOPNOTSUPP;
+	}
+
+	if (!qopt->num_tc) {
+		netdev_reset_tc(ndev);
+	} else {
+		netdev_set_num_tc(ndev, qopt->num_tc);
+
+		for (tc = 0; tc < qopt->num_tc; tc++) {
+			count = qopt->count[tc];
+			offset = qopt->offset[tc];
+			netdev_set_tc_queue(ndev, tc, count, offset);
+		}
+	}
+
+	mutex_lock(&iet->fpe_lock);
+	if (!qopt->num_tc) {
+		iet->preemptible_tcs = 0;
+	} else {
+		memcpy(&p_mqprio->qopt, qopt, sizeof(*qopt));
+		iet->preemptible_tcs = mqprio->preemptible_tcs;
+	}
+	mutex_unlock(&iet->fpe_lock);
+
+	netdev_dbg(ndev, "dev->num_tc %u dev->real_num_tx_queues %u\n",
+		   ndev->num_tc, ndev->real_num_tx_queues);
+
+	ret = icssg_iet_change_preemptible_tcs(emac);
+	if (ret) {
+		mutex_lock(&iet->fpe_lock);
+		iet->preemptible_tcs = 0;
+		memset(&p_mqprio->qopt, 0, sizeof(p_mqprio->qopt));
+		mutex_unlock(&iet->fpe_lock);
+		netdev_reset_tc(ndev);
+	}
+	return ret;
+}
+
+int icssg_qos_ndo_setup_tc(struct net_device *ndev, enum tc_setup_type type,
+			   void *type_data)
+{
+	switch (type) {
+	case TC_QUERY_CAPS:
+		return emac_tc_query_caps(ndev, type_data);
+	case TC_SETUP_QDISC_MQPRIO:
+		return emac_tc_setup_mqprio(ndev, type_data);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+EXPORT_SYMBOL_GPL(icssg_qos_ndo_setup_tc);
+
+void icssg_qos_link_state_update(struct net_device *ndev)
+{
+	struct prueth_emac *emac = netdev_priv(ndev);
+	struct prueth_qos_iet *iet = &emac->qos.iet;
+	int ret;
+
+	if (!READ_ONCE(emac->link)) {
+		void __iomem *config = emac->dram.va + ICSSG_CONFIG_OFFSET;
+
+		/* Clear FPE active state on link-down so get_mm() reports
+		 * accurate tx_active and verify_status while link is down.
+		 * Also zero the FW preemption registers to prevent divergence
+		 * if a concurrent enable was interrupted by link-down.
+		 */
+		mutex_lock(&iet->fpe_lock);
+		writeb(0, config + PRE_EMPTION_ENABLE_TX);
+		writeb(0, config + PRE_EMPTION_ENABLE_VERIFY);
+		iet->fpe_active = false;
+		iet->verify_status = ICSSG_IETFPE_STATE_DISABLED;
+		icssg_iet_set_preempt_mask(emac);
+		mutex_unlock(&iet->fpe_lock);
+		return;
+	}
+
+	ret = icssg_iet_change_preemptible_tcs(emac);
+	if (ret)
+		netdev_dbg(ndev, "IET FPE %s failed\n",
+			   str_enable_disable(iet->fpe_enabled));
+}
+EXPORT_SYMBOL_GPL(icssg_qos_link_state_update);
diff --git a/drivers/net/ethernet/ti/icssg/icssg_qos.h b/drivers/net/ethernet/ti/icssg/icssg_qos.h
new file mode 100644
index 0000000000000..0a375c125f4b8
--- /dev/null
+++ b/drivers/net/ethernet/ti/icssg/icssg_qos.h
@@ -0,0 +1,69 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright (C) 2023 Texas Instruments Incorporated - http://www.ti.com/
+ */
+
+#ifndef __NET_TI_ICSSG_QOS_H
+#define __NET_TI_ICSSG_QOS_H
+
+#include <linux/atomic.h>
+#include <linux/netdevice.h>
+#include <net/pkt_sched.h>
+
+#define ICSSG_MAX_TC_QUEUES			8
+#define ICSSG_EXPRESS_Q_MASK_ALL		0xFF
+#define ICSSG_IET_MAX_VERIFY_TIME		128
+#define ICSSG_IET_MIN_VERIFY_TIME		1
+#define ICSSG_IET_VERIFY_ATTEMPTS		3
+
+/**
+ * enum icssg_ietfpe_verify_states - status of MM Verify returned by firmware
+ * @ICSSG_IETFPE_STATE_UNKNOWN:
+ *	verification status is unknown
+ * @ICSSG_IETFPE_STATE_INITIAL:
+ *	Firmware returns this if verify state diagram is idle
+ * @ICSSG_IETFPE_STATE_VERIFYING:
+ *	Firmware returns this if verification is ongoing
+ * @ICSSG_IETFPE_STATE_SUCCEEDED:
+ *	Firmware returns this if verify state diagram completes verification
+ * @ICSSG_IETFPE_STATE_FAILED:
+ *	Firmware returns this if verify state diagram fails during verification
+ * @ICSSG_IETFPE_STATE_DISABLED:
+ *	verification is disabled by the driver
+ */
+enum icssg_ietfpe_verify_states {
+	ICSSG_IETFPE_STATE_UNKNOWN = 0,
+	ICSSG_IETFPE_STATE_INITIAL,
+	ICSSG_IETFPE_STATE_VERIFYING,
+	ICSSG_IETFPE_STATE_SUCCEEDED,
+	ICSSG_IETFPE_STATE_FAILED,
+	ICSSG_IETFPE_STATE_DISABLED
+};
+
+struct prueth_qos_mqprio {
+	struct tc_mqprio_qopt qopt;
+};
+
+struct prueth_qos_iet {
+	bool fpe_enabled;
+	bool mac_verify_configure;
+	u32 tx_min_frag_size;
+	u32 verify_time_ms;
+	bool fpe_active;
+	enum icssg_ietfpe_verify_states verify_status;
+	/* fpe mutex protects all FPE operations for synchronization */
+	struct mutex fpe_lock;
+	u8 preemptible_tcs;
+};
+
+struct prueth_qos {
+	struct prueth_qos_iet iet;
+	struct prueth_qos_mqprio mqprio;
+};
+
+void icssg_qos_init(struct net_device *ndev);
+void icssg_qos_exit(struct net_device *ndev);
+void icssg_qos_link_state_update(struct net_device *ndev);
+int icssg_qos_ndo_setup_tc(struct net_device *ndev, enum tc_setup_type type,
+			   void *type_data);
+int icssg_config_ietfpe(struct net_device *ndev, bool enable);
+#endif /* __NET_TI_ICSSG_QOS_H */
-- 
2.43.0


