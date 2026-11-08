Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93212606A337
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 02:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xyh4jRJ5;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=kkvwdeSA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=PuGzHsk/LIqXvaJ1IohwPD9m5fePFH4W4L4+Otr9oFg=; b=xyh4jRJ5mD/sHi
	zTnp/5uTYmIcy0JjrvvTbLVIxf6usjNuyZhYw6M0URSP4cOEJyrQV8c03vX/kvJRABdIy1N9LV93e
	7fXx9RjPrlxlV3+LXsIy840V0hxqHOdLYnwY/ixa0cm5TRI6fvywyJB8LOfvKAgJM9C44PcX59jIb
	HVlRqchzDG9AM4sjqaPzdOy43M4n+EHIjSYytnIft5eO4SF67IOSGUcz3oGEVDDzK68NfKisobfjb
	hmXkSRKWwM3P+7HBBcxuZk3vT/Cnt3MzV5dt/+Si0EpYiOTK7Kui0Un/Mb9jjLmPJ6s58DuUvajR4
	k5ROn4VTlVgiG2uoa13A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPsFe-0000000FaiV-1D9E;
	Sun, 08 Nov 2026 02:03:22 +0000
Received: from mail-m16023652234.xmail.ntesmail.com ([160.236.52.234])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPsFa-0000000Fahp-2e3t;
	Sun, 08 Nov 2026 02:03:20 +0000
Received: from [172.16.12.90] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 53dfa8dee;
	Sun, 8 Nov 2026 10:03:07 +0800 (GMT+08:00)
Message-ID: <f5edf258-4b6d-416a-9b27-efa47be8d91a@rock-chips.com>
Date: Sun, 8 Nov 2026 10:03:05 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] arm64: dts: rockchip: Enable NPU on RK3588 EVB1
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com
References: <20261106-rk3588-evb1-dt-updates-v1-0-bdbe16223589@collabora.com>
 <20261106-rk3588-evb1-dt-updates-v1-2-bdbe16223589@collabora.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <20261106-rk3588-evb1-dt-updates-v1-2-bdbe16223589@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0aa1b8e5269b03a7kunm53324d9a39fbb5
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDSR4eVk8ZQk4YTR8aGUtMGlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=kkvwdeSA0JXJh94IWdoOSWnmeXYZ9RyQRqQBfDWgsti8LomJ+ryPfekPup1YK2zqCp32ezrhpwkXNcPo9NMfBs2c+x/+MOjst8p/1yt7jZEP8715nyJ1Tq02av39HeA2waphNRPwmGnFstec7rZdZfNzWes+86n1+K6ZFHurI3I=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=PuGzHsk/LIqXvaJ1IohwPD9m5fePFH4W4L4+Otr9oFg=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_180319_242852_00185529 
X-CRM114-Status: GOOD (  11.39  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/7/2026 5:57 AM, Sebastian Reichel wrote:
> Also enable the NPU on the RK3588 EVB1, which is very similar to
> the QuartzPro64.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---

I remember there was already a similar patch before?
Maybe I got something wrong.

Reviewed-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>

>  arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts | 34 ++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts b/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
> index 87e624d1e094..6476d9e3be6f 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
> @@ -578,6 +578,10 @@ &pd_gpu {
>  	domain-supply = <&vdd_gpu_s0>;
>  };
>  
> +&pd_npu {
> +	domain-supply = <&vdd_npu_s0>;
> +};
> +
>  &pd_rkvdec0 {
>  	domain-supply = <&vdd_vdenc_s0>;
>  };
> @@ -703,6 +707,36 @@ &pwm2 {
>  	status = "okay";
>  };
>  
> +&rknn_core_0 {
> +	npu-supply = <&vdd_npu_s0>;
> +	sram-supply = <&vdd_npu_mem_s0>;
> +	status = "okay";
> +};
> +
> +&rknn_core_1 {
> +	npu-supply = <&vdd_npu_s0>;
> +	sram-supply = <&vdd_npu_mem_s0>;
> +	status = "okay";
> +};
> +
> +&rknn_core_2 {
> +	npu-supply = <&vdd_npu_s0>;
> +	sram-supply = <&vdd_npu_mem_s0>;
> +	status = "okay";
> +};
> +
> +&rknn_mmu_0 {
> +	status = "okay";
> +};
> +
> +&rknn_mmu_1 {
> +	status = "okay";
> +};
> +
> +&rknn_mmu_2 {
> +	status = "okay";
> +};
> +
>  &saradc {
>  	vref-supply = <&vcc_1v8_s0>;
>  	status = "okay";
> 

-- 
Best, 
Chaoyi


