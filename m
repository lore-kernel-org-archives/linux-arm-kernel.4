Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E486606A330
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 14:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2J7xcxwb;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=KR8C8XPE;
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=GDVqsW9b
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=9R20s7Zf7DOovJYmf8V7Miif4OiOJTd1+VlPiZlnJdA=; b=2J7xcxwbY6EaDP
	5YXPWwFAsB7H5F0XyWAPmbQIJEc1SeeLYbYisOxK8azT21OcrxgRtTOoKCH4KXX9PV2lk54K2rWr9
	UNvZlpgv7JXKK4aD9Z9et2SDTIlarGC0Bi40IYniargWyN0eBA/07yDo1lpLvogK/6O9jgjiWQRxw
	4T6yEV4cfh1SYmRDlowtlVCQomaQKr3LcbTZitHqcKGv3jPRvsgfjPG9CeAG4FrngqzyYv9LRomN3
	wL9FHhKN/sL3+lJzj2h7BtTPvomULhJkEPxU6wQdEaFyigFusyEBRcQ5EMPE3yC88DjS9Q1Vah06u
	tqtHgDD51TRB8vXL06ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUmOL-0000000HMMS-0uag;
	Sat, 21 Nov 2026 14:48:37 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUmOI-0000000HMLS-1Ftu
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 14:48:35 +0000
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ALCZ5KO2182642;
	Sat, 21 Nov 2026 08:47:17 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=9R20s7Zf7DOovJYmf8V7Miif4OiOJTd1+VlPiZlnJ
	dA=; b=KR8C8XPE2aF2kFUWVaz6h+o4OnaiyYPGkc3kaQOw8q39jkiUMaHxhCKIV
	cWSf9O+UAqst9il/mZNxKMWHx+kj1mRzKWQXvvXo2y8YPGMErHNHHffQrKTUum5T
	hZfXuOuaG/CjF917z8PaltwpX5dVWc5ggmysTDSyuHIooZukLQtOYoqagDwFPLkK
	mVCaUAFEt61K1g7rxmgSvXgq8CRBPqqSY1vyBy/KWGs59AN3LmRZ76Hum7P3cSzl
	7ax6cmKRWzDB2i0ZjghYSHQESKTvG9AAGMxc1z91jMLxLDgG93ykQScnlF8/TPqM
	S4T8VFVDj9oOzYdnVe2FLQY7mUDCg==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010047.outbound.protection.outlook.com [52.101.201.47])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4j3bed0dad-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 21 Nov 2026 08:47:16 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rGsYCV6+JycmC+OsbYAy85QBd2N6ItZ8KE+c0OaOZIGVPRF8Ud+mwR4FG7UeDD+Fvkx4VRmsd33S2uDUZezybWOq//O3JmF7HUIX4XLLiMpnCuIoHR1Er7krddVo7YqaF4x48HMjC6ExvSC8pkKI7uBWRuQMzxAgZloe5QGOIpK61e6rE9RLjvjNMuJZjiIqOEJH4oYLdAXf6Qtc1jV8ifJcSt8vl1+1PoA9bw3/HGC21KytpKHvsoIuXGLhcxYt+AoN0isMkY4onz3CgtMkvVcsA1HCAXFArKDH49YhX5uAFDDUQ/mEOdjLupEGay7nvLRewGNDKPj+j8StdhNu6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9R20s7Zf7DOovJYmf8V7Miif4OiOJTd1+VlPiZlnJdA=;
 b=mQRfNGcz6r+z++N2rnnVRqVxMknZeOtJbnmeh7dihrROABBmdElXcG7WiR4p7RFEwZFtruP5f/RrnOgAyviYGLvdUGCQmY7MmjIeleAfI5S/mQ1e6Phtb750Vc2t/KKfG7IQvAZR5m+RO7R91WXORgACe974rPp9A32xNrndiJ1MjcuvvQRbo/M36EHHKzJ6AZnxeFIidwr6wGkyuf+LVfc1fbFILsvqhA/ejS+yoP82VFoD/6mtT+No5NTOpdh+sWnVG+zrT+fj6IK1hrPw6bxfjNNA/Un6/kugobV/DbazgJBIHRFDp3nB0XXjZW0gEIaQYLKmVMBrKN9rvul1XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=suse.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9R20s7Zf7DOovJYmf8V7Miif4OiOJTd1+VlPiZlnJdA=;
 b=GDVqsW9bxeqsEk0kLqbrz5OOlub8/iSfQ1uX/pHWhQHKaPR6iZCtY0SqAg6Wss8pIzGksofCuRX0ZW8670Rn0WKMf7ymvLrHL2K5yBmS0zp9nlYisupewqdqbwgwtIpLwFZLwB6JK4GkvyTGOIU6nCDZLFsimhf0L+9pfZSfEq0=
Received: from PH7P223CA0029.NAMP223.PROD.OUTLOOK.COM (2603:10b6:510:338::30)
 by DS0PR10MB7294.namprd10.prod.outlook.com (2603:10b6:8:f6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Sat, 21 Nov
 2026 14:47:10 +0000
Received: from MWH0EPF000A672F.namprd04.prod.outlook.com
 (2603:10b6:510:338:cafe::36) by PH7P223CA0029.outlook.office365.com
 (2603:10b6:510:338::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.12 via Frontend Transport; Sat,
 21 Nov 2026 14:47:09 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 MWH0EPF000A672F.mail.protection.outlook.com (10.167.249.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Sat, 21 Nov 2026 14:47:08 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sat, 21 Nov
 2026 08:46:30 -0600
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sat, 21 Nov
 2026 08:46:30 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Sat, 21 Nov 2026 08:46:30 -0600
Received: from fllv0122.itg.ti.com (fllv0122.itg.ti.com [10.247.120.72])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6ALEkUUn016243;
	Sat, 21 Nov 2026 08:46:30 -0600
Received: from localhost (meghana.dhcp.ti.com [172.24.231.93] (may be forged))
	by fllv0122.itg.ti.com (8.14.7/8.14.7) with ESMTP id 6ALEkSsJ013105;
	Sat, 21 Nov 2026 08:46:29 -0600
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
Subject: [PATCH net-next v9 2/2] net: ti: icssg-prueth: Add ethtool ops for Frame Preemption MAC Merge
Date: Sat, 21 Nov 2026 20:16:17 +0530
Message-ID: <20261121144618.180542-3-m-malladi@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261121144618.180542-1-m-malladi@ti.com>
References: <20261121144618.180542-1-m-malladi@ti.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A672F:EE_|DS0PR10MB7294:EE_
X-MS-Office365-Filtering-Correlation-Id: e13518e9-be2d-4224-b0e8-08df47de5184
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|36860700016|7416014|376014|1800799024|82310400026|261022105027099003|261022075727099003|56012099006|261009223027099003|10067099003|261021123027099003|261102130727099003|261102123227099003|261021121427099003|261026140227099003|261026121527099003|261028144727099003|18002099003|22082099003|921020|6133799003;
X-Microsoft-Antispam-Message-Info: cgHVxIJwpuIXS6lLXMWaOV9baG6YVUh1Grb7kkuoAevmBVbYfp6tfLAWN8F7Bn4yGiLCmEvpsryLEhq0GkBelLpOpvcRRd48zzsjthWxUYoW73CmZrKV8Sd6OsO/hNldPno+G3xXrjnXrlcCZLmleB4dODVj9AHy555SWmnmHnJcBMSL1H/VWGur6NI/LDI0wF/YtGjPRq9ym89eU65SqU9OW7nmpxs9K3z4/PZ45MUfSAn/hzJQax6vUtHizRhePqbdZsc8MsuLT4tmcFdmVXKtNGF+56Bv6DQwsGFD4WjbBmdFyJ0o7WztYgD0s0JiyWRzPiaY/Rzhy12+fqA2GD/ZGbd0Krj+Kxu1dxZbBXVsPPNuEbWWeC/UD1nHROPUwFCn2KWge+i9ZlFoaLj7TXbGlBv9Gstr+RTwyFqkhL0U+F84/wx8Mg4zCCHgVaGMEOy8Xt7GS/fx6xAHXMayOdsgyQvb/3XtW4e7M9GIDXhw1IWME5CA+xKz/mJmPYjQyraXcnm/USrSKOUJkRTzlFqrsslpNpNAd6hlqB7dYbZe90jU99I0SnStjki1mRLh0hpBnE5Rn4HrzOOsZk03hNkTkIFAlngW46/I30Jrc63ay6ZLOsVw85e6yZ7HxoUDwrJKpX8d5Qs4WsaS5x7ZK57EQ8gP6pd8euWgI9juvCz1bDmZXKMouDZwWSitNuNxufjsfWTF++fx/3U6OADnCrcfms91aMHiOLNjsLnjhivEsIeyvyVR/yiLALGhE+xj
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(7416014)(376014)(1800799024)(82310400026)(261022105027099003)(261022075727099003)(56012099006)(261009223027099003)(10067099003)(261021123027099003)(261102130727099003)(261102123227099003)(261021121427099003)(261026140227099003)(261026121527099003)(261028144727099003)(18002099003)(22082099003)(921020)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: mra+Zpfh5PZ58+QIhLe4yWd2svjmi2IHNSTSb97gaNesTdxZXilXdc4bQX/Iey5EuwRsOto3YxlE3aLoDZiJafbVzhOvKda/eBzDrnjMU50wEMHdVZiKLcbGqHtCg5FsvVZOHLOH/g05h3CY2Be4RVaHpZmCNQiHmcNY82LhcS08GmN4ogVTZwRptHMN8Rnq76ryuXcVzKUZfnPg4hRo652FHjDeVwk7iIIqO2Le3UZZp5jPFJqHqhwVUgiHIdlcW6Ya1rNWNWNaO7DeLv2ofvQ9DYJInGXJTvs3DkLmQAVfROVa1sxkpSaT9F1dh9qGCLsDoTphMvo68qNmidPljk4Uws+6yOKc+kC/TZnypdF3MMa5YLhdKHwiXbnfT1H2/mUg6h79l9Gx2CK208dbJB5GvNbo9Cfo+5RMv6b+0CMr9t5uJKzTa9qInCW+FsJe
X-Exchange-RoutingPolicyChecked: ltAI3yY8cjw1lFBl3Fiq9U9wJMKAVYQzgbHYmcZpU8nqHCd/a4yYvGVyJPxOh0jKM1PpMi9VFZMQo4xXCkqJOgFSDr8NdJB0YVFeTxxCuvzh6M0RV1BMKYN/Fmh/gWPEdgCGAchPbkVAHA3DyqSLNq8WUNBuRx0VmjcWcQ6Mvhvfp3zCYzC1iZwZBG7un5MEcWRHEih/q767Z4P1HrIrk+XdZs5ErgKl07OYs7OVoc6MhF/9kMbtUV/KFmiy4yyww9tFtMvBlYyiF3AWa7/evav3704ghcFSjBt5Kpf0TBeVsWUZQskliYuDa/iLfNatE3P7++l6IIy21xAz1A0P1w==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2026 14:47:08.4525
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e13518e9-be2d-4224-b0e8-08df47de5184
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000A672F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7294
X-Authority-Analysis: v=2.4 cv=b/sncdGx c=1 sm=1 tr=0 ts=6b01aef4 cx=c_pps
 a=6zE/HbjXcl5L3wBq6eN3xQ==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=51S1SjcA_VpsaEzzNgQA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 0vUuVRpHIjSvMFZVkdGno5ggkb6Z8sRa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIxMDA1OCBTYWx0ZWRfX55XeYk5MVYVD
 6yh9+jcHZW5DTUpfHk3zosyVha5HoQd4IVnMFpJ87XwoCS1tL+ihVdPI2TR3ptMQV0UKEwroQtR
 FehB+Gmdxa6waYxjdm6W1DNhs0TdjnFICdrSuDgGpZMFHTtsYXkfMOV4RBmkGT6zI2fFS7rLfSP
 lBRnXhF9ac0sEwZmm03IbuG/wbAuCVRfx1sMvX5D9PAFUDH3eLuh4UO5adm7GySZ8a1oSb2ablv
 i3J7jz6chwwxYsIE8nuHV3yqLMW2bTmuWjyX+zEZ3swdN+jNkvrthqgfJ0N3sswMJ9P1DWNQh3t
 kFHrJgpSkb8bkKbVWeqlCPplJ4VvlQxBbSfoo8uZ54de/NfonSGgJtoLyRk/JPuuh9WbhtFMf7D
 FGBx22NGfSXzKJBrILQBdKxtbut/rI+YBPkffeQpTgMXi7R9g/2WDCJRfYrIW/DgQBfxJn47HwA
 rgiA5zHx/BkWbXSmyHQ==
X-Proofpoint-ORIG-GUID: 0vUuVRpHIjSvMFZVkdGno5ggkb6Z8sRa
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIxMDA1OCBTYWx0ZWRfX2fryymk4tL4H
 F4vrlEVnu2o7QVHeHyLho9DaDJBuEXw6ObjQafGOwMPwVu/7MjuC91hXWwyyPP/OR1UnYRlwvM6
 FG565RGX82pJvziBOs3n1ozlhxPeqm8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-21_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611210058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_064834_548136_82C0C617 
X-CRM114-Status: GOOD (  15.98  )
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

Adds .get_mm(), .set_mm() and .get_mm_stats() to the icssg ethtool ops,
along with new PA stats registers for the preemption counters. Also
moves the stat table sizes to ARRAY_SIZE() so the counts stay in sync
with the tables automatically.

emac_set_mm() programs all config fields into hardware before invoking
icssg_config_ietfpe(). On failure the fallback path in
icssg_config_ietfpe() already disables TX preemption in hardware, so
only fpe_enabled is forced off; the other fields (tx_min_frag_size,
verify_time_ms, mac_verify_configure) are kept as programmed to keep
driver and hardware state consistent.

tx_min_frag_size is validated against the four addFragSize-representable
values (60/124/188/252) before being programmed, since the firmware
requires the fragment size including FCS to be a multiple of 64 bytes.

verify_status is initialized to ICSSG_IETFPE_STATE_DISABLED in
icssg_qos_init() so that get_mm() reports DISABLED rather than UNKNOWN
on a freshly probed interface.

icssg_stats.h is made self-contained by directly including linux/ethtool.h,
linux/stddef.h, and icssg_switch_map.h, which it uses but previously
relied on icssg_prueth.h to pull in transitively.

Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
Signed-off-by: Meghana Malladi <m-malladi@ti.com>
---

v9-v8 changelog:
Sashiko comments addressed:
  - Fix emac_set_mm() error path: on icssg_config_ietfpe() failure
    only force fpe_enabled = false to match hardware state (TX preempt off);
    retain other config fields as already programmed in HW registers — prevents
    silent re-enable on next link event and fixes ethnl_set_mm() retry becoming a no-op                                   
  - Add icssg_qos_validate_tx_min_frag_size(): reject non-addFragSize-representable values
    (only 60/124/188/252 valid) with extack before touching any state
  - Initialise iet->verify_status = ICSSG_IETFPE_STATE_DISABLED in icssg_qos_init()
    so fresh interface reports DISABLED not UNKNOWN                                      
  - Make icssg_stats.h self-contained                                                         
  - Mutex lifecycle asymmetry on SR1: already fixed in patch 1

Sashiko commens skipped:
  - Pre-existing stats readers without stats_lock: pre-existing issue, not introduced by this 
  series — will be tracked separately                                                                                                                                               
  - emac_get_stat_by_name() return type int → will be posted separately as bug fix

 drivers/net/ethernet/ti/icssg/icssg_ethtool.c | 127 +++++++++++++++++-
 drivers/net/ethernet/ti/icssg/icssg_prueth.h  |  11 +-
 drivers/net/ethernet/ti/icssg/icssg_qos.c     |   1 +
 drivers/net/ethernet/ti/icssg/icssg_qos.h     |  30 +++++
 drivers/net/ethernet/ti/icssg/icssg_stats.h   |  86 +++++++-----
 .../net/ethernet/ti/icssg/icssg_switch_map.h  |   5 +
 6 files changed, 217 insertions(+), 43 deletions(-)

diff --git a/drivers/net/ethernet/ti/icssg/icssg_ethtool.c b/drivers/net/ethernet/ti/icssg/icssg_ethtool.c
index b715af21d23ac..26892b603e1db 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_ethtool.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_ethtool.c
@@ -74,7 +74,8 @@ static int emac_get_sset_count(struct net_device *ndev, int stringset)
 		if (emac->prueth->pa_stats)
 			return ICSSG_NUM_ETHTOOL_STATS;
 		else
-			return ICSSG_NUM_ETHTOOL_STATS - ICSSG_NUM_PA_STATS;
+			return ICSSG_NUM_ETHTOOL_STATS -
+			       (ICSSG_NUM_PA_STATS - ICSSG_NUM_PA_STANDARD_STATS);
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -93,7 +94,8 @@ static void emac_get_strings(struct net_device *ndev, u32 stringset, u8 *data)
 				ethtool_puts(&p, icssg_all_miig_stats[i].name);
 		if (emac->prueth->pa_stats)
 			for (i = 0; i < ARRAY_SIZE(icssg_all_pa_stats); i++)
-				ethtool_puts(&p, icssg_all_pa_stats[i].name);
+				if (!icssg_all_pa_stats[i].standard_stats)
+					ethtool_puts(&p, icssg_all_pa_stats[i].name);
 		break;
 	default:
 		break;
@@ -114,7 +116,8 @@ static void emac_get_ethtool_stats(struct net_device *ndev,
 
 	if (emac->prueth->pa_stats)
 		for (i = 0; i < ARRAY_SIZE(icssg_all_pa_stats); i++)
-			*(data++) = emac->pa_stats[i];
+			if (!icssg_all_pa_stats[i].standard_stats)
+				*(data++) = emac->pa_stats[i];
 }
 
 static int emac_get_ts_info(struct net_device *ndev,
@@ -294,6 +297,121 @@ static int emac_set_per_queue_coalesce(struct net_device *ndev, u32 queue,
 	return 0;
 }
 
+static int emac_get_mm(struct net_device *ndev, struct ethtool_mm_state *state)
+{
+	struct prueth_emac *emac = netdev_priv(ndev);
+	struct prueth_qos_iet *iet = &emac->qos.iet;
+	enum icssg_ietfpe_verify_states verify_status;
+
+	if (emac->is_sr1)
+		return -EOPNOTSUPP;
+
+	mutex_lock(&iet->fpe_lock);
+	state->tx_enabled = iet->fpe_enabled;
+	state->tx_min_frag_size = iet->tx_min_frag_size;
+	state->verify_enabled = iet->mac_verify_configure;
+	state->verify_time = iet->verify_time_ms;
+	state->tx_active = iet->fpe_active;
+	verify_status = iet->verify_status;
+	mutex_unlock(&iet->fpe_lock);
+
+	state->rx_min_frag_size = ETH_ZLEN;
+	state->pmac_enabled = true;
+
+	switch (verify_status) {
+	case ICSSG_IETFPE_STATE_DISABLED:
+		state->verify_status = ETHTOOL_MM_VERIFY_STATUS_DISABLED;
+		break;
+	case ICSSG_IETFPE_STATE_INITIAL:
+		state->verify_status = ETHTOOL_MM_VERIFY_STATUS_INITIAL;
+		break;
+	case ICSSG_IETFPE_STATE_VERIFYING:
+		state->verify_status = ETHTOOL_MM_VERIFY_STATUS_VERIFYING;
+		break;
+	case ICSSG_IETFPE_STATE_SUCCEEDED:
+		state->verify_status = ETHTOOL_MM_VERIFY_STATUS_SUCCEEDED;
+		break;
+	case ICSSG_IETFPE_STATE_FAILED:
+		state->verify_status = ETHTOOL_MM_VERIFY_STATUS_FAILED;
+		break;
+	default:
+		state->verify_status = ETHTOOL_MM_VERIFY_STATUS_UNKNOWN;
+		break;
+	}
+
+	/* 802.3-2018 clause 30.14.1.6, says that the aMACMergeVerifyTime
+	 * variable has a range between 1 and 128 ms inclusive. Limit to that.
+	 */
+	state->max_verify_time = ETHTOOL_MM_MAX_VERIFY_TIME_MS;
+
+	return 0;
+}
+
+static int emac_set_mm(struct net_device *ndev, struct ethtool_mm_cfg *cfg,
+		       struct netlink_ext_ack *extack)
+{
+	struct prueth_emac *emac = netdev_priv(ndev);
+	struct prueth_qos_iet *iet = &emac->qos.iet;
+	int err;
+
+	if (emac->is_sr1)
+		return -EOPNOTSUPP;
+
+	if (!cfg->pmac_enabled) {
+		NL_SET_ERR_MSG_MOD(extack, "preemptible MAC is always enabled");
+		return -EOPNOTSUPP;
+	}
+
+	err = icssg_qos_validate_tx_min_frag_size(cfg->tx_min_frag_size, extack);
+	if (err)
+		return err;
+
+	mutex_lock(&iet->fpe_lock);
+	iet->verify_time_ms = cfg->verify_time;
+	iet->tx_min_frag_size = cfg->tx_min_frag_size;
+	iet->fpe_enabled = cfg->tx_enabled;
+	iet->mac_verify_configure = cfg->verify_enabled;
+	err = icssg_config_ietfpe(ndev, cfg->tx_enabled);
+	if (err) {
+		/* icssg_config_ietfpe fallback disabled TX preemption in HW.
+		 * New config values are already programmed in HW registers,
+		 * so keep them. Only force fpe_enabled off to match HW state
+		 * and prevent silent re-enable on the next link event.
+		 */
+		iet->fpe_enabled = false;
+	}
+	mutex_unlock(&iet->fpe_lock);
+
+	return err;
+}
+
+static void emac_get_mm_stats(struct net_device *ndev,
+			      struct ethtool_mm_stats *s)
+{
+	struct prueth_emac *emac = netdev_priv(ndev);
+
+	if (emac->is_sr1)
+		return;
+
+	if (!emac->prueth->pa_stats)
+		return;
+
+	emac_update_hardware_stats(emac);
+
+	/* Hold stats_lock to prevent icssg_stats_work_handler from updating
+	 * pa_stats[] between reads, which could yield a torn u64 value on
+	 * 32-bit architectures.
+	 */
+	spin_lock(&emac->prueth->stats_lock);
+	/* MACMergeHoldCount stats is not tracked by the firmware */
+	s->MACMergeFrameAssOkCount = emac_get_stat_by_name(emac, "FW_PREEMPT_ASSEMBLY_OK");
+	s->MACMergeFrameAssErrorCount = emac_get_stat_by_name(emac, "FW_PREEMPT_ASSEMBLY_ERR");
+	s->MACMergeFragCountRx = emac_get_stat_by_name(emac, "FW_PREEMPT_FRAG_CNT_RX");
+	s->MACMergeFragCountTx = emac_get_stat_by_name(emac, "FW_PREEMPT_FRAG_CNT_TX");
+	s->MACMergeFrameSmdErrorCount = emac_get_stat_by_name(emac, "FW_PREEMPT_BAD_FRAG");
+	spin_unlock(&emac->prueth->stats_lock);
+}
+
 const struct ethtool_ops icssg_ethtool_ops = {
 	.get_drvinfo = emac_get_drvinfo,
 	.get_msglevel = emac_get_msglevel,
@@ -317,5 +435,8 @@ const struct ethtool_ops icssg_ethtool_ops = {
 	.set_eee = emac_set_eee,
 	.nway_reset = emac_nway_reset,
 	.get_rmon_stats = emac_get_rmon_stats,
+	.get_mm = emac_get_mm,
+	.set_mm = emac_set_mm,
+	.get_mm_stats = emac_get_mm_stats,
 };
 EXPORT_SYMBOL_GPL(icssg_ethtool_ops);
diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.h b/drivers/net/ethernet/ti/icssg/icssg_prueth.h
index f73b8f5fca956..549489a631cc3 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_prueth.h
+++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.h
@@ -45,6 +45,7 @@
 #include "icss_iep.h"
 #include "icssg_switch_map.h"
 #include "icssg_qos.h"
+#include "icssg_stats.h"
 
 #define PRUETH_MAX_MTU		(2000 - ETH_HLEN - ETH_FCS_LEN)
 #define PRUETH_MIN_PKT_SIZE	(VLAN_ETH_ZLEN)
@@ -58,12 +59,16 @@
 
 #define ICSSG_MAX_RFLOWS	8	/* per slice */
 
-#define ICSSG_NUM_PA_STATS	32
-#define ICSSG_NUM_MIIG_STATS	60
+#define ICSSG_NUM_PA_STATS	ARRAY_SIZE(icssg_all_pa_stats)
+#define ICSSG_NUM_MIIG_STATS	ARRAY_SIZE(icssg_all_miig_stats)
 /* Number of ICSSG related stats */
 #define ICSSG_NUM_STATS (ICSSG_NUM_MIIG_STATS + ICSSG_NUM_PA_STATS)
+/* MIIG stats with standard uAPI equivalents (excluded from ethtool -S) */
 #define ICSSG_NUM_STANDARD_STATS 31
-#define ICSSG_NUM_ETHTOOL_STATS (ICSSG_NUM_STATS - ICSSG_NUM_STANDARD_STATS)
+/* PA stats with standard uAPI equivalents, exposed via get_mm_stats only */
+#define ICSSG_NUM_PA_STANDARD_STATS 5
+#define ICSSG_NUM_ETHTOOL_STATS (ICSSG_NUM_STATS - ICSSG_NUM_STANDARD_STATS - \
+				 ICSSG_NUM_PA_STANDARD_STATS)
 
 #define IEP_DEFAULT_CYCLE_TIME_NS	1000000	/* 1 ms */
 
diff --git a/drivers/net/ethernet/ti/icssg/icssg_qos.c b/drivers/net/ethernet/ti/icssg/icssg_qos.c
index 55ddf7669530c..cb6842d296ce0 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_qos.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_qos.c
@@ -177,6 +177,7 @@ void icssg_qos_init(struct net_device *ndev)
 	/* Set default values to prevent garbage values during .get_mm() */
 	iet->verify_time_ms = ICSSG_IET_MAX_VERIFY_TIME;
 	iet->tx_min_frag_size = ETH_ZLEN;
+	iet->verify_status = ICSSG_IETFPE_STATE_DISABLED;
 }
 EXPORT_SYMBOL_GPL(icssg_qos_init);
 
diff --git a/drivers/net/ethernet/ti/icssg/icssg_qos.h b/drivers/net/ethernet/ti/icssg/icssg_qos.h
index 0a375c125f4b8..bb0d6e2950dfc 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_qos.h
+++ b/drivers/net/ethernet/ti/icssg/icssg_qos.h
@@ -14,6 +14,7 @@
 #define ICSSG_IET_MAX_VERIFY_TIME		128
 #define ICSSG_IET_MIN_VERIFY_TIME		1
 #define ICSSG_IET_VERIFY_ATTEMPTS		3
+#define ICSSG_IET_MAX_TX_MIN_FRAG_SIZE		252
 
 /**
  * enum icssg_ietfpe_verify_states - status of MM Verify returned by firmware
@@ -60,6 +61,35 @@ struct prueth_qos {
 	struct prueth_qos_mqprio mqprio;
 };
 
+static inline int icssg_qos_validate_tx_min_frag_size(u32 min_frag_size,
+						      struct netlink_ext_ack *extack)
+{
+	/* Firmware takes min_frag_size including FCS length.
+	 * The firmware requires the fragment size (including FCS) to be
+	 * a multiple of 64 bytes. Since 64 bytes = ETH_ZLEN + ETH_FCS_LEN,
+	 * valid user-facing values are: 60, 124, 188, 252.
+	 */
+	if (min_frag_size < ETH_ZLEN) {
+		NL_SET_ERR_MSG_MOD(extack,
+				   "tx_min_frag_size must be at least 60 bytes");
+		return -EINVAL;
+	}
+
+	if (min_frag_size > ICSSG_IET_MAX_TX_MIN_FRAG_SIZE) {
+		NL_SET_ERR_MSG_MOD(extack,
+				   "tx_min_frag_size must not exceed 252 bytes");
+		return -EINVAL;
+	}
+
+	if ((min_frag_size + ETH_FCS_LEN) % (ETH_ZLEN + ETH_FCS_LEN)) {
+		NL_SET_ERR_MSG_MOD(extack,
+				   "tx_min_frag_size must be a multiple of 64 bytes minus 4");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 void icssg_qos_init(struct net_device *ndev);
 void icssg_qos_exit(struct net_device *ndev);
 void icssg_qos_link_state_update(struct net_device *ndev);
diff --git a/drivers/net/ethernet/ti/icssg/icssg_stats.h b/drivers/net/ethernet/ti/icssg/icssg_stats.h
index 5ec0b38e0c67d..4e73ee04cb1cd 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_stats.h
+++ b/drivers/net/ethernet/ti/icssg/icssg_stats.h
@@ -8,7 +8,9 @@
 #ifndef __NET_TI_ICSSG_STATS_H
 #define __NET_TI_ICSSG_STATS_H
 
-#include "icssg_prueth.h"
+#include <linux/ethtool.h>
+#include <linux/stddef.h>
+#include "icssg_switch_map.h"
 
 #define STATS_TIME_LIMIT_1G_MS    25000    /* 25 seconds @ 1G */
 
@@ -155,50 +157,60 @@ static const struct icssg_miig_stats icssg_all_miig_stats[] = {
 	ICSSG_MIIG_STATS(tx_bytes, true),
 };
 
-#define ICSSG_PA_STATS(field)	\
-{				\
-	#field,			\
-	field,			\
+#define ICSSG_PA_STATS(field, std)	\
+{					\
+	#field,				\
+	field,				\
+	std,				\
 }
 
 struct icssg_pa_stats {
 	char name[ETH_GSTRING_LEN];
 	u32 offset;
+	bool standard_stats;
 };
 
 static const struct icssg_pa_stats icssg_all_pa_stats[] = {
-	ICSSG_PA_STATS(FW_RTU_PKT_DROP),
-	ICSSG_PA_STATS(FW_Q0_OVERFLOW),
-	ICSSG_PA_STATS(FW_Q1_OVERFLOW),
-	ICSSG_PA_STATS(FW_Q2_OVERFLOW),
-	ICSSG_PA_STATS(FW_Q3_OVERFLOW),
-	ICSSG_PA_STATS(FW_Q4_OVERFLOW),
-	ICSSG_PA_STATS(FW_Q5_OVERFLOW),
-	ICSSG_PA_STATS(FW_Q6_OVERFLOW),
-	ICSSG_PA_STATS(FW_Q7_OVERFLOW),
-	ICSSG_PA_STATS(FW_DROPPED_PKT),
-	ICSSG_PA_STATS(FW_RX_ERROR),
-	ICSSG_PA_STATS(FW_RX_DS_INVALID),
-	ICSSG_PA_STATS(FW_TX_DROPPED_PACKET),
-	ICSSG_PA_STATS(FW_TX_TS_DROPPED_PACKET),
-	ICSSG_PA_STATS(FW_INF_PORT_DISABLED),
-	ICSSG_PA_STATS(FW_INF_SAV),
-	ICSSG_PA_STATS(FW_INF_SA_DL),
-	ICSSG_PA_STATS(FW_INF_PORT_BLOCKED),
-	ICSSG_PA_STATS(FW_INF_DROP_TAGGED),
-	ICSSG_PA_STATS(FW_INF_DROP_PRIOTAGGED),
-	ICSSG_PA_STATS(FW_INF_DROP_NOTAG),
-	ICSSG_PA_STATS(FW_INF_DROP_NOTMEMBER),
-	ICSSG_PA_STATS(FW_RX_EOF_SHORT_FRMERR),
-	ICSSG_PA_STATS(FW_RX_B0_DROP_EARLY_EOF),
-	ICSSG_PA_STATS(FW_TX_JUMBO_FRM_CUTOFF),
-	ICSSG_PA_STATS(FW_RX_EXP_FRAG_Q_DROP),
-	ICSSG_PA_STATS(FW_RX_FIFO_OVERRUN),
-	ICSSG_PA_STATS(FW_CUT_THR_PKT),
-	ICSSG_PA_STATS(FW_HOST_RX_PKT_CNT),
-	ICSSG_PA_STATS(FW_HOST_TX_PKT_CNT),
-	ICSSG_PA_STATS(FW_HOST_EGRESS_Q_PRE_OVERFLOW),
-	ICSSG_PA_STATS(FW_HOST_EGRESS_Q_EXP_OVERFLOW),
+	ICSSG_PA_STATS(FW_RTU_PKT_DROP, false),
+	ICSSG_PA_STATS(FW_Q0_OVERFLOW, false),
+	ICSSG_PA_STATS(FW_Q1_OVERFLOW, false),
+	ICSSG_PA_STATS(FW_Q2_OVERFLOW, false),
+	ICSSG_PA_STATS(FW_Q3_OVERFLOW, false),
+	ICSSG_PA_STATS(FW_Q4_OVERFLOW, false),
+	ICSSG_PA_STATS(FW_Q5_OVERFLOW, false),
+	ICSSG_PA_STATS(FW_Q6_OVERFLOW, false),
+	ICSSG_PA_STATS(FW_Q7_OVERFLOW, false),
+	ICSSG_PA_STATS(FW_DROPPED_PKT, false),
+	ICSSG_PA_STATS(FW_RX_ERROR, false),
+	ICSSG_PA_STATS(FW_RX_DS_INVALID, false),
+	ICSSG_PA_STATS(FW_TX_DROPPED_PACKET, false),
+	ICSSG_PA_STATS(FW_TX_TS_DROPPED_PACKET, false),
+	ICSSG_PA_STATS(FW_INF_PORT_DISABLED, false),
+	ICSSG_PA_STATS(FW_INF_SAV, false),
+	ICSSG_PA_STATS(FW_INF_SA_DL, false),
+	ICSSG_PA_STATS(FW_INF_PORT_BLOCKED, false),
+	ICSSG_PA_STATS(FW_INF_DROP_TAGGED, false),
+	ICSSG_PA_STATS(FW_INF_DROP_PRIOTAGGED, false),
+	ICSSG_PA_STATS(FW_INF_DROP_NOTAG, false),
+	ICSSG_PA_STATS(FW_INF_DROP_NOTMEMBER, false),
+	/* MAC Merge counters: exposed via .get_mm_stats standard uAPI,
+	 * not duplicated in the private ethtool -S table.
+	 */
+	ICSSG_PA_STATS(FW_PREEMPT_BAD_FRAG, true),
+	ICSSG_PA_STATS(FW_PREEMPT_ASSEMBLY_ERR, true),
+	ICSSG_PA_STATS(FW_PREEMPT_FRAG_CNT_TX, true),
+	ICSSG_PA_STATS(FW_PREEMPT_ASSEMBLY_OK, true),
+	ICSSG_PA_STATS(FW_PREEMPT_FRAG_CNT_RX, true),
+	ICSSG_PA_STATS(FW_RX_EOF_SHORT_FRMERR, false),
+	ICSSG_PA_STATS(FW_RX_B0_DROP_EARLY_EOF, false),
+	ICSSG_PA_STATS(FW_TX_JUMBO_FRM_CUTOFF, false),
+	ICSSG_PA_STATS(FW_RX_EXP_FRAG_Q_DROP, false),
+	ICSSG_PA_STATS(FW_RX_FIFO_OVERRUN, false),
+	ICSSG_PA_STATS(FW_CUT_THR_PKT, false),
+	ICSSG_PA_STATS(FW_HOST_RX_PKT_CNT, false),
+	ICSSG_PA_STATS(FW_HOST_TX_PKT_CNT, false),
+	ICSSG_PA_STATS(FW_HOST_EGRESS_Q_PRE_OVERFLOW, false),
+	ICSSG_PA_STATS(FW_HOST_EGRESS_Q_EXP_OVERFLOW, false),
 };
 
 #endif /* __NET_TI_ICSSG_STATS_H */
diff --git a/drivers/net/ethernet/ti/icssg/icssg_switch_map.h b/drivers/net/ethernet/ti/icssg/icssg_switch_map.h
index 7e053b8af3ece..855fd4ed0b3f6 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_switch_map.h
+++ b/drivers/net/ethernet/ti/icssg/icssg_switch_map.h
@@ -256,6 +256,11 @@
 #define FW_INF_DROP_PRIOTAGGED		0x0148
 #define FW_INF_DROP_NOTAG		0x0150
 #define FW_INF_DROP_NOTMEMBER		0x0158
+#define FW_PREEMPT_BAD_FRAG		0x0160
+#define FW_PREEMPT_ASSEMBLY_ERR		0x0168
+#define FW_PREEMPT_FRAG_CNT_TX		0x0170
+#define FW_PREEMPT_ASSEMBLY_OK		0x0178
+#define FW_PREEMPT_FRAG_CNT_RX		0x0180
 #define FW_RX_EOF_SHORT_FRMERR		0x0188
 #define FW_RX_B0_DROP_EARLY_EOF		0x0190
 #define FW_TX_JUMBO_FRM_CUTOFF		0x0198
-- 
2.43.0


