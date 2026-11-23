Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95CB4606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 12:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vjtpAvlj;
	dkim=pass (2048-bit key, unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=UR+TrsHD;
	dkim=pass (1024-bit key, unprotected) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=hiFjyqMY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=gsNa9w28oFbn3+ugLVPrx4OPpD4RpUglsa71PN40+Lk=; b=vjtpAvljrR83KImWn2Gkj845+x
	Or+9kAEkE3HoDKnb5JWlYe7ms4W5HG20sF5XaFVfx33TinFI1j4gGLbN5Y4N0xX8wxWZhNr6HycYY
	AuzvI8XR/KAoO4H0ia0k0fDZviZTKzR4X5EqBjx6nkkMRFFcPinV2vU1zK9BXfQYb8b/iaL75a1oK
	dLHZZb9NfydzKSejcMn4N86wcO2Ixs7qI6cxW6RUMfRiaWYQs6BJcXy+FZCZYw+ws+WudXCkhwIAJ
	Q5ngx208HfTGu7c7xQ7LZgOkP54Zxt4doAkLyjeVCPajZerc9UTDTA3IkorLn538VuRNEoZwM7uQH
	HymUGECQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVTas-00000003Ttr-3CIy;
	Mon, 23 Nov 2026 12:56:26 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVTao-00000003TtC-3zEh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 12:56:25 +0000
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6ANCI5uB3875078;
	Mon, 23 Nov 2026 06:55:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=proofpoint-05-2026; bh=gsNa9w28oFbn3+u
	gLVPrx4OPpD4RpUglsa71PN40+Lk=; b=UR+TrsHDGUrzRcI1e931hoyC3Shn1Ab
	YNufTs6ceP3nw9OtV9BcexdIq5+Xrphja4edXPErywmB0GEUb339iihuYZqA3OoU
	1LpKVmKgIt4O+OR+UA6PEexAH3401b5QMc9lcaSoa5592wQb7Qqs9nFWsBNVzl9e
	YALn5x5XyUPO7wmXnEtjAd9h/AuiH/1c+AJSzMt56xznDf04yXZjKVo7g617aLPF
	MxcE6WeS772Pwtp4pyEBbtXSk2iZUU3lKjEquB74Arz43NwPjZBPtYOkxz1iX83F
	g0RHzz4qs7jEbxYTHR7yOyLclT5obXWYltN3Wny8TlVSBYXqAIzEwYA==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013033.outbound.protection.outlook.com [40.93.201.33])
	by m0384305.ppops.net (PPS) with ESMTPS id 4j3x4sdp9h-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 23 Nov 2026 06:55:33 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TNB0g5B41qZkBeicx/oWMMU+MCVacunhNq7nCs1+pRABjqiaBg0wOmw6HzeqHRY0u/YIPeH9QkvuqmYETiiC0OOFqWzmG/HQ4c8hlrPPpjV34A8KwbAd5ySGOEnmIKGIuV9WmnXo+un68j7MmxJvs5hn+z1/dGT9lmVGH2BER0qgRhpZIfp88mWV9fFqY+CQ+KmcgvzUl9ANGgtevyWbZBJ6vuhF6Lc/ncUM2RaL6YqL7dBT3uIo2RRtduj+/8tBulnO6urMqFKf7jZ3UuuyIXpvMSliYxIjcBeY+GGIwByEwUeenEl8v6WlWGc9NVAys88+pqmDRc2ABWCvZQ8dTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gsNa9w28oFbn3+ugLVPrx4OPpD4RpUglsa71PN40+Lk=;
 b=wxuA2hAacy2rAqoPmHTyhGuo5hOs1RkoUuoEdwFxUGIs5TO6t5D/gwatPcESfYyhLE+1WT9XrFg1+bEVCQeEgmd9EY8y3hQ5lJO8Icb6i4A6q9ECfjl8jFmNAwPGfK2lwr3DKPIqtICE89BQJCWC0AuL35HwW3WHAaMbSnnxcm6uZBKrb08XPlDWlFVd+dxbMbZnwEMipV7rhHR8YLnlRisXYONxAtTD69qtY0i3u8BadvvSwu4BPati53wxiSDZ5ZkIUwBA2VswDL7lQC9W6by+17cSnIGc0BvBpPpkObB+IuFi3Ntw/4MDUxYWeIMbjg0gVK+ilxPexhB1tD7/Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gsNa9w28oFbn3+ugLVPrx4OPpD4RpUglsa71PN40+Lk=;
 b=hiFjyqMYkmO1XHXl25kW83xKOiFxV5O2GOxrfgzXaKFAjSjDEQoCs7uywgl/n8pdQU4G/RJjtv3Hjd2IEJma1hH1DzjXE87TOfe+8xiBhDPLw9frjwV1Bq9sIPuVwV7eOxXduVVgHHXP64fw947LhrquD5M3dL+4GzZdu8dn3jo=
Received: from CH2PR18CA0040.namprd18.prod.outlook.com (2603:10b6:610:55::20)
 by PH0PR10MB4423.namprd10.prod.outlook.com (2603:10b6:510:40::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Mon, 23 Nov
 2026 12:55:29 +0000
Received: from CH3PEPF0002457C.namprd04.prod.outlook.com
 (2603:10b6:610:55:cafe::76) by CH2PR18CA0040.outlook.office365.com
 (2603:10b6:610:55::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.14 via Frontend Transport; Mon,
 23 Nov 2026 12:55:29 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH3PEPF0002457C.mail.protection.outlook.com (10.167.252.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Mon, 23 Nov 2026 12:55:29 +0000
Received: from DLEE201.ent.ti.com (157.170.170.76) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 23 Nov
 2026 06:55:16 -0600
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 23 Nov
 2026 06:55:15 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 23 Nov 2026 06:55:15 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6ANCtF8p3679724;
	Mon, 23 Nov 2026 06:55:15 -0600
Date: Mon, 23 Nov 2026 06:55:15 -0600
From: Nishanth Menon <nm@ti.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Wadim Egorov <w.egorov@phytec.de>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Siddharth Vadapalli
	<s-vadapalli@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        "Geert
 Uytterhoeven" <geert+renesas@glider.be>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        <alexander.sverdlin@siemens.com>, <jan.kiszka@siemens.com>,
        <ayush@beagleboard.org>, <robertcnelson@gmail.com>,
        <upstream@lists.phytec.de>, <francesco.dolcini@toradex.com>,
        <leonardo.costa@toradex.com>, <matthias.schiffer@ew.tq-group.com>,
        <stefano.r@variscite.com>, <eblanc@baylibre.com>, <msp@baylibre.com>,
        <thomas.richard@bootlin.com>, <miquel.raynal@bootlin.com>,
        <mwalle@kernel.org>
Subject: Re: [PATCH] arm64: configs: defconfig: Convert TISCI to modules
Message-ID: <20261123125515.55ozls7bvral2ukz@residue>
References: <20260910134409.1713610-1-nm@ti.com>
 <53d50a7c-4318-4705-ae21-780b04628742@phytec.de>
 <59b8e9df-0f78-49eb-a23a-2b352a4a2333@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <59b8e9df-0f78-49eb-a23a-2b352a4a2333@kernel.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0002457C:EE_|PH0PR10MB4423:EE_
X-MS-Office365-Filtering-Correlation-Id: 83414bb0-60b7-4025-e1e1-08df49610d28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|36860700016|82310400026|1800799024|376014|7416014|261102123227099003|261026121527099003|261026140227099003|261022115727099003|261022075727099003|261022105027099003|261028144727099003|261021121427099003|4143699003|56012099006|10067099003|261009223027099003|18002099003|22082099003|6133799003|13003099007;
X-Microsoft-Antispam-Message-Info: 59Ywom4tefn5ud6RtFjvoOlYoaFrFY6zIhTfe6wTJcTHUbaZ9fBogmNlWQM9QZOKyLsLazHmwowYnzfSjOkbM5MIc2Am0u7Me7knvc7qJSxVWuSspI2r9UDkFo5xPWQF33XNZNryRYy0ma9gCEW3pED49110nh8VABjXYM2Fowx/lJ1vMjumnq8pK/XOtkSerEXKdXtVpLEAOoRFUJoyGcJXvFnsMnifIPnfY4dafrE41DIEL8OFr+0OQuvgRNeymb+qKN5vq3UhJv/EKjdtj3xPEoWFyIS0swK/ouvId2su5/kpLNfUTK0S5MemTvOz+77BQdDqbFhzkJ+12WpwYOxxEPj2aGLejc55Pfznnr+aB73cNljDkeVdCEmw1szHlH09x7c4abh9FjEGTj41OAycyaFnJJFIokeAsPcWuuB675RqMxw8r8toaaQzklDIRvHGp7mj7xA6JkFhGAXif6r0WmrbXtIMfaYp7ObdbHe+xpRSlLEZTCJ7v4mn2nvn/T0jODjIfN8yeE55gvvm0m0+YcPkpHVUjaiy4XSNU2wyQsCr3580RqNnXN9BnZJyCixh7nJFPdcOdnuj6f/SGoU0xeYY5p5ODEBCBF2Bht+nwveIrBeAE2z27+ft/+bKmuNlyTKwi4GVYAX7y4Z1Nw==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(1800799024)(376014)(7416014)(261102123227099003)(261026121527099003)(261026140227099003)(261022115727099003)(261022075727099003)(261022105027099003)(261028144727099003)(261021121427099003)(4143699003)(56012099006)(10067099003)(261009223027099003)(18002099003)(22082099003)(6133799003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: MX4whCdgxX9DtN8NHHHyBxXhHbtbeTOPlcNH3moC0qYt7T81TogfjPeHqjAMy9zuROBm/EWIYf3OGU/0E66P7M+GxG6BcP0snC6B5VT4Vq4gFaCZycQd6VKsRUKeMFJoi7uzNCS9OOn9PapxfaqWP8UghrEWhGp5HUJA58QIiWfOGYeeelNRRvLbzvJbW6bW4JeqRi1RDp67Qa8+mC884VgN9uCHRxQsNJYwKLT6csgWHvlGEC41YGDgN+sOqVhLmk/wZ1aqKBmOa1v2TNy9C5/IjL2CYSrnJv2H+6N4Y4EzT/T7halLtHEuJqZ8X/MZERCMeLu6o1Ll71ajmqELppnul2ImIr4iq13bpfXEQlk3yLfW6Y4TILVP9cO0uEO1YPeuCJvt39ZMHtBJRt6/NvZxb8TkZwkKLigVvBzT4TgSV/UQUu5F85Qay5LfecSO
X-Exchange-RoutingPolicyChecked: lFWZqsPdaHxT/+abIxlsk1AGqMFVpgQ3QEqIy5xC93+9JcUrzfnI1wVdqFurw2SAtnPsFkagd72s5WLw1vnUla0N8PkEoNHQ58EdDGVodM+OuAxb8hf88dM6xTXm1QukPdAIPzVfpoab7E6oZs4EVtpsKW19MrArxgCsmRv1Ek1736bqbTXd9vthR6HDPF2WE/XFJr8TJEOrkkm6UFVD1pQdvLlLrKnCT1Zk9wUnOmM0sgT2RWiC0fq7bDJxLCQHDgmx35AlKCPkWhoh89vgrq8Z1drr5xmm4xypFhHt0OANsXJT+KQcIqkEOpQZUU7N89Ix4UV0BMLH5x1zOxNTXA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 12:55:29.0259
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 83414bb0-60b7-4025-e1e1-08df49610d28
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF0002457C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4423
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA1MSBTYWx0ZWRfXxe0t4rOfETFF
 BzU7YRFEaK32ou5NTvU/vgVADudqoSMYRXo+Ub3wh4aVRN7uX+9WcMe4krwGNWQSdd8T/x9Q4wL
 QeuhexNOaltzg7kNAmZJmBveoPVuKnw=
X-Proofpoint-GUID: de0U8kUQ06rtLt6QNmt5YkD1RtvUEScU
X-Authority-Analysis: v=2.4 cv=d8pgWhjE c=1 sm=1 tr=0 ts=6b0437c5 cx=c_pps
 a=ZRTQSBiCf/ik28kxSsFIIQ==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10
 a=s63m1ICgrNkA:10 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22 a=NEAV23lmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=0Miry4rRAAAA:8 a=sozttTNsAAAA:8
 a=db1-bO7VZ1jmCE14zCoA:9 a=CjuIK1q_8ugA:10 a=UT1Yo3WijKgCWNxi40OF:22
X-Proofpoint-ORIG-GUID: de0U8kUQ06rtLt6QNmt5YkD1RtvUEScU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA1MSBTYWx0ZWRfX8Gj8rvZOP9vV
 Iy3XHz+gCOOBJAzyfMqGQPql1CKgwUZwpEL7BtL844MwlQZX9KfVZ8JFQ8F6KnP0qHihb2YFbNJ
 wMOm54NGu+QCXvZ6+JQmceu993nAEZnHpA5BHGXsh6JHBwBIR54AxQJJj94S2Sz/2FqpBcpc38F
 nv4ZhQ+OuMw4KqyKCMQ57+H61W+6306PWVubd32IVj7Mpd/9tfmL27kr+wjDuWb52+RUqcaJYlC
 3Y1OABk3RhUVxdH9usbnmziD5fSZhpJvvmOz0qQStBralgabrm/AAEuezBFIPV5AWoPF7sYF4rQ
 FW4NVUKAn8b7e8STCOCuXLpeOuUKT1XIAqfU+MFh6HgON3EYfep83HrmGzD2y/FwA2yxjPavZJ5
 dySm29zw6p8/byLw6pLiDB69pn4JQDM+zkiJwpVW+1u+LmokasPZ0lDjTocsP65t4llgi3Fp5ui
 IR8zLyuoX2cLlnaqd2A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1011 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_045623_090016_C825F840 
X-CRM114-Status: GOOD (  22.86  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 16:28-20261120, Krzysztof Kozlowski wrote:
> On 20/11/2026 15:42, Wadim Egorov wrote:
> > 
> > 
> > On 9/10/26 4:44 PM, Nishanth Menon wrote:
> >> Now that all relevant drivers have are ready, convert the
> >> TISCI drivers to modules. This impacts all K3 platforms for
> >> boot, recommendation (based on empirical evidence) is to use
> >> deferred_probe_timeout=60 in kernel command line to allow for driver
> >> probes to complete successfully based on the initrd used.
> >>
> >> NET Savings: (Ubuntu Clang 23.0.0)
> >> ./scripts/bloat-o-meter vmlinux_previous vmlinux
> >> add/remove: 4/380 grow/shrink: 0/5 up/down: 32/-143248 (-143216)
> >>
> >> Signed-off-by: Nishanth Menon <nm@ti.com>
> >> ---
> >>
> >> NOTE:
> >> a) This patch is based off v7.3-rc1 and will create a merge conflict
> >>   in linux-next (next-20260909), but the resolution is trivial (vs
> >>   bd94bea7165be450903c6d64bbcb4862e36798f9).
> >> b) Emperical experiments that Siddharth Vadapalli did,
> >>   it seems like some driver probes might be taking much
> >>   longer than the default deferred_probe_timeout of 10
> >>   seconds that is used when CONFIG_MODULES=y. Testing log[1]
> >>   a deferred_probe_timeout=60 seems to have worked fine.
> >> c) Full bloatometer report is available in [1] as well.
> >> d) related lore discussions[2]
> >>
> >> [1] https://gist.github.com/nmenon/5f1587b373e6ca27170593010188d968
> >> [2] https://lore.kernel.org/all/20260429-defconfig-v2-5-e4ed4186028b@oss.qualcomm.com/
> >>     See headsup I gave on #linux-ti irc channel https://libera.catirclogs.org/linux-ti/2026-05-20
> >>     https://lore.kernel.org/linux-arm-kernel/20240821110054.35u5ubgaogzjv6c4@rover/
> >>     (original thread that triggered various changes)
> > 
> > I can't boot our boards anymore using the default defconfig. Is this forcing us to switch to an initramfs?
> 
> arm64 targets long time ago were supposed to use initramfs. It's pretty
> easy to switch, honestly, yocto can give you a very small initramfs
> which will you can also extend to copy the modules to rootfs, if needed.

As mentioned, we are struggling to keep the Image size in control to be
able to add new SoCs and architectures. But yes, initramfs is the way to
go.


If you are looking for something that might help pick the modules
needed, i found [1] (basic busybox) useful and I use this for daily
testing for all TI K3 EVMs. kernelci goes the other direction (vs
picking just the modules needed for a specific boot mode on a board)
of having all the modules in initramfs. Both directions have been
working for a few months now.


[1] https://github.com/nmenon/boardrd
-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource

