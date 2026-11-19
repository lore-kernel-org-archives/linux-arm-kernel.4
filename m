Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0301D606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 23:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=c/pZ8Db+;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=NcISFCtC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+ijbtSK0fBZ6ownvGj02cHskN9Djna0WvtK/k37lNQ8=; b=c/pZ8Db+7y3qB1tDe0/N38SRTn
	Va/DH5wEmDrMyDqKoR6EBeFY5HM3Qt7nnY+gzefKJhGXoScBj3tfU9OdY+OOSBIn7UVquCnIaN9l1
	7yY1tg/uPbXq9cGtPPnk1Fjd3Lc5bT2UWSLjIKz5Bhdedh8KJ8Q3X19N6n/ibafhgvPZRWA5dnxFJ
	sIFuxX+6WMfNGNTzLASoFtPA4Xzh+phhMXQEWTIUE7sF//lL5n8mrb+GSPCSugxyrTDhYxGm1drlJ
	L80RmHbqthChf71zroazB8KOAWFfbcaz3DFljhWio05FfUFbKNLh7ln9yyx86iQHIXm5hFdROomMG
	G6l9Oc+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUBrM-0000000DgHi-2jUs;
	Thu, 19 Nov 2026 23:48:08 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUBrJ-0000000DgHL-3RiY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 23:48:08 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-7086-3000--a06.rev.dnainternet.fi [IPv6:2001:14ba:7086:3000::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CC82A6AF;
	Fri, 20 Nov 2026 00:45:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1795131932;
	bh=EZwvQCbn6puXRaR/jIu1ad9YLeXmu2tjVf0hS1LGbjk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NcISFCtC5Xg1GEKU99n//zV0rhPkR5PRrt6WisLdwe6SwAb9p/WCxEUiEiBfgG2fT
	 Rnpzq+GOOlztVp88d33vyp6XUpVa/L77iC0tum6ZLf4aiWr26kd0THZmA812SHkFlO
	 cwcwWjPeI9XKnw4+785lXybLQPrjxZjjA9AcwDVk=
Date: Fri, 20 Nov 2026 01:47:59 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: =?utf-8?Q?Cl=C3=A9ment?= Le Goffic <clegoffic@baylibre.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
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
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v5 00/15] R-Car X5H Ironhide CPG/MDLC SCMI remapping
 support
Message-ID: <20261119234759.GB2324725@killaraus.ideasonboard.com>
References: <cover.1795029012.git.geert+renesas@glider.be>
 <1e9c5ac3-d82b-4af9-9946-0302cadf7404@baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1e9c5ac3-d82b-4af9-9946-0302cadf7404@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_154806_351056_1B5CCE0F 
X-CRM114-Status: GOOD (  23.54  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 19, 2026 at 03:47:15PM +0100, Clément Le Goffic wrote:
> On 11/18/26 8:44 PM, Geert Uytterhoeven wrote:
> > 	Hi all,
> > 
> > TL;DR:
> > 
> >     Describe hardware in DT, and perform mapping to abstractions offered
> >     by SCMI in Linux.
> 
> A question on the approach
> An SCMI variant DT could mark the CPG and MDLC status = "reserved" and point the consumers at arm,scmi, while the U-Boot IPL keeps the hardware DT.
> Since v4, the series assumes the SCMI ids are stable:
> 
> >   - Remove dependencies by making assumptions and dropping disputed
> >     items, to move this series forward:
> >       - Assume all SCMI IDs are stable.
> 
> If they are, why not using them in the DT directly?

As far as I understand, the assumption impacts the mdlc and cpg drivers
only, not their DT bindings. If (or rather, let's face it, when) a
firmware revision later breaks the assumption, we will be able to handle
it in those drivers without affecting DT.

I don't like this remapping driver much, in the sense that I wish it
wouldn't be needed, but it seems to me to be the best possible
compromise given the instability introduced by SCMI.

> On partitioning, the cover letter says:
> 
> >   - The clock, reset, and power domain IDs are not stable by design,
> >     causing DT incompatibilities.
> >     SCMI requires that the ID space exposed to an agent (i.e. Linux)
> >     starts at zero and is contiguous.  Hence any change in system
> >     partitioning (Application CPU core vs. Realtime CPU core,
> >     virtualization, ...) may mean a renumbering of all SCMI IDs,
> >     implying a massive change to the DT.
> 
> SCMI do not mandate that renumbering. The ids start at zero and are sequential, but nothing requires them to cover only the resources of one agent.
> The firmware can keep a single id space for all agents and restrict per agent what each one may use, the rest returning DENIED (SCMI 4.0, section 3.2.1).
> For virtualization, the spec has the hypervisor grant each VM its resources this way. A new VM then changes permissions, not ids.
> 
> With a single id space, a software configuration only changes which nodes are enabled, so one DT per software configuration, a base DT plus an overlay, is enough.
> If managing many configurations ever becomes a nightmare, tools exist for it, such as Lopper from devicetree-org [1], which generate one DT per execution domain from a single system DT.
> 
> That leaves the missing clock domain, which is a gap in SCMI itself.
> 
> [1] https://github.com/devicetree-org/lopper

-- 
Regards,

Laurent Pinchart

