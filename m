Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7210606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 11:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CdZkpYKH;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=NXX6a2Fs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7v5ZNN63HvHrdbqH3CUQi62kfadGnTXvbl26t53r41k=; b=CdZkpYKHTGPCZE
	SX5T1VAtfHNDV85KCUUE+nVild95aAosXCzSJeimZfGZ+Ue4vEPl5jc5qjtNUT61UwvovRNvcN7QE
	a9VsQadF0e4XJs70vsu/SkmB/yWzu3EIxGcHoJIWwmp3FNqGHvKsLy2T54YQvNj+bMUO4TAbyUKST
	Ah9k7ULky2RyR/AGu92dQadM8jlbepbB74uuA0EgBnnWZuh2vm8JAXRK/k2TUfiPZxAly4+kSugi2
	nkJHM3AYbPRMVd6Fr1KJDN/73OolF5v/Wj3L8PpyhFueIuaQ8NvVRi+cWC7EjE82COORykk3l31C6
	tGiUUelLbyYk3wvmWfVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU0D1-0000000Bgen-17It;
	Thu, 19 Nov 2026 11:21:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU0Cz-0000000BgeS-16pu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 11:21:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CE4301575;
	Thu, 19 Nov 2026 03:21:36 -0800 (PST)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C53453F882;
	Thu, 19 Nov 2026 03:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795087299; bh=ryVGJvRFBKaDiggrplKfiWJ6FP8BRQLqWd2Wvok1GeQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NXX6a2FszbHwrTzPyuCBWkGsKVFFN9/j1nx5TKJv3bUAJe2mev+0wuSIgDWMjA7JJ
	 +3u+G6+Xf2wXZjvHMHM2+zy6zAQwdlaRTT7JT1ixLxKuTTK8apBoMmDBObTxJGi03M
	 Mof15FU0FgTcf5o2MBncHLIGuFsLgRtajtqOXx1U=
Message-ID: <6064cf83-7cf8-4ac2-b8c6-9745e05d8e3e@arm.com>
Date: Thu, 19 Nov 2026 12:21:25 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: allwinner: orangepi-zero2/zero3: Read
 the SPI NOR over two lines
To: aiyengar1990@gmail.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20261119-zero2-spi-nor-dual-read-v2-0-185c87065e39@gmail.com>
 <20261119-zero2-spi-nor-dual-read-v2-2-185c87065e39@gmail.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20261119-zero2-spi-nor-dual-read-v2-2-185c87065e39@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_032141_371541_914540C8 
X-CRM114-Status: GOOD (  13.96  )
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

On 11/19/26 06:29, Arun Iyengar via B4 Relay wrote:
> From: Arun Iyengar <aiyengar1990@gmail.com>
> 
> WP# and HOLD# are tied to VCC on the Zero2 (schematic v1.3), so read over
> two lines. Andre Przywara pointed out that the Zero3 is the same.
> 
> Suggested-by: Andre Przywara <andre.przywara@arm.com>
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>

You can drop the Suggested-by:, as the whole thing was your idea, and I 
just suggested the move.

Feel free to add:
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Tested-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>   arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi
> index 646d92e0f724..4a588c44d029 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi
> @@ -110,6 +110,7 @@ flash: flash@0 {
>   		compatible = "jedec,spi-nor";
>   		reg = <0>;
>   		spi-max-frequency = <40000000>;
> +		spi-rx-bus-width = <2>;
>   	};
>   };
>   
> 


