Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49691606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 23:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FZ4BJ7+0;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lsGc42KK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=uyCJO08GrvmJEYSfRuoyU9muRQ/ofXlsPrd3wHpfc1M=; b=FZ4BJ7+0cN8JZS
	YCknE7xae1tdpJntHc25Wd1ti4kqTY8uGLc2CYuGVmhcZ5aa63yswuhOrnApEPW2YVKzaY11+n1Of
	IqkRznExokXMoPJNFRqffEXemCa850iB8rvLmtUWXeclRLaFsyQ/Z6ywenl5jCGYn0r9ghdtqxzjm
	KzEPBN4i9fzF9JdNLu4LyMdHaPJUgUJr9hQaOQuqweHDA1CZE38dWTgvcXt673ZsnQALYu9qVkKIm
	DnOm6UQM0LfRny2zZEqIxYkJsfWxUXNYkIys2J2U1p7CCTzfIfudBY7IQu3Ty7lkza8REN7plCTdU
	s7cfUmccYW0dxfFWQAXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPppQ-0000000FVOT-2EaC;
	Sat, 07 Nov 2026 23:28:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPppP-0000000FVON-0jDr
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 23:28:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 53BAC60623;
	Sat,  7 Nov 2026 23:28:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55B311F0089F;
	Sat,  7 Nov 2026 23:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794094086;
	bh=uyCJO08GrvmJEYSfRuoyU9muRQ/ofXlsPrd3wHpfc1M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=lsGc42KKmWne2Pth9BWg+MFGMg9hyq6mfzEBscLB5/87kXsJseKPjIFndsutmPjsK
	 BUy4r3vtsx4fTICk0+XoNvK1jxUC/WvmFDvUEZIg6Aucg77sCeB5gCEmjElDRvWdMb
	 1KpDn6vkAMsjBbVLUuKVdH8Lty1MT11aKR22ll3rmJH+XIuOoQWFiBCsZmgqQpWcG2
	 Q8PSdC09BlbneLZ97q+A9tYjAmo/oQa6Q42luKuDGeWAv2l3pOHw00wk0ckvW4LHm/
	 yfQxcVgq5eChRBK0pBKVV5Lp2ehXmeR9jdgjFJIgOiyX2I+PEyiBcYEfOn+8sP+sIu
	 7Plaocgy1HIgQ==
Date: Sat, 7 Nov 2026 23:27:57 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: Michal Simek <michal.simek@amd.com>, Sai Krishna Potthuri
 <sai.krishna.potthuri@amd.com>, David Lechner <dlechner@baylibre.com>, Nuno
 =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, <linux-iio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <amitrkcian2002@gmail.com>
Subject: Re: [PATCH 1/6] iio: adc: versal-sysmon: fix race in interrupt
 teardown
Message-ID: <20261107232757.1ddf1120@jic23-hlaptop>
In-Reply-To: <20261102122112.1723130-2-amit.kumar-mahapatra@amd.com>
References: <20261102122112.1723130-1-amit.kumar-mahapatra@amd.com>
	<20261102122112.1723130-2-amit.kumar-mahapatra@amd.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 2 Nov 2026 17:51:07 +0530
Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com> wrote:

> sysmon_disable_interrupts() masks all interrupts, clears masked_temp and
> cancels the unmask worker, but leaves the interrupt handler live. A
> worker that is already running can re-enable an alarm through IER after
> the mask write. If that alarm fires, the handler queues the worker again
> after cancel_delayed_work_sync() has returned. On unbind this action runs
> before devm releases the IRQ, so the queued work can run after the
> devm-allocated iio_dev that embeds it has been freed.
> 
> Disable the IRQ first so that no handler is running or can start, then
> clear masked_temp and cancel the worker, and mask all interrupts last,
> once nothing is left that can unmask them. Record the IRQ number for
> this.

I always look closely at disable_irq() calls as they normally indicate
a state machine issue - or at least a less than ideal state machine.
Interrupts that hit them in disabled state will start the counting
for spurious interrupt detection etc.  So whilst they sometimes can
be used to cover up for really nasty to handle race conditions they
get extra scrutiny...  So generally I'd expect to let the handler
run, but ensure it doesn't do us any harm.

Given sysmon_disable_interrupts clears masked_temp under the
irq_lock can we not use that to decide not reenable anything
in the unmask_worker.  

So in conclusion it's almost what you have here, but drop the disable_irq
and instead check if there are any masked interrupts that might
be unmasked in the unmask_worker. I think that can either be done before
calling sysmon_unmask_temp() or at the start of that function before
we do anything that might set IER.


> 
> Fixes: c7f7eb10638f ("iio: adc: versal-sysmon: add threshold event support")
> Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
> ---
>  drivers/iio/adc/versal-sysmon-core.c | 5 ++++-
>  drivers/iio/adc/versal-sysmon.h      | 2 ++
>  2 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/adc/versal-sysmon-core.c b/drivers/iio/adc/versal-sysmon-core.c
> index 1b55d343982e..6b9a58e19831 100644
> --- a/drivers/iio/adc/versal-sysmon-core.c
> +++ b/drivers/iio/adc/versal-sysmon-core.c
> @@ -781,12 +781,14 @@ static void sysmon_disable_interrupts(void *data)
>  {
>  	struct sysmon *sysmon = data;
>  
> -	regmap_write(sysmon->regmap, SYSMON_IDR, SYSMON_INTR_ALL_MASK);
> +	disable_irq(sysmon->irq);
>  
>  	scoped_guard(spinlock_irq, &sysmon->irq_lock)
>  		sysmon->masked_temp = 0;
>  
>  	cancel_delayed_work_sync(&sysmon->sysmon_unmask_work);
> +
> +	regmap_write(sysmon->regmap, SYSMON_IDR, SYSMON_INTR_ALL_MASK);
>  }
>  
>  static int sysmon_init_interrupt(struct sysmon *sysmon,
> @@ -807,6 +809,7 @@ static int sysmon_init_interrupt(struct sysmon *sysmon,
>  	if (ret)
>  		return ret;
>  	sysmon->temp_mask = imr & SYSMON_TEMP_INTR_MASK;
> +	sysmon->irq = irq;
>  
>  	ret = devm_request_irq(dev, irq, sysmon_iio_irq, 0, "sysmon-irq", indio_dev);
>  	if (ret)
> diff --git a/drivers/iio/adc/versal-sysmon.h b/drivers/iio/adc/versal-sysmon.h
> index bb9a75bf71c0..701ef9b56263 100644
> --- a/drivers/iio/adc/versal-sysmon.h
> +++ b/drivers/iio/adc/versal-sysmon.h
> @@ -85,6 +85,7 @@ struct regmap;
>   * @regmap: register map for hardware access
>   * @lock: protects read-modify-write sequences on threshold registers
>   *        and cached state that spans multiple regmap calls
> + * @irq: interrupt number, 0 when events are not supported
>   * @irq_lock: protects interrupt mask register updates (MMIO path only)
>   * @masked_temp: currently masked temperature alarm bits
>   * @temp_mask: temperature interrupt configuration mask
> @@ -101,6 +102,7 @@ struct sysmon {
>  	 * that spans multiple regmap calls.
>  	 */
>  	struct mutex lock;
> +	int irq;
>  	/*
>  	 * Protects interrupt mask register updates.  Only used on the
>  	 * MMIO path (fast_io regmap); I2C has no IRQ and never reaches


