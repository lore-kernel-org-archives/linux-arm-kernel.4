Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A85A606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 10:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LMa3Qz1M;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=fBSmtxPJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=v1/2YqpCnIwSCbwLLDUxkqgFBM6zZChxPmbs8wgtA+k=; b=LMa3Qz1MqvOoOe
	EMkoofoWqGyIBiN2PWNDJPIgRRerHuJ7/O74+BWlJ9iryA6eIVOhc8MNGfdrL4BkRTx07fE+QdYWT
	Su5VQqG99plsC9TVdl3ml9mGLpYPRYKDshf9vCnelsOXFnDOhJ90cldEnJ/EjqnzRMjif28IqP5iz
	9xzrceurfQXu4YBtiT2C6/PXOIQYg9FIGqJ6m9HwUMoifx0XgTZe55I4tFla0xhcMcMzNeXW7LIBN
	4pk6AJghF0Ps5YGvdFXJ2mP1q4EIU2mnNsvtB+Ev2Dl9r01YLb+RTUBPKjn7kldCwsGvpRfF0ygyJ
	yRSh4fGghE3Ze96/k8sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWswb-0000000FYdE-2xYV;
	Fri, 27 Nov 2026 10:12:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWswZ-0000000FYcl-0FHK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 10:12:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 383C81758;
	Fri, 27 Nov 2026 02:12:35 -0800 (PST)
Received: from [10.33.50.35] (e142021.arm.com [10.33.50.35])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0B6FB3F86C;
	Fri, 27 Nov 2026 02:12:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795774358; bh=c0/6aFDfGtHa/8JQkzEFzcPkvj+Wr26/24s6cKwSZCQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fBSmtxPJFJbeboQw9s+OXlHilp+OaovcEU5LIl1/Cw+DtoGBkQnd0nqKd7/SaZl1y
	 j1hOmIWQGJa+hcR/AtcXt6RKNRg0+L+9h6G2E4MG2+42VOynwL/NvBRH8/hUCqDnrS
	 a/yTDaH5tcedXgKOZyL4ilJHfyP8zJUH1/TpaZRc=
Message-ID: <194329c7-45d0-4493-af07-f972694c075e@arm.com>
Date: Fri, 27 Nov 2026 10:12:32 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] hwrng: sun55i-ce: Add Allwinner A733 CE v5 TRNG
 support
To: Alastair D'Silva <alastair@d-silva.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S . Miller" <davem@davemloft.net>, Olivia Mackall
 <olivia@selenic.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20261125210532.695823-1-alastair@d-silva.org>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20261125210532.695823-1-alastair@d-silva.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_021239_146611_8B45270D 
X-CRM114-Status: GOOD (  13.17  )
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On 11/25/26 22:05, Alastair D'Silva wrote:
> This series adds True Random Number Generator (TRNG) support for the
> Allwinner Crypto Engine v5 on A523 and A733 SoCs, and enables it on the

so while I agree that the TRNG part is probably the most practical 
functionality of the crypto engine IP, the encryption/decryption parts 
are still there, and we have a driver for the older IP. And because the 
functionality shares all of the registers and probably most of the 
descriptor generating code, and Linux is really after code sharing, I 
think we want the driver to live in drivers/crypto, next to the existing 
sun8i-ce code, if not becoming part of it.

Cheers,
Andre
> Xunlong OrangePi 4 Pro.
> 
> Dependencies:
> Patches 3 and 4 depend on the OrangePi 4 Pro bringup series:
>    [PATCH 0/3] arm64: dts: allwinner: Add Xunlong OrangePi 4 Pro support
>    Message-ID: <20261125124407.4098345-1-alastair@d-silva.org>
> 
> Tested on Xunlong OrangePi 4 Pro (/dev/hwrng).
> 
> Alastair D'Silva (4):
>    dt-bindings: crypto: Add Allwinner A523/A733 Crypto Engine
>    hwrng: sun55i-ce - Add Allwinner CE v5 TRNG driver
>    arm64: dts: allwinner: sun60i-a733: Add Crypto Engine node
>    arm64: dts: allwinner: sun60i-a733-orangepi-4-pro: Enable Crypto
>      Engine
> 
>   .../crypto/allwinner,sun55i-a523-crypto.yaml  |  68 ++++
>   MAINTAINERS                                   |   7 +
>   .../allwinner/sun60i-a733-orangepi-4-pro.dts  |   4 +
>   .../arm64/boot/dts/allwinner/sun60i-a733.dtsi |  12 +
>   drivers/char/hw_random/Kconfig                |  13 +
>   drivers/char/hw_random/Makefile               |   1 +
>   drivers/char/hw_random/sun55i-ce-trng.c       | 377 ++++++++++++++++++
>   7 files changed, 482 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/crypto/allwinner,sun55i-a523-crypto.yaml
>   create mode 100644 drivers/char/hw_random/sun55i-ce-trng.c
> 


