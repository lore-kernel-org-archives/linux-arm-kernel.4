Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E36606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 07:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NKy0/1hE;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Ax+Ngtuk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=UM22wR0A7853gCkKnAtbktiuhCnfEEeAUoq/6XrZeN8=; b=NKy0/1hEAvkgZlCZilCeU6gAwK
	xAko/R6QGpmZZVJmNQzOxL4qL+0ECfNq35PyRBs+qPAQR5w+hmUQQ88BHvWkpta1eG5B8QUaHNyjm
	G/x718Ak5MjFkyGGMqQNgBcyXHsAJvqMMAQoLpWQFq5B00nzuPbI986U7fFwicJxznRK1i0fQFxn2
	fbdqRPEDfGNek3ussFBixG8E0dMnEgaJZK8Yqt9sCujEtki/hzc7rlRCcoFPhL6ZQXk/RjsFs6JtE
	4wH0h5375aTIoWFXtd32FyNv59EY7MEJCT4Rp4TRyAkrAwFfCYA8ZRCBrP0+6DzfiRoLJ86r4IBa3
	f9X4u29Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTDo7-00000004oXF-1eVI;
	Tue, 17 Nov 2026 07:40:47 +0000
Received: from mail-northcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c105::7] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTDny-00000004oWA-0mAj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 07:40:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nnVb7JoPwAu1vVTo2MSfWuTt6Q9Ur1jgDNo0z3A5Drpg+2BttYb9gEdT0y4WlATuLr2887DJgKsksebMbnLf65vEBtHFi4Mbr19HuJ5jq3ytwznYg7MyBo/qar5eclrZjlbOab/rW81y6WILKhrOiIVJN2FIbOje30xymx4wJ3eQSrVHXdGjdjmcH+hs6K0tbyFWxcj57W8G2J89y1qbgdgfMvaYKxVbGIUAyBD3I7eMKUSkbLcHAzNn+CJ0ceHB8us7T51GeOpk03/RR2aiGuTsss0RUIjhivA8Kd79WmTj4rY3+l15A2S3r0yZSf4eokDzF9Hor66vKbMzkVgwlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UM22wR0A7853gCkKnAtbktiuhCnfEEeAUoq/6XrZeN8=;
 b=vuF/w21xYz6HLwBaxtZOUWG+yeE2PZTNWKR+vugbXmO0Edom9D6+TBxr2pb34gTM7utoCtso2N+uRHN8KSahuCAkAqxkttNehYlh4PpcbR95TeTEyKt4cBbR/3KbDQKLqcUVuBvDYG3Wwou8YMrOYm1Ip/uSVHbZSSFbX0x44qX9URu1uHPDDbDk722Qkbbl53a24KuIOvvP0EPXeDoAzihqNh3pX4bVI6IYDh08Fyn5XA9IXriVkQoE20mmoyhzTcZ6X8Skx9LdKcgkmhK6wOskR6t/GMC+BnJs5d/Y5RheMKXm6u596VFI/w4GV9MXzrGuVWD4UC5PNrq1Ue4bLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UM22wR0A7853gCkKnAtbktiuhCnfEEeAUoq/6XrZeN8=;
 b=Ax+NgtukHLZOVBd34SMFRSLyfX4YmbLlfU98/pGzYDnnKTpmsKz4kjYp6Z8SKUCp7iOEQzLbMxDlxG4FQI3Oagbsc6GSKTXBELVLt8kzDzE17ajA7tPKQsMTXkqdxMLhbqrsJqLKwIdlZ00b7OkYYROm4SIxFAzGgaXP8cGl0T4=
Received: from CH5P221CA0003.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1f2::22)
 by LV3PR12MB9356.namprd12.prod.outlook.com (2603:10b6:408:20c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Tue, 17 Nov
 2026 07:40:29 +0000
Received: from BN3PEPF0000B371.namprd21.prod.outlook.com
 (2603:10b6:610:1f2:cafe::7e) by CH5P221CA0003.outlook.office365.com
 (2603:10b6:610:1f2::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Tue,
 17 Nov 2026 07:40:29 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B371.mail.protection.outlook.com (10.167.243.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.0 via Frontend Transport; Tue, 17 Nov 2026 07:40:29 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 01:40:19 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 01:40:19 -0600
Received: from xhdlakshmis40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Tue, 17 Nov 2026 01:40:16 -0600
From: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
To: Linus Walleij <linusw@kernel.org>, Michal Simek <michal.simek@amd.com>
CC: <linux-gpio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <saikrishna12468@gmail.com>, <git@amd.com>,
	Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
Subject: [PATCH] pinctrl: zynqmp: Ensure function names are NUL terminated
Date: Tue, 17 Nov 2026 13:09:47 +0530
Message-ID: <20261117073947.1100444-1-sai.krishna.potthuri@amd.com>
X-Mailer: git-send-email 2.25.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B371:EE_|LV3PR12MB9356:EE_
X-MS-Office365-Filtering-Correlation-Id: 20d68780-f69a-4cb0-cc59-08df447e0d80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|82310400026|23010399003|36860700016|10067099003|11063799006|56012099006|261022075727099003|261021130227099003|261026130827099003|261026140227099003|261021121427099003|261021135927099003|261026121527099003|261021123027099003|261026135527099003|261022115727099003|261022113327099003|261022105027099003|261021133027099003|261102123227099003|261028144727099003|261009221227099003|261009221727099003|261009223327099003|261009220027099003|261009223027099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: pPmXx+KfoO+uwXAzjb4fTamkBN0wpqPkQ5SUPJHTprAo/acNG8HKimr1vCFTrK6ntnof8N2c4vproNQ779hkBoGc+h+bMYB0lAd6M9g55sEHYtTQWTvx+ZeIXtDZUrMFgfqAQBu3hrwruGkD5WzZr12V0P1JJGNzbrceuZcbJK2f4/Qs0fJOhHJrSY2R6vOGhd5Njzs10vXGDJhkGFOkwCl6Sx0aOVzPkJpbQfpsxJboKx5ln129ZluVjjexVTiU8jzlL9V3hmwLQSyoqFeKNc9v/4co5Kl+WLq1QjpBvAU+PoT03MhhTENn5K9iHgVd0TCeW79D6EsClM6tcA045NYDtcp4TsIFFeQ/mqvpclo3AeDkG0DNjZCdjz9Gfy5bS8PW8pxL03kZiYtdWI58GAQFMBIxWnFFIgya9qyguObhcpO6D8WuJXH2DKeNJTulICxFXceQuA85NFh6wX2POh3mcWUAOLbAd2bEYvhJeIbvEw2DjIoHdfOOz+aEHtvII3caQFrx1y778xdW0GknW1BdZfLiHvOZKXUPb2dgMowwWHQgcYnrLMkXjWgO3e7J8OPZMh8DqE06dxgFAWFJLaZ+4er/4tguzhgdm0Ka/BsWxD99gpL+3ED8NQZ7Dkgf3p54II7xlTyb32sk1ZoXX5wDM10B3YAzbpy5hnvICSzMzRU3rfveUv4Dxvmj7GLdvxsOl52Bv/H8gx5WmX5oFA==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(23010399003)(36860700016)(10067099003)(11063799006)(56012099006)(261022075727099003)(261021130227099003)(261026130827099003)(261026140227099003)(261021121427099003)(261021135927099003)(261026121527099003)(261021123027099003)(261026135527099003)(261022115727099003)(261022113327099003)(261022105027099003)(261021133027099003)(261102123227099003)(261028144727099003)(261009221227099003)(261009221727099003)(261009223327099003)(261009220027099003)(261009223027099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: NoKuE6SCW3dGqMupJnzSEvFBpJr9c98PoJ16P+4DkhU/ZYOBy7Wm1+/WVn2R6VDi3r7L8vLVUVT6SUgc8TLTxYDtJzezXuHtkNHD2wP846/vaOiqubfM24g/E93TtEvgrroksj79UzWWTTPXjb61Q5kEy9Y0UPVdF2zHzWS5BU4SakbOBO0+l6jyR/FZje+r4SEgbmjVYSECOo8AlEt8N1mmRT6U7xAeCaq5eNw3LkfogIn7E21pEuTX9Tk/SKLZ+0ISx990AfSekkH0218h680+AKEVtUgdVlayH/N9ctz1RUUhAtroe8RmiCW0iAdWwVJShCNpbz73v0YNpXRfnWGllqkhJXH04u+aZEVezeSdVHxO/3cWcGSSIacEZvkPbn/9dDMW4Lp9aBiID2MhsXGTPJFDvIZ8MbLSu+R4XXitbKEmZI7xpnNxZow/fEtC
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 07:40:29.2622
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20d68780-f69a-4cb0-cc59-08df447e0d80
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B371.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9356
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_234038_229588_46895751 
X-CRM114-Status: GOOD (  12.73  )
X-Spam-Score: -2.0 (--)
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

PM_QID_PINCTRL_GET_FUNCTION_NAME returns the function name in a fixed
16-byte field and does not guarantee NUL termination. A 16-character
name fills the entire field.
The driver copies this field into a 16-byte buffer and subsequently
uses it as a C string. For a non-NUL-terminated name, string operations
can read past the end of the buffer into the adjacent groups pointer.

Reserve an extra byte for the NUL terminator and explicitly terminate
the copied function name.

Signed-off-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
---
 drivers/pinctrl/pinctrl-zynqmp.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-zynqmp.c b/drivers/pinctrl/pinctrl-zynqmp.c
index aba129ead04c..c778133fadc2 100644
--- a/drivers/pinctrl/pinctrl-zynqmp.c
+++ b/drivers/pinctrl/pinctrl-zynqmp.c
@@ -29,7 +29,11 @@
 
 #define ZYNQMP_PIN_PREFIX			"MIO"
 #define PINCTRL_GET_FUNC_NAME_RESP_LEN		16
-#define MAX_FUNC_NAME_LEN			16
+/*
+ * Firmware returns the name in a fixed-size field and does not guarantee a
+ * NUL terminator. Keep one extra byte for the NUL terminator.
+ */
+#define MAX_FUNC_NAME_LEN			(PINCTRL_GET_FUNC_NAME_RESP_LEN + 1)
 #define MAX_GROUP_PIN				50
 #define MAX_PIN_GROUPS				50
 #define END_OF_FUNCTIONS			"END_OF_FUNCTIONS"
@@ -650,6 +654,7 @@ static void zynqmp_pinctrl_get_function_name(u32 fid, char *name)
 	 */
 	zynqmp_pm_query_data(qdata, payload);
 	memcpy(name, payload, PINCTRL_GET_FUNC_NAME_RESP_LEN);
+	name[PINCTRL_GET_FUNC_NAME_RESP_LEN] = '\0';
 }
 
 static int zynqmp_pinctrl_get_num_functions(unsigned int *nfuncs)
-- 
2.25.1


