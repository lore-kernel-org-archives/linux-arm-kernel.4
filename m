Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D10606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 05:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Q5JDCiX3;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=d+cB7s5v
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ktwA9f728ADGnZh0rHg/RvlUSt14br3A/RT6n9yqOtU=; b=Q5JDCiX3PpjV+a
	kpX+w77UwaD8jv+YQNRoPVc7U9tt9Z5eWn2e/WnOBYs1CyuO/Yn/G16uQSP9d/B5HBLZPqeDxRViz
	o8nF5f/5Zs0C/RZQPIuBqrS3zhKFbadSdjYXxcSY8uzPyyw5w8/5nQhelVb7NjMlotVuVj47uTQ5Y
	0ApsPAJTnSlkpwZZ9faPYuduML8xd8+e4ImeORCD4q3rhxUN34XoL9mxn3oHtLNIIW5ucX5PNV3XK
	fAfAjURYldFXFU+dQmT2BqZEqMLX4PeQ7Cq6U4FxwT9VcwAksvp2oYgJRjLANGEiBnNwjCj16ZEMs
	OpRAZHaXieVh0UNqBd9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUHB3-0000000E4Em-2hAH;
	Fri, 20 Nov 2026 05:28:49 +0000
Received: from mout-p-202.mailbox.org ([80.241.56.172])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUHAj-0000000E49c-3hr5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 05:28:34 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4jW3lZ6Nm0zMm0t;
	Fri, 20 Nov 2026 06:28:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1795152506;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ktwA9f728ADGnZh0rHg/RvlUSt14br3A/RT6n9yqOtU=;
	b=d+cB7s5vSc0Ju2BUhKZw2EJQSvXt2DlJLe8AXuC8OEu/dGDLN8xRv+oEDqU1wcvsMltiyD
	yXWFXZSkcpJen5S/fC/0W4VI9OyS7mIEL41BhITrLrAbBM3+Lnp9a74orZElk2E+nuVxd1
	bN8dhXm9Phk2kh3hLIzE/nY1HXCqg/EDWjWyJjwDzlKUDPoS2uCQULpxs8dVU25hpXZBzb
	UlvpNF2nfBl5mRGHK6lo92kyCybSyecJiAY218ztQiUFHEt13rm5DBpc8uoGy1djMA1Ug4
	+Lvoz3hxi8fB9TvLMwg+JJNNQYNgLNLDS1vXFryiGSKjhJq/DcYfaYYB88rnSg==
Message-ID: <c6fdd13f-c6a4-4f1c-8ce7-67a9a9188880@mailbox.org>
Date: Fri, 20 Nov 2026 04:25:36 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/15] clk: renesas: r8a78000: Add clk_hw to clk_map
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
 <ea85d72ca37bc7abc59fda5aed4b8272578922c4.1795029012.git.geert+renesas@glider.be>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <ea85d72ca37bc7abc59fda5aed4b8272578922c4.1795029012.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 3039c6c76c8ba923bc6
X-MBO-RS-META: cxsu5st74xt97hx6y5nqass9aoeb547t
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_212830_898051_291E4CA5 
X-CRM114-Status: UNSURE (   7.81  )
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/18/26 8:44 PM, Geert Uytterhoeven wrote:
> Prepare for mapping to other than fixed-rate clocks by adding an array
> of clk_hw pointers, indexed by the clock map entry index, and populating
> it up-front.
> 
> Move r8a78000_cpg_priv.fixed_hws into get_hws(), as it is no longer
> needed afterwards, and drop NUM_FIXED_CLKS.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

