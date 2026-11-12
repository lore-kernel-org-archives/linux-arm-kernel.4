Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D03D606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 09:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zewiJEBq;
	dkim=pass (2048-bit key, unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=eVTQ/9Uh;
	dkim=pass (1024-bit key, unprotected) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=sQyZ4Onv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=z9U9cRM+luBzD5j09d7PXAOZ8sbtB4ycDpj1jl36Hig=; b=zewiJEBqk5EFLvJ27GaPqI8Oev
	XMBx8xDNfGo0yLYzSET++D+tHmOcLWTSeCAq8OoRbJW70QIiNunCMVgsMlTQXGG1ZIdn/t82Klf63
	et8ixlyKy0kRlg7Vr4J+1vWJQSfdSVSvzga44n5d2ZW5LdILPeGI0Z0mSapROLepJKC8lZX0+Pdx5
	BHVAYGmsh3kFBJG3FxKJOKFoGq4rWhDRDK96VJpGQr2tES0blsr6Wmo55pKT7qNHRqv1FzgtKnhhh
	lXXLFFAPDJ4vn1O+AA1FSUOp54rQV53i6w2XACc9O6aEKWANT6lNLJc31V/hGgIpFdZjbFGTsiL7J
	3kzDe8PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQpw-00000009JAt-10E5;
	Thu, 12 Nov 2026 09:11:16 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQpn-00000009J5Z-1Iy6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 09:11:09 +0000
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6AC7kdJ93094835;
	Thu, 12 Nov 2026 03:11:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=z9U9cRM+luBzD5j09d7PXAOZ8sbtB4ycDpj1jl36H
	ig=; b=eVTQ/9Uh7UPhsmHI1424iFFpaVCT4rXEqlKnfdLrcFECKEbZXV7RoTg53
	yBYH+R1Qs1DlWkXR7CSOqAWPNnmFvohSDU2tkP5vUn2SfNiBJ45SoGHb2L3q70Pf
	LQTV8npmELvW/VMC1qcF6XO+PDmSh45aotgCOBQwd9s/C3Aau8cNdePygsU91IHD
	6C/CV3u0acujPAWAk9e23FEHeXrqglQaHJliichCayfBae8v65FHLKN8/ZzBvZC6
	0eNeLSEQoyjPJ3BYnwsdtBENhjN/GV2eEqQmXuddEUMmWBs2wYE6iwciyDuU7pI+
	l3eBx96KbhMUZrPGbBHwQCnlQ4hUw==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011016.outbound.protection.outlook.com [40.107.208.16])
	by m0384305.ppops.net (PPS) with ESMTPS id 4hw4cy2603-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 12 Nov 2026 03:11:04 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N4sCR4uVbE9hACGjHqjCx+fFuaHLdMtgAS3sJl+i0LD1Bo/nFR3A9jEvJPIoPOaaTyCJEPWrksNBFwfC4UZWDG4apgPeUh//mmmS48TIzxqOS1DnjXlxE7pnln6d9dYwVhIfeQR6wG0Rc15YUKHhAOyQl/4Q1s6kOb+3y1Tfusgy+PWiPP9u3PW8qxUx34qiNEBzFW8QCCyGifp0TWxcZiMYUya2W+V6rVJtr3xr/yI4GO+MB5bIpqBIGTQemtKJATPG5BK9Qish117Ve3ZNL961EDW7NoQnCz/wLz6D330FInBmIww0z0FkNWe4PwrZVpAjXnGubAeD9NvFpVh3Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z9U9cRM+luBzD5j09d7PXAOZ8sbtB4ycDpj1jl36Hig=;
 b=uuZ4I7R/4zVcME9Ts0uUlqoszw5abMFuz1ejcU2Rn+TCBPvGZvE+tADz08y8udCeeRO96ttwuisARIqVSKSzl3iDz/swBeVyhXmoaAuCK+Y5H/9kZMsCkdHxX6AMFxDDKTcUNWwMqT++Ps0iEeh8Z2hEabCVwR7PAcY8ESTTfAvtvu5XbXaAxCE+7AoX8vPmvPYiauujr1ZcvT0uEn9HuqW8MH2KPTYUl//Th3MuiwGoE1uYXgrEXObG4gCr0A0DtfqJ33WvteJAl3r6hCMcQQv+qFwU3cW8jDs2gfXLiXjbulRGOWrakeUC1dYlJvOF3BRoZBYn1XwEwNW3oSbntg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z9U9cRM+luBzD5j09d7PXAOZ8sbtB4ycDpj1jl36Hig=;
 b=sQyZ4Onv2FnrMUXhb7aLNQXuZ/EVCc2YCd0jqaWqZU/IQ9Pf0lWkA6XeT5UDrkrO5InsFH2qPBI7k78x1BZtYTXcDqyn3iYJj0sdEFQEXywTaLxdksu4D113GNIEhRrqxBZwaEYYCosjc5dzjSmUBDZFeeK0EBfFZ/i9UxgrUz4=
Received: from CY5PR19CA0043.namprd19.prod.outlook.com (2603:10b6:930:1a::33)
 by SN7PR10MB6978.namprd10.prod.outlook.com (2603:10b6:806:34d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Thu, 12 Nov
 2026 09:11:02 +0000
Received: from CY7PEPF000000F0.namprd05.prod.outlook.com
 (2603:10b6:930:1a:cafe::4f) by CY5PR19CA0043.outlook.office365.com
 (2603:10b6:930:1a::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Thu, 12
 Nov 2026 09:11:01 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CY7PEPF000000F0.mail.protection.outlook.com (10.167.247.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 12 Nov 2026 09:11:01 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 12 Nov
 2026 03:10:49 -0600
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 12 Nov
 2026 03:10:49 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 12 Nov 2026 03:10:49 -0600
Received: from moteen-ubuntu-desk.dhcp.ti.com (moteen-ubuntu-desk.dhcp.ti.com [10.24.50.20])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6AC9ARY11549289;
	Thu, 12 Nov 2026 03:10:44 -0600
From: Moteen Shah <m-shah@ti.com>
To: <conor+dt@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <nm@ti.com>, <ssantosh@kernel.org>
CC: <u-kumar1@ti.com>, <gehariprasath@ti.com>, <m-shah@ti.com>,
        <vigneshr@ti.com>, <afd@ti.com>, <a-limaye@ti.com>,
        <y-abhilashchandra@ti.com>, <johan@kernel.org>, <kees@kernel.org>,
        <jm@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v4 3/4] soc: ti: k3-socinfo: Export SoC registration helper
Date: Thu, 12 Nov 2026 14:40:26 +0530
Message-ID: <20261112091027.1601122-4-m-shah@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261112091027.1601122-1-m-shah@ti.com>
References: <20261112091027.1601122-1-m-shah@ti.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY7PEPF000000F0:EE_|SN7PR10MB6978:EE_
X-MS-Office365-Filtering-Correlation-Id: fc86d6c9-58bc-4009-2190-08df409cdf8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|82310400026|1800799024|376014|23010399003|22082099003|18002099003|261009221227099003|261009223027099003|3023799007|13003099007|261102130727099003|56012099006|261022113327099003|261102123227099003|261026140227099003|261021121427099003|261022105027099003|261028144727099003|10067099003|261026121527099003|261021123027099003;
X-Microsoft-Antispam-Message-Info: CMIVswF/kTt2h5O5ansWPIa99782vebQkHpsl8glqPfoeS1ycZQrombKFlEvdkhkHq/s8P4U0XjDmhpmouNgjn1rGNZKb8B59863ckGVBHPuFZlWttWBY3uYybqMlydIgwnR6KGyEpDRnXAnmA0i+cKwJ1KLGKdGiHLuRr0wABJarGTkGx3qwu704NIvykoPyK71cMQLAXV1NntCYk0NS2sXFaxgH7aerDPu0nFV2yTJ5BtfK3/yOGFqT8iAP8BmMJJ0YIeTbdqz6sPz1iZHwvuWx23/SEFr+JIjHHof/BUj0o14MzpADNK97lkQnQL92VUEstMCWoWF8ol8IXVM9rsUjt5L/K3vCfvgp8/JQ6q6Yr1ctIbh4Zj1QisPOfDBr99D0g4CwGDQTC078aPEspZakqCqGy/C7JyeOY3pjJAclLktdRqaE5OwNaOZE/V8qFDPKw7hkuNcBtbFjlZpdkG1Tmsv02Jwl6wWYNrmLoUlNPTHa2sQ2sKQQFvA2bgjvzUhCoC6FdzYuho5R45dogrqWobzeYfqvdO+kLKZ/+Wqn1pBkqHtGNfKCB3ECj4PaCytoh3+8d9s6tOvCzrlgDft748611AYQpRpjfGJPQFYCfHlrURprVjtWzsWOF4OZTSqdblryte93WKCihcgcw==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(23010399003)(22082099003)(18002099003)(261009221227099003)(261009223027099003)(3023799007)(13003099007)(261102130727099003)(56012099006)(261022113327099003)(261102123227099003)(261026140227099003)(261021121427099003)(261022105027099003)(261028144727099003)(10067099003)(261026121527099003)(261021123027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: DC1Rqs7o2sROBoo6dP4+RZx8uxGzpJUaA8ok1pUgoQqNnhfSuwg6J2Z2Bqs4UdTxuQLsKF6Q+zbQZBSx8o/AUEEP8NUQF3mi+zS0dNHNRtJfRUwsCXfLi/V49E238lyDuJ6IgdhLhE3slOTPlPItiCcFf+11T4hLpp2/d6yHdVkgcVw6BICGqPXerlXogJ/WtsBEj5qEavhVKJlH2CYq8Yal9cjHipas66mz96+Z+b4PKw22/7pW5wuYfmu/Xa7Feu0EEOtPDI0ESv5axZ37nv3QPfilo+6qshyS19G/wn5wBjr3K3VxbE2R+kKK5NXOvRcy+3k2pnZg63eKDbmCVKpnxKK8+N4luFwLQ1scjIDrBwgtzyH0eMzYIsbNWkVTAGvtKkOku2O9eavI2hMNfZ0OxLSbSJ61ritfszTsC4gjvDJ4Fo3zYPDqxUEmrxrp
X-Exchange-RoutingPolicyChecked: h3UBgc142Fhi6slYpNCZhP14OSrowgRhu+r0Is4FJk4rBQte3n2+x475QyPLZqkwIX+s2SC9YLC1cTdRr7rOWekGkBEoHQc43MMhXj5amB7Y1um5iAAqlAl5tnFBPL6h7tB6G9V+FvAJIBalWrg5jDP+7vrBEQJdX2DnMWX4JlCtx02tah1xl4zh+QE4T7Z9PDb7E62RF8MYIC8y1hgVOYTxwxvuFOIX1/U8rB2pgidC3Up3bpc/jiscprbfmgNA99NwNw2K4NZkfREDGY/PdLANO6WpcJDztBzs4BI54Vv4FYzsmQKYpOmtdbS/peiLhHQKcqr5hF74EUaUsUo+Bg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 09:11:01.8515
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc86d6c9-58bc-4009-2190-08df409cdf8b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CY7PEPF000000F0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6978
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzNiBTYWx0ZWRfX4jHxV9lAxRUR
 9g/dRJCgWb4d/tPFXURE7utx7yj+IEuAh4il/DdUgIZDB+j1AiISkTE9ouWzsbSR8icZnOFW8eh
 j1o1oF9TL0iVZbouGEm0mBW/YK5Pbp0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzNiBTYWx0ZWRfX1UlyWeJOpmRL
 +s9A2BsU5l836DvHhBlBTntu7zuV5JzzzovdwUPwa1Mz9g2DuxLn72bq54zwQTBl3oTiGwjB7/6
 Be/f8sOHAKjJTmn478yS6EJVJjNGcii5pmuJXywGbjp4Yf6nSXbeGWl6vDNLXLdpN2Ye17q5zai
 2YVadQXdzcTL/uoiQrBZ4SY0VWec5AoD23xf5KcWs7LMKZeIRw7mxklRw6u3zaW59goyAxeTDgW
 gCSkdTbvd+DpL8BT742zWjsS8tXM55eiK7URvo17WZC96iWeJcSNxFLH8Y9FAlS7R7MoFOEQN3E
 00NlucYPa9zNsexx46vm9yRHAPssjAwVVRWYxbamYU/hOux5dISi+kHVY12dku23eMxMPcJtyi5
 D+I2jh5WybxDNPs1bQP9rEBuhILrMqs9LK7qXsRBL7XpGOtmVlQmUfq/Yexvl4sY/iBApWjB4Iw
 /W75MYq5gEecGqb0KyA==
X-Proofpoint-ORIG-GUID: cZgD4iGk4P0arCF4PMR9jjDj6-MV97DO
X-Proofpoint-GUID: cZgD4iGk4P0arCF4PMR9jjDj6-MV97DO
X-Authority-Analysis: v=2.4 cv=asYnmiZV c=1 sm=1 tr=0 ts=6af582a8 cx=c_pps
 a=CJt2AWVwLbfAHulDA2arTw==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=MppJNvndz3xZZ7pgNAYA:9
 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120036
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_011107_598276_306B5732 
X-CRM114-Status: GOOD (  23.17  )
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

The k3-socinfo driver reads the JTAG ID through a dedicated MMIO region and
then decodes it and registers the SoC device.

Newer TI SoCs like TDA54 use a different path for accessing the JTAG ID
register, but the decoding of the JTAG ID into the SoC information remains
the same.

Split the decode and registration part out of k3_chipinfo_probe() into
k3_socinfo_register() and export it, so that other drivers can register the
SoC device once they have read the JTAG ID through their own access path.
The registration is managed by the calling device, so callers need no
unregister counterpart.

Signed-off-by: Moteen Shah <m-shah@ti.com>
---
Changes since v3:
- Add the missing k3-socinfo public header declaring k3_socinfo_register().

Changes since v2:
- Split out the devm related changes into a new patch (see PATCH 2/4).

 drivers/soc/ti/k3-socinfo.c       | 70 ++++++++++++++++++++-----------
 include/linux/soc/ti/k3-socinfo.h | 11 +++++
 2 files changed, 57 insertions(+), 24 deletions(-)
 create mode 100644 include/linux/soc/ti/k3-socinfo.h

diff --git a/drivers/soc/ti/k3-socinfo.c b/drivers/soc/ti/k3-socinfo.c
index e21a2cd14c811..bf0829fb1d61c 100644
--- a/drivers/soc/ti/k3-socinfo.c
+++ b/drivers/soc/ti/k3-socinfo.c
@@ -5,6 +5,8 @@
  * Copyright (C) 2020 Texas Instruments Incorporated - http://www.ti.com
  */
 
+#include <linux/device.h>
+#include <linux/export.h>
 #include <linux/mfd/syscon.h>
 #include <linux/nvmem-consumer.h>
 #include <linux/of.h>
@@ -12,6 +14,7 @@
 #include <linux/regmap.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
+#include <linux/soc/ti/k3-socinfo.h>
 #include <linux/string.h>
 #include <linux/sys_soc.h>
 
@@ -152,43 +155,32 @@ k3_chipinfo_variant_to_sr(struct device *dev, unsigned int partno,
 	return -ENODEV;
 }
 
-static const struct regmap_config k3_chipinfo_regmap_cfg = {
-	.reg_bits = 32,
-	.val_bits = 32,
-	.reg_stride = 4,
-};
-
 static void k3_chipinfo_unregister(void *data)
 {
 	soc_device_unregister(data);
 }
 
-static int k3_chipinfo_probe(struct platform_device *pdev)
+/**
+ * k3_socinfo_register() - Decode a JTAG ID and register the SoC device
+ * @dev: device on whose behalf the SoC device is registered
+ * @jtag_id: raw JTAG ID register value read by the caller
+ *
+ * The registration is managed by @dev: the SoC device is unregistered and its
+ * attributes are released automatically when @dev is unbound, so callers need
+ * no matching unregister call.
+ *
+ * Return: 0 on success, negative errno on failure.
+ */
+int k3_socinfo_register(struct device *dev, u32 jtag_id)
 {
-	struct device_node *node = pdev->dev.of_node;
+	struct device_node *node;
 	struct soc_device_attribute *soc_dev_attr;
-	struct device *dev = &pdev->dev;
 	struct soc_device *soc_dev;
-	struct regmap *regmap;
-	void __iomem *base;
 	u32 partno_id;
 	u32 variant;
-	u32 jtag_id;
 	u32 mfg;
 	int ret;
 
-	base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(base))
-		return PTR_ERR(base);
-
-	regmap = devm_regmap_init_mmio(dev, base, &k3_chipinfo_regmap_cfg);
-	if (IS_ERR(regmap))
-		return PTR_ERR(regmap);
-
-	ret = regmap_read(regmap, CTRLMMR_WKUP_JTAGID_REG, &jtag_id);
-	if (ret < 0)
-		return ret;
-
 	mfg = (jtag_id & CTRLMMR_WKUP_JTAGID_MFG_MASK) >>
 	       CTRLMMR_WKUP_JTAGID_MFG_SHIFT;
 
@@ -237,6 +229,36 @@ static int k3_chipinfo_probe(struct platform_device *pdev)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(k3_socinfo_register);
+
+static const struct regmap_config k3_chipinfo_regmap_cfg = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+};
+
+static int k3_chipinfo_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct regmap *regmap;
+	void __iomem *base;
+	u32 jtag_id;
+	int ret;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	regmap = devm_regmap_init_mmio(dev, base, &k3_chipinfo_regmap_cfg);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	ret = regmap_read(regmap, CTRLMMR_WKUP_JTAGID_REG, &jtag_id);
+	if (ret < 0)
+		return ret;
+
+	return k3_socinfo_register(dev, jtag_id);
+}
 
 static const struct of_device_id k3_chipinfo_of_match[] = {
 	{ .compatible = "ti,am654-chipid", },
diff --git a/include/linux/soc/ti/k3-socinfo.h b/include/linux/soc/ti/k3-socinfo.h
new file mode 100644
index 0000000000000..487e69d0069d1
--- /dev/null
+++ b/include/linux/soc/ti/k3-socinfo.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __LINUX_SOC_TI_K3_SOCINFO_H__
+#define __LINUX_SOC_TI_K3_SOCINFO_H__
+
+#include <linux/types.h>
+
+struct device;
+
+int k3_socinfo_register(struct device *dev, u32 jtag_id);
+
+#endif /* __LINUX_SOC_TI_K3_SOCINFO_H__ */
-- 
2.34.1


