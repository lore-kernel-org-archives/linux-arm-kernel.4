Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A99606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 19:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AoeZeVWx;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=W0QWdRuz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=dbGXM1I9Jh83hjJSiKGDRAEmUJNnFhvU9Kb1A5Z3ub8=; b=AoeZeVWxR4LhGg
	JEM/7A09sBVhw6H0aV5w3Jcl9ZhPvpW/AIXXOUHtThWb6zjBIMJlMvk3gDwfFHtiIpEOEq1x7MMcq
	Wi+VrDWnM6pWXd/hl0K3Ni4V03sFkAWqHULfBGGmpNEFmT6YDjHFtgnTO52I03ZvAQk6bKPx78Bxv
	tChvQEFugQc1nwg5SOixSy1Lm8NmtSwZ4GZj+/e6Tfbbxc9HBnPgpPWstI/PslKgJi8vegJwT3OGI
	omzhMa9BlQdGB+CutOOTKrb1Ep8m1s+EnpTx/NJkSLD9eS0UQ0tJCZIwGI8XCz14UB6ASQ0xIW3H6
	VQdI4raHzqmMgTvA3VqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVDVv-00000001fYv-28MZ;
	Sun, 22 Nov 2026 19:46:15 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVDVr-00000001fYV-2rkG
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 19:46:14 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B0E63C69140;
	Sun, 22 Nov 2026 19:46:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C804660512;
	Sun, 22 Nov 2026 19:46:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8D16411E6033E;
	Sun, 22 Nov 2026 20:45:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795376765; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=dbGXM1I9Jh83hjJSiKGDRAEmUJNnFhvU9Kb1A5Z3ub8=;
	b=W0QWdRuzMqLYXnJk4odzdLYtZXZMIYtQYMT8IB7ANLCF8YMMTiCNE0IPROF+gKZ70cEG4k
	LroyuHKdGOnJfOQsjOnHbeOH8d4V1ynY9uiW0G5q1sSQCz5un+v8sXg+3OaviQuacPA34d
	PrT7yCOYJ/uYoSxmBVvu3UUbV0vNlVtZbyekIUzxcJrRsPN//WHz3OKjK3ZKsuqFCWPzzG
	3kN5bcJZi1xEdWUvTD9Gf4zzyDNq8wXU2qsHXOCwyCPvgTBbcFIUsc9xoQmEUjX4va3MeU
	qS4ialWhY1rtVmFR9sdwvGf4abv2UckG+1S4KdJnDLuszg9EvrF1W9oC6iiaLw==
Message-ID: <9997f4e9-9453-4511-af3e-4be664a09281@bootlin.com>
Date: Sun, 22 Nov 2026 20:45:47 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v12 1/4] net: xdp: add
 __xdp_build_skb_from_buff() helper
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
 Stanislav Fomichev <sdf@fomichev.me>, Jose Abreu <Jose.Abreu@synopsys.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>, Simon Horman <horms@kernel.org>,
 Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
 Emil Tsalapatis <emil@etsalapatis.com>,
 Ihor Solodrai <ihor.solodrai@linux.dev>, peilinhe2020@163.com,
 Peilin He <he.peilin@zte.com.cn>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 bpf@vger.kernel.org
References: <20261121-stmmac-rx-mb-v12-0-3ae2f3bce174@oss.qualcomm.com>
 <20261121-stmmac-rx-mb-v12-1-3ae2f3bce174@oss.qualcomm.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20261121-stmmac-rx-mb-v12-1-3ae2f3bce174@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_114611_898890_98E86FFA 
X-CRM114-Status: GOOD (  14.19  )
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Lorenzo,

On 11/21/26 18:28, Lorenzo Bianconi wrote:
> xdp_build_skb_from_buff() always calls eth_type_trans() on the skb it
> builds, which pulls the Ethernet header and advances skb->data. Drivers
> that still need to process the L2 header before protocol parsing
> therefore cannot use the helper.
> 
> stmmac is such a driver: its software VLAN path (stmmac_rx_vlan()) reads
> the VLAN tag at skb->data and shifts the MAC addresses over it, so it has
> to run before eth_type_trans().
> 
> Split the implementation into __xdp_build_skb_from_buff(), which builds
> the skb (including the recycle mark, the Rx queue index and the frags
> info) but leaves skb->dev, skb->protocol, skb->pkt_type and the mac
> header unset, so the caller must initialize them, usually by calling
> eth_type_trans(). Make xdp_build_skb_from_buff() a static inline wrapper
> that still calls eth_type_trans() as before, preserving the behavior of
> existing in-tree users. A follow-up patch will let stmmac use it.

I've been questionning why we even do that in stmmac in the first place
actually. This pretends to offload, but it's just to deal with the tag
in the driver instead of later down the road.

The original idea was for GRO back when it didn't handle vlan tags, but
this isn't necessary anymore.

There was a series in-flight to remove stmmac_rx_vlan altogether, but it
seems to have stalled [1]:

[1]: https://lore.kernel.org/all/20260914150612.9798-3-peilinhe2020@163.com/

Peilin He, do you have any plans to continue this ? If not, it may be good
to pick this up instead of working around this.

Maxime


