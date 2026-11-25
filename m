Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13064606A323
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 11:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RqmEj4DI;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=UYJXo4IH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=RuxpbZ0LJq2aGgYutmGiyBC8T4jNjUNwueH9TU0HUDg=; b=RqmEj4DIHSC2cJg/Lb2oFEi7xc
	4QSulnDtTV/k0SF/qL1Xj4wOiFpbDR/hjlwLVEUYoyFoI/Nsyqo1l0RZYz7Q9HM+x6bQ4rjsbn2ZR
	IUgvA+AsDvioyIBRsAvRNooiJnKLJYj+fp/0f2kJZyHWSzmjZUpycp3joFKMX8zysKgKV2ZqKeh3p
	o9rYtpGFkkF3/P7popZE1x/m6iFkNPFZICoAEMpVrXC93xWM7ZeUcAZfUhNlx34vTixLORbMg/2QA
	xcrJpIeoG3RaIRFVZjz6m/5FACGvWpDwkMOEsfC2VPpan4MpklzNEEbYQVPrdrQ0Kp1gMfJLh8guY
	1CnhIuTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWBMM-00000009ffm-33Lb;
	Wed, 25 Nov 2026 11:40:22 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWBM3-00000009fTb-2Xne
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 11:40:08 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-491971ac844so5099558f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 03:40:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795606801; x=1796211601; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RuxpbZ0LJq2aGgYutmGiyBC8T4jNjUNwueH9TU0HUDg=;
        b=UYJXo4IHfO77xlAX/nAmfZaxA4JlAnGBV3Sd5cJT/2cxfc/DfcrRcmYJZRtiT08+kS
         Ap9sS4vJOtrQcG3i0apUX4MeiRQqH9sPzto29/NEhZ14JyXQ1CqsHMoFaYTacRrQnFtp
         QEVH4M4jKKmSyZgJyIXlNY8yGhzTbrWzw7DhxIHgkm6ZG1akEmoXfOX+/loQk5wVDmwq
         nOTxK0QhTMVg532Mw4xr0BedSCIQjrFY3mrI8t3coIIAntqQwzqRmukvgPxKYEuIMaEp
         EymjVWMgPh8/OPh3vzvN4KXzHl8IjEx5rGEkDDAGpXzibNIhSMKWa0JLmQBTpK1JLiqE
         jy4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795606801; x=1796211601;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RuxpbZ0LJq2aGgYutmGiyBC8T4jNjUNwueH9TU0HUDg=;
        b=DGPFH2DV5OWbdu7CKDzpCN1GTWQDaoNcdyaVNgDmIxJxk5S6UoyvQfKBMpQnQjEPWO
         /6m3nLcetl/6wB5lAOgC9EPv42wcWOYHEBtS5mjCkK6twsTg+wQMPhv7l4EMEseHWvbz
         Hlgv1YgvzTh6hGYFeuFeTZkWw8uglifVTX4GlXLgKEfzpU8/j9zBqigce0yqiyszY9Vb
         CgsF6CSCXpHoXWw850eljhE0hOQzNFw9XPX1EZr6BwQ1m0cU68doDF3qlC/OpSpjhmjY
         vUyvcAAeec13HjYOj2yaM8zMqX50/KHcQ2XJGCpy6JXU58aA7zcauCG8TPL/4xWDFQA0
         ynmQ==
X-Forwarded-Encrypted: i=1; AL+hErHr5bopHbuo7epEmh/x0ddeKiCTY4tZMvZTkfClPEb/ty2QqgQq/XBnL6Gz7g3n8RaarPh0ZYVBP6IbJJd43eh9@lists.infradead.org
X-Gm-Message-State: APuU4Z9MB8zfAHtKtG05Rw9RawT+TvpxjQXSdeUN8Nh0JWoJDgri3y5k
	TaQIvVIzzqPmqOILiGkSvY+hditeqM4QKHNuJDmZzpI2U2orxyDw+wO4JBpR/ER/R5M=
X-Gm-Gg: AZFdTZfvfdWmFsgmJhaC9zz6bbXnAcauSHdOboMxWxfDc0ssH1zMm92HQpotEDwrb+Q
	pTR1I67TR3FG2h0zZdKDFTWR9I1mZpyGSLwvrK0R3vfJJ5WoIbnZrJ6Yhi6U+VSmp13nGmwA/Cp
	kQyGCg+ThVoM4RYi0bug264NypBt5RjQZ9wgIEI9drgmb0xSJ7onD54azoomUou7fMzFuavEE8a
	s5f1oba9gcoK91eMWEOQcLzg4RQbwLMMBc4Buhd2EBZOuRAIkG/QhSmThNYjaP3LRHJvuiF5qxn
	jVIn0vY0sFL7DBEDKTxqCi74fhGGtkekmsA+HOXGt4OUemCZzduoZ4lF6CzWjoYM4uzi7CndtIN
	g/NKfwljgvmrBytiUO0K/FQ9YXTL9qaxdV5ovWDj5PvLM2fLdjVadCpTTh/fgkXlWuYYRlvYMiA
	2/R+Gyz9skjQynsIdSpq6dcKeNlb6Q9GsczstXitAbhXM2FOpuVZnDnGH94ilqKvgbYDzcoyPDH
	HDljyhk6Aw/Iz3KbYXbIiwxI2uFWSL+D/O7CA+7vJiW0jSnCtECU344yXhkmRMZsv3R29huwrbe
	XxNcWtMsj354r+wYnNPramCv3M1L
X-Received: by 2002:a05:6000:24c3:b0:4a4:368:409d with SMTP id ffacd0b85a97d-4abaa9769d3mr37443004f8f.3.1795606800712;
        Wed, 25 Nov 2026 03:40:00 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b5f6sm31635115f8f.34.2026.11.25.03.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:40:00 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Wed, 25 Nov 2026 12:43:59 +0100
To: Joshua Covington <joshuacov@gmail.com>
Cc: Thomas Gleixner <tglx@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Radu Rendec <radu@rendec.net>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Stanimir Varbanov <svarbanov@suse.de>,
	Andrea della Porta <andrea.porta@suse.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] irqchip/irq-bcm2712-mip: Drop MSI_CHIP_FLAG_SET_ACK
Message-ID: <awbJ_8i4TUV7KZjv@apocalypse>
References: <20261121163809.86620-1-joshuacov@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261121163809.86620-1-joshuacov@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_034003_691044_8959C99C 
X-CRM114-Status: GOOD (  20.95  )
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
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Joshua,

On 16:38 Sat 21 Nov     , Joshua Covington wrote:
> Commit f35508b93a2f ("irqchip/irq-bcm2712-mip: Set EOI/ACK flags in
> msi_parent_ops") made the PCI MSI device chips ack through
> irq_chip_ack_parent(). Neither the MIP middle chip nor the GIC below it
> implements irq_ack, so any ack is a NULL pointer call.
> 
> The MIP vectors are handled by handle_fasteoi_irq(), which never acks,
> so this only shows when mask_ack_irq() runs, e.g. when a chained
> handler is removed. The RP1 driver does that on every teardown since
> commit 82aa033fef52 ("misc: rp1: clear chained IRQ handlers on
> teardown"), and the kernel panics:
> 
>   pc : 0x0
>   lr : irq_chip_ack_parent+0x1c/0x28
>   Call trace:
>    __irq_do_set_handler+0x248/0x24c
>    irq_set_chained_handler_and_data+0x6c/0x94
>    rp1_unregister_interrupts+0x3c/0xa8
> 
> The MIP hierarchy has no use for an ack, like the drivers fixed by
> commit fb0ea6e4878a ("irqchip: Drop MSI_CHIP_FLAG_SET_ACK from
> unsuspecting MSI drivers").
> 
> Fixes: f35508b93a2f ("irqchip/irq-bcm2712-mip: Set EOI/ACK flags in msi_parent_ops")
> Signed-off-by: Joshua Covington <joshuacov@gmail.com>
> ---
> The panic was reported on BCM2712 with 6.18.61 and later when the
> rp1_pci probe fails (https://github.com/openwrt/openwrt/pull/26530#issuecomment-6975561491).
> Tested on a Raspberry Pi CM5 with 6.18.64 and the Raspberry Pi
> downstream patches: with this patch, unbinding and binding rp1_pci
> again completes without a panic. Applies unchanged to v7.4-rc3 and
> builds there without warnings (W=1, GCC 13 and clang 18).
> 
>  drivers/irqchip/irq-bcm2712-mip.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/irqchip/irq-bcm2712-mip.c b/drivers/irqchip/irq-bcm2712-mip.c
> index 06a6ab627..12d9e3846 100644
> --- a/drivers/irqchip/irq-bcm2712-mip.c
> +++ b/drivers/irqchip/irq-bcm2712-mip.c
> @@ -163,7 +163,7 @@ static const struct irq_domain_ops mip_middle_domain_ops = {
>  static const struct msi_parent_ops mip_msi_parent_ops = {
>  	.supported_flags	= MIP_MSI_FLAGS_SUPPORTED,
>  	.required_flags		= MIP_MSI_FLAGS_REQUIRED,
> -	.chip_flags		= MSI_CHIP_FLAG_SET_EOI | MSI_CHIP_FLAG_SET_ACK,
> +	.chip_flags		= MSI_CHIP_FLAG_SET_EOI,
>  	.bus_select_token       = DOMAIN_BUS_GENERIC_MSI,
>  	.bus_select_mask	= MATCH_PCI_MSI,
>  	.prefix			= "MIP-MSI-",

Reviewed-by: Andrea della Porta <andrea.porta@suse.com>

> -- 
> 2.43.0
> 

