Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6265606A321
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 09:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wYEWxwTO;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=Df9PskDk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=oz6UNjZCoPmMY1WXN5knPFkTJJzqyQ0AK2l/KmH4Irc=; b=wYEWxwTOLIolrq
	giu/HVwaW0r7/6PTtMMdtU0YS6QdFZDv9FbVpv6aHt0LE/6IGwMfNjcqEKYO5OgiX5V2VDFXdSqT1
	N2nXl5gC8AXxG3wmKlEhNZd+1piQbn5Wm3juG9Ub1ldnW1BEw/8DweItLqhbA4BysdDKudo1bvy/o
	bl2RmYZ1shDzD8gcY3edNicaEC/lqOaBcvqqIxlsf2Z7HaGH3QTptlrWnvrqT/CZ/LAPBmY2D59WO
	pEuVo7zuhFNdh20ouQd5ClZntMLQ5LDCCJJI/9uO80CRFxeTMmsX1smV74vzD39I0zmdIvLmMGYWP
	xclcH1uVX1U0mK8G9mFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQCx-00000002gFk-0qpL;
	Mon, 23 Nov 2026 09:19:31 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQB0-00000002fjQ-1wtZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 09:17:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bWXzTf2kXXVYusy9peQHy+tHZjzpGUNjCuv4x5SQomNG9QIiwa61nkUDQ8ciIJKu4UBvtLt7xEokyLiM+bXUdJ6aYanKzhzdttRh+7qsZ/39VnOGh5jGKqZ0ixK//8SuzDU6Gyp4TeR3D+LNQMHKT7137F0ZRyhoyaW0Iwe1l8cYjWZDneyaE5dhd6YpmmYasWWUBlUC5+8vqNHcfmxAOecp4224O5uqPeFCjVgSvV1Te/mGy/fC9tb+v26aIm8pMgZhxyN+1U57FVWicVCACzJC5ucj7SUvAqUQIbazUWkfefp3o2EUSs3M6JRY13WrTE+Gw9qYOAHuavzq2NygqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oz6UNjZCoPmMY1WXN5knPFkTJJzqyQ0AK2l/KmH4Irc=;
 b=jN4t3Pd1i4p2Yy7Abc/78x1dsz6zV4KH5OQkLbHG4EIAb2aIFpP1xapJEzXBtolbUVT95Cxb3uOCjcuWSxPXZhitwhSUIUI+r9a+cZTdJO+B+8aNHjrzM5D7EPqihtwQDH1OXcJLl5m/syNwPs4/DKjS9+9SWo95ojTGigIm7YCcDYdXvk85NuLxPzNVQ4iTjseZ9My+TUwCgOl4G0FDlK0WG4d5XkqiWXbMzKZsIATexWB4iZPg7KGV6Aqzv57Vk3LCAUvZgI/0fxMh8NwSfZTv7t/8Z0NALAwMK2Uma23QDD1oOrug/eHS3dKsZW546jd8xuz8+KrmhgtFnZZ+ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oz6UNjZCoPmMY1WXN5knPFkTJJzqyQ0AK2l/KmH4Irc=;
 b=Df9PskDkwLQXeFSaFBBXfVA1QNkDMqYJNqkKbSnHyGevIwQbqa4m9wTN8cCmaWwmYGDrltn6phQMeerVM7xq3/tFrUrxurCurz/yy9zWpWt7aFDm3MEGSiHdYh++b8VYAJsDc+QW/AHdreZQPB60toDN6fijIp7iY1B2LrrHB3JrUrmgNXcJgu0jNIGt7hqTWYJ9bPFw6hzsydz1BJlX+8cbIocQj4tP0w4mik+zVwvmP+aO+sP3DNCPmXFEGyKRglL3zNHSLGfO8z983s7b7g9a8VT6vGtihqSTZgBzK2baC4NFXS+WO0EXfuLtEe7I5mTMQlqNo8CVvIW3Ovq/pg==
Received: from AS8PR04CA0011.eurprd04.prod.outlook.com (2603:10a6:20b:310::16)
 by DU0PR10MB6274.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3ed::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.4; Mon, 23 Nov
 2026 09:17:21 +0000
Received: from AMS1EPF0000009C.eurprd02.prod.outlook.com
 (2603:10a6:20b:310:cafe::5f) by AS8PR04CA0011.outlook.office365.com
 (2603:10a6:20b:310::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.14 via Frontend Transport; Mon,
 23 Nov 2026 09:17:21 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS1EPF0000009C.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Mon, 23 Nov 2026 09:17:21 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 23 Nov
 2026 10:18:09 +0100
Received: from localhost (10.48.87.222) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 23 Nov
 2026 10:17:20 +0100
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
Date: Mon, 23 Nov 2026 10:17:06 +0100
Subject: [PATCH v2 2/4] dmaengine: stm32-dma3: set LL base address when
 transfer starts
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261123-dma3-fixes-v2-2-0a5b013f79d2@foss.st.com>
References: <20261123-dma3-fixes-v2-0-0a5b013f79d2@foss.st.com>
In-Reply-To: <20261123-dma3-fixes-v2-0-0a5b013f79d2@foss.st.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, =?utf-8?q?Am=C3=A9lie_Delaunay?=
	<amelie.delaunay@foss.st.com>
CC: <dmaengine@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<stable@vger.kernel.org>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF0000009C:EE_|DU0PR10MB6274:EE_
X-MS-Office365-Filtering-Correlation-Id: be2ac969-d505-4fb0-84c9-08df49429467
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|23010399003|82310400026|1800799024|376014|261102123227099003|261026140227099003|261022105027099003|261022075727099003|261028144727099003|5023799004|11063799006|56012099006|10067099003|18002099003|22082099003|261021121427099003|261021123027099003|6133799003|261009223027099003;
X-Microsoft-Antispam-Message-Info: GymJLQ/ZPc0SuiOWKbM1KwoyD7QFwJlY4j1VirDjBGi3n+ENaeGb6kfaataGvumUD45A7TJpjuXiuoX+KxZOB6Ogt+RWMrbQGuByrM3Z0UkM/wSibqK/RoYzexeRPF6/UpvftuEsPzZTt5Wv3y9OR1LQlYc01v0FHiFqTFhsv96Eva5zYgZE0ao05wHSFTmpRNDdjYSxREXv9RazNp3ZfZ59H1esPTJazyGYzvEXWLOLxGguvopxO7fQD8uTGufsS4wa/a37qvm0w/wRWu+RzIchj6V+8hVc7p/9AukzoieyntEGGZZAnQW9OwphdGoxwr3ufEOFsqw6ojXLm5Ln0FyOGZQLf4eA5pylUTgv1C3mXCYgziTWoJ0f09uX/XI8dahjslc7uPnWRef8wsHxuPOtVG8miSg4tdPHnILWwlhYlhyw2c8OD9LDeMkmya1l64zkUkiJdrlRWXRcWEG8WlJpRuf/G2cgxf3dcZDJttQEbHdV4HRXlccjKc+RlkUiqUbIdsAPdya/iV/Ps4Nx26B3AZ+CWu0uKqdKEKlu1nL6lKnoyDIlS1zBbm0i4zObtYMc8xgh/aVgA265UwBlr+dpa0yfSIuF/C3krMjAYgtH42+1xnuFfeLoxECW7/tJFpWK3R3X97GwcD5nuX0fshkQK81oc54D9fgTiyZkAn4m2EjBmeGVWAUVdLYr+Q7FYdHjJj96bHy54VmoZuj6Sg==
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(1800799024)(376014)(261102123227099003)(261026140227099003)(261022105027099003)(261022075727099003)(261028144727099003)(5023799004)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003)(261021121427099003)(261021123027099003)(6133799003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 7HCvgkuhYll2wNLGqbEkngAxAnV7hC7TdHAigxqgSNrWhmpC/+4w2uUwn3ix129I4G5sO64fJAWKu65awy5xcFk5Vrmogo15kJNwQQm8IwLDzN+aQqIC/5vGej27T80SohrTPaB10W1K/h1ksDHCVw0PBeFXe5R9PapgMWRv2/XXhyoAYJl36OBm2Qhz3mwi2H442Ype0bXNCZ6Wo0cb30ECdRZxLEHAsf3D0tmRGMdHyzqS9rLIAT6SHEs4X2qOB6rnWIVNFxt4G/H3LlKR4PEHG5Eb/I0F5QNPIIVoy7M3W8XwIiwvbrOu/BmzptFQ7OCLwuv3kg91d4H9MfEPVdSI3AO22Z6aRauchxJqJVAsaXj6t2Bdrc+fKE1IsBO3D8uxEQb9ZSZAGDt/ySnXyrwqW3BlfFFmAKzOyGri0Gc3D+EnOhUUCXXSrsgJz7Im
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 09:17:21.5600
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be2ac969-d505-4fb0-84c9-08df49429467
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF0000009C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB6274
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_011732_656203_4404ADB3 
X-CRM114-Status: GOOD (  11.44  )
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

Linked-list (LL) is allocated in stm32_dma3_chan_desc_alloc(). The LL is
then used when starting the transfer in stm32_dma3_chan_start(). Nothing
prevents a user from preparing another transfer before starting the
previous one. If, for the same channel, another kind of transfer is
prepared (using dmaengine_prep_xxx API), the LL base address may change.
This address could be overwritten in the CxLBAR register if the channel is
disabled, or the CxLBAR might not be updated if the channel is enabled,
leading to a mismatch between the transfer being started and the LL pointed
to by CxLBAR register.

To avoid this, write the LL base address in CxLBAR when starting the
transfer instead of when the linked-list is allocated.

Fixes: f561ec8b2b33 ("dmaengine: Add STM32 DMA3 support")
Cc: stable@vger.kernel.org
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
---
Changes in v2:
- emtpy line added  emtpy between parapragh following Frank Li's review
---
 drivers/dma/stm32/stm32-dma3.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/stm32/stm32-dma3.c b/drivers/dma/stm32/stm32-dma3.c
index a464e0cefd64..a056f73fbe02 100644
--- a/drivers/dma/stm32/stm32-dma3.c
+++ b/drivers/dma/stm32/stm32-dma3.c
@@ -396,7 +396,6 @@ static void stm32_dma3_chan_dump_hwdesc(struct stm32_dma3_chan *chan,
 
 static struct stm32_dma3_swdesc *stm32_dma3_chan_desc_alloc(struct stm32_dma3_chan *chan, u32 count)
 {
-	struct stm32_dma3_ddata *ddata = to_stm32_dma3_ddata(chan);
 	struct stm32_dma3_swdesc *swdesc;
 	int i;
 
@@ -423,10 +422,6 @@ static struct stm32_dma3_swdesc *stm32_dma3_chan_desc_alloc(struct stm32_dma3_ch
 	}
 	swdesc->ccr = 0;
 
-	/* Set LL base address */
-	writel_relaxed(swdesc->lli[0].hwdesc_addr & CLBAR_LBA,
-		       ddata->base + STM32_DMA3_CLBAR(chan->id));
-
 	/* Set LL allocated port */
 	swdesc->ccr &= ~CCR_LAP;
 
@@ -790,6 +785,10 @@ static void stm32_dma3_chan_start(struct stm32_dma3_chan *chan)
 	writel_relaxed(hwdesc->cdar, ddata->base + STM32_DMA3_CDAR(id));
 	writel_relaxed(hwdesc->cllr, ddata->base + STM32_DMA3_CLLR(id));
 
+	/* Set LL base address */
+	writel_relaxed(chan->swdesc->lli[0].hwdesc_addr & CLBAR_LBA,
+		       ddata->base + STM32_DMA3_CLBAR(chan->id));
+
 	/* Clear any pending interrupts */
 	csr = readl_relaxed(ddata->base + STM32_DMA3_CSR(id));
 	if (csr & CSR_ALL_F)

-- 
2.43.0


