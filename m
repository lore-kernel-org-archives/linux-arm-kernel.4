Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F411606A337
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 20:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=k57ky8l3;
	dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=0CcN+Uar
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=SFZF3FV6U5E27LOurOw4lsSFBznHDABG46zAUlEpe8Y=; b=k57ky8l3ja1alq
	T5YuqC1O9BXK5Mc+Tyd3Cihwjjmydoebec/yYDEPVdFaNbcYNKLpNobo4XpYXqtrdJUwcgNcL3Kb+
	NkbBlDDWitG232JghAxVDhFhioLVz2z7XJpGIGjMrEF0lrtpkyqv7OhoeHlDQnrOVouAWUeKhIfhX
	1THmMnXTs5xh3ilAFtoo/GioIpLauwmKA48TLc67cCm/S1BJMLPwMSuNYzAGob3RsrKt55DkqwCjW
	Ec8riMvZ7SbXv3hr+kgH+ZW3dj7CTnKa2VQSH+xHpQ5K8xHMxu7Zvw02Qvk3yebsoanndqrjPH7VF
	vB9q+Y/rbDySLBLDJtgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTlye-0000000ABlI-0Qrv;
	Wed, 18 Nov 2026 20:09:56 +0000
Received: from mail.tipi-net.de ([2a03:4000:43:185::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTlyb-0000000ABjN-2A4O
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 20:09:55 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 46EDCA157C;
	Wed, 18 Nov 2026 21:09:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1795032586; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=SFZF3FV6U5E27LOurOw4lsSFBznHDABG46zAUlEpe8Y=;
	b=0CcN+Uargp7HJHCMOUKhmKqUoKxXoZ2gTLtZzx0Gtov2ensxlbYz4glIyu/Ojv7dP1YtyJ
	rW3O+1GyU4EYKsdfjhfF7GoKqQfqFYxt1lFA8JxhAampOwutSxrDIiMpIgGJJFYt3LKH3F
	Er5rRLhlJuMZgsNCbNLzmWvZaMYMmPAVxUCgzfXmcQoXkUGlh7VZsi2uRTbgB3ZmuryKne
	XYOoFzt0WF0VeE3u90HP9W+Lo9rl+cXhL6SfNl6wV6ZKZfX+2IJArpNbr7epeqIYazAVC6
	tMqMp4z+sEyQvJKD26sg1NpNr5V0bAt1RudlnYknhf0j7/Q3kttwRjKLUFm7gQ==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Wed, 18 Nov 2026 21:09:42 +0100
From: Nicolai Buchwitz <nb@tipi-net.de>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Russell King <linux@armlinux.org.uk>,
 Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>, Ovidiu Panait
 <ovidiu.panait.rb@renesas.com>, Joseph Steel <recv.jo@gmail.com>, Muhammad
 Nazim Amirul Nazle Asmade <muhammad.nazim.amirul.nazle.asmade@altera.com>,
 thomas.petazzoni@bootlin.com, =?UTF-8?Q?Alexis_Lothor=C3=A9?=
 <alexis.lothore@bootlin.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next] net: stmmac: xgmac: Report the VLAN tag type
 from the descriptor
In-Reply-To: <20261118162136.2782405-1-maxime.chevallier@bootlin.com>
References: <20261118162136.2782405-1-maxime.chevallier@bootlin.com>
Message-ID: <a2518e0794b8b9c79a97cb6c768dded6@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_120953_720631_91F47AB7 
X-CRM114-Status: GOOD (  15.90  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Maxime

On 18.11.2026 17:21, Maxime Chevallier wrote:
> Stmmac's double VLAN handling hasn't been working great for a while,
> it's been recently reworked for dwmac4 by Ovidiu Panait. In that work,
> it was found that the tag stripping hardcodes the 8021Q tag type for
> XGMAC while stripping the tag, while the IP actually reports the outer
> tag type in the descriptor.
> 
> The tag type can be one of 6 different values (note inner/outer is
> reversed in the macro names):
> 
>  - XGMAC_ET_LT_VLAN_STAG       single S-tag
>  - XGMAC_ET_LT_VLAN_CTAG       single C-tag
>  - XGMAC_ET_LT_DVLAN_CTAG_CTAG outer C-tag, inner C-tag
>  - XGMAC_ET_LT_DVLAN_STAG_STAG outer S-tag, inner S-tag
>  - XGMAC_ET_LT_DVLAN_CTAG_STAG outer S-tag, inner C-tag
>  - XGMAC_ET_LT_DVLAN_STAG_CTAG outer C-tag, inner S-tag
> 
> Report that tag type through a dedicated desc ops and report it to the
> stack.
> 
> We keep the 8021Q fallback when we don't have the ops, as we don't
> set NETIF_F_HW_VLAN_STAG_FILTER on the cores that don't support that.
> 
> This has been tested on AgileX5 with the vlan.py selftest.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Isn't this a fix too? I mean xgmac advertises STAG_RX but still
reports S-tags as 802.1Q. Then again nobody seems to have hit it
so far, so net-next is probably fine.

Anyway:

Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>

Thanks,
Nicolai

