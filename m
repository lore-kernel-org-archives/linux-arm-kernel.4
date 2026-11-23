Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C07C606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 12:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=04117A/B;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=AZIGKtbJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=AK9gZq1mzNYYir8TNaIUe4uUnYICwkK2Y+EuWc7ckdM=; b=04117A/BKNK8EHA+suwFoCs4Et
	+fi6xHc7B+O6cQUHR66Z3hMguRBJfTiGfdOt5wF/jEkp61WYLahK4pbQR3GBHXjdMoeACGto2Uihf
	YuuhHc6ep1dzMinSCrV1td7EBOHn/la1BIuiA7N/Krl79nqFBu+EhxyiYI9iWEsWPmIDsFMUQzYir
	9jBImPCPeQnQ+0x2suAd/wZftsjDmxjh7XbK1MS/IC9d7IlE6004L6aDQ0JEeoBJE8oyruVtfRYFg
	9VQv2vKLtNgL3mK7R6uNRZ9hqoFlY0Q0EplWgAcifBBJdyr2AHnR8n+wxUvJNh0D6ZQjcRkXLk8j3
	maYr2Fng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVTYm-00000003TPh-0yaB;
	Mon, 23 Nov 2026 12:54:16 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVTYk-00000003TOa-0VFF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 12:54:15 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-7086-3000--a06.rev.dnainternet.fi [IPv6:2001:14ba:7086:3000::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 31A5E177;
	Mon, 23 Nov 2026 13:51:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1795438299;
	bh=WRMJuqFdJHPeKGISVHJw8r4oTogveJ42OLFSdKyGCc8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AZIGKtbJR6NkLXRom8BW/EhsnsC1Qtzflabo8Bbcd6MJhGpnl0G7O9/Nfw94CZnoM
	 KK2Frc1pLjhhlJe1YrWwhiM0MzcAEmKh73qx4i+5jLEyo05m07KyNw26uLNjEdzMnt
	 6U/AC2OPCb7Ic8d01t0cFQ49muIHRDjCsjQmSzZI=
Date: Mon, 23 Nov 2026 14:54:10 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Kevin Hilman <khilman@baylibre.com>, Vinod Koul <vkoul@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Paul Elder <paul.elder+renesas@ideasonboard.com>,
	=?utf-8?Q?Cl=C3=A9ment?= Le Goffic <clegoffic@baylibre.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v5 05/15] clk: renesas: r8a78000: Add SCMI remapping
 support
Message-ID: <20261123125410.GK3010398@killaraus.ideasonboard.com>
References: <cover.1795029012.git.geert+renesas@glider.be>
 <e01baebc546ed6f1b71a0487a59cda73239ea7f1.1795029012.git.geert+renesas@glider.be>
 <20261123113619.GG3010398@killaraus.ideasonboard.com>
 <23ab561a-c5c5-41ff-a0f4-87a3f5ca2e49@app.fastmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <23ab561a-c5c5-41ff-a0f4-87a3f5ca2e49@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_045414_307865_2A4E0D00 
X-CRM114-Status: GOOD (  25.82  )
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

On Mon, Nov 23, 2026 at 01:34:06PM +0100, Geert Uytterhoeven wrote:
> On Mon, Nov 23, 2026, at 12:36, Laurent Pinchart wrote:
> > On Wed, Nov 18, 2026 at 08:44:53PM +0100, Geert Uytterhoeven wrote:
> >> Extend the Clock Pulse Generator driver for R-Car X5H with SCMI support,
> >> to remap DT clock IDs to abstractions (clocks) offered by the SCMI
> >> firmware when running on a system with SCMI, and SCMI support is
> >> enabled.  Take into account some peculiarities of the current SCMI
> >> firmware implementations, and fall-back to fixed-rate clocks as
> >> replacements for SCMI clocks that are not available.
> >> Support for bus clocks used by serial, I2C, and SPI devices is included.
> >> 
> >> This lets us avoid putting SCMI IDs in DT, and allows us to use the same
> >> hardware description in SoC DTS for systems with and without SCMI
> >> firmware.
> >> 
> >> For now, it is assumed SCMI clock IDs are stable, and match SCP FW
> >> SDKv4.31.0 and later.
> >> 
> >> Suggested-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> >> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> 
> >> --- a/drivers/clk/renesas/r8a78000-cpg.c
> >> +++ b/drivers/clk/renesas/r8a78000-cpg.c
> 
> >> @@ -140,7 +182,35 @@ static struct clk_hw **get_hws(struct r8a78000_cpg_priv *priv)
> >>  
> >>  	for (unsigned int i = 0; i < map->size; i++) {
> >>  		fw_id = map->entries[i].fw_id;
> >> -		hws[i] = fixed_hws[fw_id];
> >> +		if (fw_id >= FIXED_CLK_OFFSET) {
> >> +			hws[i] = fixed_hws[fw_id - FIXED_CLK_OFFSET];
> >> +			continue;
> >> +		}
> >> +
> >> +		scmi_spec.np = scmi_clk_np;
> >> +		scmi_spec.args_count = 1;
> >> +		scmi_spec.args[0] = fw_id;
> >> +
> >> +		clk = of_clk_get_from_provider(&scmi_spec);
> >> +		if (IS_ERR(clk))
> >> +			return dev_err_cast_probe(dev, clk,
> >> +				"Failed to get SCMI clock %u\n", fw_id);
> >> +
> >> +		hw = __clk_get_hw(clk);
> >> +		clk_put(clk);
> >
> > Doesn't that leave the hw pointer possibly dangling, shouldn't you keep
> > the reference to the clock ?
> 
> Only struct clk is reference-counted; struct clk_hw is not, and exists as
> long as the clock provider hasn't unregistered it.

That's what I meant, what prevents clk_hw from being destroyed while you
still hold a pointer ?

-- 
Regards,

Laurent Pinchart

