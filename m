Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5799606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 10:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jbUYHffC;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=f7lUuUcJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ivDTVAtvWv3uwend5cm17scjqn/tl8MG+Jy9Smv3hpg=; b=jbUYHffCLFkgky2/ufI8C7BRX2
	O00QglaGnkWbCPdx+wVRFa5NJRX2zcMFIb+w7KjZi0gAoJD5NaFaQJDQ3Xq+4W/sy5Ytu1XQTrMyC
	uB2P+jW3afJ8GHg5cNlrXhrjspmBWnBATy9o++G4Vk7GTFq3bsWGgr6OzM/bpdhpuW4M/N6M8uo+j
	/R9crTsiyqxLDXeGyfNCP5WQ9ByOp5EJpdx7VSMXr+RFkhDKJZTi3D2YxGOt53rNMQWXXNQ3RSSzC
	DsQG5oTek327d7Bc/g0EUQDTrC1ay3LdHS995rN3BiUCdzxWCOZkee2uZ7q9u/tuOywWapr/kknY7
	3JbZpAQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVRjw-000000033om-3eIN;
	Mon, 23 Nov 2026 10:57:40 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVRjv-000000033oQ-0P2a
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 10:57:40 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-7086-3000--a06.rev.dnainternet.fi [IPv6:2001:14ba:7086:3000::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3F2F7177;
	Mon, 23 Nov 2026 11:55:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1795431305;
	bh=AvO1/maww9n+YB0rxCd6DEtZ440NZzTfyaS445kaBfs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f7lUuUcJy8Q8gJH5VYA7aaa3M4mV+ugeNvtqthpyxA3a4AgiBAKgrR8cfUcs7sB3R
	 Yu7p3IW3qVICHH0IWvcnE2HVpP2F17VVllH1jdcP3qTvia02bPS5BPrLlS/F4DlC/6
	 gwVVR6fFqqZQCgY++fQxDQBYg7PN7Ll+3GmNv//s=
Date: Mon, 23 Nov 2026 12:57:36 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Marek Vasut <marek.vasut@mailbox.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
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
Subject: Re: [PATCH v5 01/15] clk: renesas: r8a78000: Merge debug prints in
 r8a78000_clk_get()
Message-ID: <20261123105736.GB3010398@killaraus.ideasonboard.com>
References: <cover.1795029012.git.geert+renesas@glider.be>
 <cee843b319c9eceba2339f14a134e305a2b05d7e.1795029012.git.geert+renesas@glider.be>
 <57d2cc58-15ac-434e-ab40-7a8a54d93a1f@mailbox.org>
 <CAMuHMdXXS4ZTxLBrZoNycHUzdUp9QsisfA7CcBPyAGw7zTuSoA@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdXXS4ZTxLBrZoNycHUzdUp9QsisfA7CcBPyAGw7zTuSoA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_025739_302900_6747F98C 
X-CRM114-Status: GOOD (  16.37  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 20, 2026 at 08:56:42AM +0100, Geert Uytterhoeven wrote:
> On Fri, 20 Nov 2026 at 06:28, Marek Vasut wrote:
> > On 11/18/26 8:44 PM, Geert Uytterhoeven wrote:
> > > The two debug prints in r8a78000_clk_get() are very similar.
> > > Merge them into a single debug print.
> > >
> > > While at it, unwrap the (wrongly-indented) continuation of the
> > > r8a78000_clk_get() function header, as it fits on a single line.
> >
> > It might be worth mentioning, that this now also uses
> > clk_hw_get_name(hw) instead of map->fw_id .
> 
> clk_hw_get_name(hw) was printed before; fw_id will still be printed
> in get_hws() after PATCH 04/15.

That's worth mentioning in the commit message. With that, the patch
looks good to me.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> > [...]
> >
> > > -     dev_dbg(dev, "Mapping DT clock %u to fixed clock %u\n", id, map->fw_id);
> > > -
> > >       hw = priv->fixed_hws[map->fw_id];
> > >
> > > -     dev_dbg(dev, "clock %u is %s at %lu Hz\n", id, clk_hw_get_name(hw),
> > > -             clk_hw_get_rate(hw));
> > > +     dev_dbg(dev, "Mapping DT clock %u to %s at %lu Hz\n", id,
> > > +             clk_hw_get_name(hw), clk_hw_get_rate(hw));
> > [...]

-- 
Regards,

Laurent Pinchart

