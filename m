Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF7B606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 05:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qO4SWSyr;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=M1BWvhDx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=QiRKkDBvuknePqASdttvShwCcaJPDVp0cuJzJKewu58=; b=qO4SWSyrSmwvw4
	qCZ4x+yDUbqDvLLvW/XljX0h21LGLCfk87ZXw8T1MFu8ncYW90hG8KIWgE+tRkgnY6HavQOpZaMDo
	KFRCpMzLoKTbdlXTHKq1DNlJXgZUFHWZAqrXlp9+567bmL2lxYoGPdQ8qh21SdsFJClSL6guW2ONe
	UtnJjrWXWnBKdXHSArvSRA46QaPy2nD+ZABmegw3XdU4iP2DVOczt9p41Etij4htIU4Jzd+YawQeh
	O+NqNs5ugEBvK1TXT3ZWFZg/D6PiVGH18Ln1AyQfi3S+OgQoQ8utbhP3UorVcgjT3o7m9s4mdXvkL
	zLrbYVdUeMq9IAjxLDIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUHB3-0000000E4EM-0mkF;
	Fri, 20 Nov 2026 05:28:49 +0000
Received: from mout-p-202.mailbox.org ([80.241.56.172])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUHAh-0000000E495-2dcy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 05:28:29 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4jW3lT0T85zMlw7;
	Fri, 20 Nov 2026 06:28:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1795152501;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QiRKkDBvuknePqASdttvShwCcaJPDVp0cuJzJKewu58=;
	b=M1BWvhDxOIWzM6JJYzNapCITSinXxXVsB7lQ+r3am82uefmqgGe/Txe447mz8kY2lMU39m
	A8opXjH65Wl/ngQubi6HkNa0+b3hpoHn3TNzh4K9X9+UksBDGrb8ubsQESmupsUIYolFyS
	lc+1pdo2H7PyD4XXXdfhHzImN/AjVqqlWoANYe5a5oOuRafbj/3CN8HXURgmgYWe5CbeuE
	3m8rHnJGRb4AwKagCmpypPyAz3PGq3PZhcs21quSO5+3axsQw2eEIZRyIOK57STwhi7ZbM
	g97M9GFw/xWhbiSqy0FeqzrvvkdT6ypp9VYW5ot6KIp6piD/xqxL8L7NmfCf/w==
Message-ID: <5eef011d-6854-449b-b966-492845b076da@mailbox.org>
Date: Fri, 20 Nov 2026 04:02:31 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/15] clk: renesas: r8a78000: Replace sentinel by
 explicit ID map size
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
 linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <cover.1795029012.git.geert+renesas@glider.be>
 <bf9d3d694fc06f29819b6883610c0e86c2d0066e.1795029012.git.geert+renesas@glider.be>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <bf9d3d694fc06f29819b6883610c0e86c2d0066e.1795029012.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: e39709493eb8c2445c5
X-MBO-RS-META: 3a5to1sqiyban871qj7neoimkfzs6ycg
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_212828_047182_08332F18 
X-CRM114-Status: GOOD (  13.50  )
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/18/26 8:44 PM, Geert Uytterhoeven wrote:
> The use of a sentinel in the clock ID mapping array will become
> cumbersome when the need arises to find out the actual number of
> elements in the array.  Rework the mapping data structure to fix this,
> also improving naming.  Add a CLK_ID_MAP() initialization macro for
> brevity.
> 
> While at it, drop the check for "!map" in clk_id_map_find(), as that
> pointer can never be NULL.
> 
> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

[...]

> -struct clk_map {
> -	int dt_id;		/* DT binding clock ID or -1 sentinel */
> +struct clk_id_map_entry {
> +	u32 dt_id;		/* DT binding clock ID */
>   	u32 fw_id;		/* FIXED_CLK() ID */
>   };
>   
> +struct clk_id_map {
> +	const struct clk_id_map_entry *entries;
> +	unsigned int size;
> +};
> +
> +#define CLK_ID_MAP(_entries) &(struct clk_id_map) {	\
> +	.entries = _entries,				\
> +	.size = ARRAY_SIZE(_entries),			\
> +}
I am surprised there is no generic ARRAY_AND_SIZE() macro for this already.

