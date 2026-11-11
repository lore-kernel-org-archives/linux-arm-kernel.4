Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B00606A8A0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 14:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wwtS6hKu;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NT4qgraG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ST8iIzeb1I30IxQIxW7lxeEJ96ruVZsibwUtgOrtpKg=; b=wwtS6hKuGO9YINEkmfWYfeSapx
	tqRBnp+3tfPcnYzjB1dXA7A/dM4b0QqWv5TSgzeoqHZs+Rgd8sqdJvJnSv3LQqZTpcaXslG0eISiL
	tIVT4lKAy4EMyrcmpsaYAlhXlHmq7bqM56CRX+oWv4Iuin3e8ZoM65R4D5EaYNXZ+HHL0TaBOabBl
	zhP77LWTIdXmtmy50FdYDKqlelNcviRXk6cVII7jxk1j3sfV6i6+MnfqNCvlR9C25dPCkHxkzOPkk
	6s+Q9VQCvlIrskZibirkTZkS12kiTpDtigeJ76Q1oGzYjuz6fUsn+45ML8yP79jukAbPdgmQKA+9n
	bkCy0NWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR98t-00000006vhy-49Py;
	Wed, 11 Nov 2026 14:17:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR98t-00000006vho-1XxN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 14:17:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D08D942D65;
	Wed, 11 Nov 2026 14:17:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87A611F00A07;
	Wed, 11 Nov 2026 14:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794406658;
	bh=ST8iIzeb1I30IxQIxW7lxeEJ96ruVZsibwUtgOrtpKg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NT4qgraGnRbz09Un1YgRe6pQIxx/5JX7MfGY+/9AAZrQezR2wajzhgJp9/WulFvyQ
	 DmcT0tLvlZ4cwjSwGcEHx/3rzayiUXynH/QKDbynfUxLobYdAZhP1S4GT5PPfnHMbq
	 tAMBtnRtp/PPzsi++gjTAM/9/q0WYhEr6VD5PfSDNaPULcSphXuD2bEkB4OQd4f/bl
	 f7MlWYB9qelAQqHityoZhUJNxvjFmFqP/xh/J5Wys3ORPmjzBgO7LTiUuvsKYK38/n
	 PlP6q7FT5V44w8Y+yX7QgMeSl60NveEI0DhPcfY1u9o8qnue2w7HNoFs+/j2R9k7rG
	 LzQghvCvR2rsg==
Date: Wed, 11 Nov 2026 08:17:36 -0600
From: Rob Herring <robh@kernel.org>
To: Robert Marko <robert.marko@sartura.hr>
Cc: linux@roeck-us.net, krzk+dt@kernel.org, conor+dt@kernel.org,
	corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
	Steen.Hegelund@microchip.com, daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com, nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	luka.perkov@sartura.hr
Subject: Re: [PATCH v2 1/6] dt-bindings: hwmon: add Microchip LAN969x fan
 controller
Message-ID: <20261111141736.GD1476246-robh@kernel.org>
References: <20261109133609.810876-1-robert.marko@sartura.hr>
 <20261110145414.GA3828324-robh@kernel.org>
 <CA+HBbNFE7ud3omp1e8A9w=PYMM+JPW-y94MiM68K2sz4HitU7A@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+HBbNFE7ud3omp1e8A9w=PYMM+JPW-y94MiM68K2sz4HitU7A@mail.gmail.com>
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

On Wed, Nov 11, 2026 at 01:21:56PM +0100, Robert Marko wrote:
> On Tue, Nov 10, 2026 at 3:54 PM Rob Herring <robh@kernel.org> wrote:
> >
> > On Mon, Nov 09, 2026 at 02:35:05PM +0100, Robert Marko wrote:
> > > The LAN969x fan controller has a PWM output and tachometer input in a
> > > register block separate from the Sparx5-compatible temperature sensor.
> > > Describe it with its own compatible and binding.
> > >
> > > The optional fan child specifies PWM period and polarity, tachometer
> > > pulses per revolution, and thermal cooling levels.
> > >
> > > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > > ---
> > > Changes in v2:
> > > - Describe the fan controller in a separate binding and compatible.
> > > - Keep the existing temperature-sensor binding unchanged.

[...]

> > > +    dependencies:
> > > +      '#cooling-cells':
> > > +        - cooling-levels
> > > +      cooling-levels:
> > > +        - '#cooling-cells'
> >
> > The dependencies should also go in fan-common.yaml. Perhaps
> > cooling-levels without #cooling-cells might make sense sometimes?
> 
> I removed cooling-levels requiring #cooling-cells, as it can
> technically work without it, its not ideal, but it works.
> 
> I am not sure if its feasible for fan-common.yaml though as we already
> have schemas for EMC2305, and more importantly
> DTS-es for freescale/imx95-tqma9596la-mba95xxca.dts and
> rockchip/rk3568-radxa-cm3j-rpi-cm4.dts
> that have #cooling-cells without cooling-levels.
> EMC2305 driver even calculates cooling states without a levels table.
> 
> I would appreciate guidance on how to proceed with this.

Okay. Leave it as-is.

Rob

