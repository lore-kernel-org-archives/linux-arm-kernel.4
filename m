Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F669606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 00:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sAvlyjgG;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=XATOgoOw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xKH2/Ei3ExmzZEK8iAklX5mTdAHtx2zvIvbTO8+MJyE=; b=sAvlyjgGo6QJ/CeuJUhsbrhRI1
	dsPtUT+Ia1pArHyMq7+ZkNu/WCuGgPFXiDd1v0TtnGnA3OiXqDRn11k2ecE0tRYqgEmAmj41ttO9E
	qCWISGP+a1GdSnsO1mbNyS2GPSVARtTXvghFtXDv/NoiQzw6oKPz0g6wjLP8XV7mGFNxJkf1Vhn47
	MLvJwj3DYE5FPBjdlry4gMVoF2FpccTbRmR36UNSFvbNdrg5AX98N9Cha+/xdoswcTZzhXLikgiWr
	gt5Ool5JWa+NpNDnfywY1kawOatUQ/bNZJ7h/MEohAWWSkBBNdt4N31U4AHSk9Q7P+C49TPF2li9G
	i7Lt1szQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVejq-00000005HlQ-1eKB;
	Tue, 24 Nov 2026 00:50:26 +0000
Received: from mail-westus3azlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c107::3] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVejo-00000005Hkm-3nb1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 00:50:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=edQlZW3/dJ0OP1Pn9e4FVpAs2BYbNhkLpmmNSHHOqJr3ZMZ49RtIWycTeWMzFLcXT5TE8yAHOx95i7+S3hDTEyr8wAtVcH26/t+5SB40tX0iTMzvRksQ0uK8SIzVTWhx46NOQsfoXXB0Eb1ELG8fKfYoYcjD8CoE2kr6qzdfJCDEUEg2r5qFhQCe9vfLwiLF/k6OOZCwHkngobkHsTQsDEwTKZvECpWjpWKSObUimVdJP75G+qvd+Ya2Gr8l66g+I0pJwJrCmQcafgwEEiva++f0n4LZjBbZu1JZPqxtmqjvH3WJTfzVxVnvS2SW8IOElmr2ve+7acelDgL2ZpxDJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xKH2/Ei3ExmzZEK8iAklX5mTdAHtx2zvIvbTO8+MJyE=;
 b=X+P3QKK73vGcts63OgGfl+C67PALnCx0iMJhxp+Bc9lvNPCG5f/6rDnfWtaiJbkYGHxrQ+qgZi4sCFuDF0KMRJejm52cNlKcCXTidgqwij3aeywGilzV6hJqHk5je9fzY5vi2hnMaqlYaG0s89kUUd11FAHuhl4yzmIEMfL/ZhXJbv+L1Xmr9sL7+ITluW7ScT5fjnuVxuolXFlo2JsqULxF8mvsbMWSd0z0DgErmCBMvtQ46NcuEEN91XieFayMop8Sv0vHG8YRrxQ6x2HvRiyxui+s+fUYZ4UcjRYcYEUFg1EaGgsvK3VQBkTu+oNdVELXkhFGHL7CjCIcYqrQPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xKH2/Ei3ExmzZEK8iAklX5mTdAHtx2zvIvbTO8+MJyE=;
 b=XATOgoOw/MOTNYEj4H6mMcqdd6e6aQhUZjYDvQPB2F0sB7RgTBahVxY3JnJ6Oqt1Aqnqem3EJp8ilG/h34FisfOs/kWpTJYgZyq3OU35xuAltZo/OFAmPT8wr8UhkU8xZYGe8Bu/MPso76RcGBfgZIUmyVctZ+SowuTlDR8RlySicHsbwq+I9NE7FZFuy/rujH4TZdK2OiEsyK5Lovot3ws0rLA0prlIjCkfEp8S0ar5DOcHt0XslyvUasuuaOQ0QIuefEZqdv3Yom7B/OwQuUx9aA6VxSlMrMfD9mr4qHOXhqXVyHWHHW78BoeCWG4XRDM4Y51rAbSF5R7Sxh9mjQ==
Received: from CY5PR19CA0078.namprd19.prod.outlook.com (2603:10b6:930:69::25)
 by DS0PR12MB9446.namprd12.prod.outlook.com (2603:10b6:8:192::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Tue, 24 Nov
 2026 00:50:13 +0000
Received: from PH3PEPF0005961D.namprd05.prod.outlook.com
 (2603:10b6:930:69:cafe::12) by CY5PR19CA0078.outlook.office365.com
 (2603:10b6:930:69::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.5 via Frontend Transport; Tue, 24
 Nov 2026 00:50:13 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 PH3PEPF0005961D.mail.protection.outlook.com (10.167.243.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 00:50:12 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 23 Nov
 2026 16:50:00 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 23 Nov
 2026 16:49:59 -0800
Received: from nvidia.com (10.127.8.14) by mail.nvidia.com (10.129.68.7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57 via Frontend
 Transport; Mon, 23 Nov 2026 16:49:58 -0800
Date: Mon, 23 Nov 2026 16:49:56 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: <iommu@lists.linux.dev>, "Joerg Roedel (AMD)" <joro@8bytes.org>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Robin Murphy <robin.murphy@arm.com>,
	Will Deacon <will@kernel.org>, David Matlack <dmatlack@google.com>, "John
 Garry" <john.garry@arm.com>, Pasha Tatashin <pasha.tatashin@soleen.com>,
	<patches@lists.linux.dev>, Pranjal Shrivastava <praan@google.com>, "Samiullah
 Khawaja" <skhawaja@google.com>, Mostafa Saleh <smostafa@google.com>
Subject: Re: [PATCH v3 04/13] iommupt/kunit: Do not test INCOHERENT on
 anything but x86
Message-ID: <awTfNDKajIzX9W9M@nvidia.com>
References: <0-v3-97feb2edfbab+748d0a-iommupt_armv8_jgg@nvidia.com>
 <4-v3-97feb2edfbab+748d0a-iommupt_armv8_jgg@nvidia.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <4-v3-97feb2edfbab+748d0a-iommupt_armv8_jgg@nvidia.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PEPF0005961D:EE_|DS0PR12MB9446:EE_
X-MS-Office365-Filtering-Correlation-Id: a2830032-bc8b-4ce7-e95c-08df49c4e596
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|7416014|376014|36860700016|1800799024|23010399003|22082099003|18002099003|56012099006|11063799006|4143699003|261026140227099003|261028144727099003|261026121527099003|261022105027099003|261021135927099003|10067099003;
X-Microsoft-Antispam-Message-Info: Lzvid93NIe/6/atlf+lbZjo24Nm2I8Ob4EWi6DFail0bK2KbJRIL3K3YaDR86AezsWKykOEj10wy2l2BUwv6y2IudEXnAqWF38D0KGNcuCoymKL8IpYaFM5CQ3iRodvVzsT6P0o/LhzAEi2XJw6fmt4cCLdlNr3F8iBfdoU/XCaAPrhcqVrWSJVFHckcgxdCkeSZ6z++Ayz2jkObu0awAfB+OBcAg0O6623Ei6djjvAxS/VkJp1y42bxlMNsbaaqm6tt7hd2gROPmY2X4ag++cX5zYALqxhkOExwgCscz4KEekBxCyh698ud9tBEdgLgkpUQ6eQvflGqb9rxGnBsQcqWbALd4J0TdGFBLlhpQ0D2iFUgHQoJUKA8Kc+3u4jJ+z951gB9SwAYkdS3mLXZDCiR6dPL1pdUrYiBt5+LPERnRu0SclvMLWy1heCVI8x3YI7oHkPF/5tqCKzz49CYjUF2kvinq+ao0KsamWpUb9DvaHVlbXtAB783wkQr3EPQcQBDnAsjZ5BjcPionx1SobsTNUd7WR1aLrfrwdEDJhLCuMr/JUsLZNyl7ifBBV3HSGGn4ob8JvfTCHE8DnX/2LYrorjeQZHcFC7e4stfDCmBcydm0BhHGuDT0LLQhw4MT3YMf8hVEg7hMyBoi40DoojHkzHIAAt+XDHfVS1YjhEHAE4eSkF89q9QippPnP0q0/Bo9yV+kUa9BBBovLMk8g==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(36860700016)(1800799024)(23010399003)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003)(261026140227099003)(261028144727099003)(261026121527099003)(261022105027099003)(261021135927099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: IC5EfhZnomCihnqnTVHEl0lU1Ut8VD2tM4uOeCDzcy9ylSlUCuT8IWf7PC9HGGWVUbsxst2bPpNbNeN0o1EIJi1y63DNRvVbV+7vZlu5CbygZ+bkn5SXouUhVcV94PEuhUUZUs6c7szKkgYfqcu05FjsTVHcKtUhZFLORwTImmiHqYuhXenrZMTOTqfxuuks69893EOkD+aoHSSKvSNQrR1kzTF0jbQddKEK15rjKAoEkOrHjBlNzxGEt1kSEJYXYq/pT0JCs875QM9QHMDSE3PbHJPsstZgF7ZeFvwJwVY0+C9GbILpq220y6uu1ZfOjNnr6Qgk76QaXOe6YDhmjKnlb1+Ity+pt/GPdYBJwxDLdOc83xLy9409i+IInJkB9URL3H4Z0OJ8WeAV3BCSBDxZQbqluEnK8+jZX5DX8eyGm6WJbubWq0tJyLAaV8Jg
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 00:50:12.3737
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a2830032-bc8b-4ce7-e95c-08df49c4e596
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: PH3PEPF0005961D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9446
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_165024_944958_8AAC9507 
X-CRM114-Status: UNSURE (   9.10  )
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

On Sun, Nov 15, 2026 at 07:30:34PM -0400, Jason Gunthorpe wrote:
> The use of the dma API on other arches inside iommu-pages can blow up with
> the fake struct device that kunit creates and result in crashes. x86 uses
> a direct arch cache flush function so doesn't have any restriction.
> 
> Reported-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>

