Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE57606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 18:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VEhpAlD1;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Cyrj0nr+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=IRquHP6+JpDcME/70XQJzwgPUGu0D6NcBC9+C049/lA=; b=VEhpAlD1QcRpJe
	vVbnUm0Zz2xKeFirRXLrScdA74ePb0BDeOOTiP//1EvN5drWINpJK88cf+HiMEMfdcTOTKSlzVsmx
	gFK4ScIpgYpOY1qZ69YjXHoyEYDBvlBL7ZNAPKBm+CULHK/TR780BSkZs/6x39u/lJxGCzQ4gfPKk
	GqFBYB80+ZYbFi5UrTA50ZQxtn6oC1ZDxlh0DYK2TfiRCyCxyJcYRjivH0sRzPkQDOtiW5XkltoFJ
	lLQvo2+cmhidbJyXy2ChTrhZXC5FKiDNEnTffnCgrRF/AnemFQQtqUDGbV8IKgYHDbzMMxaZ8bEr9
	0hAjCevabkO0b0XDwFIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0VG-0000000HO7X-2ADm;
	Fri, 27 Nov 2026 18:16:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0VD-0000000HO72-2nkQ;
	Fri, 27 Nov 2026 18:16:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 699331575;
	Fri, 27 Nov 2026 10:16:51 -0800 (PST)
Received: from [10.2.212.23] (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4CC783F86C;
	Fri, 27 Nov 2026 10:16:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795803414; bh=6imln1W2Yy1aPN/smnTpJTPts3LNPdp2Py2G8tyPdSw=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=Cyrj0nr+Aawpo4a9zscl6bwOk0Ckq97a90PJDU6Zc5xrVZ/I3+WGA1BXAgrX+o+iB
	 9D8+slEkc9p2uO0X7wiZF90OZfeY5xl+tPiJX6++jX9vm1PUww2Ws4dWeR+33FPyfQ
	 RC1U0HfsJvGpo10Uyw8MvP8t+ubp08BZ5OSdJgEA=
Message-ID: <03b2548c-e451-408e-b5df-a5dec8c290f8@arm.com>
Date: Fri, 27 Nov 2026 18:16:48 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 4/9] soc: rockchip: grf: Assign the StreamIDs of the
 RK3588 PHP SMMU masters
To: aiyengar1990@gmail.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 David Wu <david.wu@rock-chips.com>, Damien Le Moal <dlemoal@kernel.org>,
 Niklas Cassel <cassel@kernel.org>, Serge Semin <fancer.lancer@gmail.com>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org,
 Pranjal Shrivastava <praan@google.com>, Will Deacon <will@kernel.org>,
 iommu@lists.linux.dev, Shawn Lin <shawn.lin@rock-chips.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
References: <20261113-mmu600-php-v1-0-231196049a3b@gmail.com>
 <20261113-mmu600-php-v1-4-231196049a3b@gmail.com>
Content-Language: en-GB
In-Reply-To: <20261113-mmu600-php-v1-4-231196049a3b@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_101655_828705_A1E1F9AA 
X-CRM114-Status: GOOD (  19.35  )
X-Spam-Score: -4.4 (----)
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

On 13/11/2026 4:38 pm, Arun Iyengar via B4 Relay wrote:
> From: Arun Iyengar <aiyengar1990@gmail.com>
> 
> The StreamIDs of the six masters behind the RK3588 PHP SMMU come from
> PHP GRF registers that reset to 0 and are never programmed, so the SMMU
> can not tell the masters apart.
> 
> Assign StreamIDs 1-6 on both AXI channels. 0 stays unused, so a master
> that loses its ID is aborted instead of using another device's tables.

Urgh... could you at least hide this in U-Boot and have that inject the 
corresponding "iommus" entries into the DTB it's passing, similar to 
what the NXP Layerscape platforms do for their "iommu-map" generation?

StreamIDs are really not meant to be programmable, and even if they are 
then that is not supposed to be exposed to OSes. The Arm Base System 
Architecture[1] explicitly calls this out:

   R_ITS_DEV_9: The relationships between a device, its StreamID and
   its DeviceID are considered static by OS or hypervisor software. If
   the mapping is not fixed by hardware, the relationship between a
   StreamID and a DeviceID must not change after system initialization,
   and OS drivers must not be required to set it up.

Even just in practical terms, how is this going to work if someone boots 
a new kernel with an older DT or vice-versa, and one set of hard-coded 
values then fails to correspond to the other?

Thanks,
Robin.

[1] https://support.arm.com/documentation/den0094/latest/

> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
>   drivers/soc/rockchip/grf.c | 37 +++++++++++++++++++++++++++++++++++++
>   1 file changed, 37 insertions(+)
> 
> diff --git a/drivers/soc/rockchip/grf.c b/drivers/soc/rockchip/grf.c
> index b459607c118a..3f0f82a2119f 100644
> --- a/drivers/soc/rockchip/grf.c
> +++ b/drivers/soc/rockchip/grf.c
> @@ -168,6 +168,40 @@ static const struct rockchip_grf_info rk3588_sysgrf __initconst = {
>   	.num_values = ARRAY_SIZE(rk3588_defaults),
>   };
>   
> +/* PHP SMMU StreamIDs: bits 15:0, no write-enable mask */
> +#define RK3588_PHP_GRF_GMAC0_SID_AW	0x0074
> +#define RK3588_PHP_GRF_GMAC1_SID_AW	0x007c
> +#define RK3588_PHP_GRF_SATA0_SID_AW	0x0084
> +#define RK3588_PHP_GRF_SATA1_SID_AW	0x008c
> +#define RK3588_PHP_GRF_SATA2_SID_AW	0x0094
> +#define RK3588_PHP_GRF_GMAC0_SID_AR	0x009c
> +#define RK3588_PHP_GRF_GMAC1_SID_AR	0x00a4
> +#define RK3588_PHP_GRF_SATA0_SID_AR	0x00ac
> +#define RK3588_PHP_GRF_SATA1_SID_AR	0x00b4
> +#define RK3588_PHP_GRF_SATA2_SID_AR	0x00bc
> +#define RK3588_PHP_GRF_USB3OTG2_SID_AR	0x00c4
> +#define RK3588_PHP_GRF_USB3OTG2_SID_AW	0x00cc
> +
> +static const struct rockchip_grf_value rk3588_defaults_php_grf[] __initconst = {
> +	{ "gmac0 write streamid", RK3588_PHP_GRF_GMAC0_SID_AW, 1 },
> +	{ "gmac0 read streamid", RK3588_PHP_GRF_GMAC0_SID_AR, 1 },
> +	{ "gmac1 write streamid", RK3588_PHP_GRF_GMAC1_SID_AW, 2 },
> +	{ "gmac1 read streamid", RK3588_PHP_GRF_GMAC1_SID_AR, 2 },
> +	{ "sata0 write streamid", RK3588_PHP_GRF_SATA0_SID_AW, 3 },
> +	{ "sata0 read streamid", RK3588_PHP_GRF_SATA0_SID_AR, 3 },
> +	{ "sata1 write streamid", RK3588_PHP_GRF_SATA1_SID_AW, 4 },
> +	{ "sata1 read streamid", RK3588_PHP_GRF_SATA1_SID_AR, 4 },
> +	{ "sata2 write streamid", RK3588_PHP_GRF_SATA2_SID_AW, 5 },
> +	{ "sata2 read streamid", RK3588_PHP_GRF_SATA2_SID_AR, 5 },
> +	{ "usb3otg2 write streamid", RK3588_PHP_GRF_USB3OTG2_SID_AW, 6 },
> +	{ "usb3otg2 read streamid", RK3588_PHP_GRF_USB3OTG2_SID_AR, 6 },
> +};
> +
> +static const struct rockchip_grf_info rk3588_phpgrf __initconst = {
> +	.values = rk3588_defaults_php_grf,
> +	.num_values = ARRAY_SIZE(rk3588_defaults_php_grf),
> +};
> +
>   static const struct of_device_id rockchip_grf_dt_match[] __initconst = {
>   	{
>   		.compatible = "rockchip,rk3036-grf",
> @@ -202,6 +236,9 @@ static const struct of_device_id rockchip_grf_dt_match[] __initconst = {
>   	}, {
>   		.compatible = "rockchip,rk3576-ioc-grf",
>   		.data = (void *)&rk3576_iocgrf,
> +	}, {
> +		.compatible = "rockchip,rk3588-php-grf",
> +		.data = (void *)&rk3588_phpgrf,
>   	}, {
>   		.compatible = "rockchip,rk3588-sys-grf",
>   		.data = (void *)&rk3588_sysgrf,
> 


