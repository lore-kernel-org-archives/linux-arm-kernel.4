Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F1B606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 05:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=adMY6dWH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=DEnywqUXzOJNef5LgzsE7pOnvRhFruVjLnOhXx4NlJc=; b=adMY6dWHav8VgSGd/PzHpzZGBk
	SWih/pKv3dMbaXBNo5jSet8FtDMt3Dni7m7CFlMugcOrXlkxb5RHkiMNEk6VFZW0UZws1yuIIviy8
	0lNcThneKs9T/Wg6kEBbLBHEX+b8+Z4SUK3udnMLthVaPZAx54EB93/LEHhypTUZymgBuRpcxzJ8y
	ZRjIcG3g71peKQo7T7Z4SdIG4h4X58FV4gVW18ZtTPeK+M1R8E2czDh+aqh9yzPgaEuFDpr3+hGjQ
	1Bc2X6vqSSQLEHfVgEYYsYTutu1m4JwsDRL3sGXMDwf7yyq1egtu+5+b/iDSZV0VCIe5wc7wXz8Wr
	X8zH6n3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUHIC-0000000E5SA-0XVq;
	Fri, 20 Nov 2026 05:36:12 +0000
Received: from mail-japanwestazlp170120003.outbound.protection.outlook.com ([2a01:111:f403:c406::3] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUHHh-0000000E5J5-3JPT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 05:35:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nessYTsf17us6ISOcQDMrCjTMSfFqUI7tyqIu0BhFiPVH4RCM79L3LYeJW2LS6s86L2kSriN626Vkc/FLEhAp6fkEw4E8F+6h1wdRF4DHG4whrz6k3eD58q0c+YfbBaUUySQ91Ms69ajiL78SVoju18yfuH26coYp2Ip200Ozyw8W/WofCfmLy+s0urXKx0TLnNM0onAD243LhCdmc+uO1UEGU9fZi1DE+pIANOdV/Gp9GyaPM8cMjO+X7rQHtmNOmUMOdzf8O+xfT4bFYkL8SHPEROh9nHz3ZwjO4uvnxaxCBjzciKkv8mi20XtKl1YJFxjnTEoIn+BoH+w9UVW7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DEnywqUXzOJNef5LgzsE7pOnvRhFruVjLnOhXx4NlJc=;
 b=YhmH18sMxssrByDtknn0Bobr60qFvzTNQXoMs8amY7xizqXrg7tgoSFgW4wdQIDX4XqHyOPOtpd1XyuhTbNtAK0CvqyTCpJhzoOatenKKkocbzWnZWesSl1FJtNSuCLPBmhUjmSWk2SHR55AlUggQgYmOcOGzjfPoVu2liFZfTEI3B5Wf9YiYiF/bS3KRedPKrYvewvwcyXvsNjqCTkdoJeo+cfVHJIImOcX6MAkh4smQL+Qje3MySHPogo7Es9BYCo0YzW5jjBqwAcmQ2APiS07JJNMF055graH15wEb3xFEWCw77wXcwzC9v46RjATrlb7G5TF7dk0zH+/F3sXiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from JH0PR01CA0079.apcprd01.prod.exchangelabs.com
 (2603:1096:990:55::14) by TYZPR06MB5976.apcprd06.prod.outlook.com
 (2603:1096:400:33b::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.2; Fri, 20 Nov
 2026 05:35:33 +0000
Received: from SG2PEPF000B66CA.apcprd03.prod.outlook.com
 (2603:1096:990:55:cafe::38) by JH0PR01CA0079.outlook.office365.com
 (2603:1096:990:55::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.12 via Frontend Transport; Fri,
 20 Nov 2026 05:35:33 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CA.mail.protection.outlook.com (10.167.240.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Fri, 20 Nov 2026 05:35:32 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 0042E40920E5;
	Fri, 20 Nov 2026 13:35:30 +0800 (CST)
From: Jelly Jia <Jelly.Jia@cixtech.com>
To: vkoul@kernel.org,
	Frank.Li@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	robin.murphy@arm.com,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	tglx@kernel.org
Cc: devicetree@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jelly.Jia@cixtech.com,
	linux-clk@vger.kernel.org,
	joakim.zhang@cixtech.com,
	radu@rendec.net
Subject: [PATCH v5 3/6] clk: cix: Preserve Sky1 AUDSS interrupt and reset context
Date: Fri, 20 Nov 2026 13:35:26 +0800
Message-ID: <20261120053529.371923-4-Jelly.Jia@cixtech.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261120053529.371923-1-Jelly.Jia@cixtech.com>
References: <20261120053529.371923-1-Jelly.Jia@cixtech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CA:EE_|TYZPR06MB5976:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 2d3c45fe-9361-47de-09a2-08df46c81874
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|23010399003|82310400026|1800799024|7416014|376014|261102123227099003|261021121427099003|261026121527099003|261022075727099003|921020|56012099006|10067099003|22082099003|18002099003|6133799003|261009223027099003;
X-Microsoft-Antispam-Message-Info: e+3L+nqvn3AY/fHoFCC62HUYElA/hyGKr23KZOXfYBNWDIM03mhJi8r41S+pmMV6SKq3DOEXlJt2aBTcca+5kR6xvi5IHApBYzYNdc73RkzTGGkHI1V0DotR+yHWpo7On3m2s3j4J9WfWFHNp+uf8SPIyqXo6zltoGwOLwU6IxmVTZVh+oDS9dfXSPTAyOeNBjb7At9yEFbUgQuHatCeNJMyLfCZzaY0U2N646qSxuUnYKJEpfu1MyQpv5URmw0RjatW8Cv2w3QI502X6fgO1cDe/zfDbi9ebBYbG+g1flumOQ2bQp4dSKyIQR86qngDiwJlHHmzaTPF6K3FgyCI6MMuyBOF4H/T5e9STRWI6BJzOALkWld+ahyfNbU7gXcSLqVEjyaEwiMdLuFYHpZ6xRxoyJQzcJPTWjBzfcnsLIem6cM/MC0PQZ/jH7SAs9aQFssEfabKDTVYT6xKyFpAO4g4SvyUfQJNVnci7sXr8sEx/8J5eQjzZ+YUZXbe5qxAW85+TSAgTUt7gQ5nwW9a0neV29tJY2sZMxbCxwioEoZTblJSbuQUCufWF4YMqblzRS8PHbqj1NrwBwU3O/23NMfHQLIs4rkoXk9JR7OvterEfyqnpwXE20JkXOtFGGpAnyP9iAnkR8acroIXgI8wOjbH3fmVSjElqSTJwYrI1q9Ur0zqTpxtfY5pq+rHE26jLU/y9TOpNunHp9T5q5TdWc9h+L5/JUFqlpo4wHEYZ5XimYhBB4ivmAGoExVcIqRz
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(1800799024)(7416014)(376014)(261102123227099003)(261021121427099003)(261026121527099003)(261022075727099003)(921020)(56012099006)(10067099003)(22082099003)(18002099003)(6133799003)(261009223027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 32huZVK7FfiC8mBlGX1KEuPfsadVScRG2xEp+n0qkOs7JZshzaI62kmXj37TqGVP9tufcHfyL3kvAqmRbZwdFZyQ186XBaEWHSqNNajgo66zeUty3Z3TaX9kJN2VH9okHfr6+52lBO3aRztXTv9IzwPu/cQuyx4nBLhfgeqIloD+/Y3refCNqE7VumLE5U2AXw2dsCn44+mKUHTfuojmqKo+7SRyI+xv1A5Yf/fjekyGjRzHNAAuQGcYv7xHdr8X8aCPZR4jnF+1IRAgqX7tvsuyMpOZmHnbVAncE5poFVfe/35O8VXyFHgtpEyUPOxi7rIQM456BmRLbm0PUAe8UisNePRCTpGyLtFIvbf8mwc6nJVt6JydscDvKjyo4xuEOA5htyuKA3Cr3tlC+BT20sc2+2Y6RjXsHn9BqcYzKZeN0EhbZaNTXKoZxg8eYx80
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 05:35:32.3724
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d3c45fe-9361-47de-09a2-08df46c81874
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2PEPF000B66CA.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5976
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_213541_840734_0522220D 
X-CRM114-Status: UNSURE (   9.78  )
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The AUDSS CRU saves its clock configuration before runtime suspend, but
the save list does not include the AP interrupt gates or software reset
state. If that state is lost across a CRU power transition, restoring
the clocks alone does not restore the configuration of its consumers.

Add INFO_AP_IRQC and INFO_SW_RESETN to the existing save and restore
list so the interrupt gate and reset configuration is preserved with
the rest of the CRU context.

Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
---
 drivers/clk/cix/clk-sky1-audss.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/cix/clk-sky1-audss.c b/drivers/clk/cix/clk-sky1-audss.c
index e096b8121df3..1da86f6def4f 100644
--- a/drivers/clk/cix/clk-sky1-audss.c
+++ b/drivers/clk/cix/clk-sky1-audss.c
@@ -18,7 +18,9 @@
 #define INFO_CLK_GATE				0x10
 #define INFO_CLK_DIV				0x14
 #define INFO_CLK_MUX				0x18
+#define INFO_AP_IRQC				0x54
 #define INFO_MCLK				0x70
+#define INFO_SW_RESETN				0x78
 
 #define SKY1_AUDSS_CLK_PARENTS_CNT		4
 #define SKY1_AUDSS_NUM_CLKS			(CLK_MCLK4 + 1)
@@ -28,7 +30,9 @@ static u32 sky1_reg_save[][2] = {
 	{ INFO_CLK_GATE,  0 },
 	{ INFO_CLK_DIV, 0 },
 	{ INFO_CLK_MUX, 0 },
+	{ INFO_AP_IRQC, 0 },
 	{ INFO_MCLK, 0 },
+	{ INFO_SW_RESETN, 0 },
 };
 
 static const char * const sky1_audss_clk_names[SKY1_AUDSS_CLK_PARENTS_CNT] = {
-- 
2.54.0


