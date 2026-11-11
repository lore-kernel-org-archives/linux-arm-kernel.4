Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 441A6606C13E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 22:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NEWhFjZZ;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=TtdajDtk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8NF8wqHL/2ERE1gP8jiwdICOCcYA6IfqRRcpkrwML78=; b=NEWhFjZZj66VhAbxPl+erIBZim
	Tdl4c6aJCFriSjMAHwulWD/ycfsbyDUHMN3W6RqTxOxMVxB67j59/6H8B5sKcnY84+sP3rcELZwQx
	XCRnviDIZoTn2ZVpOMX8ZusKJMT07b6tYxYzyqb5Ur/KMCxXRuR4ZkRiznVonXz9sjhRumn/0uuuV
	RxKtDWU5LKTO/dISsxErr3unYDhJOKbJ/lpZCVhxs7tErgLRz3mNvnFb5t8iQ3Cx2s2Q7cuSSjLDi
	mxcBbO9H72/+NVmV3kg1Q4lLCpkTLRBfXDM5BHDRDHV+pw/Yxfrm2r3LZoIRzWQUhqRrTMVrxKq7G
	nQVdMumw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRH54-0000000825Y-0asf;
	Wed, 11 Nov 2026 22:46:14 +0000
Received: from mail-southcentralusazon11012036.outbound.protection.outlook.com ([40.93.195.36] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRH52-0000000824O-12fA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 22:46:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GndBQtYa2c6fVw44EnRE4S5H5sSizEqs0ESnKvnyUtWtFSm4M8SRXvTjpUFQeerlD7fs+88pSCQwZj+Z64gz8VlRIx+NN+cuy9vHIRGTom584MxH4yyuAvd6KkTb/h9sLfrcdyYMl0VRTVhfJSG9TvWiQJf9tZkpwESAgAsKZgbgjla4Y4NssOaYqDZLTQyoBHhn5Fd2RZS3fLoOUq/ZUbOsoZkeYDnGseUHrZMyD3NAM5oyWN5BktHsuGq3Dz2EG97JFMG8hE++RX66ch7l4PkgazRLPlBrpK807rG8bZEQ698jHKvJvIrYIqtCX/NLncZPLX/GfwuUNmSoJHtdaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8NF8wqHL/2ERE1gP8jiwdICOCcYA6IfqRRcpkrwML78=;
 b=StAMmFs8ptMxu4sQkQpEIEGdNfIdRWtgvHxjokoCDTYppjBtNRoiAJNEgM9b8jxksdOkqyCAZ2JdjhTpYY0v8MbkS1Wmt7jOeRVyKYeZCXvSDnRQYsJ0ep8eodvFpqx4n7yTRt/tYnMsbQ901c88zeBOmiEQlnx8cYmfYOmf8sLpQyqRp4cwY6MlQtkf1WSLBCV2wSIbImx6vr7jYM/Xa2SGTW6sgHfsuphTS6xznb8GiWc4ERdPW3Hf1pyy+SQtOFyKexy9Bql5POvpnoIs60f1KpRK2+qgneSVu3PE0h6HuQURF01ZtEbF/1/Joc+1JEjSnGWdhdTbtG3buZv5qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8NF8wqHL/2ERE1gP8jiwdICOCcYA6IfqRRcpkrwML78=;
 b=TtdajDtkQAuJJWfb8K8HmIHdM5WA+7fTXx/TUFZCPQ6TVwm7xuUzeT2Lhvh3hF5eyhl6pIaFnMfBeXw3FTjtakMV6g2r8gRAx6A+v9zyPLLnYpzdePj4aXlQzwERr2+duRBeQiFNQcqng58f4Y/zTFic2cLFlZYFe6FunuEZR0U=
Received: from MW4PR03CA0067.namprd03.prod.outlook.com (2603:10b6:303:b6::12)
 by DS2PR12MB9688.namprd12.prod.outlook.com (2603:10b6:8:27d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 22:46:03 +0000
Received: from SJ5PEPF000001F4.namprd05.prod.outlook.com
 (2603:10b6:303:b6:cafe::74) by MW4PR03CA0067.outlook.office365.com
 (2603:10b6:303:b6::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.13 via Frontend Transport; Wed,
 11 Nov 2026 22:46:03 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001F4.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 11 Nov 2026 22:46:03 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 11 Nov
 2026 16:46:00 -0600
From: Babu Moger <babu.moger@amd.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <ben.horgan@arm.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <bp@alien8.de>
CC: <babu.moger@amd.com>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
	<rdunlap@infradead.org>, <x86@kernel.org>, <fustini@kernel.org>,
	<tglx@kernel.org>, <mingo@redhat.com>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <fenghuay@nvidia.com>, <rppt@kernel.org>, <arnd@arndb.de>,
	<kmehltretter@gmail.com>, <dapeng1.mi@linux.intel.com>, <elver@google.com>,
	<enelsonmoore@gmail.com>, <jlayton@kernel.org>, <seanjc@google.com>,
	<ewanhai-oc@zhaoxin.com>, <binbin.wu@linux.intel.com>, <nikunj@amd.com>,
	<ashish.kalra@amd.com>, <peterz@infradead.org>, <superm1@kernel.org>,
	<thomas.lendacky@amd.com>, <prathyushi.nangia@amd.com>,
	<kim.phillips@amd.com>, <ricardo.neri-calderon@linux.intel.com>,
	<darwi@linutronix.de>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v7 09/19] fs/resctrl: Rearrange top-level files in info directory
Date: Wed, 11 Nov 2026 16:44:02 -0600
Message-ID: <fe6f1e9ce6d812c1801115266720eef07831d6e0.1794437052.git.babu.moger@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1794437052.git.babu.moger@amd.com>
References: <cover.1794437052.git.babu.moger@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F4:EE_|DS2PR12MB9688:EE_
X-MS-Office365-Filtering-Correlation-Id: 19d64f98-8e94-4799-cac0-08df404590bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|82310400026|1800799024|376014|23010399003|36860700016|6133799003|261009223027099003|10067099003|3023799007|261026140227099003|261022105027099003|261026121527099003|261021121427099003|261028144727099003|261021123027099003|261102123227099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: HIglSLWrlyoQIn9qHnHe1CctAOnVJjtP8iFNCnpo0yb8d32zgNKgvOqkIZf2XBstLZ/qet7cQnkVbTmc+NblJdLhVY2WD5h082fsIHZv6EQkMp7KJ4KOm9+1tLOTBqVw6CPL4mFme8t4kM0VWdyKei3iNWLrnfcDdujYDGzI9X4Jb+Bh4s4Y4DhhU0Ynz/1CFXXJ/Lfb6K/ad2FaIgSelCaImz7FpLH1EAt8Bj5gaAqr85n2+2NCxFKG8YufQQt7tewyWlbmS5d5QE7Ipl2djdPDbJeKmDtgBlJoniRKv3KdixLR3QfTNgODFBsMPcr6WsnYJQbD9CxVfHl5AenDxzf0p4dlgfh3rzwbnLkN/a+4ckFR6tMXl3YCHBA5tPc6jVBP5LJA87nAu1ATRyn69e9fi7Hf8MCeeUz1ixknXSsGISb4dQqEMHdEj79j3mJHhA/HbC9D/worQjetpZyNc6TLUt2BYy2WUvddYu6x9CgDxWhcyc//xLuPBrO6GO9srfz+DyoZrlZGJSf1wD5Hpa3q35ef5D2DmqcWdMHaQbksX1Vv9usjGr63zf0iWGBAeFQ9siSyaVRtyDTk02VLE0zkWb+kywvFLZxjB1WQeorTNeG6u9os/y/7/ly/hs0wDKSpVTZaSX0lg0Rd+uM6nxNeHjg6nN75fXqEVUrJrQOBZBo1/7psD67mA9Zkt+3OkzmY3vnTb2Ck4RU6rC2Uzw==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(82310400026)(1800799024)(376014)(23010399003)(36860700016)(6133799003)(261009223027099003)(10067099003)(3023799007)(261026140227099003)(261022105027099003)(261026121527099003)(261021121427099003)(261028144727099003)(261021123027099003)(261102123227099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: rdBiQtKPbEEyJKiFa5U4YTOytCN16C5ngVpETEE4Rc3L1GVur2lAls0dUiiEot+fRkmG8iwlDuN9dGzlrshPS2u4HksmvzQS939EkpY5pGMZc5LKeRXajtGDj1J/sCWzYREMnY+Dq0RI2Ipqf+V04NYkoRvKMp3IratgcVZqMZrLdaVPWlxRGg1AIUHcH1kYkMY4UiABi+x8ivrTV9IE4rDbjVTLJzwiibRfpU0tHU2Fbbxo6xFH+LxgU8lPGnIaedIs4Xafzt/mH1FeYqv7CjEIb2BwQUTYwkVewbZQzQmqMS9BZrFr5UBkGqQiVyeur0mo2b9tsoQpVX04J2/d48e2nofntdX1fDJ0Y8gmc2gLtxTSP3mos8XIh0oEM+pAIh/dnJ7gCgjOFV9eho2QWZngYONjmmlfGNgqwQIub0iuEYOzJHU3y2PLjRCIZkCY
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 22:46:03.4144
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 19d64f98-8e94-4799-cac0-08df404590bd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001F4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9688
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_144612_424882_9D7D5C02 
X-CRM114-Status: GOOD (  15.80  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The "last_cmd_status" file reports the status of the last command
executed by the resctrl subsystem. Since it is documented after all
other files in the info directory, it is easy to overlook.

Create a dedicated section for top-level files in the info directory
and move the "last_cmd_status" documentation there.

Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v7:  New patch to move the last_cmd_status in new section.
---
 Documentation/filesystems/resctrl.rst | 29 +++++++++++++++++----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
index d13a4998ee7e..2d672bbb69be 100644
--- a/Documentation/filesystems/resctrl.rst
+++ b/Documentation/filesystems/resctrl.rst
@@ -529,18 +529,25 @@ with the following files:
 The upper bound for how many "CTRL_MON" + "MON" can be created
 is the smaller of the L3_MON and PERF_PKG_MON "num_rmids" values.
 
-Finally, in the top level of the "info" directory there is a file
-named "last_cmd_status". This is reset with every "command" issued
-via the file system (making new directories or writing to any of the
-control files). If the command was successful, it will read as "ok".
-If the command failed, it will provide more information that can be
-conveyed in the error returns from file operations. E.g.
-::
+Top level files
+---------------
+
+The top level of the "info" directory contains the following file(s):
+
+"last_cmd_status":
+	Status of the last command executed by the resctrl subsystem.
+
+	This file is reset with every "command" issued via the file
+	system (making new directories or writing to any of the control
+	files). If the command was successful, it will read as "ok".
+	If the command failed, it will provide more information that
+	can be conveyed in the error returns from file operations.
+	For example::
 
-	# echo L3:0=f7 > schemata
-	bash: echo: write error: Invalid argument
-	# cat info/last_cmd_status
-	mask f7 has non-consecutive 1-bits
+		# echo L3:0=f7 > schemata
+		bash: echo: write error: Invalid argument
+		# cat info/last_cmd_status
+		mask f7 has non-consecutive 1-bits
 
 Resource alloc and monitor groups
 =================================
-- 
2.43.0


