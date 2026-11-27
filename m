Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA26B606A323
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 08:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XiqZODaa;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=AQ8LLo6n
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=TQs8+9J4HGo9/oLFvKBMW8wBCMW5NHbZjhVR8RosCIM=; b=XiqZODaaD9nl55yPht+TP2T95f
	zx8n4TCjJIMa2+IjO8lw5Rtuh0ZF+VGyY+EEdu2lIh1SYRYE1BeLMLGopnwnWWT6T5uzEfN1wNObX
	NpWDgbZo5TqI3Za6mqwg5KmD9EYFWa9O+OqM9rKCK2RvxOOdHSS6A/g/4SHzKgtBf/+00OESR/UPR
	ivSUyy6zcBM7pAoh4CnslfE85VWO6ke/97V0fjbGFoxwqvXmHHKfT8rEX4t4LjTvQEwnQtbBbIMja
	7VAiSlNQ64gFneNO2Kl6zlTavcLT8YT2IBXRMVd11Wm8qPrNYjm7/qRBB7c6r7z2rDVzRhUM5g9Z3
	XUYvq+KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWrd3-0000000FINL-3b3w;
	Fri, 27 Nov 2026 08:48:25 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWrd0-0000000FIMr-2T5w
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 08:48:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EGd6ULNCZieW51Tmm87vGDsLWS97lDDDYWfyoxdiZiYTyp4TeYla6z/ZM2oPBN2bVjFmPcjxUupU34sM9qDP6uEwPpICR20AZK1va6FQCjbZsuwuw9IHFLPd0Y6i9uTFH90y6TTeHy4hMVRwGViILrIFD7h2qGxw+MPvyYM3TWhZ2bjj3xPhuCdb7S7GPNFsxQAs6cERRbcQus538GmBZEeY1ejwmZQN57YXHvF8JVJ6sBfzgdBuc+3/RD6dbF5XpWq7fx4D/WJjkuc58uPsTQWx83kCo7HJSjI9NCRe/elGWx1u4Td0rVTgm8GP1UcaM5maCEF1/nHPJMeknj/KdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TQs8+9J4HGo9/oLFvKBMW8wBCMW5NHbZjhVR8RosCIM=;
 b=opkB/R4MwSgA6Y21boaSgbvrnNaGciQuwkT2Img+tgxd/P6lFWbwpo9Jc4ceNWKPR8jpfHE9Opi+jQVA+Xp5pou0Kdi79Hlm2Yn5s3VCcaEe3LDEKNVz7/yUvtQOY1wRtxfqyImvmXflIBI7yoh5qlftkF7jNmLAxXbBqxw81dyxS0uk8MZtEE2BSImI+myyBuk2N0UjyVY8DiiQdEtN3NWksUIzRunzlnIciYqSXNmECxZpxSzRsdXPjoifgK1PnnAEzkolKFYjVZo9O8EX4h29L7MeqNoXDRBUEQSDwA0AwfgRoA5kQsGubfTdTBaZCXRwIKvxq0b6Gujc7PerPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TQs8+9J4HGo9/oLFvKBMW8wBCMW5NHbZjhVR8RosCIM=;
 b=AQ8LLo6nTGD/rQLW/goajbQ5mGI/l+cqrugVTJjz9wu68eQnyd65JsRs23JaaDdS5QG4VrnY6dpWcmnWnOPV8A+zDpUZU+GeVnhaI9av6v5HT8rIkIRBQsJisI++YqIKMuGprBqa4L0fEVYPPFvZ/wB05aCA3XrymLgDUZnzxt7c97XK6xOc7Tlhq1XCCF8zG5CvbRTz9WXWi9jdZxns0AnuqMpNITxb7tvX1wakqXYCsCqiyjTWlr5GFV5EeBGsuYUUjpR8AGf1h0gomNdgSiHgd+5lMrD5GopS2suR6cN5H7W3efJIOGVD0kM+aA4xr93+zVM/kANpSLJ7qheMGw==
Received: from AM6PR05CA0024.eurprd05.prod.outlook.com (2603:10a6:20b:56::15)
 by AM5PR10MB592851.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:7d1::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.4; Fri, 27 Nov
 2026 08:47:59 +0000
Received: from DB1PEPF000509F4.eurprd02.prod.outlook.com
 (2603:10a6:20b:56:cafe::57) by AM6PR05CA0024.outlook.office365.com
 (2603:10a6:20b:56::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.9 via Frontend Transport; Fri, 27
 Nov 2026 08:47:59 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF000509F4.mail.protection.outlook.com (10.167.242.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.688.5 via Frontend Transport; Fri, 27 Nov 2026 08:47:58 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Fri, 27 Nov
 2026 09:48:28 +0100
Received: from localhost (10.130.77.119) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 27 Nov
 2026 09:47:31 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Fri, 27 Nov 2026 09:47:11 +0100
Subject: [PATCH v2] arm64: defconfig: enable STM32 camera drivers
 (CSI/DCMIPP)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261127-stm32-enable-arm64-csi-dcmi-dcmipp-v2-1-07e837968466@foss.st.com>
X-B4-Tracking: v=1; b=H4sIAI5DCWsC/5WNQQ6CMBBFr0Jm7RBaLUVW3sOwKO0gTSwlHUI0h
 Ltb8QRufvL+4r0NmJInhrbYINHq2ccpgzwVYEczPQi9ywyykrUQskZewlkiTaZ/EpoU6gta9uh
 s+M08o3Za9YNWlZQCsmhONPjXEbl3mUfPS0zvo7mK7/uXfhUo0Jmr6Y3SjaLmNkTmkpfSxgDdv
 u8fDTE8o9YAAAA=
X-Change-ID: 20261126-stm32-enable-arm64-csi-dcmi-dcmipp-7d75bf750221
To: Hugues Fruchet <hugues.fruchet@foss.st.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, "Alexandre
 Torgue" <alexandre.torgue@foss.st.com>
CC: <linux-media@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	"Alain Volmat" <alain.volmat@foss.st.com>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F4:EE_|AM5PR10MB592851:EE_
X-MS-Office365-Filtering-Correlation-Id: 764a3a0a-94ff-4084-fb41-08df4c632371
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|23010399003|1800799024|376014|36860700016|30052699003|18002099003|56012099006|11063799006|261026140227099003|261022105027099003|261022075727099003|261028144727099003|261021121427099003|261102123227099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info: udc7dv1m18Bvy35LVd85qGiTT7Kt96UDXSnEmTytHW9NBHFgcN7OppNHayFeXGWfXR6YsS1pG+k54O976pUvF67+fnpNEWCJl8xXc1yKT0y0EuQRrZmo5UHM0Gv4Kl5DnKWljE0eVrPmOvipCEbuB1pNKN2R7CdKZwjR9cdJwHq6oMpm6ctompom8pDAVJxyMumC5Q6iKfURbhGkrk4l3etHc0vBleNlKZ37pv/qZ6zKT9MvVUG/tu6aj59htUDdkjFQeTEuUAMcTrkOhGuCxpJBIsnz+S0k4lwMS4lhQIaD/yYxsAl+xuUP/Ub0P3mcZtMnC+wA2rP23hdFSohTAnXgcAUSumAZ2txdICzYjk59brx3MQwa1Q0UAbLHu2N674MDkFhCtwlEjjFYt6U8LAFfNt8aikc8+onFW96rwpO6KJ4J3hV4nkJYNxf94N4F2OxSZ6SZCxuYeWO6/DkHVmaTXgGWliNKgcniJfFJa+yG4A/kZYdea/47psguPxFK5iIMQdT+C1hhHFhhwiXB40q1nXqR9CbU1JbGqu/bRbO0JKNmCvOGGw1r81Vwk398TlvJmY7hxadXFwRWkji78ex8hdmhG4t1glSThd8ObE8g+NEu/LbR3/clkhaX80+czBkkb32P8WQ+A6jXKPBQXQj/IXbajDRSg4T5UfEYMdc=
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(1800799024)(376014)(36860700016)(30052699003)(18002099003)(56012099006)(11063799006)(261026140227099003)(261022105027099003)(261022075727099003)(261028144727099003)(261021121427099003)(261102123227099003)(261009223027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: PV1FgLWS7LYP4v1NLOsUXVhUcbBnms0TyxUm10t8dAxYeHeZycoti/ojnfDGjwdlxBtCl2pKXf5ZJSpVhHw2MLwbsVDfDtV5uDLWJbD6b5U1RoiGRKFVLFzqP3T/eijcCjSQSexJAP93fcuI2fbQLxDzkOat0ce6hIFJ9q4qHiv3IcX8VI0Ovz5vS9KYo8IAVL08BgaAeNvC/KwJiYQv5bi076oaOMmfQdvoBUVXmn4tBUGqxzqQSQcxaTwFnVzgwFAOfUNcvZ0AykiduHI9pSj7sUM0xvr/ykXlpCPQhG2F6fV5RPSf2Xu1oITP2CMhIBTdGMfPFpGXZwCc9slcQq1b6SYkdd9L6gmhgYrrKyXkP7hUcfbKZq8fZF5GONPgk0MKRIB44m8UsSX2cKVw1qqKCClvrXLmIQ7GvCALYldwFYjKc00p0YSNNO74RBwx
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 08:47:58.8949
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 764a3a0a-94ff-4084-fb41-08df4c632371
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509F4.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR10MB592851
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_004822_884313_EFF6F69A 
X-CRM114-Status: UNSURE (   8.00  )
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

Enable STM32 camera drivers (CSI and DCMIPP) as modules being
used on stm32mp2x based boards such as stm32mp257f-dk and
stm32mp257f-ev1.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
Changes in v2:
- Update commit log to mention boards
- Only enable CSI and DCMIPP
- Link to v1: https://patch.msgid.link/20261126-stm32-enable-arm64-csi-dcmi-dcmipp-v1-1-da9aba5785e8@foss.st.com
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 7b4985b29b21c..608eb9fc51d70 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -958,6 +958,8 @@ CONFIG_VIDEO_ROCKCHIP_CIF=m
 CONFIG_VIDEO_SAMSUNG_EXYNOS_GSC=m
 CONFIG_VIDEO_SAMSUNG_S5P_JPEG=m
 CONFIG_VIDEO_SAMSUNG_S5P_MFC=m
+CONFIG_VIDEO_STM32_CSI=m
+CONFIG_VIDEO_STM32_DCMIPP=m
 CONFIG_VIDEO_SUN6I_CSI=m
 CONFIG_VIDEO_SYNOPSYS_HDMIRX=m
 CONFIG_VIDEO_SYNOPSYS_HDMIRX_LOAD_DEFAULT_EDID=y

---
base-commit: 25faec9ce61c01fb45abf812a222c5b43c3cd5c5
change-id: 20261126-stm32-enable-arm64-csi-dcmi-dcmipp-7d75bf750221

Best regards,
--  
Alain Volmat <alain.volmat@foss.st.com>


