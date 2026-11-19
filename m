Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45AA606A325
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 07:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Oqbfbcnc;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=fsCZGmzt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Xz9x+nu8iFDsD3oN41PdfcdXcq5+MFZLlOOhZlyWh6I=; b=Oqbfbcncwr5ahG
	K1ze3fxyLc5Zr/38jI5tDP97KQWrlH6+F7KEnXhr/klEQeHKneeF23PAhrE5cFRTHCB/hO5UB+JJr
	JomXLHwZzwvZzLDpXLAN1e8aArndfhozhuPBkOgJjx9rpjhwoD8vvOapB0GgkSs2c2sIUV03RK27x
	v27OEA2yJSQENjMfZulqTbnSjM1vyGvPjKj6Vkhv5jxn8QCkpJu19z51uJFJcYvf5itNodcI6aZvT
	U8bH3shc4lumN18e2ybG93Y+qI22TlgFkjlrBbn8TLS4dOVodVnpIamHGHtrLJdBNJ3A6iABwtCbj
	1xQkKJ+kaCVJkW9WXZzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTwhV-0000000B5MR-0QcX;
	Thu, 19 Nov 2026 07:36:57 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTwhP-0000000B5Lw-1buk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 07:36:55 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 62DD1C4CBEB;
	Thu, 19 Nov 2026 07:36:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1AF9C60237;
	Thu, 19 Nov 2026 07:36:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CAABA11BC2D6A;
	Thu, 19 Nov 2026 08:36:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795073803; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=Xz9x+nu8iFDsD3oN41PdfcdXcq5+MFZLlOOhZlyWh6I=;
	b=fsCZGmzt+fC0fzp4kR6Qre+ME9xwJCzkqh2RMfEnsYfUQKcvoDvE8tGbXLrlkh55jKY0wk
	5aSIs3r14a2766AwiOGXKd5X8Esp0S3LdhNw5H0O+KcHGY7t9NUxsm/9sU8eyuFiAK+0X/
	RSfYX2BTfMqT2n1Fx8aT0dE6hI2by+F8Ei3o1j5gNHWVByze0bPXtho48ya36PMQcmiuLV
	LkYm2qBpXPafvuJjzwLpwY7JciQMJlyDNALWWuSx2mUE/be/meyTvzvQ8Baj0LHGZYFp0f
	VBzZZRVNttSVa0sSGvlDUJZUm2vxcs2Jtr2wlPfKjGd8zBKSz0TW2hb0ciWArg==
Message-ID: <c811598d-28e9-4d9b-9929-b434878b90ff@bootlin.com>
Date: Thu, 19 Nov 2026 08:36:34 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: stmmac: xgmac: Report the VLAN tag type
 from the descriptor
To: Nicolai Buchwitz <nb@tipi-net.de>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Russell King <linux@armlinux.org.uk>,
 Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
 Ovidiu Panait <ovidiu.panait.rb@renesas.com>,
 Joseph Steel <recv.jo@gmail.com>,
 Muhammad Nazim Amirul Nazle Asmade
 <muhammad.nazim.amirul.nazle.asmade@altera.com>,
 thomas.petazzoni@bootlin.com, =?UTF-8?Q?Alexis_Lothor=C3=A9?=
 <alexis.lothore@bootlin.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20261118162136.2782405-1-maxime.chevallier@bootlin.com>
 <a2518e0794b8b9c79a97cb6c768dded6@tipi-net.de>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <a2518e0794b8b9c79a97cb6c768dded6@tipi-net.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_233651_586267_81973A37 
X-CRM114-Status: GOOD (  15.47  )
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

HI,

On 11/18/26 21:09, Nicolai Buchwitz wrote:
> Hi Maxime
> 
> On 18.11.2026 17:21, Maxime Chevallier wrote:
>> Stmmac's double VLAN handling hasn't been working great for a while,
>> it's been recently reworked for dwmac4 by Ovidiu Panait. In that work,
>> it was found that the tag stripping hardcodes the 8021Q tag type for
>> XGMAC while stripping the tag, while the IP actually reports the outer
>> tag type in the descriptor.
>>
>> The tag type can be one of 6 different values (note inner/outer is
>> reversed in the macro names):
>>
>>  - XGMAC_ET_LT_VLAN_STAG       single S-tag
>>  - XGMAC_ET_LT_VLAN_CTAG       single C-tag
>>  - XGMAC_ET_LT_DVLAN_CTAG_CTAG outer C-tag, inner C-tag
>>  - XGMAC_ET_LT_DVLAN_STAG_STAG outer S-tag, inner S-tag
>>  - XGMAC_ET_LT_DVLAN_CTAG_STAG outer S-tag, inner C-tag
>>  - XGMAC_ET_LT_DVLAN_STAG_CTAG outer C-tag, inner S-tag
>>
>> Report that tag type through a dedicated desc ops and report it to the
>> stack.
>>
>> We keep the 8021Q fallback when we don't have the ops, as we don't
>> set NETIF_F_HW_VLAN_STAG_FILTER on the cores that don't support that.
>>
>> This has been tested on AgileX5 with the vlan.py selftest.
>>
>> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> 
> Isn't this a fix too? I mean xgmac advertises STAG_RX but still
> reports S-tags as 802.1Q. Then again nobody seems to have hit it
> so far, so net-next is probably fine.

Yeah not only was this discovered while working on something else, it
seems no-one noticed and it's always been broken... I wanted to avoid
spamming net too much, both options are fine for me TBH,

Thanks for the review :)

Maxime

> 
> Anyway:
> 
> Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>
> 
> Thanks,
> Nicolai


