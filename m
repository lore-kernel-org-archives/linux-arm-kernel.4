Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568C7606A325
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 07:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FpjEh91g;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=EMYJABtc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=302YmlBFcT29dtVYS2/IlQouy87kyb7NzSlXmbT4De8=; b=FpjEh91g1ewsAq
	VuRtowY9KWeXEddjrvRlYyIDIyTb+sBjQ5TkpOtZiHP4yYG9F8KLuhBv9+wmcakoE4TFId4LFJ+GS
	IejqnPUsY4B0tWEwx5PQ2nWkVDs0X/1Q42QUdYsIaFks3dRIyQCt6v9x9PTLKl8CjZ4BTmPshyjYd
	0O2Y8vQ2h0QXdo0+aHCX/DZrQIENetZxALWeSg9lI3VWnR28ZzDbkQ8xcA0cRnNnRuPe42ygIUuIz
	pXjT7xVxJAZeiwVl+u7GlN4ZomNbhntcOEdqchKrIX//KNJn2dHUN64ebnfSoVlSfa6vQCUI6pF18
	EMsozrNya5vTiXkcJXGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUfoN-0000000GtFq-20dp;
	Sat, 21 Nov 2026 07:47:03 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUfoK-0000000GtFT-0uYt
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 07:47:02 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B0747C62229;
	Sat, 21 Nov 2026 07:47:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7CCE6603CF;
	Sat, 21 Nov 2026 07:46:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8399111BC0212;
	Sat, 21 Nov 2026 08:46:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795247214; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=302YmlBFcT29dtVYS2/IlQouy87kyb7NzSlXmbT4De8=;
	b=EMYJABtcdwh7iR3ROahPEAfI2aRH8ZKlnmBfiOaPOG1AhXQh2wPY+9Sat+HSryWbKRFuss
	lTfyMt5KRK+JRvn6VqnXj9j+JN3uetiwf1kfJBCmBdvIp6pMzpjBGTQn277rWd3371l/i/
	sRmPQynRg9P3vFlyAsYjkAhVet6wJXlSLfiBAAx8NzYsDyb94O7+3vCwZXQTRo9XltWwiT
	LShhvjid8ven666kDthXKVfjvDPkD2qPy1lCKwxD1uqDFyqENpu7lBJXR8QaglASPCYAVe
	R+vzBSU6/lVk9gNZqi9uJwfYim2GJbqxv/U+auoLzif0Ue4iZE1mTBDUav/G3w==
Message-ID: <2625b2b6-53f5-4c4b-b45f-fae0d7e781c7@bootlin.com>
Date: Sat, 21 Nov 2026 08:46:37 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: stmmac: xgmac: Report the VLAN tag type
 from the descriptor
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Russell King <linux@armlinux.org.uk>,
 Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
 Nicolai Buchwitz <nb@tipi-net.de>,
 Ovidiu Panait <ovidiu.panait.rb@renesas.com>,
 Joseph Steel <recv.jo@gmail.com>,
 Muhammad Nazim Amirul Nazle Asmade
 <muhammad.nazim.amirul.nazle.asmade@altera.com>,
 thomas.petazzoni@bootlin.com, =?UTF-8?Q?Alexis_Lothor=C3=A9?=
 <alexis.lothore@bootlin.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20261118162136.2782405-1-maxime.chevallier@bootlin.com>
 <20261120164601.07f932cd@kernel.org>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20261120164601.07f932cd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_234700_430155_5DE71686 
X-CRM114-Status: GOOD (  10.47  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/21/26 01:46, Jakub Kicinski wrote:
> On Wed, 18 Nov 2026 17:21:34 +0100 Maxime Chevallier wrote:
>> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c
>> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c
>> @@ -209,8 +209,12 @@ static void vlan_rx_hw(struct mac_device_info *hw,
>>  {
>>  	if (hw->desc->get_rx_vlan_valid(rx_desc)) {
>>  		u16 vid = hw->desc->get_rx_vlan_tci(rx_desc);
>> +		u16 proto = ETH_P_8021Q;
>>  
>> -		__vlan_hwaccel_put_tag(skb, htons(ETH_P_8021Q), vid);
>> +		if (hw->desc->get_rx_vlan_proto)
>> +			proto = hw->desc->get_rx_vlan_proto(rx_desc);
>> +
>> +		__vlan_hwaccel_put_tag(skb, htons(proto), vid);
> 
> Heh, this function now does 3 indirect calls to get the info about 
> the stripped vlan. Isn't this slower than disabling the offload and
> stripping in SW at this point? Maybe the low-end CPUs are very
> different :) Or there's something else I'm missing?

We'll do like the rest of the driver and hide these indirections with
a nasty macro :)

(jk, but TBH I can't test that one at more than 1Gbps, it's very likely
there's ton of room for optimisation...)

Maxime


