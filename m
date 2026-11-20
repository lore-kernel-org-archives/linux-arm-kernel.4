Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD54606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 09:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=B3O95dqp;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=CIRpMeqk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=b6Au8vkNuC3TfAiMmo++Hv2L/83eyCu1KLyOAkdmRok=; b=B3O95dqp3NmN1I
	CCFL43uFitIkDoz32BDDY+JbSBgU358sZ2X6CPWrV8k2qVT8KdAXCY1IiGWpWVp359wcrFOWzQf5j
	doL3Yz6vNbRzgt4MSbl1roo8ztahHyeSGQ5Z3Fj79MuCmAOKFmnhumNe+X72dSBgmQsjVTEDRlgEj
	lyGqiG9BSQVvkN/CMdL1erHJOHXTq5uRxsNeZam8Bm/HxWnBeYvy+4bPWGJp0GjTR7XJJqiyOBrrk
	f7HD8gqdRjZFCC2LhMFn1kOi/2n6oRWP327RoYUOfyqaigXTqbBuP+MpqU8WY4hVk8iUi7c6rEL/P
	nLPH2tXnwg/UosaXGFug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUKll-0000000ERN2-1NJB;
	Fri, 20 Nov 2026 09:18:57 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUKlA-0000000EREU-1m8t
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 09:18:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=stEMk59riE29D6iZp930B+9CkMF15U4HvwxtvbzVF8YRctozFLrSqzG8mLcBfpPXl0XK/tEKg8eCD453O5kcV0Qo385/Vv3NNb7hTdCxM5kfWDXFa2MPMG0UXrh027d/UjMUKcECjyCdFiN5TKzgxSt08cUzoi/jtDWgStCcffkP7j++dSNuMIXRV0iQm8MOiEnJr6ghfbZfL6uuHT45/KdMuvohpm5fpL7ywyyOxkq284Nrcfftla9fScs7ansKed5Oychs+71mKsoSPn74TLF/sCxJjd/RAw3zvnXuOsyuP83js4oH4tH4OCI0D/4tdWMrbeQEVQb6+IAeLoONWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b6Au8vkNuC3TfAiMmo++Hv2L/83eyCu1KLyOAkdmRok=;
 b=wu2w7MSwimiLAWE/p2vGOtStnnyy0eu1BXRwA73ioPVA/gBWkpJ0R8JuvLHtNN1j6zdzR1k/qrHG9FGcMzmwi+vEODxIxFPDINZ8rdWaQc8AJuYeOccKfIn1u1rJvMBsua/oo01C3IZrYr4FilqRjRLkC6+IslsoWHQ9YukclWcDJqcUZJK976egunXpSVFZD9NfY8N8sIDjC4MLijKg3eYuXPUOSfFwX5Lx9UVtY7vP4Zna77gggRuZhfq4u4fRIh9Qa2ZeC3ahh+PqlXOyq7GnOGEzmtj907eTiEsXTr5MKYCsJu5gHeKNG/mz7Jnw6dpelaVeDDqadMmpRbWeDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b6Au8vkNuC3TfAiMmo++Hv2L/83eyCu1KLyOAkdmRok=;
 b=CIRpMeqktPy9HDcTUQHDS9CbsGatNkXjbr7moJEJgx8VPax/MmCqkP3IJ5Tc8VB5kKCWKAI7yPDNAfnENdhm39wl8PPDdg5hViw/oblDMHbVSEplbtD6xzTWUdeS+8igaHeWWIJjfERyqpBhqx/HvTscLTUBjCifoLtUAoRXHEaTSzbZsII8+RHGKqQ78CGn+nQtU2mmKBHb5zD0HvNm40FNf782rhY3OL1G9woHsGsxToCPar61OlBwa8BDZs6imk6I52nK50hYSuzOGjusGavvDmd1INIPF0DUTBPKEoQEPMwvpLHHwczDCkjkpWS45zmqs3Oi19ow7vvShdJGHw==
Received: from DUZPR01CA0278.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::23) by AS4PR10MB5941.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:519::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.1; Fri, 20 Nov
 2026 09:18:08 +0000
Received: from MAD0EPF000008A8.eurprd04.prod.outlook.com
 (2603:10a6:10:4b9:cafe::a0) by DUZPR01CA0278.outlook.office365.com
 (2603:10a6:10:4b9::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.12 via Frontend Transport; Fri,
 20 Nov 2026 09:18:08 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 MAD0EPF000008A8.mail.protection.outlook.com (10.167.241.180) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Fri, 20 Nov 2026 09:18:07 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Fri, 20 Nov
 2026 10:19:09 +0100
Received: from localhost (10.48.87.222) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 20 Nov
 2026 10:18:06 +0100
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
Date: Fri, 20 Nov 2026 10:18:01 +0100
Subject: [PATCH 1/4] dmaengine: stm32-dma3: clear flags before signaling
 transfer completion
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261120-dma3-fixes-v1-1-f29c1f437399@foss.st.com>
References: <20261120-dma3-fixes-v1-0-f29c1f437399@foss.st.com>
In-Reply-To: <20261120-dma3-fixes-v1-0-f29c1f437399@foss.st.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>
CC: <dmaengine@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Amelie Delaunay <amelie.delaunay@foss.st.com>, Jerome Audu
	<jerome.audu@st.com>, <stable@vger.kernel.org>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAD0EPF000008A8:EE_|AS4PR10MB5941:EE_
X-MS-Office365-Filtering-Correlation-Id: a388f03a-11c1-4f37-d3ae-08df46e730ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|23010399003|376014|36860700016|1800799024|18002099003|22082099003|11063799006|56012099006|261026121527099003|261022075727099003|261102123227099003|261021121427099003|261021123027099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info: IcejVbBE2OmrXpc3fjduqogeBZNmE8XD7uSNBYBNCoJmnHX+A3flZmbXvqe/0QuNDZ/X9F7zza0felXpz62HT8eGkU3B54J+IGXfBpkUf+uEV2WXAQdT0uBaQuVHoql2yTVVasRxyC4Gjzgy6CmJWH9+0Fsbb68iDWqSQLliU2WiB8FwArsPJh6SIQY2CXKUZH1IAQkpdS+F0VqgFIhdsac3/05AjliqZVAS4PbBjndbmAPo0UKGA5qhommmE7Kz55dAzdxob6XoxfpEEU/LrVprW6hgLz7O4rVDINCLuyxdKWCg0T6mIgrxrMRGYAXU9SzzzPJAjowQoSpPvvaHAb1+sMQqENEAcHVJTyP/T084fj9Zb8vxpq0Cc878oORcXPBpAwyVB/hmQKeofDxfhdbtyRcfrHzhvSGg+Qu96VDjr/WnRZRhhPs4TQQmroUUcsXDKaLqavznurfqZ1qTheWXv495GUbi1UqtucMeKeeWraSxfCswkLr3JCIZokFQB2t5M783FhN+HfPmXbI5BEOeRvLwwbMeSHFwW/nTACISqfbJnCbqOIcj+UqpGLvZdPuodA/DZ8R6lUXkfI6g5pyclT90auFVKrDBx5zkOgjb32IUA1CEAt6R2b1uKADz+lxWDgoGwOAXlxwzz6hOZnM4gQ7U1iF7fJ5O2NbQModN3H3G0Ndn3TIHpo0xNvgJM0mHsS7v+/wbCjgqht/wHQ==
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(376014)(36860700016)(1800799024)(18002099003)(22082099003)(11063799006)(56012099006)(261026121527099003)(261022075727099003)(261102123227099003)(261021121427099003)(261021123027099003)(261009223027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ofkZ5+rDB6A7NWYVOOrPkT2wJ+x/d3uPEzO7TjIkEMNQhmem41PEMANK/myESJOuG9UfLUhURRAzVFr//r+nsk82LWDCqk0N5KZTUU3qlzuyf5XPUd54cZggJs5ZFaoIs4vsD/l3H7szgk8EAxMc+eNYEqB1oXQiR84pjXV6EHOBckFpeMPuSzCHL6sUdg+OJqmlk2bOB7123iGhuk+NyLEnMsQTMJ97RKMwRXDJJfuqr+H7FJRbC36TTXHuBYMWfqUiqQIFjCjReLeUckoVy+NQ0di4foxGxxnZIZy7UYdOOF9tg+PvwORxRxKuJh0Km47HwvgBFQL8MNmpOXlEohbSwkfawONI7XSjmvenS9w3HxAFxAsOeb+N6AHbtBqiRYCELcBk2NL84PupKaoPc/eY1pmNAVCX8CEOLlZUgKTw9UXS9U+1kmnp0Kq3V89l
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 09:18:07.6926
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a388f03a-11c1-4f37-d3ae-08df46e730ae
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: MAD0EPF000008A8.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB5941
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_011820_479003_D425C63F 
X-CRM114-Status: GOOD (  12.44  )
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

From: Jerome Audu <jerome.audu@st.com>

On a Transfer Complete event, a new transfer can be started from
stm32_dma3_chan_complete(). The new transfer may finish while the end of
stm32_dma3_chan_irq() is still executing, in which case the flag clearing
done at the end of the handler also clears the new transfer's Transfer
Complete flag without the end of that transfer being handled, which may
lead to a timeout.

Clear the flags before handling completion to make sure that if
stm32_dma3_chan_complete() starts an ultra-fast transfer, its TCF flag is
not accidentally cleared. This reordering is also safe for the other
handled interrupt conditions, since csr holds the channel status and is
used to select the handling path.

Fixes: f561ec8b2b33 ("dmaengine: Add STM32 DMA3 support")
Cc: stable@vger.kernel.org
Signed-off-by: Jerome Audu <jerome.audu@st.com>
Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
---
 drivers/dma/stm32/stm32-dma3.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/dma/stm32/stm32-dma3.c b/drivers/dma/stm32/stm32-dma3.c
index 4fe226541efa..a464e0cefd64 100644
--- a/drivers/dma/stm32/stm32-dma3.c
+++ b/drivers/dma/stm32/stm32-dma3.c
@@ -1008,7 +1008,7 @@ static irqreturn_t stm32_dma3_chan_irq(int irq, void *devid)
 {
 	struct stm32_dma3_chan *chan = devid;
 	struct stm32_dma3_ddata *ddata = to_stm32_dma3_ddata(chan);
-	u32 misr, csr, ccr;
+	u32 misr, csr, ccr, cfcr;
 
 	spin_lock(&chan->vchan.lock);
 
@@ -1021,6 +1021,14 @@ static irqreturn_t stm32_dma3_chan_irq(int irq, void *devid)
 	csr = readl_relaxed(ddata->base + STM32_DMA3_CSR(chan->id));
 	ccr = readl_relaxed(ddata->base + STM32_DMA3_CCR(chan->id)) & CCR_ALLIE;
 
+	/*
+	 * Half Transfer Interrupt may be disabled but Half Transfer Flag can be set,
+	 * ensure HTF flag to be cleared, with other flags.
+	 */
+	cfcr = csr & (ccr | CCR_HTIE);
+	if (cfcr)
+		writel_relaxed(cfcr, ddata->base + STM32_DMA3_CFCR(chan->id));
+
 	if (csr & CSR_TCF && ccr & CCR_TCIE) {
 		if (chan->swdesc->cyclic)
 			vchan_cyclic_callback(&chan->swdesc->vdesc);
@@ -1050,15 +1058,6 @@ static irqreturn_t stm32_dma3_chan_irq(int irq, void *devid)
 		stm32_dma3_chan_reset(chan);
 	}
 
-	/*
-	 * Half Transfer Interrupt may be disabled but Half Transfer Flag can be set,
-	 * ensure HTF flag to be cleared, with other flags.
-	 */
-	csr &= (ccr | CCR_HTIE);
-
-	if (csr)
-		writel_relaxed(csr, ddata->base + STM32_DMA3_CFCR(chan->id));
-
 	spin_unlock(&chan->vchan.lock);
 
 	return IRQ_HANDLED;

-- 
2.43.0


