Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83522606A320
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 15:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=m9t0K0fY;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=CdmbG308
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=g0g4io6Yi9vEUzFvaHJk5/CKxY8b3/ttJE+tckycN6o=; b=m9t0K0fY/G7vao
	YaWgjKbU2ID3BxripUAgCbPhaPJsQ8zyGgw7pVZlBabsjB+RFh4pnGwS3ow92T8tPIUgBSojWwH0r
	jm5FRUer9yFHsuctXO5hBZkdisLpWh1Wl9aE7Z2/v4JPYHwnAj2CfEab2wNSlrcpWu6LeE2+c0qs2
	hKqIiwIAS7OpqQBABGYnb8HBr8uSpOucI7o/iOOUuX5fTKC5M1QJlQKFIvDadMQTaCxwcBhcyPEAb
	vVWs34SDTXkaYL2Z5yP3S3FcBXuw8p9Aj+zvwAb+WuVa32H8+6qQlOnj5ONnhSfT7sOTyOZZ0zkh/
	EiSfjVhsjtwgwiuLAF8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xThXO-00000009Hmj-0wM4;
	Wed, 18 Nov 2026 15:25:30 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xThXK-00000009HkV-22Jp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 15:25:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yiqQtg54g4/fl9SZveqeHlEHbnZx6Aibcrz29Pf6rsmnGYc/8GR8dyU/L52riSeEYo4JSndImxjOPVCEOB9rvUJjO5fJOFKevDgS/4PFalmQ2LNyT4AelSTqikMkrTffz2u3CWGnzBw5TwAs6AcztNIWB76UBl9S0GhI6Ub3sco5BNyNNsvNQynGYYbgXC5VXge4H6BgmjeyOay98gEeLWjGx36RYzbF7yJe1u5bvbOJCCF2Iyjcda6lXvW6OqjC11WCSgFLzp5zYDLqFk1bb35C4n6D75quiCJa11fF6l+wBlNlaOE88S4hJsSbq+04BoP7qkbpWancuPh1aKpM7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g0g4io6Yi9vEUzFvaHJk5/CKxY8b3/ttJE+tckycN6o=;
 b=vNCj0QyBnViYs/x4PEFoxdSFRKkyC0h9koXO8gsvTst9NaL1KlbJDtrmRYq+i9Qm/dKx/NhOwq+xc0p1IuCWYm7DLxIqh/bhLMlXnh7BMgHug3k+0TAKYk1jSgfsFffaey2dux2bVxmZaPTUZPxDIuxNcniEFhkKbygXuFoVlX2qoXmC6JEpqPPwnnimJidyn/sII1OB/7CoPfKMznFLOKNmnLp7EqQ208eGjn7gFUrZP0S87cB+o9InfKqpFWPKFjK8tMSavZGkvzf46NdM+zbRgmbuxcMwNZfSsEPkciioCG9jYAP/zGei3/7EU7Eun6oBM6aKjbNGLHHgOzi4Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g0g4io6Yi9vEUzFvaHJk5/CKxY8b3/ttJE+tckycN6o=;
 b=CdmbG308Nija/Ttbt8p0j1YU7DIdq8nsDemGHe1NqQZU48YrxmKZXrApKqOz8Gq92KyFlj7EE5q7yj6egZoccqHEpv4D7LzHE/fanlirV/2Zyn1GfB4QNjA37nj9sE4MTjVhMz124mV9G1DgakvvyHDm3D8Hxqzke0ZNjtZFQ7yquyLckEQC4T0CMmi06A6+r7SYKBDzyho4VEr67+UoIifm4qPp0oQbMd3UqgxsA7Ym1eFwf4hL9fWC9JzzgOpgPU2HICtla9b+6FW6rhT7ZNnJnITCnXI8QDpNWe0O7bNQbSh2E+9CrwgCEO1r2aWbEU52rCpNjFjWCB+FEybptg==
Received: from DUZPR01CA0052.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::8) by AS8PR10MB7899.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:629::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.8; Wed, 18 Nov
 2026 15:25:18 +0000
Received: from DB1PEPF000509F5.eurprd02.prod.outlook.com
 (2603:10a6:10:469:cafe::37) by DUZPR01CA0052.outlook.office365.com
 (2603:10a6:10:469::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Wed,
 18 Nov 2026 15:25:18 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF000509F5.mail.protection.outlook.com (10.167.242.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 15:25:18 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 18 Nov
 2026 16:26:03 +0100
Received: from [10.252.8.55] (10.252.8.55) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 18 Nov
 2026 16:25:17 +0100
Message-ID: <90b4417d-f2fe-498a-8128-3229eb284d8c@foss.st.com>
Date: Wed, 18 Nov 2026 16:25:00 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dmaengine: stm32-dmamux: don't resume runtime PM under a
 spinlock
To: Hyunjung Ko <hj351016@gmail.com>, Vinod Koul <vkoul@kernel.org>, Frank Li
	<Frank.Li@kernel.org>
CC: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, <dmaengine@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<stable@vger.kernel.org>
References: <20261118082853.926607-1-hj351016@gmail.com>
Content-Language: en-US
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
In-Reply-To: <20261118082853.926607-1-hj351016@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F5:EE_|AS8PR10MB7899:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bdc56de-c934-40c1-a3c8-08df4588272b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|376014|23010399003|82310400026|1800799024|10067099003|11063799006|56012099006|261026121527099003|261026140227099003|261028144727099003|261022105027099003|261021123027099003|261021121427099003|261102123227099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: u1MvC4h1jMw/+vmtWaQo1IymemcZ3c5IJVCDppvzONik5enmucdj/r0xh1H2oheeVkgwFxM7uz/2DZ/RIZU9/9dFxE/3wVf5U8qaVUN7cpAgalYxfxkK9A5LWMETCOzHnGv2tcwXjHa/g3OjgsKMNEdmKdxotWRGH7te9SfW6yzjyMo7JWzdIgRbM1KyCcL/XRrw3thPCX81VRu+E9/elMtujawJpzrSubpsv5V7kCMClio5TxfnbB8TFf6is8GnY/U6iKp60QwlTtr4STGAw1HW258x6/n28M9oB7jdlSt3YOzBwhHP22+6u4MDeW/HtAhoFkmw46pAQVrQY3qCRQ/8lEFER5+9op4iqaqt8PsHAEABqq0kvarph6ZL2V2qDuGRu3mccPMyX/6iLyT+Zrw7nCOEJEsD99omSCHF+jFEB/5MAhtP4UdiDOhLm86LMR79jjL1EUADCASc0TOvWhKLHAaNV7W48xIyBJdvvMyfgj/+4R3DistfusIwpZEZaonyy7lPmIxvt1n27Eg79FU43zAl9RTQclY4E9Re+hTS/Jm6QQZlv0XN03fpl4avYXThEpxzAOQGd5F+nHAXxIsTkh2sr1EJ9594Y6buOrFQpBB243rpsPfUvhCDHsT3cEJmM8yFy3RN8p5a93sqW6uir2wBWLJnulms7k2tQiyplRp5jjTKx4iMbsthF/pg6bSyQELmVkRA7FF3BX5UuQ==
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(23010399003)(82310400026)(1800799024)(10067099003)(11063799006)(56012099006)(261026121527099003)(261026140227099003)(261028144727099003)(261022105027099003)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 3ZEjy5k8nT+CmOpSq8y/yMGSE72+IvlX21TYWyXIaNNbXeU5qI7eQvTbaSV4vHZf7cOycr6lz6v+wbBAHB5JPQEnbbQpTUP4dGwRvAS843V5nfT2t4pvr3kRGKEW7YZ++fEdihSK0coWpy8YY8FBmva78k8JCXhAmE5CwMKh+MrOZo811AoAIcRLEW5zyBdilRV5KD9KW9+P8evUgltYh7aTyIoKM9WFnZe234ZQDuQ5umocsel7dL7HplFZt315W6m2xdy38naHRMcdwrWgH3b06o3QUVNLkM/YhblpGGkRD8ojL0cVSfhZkvE1cr8WO+Qwm4rdQRKpITWdY5r5iwgTXciUQH+KqdjMx9gHw3f88AtKBL0CYZQ3qS8tn958Ej3FhAKakTZGMcXqXjdREnGJRH0WPJBE+5EjIyeBHEDZA8ej4mji7Fl3vg8GbgbV
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 15:25:18.3811
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bdc56de-c934-40c1-a3c8-08df4588272b
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509F5.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7899
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_072526_572726_C98E02A2 
X-CRM114-Status: GOOD (  17.90  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On 11/18/26 09:28, Hyunjung Ko wrote:
> stm32_dmamux_route_allocate() calls pm_runtime_resume_and_get() while
> holding dmamux->lock with interrupts disabled. The runtime-resume
> callback stm32_dmamux_runtime_resume() calls clk_prepare_enable(), which
> can sleep, and the device is not marked pm_runtime_irq_safe(), so this
> can sleep in atomic context.

Indeed.

> 
> The lock does not protect anything here: the dma_inuse bitmap is already
> updated under the lock earlier in the function, and this second critical
> section only wraps the pm_runtime call. Drop the lock around it.

The lock is misplaced and completely useless here. Your patch is correct 
but incomplete.
The lock should instead protect the CCR register write, as in 
stm32_dmamux_free(), which also needs to be fixed.

> 
> Fixes: 4f3ceca254e0 ("dmaengine: stm32-dmamux: Add PM Runtime support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
> ---
>   drivers/dma/stm32/stm32-dmamux.c | 6 +-----
>   1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/dma/stm32/stm32-dmamux.c b/drivers/dma/stm32/stm32-dmamux.c
> index 57318715d9f3..890328b3d302 100644
> --- a/drivers/dma/stm32/stm32-dmamux.c
> +++ b/drivers/dma/stm32/stm32-dmamux.c
> @@ -139,13 +139,9 @@ static void *stm32_dmamux_route_allocate(struct of_phandle_args *dma_spec,
>   	}
>   
>   	/* Set dma request */
> -	spin_lock_irqsave(&dmamux->lock, flags);
>   	ret = pm_runtime_resume_and_get(&pdev->dev);
> -	if (ret < 0) {
> -		spin_unlock_irqrestore(&dmamux->lock, flags);
> +	if (ret < 0)
>   		goto err_put_dma_spec_np;
> -	}
> -	spin_unlock_irqrestore(&dmamux->lock, flags);
>   
>   	mux->request = dma_spec->args[0];
>   

In addition, I suggest:
@@
-	stm32_dmamux_write(dmamux->iomem, STM32_DMAMUX_CCR(mux->chan_id),
-			   mux->request);
+	spin_lock_irqsave(&dmamux->lock, flags);
+	stm32_dmamux_write(dmamux->iomem, STM32_DMAMUX_CCR(mux->chan_id),
+			   mux->request);
+	spin_unlock_irqrestore(&dmamux->lock, flags);
+

And moving pm_runtime_put_sync() in stm32_dmamux_free():
@@ static void stm32_dmamux_free(struct device *dev, void *route_data)
      /* Clear dma request */
      spin_lock_irqsave(&dmamux->lock, flags);

      stm32_dmamux_write(dmamux->iomem, STM32_DMAMUX_CCR(mux->chan_id), 0);
      clear_bit(mux->chan_id, dmamux->dma_inuse);

-	pm_runtime_put_sync(dev);
-
      spin_unlock_irqrestore(&dmamux->lock, flags);

+	pm_runtime_put_sync(dev);
+
      dev_dbg(dev, "Unmapping DMAMUX(%u) to DMA%u(%u)\n",
          mux->request, mux->master, mux->chan_id);


Runtime PM calls are made outside the lock, which is held only for the 
CCR write and the dma_inuse bitmap.

Regards,
Amelie

