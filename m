Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD91606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 15:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yzXdMuvq;
	dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=4lEXrQEZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=2ZV8cdqFBGoUVN0JXYMIHWaqsQ8elfBEyab0KgL/LQQ=; b=yzXdMuvqdnZan/
	fXBrdcUr81ao7l4tze/Z5XwG9duwwCInUrz/WewmGpEZ0qf/wF2iz6HTTXFKLB/BrBtagBQy9M7qc
	BfFNVPg7z2yZlg8mrxam331E/9rJGsWzuMCSbIa4HH9MJwuHIrrXj1YBfEOhMVR9o+tAieEBqvn/v
	gYA+x48pQHsZ6Rw/MypwFHOciTqicDxRdqEr/Rmrv0U+ssoEP/KDS3wyeOTbE5RVf9/DVegwsKHJt
	rsoHDr62bigN+kjgbZLHdN0IRjHv3YVlYuyksqer2oDO9FpWm+wnojYAbxX71bWNch6cdn8QkOSW6
	dpw602ZSpOIkz2jz7Ijw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV9xx-00000001JJy-1Mkb;
	Sun, 22 Nov 2026 15:58:57 +0000
Received: from mail.tipi-net.de ([2a03:4000:43:185::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV9xv-00000001JJe-0Hwj
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 15:58:56 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EDCFCA157F;
	Sun, 22 Nov 2026 16:58:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1795363132; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=2ZV8cdqFBGoUVN0JXYMIHWaqsQ8elfBEyab0KgL/LQQ=;
	b=4lEXrQEZxrDyggcU/gr8xHKxGVKEtBXm1KE0CHNAsZYYAe/yR2fdv4/KxoE4PJ68qCUiXm
	Wa4EG6gQKhKJxwyZpZ+QoUnOXHVAW5F4vWj9bWStOh5lJuEDkbrlanXdwtymvXf3L+6GRr
	Kf4MwsZ8vOOOmiQkMfXojWszdw+UsV+U/Mc0AgrZ3uRwtGRkVLkL7puxG/UNUx41R8b2rI
	g91ycEdcDiwywkh6YNgR4TZ+dDWT3p8nSyoOd9gkKqEUm6qiJOU1DgrAm/EEef4I3Ixjt+
	JLvv77ElSVKk5bOkN/lhdekg+MCORQ37dldz4EF0vA43W0RYLrPh57DD6y92oA==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sun, 22 Nov 2026 16:58:50 +0100
From: Nicolai Buchwitz <nb@tipi-net.de>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Willem de Bruijn
 <willemb@google.com>, Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Russell King <linux@armlinux.org.uk>,
 Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
 thomas.petazzoni@bootlin.com, =?UTF-8?Q?Alexis_Lothor=C3=A9?=
 <alexis.lothore@bootlin.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH net-next 3/3] net: stmmac: dwmac-sun8i: configure the
 pause time for TX flow control
In-Reply-To: <20261122144926.284857-4-maxime.chevallier@bootlin.com>
References: <20261122144926.284857-1-maxime.chevallier@bootlin.com>
 <20261122144926.284857-4-maxime.chevallier@bootlin.com>
Message-ID: <19a0e0afd9e05731bbba69b6d765bfe4@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_075855_262713_9D07953D 
X-CRM114-Status: UNSURE (   7.40  )
X-CRM114-Notice: Please train this message.
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

On 22.11.2026 15:49, Maxime Chevallier wrote:
> When sending pause frames for flow control, we need to indicate the
> number of quantums the peer should wait before sending more frames.
> 
> This is maintained in stmmac's "pause_time" global variable (it's a
> module param).
> 
> Let's program the pause time value, and also allow sending the
> zero-quanta pause frame when the peer can resume sending traffic.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

> [...]

Reviewed-by: Nicolai Buchwitz <nbb@tipi-net.de>

Thanks,
Nicolai

