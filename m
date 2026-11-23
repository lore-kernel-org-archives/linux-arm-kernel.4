Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022BB606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 21:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CZrXkij5;
	dkim=pass (2048-bit key, unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256 header.s=t20230301 header.b=SG8euddV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=cnrtqlUaAitFNBwdxdrwcWq+Op/M4cGZoOzTkf/omVQ=; b=CZrXkij5QkeOBL
	NP9bm4TGTflRf5fj8goOlrHre8i5Cg0tg9C53FcaYuBLtpZ9SfAhScAuANgjZI6+wvo01k7g6oXS2
	ulPMGPV/6s1ftslCJsQ3NsYka1+4xcBEeIt2y85daRJzyEHDP5gFTxmKAF4fe9p0tbFivTfPyWXiu
	KOr1C7oODBf7LgzYK6radCFuOwu1vfLVztUNQziGQB86YKBDQP44KdcYZa9qIMUc8g7krr32I5ixE
	GbX0xgUyGtzz1ueAwwtopFo7E5k5nzpe+ekCHtArVohbrsm0HqZAsrswMfZO/noCH2YO0uZacsrL2
	oDAL0gpKpIVb5ZSkwoGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVan7-00000004rz7-3UJ3;
	Mon, 23 Nov 2026 20:37:33 +0000
Received: from smtp-75.smtpout.orange.fr ([80.12.242.75] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVan1-00000004rx1-1XBn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 20:37:32 +0000
Received: from [IPV6:2a01:cb10:785:b00:9f13:a1ff:dc18:901b]
 ([IPv6:2a01:cb10:785:b00:9f13:a1ff:dc18:901b])
	by smtp.orange.fr with ESMTPSA
	id VamrxSo4ep3XLVamrxXZcj; Mon, 23 Nov 2026 21:37:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1795466240;
	bh=cnrtqlUaAitFNBwdxdrwcWq+Op/M4cGZoOzTkf/omVQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=SG8euddV1/2nH6Q8GA5nr1I4Z/cCoi6E0wfYBTfkaJ2bzbcbZ77IIxqEmMTuNSXBy
	 GCUqovoUyUjzhbKKR4d7AH4xfLFdTx/kkaysFZgIPL2ZSD631fo5T4WOWjUXwq23o7
	 A1gVndDbZdW5KWvNPWnHNaHiNSNK5Hx5UATDxKgnl/5pbIDxUn3cDOptQsT9Ghp8+/
	 sWex+a+RV9LDhBHyYp0Z/fxB2QWFTsclv42ckxkq8cT4qh6UQQGh4Wky4/seeWuGCo
	 FD0tR/kzmwDPph0Tqxe0U93Fd9iK6okUBfKJPHTzC+6J/wWbpTfd3uOlaX2yfAdaHi
	 t2g0n4b412fwg==
X-ME-Helo: [IPV6:2a01:cb10:785:b00:9f13:a1ff:dc18:901b]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 23 Nov 2026 21:37:20 +0100
X-ME-IP: 2a01:cb10:785:b00:9f13:a1ff:dc18:901b
Message-ID: <b37108dd-e1d5-43bc-a637-c87a8538570f@wanadoo.fr>
Date: Mon, 23 Nov 2026 21:37:17 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mailbox: stm32-ipcc: Use devm_clk_get_enabled() in
 stm32_ipcc_probe()
To: Markus Elfring <Markus.Elfring@web.de>,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Fabien Dessenne <fabien.dessenne@st.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, Ludovic Barre <ludovic.barre@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Frank Li <Frank.Li@kernel.org>,
 Michal Simek <michal.simek@amd.com>
References: <d3e781aa-04e6-4643-bb39-beb4dcfe9b33@web.de>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Content-Language: en-US, fr-FR
In-Reply-To: <d3e781aa-04e6-4643-bb39-beb4dcfe9b33@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_123727_829259_755941FB 
X-CRM114-Status: GOOD (  20.52  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Le 22/11/2026 à 18:54, Markus Elfring a écrit :
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 22 Nov 2026 18:42:21 +0100
> 
> * Reuse existing functionality from devm_clk_get_enabled() instead of
>    keeping duplicate source code.
> 
> * Omit a clk_disable_unprepare() call on an error handling path.
> 
> * Delete the label “err_clk”.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>   drivers/mailbox/stm32-ipcc.c | 18 ++++--------------
>   1 file changed, 4 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/mailbox/stm32-ipcc.c b/drivers/mailbox/stm32-ipcc.c
> index e88e198436a6..25d8138a3695 100644
> --- a/drivers/mailbox/stm32-ipcc.c
> +++ b/drivers/mailbox/stm32-ipcc.c
> @@ -242,29 +242,21 @@ static int stm32_ipcc_probe(struct platform_device *pdev)
>   	ipcc->reg_proc = ipcc->reg_base + ipcc->proc_id * IPCC_PROC_OFFST;
>   
>   	/* clock */
> -	ipcc->clk = devm_clk_get(dev, NULL);
> +	ipcc->clk = devm_clk_get_enabled(dev, NULL);
>   	if (IS_ERR(ipcc->clk))
>   		return PTR_ERR(ipcc->clk);
>   
> -	ret = clk_prepare_enable(ipcc->clk);
> -	if (ret) {
> -		dev_err(dev, "can not enable the clock\n");
> -		return ret;
> -	}
> -
>   	/* irq */
>   	for (i = 0; i < IPCC_IRQ_NUM; i++) {
>   		ipcc->irqs[i] = platform_get_irq_byname(pdev, irq_name[i]);
> -		if (ipcc->irqs[i] < 0) {
> -			ret = ipcc->irqs[i];
> -			goto err_clk;
> -		}
> +		if (ipcc->irqs[i] < 0)
> +			return ipcc->irqs[i];
>   
>   		ret = devm_request_threaded_irq(dev, ipcc->irqs[i], NULL,
>   						irq_thread[i], IRQF_ONESHOT,
>   						dev_name(dev), ipcc);
>   		if (ret)
> -			goto err_clk;
> +			return ret;
>   	}
>   
>   	/* mask and enable rx/tx irq */
> @@ -323,8 +315,6 @@ static int stm32_ipcc_probe(struct platform_device *pdev)
>   		dev_pm_clear_wake_irq(dev);
>   err_init_wkp:
>   	device_set_wakeup_capable(dev, false);
> -err_clk:
> -	clk_disable_unprepare(ipcc->clk);
>   	return ret;
>   }
>   

NACK.

This patch is wrong, because it the clk will be disable_unprepared an 
extra time if the remove function is called.
(see the last call of the probe to understand why)

CJ

