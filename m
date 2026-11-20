Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19266606A325
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 05:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QlnZjL8F;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=sKxHoD/w
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=WEAQeDdttdbQETJGcnx9VoAq4ig2AwjGPCEda+gTOGQ=; b=QlnZjL8FKht63A
	sX8ZNxa92caPOXOlcrwjAzq/hRDmFX9Q5dKHuK6l/GTUgqkQBUUY8BwhRvyhCEOMHZIVrZybhty9v
	mE9G8NUIMDhgJZ8y0f2nTdneuTlMDPrr6LA2qxveeQNRdHoLrOTEi5YWNzARPtzmgXR5kcAPyKehe
	066BAFxsXpkzVN8t5T0Rq8Hs2onS9Xins0mZ9wdrCw5iBHQyZkwDllo87JCw+zM4cSew6UChDWago
	OHSIrJrg6wTwAnPyhEWJy5De3PDfpxwUKk8ahiEoNP8k+ZaekPvnF5rPVzbd9tTmUi66O9G5SsgSD
	pTgM8x3CmWSw1F8PpCEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUHAj-0000000E49i-0Glm;
	Fri, 20 Nov 2026 05:28:29 +0000
Received: from mout-p-201.mailbox.org ([2001:67c:2050:0:465::201])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUHAe-0000000E48h-1BXT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 05:28:25 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4jW3lQ0xNpzMlPN;
	Fri, 20 Nov 2026 06:28:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1795152498;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WEAQeDdttdbQETJGcnx9VoAq4ig2AwjGPCEda+gTOGQ=;
	b=sKxHoD/wkyhiKEJN2+3QmTb0qDvBrxW1HdvWzxofGKDRkx7niuPPgNjcczay04H6pg1lzo
	ol9cvS8Kbpl/5Pemf35AL9pgP29UzvKg4ll2tlOTTybkIP3vHuMSfgUPgzLb5AgVEg56SH
	7MtPaGCBEYLDbYk8Z5zBj1+oCNmU1sj09Zp3Eayom7UOsMdGmicEGxtCQWec4J++I3o1x9
	b+26X8fsDrfZ4QtYzawBYvHCbh4qwLwhxGOYXr57IMxStv/ap1R75vWahfo9RUq5DIsdWq
	x0QI8vk/9D6rS17cwmtPlSswW6cexjLm8mKetoqw7wz+5eMCm4MCetOwRg311w==
Message-ID: <57d2cc58-15ac-434e-ab40-7a8a54d93a1f@mailbox.org>
Date: Fri, 20 Nov 2026 03:57:12 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/15] clk: renesas: r8a78000: Merge debug prints in
 r8a78000_clk_get()
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Ulf Hansson <ulfh@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Kevin Hilman <khilman@baylibre.com>, Vinod Koul <vkoul@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Paul Elder <paul.elder+renesas@ideasonboard.com>,
 =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>,
 Sudeep Holla <sudeep.holla@kernel.org>,
 Cristian Marussi <cristian.marussi@arm.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <cover.1795029012.git.geert+renesas@glider.be>
 <cee843b319c9eceba2339f14a134e305a2b05d7e.1795029012.git.geert+renesas@glider.be>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <cee843b319c9eceba2339f14a134e305a2b05d7e.1795029012.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: p1aubxpjti7wzrrdeoih94dcd5ndsxbz
X-MBO-RS-ID: b4229e44a0cdd305af8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_212824_471626_EBBCC9C8 
X-CRM114-Status: UNSURE (   8.71  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.8 (--)
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

On 11/18/26 8:44 PM, Geert Uytterhoeven wrote:
> The two debug prints in r8a78000_clk_get() are very similar.
> Merge them into a single debug print.
> 
> While at it, unwrap the (wrongly-indented) continuation of the
> r8a78000_clk_get() function header, as it fits on a single line.

It might be worth mentioning, that this now also uses 
clk_hw_get_name(hw) instead of map->fw_id .

[...]

> -	dev_dbg(dev, "Mapping DT clock %u to fixed clock %u\n", id, map->fw_id);
> -
>   	hw = priv->fixed_hws[map->fw_id];
>   
> -	dev_dbg(dev, "clock %u is %s at %lu Hz\n", id, clk_hw_get_name(hw),
> -		clk_hw_get_rate(hw));
> +	dev_dbg(dev, "Mapping DT clock %u to %s at %lu Hz\n", id,
> +		clk_hw_get_name(hw), clk_hw_get_rate(hw));
[...]

