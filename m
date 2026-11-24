Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6236E606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 09:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=N7Yrp+K4;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=C+JbvLTx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=OUngm4girPZ/UgXDY4tToZ5+MVYoWJUTU2VlTrOevjQ=; b=N7Yrp+K4ihfpEi
	3jASZtb30282a2eL3FlNSXhA9qo3rmsxlVdScfSm428cjigdd1WGHZNYPZxj87m6r1xGeZTikUNUS
	vfDE0bviXnMAq3oHj/sgHtpO+mkZnJMClrsChKmxcAONP/mKNkkZo2BUI41FXaAKTdmQC6hUkWalh
	fgKAm67uUsUpXTnxPdO1jW3yXAjbmlLvptLIet3VpG0twHSfPPwQ0FIGTViS3CwZmf6tCo+XgxYfG
	rs78Mr744NDSwD7PkRiNEGgnVT8cnO6RNs5rdA4g1lKmClxb7TZf3/0okPiyHbds+Iqxb3+bzJpvh
	l6MsnclnW0PC4tcRBz4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVmbn-0000000621P-1x3V;
	Tue, 24 Nov 2026 09:14:39 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVmbj-0000000620n-1t97
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 09:14:37 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 668B7C4CBEA;
	Tue, 24 Nov 2026 09:14:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 085D3601E1;
	Tue, 24 Nov 2026 09:14:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1FC9111E68DFE;
	Tue, 24 Nov 2026 10:14:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795511671; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=OUngm4girPZ/UgXDY4tToZ5+MVYoWJUTU2VlTrOevjQ=;
	b=C+JbvLTxACFgmMXVP5wvlu1mwmVIZQveH3j3i0LGBpo78jGydRRVv3Hmp9utJB7uXLQ+s2
	Qgc5XZZ5u4jbrc0G5lH6mvUGyLCWErr9KbVrLnD/rFathee8+APWG7fT/gWcoOAtKt4pEi
	FML1o06sWvxWlFeUgrvifnT+nWxVxZ2DsliSkVbaKQNQUe7VomPqbvjei8feQ37mEkrslC
	Vq4FDCp2vHaWKuAHDHa2+/LubEr0dc7UHiWE9BOsuuihGpxseeqihOXgLJVrRPOZygT24e
	aXmUyEfacOCvvtChysMgxDNGTI4uFRujoUZ73JU+QXBSQdp9cRgCFYPzhftReA==
Message-ID: <cc3580f8-9a45-487f-ac86-84e0f1c3e8b4@bootlin.com>
Date: Tue, 24 Nov 2026 10:14:13 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v12 1/4] net: xdp: add
 __xdp_build_skb_from_buff() helper
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
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
 Peilin He <he.peilin@zte.com.cn>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org
References: <20261121-stmmac-rx-mb-v12-0-3ae2f3bce174@oss.qualcomm.com>
 <20261121-stmmac-rx-mb-v12-1-3ae2f3bce174@oss.qualcomm.com>
 <9997f4e9-9453-4511-af3e-4be664a09281@bootlin.com>
 <awVTNSYCD-_5gE4D@lore-desk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <awVTNSYCD-_5gE4D@lore-desk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_011435_762592_8318803A 
X-CRM114-Status: GOOD (  14.59  )
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

Hi,

On 11/24/26 10:04, Lorenzo Bianconi wrote:
>> Hi Lorenzo,
>>
>> On 11/21/26 18:28, Lorenzo Bianconi wrote:
>>> xdp_build_skb_from_buff() always calls eth_type_trans() on the skb it
>>> builds, which pulls the Ethernet header and advances skb->data. Drivers
>>> that still need to process the L2 header before protocol parsing
>>> therefore cannot use the helper.
>>>
>>> stmmac is such a driver: its software VLAN path (stmmac_rx_vlan()) reads
>>> the VLAN tag at skb->data and shifts the MAC addresses over it, so it has
>>> to run before eth_type_trans().
>>>
>>> Split the implementation into __xdp_build_skb_from_buff(), which builds
>>> the skb (including the recycle mark, the Rx queue index and the frags
>>> info) but leaves skb->dev, skb->protocol, skb->pkt_type and the mac
>>> header unset, so the caller must initialize them, usually by calling
>>> eth_type_trans(). Make xdp_build_skb_from_buff() a static inline wrapper
>>> that still calls eth_type_trans() as before, preserving the behavior of
>>> existing in-tree users. A follow-up patch will let stmmac use it.
>>
>> I've been questionning why we even do that in stmmac in the first place
>> actually. This pretends to offload, but it's just to deal with the tag
>> in the driver instead of later down the road.
>>
>> The original idea was for GRO back when it didn't handle vlan tags, but
>> this isn't necessary anymore.
>>
>> There was a series in-flight to remove stmmac_rx_vlan altogether, but it
>> seems to have stalled [1]:
>>
>> [1]: https://lore.kernel.org/all/20260914150612.9798-3-peilinhe2020@163.com/
>>
>> Peilin He, do you have any plans to continue this ? If not, it may be good
>> to pick this up instead of working around this.
> 
> I am fine to rebase my series on top of that one or pick the required patch.

There's been no activity on this since september, I think you can pick this
one up and have Peilin He in CC + Author then, your multi-buff XDP has been
going on for long enough, let's not block it further.

Maxime


