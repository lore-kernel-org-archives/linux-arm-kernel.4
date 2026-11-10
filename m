Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A8360A2603
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 12:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DHpSdjEz;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=GmAXPtTx;
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=pnn3+wRj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=OKX0R9uRaeU6rm5xTyg87v9nl9FNTIScdmIsE2d9cH8=; b=DHpSdjEzE/HDm22EB26483We1a
	IIVOsPpNOCb3DYwQiA+4ZxuvdNzJCySlreVZmw6HS8++uRDFGYLYy/EqNo3u4yIyFOKO7SEJB5v/M
	d/kkT5ClPzsSinNNndM6l043POounxC1WFjR44lCRJ5824vXMrzVlhhfb50D0fYIzZu/UQGFopn4v
	0Rb35k7EDMtc/dU0CERF3azQSDuk5ZyFEA9tCybV0Zo+nj0bTdy8oDvQyaiotj1AqYVIice/s99Hw
	61ATiKurhfwEzMF5oVOp1B41IPQjksHlKYSw3Bwd60Ql650hKbWRFDFcHYD5RCMb7ESvCHpnwWTgP
	RCXNgGxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQkxG-00000003qXJ-1TGn;
	Tue, 10 Nov 2026 12:28:02 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQkx3-00000003qQ7-1V8b
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 12:27:52 +0000
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAB9hgm1180527;
	Tue, 10 Nov 2026 06:27:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=OKX0R9uRaeU6rm5xTyg87v9nl9FNTIScdmIsE2d9c
	H8=; b=GmAXPtTxCuymV5wbGMz7y0s3mzS+/IxQmqq+oynFjKlAnmFXDFb2qn5WD
	uFl/MvJT3dfqyUbyq2ZZkSMqzeJzyaCzwlZPhCrvddTDelWIraHo8dmeiNf+6xwI
	7ZA9aPOR0Jy/x1ipXrE30nmeaBDuW2cWhf1Ossuv+XgnBYS5vUq8zONiEK7mcqaH
	A1QEd56KJgS+J6Vp1O1TMpzZUVwRC47Odq9ubq6Ij2/qKDkEEDwDBMbkQGUcf8+3
	ZabxlEqgsYASb+/A4attJUNAgs1+dJK/neJF1OjNKA4jyahkdmj4tAoSo5sOEIyX
	zYD3oeqkm3CRek5cNl5bBZeTzoeOg==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013016.outbound.protection.outlook.com [40.93.201.16])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hv0ksrrtp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 10 Nov 2026 06:27:41 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zh4hbiWvoIq8FlCgy6lEuOSGOnJ/Op2S/9fCDzLZNR7MilkvPk9K7XHIsIapnPIyktkXzYankqmZ/x8PaLPQmrawNvoRAWk6CSYeZMr4Vj0DN2vfBWYN6M99pdNIc4A7wKbxjkZoGKpYuU4I9ooZgPyWKyMo04rQz84vJD4/N7I51belQTvc6nOnBGYJ+6jrrAj8V7MayMJW3yF1XiaMc0WDidx2ch6sQmDiYDsp6rly+q2RwvJyNMaqsmY+QHtGam3POEh/IY6Ui/OuTELFBq3WMBbgWfaLYuqJ6uotsFOtnLi5WqW+tvwBlhSSmgvnBCJ3VDJiEWJX6lWhwMjuJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OKX0R9uRaeU6rm5xTyg87v9nl9FNTIScdmIsE2d9cH8=;
 b=ICvPPTz2OTWbnR3vpal24S7xVqldN5LSbQhmC1MXOdHMkRD4xWQiwBsWdLI7Mq8OK5KPOB5tzuh4DxpuNWDon4+n+RfRXXsAd4dJ7Lq+aQYoxBr7GCDUN/ZzkQsG+SHw9Q9EkMe9teT9QpOsf6cjm9kx/y03yMNgoADOmlOnHmtcpaFoHn2R1KSKWLCJtucE5SwfSaF+nI8dFTUopy4dIBF8gvTyjC06aSqGb+JOGHn35hSR3kh8jU/YJx/jZGRYj3AHZ47yiTNEcBaBWF8l6Z4H9uOy0LoKk7H3Aj6+nDX3fhlm3DkHiSEjYf7/Lmb041XrR3UT362wfJQ2p+qkYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=siemens.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OKX0R9uRaeU6rm5xTyg87v9nl9FNTIScdmIsE2d9cH8=;
 b=pnn3+wRj7k0AOw8/4GZSfiQqKOss0niXcziJZIBBaLbAW8xW4cCFSlU2YJGmVEVBYLdVxoXNNUzbikrsyiHgdN8ohpwQ6uOHb+vAn4qoWkWl6TY39MdrqM7zLDGT3P97hpxKemQkhv+qpWqvpwksFy6ww717+vczB9Ey/o7E7m8=
Received: from CH0PR03CA0368.namprd03.prod.outlook.com (2603:10b6:610:119::17)
 by DS7PR10MB5040.namprd10.prod.outlook.com (2603:10b6:5:3b0::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 12:27:37 +0000
Received: from BN2PEPF000055DA.namprd21.prod.outlook.com
 (2603:10b6:610:119:cafe::39) by CH0PR03CA0368.outlook.office365.com
 (2603:10b6:610:119::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Tue, 10
 Nov 2026 12:27:37 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN2PEPF000055DA.mail.protection.outlook.com (10.167.245.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.0 via Frontend Transport; Tue, 10 Nov 2026 12:27:36 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 10 Nov
 2026 06:27:08 -0600
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 10 Nov
 2026 06:27:08 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 10 Nov 2026 06:27:08 -0600
Received: from lelv0854.itg.ti.com (lelv0854.itg.ti.com [10.181.64.140])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6AACR8nj1194874;
	Tue, 10 Nov 2026 06:27:08 -0600
Received: from localhost (meghana.dhcp.ti.com [172.24.231.93] (may be forged))
	by lelv0854.itg.ti.com (8.14.7/8.14.7) with ESMTP id 6AACR6GA003464;
	Tue, 10 Nov 2026 06:27:07 -0600
From: Meghana Malladi <m-malladi@ti.com>
To: <diogo.ivo@siemens.com>, <philippe.schenker@impulsing.ch>,
        <haokexin@gmail.com>, <devnexen@gmail.com>, <horms@kernel.org>,
        <jacob.e.keller@intel.com>, <m-malladi@ti.com>, <pabeni@redhat.com>,
        <kuba@kernel.org>, <edumazet@kernel.org>, <davem@davemloft.net>,
        <andrew+netdev@lunn.ch>
CC: <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>, <danishanwar@ti.com>
Subject: [PATCH net v3 1/3] net: ti: icssg-prueth: Fix TX timestamp cleanup crash
Date: Tue, 10 Nov 2026 17:56:59 +0530
Message-ID: <20261110122700.1849634-2-m-malladi@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110122700.1849634-1-m-malladi@ti.com>
References: <20261110122700.1849634-1-m-malladi@ti.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DA:EE_|DS7PR10MB5040:EE_
X-MS-Office365-Filtering-Correlation-Id: 11b0dbb7-9d6e-40bd-b95b-08df3f2600a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|1800799024|23010399003|376014|7416014|56012099006|921020|18002099003|22082099003|6133799003|10067099003|261009223027099003|261102130727099003|261102123227099003|261026121527099003|261021123027099003|261021121427099003|261022075727099003;
X-Microsoft-Antispam-Message-Info: vbxB2PpVQzB1/i0EGYhFMDsIlLv5ktlVYXE0vsaLTtA1QWFXgKngKWm/7VSyCbsdwqEQcZ8Z76ZPjmHTi5GzZuypPyFoPzRlGsh20tFfSGKOzFN+JkKWGe74iJrBkLmb25b6p3LsFwL1C6QUizzyueJw97NwT6pI9X8PRIpYVbS3cTvH4CjuLuF6zuadi2l2/1azK+sJK7D8/38ddvEdyjR9oYQ9XqdVsfcm0b+bGbte5rvoXnCBYxwbYShbEe9yOVZ9tWBLson3PJZi9XxED16EvyEXR1rXg3J/sDydLCmuFMHY1vJczRSWexthPe63igjz786e6HEUhf0YAPZjU6/5/nQheV1TrpJaZvFYLgPjvEPFzmErPhCH2wfie2IXec3ttiDJM5S80p7Hj/o4lJgzOKjzwqF/K/+VSTJfu2u86YIX4vmhhqTBW4u3DO2l68KWsoXYsSz+Ij8DDlZfM+07TBmgPfhSUImZGAjnIoRwN7Hpx/Pt9spPWkPa3LcHM/WrBH2kE99QfSaYod61Yak72BN1rSk2Wc4+S2hMBX842Sk5mBPjzcd+U+DhxUShznqnIHAfUXUGdWB/3aEcOAw3kUCQ/SwZkELjBD+NEdlVbQDzxSVB7tJ1X5lS+GIa/FM4L+8XsDyF1w7SspsI08aWNYCzV4MRs2yBvyzI1Oo01ew3eEph8R3npLCH4yBd6X2SkD0ehFlv1sxvTTSsy+pq3a55UYycBb6314Ile9XqEOoUiwA8xxPGlBzWYeMY
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(23010399003)(376014)(7416014)(56012099006)(921020)(18002099003)(22082099003)(6133799003)(10067099003)(261009223027099003)(261102130727099003)(261102123227099003)(261026121527099003)(261021123027099003)(261021121427099003)(261022075727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: rN8FBtj7aqp5Fgle2Kqp9AU+9yfnDGXeqn98SnfifOcOXz/s8UU0feq1BSJz4F+dcVmFATmMuCgH8A3Cp1V6eGqhWd7wCG8LjNDTb+T0N5goYOD3/Ys2QnQM3dRmsAXFWTfgyWaMNMDsBx21pbf1fiwk8ovkLc9kG9MQR9URyuj6Uf/p4384153jkQgPCu9Gv+kjhadzX2egNOF51n2eKpygBtMKpjo3vjzC6+Sv2u/Ny2aoItI1SU2MI2j6McvuGamfEawMANcNdmAspVzS6L8MPJNfiA3oMWRSz6u4l2Yaxoufjc2S8lu0qCr9dp8QjJB2obWWHA1qrtvaXkGMq9y2dDR4oCCGqyUC3VOnqHxbt2GBrw1CELHVY6SUWijhMIAHPjfnAwHFHgxH84zAfsMTWdAE5gLRexRro4nqbv8E8+34Tweb/RdN+Xvcpftt
X-Exchange-RoutingPolicyChecked: ZaVc96XobQKpaM68ze0CcxnM6izmlSdxKNsWOLtUPBtb6MqKJaehFxmE4KgZZ1actbx7x3AwoYE28MoKhIfvrB0b7yCrOQF+GQKgRME59bLc1aQaLD3AC53CdqIp3I0Tz3t5eJG5wpLN5V+84VKFWhI+zARRavNXlOcS8romVNzC3mztedawXQJRec8AeEMNNolf5PXZ5ob/LrbKGAGGuWfXq7nDm8TCHBr0irwOgIssmqjI2x7xf+5mqwSCe5Hgq/erDe/bscfU2j/8titog8U/RcbdaoxWSWJQFvYoi+BVONToY2tS6VlWgMg+jx9+gd76bI8JFDgZZf+8aRYy9Q==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 12:27:36.0569
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 11b0dbb7-9d6e-40bd-b95b-08df3f2600a0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000055DA.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5040
X-Proofpoint-ORIG-GUID: y26jBqG05ybWldbROGjU_5VwvsKqUZuZ
X-Authority-Analysis: v=2.4 cv=bcH+w+PB c=1 sm=1 tr=0 ts=6af30dbd cx=c_pps
 a=YOgfsySBG6Gh3lLixmEA+w==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=sozttTNsAAAA:8 a=pnYs4th0mlcjFpja-eoA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA0OSBTYWx0ZWRfX58a04wujO5Up
 VEoQa914YEzX6LBc0KXXQKCqdjgg4p2ZvZ3K52E1KR7VzF5tv9EKWkyvhMPvQfe7vn0/Mk3n3AZ
 kqCdwFZ+jnKdyyTRbTTRQ+Pduh58Qs9Y8a7+hEITsxKAjFbxE7XEgxv1r/vmvz6PaTLJhHrsHET
 AgF35MdfScdwSw0cdymIsv5YpxeXPbICBfoHbbAYNxH224o3NRkQ+vuNRxDvIr0EKzMxoBhQLh4
 aTHmfGkdnki0HWB90/ZkWMZShmhrGmeJ4hEMI9PTGmwHPQD02WMJv4362LKA7zk/l/tik2KlR6D
 Sb9Ko2JZ8hYOlFkr7vbYj3ZAsrNSvn7I78pkijc3EvhPSVFx0jlRw6fa+HUbnQin97WPK9jwLtU
 MYVlC/qd/yq7ClSqyWl1jamgSo6xQoGhjzNRkkuwXE3IiP0Z9h1X4tZ0ep4ZDzaLQuFxbBA69ND
 utDnDZzzqXlLPmPY5YA==
X-Proofpoint-GUID: y26jBqG05ybWldbROGjU_5VwvsKqUZuZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA0OSBTYWx0ZWRfXx/QeVHuHFlbo
 dBB4PmYGXrMXl3OomPffN6kZqi/g9YesdDKQ/5ElTV2buicIqPnM55rXWxAcLlJVuxis07y9DwE
 4AUGJptdEsnmHASB76vEeakiRJ+pWQs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0 adultscore=0 priorityscore=1501 spamscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_042749_543613_068C4ECA 
X-CRM114-Status: GOOD (  14.98  )
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

prueth_cleanup_tx_ts() incorrectly frees ERR_PTR(-EBUSY) slots. The TX
path reserves slots with ERR_PTR(-EBUSY) before storing the real skb
pointer. Use IS_ERR_OR_NULL() to skip these reserved slots during
cleanup, preventing NULL pointer dereference and freeing errors.

Fixes: e2dc7bfd677fc ("net: ti: icssg-prueth: Move common functions into a separate file")
Signed-off-by: Meghana Malladi <m-malladi@ti.com>
---

Changes from v2(v3-v2):
- Added this commit in the series which fixes the pre-existing issues
  flagged by sashiko

 drivers/net/ethernet/ti/icssg/icssg_common.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/ti/icssg/icssg_common.c b/drivers/net/ethernet/ti/icssg/icssg_common.c
index 4a7d1a6f470b..8cb2ad2ebece 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_common.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_common.c
@@ -1426,10 +1426,13 @@ void prueth_cleanup_tx_ts(struct prueth_emac *emac)
 	int i;
 
 	for (i = 0; i < PRUETH_MAX_TX_TS_REQUESTS; i++) {
-		if (emac->tx_ts_skb[i]) {
+		/* Slot may hold ERR_PTR(-EBUSY) if the TX path reserved it
+		 * but has not yet stored the real skb pointer.  Skip the free
+		 * but still clear the slot so it can be reused.
+		 */
+		if (!IS_ERR_OR_NULL(emac->tx_ts_skb[i]))
 			dev_kfree_skb_any(emac->tx_ts_skb[i]);
-			emac->tx_ts_skb[i] = NULL;
-		}
+		emac->tx_ts_skb[i] = NULL;
 	}
 }
 EXPORT_SYMBOL_GPL(prueth_cleanup_tx_ts);
-- 
2.43.0


