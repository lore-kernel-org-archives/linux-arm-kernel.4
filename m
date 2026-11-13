Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F64606A327
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 14:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=02lmrege;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=KDidR/w9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=p1LexfynR7XcG1TjVXrlRyFs5LjQ7N9F4zF+1/1oLXY=; b=02lmrege88EmUhk4csPdZ8A9ta
	m2NRvF67ygHlzL+FlhCWLlwK0XNYTk1OlQWPHuhTdV5fe2MQwc5NG63f+IlropYZcJ4PQDKRKQJ4b
	A92N9on/rBQe4+MoCLbqCC8dO2TBPZbwzFYjxrU/1ONmHwRoH0un0RHY5r7pJYumDpOCxscJWNxqZ
	6gGrIrOGL2hZDPr7TFd1PTPAp8L3BLR/Gt6J7d9dfpJy/vnLDtpL2nzbS477s66EybLE4ZcWa0ybW
	wCKXbzPjfHY9lbanXx+cOAks4OYyOPEeY1wGL34rzxkczXVrk6HucyNgUO7yJiTOdnBo3iZjoXicf
	dBa5O1pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRs9t-0000000D7tD-43b9;
	Fri, 13 Nov 2026 14:21:41 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRs9q-0000000D7qy-3hly
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 14:21:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yKuSLziweKV8K7TWExbOxfhObQkUjiKk5WHzhwyCgtnLNneRuh4Oy6LjZISy4voE6g1OagoajY7TYeALA2YiRfVCeF6c/7mfuXAKJcm2rgNUrk02uCavN9mQxt35WXaGtjupS0nODjRAmZHNRxQfVju4N7jQu/YX+7TGu13O/rvLOrMwe7W6oLrCd7mCid+16Pkt8bqxCdQIHrGoJw3KHN9x0ygfEB4+xaDUetzlZ9WBMDIn+z4l2EWHuC0YQxnS9DMc8GXEGs0DEt9ZaExfhtoYQgdT2EyBSQx9RB/11EfloCUlS3/8uwKMyWNFVpHJ0yxnpISg2fx7w/iOxoQQfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p1LexfynR7XcG1TjVXrlRyFs5LjQ7N9F4zF+1/1oLXY=;
 b=WEBDo3xqlgTPthLMy/APyB6gd5LnVeMn5WDe+RVxKUD7o/WuDbR4zZqi1l8WtA/6mORUQL5mS9REF22lvi7Icej7GV5PfKz5ix9LFZDbSFkeEOSvngoWrQOpw5/AnmCsiJCyxOtDPyim76Gqd7ZyUink7eenVL4vKx7fbJ0sTPFTHSzO17+2X6HGeZYcOvmHzhE8elHVSBYuK3zOTxIDWcBJrNthi+IQN9J0zy7HorC9BSpE/KxcTeP3pFW97iUfuCuQEc9NM7Bw9aWNSvxQNCRIIwAQXpm6G/CbrDxSwIXbAWlTsDC9r8IkivB6FKDW64AaHC6C8Ye2Pdd/qpTVxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p1LexfynR7XcG1TjVXrlRyFs5LjQ7N9F4zF+1/1oLXY=;
 b=KDidR/w9eB7go1GGAGgMlcVEJ4hj9amO39EKkUPZAcsafYDq4ivjl1SlqCej98RuSqo9yKP3vozhEAdItln38dAxqLDyUOAhkP7DIg87KmMT0nMmFtXy91kWwD9q9dBuvxkaD93was9LUuhD0jvxt2tRLCEi3zZpcmne6xWWRokie06k66Jna7Ss+HXiSjxGPJFYaKmiqg+mDZAR8S09Z+KtWRw6XDggTBaYocgkNsZmsQpKEhxT/0bgeJCwVhcK1rbm+TFFqPAInFCpuyG63HVDPA2TvunNm2R1pJArY8NDrKjlOkRPldP5+3BoLK/eyYuSdXI/1vexuhOz0NJyaA==
Received: from DU2P251CA0008.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:230::10)
 by AS2PR10MB7709.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:64f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.0; Fri, 13 Nov
 2026 14:21:33 +0000
Received: from DB1PEPF000509F5.eurprd02.prod.outlook.com
 (2603:10a6:10:230:cafe::2a) by DU2P251CA0008.outlook.office365.com
 (2603:10a6:10:230::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Fri, 13
 Nov 2026 14:21:33 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF000509F5.mail.protection.outlook.com (10.167.242.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 13 Nov 2026 14:21:32 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Fri, 13 Nov
 2026 15:21:13 +0100
Received: from localhost (10.48.87.100) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 13 Nov
 2026 15:20:30 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
CC: Linux STM32 <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, Patrick Delaunay
	<patrick.delaunay@foss.st.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 0/3] Add SCMI regulators description on STM32MP21
Date: Fri, 13 Nov 2026 15:10:38 +0100
Message-ID: <20261113141342.557258-1-patrick.delaunay@foss.st.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F5:EE_|AS2PR10MB7709:EE_
X-MS-Office365-Filtering-Correlation-Id: a070b65e-66c7-4b8b-cdbb-08df41916ab1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|376014|7416014|36860700016|23010399003|18002099003|261009223027099003|261022105027099003|261026121527099003|261026140227099003|261102123227099003|261028144727099003|261021123027099003|261021121427099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: 85Pm46DDdgYAh5LW7K3YbgbE/Iq6xcBITiiwKazznrnssWC+BPbU7DWnV7MTRN9BvjfQww1wZW0c87F4Mld0Rthma3IksOZ8d5G79Siz38GrTCpSsvYdjqL0GnHb772WD3vkof3/mYT/ZtRjzTKPR6ewTO1vJTeZa4IJcwxzeNzpb4rwfpGI/oIoVV10gG9j9oKtaCVghUpBtW0NAnV8w8z8zhrxNvxbPBf9wFF9fLoMkTrMhRSOaLvwzXjOdYoPHXAXlKYk1z0GPbsGQzr44O3+47dv4OJQe6hB8mPHUeAX6HP5MAIpcpkK1tcUtSmWn5ASp8QQloxFPaP9seyvVIVscyK/ldZr80PehFoK86o9N7sSYVtJCG/tQxXrZLkOfvdv6yQX8SBRUmjRjyR9VDA87E4LhjBW+odg3spQd6cTKf210NRh+xgqRUpaVYlv4GyEdaltrR4+6eiyWeDREGP7MyqhZZKCWIb0/Vjuzzi86dM5whB1Z5yuesP+0IBx3wt6PA3h/7QPSiRJ4mtgcxa+HLeOrX97QNOC6979hSTjVX5Wz+wDIrBCIA20dl6Ohdyeqb2C88yo5wlIikOHc6VTQ+HvVytm/8CFbBeWk1mrfQFglxaiALqpW+w7ukoUUQHmfsTGPVo1Dk17wUcOadI4VnIUOK+8L0LbbNhYulOdpcPOwKin2XodInGUvGslw2rB73i78K9AAqQII89eMA==
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(7416014)(36860700016)(23010399003)(18002099003)(261009223027099003)(261022105027099003)(261026121527099003)(261026140227099003)(261102123227099003)(261028144727099003)(261021123027099003)(261021121427099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 4q762TO1+X18XlEupUgPmczU/4f6tyqHOZXKiRhU3YPuvotSe4h3D6rjKizyWBWdb036VldBiuADPcIa0EZ3L6hYRwzwbtfTrl38j12jpPYaLOGs2FKcDINzEHkR3aocEAk1kEqJzIjaNbnZ4YPch0gLcUVRNT81gaRKzvH1rk5M1eoNG3WBnJ6BbL+PQ/k5pQSpredTm6qA6INuT71wLXmje7L3ULtfPLx3HN7dbI4/YG5HL+FI4ibZBVzs4yzlr70lbOYSD0CJJBKPsNONT0358IJ4JtIve2vFvH9g6I8sxbUr6SqLKqH5Q34PdtuBA3dbqRV/E3lVvvoI1DaoroCIcbPIDFXY9paHPxHrDbyzdolJn4OLeNwMwCPZx7+iCR18SjnV1+wBPuQcC0YogbP51sGjnDGcN5xFVMmF7PUJSlZ90pXhqqwIvsiGskx7
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 14:21:32.4894
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a070b65e-66c7-4b8b-cdbb-08df41916ab1
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509F5.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB7709
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_062139_128771_9F28221D 
X-CRM114-Status: UNSURE (   7.73  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


Add the description for SCMI regulators provided by OP-TEE firmware.
The binding file named st,stm32mp21-regulator.h will be also used in
the OP-TEE firmware.



Patrick Delaunay (3):
  dt-bindings: add STM32MP21 regulator bindings
  arm64: dts: st: add SCMI voltage domain regulators for STM32MP211
  arm64: dts: st: add SCMI regulators for stm32mp215f-dk board

 arch/arm64/boot/dts/st/stm32mp211.dtsi        | 27 +++++++++++
 arch/arm64/boot/dts/st/stm32mp215f-dk.dts     | 23 +++++++++
 .../regulator/st,stm32mp21-regulator.h        | 48 +++++++++++++++++++
 3 files changed, 98 insertions(+)
 create mode 100644 include/dt-bindings/regulator/st,stm32mp21-regulator.h

---
base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
branch: fsdffsf

-- 
2.43.0


