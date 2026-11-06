Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC62606A330
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 14:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KjEv5iDv;
	dkim=pass (1024-bit key, unprotected) header.d=grimler.se header.i=@grimler.se header.a=rsa-sha256 header.s=key1 header.b=kADcVJZM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=nXpHtbwIXWqa0CUduYYty9A7kDwxd+/CalGYDzCTKjw=; b=KjEv5iDvo9LdmdLfStp9ry6Jfz
	u1pNkOP3jsYRnjKJlAEZuXpFDzoYoyybAAwh80HvKj4s0yBL+5BBczdDUXim3u0asagxTWQSj9xf1
	kBjtWKoY8PuW+j09/nOyjjeElo7BKhC5i6txnWRG4uBkGwo3d/8NGXdmo7IoG2HYhBZRjQ614W+as
	8Nf86txlS+OzDJbwXZ79XoqsilbcpjchgBiJOuvbGmQLoODHoye8ytmYlBETFo7VgxLI4+QQSyQLR
	5juxU1ccofqundpwl2kbmK5Kj5vTNmlZ3/hJBvaDg/yh0uOX8Zr/YNYts+k+DjUskr1Spktk04X3E
	XM53+Z8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPLCT-0000000Cjj7-1v41;
	Fri, 06 Nov 2026 14:45:53 +0000
Received: from out-56.mta1.migadu.com ([2001:41d0:203:375::38] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPLCN-0000000Cji9-05rp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 14:45:52 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=dsRJ/0z/yE/5s58BMhmlVSFV04GmqnxwznaEjY/5328=;
 c=simple/simple; d=grimler.se;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793976343; v=1; x=1794581143;
 b=kADcVJZMgmNCz98SwUVAOSfSrkz7gIzWbzN1tnaTaC/CyM5NEQ9+X5mynXCfvmbkw7XuInM9
 NAROZSBHoV0/9CqgXDtzIomW7cYT/ppqX/Fhy/LhrHWO5UoPgPn3onXSrZp9k+rthRSGL4m1cHm
 gD0Trg+KBvMvns8fnRoJ1Jmg=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by mta12.migadu.com with ESMTPS id cf432eae1467532f;
	Fri, 06 Nov 2026 14:45:39 +0000
X-Mizu-Trace-ID: cf432eae1467532f
X-Migadu-Flow: FLOW_OUT
Date: Fri, 6 Nov 2026 15:45:36 +0100
From: Henrik Grimler <henrik@grimler.se>
To: Young-Jun Hong <nirvanah@nirvanahyj.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] clk: samsung: exynos5420: add VPLL rates for 650,
 700 and 750 MHz
Message-ID: <20261106144536.GA3678@localhost>
References: <20261106054210.2893230-1-nirvanah@nirvanahyj.com>
 <20261106054210.2893230-3-nirvanah@nirvanahyj.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106054210.2893230-3-nirvanah@nirvanahyj.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_064547_778695_B2F835AD 
X-CRM114-Status: GOOD (  18.01  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Young-Jun,

On Fri, Nov 06, 2026 at 02:41:49PM +0900, Young-Jun Hong wrote:
> The VPLL drives the G3D (Mali) clock on Exynos 5420/5422. Its rate table
> stops at 600 MHz, so GPU OPPs above 600 MHz cannot be reached:
> clk_set_rate() silently keeps fout_vpll at 600 MHz.
> 
> Add the 650, 700 and 750 MHz rows (VCO 1300/1400/1500 MHz, using the same
> P/M/S style as the APLL rows).

What you mean with "using the same P/M/S style as the APLL rows"?

> Tested on Samsung ARTIK 10 (Exynos 5422): with these rows the G3D devfreq
> reaches 700 and 750 MHz, and the OpenCL accuracy suite passes 96/96 at
> 750 MHz with a board-specific 1.35 V OPP.
> 
> The analysis, the code and this changelog were produced with Claude
> Code (Anthropic), a coding assistant.

Was it tested by a human?

> Signed-off-by: Young-Jun Hong <nirvanah@nirvanahyj.com>
> ---
>  drivers/clk/samsung/clk-exynos5420.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
> index 400a5c59815c..1b4b0ae16765 100644
> --- a/drivers/clk/samsung/clk-exynos5420.c
> +++ b/drivers/clk/samsung/clk-exynos5420.c
> @@ -1451,6 +1451,9 @@ static const struct samsung_pll_rate_table exynos5420_epll_24mhz_tbl[] = {
>  };
>  
>  static const struct samsung_pll_rate_table exynos5420_vpll_24mhz_tbl[] = {
> +	PLL_35XX_RATE(24 * MHZ, 750000000U,  125, 2, 1),
> +	PLL_35XX_RATE(24 * MHZ, 700000000U,  175, 3, 1),
> +	PLL_35XX_RATE(24 * MHZ, 650000000U,  325, 6, 1),

Do you have any references, like vendor kernel sources, to back up
these choices of dividers and scalar?

Best regards,
Henrik Grimler

>  	PLL_35XX_RATE(24 * MHZ, 600000000U,  200, 2, 2),
>  	PLL_35XX_RATE(24 * MHZ, 543000000U,  181, 2, 2),
>  	PLL_35XX_RATE(24 * MHZ, 480000000U,  160, 2, 2),
> -- 
> 2.47.3
> 
> 

