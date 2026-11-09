Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D02606A325
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 09:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PA30t3jf;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ns+Ryu63
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SOwx+TrjiqZmjyW3x8UmgFsxHh+2bldbZmSGJ3/I7qc=; b=PA30t3jfjqoUT/y4KJFsa1W/zc
	L29wyBTEKut8SRSvRMdxY2r+aE/NBGcEqAMW4eTUsp16kXUzstDic+z5VsEbT0KZWSd5SEmPT6VuB
	DS8wLwNtZFFyUmjXz18GaoHsCz/uP/Kc6W8ifF675e5tlQ7wVJbchMXo7fdnlCDLbdTxzMGaJ+bTu
	JIPFFT6wn4JPB7RA5DjeRcv3yPeoJwEtvIAal1bPHS42Zlb93NvrblxkW4sfFlqVBPP5m+GIXSUG2
	PePX55SGziPz4apWQ/T6NZ242z6ULkYd9WAQPAuWQyW5vfhKNRor5OKJ3bhJG0of2Jcc/nyZuQP4M
	YSJg1fOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQLQ4-00000000Aut-2ur8;
	Mon, 09 Nov 2026 09:12:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQLQ2-00000000AuW-0fef;
	Mon, 09 Nov 2026 09:12:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9E813415AA;
	Mon,  9 Nov 2026 09:12:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEA5B1F0089F;
	Mon,  9 Nov 2026 09:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794215521;
	bh=SOwx+TrjiqZmjyW3x8UmgFsxHh+2bldbZmSGJ3/I7qc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=Ns+Ryu63yadoW2c4325ppqIQcD4NHuXGcXkZROKQolkkTc9AQM5NzGA/d5uBqYyqd
	 WSe7waQ8h1hfMsLo+BlpGZMlppsGYuhdGkgAhZ2C/uA6dIynJ/Lzb6cXH/+nQjrEoO
	 Tw2X/JhsDnHYwPgAQEMHScpD4B5vfguMtGlRtLxGjVUpuGyX2l/U+jKivZHs3Jjec7
	 12bT7NQl4foNngGfzpPZEGgIqxNWurzyQyTlLSP9r01jf/w+uGw6Xq/cyz23G+GbiR
	 scvq0iQL+EU9PLrf5s6BhGnqhtkA9YanZBuSBaiqQweDlUnWCwhyczNDi+HE/tVtac
	 //Qird/D+539g==
From: Thomas Gleixner <tglx@kernel.org>
To: Yu-Chun Lin <eleanor.lin@realtek.com>, radu@rendec.net, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, lee@kernel.org, afaerber@suse.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 mfd@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-realtek-soc@lists.infradead.org, james.tai@realtek.com,
 cy.huang@realtek.com, stanley_chang@realtek.com, eleanor.lin@realtek.com
Subject: Re: [PATCH v5 4/8] irqchip/realtek-intc-common: Add basic support
 for Realtek DHC SoCs
In-Reply-To: <20261018160653.3940371-5-eleanor.lin@realtek.com>
References: <20261018160653.3940371-1-eleanor.lin@realtek.com>
 <20261018160653.3940371-5-eleanor.lin@realtek.com>
Date: Mon, 09 Nov 2026 10:11:58 +0100
Message-ID: <87y0b2v069.ffs@fw13>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 19 2026 at 00:06, Yu-Chun Lin wrote:
> +static bool realtek_intc_dispatch(struct realtek_intc_subset_data *subset_data)
> +{
> +	const struct realtek_intc_info *bank_info = subset_data->bank_info;
> +	struct realtek_intc_data *data = subset_data->common;
> +	u32 ints, inte, mask, val;
> +	irq_hw_number_t hwirq;
> +	bool handled = false;
> +	int irq;
> +
> +	if (regmap_read(data->base, bank_info->isr_offset, &val))
> +		return false;
> +
> +	ints = val & subset_data->subset_mask->ints_mask;
> +
> +	if (!ints)
> +		return false;
> +
> +	if (regmap_read(data->base, bank_info->scpu_int_en_offset, &inte))
> +		return false;
> +
> +	while (ints) {
> +		irq = __ffs(ints);
> +		ints &= ~BIT(irq);
> +
> +		mask = bank_info->isr_to_scpu_int_en_mask[irq];
> +		if (mask != IRQ_ALWAYS_ENABLED && !(inte & mask))
> +			continue;
> +
> +		hwirq = (subset_data->bank_idx * 32) + irq;
> +
> +		if (!generic_handle_domain_irq(data->domain, hwirq))

You might want to use generic_handle_demux_domain_irq() which allows you
to implement affinity setting for the individual demultiplexed interrupts/

> +static void realtek_intc_handler(struct irq_desc *desc)
> +{
> +	struct realtek_intc_subset_data *subset_data = irq_desc_get_handler_data(desc);
> +	struct irq_chip *chip = irq_desc_get_chip(desc);
> +
> +	chained_irq_enter(chip, desc);

https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?id=6cf0d999a18e799965cf2cf4a0157e257c805946

> +	realtek_intc_dispatch(subset_data);
> +
> +	chained_irq_exit(chip, desc);
> +}

> +int realtek_intc_probe(struct platform_device *pdev, const struct realtek_intc_desc *desc)
> +{
> +	struct realtek_intc_data *data;
> +	struct device *dev = &pdev->dev;
> +	struct device_node *node = dev->of_node;
> +	unsigned int total_subset_num = 0;
> +	int ret, parent_irq = 0;
> +
> +	for (unsigned int i = 0; i < desc->bank_num; i++)
> +		total_subset_num += desc->banks[i].subset_num;
> +
> +	data = devm_kzalloc(dev, struct_size(data, subset_data, total_subset_num),
> +			    GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->saved_en = devm_kcalloc(dev, desc->bank_num, sizeof(*data->saved_en), GFP_KERNEL);
> +	if (!data->saved_en)
> +		return -ENOMEM;
> +
> +	data->base = syscon_node_to_regmap(node->parent);
> +	if (IS_ERR(data->base))
> +		return PTR_ERR(data->base);
> +
> +	data->desc = desc;
> +
> +	data->domain = irq_domain_create_linear(of_fwnode_handle(node),
> +						32 * desc->bank_num,
> +						&realtek_intc_domain_ops, data);

https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?h=irq/drivers&id=51987720c2845807161f56f4714df4562f56f328

> +	if (!data->domain)
> +		return -ENOMEM;

Thanks,

        tglx

