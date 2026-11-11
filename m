Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13EE3606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 10:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Dt/41V0g;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=AoD3nHzP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Lg42JcAukHQ8iAveVz5DalweO0LF5sTRtDq7rYcWLEc=; b=Dt/41V0gy72M12
	Ytfj+ZAhne/X+TaXc3AYi9uwGaagYRIySAD+M/E1tgzLV5EzgXscH/e4WgdNNK3f45ioFJfiYBRFc
	tgVyqbxLFcL9gxCnorvPNta2P4aioVE5N2rVeOnejCo8PHBTP8JkXjMa3GgpISVgNahmemHCO//RK
	FCF6ppzIDtXZRT80xoiGMDxCgFnjOMXMRBBR5rpPPVAUycnBmXfv/v1U3oYIyGa4e7O/NxQKj1X4Z
	XmRtetvejDe/4H91cE5cFi8AtUUglhZT/a/zj+iBj3G5TmAuBDRqedsqf5Y3QHYug6WsTNAP5sWQe
	2Z6KH/hwVdXH3dOPuG9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR5a3-00000006LZN-1blb;
	Wed, 11 Nov 2026 10:29:27 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR5a0-00000006LYr-0sND;
	Wed, 11 Nov 2026 10:29:25 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1794392956; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JTe5DoX4QFDA1xlPbGZSB+3f0P5QxcTRBjZeKv4QyppbcQWFYomOXtmOhbJ5/7eWPkl4gHGAqw73VR+bcZDZ2Zw8OjLS9Nd3fOj4xuJUEL8IeFkcToP+m4oYbB6tFU7tu/1hHYNHek1IdSqlydeFRGe4ojYU1GYgl8m84oU2H1s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794392956; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Lg42JcAukHQ8iAveVz5DalweO0LF5sTRtDq7rYcWLEc=; 
	b=kLNcBvXSZrMN1elJw3mrcslxlwsDBilJJtF8zRGBe08bqp+tfun9Q6WnGnNjtzZ457JezUXauhcz7mLEeqYfdiTHxC55u84W6HkiMb3+GTAUtoPAPIIlIziaKoXGX3hcINdYTFryxcfm0FG6jN5CPHDcURmPd2WDO88dbXQsHwM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=michael.riesch@collabora.com;
	dmarc=pass header.from=<michael.riesch@collabora.com>
DKIM-Signature: a=rsa-sha256; b=AoD3nHzP+3PjVMejUKvFVKHMzU3OiYbWy/ZL3CVykrmGsEZBu5qdqjSmtElRKQxat9FbOP/NKZsD1BG+TSk4in1TBCLy9K8uNEo4pyO0IKPNree/TEE8k33cqKiOpYwk3AEDNoqof5c2KjeLMZuqZ8PlBGD6J/lA0lYkIim64Mw=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=Lg42JcAukHQ8iAveVz5DalweO0LF5sTRtDq7rYcWLEc=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794392952987100.75485625514011;
	Wed, 11 Nov 2026 02:29:12 -0800 (PST)
Message-ID: <9b5f5fc4-5fa8-411c-98fd-8655f208e00e@collabora.com>
Date: Wed, 11 Nov 2026 11:29:07 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/9] dt-bindings: phy: Add PHY_DIRECTION_TX/RX
 definitions
To: Jason Yang <jason98166@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Guochun Huang <hero.huang@rock-chips.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20261110-dcphy-rx-v1-v6-0-d681ba20b36a@gmail.com>
 <20261110-dcphy-rx-v1-v6-1-d681ba20b36a@gmail.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20261110-dcphy-rx-v1-v6-1-d681ba20b36a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_022924_327549_9BF2F376 
X-CRM114-Status: GOOD (  15.63  )
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
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Jason,

Thanks for the patch.

On 11/10/26 09:18, Jason Yang wrote:
> A MIPI D-PHY or C-PHY can be a transmitter or a receiver. Some PHY
> blocks have one of each and can use them at the same time, so one PHY
> node offers two PHYs. The existing cell, PHY_TYPE_DPHY or
> PHY_TYPE_CPHY, selects the mode of the whole block, not one of the two
> PHYs.
> 
> Add PHY_DIRECTION_TX and PHY_DIRECTION_RX for a cell that selects the
> transmitter or the receiver. The first user is the Rockchip RK3588 MIPI
> DC-PHY, where the transmitter serves a DSI host and the receiver a CSI-2
> host.
> 
> Suggested-by: Michael Riesch <michael.riesch@collabora.com>
> Link: https://lore.kernel.org/r/7425ac83-f6d8-4443-a26e-a47f9306aa24@collabora.com
> Signed-off-by: Jason Yang <jason98166@gmail.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Michael Riesch <michael.riesch@collabora.com>

Best regards,
Michael

> ---
>  include/dt-bindings/phy/phy.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/include/dt-bindings/phy/phy.h b/include/dt-bindings/phy/phy.h
> index 979b5dfd8353..9ead74d9a172 100644
> --- a/include/dt-bindings/phy/phy.h
> +++ b/include/dt-bindings/phy/phy.h
> @@ -29,4 +29,7 @@
>  #define PHY_POL_INVERT		1
>  #define PHY_POL_AUTO		2
>  
> +#define PHY_DIRECTION_TX	0
> +#define PHY_DIRECTION_RX	1
> +
>  #endif /* _DT_BINDINGS_PHY */
> 


