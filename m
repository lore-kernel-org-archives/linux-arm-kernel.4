Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92D0606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 10:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=snw48mh0;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=mITrGh2T
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PcLcbUy9WLbB87302gRwaNmUCRa+6gKrWS43onZVWUM=; b=snw48mh0VDxq5z/FpIEV1yccbz
	C3TREU348uti0p282+nUJXLyQm6raQ9W16ezoTtqfGmWwfS+HgnirkItJu2w7y/nmYeI6aBP/jifK
	SrYeswI9apzOhoiDmqGMp7p8oYguGf+QQDnReqewSMRBzq++N1lbFhRJozp5IIaBjYZdc3dAhQWLS
	UHT/I6KKLyneHgiz9w9Fkn+KKFr/596W/Zz3UB9XOunuL0CGXYGYiAE9JfHWjOaE+gN3yBn2Yq3ow
	1+eZghhjl7HtDnbqKzOwFoBZ7EbXln21uws7oooLtjjoj7rPIykF5wJjFaHcJf9KtKkBgmOW4Pzbc
	uWXAjC4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVRQ1-00000002yqE-1ye5;
	Mon, 23 Nov 2026 10:37:05 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVRPY-00000002yeH-2HLK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 10:36:40 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-7086-3000--a06.rev.dnainternet.fi [IPv6:2001:14ba:7086:3000::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 834BE4B0;
	Mon, 23 Nov 2026 11:34:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1795430042;
	bh=ccjAAMHgAJq89pSqUHBH89F3ZPD7R6QW9itkpi2hSf0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mITrGh2T1FVa6dXh336gRFij/ePLSfcLwEekVfS1AxwaI7aqZ0bLgYy/lJEqruSUi
	 FObd+PkgFTebQAZS8wBeD2K5FUZEdu7ymMqsxsBxmV4tRsWqYAeyJUQAp8z0+2dNCm
	 P5/jt6wVW1mR4TlGRbHZb1csDC+J4CXxqUIxhxnA=
Date: Mon, 23 Nov 2026 12:36:33 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: =?utf-8?Q?Cl=C3=A9ment?= Le Goffic <clegoffic@baylibre.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
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
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Paul Elder <paul.elder+renesas@ideasonboard.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v5 00/15] R-Car X5H Ironhide CPG/MDLC SCMI remapping
 support
Message-ID: <20261123103633.GB2959742@killaraus.ideasonboard.com>
References: <cover.1795029012.git.geert+renesas@glider.be>
 <1e9c5ac3-d82b-4af9-9946-0302cadf7404@baylibre.com>
 <20261119234759.GB2324725@killaraus.ideasonboard.com>
 <19c3745a-6308-46ff-bb37-3acc88fe22e2@baylibre.com>
 <awAqqg6F2Z1t55x2@ninjato>
 <d94ad9ca-afdd-4301-a69c-0bbad5b334fa@baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d94ad9ca-afdd-4301-a69c-0bbad5b334fa@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_023638_442026_F98E89F6 
X-CRM114-Status: GOOD (  31.58  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 20, 2026 at 03:33:11PM +0100, Clément Le Goffic wrote:
> Hi Wolfram,
> 
> Thank you for the rewording, it is clear
> 
> On 11/20/26 12:10 PM, Wolfram Sang wrote:
> > In the past, we wanted to support all kinds of firmware. Sadly, each new
> > firmware introduced different IDs here and there. So, we came up with
> > some stable IDs ourselves and mapped them to the IDs per firmware. This
> > is a n:1-mapping of firmware IDs to our stable IDs.
> 
> Sure, that is part of firmware development.
> I know several SDK versions exist, and supporting several of them is work for a vendor tree.
> As Geert's cover says, "While upstream Linux must only support sufficiently mature firmware versions, vendor trees (e.g. renesas-lts) may still want to support development firmware versions".
> Each SDK version can then have its own DT there.

That's not how DT works. Please be gentle with Krzysztof and avoid
increasing his blood pressure :-)

> > The support for <n> firmware versions got serious opposition from
> > upstream. We concluded that supporting only the latest firmware will
> > make most controversial discussion points vanish. So, we now have a
> > 1:1-mapping of (the latest) firmware IDs to our stable IDs.
> 
> Agreed, supporting several numbering upstream for the same chip only brings confusion.
> But then, why can't that one mapping be one DT?
> 
> > I guess this is what Geert means with IDs becoming "stable". <n>
> > firmware versions might return <n> IDs, but supporting only one firmware
> > we get the same "stable" ID from it.
> > 
> > Sadly, of course, with the next firmware update, we still might get a
> > different ID all the time. So, not stable in that regard and we still
> > need the mapping :(
> 
> When the firmware can be updated, I think an id change should be fixed there first.
> That is what I would do in the open-source SCMI server firmware I am writing for this chip.
> 
> > Yes, this means the driver is then tied to a specific firmware version
> > because it only has this mapping. Not nice for a user. But we didn't see
> > another way moving things forward for now.
> I think the DT is that other way.
> With the SCMI ids in DT, only the DT is tied to a firmware version, not the drivers.
> If a release that changes ids is already out, it needs a new DT, or a quirk for that one release when the DT cannot be updated.

So you're proposing that, with any new firmware that introduces an ABI
breakage, every single DTB on all boards in the wild get updated ? That
just doesn't scale, sorry. Let's forget about that bad idea, and focus
on finding a good solution.

> The hardware stays described
> The CPG and MDLC belong to the SCMI server, so the DT should mark them status = "reserved", and the consumers use the SCMI clock, power domain and reset providers.
> 
> The Devicetree Specification v0.4 define "reserved" for this case (section 2.3.4, Table 2.4):
> "Typically this is used for devices that are controlled by another software component, such as platform firmware."
> 
> Zephyr also uses SCMI on this chip, and it already keeps the SCMI ids in its X5H DT
> Juno and STM32MP15 handle their firmware differences the same way, with separate -scmi DT variants that simply include the board DT and an SCMI .dtsi.
> If the number of variants grows, tools such as Lopper, which I mentioned before, can help manage them.

-- 
Regards,

Laurent Pinchart

