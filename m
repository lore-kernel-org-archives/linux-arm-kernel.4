Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0742606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 12:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jCNPspgk;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=frqtt9rs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ikrkT4unPcBTp2tgWugemt3WecqbaPqo/nqUTFKC3Es=; b=jCNPspgkyzdd483oz9EA7QGJmb
	JZS5DOFt97BCAGV0VCJDJ61k6AyKmjXCk+E1RByXdtqqNlH6XibNetWwaGRVbYLSWnFFXFZw/J9XT
	ZF+tNDKkj5nwWMpyJmN7i9K0zWiTPmrfyugQU8SwKLYGzY+j1NR3tA3ZZsduB1WAl5XX6bAxxkvvk
	S6Jhs72G6VNBC1/YsBMr9KNP5R1uQTmAQJODJO7Ox8eu2V2+uZDrLopYJlbVdiElSy3VhcPpQkSfo
	IqxLd4jVsCnQ9Eod87ApH/3AnrXTUKzxLawRm8HFOs29XxosCjaaP1Bn4lrPZb8dCy0bRU9rH4hju
	YwY0LVUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVTZ2-00000003TX4-1RfF;
	Mon, 23 Nov 2026 12:54:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVTZ0-00000003TVs-43SS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 12:54:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 06E16620F9;
	Mon, 23 Nov 2026 12:54:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FF331F000C4;
	Mon, 23 Nov 2026 12:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795438469;
	bh=ikrkT4unPcBTp2tgWugemt3WecqbaPqo/nqUTFKC3Es=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=frqtt9rsqngqM53eCgPeF+xKKrhBTfsfd2UB6R8Et1Xxpkjp3jY90OguMFWibf4FS
	 8Pk2ck/WOrzk59vkCuAh/rY66LUBpYUr0wimeYtXjWYv6PUtSeu4FHyyUu5ZVghgLD
	 sQ2uuezGNrbvvR4zTet2A10LdJDjYJVcRi8RsulqSt4hbSAckIPp4amT/hC5LFFCvg
	 M/Lj+krM1Ja21tNrnftbGNNuKivIAAqDrkQVUeh0V9cl9tmD6wTHaKFLzR4QLNSIcT
	 Ccl82+XTNVuczqwcUXdE5ZElKe2s09C7b9bN+rSyM/URyXiwrJ5RWlrxYj6i/zOTkL
	 +DtW42d5Bu3yQ==
Date: Mon, 23 Nov 2026 20:34:11 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Linus Walleij <linusw@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 06/13] soc: synaptics: add SL2610 system controller
 support
Message-ID: <awQyw9fp8qTj3kbU@xhacker>
References: <20261115102401.3520-1-jszhang@kernel.org>
 <20261115102401.3520-7-jszhang@kernel.org>
 <20261123-knowing-eggplant-buffalo-fddfc3@quoll>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261123-knowing-eggplant-buffalo-fddfc3@quoll>
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

On Mon, Nov 23, 2026 at 11:31:42AM +0100, Krzysztof Kozlowski wrote:
> On Sun, Nov 15, 2026 at 06:23:45PM +0800, Jisheng Zhang wrote:
> 
> > +static const struct sl2610_syscon_data sl2610_mcu_data = {
> > +	.cells = sl2610_mcu_cells,
> > +	.num_cells = ARRAY_SIZE(sl2610_mcu_cells),
> > +};
> > +
> > +static const struct sl2610_syscon_data sl2610_avio_data = {
> > +	.cells = sl2610_avio_cells,
> > +	.num_cells = ARRAY_SIZE(sl2610_avio_cells),
> > +};
> > +
> > +static const struct sl2610_syscon_data sl2610_cpu_data = {
> > +	.cells = sl2610_cpu_cells,
> > +	.num_cells = ARRAY_SIZE(sl2610_cpu_cells),
> 
> That's just MFD driver, so should be in MFD, no? Why placing standard
> MFD code - nothing soc specific - in the soc directory?

I'm not sure which is better. But FWICT, sophgo, samsung, microchip put
mfd drivers in soc directory. So I guess the reason behind this is these
drivers are soc specific?

> 
> 
> > +};
> > +
> > +static int sl2610_syscon_probe(struct platform_device *pdev)
> > +{
> > +	const struct sl2610_syscon_data *data = device_get_match_data(&pdev->dev);
> > +
> > +	return devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO,
> > +				    data->cells, data->num_cells, NULL, 0, NULL);
> > +}
> 
> Best regards,
> Krzysztof
> 

