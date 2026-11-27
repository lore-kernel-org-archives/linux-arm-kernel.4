Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D563D606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 17:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RQgzjjzv;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=larR9y8f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=istvK8Vo0dRH+5Ab3OL0OyFKa13o+bNLAyZJ8VHCKOU=; b=RQgzjjzvVXMS5q
	AiPezDIBX0v2Kwy93PEE1TwzCOeIlfJAtVtKDlwtu5Ta03FUxMGpAZ0syjwuhzVp4AchRRtYvqGUo
	YhGWTEHeBiRarDWOwck1vsw11dYQqvNwahOBt9x3e3cVabGnvvm8DkHGoMbphxBCPsvfsOMwlg3hI
	Zv74P6DLAe0mD1w4sGbS+WNzzFJW5XgBUEm8aO4PdzDQrfXPzqNW8KiDcv3vnA9bKlMeRHGw9/H2Z
	z3prAgy72jUBc5wKoSnSnkBSNlNWpJVMlKNkrQQhbgVjjUCepMaBi0rxCH0lsu7DF6y94EdscT1Ga
	PKU9Vi6EOaffCWYnH7rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWzTb-0000000HDC8-13qS;
	Fri, 27 Nov 2026 17:11:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWzTY-0000000HDBh-2LK1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 17:11:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BAFB81575;
	Fri, 27 Nov 2026 09:11:04 -0800 (PST)
Received: from [10.33.50.35] (e142021.arm.com [10.33.50.35])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 420CB3F632;
	Fri, 27 Nov 2026 09:11:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795799467; bh=FCVTxmg2sdNe51AfMa4AF6QW/CSqjRWXIVeiCqPpDFA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=larR9y8fPCMYOCR0QN4mHid/9x1bOSkf3g8gr9pqbONVSj3e673DCXSSg/l2cnTvN
	 JaxYZpMAYZrMUW/1vbOiD2LDb/qn+eJDY2NNo3KV4x5DjPuj/bs1vq1gNUQLsJRjpi
	 Fc574CcHhAAl0stGrYBgNePEgsCr94bmezg9WkeY=
Message-ID: <1eb33e7a-38ba-43c1-bf8d-477d75071e7a@arm.com>
Date: Fri, 27 Nov 2026 17:11:03 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v3 3/3] arm64: dts: allwinner: a523: drop the PA
 GPIO interrupt
To: Pablo Mazzini <pmazzini@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
References: <20261124215048.42074-1-pmazzini@gmail.com>
 <20261124215048.42074-4-pmazzini@gmail.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20261124215048.42074-4-pmazzini@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_091108_765211_751AF1DF 
X-CRM114-Status: GOOD (  14.66  )
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

Hi,

On 11/24/26 22:50, Pablo Mazzini wrote:
> The PA IRQ bank is not implemented, and the driver now numbers the IRQ
> banks from PB. Drop its interrupt.

"the driver" probably refers to the Linux driver, but DTs live in a 
different world, and are independent from any driver implementations, so 
this is not a good argument.
The real reason is that the binding changed, to only count implemented 
banks, even though this is not explicitly stated there.

> This reverts commit 6b81aa0c8a4f ("arm64: dts: allwinner: a523: Add
> missing GPIO interrupt").

I think that deserves a fixes tag. Backports are somewhat questionable 
for DT patches, but it helps for U-Boot, which would import tagged DT 
changes only.

> Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>

The change itself is fine:

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>   arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> index 85ef492ffeae..fc4d714a96ea 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> @@ -129,8 +129,7 @@ gpu: gpu@1800000 {
>   		pio: pinctrl@2000000 {
>   			compatible = "allwinner,sun55i-a523-pinctrl";
>   			reg = <0x2000000 0x800>;
> -			interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>,
> +			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>,
>   				     <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>,
>   				     <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>,
>   				     <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>,


