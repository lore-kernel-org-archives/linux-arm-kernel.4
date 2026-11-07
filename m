Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B18D606A333
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 23:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=USajJ22H;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UhhiDMTO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=9JVhoZv/kApjV5ecEB9wAeg1QHl094+ex1qsxNehnhc=; b=USajJ22H0XK6c8
	31nsvF2RZNXy/UIvmlg2cJpuXsbGXQW8QGbjPr/q/qo5Hb37hRGm5QcfAP9n/PgAErmphjH3+p1sI
	RW8t7vm6QAzYurE5TMBbtbD9KpFuYg9kv6OhF7EXsMzVzbbqSTWefaCG3OXXIDbST4vUC0aG/LVKR
	ljsEd898qNgPmPJX/fweCCXf5ZOidDaeXNIZGr3n//+lcm2DPTCiQFBiaXkydal55giOs6+obcPfg
	qWeSXCHpEu9l6s0TmfKD3RVHKIBJ2cRldw2MeZfa1auDCmfRfgSnaLgB2V8rCV09zCUEmlSoQRAtG
	b9x3ZBB5pw61YdKTRNkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPq4M-0000000FVp0-3bZW;
	Sat, 07 Nov 2026 23:43:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPq4L-0000000FVou-3jXn
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 23:43:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6867C61120;
	Sat,  7 Nov 2026 23:43:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EAD61F0089F;
	Sat,  7 Nov 2026 23:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794095012;
	bh=9JVhoZv/kApjV5ecEB9wAeg1QHl094+ex1qsxNehnhc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=UhhiDMTOXiySnfYDmTQByecsNuzvdkkUYa2f2XsT9gcuhd1owatVF5gjkOY95l2pQ
	 qN7llj/K7lYPqktGk2IgIr0luMD7W21SVInSqvvKvMfuZx7GGgzDu/38wXrHchKlBI
	 mW4RhKSpgi0IBfsbiak0KnlDzajD7qO4+wYIX8wtRdTEasE/rZNtcqdkgxTdc/udfU
	 RD/1ss1OCeK4xjdco3O06oEA8eecxNZHkM5D/n28NcgNPB5Rmhe/XlHh+mRv3ZRu88
	 vvcSuYb6SEodgyl6CDvK41XJTy8moTRsIG5MYuv2nZzety/bsx17nejZhY+puwwShA
	 EHO8KKUg5MHBg==
Date: Sat, 7 Nov 2026 23:43:23 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: Michal Simek <michal.simek@amd.com>, Sai Krishna Potthuri
 <sai.krishna.potthuri@amd.com>, David Lechner <dlechner@baylibre.com>, Nuno
 =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, <linux-iio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <amitrkcian2002@gmail.com>
Subject: Re: [PATCH 4/6] iio: adc: versal-sysmon: add over-temperature alarm
 events
Message-ID: <20261107234323.0aef5ae0@jic23-hlaptop>
In-Reply-To: <20261102122112.1723130-5-amit.kumar-mahapatra@amd.com>
References: <20261102122112.1723130-1-amit.kumar-mahapatra@amd.com>
	<20261102122112.1723130-5-amit.kumar-mahapatra@amd.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 2 Nov 2026 17:51:10 +0530
Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com> wrote:

> The SysMon has two independent temperature comparators. The driver
> exposes only DEVICE_TEMP on interrupt bit 9; the over-temperature alarm
> on bit 8, with its own threshold pair at OT_TEMP_TH_LOWER and
> OT_TEMP_TH_UPPER, is not reported to userspace at all.
> 
> The two are structurally identical: an upper threshold, a lower
> threshold acting as the hysteresis floor, and a hysteresis mode bit in
> ALARM_CONFIG, bit 0 for OT and bit 1 for DEVICE_TEMP. Per AM006 the
> over-temperature shutdown response is a PMC function configured at
> design time, so the kernel's role here is threshold configuration and
> notification rather than acting on the alarm.
> 
> IIO identifies an event by channel, type and direction, and both
> comparators are rising thresholds on the same aggregate temperature, so
> they cannot share a channel. Add an event-only channel labelled "ot"
> carrying the OT thresholds.

So the reason we don't normally do multiple threshold levels is they
have minimal use for an IIO interface - as you've discovered they've
reported the same on the events interface.

If this wasn't an existing driver, the support of this is something that
would strongly push in favour of an hwmon driver where the concept of
warn and critical thresholds exists.  That's there precisely because
the critical is often wired to a pmic or similar.

However, that isn't normally a problem even in an IIO driver
because that threshold should be a design time concern with the
limits coming from firmware.   So why is this even settable by
userspace? Feels like an interface to create the bad type of smoke.

We have a few times discussed how we would perhaps add another
layer of indexing to events, but it is hard given the the compact
event codes and I'm not sure I'm seeing a usecase that justifies
that complexity here.

I also can't work out where your new channel turns up. What does
the userspace ABI look like for this and the existing event controls?

Thanks,

Jonathan


> 
> The channel is appended after the device tree derived channels because
> io-channels phandle arguments are raw array positions, and placing it
> earlier would silently repoint existing consumers. It is created only
> when the device has an interrupt, as without one it would carry no
> events.
> 
> Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
>
W
> @@ -880,6 +932,9 @@ static int sysmon_parse_fw(struct iio_dev *indio_dev, struct device *dev, int ir
>  
>  	num_static = ARRAY_SIZE(temp_channels);
>  	num_chan = size_add(num_temp, size_add(num_static, num_supply));
> +	/* The over-temperature channel exists only when events do */
> +	if (irq > 0)
> +		num_chan = size_add(num_chan, 1);
>  	sysmon_channels = devm_kcalloc(dev, num_chan, sizeof(*sysmon_channels), GFP_KERNEL);
>  	if (!sysmon_channels)
>  		return -ENOMEM;
> @@ -960,6 +1015,25 @@ static int sysmon_parse_fw(struct iio_dev *indio_dev, struct device *dev, int ir
>  		};
>  	}
>  
> +	/*
> +	 * Over-temperature alarm. The OT comparator watches the same
> +	 * aggregate temperature as channel 0 but against its own threshold
> +	 * pair, and IIO cannot express two rising thresholds on one channel.
> +	 * It has no reading of its own, so only event attributes and a label
> +	 * are exposed. Appended last, because io-channels phandle arguments
> +	 * are raw array positions and inserting it earlier would silently
> +	 * repoint every existing consumer.
> +	 */
> +	if (irq > 0)
> +		sysmon_channels[idx++] = (struct iio_chan_spec) {
> +			.type = IIO_TEMP,
> +			.indexed = 1,

indexed without an index? I'm not even sure what this
turns up as. There are already 4 indexed temperature channels
so why isn't this just landing on the index 0 one?

> +			.address = SYSMON_OT_TH_UP,
> +			.event_spec = sysmon_temp_events,
> +			.num_event_specs = ARRAY_SIZE(sysmon_temp_events),
> +			.datasheet_name = "ot",
> +		};
> +


