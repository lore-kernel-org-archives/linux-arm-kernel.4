Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7994606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 12:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=okweTLxF;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q5K79/ES
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=wBVufWqx+zH+Uabek6EiBTZA75eVbJUE6aSars2bL34=; b=okweTLxFh/fM/Z
	LoeYs0+LhMz4TQy9+6bwxYcEwRLuVI/G5AlJmIpsE30goMJk1VNWn+NuYE6S96cX31huJhUUbmowI
	sEVd/gBm75D6M/C5wa6Ngqzen/skD/d1aa8ShQNlyoN/inUCNax1JIPC25BKGhTmT9j/emvXfj+yA
	Nmd9NuwcDEtFnsB/ue5W87JwZNT0n4ac3iTm8r/VNaA2lC4hoy4m21f6eXU4pGC2Ep6Pyt9C47aNC
	aAprbXpzfhOlNr5vwZ4NShys9Ibm/e7+tgiGFTwACVUx62k9GHJLUwQHxEGGbhXYaA7KedmitFQch
	TwOA4qpDRAmDZSPSYiMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR7gO-00000006hiD-2iCm;
	Wed, 11 Nov 2026 12:44:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR7gM-00000006hhx-2tsn;
	Wed, 11 Nov 2026 12:44:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 13182406F6;
	Wed, 11 Nov 2026 12:44:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5B201F00A08;
	Wed, 11 Nov 2026 12:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794401046;
	bh=wBVufWqx+zH+Uabek6EiBTZA75eVbJUE6aSars2bL34=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=Q5K79/ESG/5STADM/C4yNOyYanyQR+iMqif/9JX8s2kGjcWLTcPqJyC/MSpNok2Kq
	 epm6pHdIZLUjJ+jsZxuuLRPVfmmeonGUaaDJpxqgxmvpLnzn5eCdO6sQv6UwHaHuyD
	 RUuluQ6RpF+0BNvTIPVg151dShj/Nc4GztlisY4n+aEx2XppIiuFck+HhmDlZBselD
	 sRWHhVaKADnvGSLzYnl4Tee1c0Cr1r1NGToNaTSlwMpxO5aTyZ85qKgrp4qKEYJoRH
	 PkmOtLbMjPUYLN8DRPDu3XREjwiA4kRf8CP74P/FCm+mLBXGvkwm1ER1FYEHW9du8C
	 qUpLmEz993KNg==
Message-ID: <6ac5aaef-8753-46b4-b934-1a9b6fe1af46@kernel.org>
Date: Wed, 11 Nov 2026 13:44:02 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v2] media: cec: meson: ao-cec: enable the controller clock
 at probe
To: christian.koever-draxl@student.uibk.ac.at, neil.armstrong@linaro.org,
 hverkuil@kernel.org, mchehab@kernel.org, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com
Cc: linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Christian_Stefan_K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
References: <20261106102105.47244-1-christian.koever-draxl@student.uibk.ac.at>
Content-Language: en-US, nl
In-Reply-To: <20261106102105.47244-1-christian.koever-draxl@student.uibk.ac.at>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Hi Christian,

On 06/11/2026 11:21, christian.koever-draxl@student.uibk.ac.at wrote:
> From: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
> 
> The CEC core calls .adap_log_addr() before .adap_enable(), so the first
> register access can happen while the controller is still in power-off
> mode (CEC_GEN_CNTL clock field 0). The probe only pulses the reset bit,
> leaves the clock field at zero, and does so only after the adapter has
> been registered, when the core may already be using it.
> 
> On S4 an access to the powered-off controller never completes: it
> stalls the AO bus and hard-hangs the SoC. This triggers on every HDMI
> unplug, because that invalidates the physical address and makes the
> core rewrite the logical address.
> 
> Reset the controller and leave its clock running before the adapter is
> registered, as .adap_enable() would.

Hmm, I have a few issues with this.

The commit log does not really match what is happening: the problem is
that the CEC adapter is registered while the controller is still
powered off. That's clearly not right, since once it is registered, it
can be used by userspace, so in that respect this patch seems sane.

Regarding the changed code for the RESET pin: Neil, can you review this?

Christian, can you also point out where in the CEC core adap_log_addr is called
before adap_enable? Because I am not sure that should be done at all, so
that might be a core framework bug. In any case, that is unrelated to the
actual patch.

Regards,

	Hans

> 
> Fixes: 7ec2c0f72cb1 ("media: platform: Add Amlogic Meson AO CEC Controller driver")
> Signed-off-by: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
> ---
> Changes in v2:
> - Set up the controller before cec_notifier_cec_adap_register() and
>   cec_register_adapter(), not after: once registered, the core may call
>   .adap_log_addr() straight away (reported by the Sashiko AI review).
> - Link to v1: https://lore.kernel.org/r/20261025192046.208710-1-christian.koever-draxl@student.uibk.ac.at
> 
> Tool use (Documentation/process/generated-content.rst):
> This work was done with the help of an AI coding assistant, Claude
> (Anthropic), used through Claude Code over many sessions. It did a large
> part of the hands-on work: it read the vendor kernel and the firmware
> interfaces, probed registers on the board, drafted the code and the
> changelogs, and ran the builds, checkpatch, dt_binding_check and the
> tests on the hardware. I directed the work, reviewed every change and
> the final patches, and take responsibility for them. There is no single
> prompt to quote; the sessions were of the form "find out why X fails on
> this board, fix it, test it on the box".
> 
> Tested on an Amediatech X98Q TV box (Amlogic S905W2, S4 family, 2 GiB),
> vendor U-Boot and BL31/OP-TEE, Linux 7.3 plus this work.
> 
>  drivers/media/cec/platform/meson/ao-cec.c | 26 +++++++++++++++++++----
>  1 file changed, 22 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/cec/platform/meson/ao-cec.c b/drivers/media/cec/platform/meson/ao-cec.c
> index 2df0d3743077..4c03c829fe86 100644
> --- a/drivers/media/cec/platform/meson/ao-cec.c
> +++ b/drivers/media/cec/platform/meson/ao-cec.c
> @@ -660,6 +660,28 @@ static int meson_ao_cec_probe(struct platform_device *pdev)
>  
>  	device_reset_optional(&pdev->dev);
>  
> +	/*
> +	 * Setup Hardware, before the adapter is registered: from then on the
> +	 * CEC core may call .adap_log_addr() at any time.
> +	 *
> +	 * Leave the controller with its gated clock running. The CEC core
> +	 * calls .adap_log_addr() before it ever calls .adap_enable(), so the
> +	 * first register access happens while the block would otherwise still
> +	 * be in power-off mode (CEC_GEN_CNTL clk field == 0). On Amlogic S4
> +	 * that access never completes: it stalls the AO bus and hard-hangs the
> +	 * SoC - every CPU stops, IRQs included - which happens on every HDMI
> +	 * hot-unplug, because that is what invalidates the CEC physical
> +	 * address.
> +	 */
> +	writel_relaxed(CEC_GEN_CNTL_RESET |
> +		       FIELD_PREP(CEC_GEN_CNTL_CLK_CTRL_MASK,
> +				  CEC_GEN_CNTL_CLK_ENABLE),
> +		       ao_cec->base + CEC_GEN_CNTL_REG);
> +	fsleep(100);
> +	writel_relaxed(FIELD_PREP(CEC_GEN_CNTL_CLK_CTRL_MASK,
> +				  CEC_GEN_CNTL_CLK_ENABLE),
> +		       ao_cec->base + CEC_GEN_CNTL_REG);
> +
>  	ao_cec->pdev = pdev;
>  	platform_set_drvdata(pdev, ao_cec);
>  
> @@ -674,10 +696,6 @@ static int meson_ao_cec_probe(struct platform_device *pdev)
>  	if (ret < 0)
>  		goto out_probe_notify;
>  
> -	/* Setup Hardware */
> -	writel_relaxed(CEC_GEN_CNTL_RESET,
> -		       ao_cec->base + CEC_GEN_CNTL_REG);
> -
>  	return 0;
>  
>  out_probe_notify:
> 
> base-commit: 7be4bc52fd9e0e55dc9a2e0232b89427d2c4b614


