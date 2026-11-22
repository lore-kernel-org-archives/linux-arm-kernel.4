Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E88606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 16:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IcpwK++u;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=X1DPxKVU;
	dkim=pass (1024-bit key) header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=OztXrZ6K
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0nnzDdRCsGSeP+fBdqjwR5i2BMDAgYKhOGLFfKlLzIo=; b=IcpwK++u+iz6zW
	Oqit8msxBhiW4lPlWu6nZnUbVHxrFJmh1+sluPO5cpvKo6EyayD5SEHURjyJKgzNO0EmCtcidELr3
	C8/YeSIP1nqcyauL54qK7iCB5QonRMvgqwPzYsHdP+sb6vCsa+TsvDt6dKMHdnZxxVndKmfYC4ZWT
	LKRNbTP+IVTNUTFbNqMrjfCms/lgY1uJzqJCoaLi5Fj5vEGXtZWnr1URg6EjGohqtn7EuDs10z326
	ap/P3HtfE1mUwG+TYMJ4N5SWdELFN7nmrmlQRuKolAQ45OzV59Hpt9OZo3u7OciEd/vZn2BjZp8Ex
	qwJZ+DvpF+Wf5DQquC7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVA0U-00000001JjA-2SFD;
	Sun, 22 Nov 2026 16:01:34 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVA0R-00000001Ji4-278m
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 16:01:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From:
 Content-Language: References: Cc: To: Subject: MIME-Version: Date:
 Message-ID: CFBL-Address: CFBL-Feedback-ID; q=dns/txt; s=fe-e1b5cab7be;
 t=1795363289; bh=0nnzDdRCsGSeP+fBdqjwR5i2BMDAgYKhOGLFfKlLzIo=;
 b=X1DPxKVUYnpe0DXC5ZhIMoX4Hq5JdwOAy2tRI+a5/jRolQADBgfqAUbk9mS77+S+LiyQvUsYf
 xaGwISAmq740tpskvF1QJ8aI2bgc/KZ/Hvo6a1FrV8i9Ge/mcXjg82A6pb4MSxYOrqrhg8yyM3l
 MOGENnVJUK4+bo+StG8WpLlkdkwym2DTLOUNni7Q8kJ+QGvPla2ppLW88RAlyKh8NnLgHyKtieR
 Oy1nr6f3JcR08UO93MJ0XIhdh0V+sXoBaedsoAN/yA/QH6PG49Ie+QBoDFCuOstlNAv1PIGO+C2
 KTRbboOJF6oBmh/BAc0mo9rmPi5NVMiL96HiL6G6ZZ0A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=forwardemail.net;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From:
 Content-Language: References: Cc: To: Subject: MIME-Version: Date:
 Message-ID: CFBL-Address: CFBL-Feedback-ID; q=dns/txt; s=default;
 t=1795363289; bh=0nnzDdRCsGSeP+fBdqjwR5i2BMDAgYKhOGLFfKlLzIo=;
 b=OztXrZ6KEcEzqTFvaMjQahny9+U3H4o/YMTHNthHSkEEdlPotoG5E4eaiWNemQ+UF7+HGOpEE
 j6ym3AMrD0BIaUHQrmSWuMx3lFLx03zhiAl3Mx8GDfu1AaTVmhvmAcIBMfs4MSdzf6ZFzAF20xu
 Z0ypfVrJECtlLAGrL+RmTkE=
CFBL-Feedback-ID: 6b0311c84993f8611a547daf:b2541adc3895f43479a7fd6879cc7454
CFBL-Address: abuse@forwardemail.net; report=arf
X-Forward-Email-ID: 6b0311c84993f8611a547daf
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.19.37
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <5cf52e28-110a-4fc2-acfb-eb264e8c31e2@kwiboo.se>
Date: Sun, 22 Nov 2026 17:01:08 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] ARM: dts: rockchip: Add support for RK3506
To: Andrew Lunn <andrew@lunn.ch>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Richard Cochran <richardcochran@gmail.com>,
 devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org
References: <20261122060114.773624-1-jonas@kwiboo.se>
 <20261122060114.773624-3-jonas@kwiboo.se>
 <86007bdd-6c10-46ba-aac6-197939934c73@lunn.ch>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <86007bdd-6c10-46ba-aac6-197939934c73@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_080131_653964_064E5167 
X-CRM114-Status: GOOD (  10.99  )
X-Spam-Score: -2.0 (--)
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

Hi Andrew,

On 11/22/2026 4:46 PM, Andrew Lunn wrote:
>> diff --git a/arch/arm/boot/dts/rockchip/rk3506.dtsi b/arch/arm/boot/dts/rockchip/rk3506.dtsi
> 
>> +		gmac0: ethernet@ff4c8000 {
>> +			compatible = "rockchip,rk3506-gmac", "snps,dwmac-4.20a";
>> +			reg = <0xff4c8000 0x2000>;
>> +			clocks = <&cru CLK_MAC0>, <&cru CLK_MAC0_PTP>,
>> +				 <&cru PCLK_MAC0>, <&cru ACLK_MAC0>;
>> +			clock-names = "stmmaceth", "ptp_ref",
>> +				      "pclk_mac", "aclk_mac";
>> +			interrupts = <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
>> +			interrupt-names = "macirq", "eth_wake_irq";
>> +			phy-mode = "rmii";
> 
> Sorry, missed this on the first pass of the patchset.
> 
> phy-mode is generally a board/PCB property, not a SoC property. It
> would only be a SoC property when the SoC cannot do anything other
> than RMII. But given this is snps,dwmac, i expect it can do other phy
> modes.

This SoC only support RMII mode, so I put the phy-mode at SoC level.

Datasheet for this SoC lists following:

  RMII 10/100 Ethernet Controller
  - Support two Ethernet Controllers
  - Supports 10/100-Mbps data transfer rates with the RMII interfaces
  - Supports both full-duplex and half-duplex operation

The Technical Reference Manual also only mention RMII:

  38.2 Block Diagram
  ...
  The MAC only supports the PHY interfaces of reduced MII (RMII).
  ...
  MAC Supports 10/100-Mbps data transfer rates with the RMII interfaces.

Regards,
Jonas

> 
> 	Andrew


