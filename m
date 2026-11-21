Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67AB4606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 14:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=p1XQsKvK;
	dkim=pass (2048-bit key, unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=ak/2qaWQ;
	dkim=pass (1024-bit key, unprotected) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=EW6obxLk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=YcJ+vPdpYmRXMy5SV1y3tH3yFfsTzb/KGS7kjcbMDVc=; b=p1XQsKvKwfqDWWJUyfNnUsjk88
	dmSx7hYAw2Ur6YPBd1kNMvkM50I7XmXgcM4uje0BljYPDKiqKYhFE+kMiuNiPYRa8Qz8aETaP2yec
	me+p730nlTvxyU9H/jvEhN+qGkbv0Cz1GUx8K+Ta4DEaJu+GNF/RGLdRMmr6HmI++5jOfz52ygD8x
	Wvlm3DM4VIaSz8kTsUylJj8ZuhrYgMiLTOF4TKLVpqqXxsmFlmcyslF0c8ZTSqJ568EgwDYUAphEb
	y4HjH07RWqS5o/dk1IgwSpadOf0nhrx+LrBj5gaEe/T9huKshKhkWfRCUmXOeBw1QyrGZqGApJNbg
	PYcOGy/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUmO4-0000000HMJz-1f4v;
	Sat, 21 Nov 2026 14:48:20 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUmO0-0000000HMJF-17wV
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 14:48:18 +0000
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6ALCFGCc2520531;
	Sat, 21 Nov 2026 08:46:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=YcJ+vPdpYmRXM
	y5SV1y3tH3yFfsTzb/KGS7kjcbMDVc=; b=ak/2qaWQ2p5mB9kOkwnZ6x6hlZxqk
	oieJCEL7jFM+D6DvbYNxElHJDirq5TFbCC5Kn3iRQsxUSacBX9fyqw7eAlrRQ3hL
	nM6vSw4BKFNklsxOrIhZEDmnel5SqO7FFve57Uq1EF4XmdnLv6S244JaHbJHW4nv
	xiaMvjKd4Q3eeBfl6aIL84i2lTEdZTPf4/HXq6An8d7ilJXtvUauI2Dn9LMdqb7+
	8UW19u6bgmmCnS5s+/FX+OOPucPWlEDF4BRkr9ht5QEJBVX5BZUiAwXl9LNJmOh2
	3W//rPARkat/cJo6uYOWBOURXlUDB6sXw4oou5lVHLSvysqvS01iTK6wg==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010016.outbound.protection.outlook.com [52.101.85.16])
	by m0380145.ppops.net (PPS) with ESMTPS id 4j38ps0v1v-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 21 Nov 2026 08:46:58 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eTatRF+WcSVrgAqlc1CzxRiA2JuiEuRMQEZV8tgnXfqsp43oHVTdgF/MWpGRo75jUf4WXSwVsM7NpBrmQo6ap8Mbk7b3zMfaQklSWYvF2IFpwuemics+8kjxogKrDBX6cy8icyc8LnDD9pNo8kaDps8G9ZfuT/QjsoK8sZDWz5G5f77r8v2RxMi7C6rwCSZUZKdqWF2/2DRt4n5Dzh+WuAQWG+sdyzmaqBY+PMvd2tnLZAzYylEMZ8BUJTv7JYw0/lB6tXNnYfGLT+Kn2D0b72uhKWPafYnov+FPmxk7sLvkCp/Df9G4uu+ncHgNRXmtFJRqaanw1/eK9xjIM/LM2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YcJ+vPdpYmRXMy5SV1y3tH3yFfsTzb/KGS7kjcbMDVc=;
 b=ccIGRklCRV74gxVs82UcA0YXrQed5W3nr77H8Y3V0RyJW7t5k3VTIngi9cPdtaWoOKXc065kgPrPOlG19atQ6xHugW+z3xJisR5hNnYx7n9cyv83rspCJcyVaEE/3VAsUozpizg+0BowmLhRmFv00yLZlGVg4szI/Xq+ESjePNvQK81kns1PPIe8Rin180KKYJapdR2CPA60Ywipv3npwEHyweRimw+GP15SToZcfoBsmlJiZg2y+t1XJXKyJvjPnU0/QVniR9dYcTJzvuJF1YPfE9CXW3HPAYnlsYZpxLdDgUF7NqIriAoslF+W11LNF1DzNO7UA2dJE7FXiDuk4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=suse.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YcJ+vPdpYmRXMy5SV1y3tH3yFfsTzb/KGS7kjcbMDVc=;
 b=EW6obxLk9/jqMz85qLGqdqNYdGw8UdbZ91OHdqW3RG4FXpLyg92U0IOm1UJ/0mM7KyxjFr7VHbmeXKc8vqlNASWJaqBFD8SJmXFLtb0AjyZhiGOfkC2fv+5kAROVkHKqbBmbnmaUR9eOHqMQm8+MJjr+hlqTP6GVvUqkNSvnVNU=
Received: from SA9PR03CA0013.namprd03.prod.outlook.com (2603:10b6:806:20::18)
 by MW6PR10MB7552.namprd10.prod.outlook.com (2603:10b6:303:23f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Sat, 21 Nov
 2026 14:46:56 +0000
Received: from SN1PEPF000397B5.namprd05.prod.outlook.com
 (2603:10b6:806:20:cafe::2c) by SA9PR03CA0013.outlook.office365.com
 (2603:10b6:806:20::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.12 via Frontend Transport; Sat,
 21 Nov 2026 14:46:56 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SN1PEPF000397B5.mail.protection.outlook.com (10.167.248.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Sat, 21 Nov 2026 14:46:54 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sat, 21 Nov
 2026 08:46:23 -0600
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sat, 21 Nov
 2026 08:46:22 -0600
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Sat, 21 Nov 2026 08:46:22 -0600
Received: from fllv0122.itg.ti.com (fllv0122.itg.ti.com [10.247.120.72])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6ALEkMpx3877466;
	Sat, 21 Nov 2026 08:46:22 -0600
Received: from localhost (meghana.dhcp.ti.com [172.24.231.93] (may be forged))
	by fllv0122.itg.ti.com (8.14.7/8.14.7) with ESMTP id 6ALEkLrL013089;
	Sat, 21 Nov 2026 08:46:22 -0600
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
Subject: [PATCH net-next v9 0/2] Add Frame Preemption MAC Merge support for ICSSG
Date: Sat, 21 Nov 2026 20:16:15 +0530
Message-ID: <20261121144618.180542-1-m-malladi@ti.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B5:EE_|MW6PR10MB7552:EE_
X-MS-Office365-Filtering-Correlation-Id: 48a8629e-dcc3-459d-af6f-08df47de493b
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|36860700016|82310400026|7416014|1800799024|376014|261021123027099003|261021121427099003|921020|261102123227099003|3023799007|56012099006|10067099003|261009223027099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: taFavpsXCqNkPPRE81mklZvfrEMMa8zuWOf5OpHobARTmfaRYYlkt8ZXSXBR/LpDB4xjsAHPx1NFiyYLfwLA63YAPR6SvCnVOtNh3M1xrkHu+yHJF2ZqodFX1YYgQuLd+l7RsjOmd6M/FShr0Tx5hpuxVqFp3IKFxwxDLUl+6GtFHtoMsQ+hPcD/M3eTei4IzHRnwg8sLqzLAa+6lTqXmaxNh0JT6Y2FAknDoubFAkcIIHXj5ViqFSQpV0nmS9Q+tp6I5IxfhUvX34hpH2thD7yiIFkCL27UvaK0t2aKyUhxBSlmY+QJfHhfNo6G8namvTMNustJTvjGQKemcRM6ENlBkhH1AFJHvzJUQfEjVu1s0wo6IJwPIGYUQuKmIsIkWxP8wqho2S9SkA5MJoV+ejsFYsChE2lMJxxZmF/WQkcNT2POQ6YoC4A6g1Szr05BUMTnT1S5X0U5Xi32WV7D2HlqHo7A/FI0kWYuEUJJpFCUf4wxI1CWMmRxnX1y73ciEfCma2x6QMhWhvnYxXdAmn88lIowZonnY8sxCXAjEOK9MJQUCkN/I5wWCro7qxLnHFE9D94L8wOWyI9yPWY4GV/MYCuLeBYxw1Sg0cXXIDCpBWBgfU0gSjEXfmpT8TOgJ4A1+br5LAnzEuIeEdWYnxnQ/00G6Y7F26AkS8z6C3tfpTPnORTjHs0B512Y5XtalxTr0OmIk8FtZ2VMRLka7Q==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(7416014)(1800799024)(376014)(261021123027099003)(261021121427099003)(921020)(261102123227099003)(3023799007)(56012099006)(10067099003)(261009223027099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: RlrVYTmL8KFWz9y0Q4iyw0SyhC9klYwyV7K8msnVLk46ceJvCoZT77T5eirvPZzq70P6ZgQ02S4U8I8yxj+ieAku+9wrKdBNqF2ba6GO+cnmzPJQFY5YfcGtt2etHrZvoD6bMZJz3Ky9LM/pYKUeSfx/qmwUGYOcQBf4xC+RuINJPEvSBpW9UveeuZHFw7Y5OTRyn0aj/CUNqOmcnyzApvWtPPSOKmqkXp+zoLfp+ikBBFji5OLpf7XqiyUMur1pGb2gMa1lNIB9v/3HR8CT5iPxZoV5g/DE33FmEeCIX2HOgpXar9i82iyV3na0hDHkedI/89uBsar8hBCU7A2gg1PqqYafavY01elAFlqJ6um8fhcuy+mvsbVTho8CebDhOW/j4Jf0TbopCwKcF3r0aEF0cKtitPaP6PK21AnURlwbfN23wIj8YPmTGqWyJCJk
X-Exchange-RoutingPolicyChecked: YpvqQII3KxJgSQIrm5yBaqZx5TbgRL0vN/GFo4W5okSFht1zDTxFTzv2mj5L4KiICcQAegk8tpiJIWNI9Rfy8Vnuy16PQtF2nah5RXtvTvXmkiQSSPRVI3C1d3L9xmydtZ8C9YI30hmtih3mz2nb7UkKpJSfmolHY/12qEStaFPhlp1KGQ0z1wAqT0cu4scETCruPIaefWwWoGkrTIptH8/yNyzm6G+84nEQgBJROqrf9w9hwblJPzWfV2/9H1dxJj3jGhfSFBhPC9QwlBjVjhJ2GpnVwgtTtqNOYpUTPLr7/PTcP7h8fEpqN2EfJ3x1czsGSWSC91GerSHU+bAHfw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2026 14:46:54.6148
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 48a8629e-dcc3-459d-af6f-08df47de493b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000397B5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR10MB7552
X-Proofpoint-ORIG-GUID: hRT2fuV2f73x3yZXz4JY-oy5blkYtL0D
X-Authority-Analysis: v=2.4 cv=NeBzRGD4 c=1 sm=1 tr=0 ts=6b01aee2 cx=c_pps
 a=4V0jRqm32qvR0De7z9omKQ==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8 a=AlozGp8UGvTbKfocxfAA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIxMDA1OCBTYWx0ZWRfX3Q3HHnO7kYyV
 Pb+SbkPkLZthyGGyeeKe54XDgcteFhRf37QEuqM4k/HxxzfYPDTMBDPsaFh6TrLB+t6UAlsgzCf
 up2cM06fxhA0Uko+NuSecmMl8tZeT0wqfns9rbvZ6PqOWHjLF0cTfvQjdWZC2IS7172RxA2xj/9
 auOnPGCdohsd+TXSUjNrnZOpz1WFu/HEP4/Wztwzrv0pZNzko0uZ/5x9ReORhuo+uXvljicO07m
 vpIoehGv3Qcwt/AId4vvn0lN3xGUUXapNEboU88INP+AwLrcTtl1Lt98ueuU67Mdsr0banpnwZK
 os4cWsiD3+j/2vwPu0x+si2P/cu4lR7oB/8faPkZUxfb/wMLpNFjuW62uOhh2hpPbPczedgNCD6
 pSCoEJlHcFaE6kn/pI5wUsbH6viTGJh3C5+2YX/rJsbb2Z+doF/xdZuFAB6KD23jAm9LxxHQOBJ
 AyuGw4hlqvkerEw5jyg==
X-Proofpoint-GUID: hRT2fuV2f73x3yZXz4JY-oy5blkYtL0D
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIxMDA1OCBTYWx0ZWRfXwzKllGGK4XnD
 7bHWno3OeQTJh2NTUc8pBHHrJJTtT/z//Kv37QF9L1BRE5bNqbqpgYmJyKSXg1Cf9Knq683qFiJ
 T3Nh5GZPY2CMoUOiL9/PbmjrQtn4x8A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-21_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 adultscore=0 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611210058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_064816_417791_E0222E07 
X-CRM114-Status: GOOD (  11.81  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This patch series adds QoS support to the ICSSG PRUETH driver.
The first patch implements mqprio qdisc handling and TC offload hooks
so userspace can request TC mappings and queue counts.

It also integrates a driver-side mechanism to program the firmware
with the IET/FPE preemption mask and to kick the firmware verify state
machine when frame preemption is enabled. The second patch adds ethtool
perations for the MAC Merge (Frame Preemption) sublayer, exposing .get_mm,
.set_mm and .get_mm_stats so admins can view and change MAC Merge
parameters and retrieve preemption statistics.

v8: https://lore.kernel.org/all/20260915063052.2274986-1-m-malladi@ti.com/

MD Danish Anwar (2):
  net: ti: icssg-prueth: Add Frame Preemption MAC Merge support
  net: ti: icssg-prueth: Add ethtool ops for Frame Preemption MAC Merge

 drivers/net/ethernet/ti/Makefile              |   3 +-
 drivers/net/ethernet/ti/icssg/icssg_config.h  |   9 -
 drivers/net/ethernet/ti/icssg/icssg_ethtool.c | 127 ++++++-
 drivers/net/ethernet/ti/icssg/icssg_prueth.c  |  16 +-
 drivers/net/ethernet/ti/icssg/icssg_prueth.h  |  19 +-
 drivers/net/ethernet/ti/icssg/icssg_qos.c     | 328 ++++++++++++++++++
 drivers/net/ethernet/ti/icssg/icssg_qos.h     |  99 ++++++
 drivers/net/ethernet/ti/icssg/icssg_stats.h   |  86 +++--
 .../net/ethernet/ti/icssg/icssg_switch_map.h  |   5 +
 9 files changed, 633 insertions(+), 59 deletions(-)
 create mode 100644 drivers/net/ethernet/ti/icssg/icssg_qos.c
 create mode 100644 drivers/net/ethernet/ti/icssg/icssg_qos.h


base-commit: 2208ab00f4f213ade91ab775e7f8c4dacdcc856e
-- 
2.43.0


