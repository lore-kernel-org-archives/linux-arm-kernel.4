Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24DE606A330
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 05:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ySFUWI0r;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=MCrhjjvp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8qBAzn3JTu/J1H8FxE7ppx606SKtX3ypPtV/to6M7Hg=; b=ySFUWI0r1f5w0KyEQIW9mf8OwT
	zL7dfpxO/51GBY2B9Wkvgsb+eo/yCgrCDJwXEO5vFHjvKDiiFO3ysqkwvIt6LVv/mm6x43aanw9fr
	MK/VkW1KXb93NGcHK542AJRCFRw4YDcs612flIwpkeqITHZ05pAI5PPPNiqCVxw0GDDoS2vwfNpLa
	c1Aj1HxpSSFkHW532H+Oy0sjlkRGxn1jloSPqFYb/BqJ6k4/U9ZS+UrtoUa9OYashYbtglYwr69Yi
	VjC5/h/lGWOrt4JJ1WS/LuL3VQCWQ+yywPaFrTa6iQff0lFfaFYvDeCr+3dcyj45r1v48TokL0Nq7
	49iRJEZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQe6r-00000002Ubk-0y1u;
	Tue, 10 Nov 2026 05:09:29 +0000
Received: from mail-westcentralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c112::5] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQe6l-00000002UUE-2cO6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 05:09:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b96cJgYdvbo+Z6a/pSYNIMv/HyKitHI3Eu/xSKnV4IHumovSIzKJWCsK6XIUsPkPkGoOMzIt0vjOD6LjKlOB5HxIul7sqqkPRl9PuVSysrqmsRcttV1iyslge5qm5r63QenVuLdKRit5e9iXG12fM5ACThTrAvFOxE8W1xWA2bzUCdDLiP7EbzfeTedbqxM/RL/cdCur12qL+OWR/7EzswrvjT2sgpR9ysytyhb72buBjOpiOy33IJH6HPNl9kO69x198XG5RmO33UJbipjqpRkLloguUfWZX+SjAcGo7AuoNQ68aF//wi5aPWsZrVmZFhktQ9ghXxVCCqNGHzCFWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8qBAzn3JTu/J1H8FxE7ppx606SKtX3ypPtV/to6M7Hg=;
 b=EqT4fFme7uk9rhPWQkZA/mm6OpjWQ16eRptaXiqyWo/629SerS4rEo9NoU/Muf2PJq34sxrxdsvLiZ4ZBfe6b3F5lPDOUlsgiWj9AJ2urmM56aSYMwRDzfG5urC6IfxMnkNAwtXLGJFjkCe5UFKsRr6XbC3oCMbH2ymA027K4RQ8kygdh3ve39h/m4NUWmTs6DC9bnvBJZvr7z9aTolBzM4OeHEKnq0VMxeyzq9e92yQqIdk8+/dvi3TxY8p3q96X+KH2+lHAL6cCul6DT3c5/e+YwJQYPMmkI42RrZG/X8+KcnznSDMxPIiEkAv7kekzHrRIXguSByxSmPwxQCdww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8qBAzn3JTu/J1H8FxE7ppx606SKtX3ypPtV/to6M7Hg=;
 b=MCrhjjvp17FrmAzrHFouSAPskN9k4cX3WjEs4YmFgOPZJoYpc4b3SWVENCAKpjNn1/9M2+EPvZRZbbziJyaXvkiYbFGSXIIxmRubHJdKBE4qdMCnC+ElBqJp6UqQohAwjDfq45bP3+A5Ij7G/a+rfyrRQoaN+ouUrlAsfrsfFTM=
Received: from MN0P223CA0004.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:52b::14)
 by DS7PR12MB5813.namprd12.prod.outlook.com (2603:10b6:8:75::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Tue, 10 Nov
 2026 05:09:18 +0000
Received: from IA0PEPF0000003A.namprd03.prod.outlook.com
 (2603:10b6:208:52b:cafe::4a) by MN0P223CA0004.outlook.office365.com
 (2603:10b6:208:52b::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.13 via Frontend Transport; Tue,
 10 Nov 2026 05:09:14 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 IA0PEPF0000003A.mail.protection.outlook.com (10.167.249.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 10 Nov 2026 05:09:14 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 9 Nov
 2026 23:09:13 -0600
Received: from xhdappanad40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Mon, 9 Nov 2026 23:09:10 -0600
From: Dileep Kumar Nagavarapu <dileepkumar.nagavarapu@amd.com>
To: Jonathan Cameron <jic23@kernel.org>, David Lechner
	<dlechner@baylibre.com>, =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Michal Simek <michal.simek@amd.com>,
	Conall O'Griofa <conall.ogriofa@amd.com>
CC: <linux-iio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <git@amd.com>, Dileep Kumar Nagavarapu
	<dileepkumar.nagavarapu@amd.com>, Sai Krishna Potthuri
	<sai.krishna.potthuri@amd.com>
Subject: [PATCH v5 12/16] iio: adc: xilinx-xadc: Refine Zynq read/write error handling on timeout/interrupt
Date: Tue, 10 Nov 2026 10:31:57 +0530
Message-ID: <20261110050201.1850399-13-dileepkumar.nagavarapu@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110050201.1850399-1-dileepkumar.nagavarapu@amd.com>
References: <20261110050201.1850399-1-dileepkumar.nagavarapu@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PEPF0000003A:EE_|DS7PR12MB5813:EE_
X-MS-Office365-Filtering-Correlation-Id: ff2cd33e-4ce2-463c-3cce-08df3ee8c3dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|23010399003|22082099003|18002099003|10067099003|11063799006|261009223027099003|56012099006|261028144727099003|261026121527099003|261102123227099003|261022105027099003|261021123027099003|261021121427099003|261026140227099003;
X-Microsoft-Antispam-Message-Info: RnX3gGf22WxWUSgxVPcZ8dLSRk2XOqI4kppIvfgQrOcqWUAxhE8bGAmJeLHJAhponX1a3XpKEHpbJgjnHLK48UwyHmheM4S46TpujHcrga5HB5WEj8W6nI+pOJRgA6lYzHjT5qdxA8FLf3l/a+XjoQPKDPMIKNhJRk30wHJvItDcu+5V0Wt75JHw8ndDg2d1M/aS8GN6wcYOr18XhSthXN81ZfpBrbGFjkabFrp51MgtSUgMDr8RwzpPDaxL5RRoFkuqauWXn9DYiARR4Ev+FH3Z0pOFVk2Ta50M4t9UJZN/kEu/aIp+YH7HRzagVHuexlHPMKaznUsPpXi6wg0hJD8QzPV74w4w6o9R715/uva+D6z58mPWMxjomXtTqGyTu61jSPHS8DYnY/h0KH9MhKpe9ApqXrZG7/pDKGUswk5P/42XEprc+GgiUB+N/kiRJBACMN3jVVjooccw51sNJdPhZd/DHOMMHvfwChf7LwKILt+BEjJWa6ZOd8n7W5iVk1O9lytXJtbQFr3JYVKLfwYpak/XRBxEg33tv6UemuZKbm6nxcNaI9hdJfboYtrjEEh0MqG9SO2nhkLrgMtTIwz9r6Qi0MN/DQ7Vbe78RzW7YXgbsN7KQOWwbJWHXd1gg95DHsv/+F/dz77lfZgv9/sx2NxsPYKV+jrfJPOo7+3V4E6rC9C/WAwfVoFjnOjzHDIXXGaukfZK4tFzXGZ0KQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(23010399003)(22082099003)(18002099003)(10067099003)(11063799006)(261009223027099003)(56012099006)(261028144727099003)(261026121527099003)(261102123227099003)(261022105027099003)(261021123027099003)(261021121427099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: UFFcBjdUAsP7/CFaoBiPTlMrFpWqJQKMNdT69Wyx13JVp8MfjNuPk11/zY2A2s+ZOw1LyciwnpNj1ZS8cB+qIhIzXbHnm543G+JHCvG/WSh4Mw34K9YANBmUZmM4upOZcQJiGrJSXl0tQruBZh1aFjoan+DD5pg27uP2my2hNCGFTAX9DSwnteYf9k29Ydxu/qbYWvLdlPGyN5dYsJe9CE27wfuXUXflAKcLYP8djFE6dIo/6ahNS7jpceagSY4E7MzhpVk8sND1DMa6IC/R8YhcSdkzLi8pPHdGe8OPkSBEuirbC0oh4tOii778YUs1F8ndMAsw0wJ072TlYhYu/hzDfg9FUXUE46MZ2LAWQm5+vyTiXIAayMZNAfka3r6R4YA23z/+C+qJA2/bZuJcLflW8EMjuqk7FfwMO3e8IeyMe1T3FIzKYCpyRwq4kpK/
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 05:09:14.8857
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff2cd33e-4ce2-463c-3cce-08df3ee8c3dd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: IA0PEPF0000003A.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5813
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_210923_741838_03C67448 
X-CRM114-Status: GOOD (  14.54  )
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

Refine the error codes returned from the wait, the same way in both
xadc_zynq_write_adc_reg() and xadc_zynq_read_adc_reg(): a timeout
(ret == 0) now returns -ETIMEDOUT instead of the previous -EIO,
giving a more precise errno for this condition. An interrupted wait
(ret < 0) now propagates that error to the caller instead of being
silently treated as success.

xadc_zynq_write_adc_reg() waits on xadc->completion after issuing the
Zynq DRP write command, then drains the response word from
XADC_ZYNQ_REG_DFIFO. The DFIFO read already ran unconditionally after
the wait, regardless of outcome.

Co-developed-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
Signed-off-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
Signed-off-by: Dileep Kumar Nagavarapu <dileepkumar.nagavarapu@amd.com>
---
 drivers/iio/adc/xilinx-xadc-core.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/iio/adc/xilinx-xadc-core.c b/drivers/iio/adc/xilinx-xadc-core.c
index 9269b63d0f2c..f700b9f232d9 100644
--- a/drivers/iio/adc/xilinx-xadc-core.c
+++ b/drivers/iio/adc/xilinx-xadc-core.c
@@ -197,14 +197,16 @@ static int xadc_zynq_write_adc_reg(struct xadc *xadc, unsigned int reg, u16 val)
 	}
 
 	ret = wait_for_completion_interruptible_timeout(&xadc->completion, HZ);
-	if (ret == 0)
-		ret = -EIO;
-	else
-		ret = 0;
 
 	xadc_read_reg(xadc, XADC_ZYNQ_REG_DFIFO, &tmp);
 
-	return ret;
+	if (ret == 0)
+		return -ETIMEDOUT;
+
+	if (ret < 0)
+		return ret;
+
+	return 0;
 }
 
 static int xadc_zynq_read_adc_reg(struct xadc *xadc, unsigned int reg, u16 *val)
@@ -232,7 +234,8 @@ static int xadc_zynq_read_adc_reg(struct xadc *xadc, unsigned int reg, u16 *val)
 
 	ret = wait_for_completion_interruptible_timeout(&xadc->completion, HZ);
 	if (ret == 0)
-		ret = -EIO;
+		return -ETIMEDOUT;
+
 	if (ret < 0)
 		return ret;
 
-- 
2.34.1


