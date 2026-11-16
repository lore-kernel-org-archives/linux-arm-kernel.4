Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E2CA606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 10:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=x3UZeDCd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6bO/b/Vu0ziY07A3XZIEbldvCisJeCASyIhfTlyo4Ak=; b=x3UZeDCdCq8dotPepcstX5U8hW
	YjI3E/3I+JDsxsx4o1Nv+Kx5Ifo7HAtYnZDtChAsM7MxF1zcbiw+DDxNe5AgnP6vEBktSXLECSHLY
	agi6ToUh3+1GeeaJt7K7IEqG4NDbVKY697iFHt4uARNqDHdR68ndVxx9k9/ZtVyWKlB2j3Yvt3p7X
	P7vXqmBWZ8/BkETNLgYP5mHGm2T+b0hhWD4xXBXMSJPLxXoYMvcqcihUpEc9sRk9CcjnZhz5++39X
	lYfZqI+fH7NOvJMmzIjCW2vnikxwFmnF9CVzwNmaPxGllMKEj3adszzDUWrRlBD64iJafmsz0AIiC
	90Env2Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xStbK-00000001tdj-2BmM;
	Mon, 16 Nov 2026 10:06:14 +0000
Received: from mail-koreacentralazon11023109.outbound.protection.outlook.com ([40.107.44.109] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xStbI-00000001td8-2YZP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 10:06:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s5WY/FnF62f6Lv4D0EtqMcg6eP625/sKSuFgTw7oGWlzY7bxQWZE5iV/x4wd9Pv11gpcDY5XQv568E5xRKxM0AxRNnOLI7hX3GEKsqpwXFMjYR6wOmmOKKXd0jh81CS0HJAAUpj/BgRERL03AGlhqKzKryPcbuORvNRqoJUBBL1waDFCOlr7jZwGlmSn+Pl5K9E+NXlqq5LuoxnA0qjQ+95ta6jYe3WbdBUAqk337Oa9d9q0uqjqmX4fIRRjqdA37YIU3Cogn4HEq/so8V0rcjJmBd8T6brYfMYBAynl1olu+DGMHmVyt6u/JkYfz/vUQ68n9DRFEbGAu22duhSpxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6bO/b/Vu0ziY07A3XZIEbldvCisJeCASyIhfTlyo4Ak=;
 b=X8eklZoF5qrSbGBC8HWddQD34CWmRC6ZHiGXlDZ7HX4dTPy69MM3WASE/RO8JpwAj5BSkwUyDI1oD0HVojmjuDoPpyFXNLtqgGz5lmqz66La3A6NiQBChPnmwUrRDFReFnYdB098y6K8YqrS5GdO8eQVUfvMWm7cO112XF/Yr5DqfsCWCNhGrpJj7YabxtbkpQlKTjxKjsjWQldXqcrpt1vLpAj/C7JEneBSxUE/i8K+xWhvdKWGXl+r+gHoeS7gCjzDM58+rEgk6+cTcsCFU/7vSVpapVN9YU5AwVZsGNryYkGsYtkrkjFQqgQvce/OWTbEExUjiPA/QnGzD2ceIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TY4PR01CA0010.jpnprd01.prod.outlook.com (2603:1096:405:26e::18)
 by JH0PR06MB7053.apcprd06.prod.outlook.com (2603:1096:990:6a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Mon, 16 Nov
 2026 10:06:06 +0000
Received: from TY2PEPF0000AB87.apcprd03.prod.outlook.com
 (2603:1096:405:26e:cafe::46) by TY4PR01CA0010.outlook.office365.com
 (2603:1096:405:26e::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Mon,
 16 Nov 2026 10:06:06 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB87.mail.protection.outlook.com (10.167.253.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 10:06:06 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 3C29240920E2;
	Mon, 16 Nov 2026 18:06:04 +0800 (CST)
Date: Mon, 16 Nov 2026 18:06:02 +0800
From: Jelly Jia <Jelly.Jia@cixtech.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: vkoul@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, robin.murphy@arm.com,
	devicetree@vger.kernel.org, Frank.Li@kernel.org,
	cix-kernel-upstream@cixtech.com, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v6 4/5] dmaengine: arm-dma350: Support integration clocks
 and resets
Message-ID: <avrViuk+SH3PTR5S@ubuntu>
References: <20261106013453.1134239-1-Jelly.Jia@cixtech.com>
 <20261106013453.1134239-5-Jelly.Jia@cixtech.com>
 <avYi_uctWPVo4mjn@lizhi-Precision-Tower-5810>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <avYi_uctWPVo4mjn@lizhi-Precision-Tower-5810>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB87:EE_|JH0PR06MB7053:EE_
X-MS-Office365-Filtering-Correlation-Id: d8d85321-c7fe-4299-75c7-08df43c93ad8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|82310400026|1800799024|36860700016|23010399003|56012099006|4143699003|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info: N0CwJxb+KpV6xgNVRZxznqRwLABdZadFo3MzHJYEVH0Mq6TLd5lODlY4uC4+PaI8JmmL/yMCBvuHmLCty0vUZgPhpc6YFne+G98TSp5uupMIpiD1NbZWaZxEljqbjqWAqaGoN0fhOjCvFBZ4oXkwbw9l/xLZAQVEyJ8wR3sGKmWmq5hlTZ5rtkFU2VMpv/1QFXRH6FrwKTr4vO8/XnMvZCOpOvyXOMyuk8tLSsrynnqSpFmNCuBySdDB9yQgb9umZtEkb+G4WEQQMeaym5cd7YWVIw20ZE+1sIvAyVhlkenqqqBA66w6Io8KEcjfWYQJ4OuD1kdhep1PC6ofAufyViclteuwVX6x7y784eKFzvCHhj5o6Ng/CryQKxQNsslhlUf+oCU/11V6pSWP36nAyVacbZOEU/QcNVWC4bpOAgFZ2XVRj2P5+lH4IKGGj/6h+Pg/sQabcSN8vgx9UWu+PSMkL5Dd33Z2l9Kphxel1mLNciUneFhTzDmUksjJ8w/P5cLjo9YmPmLdpGa07XGjF2cRoRSffZ3n1mYTF8gkddd0WJUunMWmnZSVGbpemOggIy26UZTpkh5WHLedSSOHcWy3WuexZjlTMSuyg4fipZQ020GagRAON9a3KQv4kcwhwfnCOOOyFR/8QaEEadcjopjkQiFu0PYrXB9OYS1QSruYm34NbumWgQnLVpjDSLbh1n2Ta4mCVTVeSBYqnbwxdQ==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(1800799024)(36860700016)(23010399003)(56012099006)(4143699003)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: i0rrbHhH5rBPuSoZw3qdLhbBXCib6KDo5m7/AMUIL5dzA6dW+qXSRYxufLY0J8V7yrgBFW2VgPN5DHIB7zl3vjHiT0OSwVayb3fkpfh6HozF/X+nU5ku9QuHTSES09MgNZaIBaUqCA5pA5gpesd2Ha6PgDkRE0rVw4WFC8zT4uQP6vekpgV3bcmaqRQ7LGxX2+YKHc80ysS9Hi6UpxLtYLtVF37aykJ56ova1SOLPyepEQ9o2uoW3L/KgYjKiqOOaq8phdXTd3IFETTbgPnFc+F5wrLtW/an0X+n2+uDoiRjsraIEaCAcaFbLJkbhP5D+7sx7E5c+4JGNrNT16mpgq13d6CjrWSJLYNTewNnur6S3u+gMcex3Jxo0+j7il8HvCiPFEKe9AufjmtmM3qxH1+YiCgU0cheKVA7pYyYd+vd6Y0tKNIs3gU5TBMsdfff
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 10:06:06.1892
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8d85321-c7fe-4299-75c7-08df43c93ad8
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF0000AB87.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB7053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_020612_648820_F7859105 
X-CRM114-Status: UNSURE (   5.27  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Frank,

> follow b4 order, your s-o-b is last one

Thanks for pointing this out. I'll put my Signed-off-by last, after your
Reviewed-by, in the next revision.

Best regards,
Jelly

