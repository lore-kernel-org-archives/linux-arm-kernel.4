Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F89F606A323
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 09:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tlchuSoV;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=Vhsg5g7Q;
	dkim=pass (1024-bit key, unprotected) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=lFYnufqy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=2l/1jcelXdiYehKIO45Ypp4nvVzEGnPCuiEyjt3xDkQ=; b=tlchuSoVOXmGx7
	ODrfp7H1rJJjCKsPPUF7CkQgG9t8xpu22vT6aT1C2SJkJytBdOv5mhLQDQfqqv8ucbSMi9DGqhYqG
	X0sMjw16u0X19h8KryF9PCzhXhfMde1gYIYZQ/bUTjb1PaAG3FWkmfZxGgV7gyGqenkiNoxITj8jU
	GlplAkEpndyNaPcIAYFJHuqbdG19hlcaGW30b+bP9s2RBmKZpcM5UpqTCfdFPcJEK5yiDr73+7uCi
	YDZ9d69MaOo4CBDJKWvwrmnqjFuGIAk758uGox1gxJs7oU3ZpAZ2fSlJf2uCEk73TBk0SZHpnsHBb
	M7zLH+qMS1MXAQcjQcMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWW08-0000000Cb3h-15r2;
	Thu, 26 Nov 2026 09:42:48 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVzK-0000000Cavt-10Md
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 09:42:46 +0000
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7BcOL2590784;
	Thu, 26 Nov 2026 03:40:42 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=2l/1jcelXdiYehKIO45Ypp4nvVzEGnPCuiEyjt3xD
	kQ=; b=Vhsg5g7QdT5yHaJ63+wUtBVzhHULc4WKtUbz6xCivIz3AOsHINu6AHN/e
	1g8IfCAffIUMvLE2JAr6s6L5sSamR1LMYdolFw26ndCx3GAjIjipX5i4tQMkgSDh
	P00XuUNr5K6zcB3/YnMhev7GwKEsLjzNwIkIt3Yy8txghmi+0w474r+Av4jbqN3P
	9JoeArgsGVmTd5md3XCDCDrtma38t445+CTpKz6ky6t5h3uZkbyX/SgsHTV5bJ3B
	zNLA6d8P+aqPBM7kzat7uJ2sd4LWv2Hxd7Wkzwl0Dc7etcsAeIQmxEHl2TjFZ5I7
	ZWWkQ7dNKwmothIPslAJXJFlz/pFA==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010019.outbound.protection.outlook.com [52.101.201.19])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4j6eq9s90q-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 26 Nov 2026 03:40:42 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qqgVouVxKbbqFLfHU9XaBpMNpr/mzs6Bz4Sg3uHxbSWivD/+Y3SZhAQpaDUkd3x1wTVzGCgOpYfHJ9U1OqkJx/8mtOl9ngs+Jgn1oyzv0n/BncmTCmNlMlRRlqgRz232U3V0HAklIdLlhjB/+aU+eu3ncPnUJtGJEMr89XPTRruV//GmNrjI2kLqSkZICKN8nCIeE4eiwBQDmUVU/SEI1NAlqKSMVWvpcyNMI1U2NMCtii39Xequc8jthkzXoVimWB5VZkAqskNu/OvTlj49bbLgkLXegEebLDywbKf4z95HK0JI5nC13EFRh/siY4/rSjVCl5cs58B1p0dN2DDoRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2l/1jcelXdiYehKIO45Ypp4nvVzEGnPCuiEyjt3xDkQ=;
 b=vBKvtACFgzZUHLn9pK65Sb/9/mZZsrSkzS2YzTkpyQHAzCDDQUuEcWzCfYm0GF5Ii5Yv/pPtrQ+dhd43ykjCpDC34x+chEQ7IOWY1gXncbIWjbhSr32lws9vv7iWbBowbqREOLr+qRCqie4q3vklAaGOHTj5fKPhUQnl3Ab/uEOKPqP33zrzNG93LyDbKHFb/TaRbbhRdRK8+oTti8kFQgeE8wSDCYbEbiseuf/dMdQuIeFoFnNghBEARcRJ6y2GhTEAvpGpqkUK7pteUNs89epOVDZi68uaD8hBleCfkmV4VDwBjXv8EtpdyDNiMWlpeqFSbHt4ELi6or6d0cFS8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=gmail.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2l/1jcelXdiYehKIO45Ypp4nvVzEGnPCuiEyjt3xDkQ=;
 b=lFYnufqylCeaF27wAXA6wTANRTLLkUUi3eoxFi5iIvABLKGwJmoxQJESVPbd17dzE/KEzrP6ucKhGLWHMWcuCzDYOj4YPhmx34dxd5IvTSmFfkGADtMCK6HKzwecip2I+1pyL/kbcd8C45cbrkDByJfs1fjr6PT5d/FAA7Of4dc=
Received: from BYAPR07CA0045.namprd07.prod.outlook.com (2603:10b6:a03:12b::34)
 by CH0PR10MB5146.namprd10.prod.outlook.com (2603:10b6:610:c3::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 09:40:37 +0000
Received: from SJ1PEPF000037A5.namprd04.prod.outlook.com
 (2603:10b6:a03:12b:cafe::8e) by BYAPR07CA0045.outlook.office365.com
 (2603:10b6:a03:12b::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.7 via Frontend Transport; Thu, 26
 Nov 2026 09:40:37 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF000037A5.mail.protection.outlook.com (10.167.244.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.688.5 via Frontend Transport; Thu, 26 Nov 2026 09:40:36 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 26 Nov
 2026 03:40:21 -0600
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 26 Nov
 2026 03:40:21 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 26 Nov 2026 03:40:21 -0600
Received: from [172.24.231.93] (meghana.dhcp.ti.com [172.24.231.93] (may be forged))
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6AQ9eFlG450812;
	Thu, 26 Nov 2026 03:40:16 -0600
Message-ID: <f46c562a-2f79-4300-9dc7-afa47917693a@ti.com>
Date: Thu, 26 Nov 2026 15:10:14 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v9 1/2] net: ti: icssg-prueth: Add Frame
 Preemption MAC Merge support
To: <netdev-bot+sashiko@kernel.org>
CC: <marco.crivellari@suse.com>, <haokexin@gmail.com>,
        <kees+treewide@kernel.org>, <laixiangwu@cmss.chinamobile.com>,
        <arnd@arndb.de>, <horms@kernel.org>, <basharath@couthit.com>,
        <parvathi@couthit.com>, <vladimir.oltean@nxp.com>, <rogerq@kernel.org>,
        <danishanwar@ti.com>, <pabeni@redhat.com>, <kuba@kernel.org>,
        <edumazet@kernel.org>, <davem@davemloft.net>, <andrew+netdev@lunn.ch>,
        <linux-arm-kernel@lists.infradead.org>, <netdev@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <srk@ti.com>, <vigneshr@ti.com>
References: <20261121144618.180542-2-m-malladi@ti.com>
 <179561933095.3135.5750144040401521848@kernel.org>
Content-Language: en-US
From: Meghana Malladi <m-malladi@ti.com>
In-Reply-To: <179561933095.3135.5750144040401521848@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037A5:EE_|CH0PR10MB5146:EE_
X-MS-Office365-Filtering-Correlation-Id: 9439fca1-d5d3-4b8d-b030-08df4ba15360
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|36860700016|7416014|376014|23010399003|18002099003|22082099003|261028144727099003|10067099003|56012099006|4143699003|261026121527099003|261022105027099003|261026140227099003;
X-Microsoft-Antispam-Message-Info: RljJSa0inULYdrsP8L3bh4fUvwAIlcGtQZ7jQRYg0ev++5OZOzU+aV0uZAtLR8Z5oGCgJEnvNZvReU+E5oMUScyF1/DAUwkyhrCl2sfEitZ1pC/zhmnqZYXblzkIUP7Ve906FF8vxOu2WnT+/L9Lyo3ScfPcXv9BQZdfznP4AlXvduo43TOvHCGJ+LHg5BCPpOVGOmVYukzTe3I6pzql2qt5LUvInnL47VI5zjHo7Aa2PeCE8vnHQ3zzMaeOS06mzBFdquPxfHBs6GmeIC1tgRTDy/u/zssBZggFwONLkrAI9+g0maa6Kc5FkaD6s5f5abqPhBV0p5wzkyrpn4oYcr5Nw5wtqMpA7y88QnVG7CSmGpUFTJwnb3ZlD3fjVSuhrIw8DJ1AuwEYpiu1+P3u+SiYvTL+BBX69/f+IEBK0mrCWKarjnx0OVL/MBDO/AjptsHFo58Y9XOnhgTW9IAhKVJ+j3rfus5Ry5VbQ4niy58lZDgFquwlifZ8oQobLXNlVDbNxdtj9MQfSxOTNbpWi8IYnWj/WizuMzKV2WSXihCxTLEB5O2thhjSQLj4f+0IbjqxTmBgH1mRiBLUh9IC9jJhVIQmrSuvEbVhey3b2RCOxVp/YkDXIxr3TknA08oDLuNZJJf29Mlv68Bgsg1iOIaAdGqyicHxv7NKd31r6Ghc/gHGHcCQJeaxFcZZBVJBgxNSRl8gMHbrF03ahLRYqA==
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(7416014)(376014)(23010399003)(18002099003)(22082099003)(261028144727099003)(10067099003)(56012099006)(4143699003)(261026121527099003)(261022105027099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Nuj8ihkIuQ1VHi4LVNWr4ZKQfJpss2hYbLVWArq8GOkvNc97JFsYaJOtdx2Yw+k9vGL2CvwhuBQ/I75zZhBInMBDx1yzrNJF6KbXELkMLDHFHsw7j1izARfPBJNQ6R3KjVR6XOL6pxqeOrM67PHJHPQQgWEW1/LH3t+owuFnB8a90Ea6jBwq0z3JWgwZ8rDq6602xzh+DcCXa3pG0KgKgE5gIYdUx5wHk4W3IKM+C0RKii4Eb0sm2MUcdU2gdmjrrAbaavw63eTJ7XSd5GsCUVz1QowEooUi4hszYj834xUymImI8JGvIyJKAunEoONOxyAQitvPS5ye7iFNdERBZtrpdWIRDIZXZiwuijhEUgVaNM1v1dhb5eDipIY2obmdLuY2RTeXeml1XUubLD4o6/ILBziEwMQ0IoP24tHum+w1PL/N7WHDFGfg4U5HXcNV
X-Exchange-RoutingPolicyChecked: Lg9YiIDTCG4a/GOYbuOXPA4Rd+Gr99HqDEF/ay7VMQlAZmPSv9ekJ5tbZStFPCTN5gFHWZBCadI0j6P+RWIE6niPlaqJxjge564iO/Q6W3kT6/jzi6Ou09fxQJ0NgGTEnSgdooMUJXXoAC/gbHjJEm2B4nzXsJMqHk9e8tlodjPl64PLqtsapMHBPWWlHhUmOYEvToYsZweWJ8yIfYefIanUq4KJfAsiU2FlSyk1JSYGCSfg7YL6n8EzIemrmdABMf0djeM9+rTu03GyxpEESUzVWmIcsWOawzyiXlFIu5O/GbRzHZ8EUTj9T/Svm78IGCA2l2OqLzXLu8E2UO7Y6A==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 09:40:36.9255
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9439fca1-d5d3-4b8d-b030-08df4ba15360
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000037A5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5146
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzNyBTYWx0ZWRfX2RHcB+wSwpCE
 s3aQ4Rpr6CwI7FFfGAUG46VPX816kSu2XXH/AxErqNCncTWTefDZOWRaR0D0CcavCnMHVAxNR+A
 gIHJl11Vih+6URPV56eV+qEEa9nduu0=
X-Proofpoint-GUID: 36K9FIt_xFd36ZLOzQw8fnfFwHyYbp7P
X-Proofpoint-ORIG-GUID: 36K9FIt_xFd36ZLOzQw8fnfFwHyYbp7P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzNyBTYWx0ZWRfX0lbD2wiAwOBs
 N2/oqi+j9xaQhlbu3tKmneMs6xAAJh38SZU9u/yIAyoHGIJuEQF83xff8x0U6b5O0OlAmm9yc0Z
 yifJZ9EEug8hJcXveA2MFwtcBiCb3nqobFcpeyC3TOO10VAHPQAwFTcfURtTbTe1rgsY33qLRAU
 C68038PEBN45PuI+/4k2h4cx7cOl/apWPXBM3MK+TNB6rRWS0WKhcL/yu+kzvH8YKzu4dADeDgq
 PspfMk1nPt2esnjr0nnrTFeEjAYFZ+31wLK95SK1CrG6wSJZ3W3CeXbdojILPwFMzqSFbuxyVd/
 0jce93Qu9T/qBtEgY0asL6edXj5wXZ4+fRXx/KUIE1oLusenrH+v/RTrJwE5zLGxiaDbk37Hvi7
 9CvXyXzRs6WW+pF5XXNzDK0iMYVh/H2y7vd1zQtZBtuOA5GwuHjL87rP31fD5mS4uAeR2Niubec
 f7N7xIDIy90gdSj12kA==
X-Authority-Analysis: v=2.4 cv=d7JgWhjE c=1 sm=1 tr=0 ts=6b07fe9a cx=c_pps
 a=NuF0lfjhaYRYFIRzorixyA==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s63m1ICgrNkA:10 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22 a=VwQbUJbxAAAA:8
 a=IFxo5bFJ2_yrGaXSW7oA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 malwarescore=0 adultscore=0
 impostorscore=0 bulkscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260037
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_014158_392197_372B5292 
X-CRM114-Status: UNSURE (   8.07  )
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/25/26 20:38, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 11 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 · Medium: 5 · Low: 6
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).

Most of the comments are valid, will do a respin.

-- 
pw-bot: changes-requested

