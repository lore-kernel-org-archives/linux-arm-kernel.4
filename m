Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7102606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 15:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Tu2TaNDs;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=a3ZeiawL;
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=JLwwaHKa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=gFa5jqHCdNLX5vQDwELQu+Fq5rGbFbsF6JEyF0tAFTo=; b=Tu2TaNDsvqjIsm
	MJD4jMMUAM/R2hlBb9iv1KCpVNy6rkSDTFZewuTTDz75NjX/0VDa8fnx2OJSyDM5dYIdja3KmcuOq
	GodEbFkDAnISlLWo+IhH1Le3qOUWHY5eZTVtN+5Jqa3RPgtz9y9krN+ZPSiyzLbSBCtl2mEMTHkbF
	PjWk22fLJ5/zJnL16aUlPT+JQuPeYPhCvSRcjhgECww1aj7MxxzuOUOQsAJFmAC2J47A0lFRB2QqE
	KKjNdisf09uJQkWpRmyDf8xsI0lx6H01o7O2dQfwG3zanng8O8OyxSWa+qnmgf6lBlTLXMm0h2XS/
	xSPtEO8T8mbet1sYfDbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUmhI-0000000HN4i-1QK7;
	Sat, 21 Nov 2026 15:08:12 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUmhF-0000000HN4N-0b8c
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 15:08:10 +0000
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6ALCFBKq2948666;
	Sat, 21 Nov 2026 09:08:01 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=gFa5jqHCdNLX5vQDwELQu+Fq5rGbFbsF6JEyF0tAF
	To=; b=a3ZeiawLECfeJbOGAR8tlzvrTyyenGFH6+bXwwjhJfQ6qn1p/a/+cEBKP
	cwPUwHkmYUnWxin2F1hF32IzNURXagMgJV/VeaXFqK3eMHYOmEBV1wC1qpZYlL6N
	nlPn2hBKnL/NVVXshlt2Qm5B+hdm5HfMLjDrKe1hkW/MDZsvAOau/YYL3LUgzD+x
	3pSDy61kohEs90t8MiVSVysohibpWj8iBnXI4SoMej+x1NemM6n4iuDh5kuvh2G6
	qcppe+Vd51joU9/zGXNnbxBeEGwpg4IcdnPLXRXJ5REgIQeTvFWu/ZSQ038J2jMM
	rkT0VjrDF/4T2Z3UyD1R/10qzbp9Q==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013031.outbound.protection.outlook.com [40.93.201.31])
	by m0384305.ppops.net (PPS) with ESMTPS id 4j2k2cq1yn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 21 Nov 2026 09:08:01 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rl8S+LKQBKJeC2a8HnWlgISpHcmQqscHpx85Mke5yuA/x3RdT7mo1lqsZOHg2QzAegSQ6Crn0yEddm8vRhrKk2nsOaqsnSR25bQy5nCk2Aa3PIUKFuuGVx9h8cgV61tIUfrzhufw2VrCbpPmGv38kFP4R5RUNY955S19ONcTdRVp9Uc86B9ykVGduAhPKD3Gdf0BM3DFkNpw62v42i/8j2pb4C/pt7LtyXbQdIi/M2Vy+1hY974CemTIidNGolFu69e284JypNO5FX68x/on61dJoInx2tw42ThivrnW3FIZdgW8+IO2g0qKbO3kw2uxnwRkMHyfU6IPCOOooSZZNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gFa5jqHCdNLX5vQDwELQu+Fq5rGbFbsF6JEyF0tAFTo=;
 b=FSLNVk/NKpzzOcFzSomdKujy+Lp/12RtldDLxNEa4q1SClb0EUyvBcpZ8X+FiFPx5gP7zMF8r0JaQp62w99e0PqH/XsXtM/XVCoCBwsffX4TgiJf2ZcJjXiWwhemNkqlV20pih1KF+22tlhkG5Qd/AFQZrHQ3T8ZcPztnBHCKKmnM7Y3wSXqmt07fzoUm0kh8y4GUyeWPAvwnt1gRtQePcuzIktA8VaEeZBQPu/c7uSHX3JpOmA5DMOinXjRFQrttdn6mg/atgmxPS5HyfefyvwBe08smz/aj7+mdXvCvfy/PWDk5FwFmT1xQsKwARMKIPdNQSRElBOSmfJYFhXO/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gFa5jqHCdNLX5vQDwELQu+Fq5rGbFbsF6JEyF0tAFTo=;
 b=JLwwaHKajh3sYeiOaA06lrHgbeb7K7PWAPf4ghyQlCLfJa5GUypEE1myyKEz/EG8suH3Xq5x647ERf1JS7FdvWEFJLbuewtBhH3ZFjASeVMJYJGUEqJlXFJfJeTg4Zj4mfDjfCNh3n6Blt94K3i7mAwCxjiAMFYgmbRMEgTpGLk=
Received: from CH0P221CA0004.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11c::14)
 by BY5PR10MB4324.namprd10.prod.outlook.com (2603:10b6:a03:205::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Sat, 21 Nov
 2026 15:07:57 +0000
Received: from BN3PEPF00022BC9.namprd05.prod.outlook.com
 (2603:10b6:610:11c:cafe::30) by CH0P221CA0004.outlook.office365.com
 (2603:10b6:610:11c::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.12 via Frontend Transport; Sat,
 21 Nov 2026 15:07:56 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN3PEPF00022BC9.mail.protection.outlook.com (10.167.248.218) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Sat, 21 Nov 2026 15:07:56 +0000
Received: from DLEE203.ent.ti.com (157.170.170.78) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sat, 21 Nov
 2026 09:07:40 -0600
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sat, 21 Nov
 2026 09:07:40 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Sat, 21 Nov 2026 09:07:40 -0600
Received: from [172.24.231.93] (meghana.dhcp.ti.com [172.24.231.93] (may be forged))
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6ALF7ZLV042690;
	Sat, 21 Nov 2026 09:07:36 -0600
Message-ID: <c2167ce6-45da-4868-9212-db4811282e66@ti.com>
Date: Sat, 21 Nov 2026 20:37:34 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v3 RESEND 0/3] Fix switch mode for offload and
 non-offload cases
To: Jakub Kicinski <kuba@kernel.org>
CC: <diogo.ivo@siemens.com>, <haokexin@gmail.com>,
        <philippe.schenker@impulsing.ch>, <devnexen@gmail.com>,
        <horms@kernel.org>, <jacob.e.keller@intel.com>, <pabeni@redhat.com>,
        <edumazet@kernel.org>, <davem@davemloft.net>, <andrew+netdev@lunn.ch>,
        <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Vignesh Raghavendra
	<vigneshr@ti.com>, <danishanwar@ti.com>
References: <20261112102140.2744508-1-m-malladi@ti.com>
 <20261119164407.1d2b3fa2@kernel.org>
Content-Language: en-US
From: Meghana Malladi <m-malladi@ti.com>
In-Reply-To: <20261119164407.1d2b3fa2@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BC9:EE_|BY5PR10MB4324:EE_
X-MS-Office365-Filtering-Correlation-Id: ce417880-4f74-4f3c-08a5-08df47e13928
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|376014|7416014|36860700016|23010399003|18002099003|22082099003|3023799007|13003099007|261021121427099003|261022105027099003|261022075727099003|261026140227099003|261026121527099003|261028144727099003|56012099006|10067099003|4143699003|261102123227099003;
X-Microsoft-Antispam-Message-Info: wJyQRM9EYeGT3YDaA3bs6+Wpw0ik2kyH+wAGXJo5BxlYvq/7UX2KsgDvNSgCavwZhFDKRbK/TeNwV+71ddqRaYNy4I73aUO1ReYGhV9lJ6uw5JczQ0K55EroNxQD8qIDR7xVxcRnS1tooUzyEiu8m/Iw5JzVKBrXKJgU3yTNam4o75ImSLMqTrtnzFLoW879Sbor+kXjidjnlRoimWhIgWj9YkaZo2NuXmvSBqZRw6qlcexL9paRSiWJlmSNF5yWH4qS0Ag35DM05vWdAX670zPcv3wY0dHro8RcU9aWpatwtW8VCE0FPLaK59CpP/08LeCAn+0g/7qftxabl5hO9bze/7M6r5LRaArJ5dQdCVD/X2pC/grfPHsjOMla9B/b7De4JycrQDN6IZXGssTiCTqhZuyHf3XmLhWheuWYfeIVzt46VjP9W2MJ68H1jfgFuJ8mxVw4hW7gDdFRFiIT5Ro93XX8n0n5yerSWHLEKuFuJFXm6Sya+fNrljoMMORaH1cOA55wzJ9DC1iVOFsHwhHMmAou07VVIwjWJH6ltv2BqiM1+684KmsbK5+Ha2IeYUK50N8SpE6fs11vPDqyAGIZoURq6ORuW5TF2lmd4JgsRtCrdx4Qgk499m2NfL0I+JCE+y3ycb9YwjgHNNNKxz54oFIRDqe6MXq2A1Wcv3Q=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(7416014)(36860700016)(23010399003)(18002099003)(22082099003)(3023799007)(13003099007)(261021121427099003)(261022105027099003)(261022075727099003)(261026140227099003)(261026121527099003)(261028144727099003)(56012099006)(10067099003)(4143699003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: qgG/GY7+tVEkAmZs6srGiQIAN8t+h7BXXCAfWyEIchDW5CIVdX3dzcnDGRz/zxqxOttM+8MKBlXLuqjANQaQ0hSSLQONXDBEl/qzSMMUVYDFT6S6xEA30thl26LMYCVrnM9UWLe/IDIaylw+xM1b/2niSPA7KWh+hgDlxEM+aWt99yt2PiQp6lDBtXbpDhknKub7/gRtpjXzvYYlS0jFnj/N4t42sy4/Czxs0WHgNeL+cPsaGcniudFpGE09vF79bwonkN4NWAyLwP1edrlvHxSIKVcFrGSSIlwhDOekD57ZXMqLqI9EyvJdIcwJuyFvDl4Ztnmj2r9rzZnfukpuwkeiyzQsfnVZh8lXh1O6eGwD1LiFZbBxIu+L+L4sSScjYp0UqP36Szntt/mGbrpGpAb+ej4FW4JNPw7qJub9T6TzMROnu3TpqxiNaPfQQtW/
X-Exchange-RoutingPolicyChecked: O9Enozg9D+9BDbcuv9+MwwSa+X3iqE0ZxqkhDtwIjT/AkaTyi5L9RYEfKKDcokdCyartNONFCEJElpImdmVZILk6NFvBTePGYi+izXrVetOInz2cnaj9GTS7utUekBji8xanXzxlHDyO2BKXNfIzyRBq20iroJOZ4q/ijgNrbXKFZ6Pf+v85MuUKglVKGMYNXSQdIR/jt1QIggJ0Z3S3U9EvFGQxT2v5swhXKRH7nEX+CUMZrrDz69iZUPYFvuzUlfHdHwG4qAtwnfu3cyDaPz7ZiaCRBudQWG+5pbx/+kkw24Pqy3C/vL1kXsKmjSzUl8STm2mtoK6W4NukCBHMxw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2026 15:07:56.0883
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce417880-4f74-4f3c-08a5-08df47e13928
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF00022BC9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4324
X-Authority-Analysis: v=2.4 cv=NYZzRGD4 c=1 sm=1 tr=0 ts=6b01b3d1 cx=c_pps
 a=7NCjPUurWbS4kF9YcBnZ4Q==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s63m1ICgrNkA:10 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22 a=VwQbUJbxAAAA:8
 a=sozttTNsAAAA:8 a=PCyyhxtqQNMI83KdRLoA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIxMDA2MCBTYWx0ZWRfX4qlTSLrM1ICS
 RJ+DeJkNrQJuGPDrvu0Mqpd6GPhGuJ9JCU2zX4bIv1J+peblQgBSJe6YKq3SJPWkMWt3oj6rltG
 edg3lwxqk1r6yiJDOVhL6LUeMoVb9sJmgqnwv4PvbhjFv5qBFEDzwQJXcNMBq2LrSPnYXPIwLyO
 0kNo1G+Y1Z8BeFXkQxieH7zeU1+iIn6fu1soBQXuCYkvxZFcybYEmKdevyRoCb9ssgIH30D0uup
 f719TXhKekV8ngQgafDqdpFzzUSrVRLot5QvwDbwbQIUjhfGmluvxMLS0Li7BO+nHMZdNIJ/Jbj
 1uBI8NyIwAlv/kzsCPqyhW/8LqqD9t/JUdKwVBwM+8lDpaQWtEFgCIxEGhe+zImweqir6uZ2JQg
 iV2MPALR9WSFCh3GLz5VobQIvw9GWekzM6vGWEqPlvNN5LCRh+usgE3Lf2NcQy572czSb4eLd1q
 OQ2Mhper6PdnaMzH7vw==
X-Proofpoint-ORIG-GUID: OWGJuJCY-_3eSaTOJFysYmDGHzsgmp4K
X-Proofpoint-GUID: OWGJuJCY-_3eSaTOJFysYmDGHzsgmp4K
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIxMDA2MCBTYWx0ZWRfX2WwM1nr9B/8l
 DMRkoCRE3v2+QN8eLSRQd6Mf/XAIC/8cYER5kk5RDnIA0DEo5KFDHJe8Vs/HKV+61352VN/V5uj
 bZ/0IXuW1tmRtfvwIfgmbfVGlU41fug=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-21_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 phishscore=0 spamscore=0 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611210060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_070809_195299_DF9EB094 
X-CRM114-Status: GOOD (  12.59  )
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Jakub,

On 11/20/26 06:14, Jakub Kicinski wrote:
> On Thu, 12 Nov 2026 15:51:37 +0530 Meghana Malladi wrote:
>> v2: https://lore.kernel.org/all/20261027131732.3411403-1-m-malladi@ti.com/
> 
> What changed in v3? When was v3 posted (since this is a repost?)

I first posted v3 on November 10 and resent the full series on

November 12. Here's the original cover letter:



https://lore.kernel.org/all/20261110122700.1849634-1-m-malladi@ti.com/

I reposted because I lately realized patch 3/3 was missing (could me 
mail server glitch)

I included the v2-to-v3 changes in the individual patch notes. Here's 
the summary for the series:
* Patch 1/3 adds a TX timestamp cleanup fix so reserved ERR_PTR(-EBUSY)

   slots are cleared without attempting to free them as skbs.

* Patch 2/3 changes the R30 race fix to stop and restart phylib around

   the PRU firmware restart, so emac_adjust_link() cannot issue R30

   commands while the firmware is stopped.

* Patch 3/3 records the UC/MC flooding flags before issuing the firmware

   commands and restores the flooding state after firmware restarts on

   bridge and HSR unlink. It also carries the NULL emac check from v2.

> You are expected to reply to the sashiko review, even if just
> to confirm that it's correct.

Yes, got it. Some series specifically ask for it and some don't. So it 
slipped my mind while posting. I will keep that in mind for my upcoming 
patches.

Thanks,
Meghana

