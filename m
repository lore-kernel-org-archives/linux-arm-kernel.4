Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51FBC606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 11:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=A8F52baZ;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CNmLzglP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=EiMYBgdIo+7Jld6p7aiOMau8jqoH62LYKTF989Hvq/Y=; b=A8F52baZnCKK9V
	FX0HSFX1+5MB3DE8AH9nmZPHua0oup1ZLOsFh5umxS9YJVSbIQ70Ndkgc8rnLseu5P/HZ1gHZqzPu
	+xxDWBPimP3QR7w4AYDYREU4Vs4tT3b5Yf5R54JEvmz9xKYBPmDzyDGFbq88kjImCHbfXQnu0bn79
	gkyavFuL8G3GpIcC7QTQsiMEPribJsZcBxOE0OJLFtqr0Acvbttdx2IGPguROuonPVYVVezS7DZzT
	j3OLJClNGzKyytOqk/EEAyLrDOINDj8h+G3soZXZwqNcN3A9IH+R7VWfcQmjNkcaeCDM6ACGN4FsO
	3HkOx7tw4OcJ4+GZ15hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVolw-00000006Mi3-01Nq;
	Tue, 24 Nov 2026 11:33:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVolu-00000006MhO-0pV7;
	Tue, 24 Nov 2026 11:33:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 583AB61283;
	Tue, 24 Nov 2026 11:33:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A95D1F000C0;
	Tue, 24 Nov 2026 11:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795519992;
	bh=EiMYBgdIo+7Jld6p7aiOMau8jqoH62LYKTF989Hvq/Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=CNmLzglPE9LHYi1mJezvBeOc7Q8Xzm8eeZEZtUF00B9ZlXidaJlB+eldfiCZjTWhy
	 UlK4P+spLc2W6rLxidAmHc2jkMLbG3nWm6mO83c3ZRjQHVDo0vNBPr40J57PNEIcLQ
	 UeM5qcsVS3pqtb8JwUnGXHkYy5JGnNwzWOPa5NEm3VTfj4UAIvWhMd9tlmyuGJikG6
	 EvtzrPQ3SezcjIS0kdPDQvBzd/pHj2VlCNAa/tNK0prYLjrujf49LTsROOXsqEaoFT
	 EhHjyxwELlrJm2846MUz2CaWFNfI3IyT3KalviSodugBq7RlAliQVKw2L5Yg+UH3YV
	 KogiwPJe7hbEA==
Message-ID: <52773445-ffe8-4a42-82ca-e74f18c944b3@kernel.org>
Date: Tue, 24 Nov 2026 12:33:07 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] phy: apple: atc: Add initial M3 series support
To: Sasha Finkelstein <k@chaosmail.tech>, Janne Grunau <j@jannau.net>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261122-t8122-phy-v2-0-8d5c8fdf31ba@chaosmail.tech>
 <20261122-t8122-phy-v2-3-8d5c8fdf31ba@chaosmail.tech>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20261122-t8122-phy-v2-3-8d5c8fdf31ba@chaosmail.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 22.11.26 13:27, Sasha Finkelstein wrote:
> Adds initial support for the new t8122 phy. USB/TB only for now, DP
> will fail to negotiate
> 
> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
> ---

[...]

> +
> +static void atcphy_configure_post_tunable_t8122(struct apple_atcphy *atcphy, enum atcphy_mode mode)
> +{

This function ...

> +	if (atcphy_modes[mode].pipehandler_state != ATCPHY_PIPEHANDLER_STATE_USB3)
> +		return;
> +	core_set32(atcphy, ACIOPHY_CFG0, ACIOPHY_CFG0_COMMON_SMALL);
> +	udelay(10);
> +	core_set32(atcphy, ACIOPHY_CFG0, ACIOPHY_CFG0_COMMON_SMALL_OV);
> +	udelay(10);
> +	core_set32(atcphy, ACIOPHY_CFG0, ACIOPHY_CFG0_COMMON_BIG);
> +	udelay(10);
> +	core_set32(atcphy, ACIOPHY_CFG0, ACIOPHY_CFG0_COMMON_BIG_OV);
> +	udelay(10);
> +	core_clear32(atcphy, ACIOPHY_CFG0, ACIOPHY_CFG0_COMMON_CLAMP);
> +	udelay(10);
> +	core_set32(atcphy, ACIOPHY_CFG0, ACIOPHY_CFG0_COMMON_CLAMP_OV);
> +	udelay(10);
> +	core_set32(atcphy, AUS_COMMON_SHIM_BLK_BIAS_REG, AUS_COMMON_SHIM_BLK_BIAS_REG_BGBIAS_OV);
> +	udelay(10);
> +}
> +
> +static void atcphy_configure_post_tunable_t8122(struct apple_atcphy *atcphy, enum atcphy_mode mode)
> +{

... is defined again here and there's also a _t8103 variant so something 
is off here. I think you want the second one only which doesn't have 
atcphy_power_on_common_t8122 inline maybe?

> +	if (atcphy_modes[mode].pipehandler_state == ATCPHY_PIPEHANDLER_STATE_USB3 ||
> +	    (atcphy->hw->dp && atcphy_modes[mode].enable_dp_aux))
> +		atcphy_power_on_common_t8122(atcphy);
> +}
> +


Sven


