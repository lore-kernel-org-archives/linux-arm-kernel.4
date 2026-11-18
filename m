Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B75B4606A325
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 06:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cvm4P8Hy;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=yPF+AAU7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=muuCZ7DSXV/IjjPENJPY4XyOou4pzmPVRIX4kU7BALE=; b=cvm4P8HyqYW4o2k6nzMsqRdqR6
	vFu43XkYwrmYdQqMHVRgEH3aY9psn1TaD8YUvtbr+3jJIdCp6Th4kX1G35wEv0gFp/f2+8a9HBRjm
	/SWRGGI7DD3Flxzn2JxHqYueBFpb2rkyoPmb7SEJ+vvW6PUMMseaworOKZestM69/iUqHBuKIUhXE
	KovRqJdChNvpqykmlyN01B5lln5JqLbMzf9CJO9pjHN6NUvxJxYhbUr+AbJT3p1UshkQASFKm7t3h
	WI7en6Gw5XczDScRDg73GcYF0VHcl+rJT3od9kMq0BmccAAz2poN9kYtM2tmWo/RHntm+5lWj2sti
	avES4iFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTZR6-00000007vmJ-2aWc;
	Wed, 18 Nov 2026 06:46:28 +0000
Received: from mail-eastusazlp170120007.outbound.protection.outlook.com ([2a01:111:f403:c101::7] helo=BL0PR03CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTZR0-00000007vky-35Bt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 06:46:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BYTzNEWWGBaUaTihbuNiqmRer2huNMIn90+hTBgy/pYum9yfV7qnQLbSiADwG2R1w20jNp+TXfkr4CQpNnUFXSW3GdGlcStBw3OJk5RPlJCIUhySZRPTcyCMVRbH/0ZLa6G89skzy/C6KvE2o37FG6R9rFg1WAbI5igCTCpwIcbqumQjyHBSBa1afE5l6g/TkEW3Jg04SZiTqexHrsUmuYgPcrbtj2ngUzKO12+rOeG9zm15Ct8cW4Lj2CqDplfQBnUuAx7rm2dvK6SAIi83c4AJjc2MtPcCE51bUSn9a6VEncfqbyNSAlVnH55LtsLWbL/W1eOxwY2sDvgOBtCAaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=muuCZ7DSXV/IjjPENJPY4XyOou4pzmPVRIX4kU7BALE=;
 b=ty1Y6aOePGLooxdyazn5QEZIk/V7IFomKMfa75vvRDWuEB/Fvah4vZ4RFKqj/VcWT+03nNMMRRxkwdPT9bbdN6+Cq2J3IA17BUd0Xo++ZLumvqMqd/Q1PZIOXRNL6RkIccT1xdrTjMkQs10QgN/wVdA4wlDIYo8EHvfr1/7S11QmYl8XEstrd4GVQkFWHLAzUryCD9uUYVEGy8NHTiMjaVCWnaeXq9EYH5UuvFg9nbZ+s5UesCMqjkzaGZftZkJCIKZkdku4SSCYzUcnR0nm6eYcR+z6UDt3eU6/bFUsEr3TdSJPYDMJ62H7j3DXsASclhtUfgYLBQEJptq7CMAlCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=muuCZ7DSXV/IjjPENJPY4XyOou4pzmPVRIX4kU7BALE=;
 b=yPF+AAU7fq0HSo0iV0RNQ0RIfkPiMaiU9hOSmhnJpEcaJtajKpg/zjrLkS3+kFFLoH+z5PYNcW8xAj0ESYB9raf1QW3UE5r3pXyhggnKgpovPb497jmyPthVKnt19RIk3rOLEDe5Mt0glYOAoFqa0Rceaohe6W24Cd0b+62/QaI=
Received: from SJ0PR03CA0091.namprd03.prod.outlook.com (2603:10b6:a03:333::6)
 by DM4PR12MB8524.namprd12.prod.outlook.com (2603:10b6:8:18d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Wed, 18 Nov
 2026 06:46:14 +0000
Received: from MW1PEPF00018892.namprd03.prod.outlook.com
 (2603:10b6:a03:333:cafe::6c) by SJ0PR03CA0091.outlook.office365.com
 (2603:10b6:a03:333::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Wed, 18
 Nov 2026 06:46:14 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 MW1PEPF00018892.mail.protection.outlook.com (10.167.249.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 06:46:13 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 00:46:12 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 00:46:12 -0600
Received: from [127.0.1.1] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Wed, 18 Nov 2026 00:46:09 -0600
From: Carl Lee <carl.lee@amd.com>
Date: Wed, 18 Nov 2026 14:47:53 +0800
Subject: [PATCH v2] ARM: dts: aspeed: anacapa: remove unused EEPROM
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261118-arm-dts-aspeed-anacapa-remove-unused-eeprom-v2-1-ba49ad6e1e25@amd.com>
X-B4-Tracking: v=1; b=H4sIABhK/WoC/52NOQ6DMBAAv4JcZyOWS0qq/COiWOwluPAhL1iJE
 H+PwxNSzhQzuxJOlkXdq10lzlZs8AWaS6X0Qv7FYE1h1dTNgIg1UHJgVgGSyGyAPGmKBIldyAy
 b36RY5piCgw57TZ0x/TBPqhRj4tm+z9tzLLxYWUP6nPOMP/vfJyMgcDv15qY1Ut0+yJmrDk6Nx
 3F8AbIlTxfkAAAA
X-Change-ID: 20261110-arm-dts-aspeed-anacapa-remove-unused-eeprom-415ca4dd56fb
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, "Andrew
 Jeffery" <andrew@codeconstruct.com.au>, Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<carl.lee@amd.com>, <colin.huang2@amd.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794984479; l=1307;
 i=carl.lee@amd.com; s=20260203; h=from:subject:message-id;
 bh=dYSV9mKdQnC6h/+aQ6o0Kf71PKiug6RanpwYKVEWGIQ=;
 b=RS602ad96fGFzFypb50GXWM8tkXgbye/a1OOeUrDUaHFtvgLKD7tz6/uulMz14PKfKI23La5e
 dgU6fSXnHwYC1h2xSw3CMbld6NxHauvUPcRQtnliqbupZ8tzY8FfOCt
X-Developer-Key: i=carl.lee@amd.com; a=ed25519;
 pk=pyq7QaQvoxMg806KVkRwpCbiah+7ncWr4MBpK1AEyjA=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF00018892:EE_|DM4PR12MB8524:EE_
X-MS-Office365-Filtering-Correlation-Id: 128020f8-c36d-414c-0ed1-08df453fa38e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|1800799024|82310400026|23010399003|7416014|376014|18002099003|261009223027099003|13003099007|56012099006|10067099003|261102123227099003|261028144727099003|261026140227099003|261021123027099003|261022105027099003|11063799006|261021121427099003;
X-Microsoft-Antispam-Message-Info: Y5cgdrAbBuj/D9XX97gWgz1SwnD4C8fTNGm8tzwV+6YTDykDJNI6hJnbQkXIvehUkfg8eYgwDHkida/fhZyyfxbYXNpuoPKsCO9H6q+RE52OF+QdIZLQ+vKUKsVdmGdraDMj1d6x81fAz71kseTDRiYpxIfgkE8mN7/zQInVC8Y+UMhi4kGx3hboRPzsb05T8QHlInf1dSo4Y64gBKGJFq7gHpSbNkicxWlZQrRg14RImYPh2D66mF6krn2xUPHU/1y7frjIxnSJVAA27x88y4eOkGvq1+tX5wXcf4ywQMVgfW7mik2Fo5eSU8FT155g7jMydIx03r8xTPgif8wXDKE+pYMZTgH73s9HjqwhtRCv0I+lFGIeFL+feopMLMDv4UAneTZMt871yxy1IbZN06K1cqFuNVl20YrsU2lZWrNDPqfs+bkUrhFQSSR35LxzXGE0+HLCNW5ZS+6Z/a0nhenmIx+9Gvu5Ec+J6Zr7Yed4zoBCoX9OcTBmALKMlsMk+9uWWhH2A7zd6PrW6eG5ZEHf7hXz/KcPCCaGhhiI2bVE86JXHMGcDGAwHJkn+CSf3KOsU0sCNbs7ruS9Zq4PZlhZLahPXee83yn2LiVdMuv0gHuC/xYIEGFW/raWJcBGnx3nRIBUKQmSUOK0kQeotTfnUOaPEBR7+FQ7ZSLHj74=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(23010399003)(7416014)(376014)(18002099003)(261009223027099003)(13003099007)(56012099006)(10067099003)(261102123227099003)(261028144727099003)(261026140227099003)(261021123027099003)(261022105027099003)(11063799006)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: wZnYyHrc7zRp55Yw+AYX0x9PcfW37cIkkRTOZVl78ZH+OF+UovC1bnS0BSacXM/ho12M8HwP3B9BpwxXMiddrid1abLowOy3S60F7iroziEs9ki5gIE+w9KdNxTfqhcKuYNRlYbqLsHqhDkO6+Lm4Cca+nxb3v5H1e7wT/VzBAcf2yySyhz3+v7JYpJ+JdOUNusBjs7yrtF5n/UpV9rOrVvgmc1VT9SiYJ6NPA3rflA+Vx/W0BblKXdb94DMKtr8vofF6osD1GF021tY7uSECOqavubuFKvm0oFxWcQXKZuD2nS5KFGlLdP1rbo94cGzxLguruB9Up2o7JHN4nztqE1N0YwVeRmf3I+j9HV/oIKMPzurwHFJH+o33dLJhjOCCSEkd3y5WAtTEwWikVUHbuuWicVGbGaCNi3LDPOUEOKgf7k6Lfwy8p2KV606pO+D
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 06:46:13.7805
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 128020f8-c36d-414c-0ed1-08df453fa38e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MW1PEPF00018892.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8524
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_224622_780357_8E28FD20 
X-CRM114-Status: GOOD (  12.46  )
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

The HPM board ID FRU EEPROM is shared between the BMC and host, but
is not used by the BMC. Remove it from the BMC device tree to avoid
unnecessary BMC access to the EEPROM.

Signed-off-by: Carl Lee <carl.lee@amd.com>
---
Changes in v2:
- Update commit message to explain why the EEPROM is not needed by the BMC.
- Link to v1: https://lore.kernel.org/r/20261110-arm-dts-aspeed-anacapa-remove-unused-eeprom-v1-1-e3b5d9cc1a03@amd.com
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
index 1fddf3a5d138..1b05b006b3ac 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
@@ -805,12 +805,6 @@ i2c13mux0ch4: i2c@4 {
 			reg = <4>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-
-			// HPM BRD ID FRU
-			eeprom@51 {
-				compatible = "atmel,24c256";
-				reg = <0x51>;
-			};
 		};
 		i2c13mux0ch5: i2c@5 {
 			reg = <5>;

---
base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
change-id: 20261110-arm-dts-aspeed-anacapa-remove-unused-eeprom-415ca4dd56fb

Best regards,
-- 
Carl Lee <carl.lee@amd.com>


