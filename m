Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 864F4606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 18:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wisOTKLJ;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=rp0o4cZg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=nhYYKORTR+/BNUYkaM3WAO4aIQzSPeOEyfSMlfBv7+k=; b=wisOTKLJJut+fS
	QgRPmAUlH+6Rc8DtDi27VE0Rir0sHtMpTq3wvpJvb0VlcPLSymebPklSR7u5EHJMRJEMI4JkZdxGF
	qkBZqHzBvHa8x8Qbum/KS1l6Awz61ncXi5ZnFWwAveuxSY48Z+ygdeXV4NEeRPVnZCzOMSEzMNM32
	c5uBv5MkmYsxt0aiAFePRL9MUCudOQ9slD5qfJjJlY7BDZwpVc1AzWyexWoq2JmbKFzYCxkEJGvoh
	V0KpIc3k+h8RdKwVl+cgpTqLo1mFx05y63hEpvGZ8DxwA8lHvBOJiomCAfIyIwtk3iv/u8g4Ocl96
	3rJewFF5jBiaibQNLrZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0dE-0000000HPPe-2uWn;
	Fri, 27 Nov 2026 18:25:12 +0000
Received: from mout-p-101.mailbox.org ([80.241.56.151])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0dC-0000000HPOz-0cD0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 18:25:11 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4jbhfR0W8sz8vb0;
	Fri, 27 Nov 2026 19:25:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1795803903;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nhYYKORTR+/BNUYkaM3WAO4aIQzSPeOEyfSMlfBv7+k=;
	b=rp0o4cZg/2LoIO1Q3s2bGCHl0Aon823Hf088RxGd6yK0MGZt0OcgEHQyZ8sPv/bU9JRYhC
	qfnbtzyR0NSsKumv1eWkS6y22w/gphMewwv47R1gJk07iLtsp/FHrbmnTm3wsmGibl6682
	AB7m/c/rSdKsxCj7EVhQXuOcTdBL1Jg4NCfVCTSsOZDMnx6lWDFEKpjljbhE/RQ7/+YMeV
	nr6R4OO+cgd8IDbsU8hyAuExijEq1D+zcY7LVNMGKNH5hKOT4UQ3VCqaH9K+dES520+O0c
	zv/tXwq6+iJm2zJFx6THtVHP7g/ytNNUCEcX72NJX4FNmrF5vBCiD/1CP6LXFQ==
Message-ID: <0e44d7dd-eb49-4c47-a43c-11ed90c96bb0@mailbox.org>
Date: Fri, 27 Nov 2026 19:24:58 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/14] clk: renesas: r8a78000: Merge debug prints in
 r8a78000_clk_get()
To: Geert Uytterhoeven <geert@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
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
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
References: <cover.1795796064.git.geert+renesas@glider.be>
 <7abac4b033081657e2a9870182bc06f5a5a02c0c.1795796064.git.geert+renesas@glider.be>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <7abac4b033081657e2a9870182bc06f5a5a02c0c.1795796064.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: cepmxa9jpmdz5zarare85p9sm4r8pee9
X-MBO-RS-ID: feb1e7b3c69ed64ac80
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_102510_510050_A671B415 
X-CRM114-Status: GOOD (  10.47  )
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

On 11/27/26 5:26 PM, Geert Uytterhoeven wrote:
> From: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> The two debug prints in r8a78000_clk_get() are very similar.
> Merge them into a single debug print.
> 
> Note that the clock's name is still printed, but its ID no longer is, as
> that is purely internal.  The printing of real firmware IDs will be
> readded when their handling is added.
> 
> While at it, unwrap the (wrongly-indented) continuation of the
> r8a78000_clk_get() function header, as it fits on a single line.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thank you !

