Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7442D606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 10:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eyrYk4VX;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FUOuTDop
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=J9J3atRjzDUkmzU4NP7PeoY9nYVjUiWTLXAb7WnvcUQ=; b=eyrYk4VXPdu7XZyIz9PG2EUx3h
	9vyaFKCiWhN5e516MUK/auld1Z3NltVXsmInYbIhCtMD8IKssVU40I1H34lkIT7NrnK6MmPTUFwfJ
	ahtaECi/0l03ax7XZ60eC0mUqWX3AeShPUqvxnGt+h81yGxlGdtJVMA+gghZJiKVOUxRUB+CTcJWX
	9mY7iu40wX99a0KpQR+T2Cmdf0A2xfjXGJKe3N5A73KYHRc7+Xc4ItWdMnOxPr2S4+ntBI9zKL6DB
	xdeFIgyXf4a+QRniyn5TiwauhfgVE+3XbY6STpeDDpsnNMhlz+Q/YcDF7ThTznEkmjmnm4VUUbIb/
	Fn/0YwIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVRKy-00000002xif-0AbQ;
	Mon, 23 Nov 2026 10:31:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVRKs-00000002xhf-2VED
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 10:31:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0426861FAC;
	Mon, 23 Nov 2026 10:31:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEB331F000D0;
	Mon, 23 Nov 2026 10:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795429905;
	bh=J9J3atRjzDUkmzU4NP7PeoY9nYVjUiWTLXAb7WnvcUQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FUOuTDopHNOZqzhQEQ8HnET20lUE83sOqc4h0i1Kz51+fv54xEkDuNdvui4cLJnUS
	 Of+CzgAcQjeK404BqAc2El9m4g2VlESlu5B2HrQZz69yL0JIboaET5fOvcXrVHepF0
	 POifw9BWfmODvWk1/UDXTJ8MVSCz7EwSaoVduZSu+tIIl9dnOOh3IQ+s0y8R7EifkP
	 RKf2f4LTvewEBHyYeS4B6bPzTlL2rW1xUI3ABd7r4UyDqneEnzh7s5japFg4rhFuiI
	 Mn38Afxl5ajQSK47zIxJUwDHcHgJqoI/jC0o6zLsFcnKP1xbpdBJH6wzuLhi2UwelE
	 ym5JNV2Y59Szg==
Date: Mon, 23 Nov 2026 11:31:42 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Linus Walleij <linusw@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 06/13] soc: synaptics: add SL2610 system controller
 support
Message-ID: <20261123-knowing-eggplant-buffalo-fddfc3@quoll>
References: <20261115102401.3520-1-jszhang@kernel.org>
 <20261115102401.3520-7-jszhang@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261115102401.3520-7-jszhang@kernel.org>
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Nov 15, 2026 at 06:23:45PM +0800, Jisheng Zhang wrote:

> +static const struct sl2610_syscon_data sl2610_mcu_data = {
> +	.cells = sl2610_mcu_cells,
> +	.num_cells = ARRAY_SIZE(sl2610_mcu_cells),
> +};
> +
> +static const struct sl2610_syscon_data sl2610_avio_data = {
> +	.cells = sl2610_avio_cells,
> +	.num_cells = ARRAY_SIZE(sl2610_avio_cells),
> +};
> +
> +static const struct sl2610_syscon_data sl2610_cpu_data = {
> +	.cells = sl2610_cpu_cells,
> +	.num_cells = ARRAY_SIZE(sl2610_cpu_cells),

That's just MFD driver, so should be in MFD, no? Why placing standard
MFD code - nothing soc specific - in the soc directory?


> +};
> +
> +static int sl2610_syscon_probe(struct platform_device *pdev)
> +{
> +	const struct sl2610_syscon_data *data = device_get_match_data(&pdev->dev);
> +
> +	return devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO,
> +				    data->cells, data->num_cells, NULL, 0, NULL);
> +}

Best regards,
Krzysztof


