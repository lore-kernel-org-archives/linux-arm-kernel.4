Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094BD606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 19:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tkXFcIKK;
	dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=rEM2Jbmk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=h5MusH8IV9Na7fO3T7L7n/MZBiLsXQrVcpOP8ORgtoc=; b=tkXFcIKKg0WEF1
	FObkUORKnCx3ncAT/WxCYr/vRWTCwR0o59S69JCXcHDBCKhPLHAfwRoqrua/KNiMuewqnclNYtdXt
	0QesMQqC0oiNYNDDpVVnvBLU5XJ28ictozBR8tUgahgKm49Mj1eh7t/mCzMDZfZxihdKEwHYxNHNk
	lVRuLTGW9oGUba2Y8UawBhBvZZsDfIwiucfM34BjcWmkbzKzom4Q9R/TczjB0+KytN50xjFWTIrGT
	c2jkDQZb7bDd7Lu7EYMTeqpZ6ZKVOAP0F+kDCEO5k9Laxgs77smEuk4DTtfB3sMCxNGy9n305FJcC
	20xJ9HrL/SdfH4c7x7PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVD8U-00000001dEH-1CEX;
	Sun, 22 Nov 2026 19:22:02 +0000
Received: from mail.tipi-net.de ([2a03:4000:43:185::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVD8R-00000001dDA-0YeU
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 19:22:01 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A7CC2A157F;
	Sun, 22 Nov 2026 20:21:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1795375314; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=h5MusH8IV9Na7fO3T7L7n/MZBiLsXQrVcpOP8ORgtoc=;
	b=rEM2JbmkBa5fn4Vr1bG3w+4KkTPOAyz4FjLeNzEe61DQJc+Etd7NYYpXSy2cZPxq62ikrp
	0htLJW1yFWzYssVcDR8hRqht9XJdgfvfhU1+W5bXxbGuAUgirDLsELaS0hHJiU+Od3mxlk
	RFyL3goVG+an5Y6mklDhT4zVnsftanFz3bNj9Roc5HTGF4c5E3uumqmfxsWGLrklI0Fdci
	Xe2NPEkIZv4MM2IXFaYcY8xm6h7zloBkAxWdfCtt/ciFwfqjeVDmKlas2yf6JaQpzaP+b3
	5OC8zYeZqPYllx+O5TMe9S4sfqUXzzdxsvCzf9hQmlWKT1OKiw6WdSBayo0J9A==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sun, 22 Nov 2026 20:21:49 +0100
From: Nicolai Buchwitz <nb@tipi-net.de>
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Jesper Dangaard Brouer
 <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, Stanislav
 Fomichev <sdf@fomichev.me>, Jose Abreu <Jose.Abreu@synopsys.com>, Ong Boon
 Leong <boon.leong.ong@intel.com>, Simon Horman <horms@kernel.org>, Andrii
 Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, Kumar
 Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau
 <martin.lau@linux.dev>, Song Liu <song@kernel.org>, Yonghong Song
 <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, Emil Tsalapatis
 <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 bpf@vger.kernel.org
Subject: Re: [PATCH net-next v12 1/4] net: xdp: add
 __xdp_build_skb_from_buff() helper
In-Reply-To: <20261121-stmmac-rx-mb-v12-1-3ae2f3bce174@oss.qualcomm.com>
References: <20261121-stmmac-rx-mb-v12-0-3ae2f3bce174@oss.qualcomm.com>
 <20261121-stmmac-rx-mb-v12-1-3ae2f3bce174@oss.qualcomm.com>
Message-ID: <c25a973e6efd6f626bb65d4f2500559b@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_112159_642484_64618B92 
X-CRM114-Status: GOOD (  10.56  )
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

On 21.11.2026 18:28, Lorenzo Bianconi wrote:
> xdp_build_skb_from_buff() always calls eth_type_trans() on the skb it
> builds, which pulls the Ethernet header and advances skb->data. Drivers
> that still need to process the L2 header before protocol parsing
> therefore cannot use the helper.
> 
> stmmac is such a driver: its software VLAN path (stmmac_rx_vlan()) 
> reads
> the VLAN tag at skb->data and shifts the MAC addresses over it, so it 
> has
> to run before eth_type_trans().
> 
> Split the implementation into __xdp_build_skb_from_buff(), which builds
> the skb (including the recycle mark, the Rx queue index and the frags
> info) but leaves skb->dev, skb->protocol, skb->pkt_type and the mac
> header unset, so the caller must initialize them, usually by calling
> eth_type_trans(). Make xdp_build_skb_from_buff() a static inline 
> wrapper
> that still calls eth_type_trans() as before, preserving the behavior of
> existing in-tree users. A follow-up patch will let stmmac use it.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
> ---

> [...]

Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>

