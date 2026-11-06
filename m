Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E06606D809
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 16:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dNiaKZ55;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=gkX6rv3c
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7ZWMd8kjUCmJagmx0GxgP086SxqVdswLklhILoXspFw=; b=dNiaKZ55W9cM5oPFNLaP/gKZQ6
	nYUXroZJS/gmtgttOquj3S8PR+U0xTAH26M7S7iV/ZtR/iEYirshwQXaHlXcs3FnpYM0q47uYdpQC
	xKDx+5I4PvzzKTrmAHm1stAOMU8zMpoJKybS5jKx25HHeuD9ZtSuFEfSQ5DrE+Sw4/sTcjwDGHfon
	VJdfosayFoQWjVWk8BzjY5McX/6UpT3QkVnzO3S/Bwqgtw8eeh14RIrZysj303KGFxGg/B6Rp/5La
	s7xHPX41exspSdscprS0Z1nar0UDOTaVutMvnKjpOdOxMqsOu3VWDec4RltdKqS/Qa0gM7ZNa8eWX
	mfvrP32Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPMts-0000000D4db-46fv;
	Fri, 06 Nov 2026 16:34:49 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPMto-0000000D4Vg-3PhD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 16:34:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hS2U4I1Kj1ThSAsTrRJJ1Fc+YMm62RKiFVcBICO3pyXpkWHO1FRhs/GBs4Tip2gCX6ORm5de45N3AZB7O/R+DNertLrSVk0JuqF/yuTsqwnsTDNZVBlPbS1FTmryQUL2F2mIRDrg8iLHGR9izUDCcd+GthsAM/MuewPWirJAaKQ6zLkGSEhbAyKC8TAKYpUhyyl0XA4iI5CWDoPCmS1VLbSvGRAjvw5t7yNlcBh6hgYFoYjo/A3jCzqfBPXqPwhA+O5t0vS1X8uB1dhT4aXqDLUuGmfIS3quWxwWOZ/KRXr6wtn1ZABypnsrgzqVAk9llGHrDoqBMd2+mwSeSgR8TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ZWMd8kjUCmJagmx0GxgP086SxqVdswLklhILoXspFw=;
 b=gA/jH+Ju6t5nf14PrzqbIWaJmSL+ZFD/6VtdhhAJ6eXdpFWGI4VdHJEg2ahEtA0R3y8tCr+3f9vofwfGVcjBBdqGQVq5AJh7MSmV2g7XcEejkxvPoukzFQv/s+FzssUaA50YACPJf8UnShP0WREj+E9CT8ACInylEQdIRGixEtvJUkedvjoNIvUgsUo/ZoaQDoLEOJZJSrYbqK2NqY92+n2TwhFEIXTiZli+De8BpbjU7/Gic34244tlIppJoBoI/Ab7sX3pJmJIq6VsmAgLSASO4tizjNStou8Gsk5H7BPsKm19gaOvUYsv7yEi29FwfXuDoT0iB71v+zcp2aYOAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ZWMd8kjUCmJagmx0GxgP086SxqVdswLklhILoXspFw=;
 b=gkX6rv3c5P4oDxb39U35lNOybQ//BlwcPX+bT2qPdRqaSsUu5JN9llSU1GUlUJNfsyZusNnuZgM3Z/uG9sO+Aw6ZxB/u/nIFkaRFfKPMiRN13T/S3pVppgzo9sdR3+AD0Eh7ESe6dl+/8m+tXJ9Qzw+q4caTqsMK6HLieP4ccF79aaMZU57Q2CfFRCPkZqQHb4Pchf+kpn3dnF4WatOwL3MnZQjXd2gJsM02GtBj73iXPIT5SeTnpr81Bb6J7UGygOM139fqPDN0FpP8HvbRleFXyWgwO5SpQply3gew7LfKrQEgCZ++9WSulxC0pmj/rpU9gARM2Glxe3Lna7Mm1w==
Received: from DU7P190CA0020.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:550::34)
 by GV2PR10MB9585.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:2f8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.4; Fri, 6 Nov 2026
 16:34:39 +0000
Received: from DB1PEPF00050A01.eurprd03.prod.outlook.com
 (2603:10a6:10:550:cafe::31) by DU7P190CA0020.outlook.office365.com
 (2603:10a6:10:550::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Fri, 6
 Nov 2026 16:34:39 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF00050A01.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 16:34:39 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 6 Nov
 2026 17:35:09 +0100
Received: from localhost (10.48.87.124) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 6 Nov
 2026 17:34:38 +0100
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Russell King <linux@armlinux.org.uk>, Wim Van Sebroeck
	<wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>,
	<devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Antonio Borneo <antonio.borneo@foss.st.com>,
	<linux-watchdog@vger.kernel.org>, =?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?=
	<clement.legoffic@foss.st.com>, Amelie Delaunay <amelie.delaunay@foss.st.com>
Subject: [PATCH v3 09/13] ARM: dts: stm32: add watchdog0 alias on ST stm32mp1xx boards
Date: Fri, 6 Nov 2026 17:34:25 +0100
Message-ID: <20261106163429.618392-10-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261106163429.618392-1-antonio.borneo@foss.st.com>
References: <20261106163429.618392-1-antonio.borneo@foss.st.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF00050A01:EE_|GV2PR10MB9585:EE_
X-MS-Office365-Filtering-Correlation-Id: d7c7819a-648a-4b08-0ddd-08df3c23da81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|376014|82310400026|36860700016|7416014|921020|11063799006|56012099006|261021121427099003|261009223027099003|261026121527099003|261102123227099003|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info: 9R/jjBbgdg/24Ulv49C8EHiHeqtfYrXDjKmloNwbrtfAL/fNN2KuqptYhqqPX2hMTtN+PSuYzVQdZcMlj+NpS2eO6ziUeeOUNFHZ9PvUtj3qUtThx2+lMJkj6NVlttz9E0MJs1qA5SbaUwugqihrDcfgUOBElNVBfTe8sIuGIfE90MJyiNj8cBW2U3seniJsHc3TujnACAoWGi0Gl/OKkk+oKgpmTuRiRsYq1ikkKfJ8wkJTxi7ZeLmrBBPgR8Csp/bCS/mYYNWCucomaMXZuw7gWm2/MsLUApya9eV09bZV7pPzvR/UT8Dpipj+B6TQmKB4nAhEbyTBFN5Dc0MVIRORJxCLO3Ge6qcY7e2NMtDMioyegj12utxg5koq0jCY+W79taRwP76Fvqb5NZgFE4dYwSPC/xGgM7T1edbym7LU7Zo2n+FICPG1PKHpjsCT9A55aMfqpLyqjiwt/vg+thqApifkJ8fIZc5MT/lWJh88XYxmVdFW3CEs8DhPqTzGzPAUefdkCVDBa/V0RMDZwbog5+4ls6+cYFdq2FIPIMdre1u+HTHiRXlYF4N5w55Xic3SJc27QHPi6rHJaa0/Q3WcfqyJ/rdfWTrfAv4lqB2laeqzeSCpT6L3KgnwPcoaDBziGCBcadMzKsTz6+DM04juhy962oS5kOguta7vIjGf01V3eZSPzzgQRNXxibN9+nDVClt8m8+P0P+UoOBRS+unecdfroeRFcoCciT5eRIfgNSOi7P3F73Q0c1MGI63
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(82310400026)(36860700016)(7416014)(921020)(11063799006)(56012099006)(261021121427099003)(261009223027099003)(261026121527099003)(261102123227099003)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: FYrCeCsfcIwDYbeu8HCxQdlB/l8wNbj03UBHvgCAyhLEt279nI58VYE0Mmh/RCKKXG+ZMY0vtcygOVEgCg4egyEuqpiz2Tw9gmbMxkJ9HB7LeR9yz/3dAs3jxz+hdYDgD1pjL48T0JEK2vqTi6BAHN8fEbPSAyAXSRHuDechHuTUmoEnF7sfaLPE+gkj+tQ2Kc752l1XWUtSxXn0XUCJwQkMKPtFW9bIQeHs8KjzJ9ZLuDULlrd54/XwSIq1AlSmp66HCz0oZVahKQdw0eaO5T/yQ4LHGC52wzcC5MmLbOUGVnFKg1Aol9hAgfAMKZVeHCwBju8d+iee/XR0KFpckGWFT+lOfhlu3zKN/KeWyW3ccjWWpFj/5kBDVotrI6JqS12/WLVPrv8YtBSdjHpzfh4L3cA8KvVlZAdLBejs9+YOyr1ytngIJvPYdqbIuCtz
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 16:34:39.6132
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d7c7819a-648a-4b08-0ddd-08df3c23da81
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF00050A01.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB9585
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_083444_880940_B87A461D 
X-CRM114-Status: UNSURE (   9.41  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

With two watchdogs enabled on ST STM32MP1xx boards, assign the
watchdog0 alias to the watchdog that may have been started by an
earlier boot stage.

This allows userspace to identify and ping the appropriate
watchdog.

Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp135f-dk.dts  | 1 +
 arch/arm/boot/dts/st/stm32mp157f-dk2.dts | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp135f-dk.dts b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
index 2d6c5af7e4816..bd403acb1577f 100644
--- a/arch/arm/boot/dts/st/stm32mp135f-dk.dts
+++ b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
@@ -24,6 +24,7 @@ aliases {
 		serial1 = &usart1;
 		serial2 = &uart8;
 		serial3 = &usart2;
+		watchdog0 = &arm_wdt;
 	};
 
 	chosen {
diff --git a/arch/arm/boot/dts/st/stm32mp157f-dk2.dts b/arch/arm/boot/dts/st/stm32mp157f-dk2.dts
index 8fa61e54d0261..02697c41a2f6c 100644
--- a/arch/arm/boot/dts/st/stm32mp157f-dk2.dts
+++ b/arch/arm/boot/dts/st/stm32mp157f-dk2.dts
@@ -20,6 +20,7 @@ / {
 	aliases {
 		ethernet0 = &ethernet0;
 		serial3 = &usart2;
+		watchdog0 = &arm_wdt;
 	};
 
 	chosen {
-- 
2.34.1


