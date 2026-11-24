Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B4B4606A33C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 11:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=U1sWr1Xl;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Drf2d3kH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=slDeNcL8nKCZniQIETBrb4VJOKJ5hyGXbFudBtIpRpk=; b=U1sWr1Xl9YOTjw
	iFnitZG/s3PQoLhHYUVKAHkN6Ea/WpTLamSu767HdwX4s3tD8UaQj2bB/z8+AQ7xrITS3LbLk87PF
	gkACcUCQvKs7MbDulVctP429tJkOkE3uPXFm3zTJAOZNt1XIDN/WP66LiAnOUhj3sKdihayefjpzE
	HcZeskLwyzdOQMPvZHJZRbdgfX1sJ/xWKyEgPBD1fhMXww9Sr9VbWVnqFVllTGHM/7EUhUaowPTCO
	4bHA4MrgaJawSln1tQi2WC6vVW7oeOXKoH1JNcKT6rb/yJA1rl2hdY9z8YjZs6WD6RlzNyz8VGTtT
	JyIM/s0HOn7CuOV2UOwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVp1F-00000006Q0o-2Mut;
	Tue, 24 Nov 2026 11:49:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVozA-00000006Ovl-0hcu;
	Tue, 24 Nov 2026 11:46:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 80A176025A;
	Tue, 24 Nov 2026 11:46:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26E141F000C6;
	Tue, 24 Nov 2026 11:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795520815;
	bh=slDeNcL8nKCZniQIETBrb4VJOKJ5hyGXbFudBtIpRpk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Drf2d3kH2oL7HKNlZ6XeGyqR3uji1dygb7rgeAVaeV2Kc+i6XafzH6vV8fsdclelw
	 LiMld5nRkW1TqIRKkfvI5/g2+RaSxBNKBvHje6k8xiH/rWcnwxhngQWPei+/qMD4GN
	 QhAF7bRqfmZCQecPqvIUKlyXl4DB6H8CkpzhjqUvea+hxQRz4ML+O1k980nvasSI3q
	 Vk6CR3gB0qfiMNogf92PEqEmbIOjZIBNRdTVEQgYiqFdxprHVkbp6mPVUE28honZuF
	 jgYyqcYoXrIWqZewFvBMUJRNh5kpkVNvzM6ynyQiAzdYsgLBxlTw0QRPxANmFcw73c
	 pcUdskm0hmDww==
Message-ID: <977c6810-8c9b-42d5-8f98-d2b15dbabad7@kernel.org>
Date: Tue, 24 Nov 2026 12:46:50 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] phy: apple: atc: Add T8122 DisplayPort support
To: Sasha Finkelstein <k@chaosmail.tech>, Janne Grunau <j@jannau.net>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ramzi Abdiche <abdicheramzi@gmail.com>
References: <20261122-t8122-phy-v2-0-8d5c8fdf31ba@chaosmail.tech>
 <20261122-t8122-phy-v2-4-8d5c8fdf31ba@chaosmail.tech>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20261122-t8122-phy-v2-4-8d5c8fdf31ba@chaosmail.tech>
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 22.11.26 13:28, Sasha Finkelstein wrote:
> From: Ramzi Abdiche <abdicheramzi@gmail.com>
> 
> Add DisplayPort AUX and lane setup for T8122-family PHYs.
> Select clock and lane settings by link rate and stop active
> lanes before orientation changes.
> 
> Signed-off-by: Ramzi Abdiche <abdicheramzi@gmail.com>
> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
> ---

[...]

>   
> +struct atcphy_dp_ops {
> +	void (*enable_aux)(struct apple_atcphy *atcphy);
> +	void (*disable_aux)(struct apple_atcphy *atcphy);
> +	int (*set_rate)(struct apple_atcphy *atcphy, enum atcphy_dp_link_rate lr);
> +	int (*stop)(struct apple_atcphy *atcphy);
> +};

Couldn't we just make this part of atcphy_hw as well? That one already 
contains a bunch of variant-specific function pointers now and I don't 
see a reason why these here have to be separate.

> +
>   struct atcphy_hw {
>   	void (*configure_post_tunable)(struct apple_atcphy *atcphy, enum atcphy_mode mode);
>   	void (*configure_pipehandler_usb3_host)(struct apple_atcphy *atcphy);
> @@ -600,6 +733,7 @@ struct atcphy_hw {

[...]

>   static int atcphy_dp_configure_lane(struct apple_atcphy *atcphy, enum atcphy_lane lane,
>   				    const struct atcphy_dp_link_rate_configuration *cfg)
>   {
> @@ -1452,20 +2013,11 @@ static int atcphy_dp_configure_lane(struct apple_atcphy *atcphy, enum atcphy_lan
>   
>   	lockdep_assert_held(&atcphy->lock);
>   
> -	switch (lane) {
> -	case APPLE_ATCPHY_LANE_0:
> -		tx_shm = atcphy->regs.core + LN0_AUSPMA_TX_SHM;
> -		rx_shm = atcphy->regs.core + LN0_AUSPMA_RX_SHM;
> -		rx_top = atcphy->regs.core + LN0_AUSPMA_RX_TOP;
> -		break;
> -	case APPLE_ATCPHY_LANE_1:
> -		tx_shm = atcphy->regs.core + LN1_AUSPMA_TX_SHM;
> -		rx_shm = atcphy->regs.core + LN1_AUSPMA_RX_SHM;
> -		rx_top = atcphy->regs.core + LN1_AUSPMA_RX_TOP;
> -		break;
> -	default:
> +	if ((unsigned int)lane > APPLE_ATCPHY_LANE_1)
>   		return -EINVAL;
> -	}

This is a bit weird, that thing is an enum so why not just keep the 
switch? This is also the only place that checks if lane is valid before 
calling atcphy_lane_reg(). I don't think it's even possible to have an 
invalid value here so I'd maybe drop this check completely since it 
always passes or change atcphy_lane_reg() to be something like

	int atcphy_lane_reg(void __iomem **reg, ....)

and return an error and put the register into *reg.



Sven


