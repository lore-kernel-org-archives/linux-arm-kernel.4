Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0098606A329
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 12:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=I1JJUJsO;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=SVNFITyo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=35dBQPZTjjQf5af2xzTsWfDP7ddSRYEMw3k72A7SADA=; b=I1JJUJsOo+bSp/
	2lZwxStXL8vA7Vaep0arbkAmikIviu46EuV2Y7+7IpnuoYNgwIRBoo3104UzYaBRYLrKy50OSC0OD
	CFABwJ1XkNF3gNoJljK2SoBsD9/sB/j/sZdJgjdLFzrXyh6nIteD0NNZXQ7GIU+lB2UrKnxHQWZWx
	YW8ckpLXzRNRNvCrOu9OZSFAMxuE32FIvD1ww6J/9dbOspP1XLxHWyCwV1aQuuqA8thrlUmgZBKy8
	LLTzyoWts4xVCSKm4+dFpvJWeA21ugz5BbVDJ6BnlcvlvPzDkn1jKJvkKK6PyivaVLiCm6x1dbYSG
	q52NgtJlObQdZZ3zjdyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWCRY-00000009t9c-3izk;
	Wed, 25 Nov 2026 12:49:48 +0000
Received: from mout.web.de ([212.227.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWCRV-00000009t8P-24X4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 12:49:47 +0000
DKIM2-Signature: i=1; m=1; t=1795610982;
 mf=PE1hcmt1cy5FbGZyaW5nQHdlYi5kZT4=;
 rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
 d=web.de;
 s=s29768273:rsa-sha256:O6tXkqT2LbohAdp90Ue7S0FUeG6h
   MnfFgedwwlDGbjwRskgePpF+6sa+IV5JUHmc3/AUCoSRAP/+j1DfCYSBCnhogbv+ffs7qrb76AS
   mUdUWDcd0O/KC38Ip3QN8F0fRwI4/Exa7u+hF2Cp4o5X9GimZJNXYpoQM3b5gBtIDRdge2WHKTj
   py33MbU4Qd7vbW50ubtMvzEqBRyPXay5td9l92f/ttKhUep6k0yP0p6kGYTyYfwXsKQSzkSA7pe
   1L0m1USNkCMEvWFvgPHnFH+npUUqL43hnI2sT6D1IAWSQWFzVS6UOictSMcvxzD2nj83QyxlXy8
   zmaMnStqmVDQnQ==;
Message-Instance: m=1;
 h=sha256:
   3Y4acA60L8j/Ls37yZjw4+Dtxax4B+cBGgrJXjY8BEY=:
   oBYtqVPVTHPhFOIkyXy53wFgR2bgpbEGNGDqWza2bYU=,
  sha512:
   R7byuF72kdLF2D+qXMvu+W4gw2sRz+XvXltG/myLd6tZ1V+nc51ULR51tHXufflwQm1Nr+pKquYf9RUzL+PrvA==:
   Ws5R6L3kKvMZoNhdI26YBX3FU0GbaHB2cE3nTSRTKANY3eRpUFlgnSxM5TQO4Q6SRrVRcCkE4zDfUIgIrqHcuQ==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1795610903; x=1796215703; i=markus.elfring@web.de;
	bh=35dBQPZTjjQf5af2xzTsWfDP7ddSRYEMw3k72A7SADA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=SVNFITyo7+eT4Pqf27bobFyTc5pz+zuvJUpjo8EO1zFbZ7HDeHNuVOx8l4tk+lR0
	 ALcyEbm90uf0+XnuJa7ISJ3HYABcBY3F8MXaSrvQDG1T+gGQBCvEuxDkKQ7rTcbMW
	 1dak2e//QJo9QdT7XHiAzIMMtMWvrcOI8x3wbG6r8oXBwl08I5/tW4AOgDmY37R9X
	 O+iqoF4RILOV6QleAkHooEe5FerYx0j9mX5WXLRZKtexVNTgHmk0+CXRM+BNMdQq+
	 PBh/dmaCjCDvlG3ANPBnFEHg/nxd+lQsfq+n1aadOi1LcT0FYr24F2TMVhpoS7tyU
	 Jjeto6C8jxJ42qReXA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N1d7i-1yXodi3Duy-016K2F; Wed, 25
 Nov 2026 13:48:22 +0100
Message-ID: <ff7e007d-e4cb-40c5-935c-91a2f3ba0224@web.de>
Date: Wed, 25 Nov 2026 13:48:15 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: net: allwinner: Use devm_clk_get_enabled() in emac_probe()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, Arnd Bergmann <arnd@arndb.de>,
 bui duc phuc <phucduc.bui@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Frank Li <Frank.Li@nxp.com>, Hans de Goede <hdegoede@redhat.com>,
 Jakub Kicinski <kuba@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Joe Damato <joe@dama.to>, Julia Lawall <julia.lawall@inria.fr>,
 Li Youhong <liyouhong@kylinos.cn>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Paolo Abeni <pabeni@redhat.com>, Samuel Holland <samuel@sholland.org>,
 LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Christophe Jaillet <christophe.jaillet@wanadoo.fr>,
 Florian Fainelli <f.fainelli@gmail.com>
References: <780975ed-825f-4f9b-8ac2-67664a7a2a2f@web.de>
 <awXw07bDd0bX4Mas@ashevche-desk.local>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <awXw07bDd0bX4Mas@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:vY/qI4YW3Fw9IRs+81/TLreG3lX5UE5u1+4zPYZSPa7wODjXVmL
 eIIncbv8oah9amMqO0dHzz1B2EFo3rZO89VRstUz1Sf/EhurzqoafH0MKJYG/BPckHgENIM
 +pnBIr4OL5abL8jU3gpEPluU00vKVTkZWE7UpvYXokaF9ycfd5d3/2Qo3Tm/aofge3rmF8W
 MBaxEw0yvKL0mSgGqObLA==
UI-OutboundReport: notjunk:1;M01:P0:tCUAQyUIF8I=;QEyCNaArGIt90WFSbvqLe9CVP1q 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 L0f6n
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_044945_827474_965A0A87 
X-CRM114-Status: UNSURE (   7.43  )
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
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> This breaks the order at remove and probe error path cases.

Would the proposed control flow adjustment be different from a =E2=80=9Cbr=
eak=E2=80=9D?


> Note, devm_*() at this case will keep just a clk object, but
> the actual enabling is done explicitly.

https://elixir.bootlin.com/linux/v7.4-rc1/source/drivers/net/ethernet/allw=
inner/sun4i-emac.c#L960-L1082


>                                         W/o testing on real
> HW it's hard to say if this order is strict or not.
How will the support refined further also for collateral evolution togethe=
r with
devres programming interfaces?

Regards,
Markus

