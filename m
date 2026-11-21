Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B28606A6B1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 00:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4AVQ9Pe7;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C0ixMRsY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=zVV1u4mdfEa+71QVfExLmY3W/TNv8r1nhMoxrEj/45c=; b=4AVQ9Pe76zEPbz
	g2IWUYlfyl1l0zuHT6jRQLyuY5qTOrJOrTDEBLJiAytkuxM6mfAOyFJhWSp65pwe75xRxy/JZN1nk
	ujY9eW67Liu0sJVv7nbSpI+RHneE/DyvFsAL7MqK7ROBCmXolEpqmKShJRqj3CTiBsgIyFzHrfEqd
	SuBsDwLNbzv4nWFd5rjRPFQkJEtaNJ2M5DvFcBd0gHjeGbR1kgHZc59iEc0oX8/2CKZnP1WC5fGRs
	pwgw9ofqEwrM0hxdkxYRn5t/7tA+4sMsDLeUdcTLnzrg8KCqU1LQujIrzQO202JZGKhpkPKJ6PUc3
	KuC3OdRvUK4frLlGVzIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUZEz-0000000GXyO-1nSt;
	Sat, 21 Nov 2026 00:46:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUZEx-0000000GXy6-2Lar
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 00:46:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EA70744D9B;
	Sat, 21 Nov 2026 00:46:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47BB21F000CA;
	Sat, 21 Nov 2026 00:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795221962;
	bh=zVV1u4mdfEa+71QVfExLmY3W/TNv8r1nhMoxrEj/45c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=C0ixMRsYmnQsvPxUOAJUL4CWc1ZORHAvtzr/1U69M+NLovwI/CFQQmDX7n0kM1keU
	 4AuWYXo432kd1UVvyoSaoELIWovQhrPuKAaKLEdkdTWlUlR/rmSDWC/WtysIlZlaMo
	 a7HYIoitwMoissaeVXVkgRZ8acd7Syl5+r6Q5gTbBYSqRxH+wlpKZIVrFA+PSUXnhd
	 9I2Dg+Ucl56KR4vNBkuIapcJ7TSdeJnNFvAdLu5oTiXvBakHaCLZhBt9cWNN0LfD24
	 25vGglILK5tuHoz4Lzpy07VzdQP4Xad1HgBUx5NI5VXGIm0+3PFm/taQgHNsWb0ole
	 bLbkOO+a/fzDQ==
Date: Fri, 20 Nov 2026 16:46:01 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
 <horms@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, Russell King
 <linux@armlinux.org.uk>, Lorenzo Bianconi
 <lorenzo.bianconi@oss.qualcomm.com>, Nicolai Buchwitz <nb@tipi-net.de>,
 Ovidiu Panait <ovidiu.panait.rb@renesas.com>, Joseph Steel
 <recv.jo@gmail.com>, Muhammad Nazim Amirul Nazle Asmade
 <muhammad.nazim.amirul.nazle.asmade@altera.com>,
 thomas.petazzoni@bootlin.com, Alexis =?UTF-8?B?TG90aG9yw6k=?=
 <alexis.lothore@bootlin.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next] net: stmmac: xgmac: Report the VLAN tag type
 from the descriptor
Message-ID: <20261120164601.07f932cd@kernel.org>
In-Reply-To: <20261118162136.2782405-1-maxime.chevallier@bootlin.com>
References: <20261118162136.2782405-1-maxime.chevallier@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 18 Nov 2026 17:21:34 +0100 Maxime Chevallier wrote:
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c
> @@ -209,8 +209,12 @@ static void vlan_rx_hw(struct mac_device_info *hw,
>  {
>  	if (hw->desc->get_rx_vlan_valid(rx_desc)) {
>  		u16 vid = hw->desc->get_rx_vlan_tci(rx_desc);
> +		u16 proto = ETH_P_8021Q;
>  
> -		__vlan_hwaccel_put_tag(skb, htons(ETH_P_8021Q), vid);
> +		if (hw->desc->get_rx_vlan_proto)
> +			proto = hw->desc->get_rx_vlan_proto(rx_desc);
> +
> +		__vlan_hwaccel_put_tag(skb, htons(proto), vid);

Heh, this function now does 3 indirect calls to get the info about 
the stripped vlan. Isn't this slower than disabling the offload and
stripping in SW at this point? Maybe the low-end CPUs are very
different :) Or there's something else I'm missing?

(not really expecting you to do any digging, to be clear, just found
the level of complexity in SW to support a trivial HW offload kinda
funny)

