Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EBDC606A330
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 23:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IcbgZp97;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=pDC/xH8E
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=xyp1buzycIzqa8M+araXIBo295+MZBDKOqj/6Zt7Zro=; b=IcbgZp97PGgstR
	1j5Z64+aY8SoscXSBzKjFpgDhUMsLtKrY8Jv8gJZOJ/F2nWSVLA7KCD9aes+sOH1VEhVSzbDyS5iD
	58Z5/EStFY2bdXgYlvOmlSrKzxy4yniSTJJZxBb5yquMhAgIhRMBt3wb6Pf1/78O7KmvXgi9wbXWM
	xkvqmOgw5WeVGBQegkKba+Rs0wD7DZQCaBTFeHvVU3zKNvUfrL6mojvVohAHhGX5Dq0vqs/huhxRx
	RfLEG5WkQ7iL5UtWPWBQnDYhTtF9OOvwwLZtnzaSjHRZyHDl4FEqYg8jpli7LKDoU2vK8bhhWwvJl
	lXfAa6ATZvS+iP1Gw77w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSjgf-00000000j1v-3dPg;
	Sun, 15 Nov 2026 23:31:05 +0000
Received: from mail-westus3azlp170100009.outbound.protection.outlook.com ([2a01:111:f403:c107::9] helo=PH7PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSjga-00000000irJ-1uZK
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 23:31:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uUWE6h/Q9TGhqfXUkC3U8sYCyXOycR9okLrhDEriu46IH0NR2FuUiusuovPQ8u6dt12lTT0C5NHhMH5t02jK0XGq2IkPpWssup1I50zSXZBzD0uKUySh/UXZgkuDTr8wV5C3W/nuJatiUF439xkEd0As4sOvwjst9IhaOKEg1HspWxyBNHTv59FsiKaWisHUXFeAGQLxE/5gXG153RPgQvY9m+iPZRn6J/7zqfihARlKvUk5/ce60ufhlfQaeaxYCYgP2+JTXFKa6XoSaVQ2d75FHbw3gla/Etu/kZIdeDYzYbiOURjo3lNdEhqCAh6d9ZKo3yuCoUdryHFiZYVToQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xyp1buzycIzqa8M+araXIBo295+MZBDKOqj/6Zt7Zro=;
 b=fUIHZFby5AQfqFcA165OyF3c2mCEjPzC+ulTXidhBTYliD9fpiqThltUI/1E3nr/NyxU3eMKAYBoSNjrN7Yu46sj5Kj45Dc310lg9LI73TUYfpRSESB0HzMXouw9mTuM3MZ8Ew+68OI9SsbT4z3e9QD6UUfyWERFE7a3EuXh6gDvEmJMmMwea/DIZ7RUVrIaAabjO5c5iQUFbSLq/5DToIjH5w+OzPLIDQ2XNUWMfKaecKzVmc/1FefOoU0OrpHj4DIJrVbX0xGJ79wLHaj67/VVN9u2T97SUywmkf1xkOJDi4aSIC3Pqvg1IUTXm+PYPjwa7QlWyAASs48w2EeKqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xyp1buzycIzqa8M+araXIBo295+MZBDKOqj/6Zt7Zro=;
 b=pDC/xH8E+PASeLlNSwnISr9/DNbRVbz3HmhiLWDS5dAFoQIAW5Ndgpnkho509FedkmzYlAv9d9JXStyWjZRLrlRVJdQqLngo+G1KwjmOu6tvEGJfr8za5w+KsM96CrkmQBWr0hoYGb21zwY0J542fBMzFHeMph5GQQ8C6JbSYXaTyrzAWMQIYnAxWn39sZ+XLwTicHodpJXIRYYFOKt5/DZuM5VG+rbEc0hU8OcTjAZaGYNy7oEyaNAVsG9BDDg8V3hpNGMGkRj46O/L3gNyW16SMQCiK/MRoVBhXY9JxJk0mY1cvGtrNKeO7r488CHDWOTgK6jREGiihkCZzb0AHA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12) by DS0PR12MB8815.namprd12.prod.outlook.com
 (2603:10b6:8:14f::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Sun, 15 Nov
 2026 23:30:46 +0000
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d]) by CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d%6]) with mapi id 15.21.0615.013; Sun, 15 Nov 2026
 23:30:46 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: iommu@lists.linux.dev,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Robin Murphy <robin.murphy@arm.com>,
	Will Deacon <will@kernel.org>
Cc: David Matlack <dmatlack@google.com>,
	John Garry <john.garry@arm.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	patches@lists.linux.dev,
	Pranjal Shrivastava <praan@google.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Mostafa Saleh <smostafa@google.com>
Subject: [PATCH v3 05/13] iommupt/kunit: Skip test configs without supported features
Date: Sun, 15 Nov 2026 19:30:35 -0400
Message-ID: <5-v3-97feb2edfbab+748d0a-iommupt_armv8_jgg@nvidia.com>
In-Reply-To: <0-v3-97feb2edfbab+748d0a-iommupt_armv8_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR22CA0011.namprd22.prod.outlook.com
 (2603:10b6:208:238::16) To CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CHBPR12MB731189:EE_|DS0PR12MB8815:EE_
X-MS-Office365-Filtering-Correlation-Id: ccbed500-99db-4df8-e2e9-08df437078ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|23010399003|10067099003|11063799006|56012099006|261026121527099003|261026140227099003|261028144727099003|261022105027099003|261022075727099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: zAafzJBgOQlh4Tu2TqFs8nPbkcLOj3nScAGzoxhaNxMew0coi/SCcBQRdq7/qmrn2NYKoCOg71pmuVmeiWgtSaigt4jhzwO9l46ezWPWbuuXBn9nTDEa+yGOlAQ86jLtUbMQXSWlepu/TpjQxSEqndm3TgAMdnvspVJn5hd8ZNsxTSZJC0xKH4bvm0eK54ihP3M7RuRDP5lPpLMP49RH4JsaOhgwP/bek65kYClwLRDDTWnOXfDvaYf0g1wjB28i1CZf5x3RrPQ+8GYB9jghqdhdT4vJROT2hixYA3O33ANVRo7659ESth8/Eca7/lIGtnt3sQvFEEHEA1TDA3n6vWkbdF306t8n7wmYDAiebW6bFf1q4eHvDLtuXJhuIukr9K5bRCudslXC2M1ULmQ4nU1jeRvVaoXUpqW+H22wtTqTZrApRwHJaXJItGlrJCyw067tSCy8KZP24FKzWF9PdSTALG7BnroHEjcPyR9Zg6dRJ/fYg2ITODa8crt4x28ewF2DL02lHazGOu6OHZgPYGBeQuP56dfUwlZ23s/ANGpVX/HV4VLEXRVs92zq/R23uDiDBYJNs5VfItDbuqsWOJw/IHuGsZmZgyi6/Lfvt/ZD+tlULRyrJNpo4KjT3eWtc3a+Jv/JPqwxzFEDLT53luph+dal3vU113RrZZ7aWHc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHBPR12MB731189.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(23010399003)(10067099003)(11063799006)(56012099006)(261026121527099003)(261026140227099003)(261028144727099003)(261022105027099003)(261022075727099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XnrNazG6xXWHOAMThITZPoB1Si2otgk6j/tgE6KHETAaY69sposFIQoCw2zt?=
 =?us-ascii?Q?ZxR10gOSgzOwW0EB85WJR0VKw9ewhW9yXnK4WfzvDyNNhWYqFcuKAIc+kDXZ?=
 =?us-ascii?Q?dMSiI2xvea+QURV0f0QUpA1ek5+fFWyng7m/VD80zzCIqSMLSNmTNJWf3Qz6?=
 =?us-ascii?Q?VZvRe1mdgxU99AJYkv/NQRiJEN4ayN8BSv4O9aTkDuGVCxkFBTo7uqR0Zn5H?=
 =?us-ascii?Q?564jAm9sInJKcbP+nZXk5RB4aoc4yMQdpNENqfNUmEJUzc87AAZnaugvM4Eq?=
 =?us-ascii?Q?Wzk12yWzyZrG/6S4J02niPbBypl9wBKcOeJLAJKWGLtJ9Z4eIvBgHxdtpV2u?=
 =?us-ascii?Q?eAPF9nMWKcXa+lzwci8PIc3TWRToypzMMKfMNH19tPXA6w6nJCcfs+d8fkJm?=
 =?us-ascii?Q?RLAsin58jXyuENILxBBneAjcGckJNNmVRjJCB3JKIO87a4qK+liGjHoUccbk?=
 =?us-ascii?Q?YFMrIiSLx55Shy2cwMDD58e3L5BHI04eoe+Mf4fdWMM89Na8gdkalgCS3fvQ?=
 =?us-ascii?Q?IHm3gB5XqwO2BwCnX+OLqBqZg5yG9/ZiBoYhPEEkEp5FeLNODwU/Wx6v+5oh?=
 =?us-ascii?Q?YVPXOHjdsgP8LpFmJqOHVr4kaiHnk9B32RWKnbGruTqwRhVNMz9LBohHjSkM?=
 =?us-ascii?Q?ncITCkkWAplevqRSP2sxXhMC/2DDPpVdwrBBh4kzgBf0v39D4MSAY0R2ZQDL?=
 =?us-ascii?Q?DaK8QwvYZnTBzhuwTy9g30+oQxj6JCyINzDOUMUtuh6n+LkC8G6oQXrq7zkE?=
 =?us-ascii?Q?hhPPkhc+roN5kKX1JtE9qgRUdN7bG6RHao1SrBvbabsQ4PRgHgWbZRIP4MXl?=
 =?us-ascii?Q?B1Vwr3UIJpjxYpU7T7uZ608NiQzyn/t4pugRsEshPIuUTCtslOF+OhXqOLl9?=
 =?us-ascii?Q?T3iWCgSpQNU1aJ1oUy5J8RggO+AeVQOESn/+EyhAY+rsJRgZfySU2G6TRYGM?=
 =?us-ascii?Q?JsrbhsiKFBiOZLkqcDab8DK0eZ5MBGRBIaYYkq4SFWBBS6r+28l11lo82NNr?=
 =?us-ascii?Q?w34Q9dsc17Figt7Nkh88InFk5roP3Roquw9c5y5vY0i3X9C77kRz0B1sL34E?=
 =?us-ascii?Q?6Qqq2+GS7y+HQnSUcqxbLK9YxlqUrWd0s4xV2eHUycM0eQdQEkg+10QZTGTZ?=
 =?us-ascii?Q?znOQogSyTqDZifUPLUS7b9yqIJjTJSECdO5t8yeR8Sq4Ljk0x0fMVRGm48nL?=
 =?us-ascii?Q?R/FTE3fP6mt6ktReoceH8jjl+BX8N6G6ppW4lnsrHUZwTVk397xAoZjJ7Y2e?=
 =?us-ascii?Q?eiSvq+yLo/UQEGaq631s5AhxecBY3azo2NpR9TcGjs9OGahuIIEO0YebLUPY?=
 =?us-ascii?Q?N/8lseZlwJSYrFvQC8BD/Lhg4830voRv2XNn1TdsVhr8nMqGKGSgf0HLKKLG?=
 =?us-ascii?Q?SyYzUfjNjjNmxOhF4awUZDy0SKnD3Kz+Bt4QPL+h6+UvppHDfykfSm8U98V0?=
 =?us-ascii?Q?LKpIrj2m/d1NNQPXzXnDkcBLmYaxewN4y13X+PqVNa8agXVQ95FOPyXu8iS4?=
 =?us-ascii?Q?f8U4sukD2c53jP4Sz6LYzYqnyNvh/DNjAMhHh2MViPake3C3aACrdiQnwGr8?=
 =?us-ascii?Q?KQaD8kfqJuyoY25y/8vnXTp3EGlcTHF7ZR46fJsfIdMlZvREtIgv++/0GEDH?=
 =?us-ascii?Q?ZJupcJcD7nWckCxuGXUbruwXICvuoVMMRYiHbF61WH3wLCZhRhYRqQf0gap8?=
 =?us-ascii?Q?a6Mw8ELVWqL1liVs5OvtvLV1ICBbRXfPOdTnOF+NzTIqBrj6?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccbed500-99db-4df8-e2e9-08df437078ed
X-MS-Exchange-CrossTenant-AuthSource: CHBPR12MB731189.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2026 23:30:45.5165
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ICon6hYNjnM1EBGdmL4rGkWtLvdGOeQehDdN2Jt2aWkZmsBQ1yvJeMUYnn772d71
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8815
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_153100_497495_E7F85F3F 
X-CRM114-Status: UNSURE (   9.98  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Some of the tests configs can test features we don't currently enable,
like TTBR1 on ARMv8. Instead of blowing up, skip the test. When
CONFIG_DEBUG_GENERIC_PT is set all features are force enabled during
the build so everything can be tested. That is the normal mode for the
kunit.py runner.

Reviewed-by: Pranjal Shrivastava <praan@google.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/generic_pt/kunit_iommu.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/iommu/generic_pt/kunit_iommu.h b/drivers/iommu/generic_pt/kunit_iommu.h
index 79d7f9c8e7868f..558e161eacb05f 100644
--- a/drivers/iommu/generic_pt/kunit_iommu.h
+++ b/drivers/iommu/generic_pt/kunit_iommu.h
@@ -134,6 +134,16 @@ static int pt_kunit_priv_init(struct kunit *test, struct kunit_iommu_priv *priv)
 
 #ifdef kunit_fmt_cfgs
 	priv->cfg = kunit_fmt_cfgs[((uintptr_t)test->param_value) - 1];
+	/*
+	 * Without CONFIG_DEBUG_GENERIC_PT only the format's compiled-in
+	 * PT_SUPPORTED_FEATURES are available, so cfgs requesting bits outside
+	 * that set cannot be tested.
+	 */
+	if (priv->cfg.common.features & ~KUNIT_PT_SUPPORTED_FEATURES)
+		kunit_skip(
+			test,
+			"cfg requires features not built into this format (enable CONFIG_DEBUG_GENERIC_PT)");
+
 	/*
 	 * The format can set a list of features that the kunit_fmt_cfgs
 	 * controls, other features are default to on.
-- 
2.43.0


