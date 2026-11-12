Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5BF606A336
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 10:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uCyMG9pK;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CLepS0hr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=jrsn/Px9lGsC8Eed1cY/Fr6R1aGVP1fP5cAXfFK6IWA=; b=uCyMG9pKeq7AEpU+cNHVdl+t+h
	0D9cHRZv/tCOA3lyjKsbFzlACSeK0xyAggq4/p42uO24p60XPoV4p2Jftd2LEgP2jNSWUwV6b7Ggg
	XQKwvRbwLabj+s7y4XL4o1OPqI4aKFZ1Ij/oB563GtANBSbk6NZAno6g4HtrQEwNAfTGlgVg2g8Zd
	H1FTi8sIIDEdp68Nt86LQTq6Ly/zTSZSaLmUtYZ2nz0enrhLa5JcXgOti3HXptdz4iQY0rIaBnkXa
	zPmgOX1K8qteq8Nn6EFYS9kcUTe6GlJkQcUWWWiK+N81eOI6yBppWRe37W6DrnybR3Sw/TqRGXwMR
	zkeZwZ5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRS0a-00000009WL8-1NX2;
	Thu, 12 Nov 2026 10:26:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRS0T-00000009WJ5-3cYN;
	Thu, 12 Nov 2026 10:26:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 01A7140745;
	Thu, 12 Nov 2026 10:26:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10C131F00A05;
	Thu, 12 Nov 2026 10:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794479172;
	bh=jrsn/Px9lGsC8Eed1cY/Fr6R1aGVP1fP5cAXfFK6IWA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=CLepS0hrcr5HCmxavHbh93S+IYBwrHV7A2D0Mu/zPVe/88mTxLHfgxtqyZG9Vp8p6
	 H3koPlgsTVMp6EZxukeKNd0imL0av/Azweye5C75tr6vvpXddeUqDRHya9QMdw8L2L
	 ebnPgMesY2xYHFr2R3VK/xx/NR7uf/Pth3H8asUozDIlVs9IPfFCgRkO/zjrYfVDYl
	 vejHJHA02OiWFVw9f6W+WC/OtMF0QmDDbcbbSZZa0FohfE06x2vDnSHYoDxwdKAMq2
	 BZ3QlBB8aUO8uyOXz/UnJjK/H9rGF69T7ID0WBqF+LbyUvIFPP1YElZJ0+6t6npl4s
	 3PRmJmudQ0boA==
From: Thomas Gleixner <tglx@kernel.org>
To: Igor Velkov <iav@iav.lv>
Cc: John Stultz <jstultz@google.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Neil
 Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
 <khilman@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Miroslav Lichvar
 <mlichvar@redhat.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Igor Velkov <iav@iav.lv>
Subject: Re: [PATCH RFC 2/3] alarmtimer: Choose the wakeup RTC by sleep
 state and priority
In-Reply-To: <20261111-re-tglx-alarmtimer-rfc2@iav.lv>
References: <20261104-b4-alarmtimer-rtc-priority-v1-0-e996681b8086@iav.lv>
 <20261104-b4-alarmtimer-rtc-priority-v1-2-e996681b8086@iav.lv>
 <87qzgsth2g.ffs@fw13> <20261111-re-tglx-alarmtimer-rfc2@iav.lv>
Date: Thu, 12 Nov 2026 11:26:09 +0100
Message-ID: <878q2ytkfy.ffs@fw13>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
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

On Wed, Nov 11 2026 at 01:50, Igor Velkov wrote:
> On Wed, Nov 11 2026 at 00:14, Thomas Gleixner wrote:
>> So this gets _ONE_ suspend() and _ONE_ resume() call and nothing more
>> and everything falls in place and is comprehensible, no?
>
> Thanks, that is much simpler. v2 will first replace the freezer_delta
> handling as you sketched, then add the per-state wakeup_ctl with one
> pseudo device and no priority, and reject suspend into a state without
> an RTC while an alarm is armed. It will be based on tip timers/core and
> follow the tip style. I'll also check whether user space looks up the
> alarmtimer device.

You want to structure this nicely into $N patches:

    1) Provide and use alarmtimer_has_rtcdev()

       Just check !!READ_ONCE(rtcdev)

       Convert the one lonely user outside of the core code and the core
       code itself. Replace the few users which actually need the
       pointer and do the read directly there.

    2) Move the static variables into struct wakeup_ctl

    3) Replace the freezer delta handling

    4) Switch to the pseudo platform device

    5) Convert the rtcdev storage to an array and implement a stub
       parser which returns STATES_ALL.

    6) Add the actual device tree parser logic, which enables the whole
       thing.

That makes it easy to review and bisect.

For #4 you might think about doing the following:

	for (int state = 0; i < ARRAY_SIZE(state_names); state++) {
        	if (!state_names[state])
                	continue;
         	sysfs_create_link(&wakeup_ctl->pdev->dev.kobj,
                                  &dev->kobj, state_names[state];
        }

which creates symlinks in

/sys/devices/platform/alarmtimer.0.auto/

        freeze -> ../../pci0000:00/0000:00:1f.0/PNP0B00:00/rtc/rtc0
        mem -> ../../pci0000:00/0000:00:1f.0/PNP0B00:00/rtc/rtc0
        standby -> ../../pci0000:00/0000:00:1f.0/PNP0B00:00/rtc/rtc0

and in #5 this becomes:

	for_each_set_bit(state, &states, PM_SUSPEND_MAX) {
		wakeup_ctl.rtcs[state] = dev;
         	sysfs_create_link(&wakeup_ctl->pdev->dev.kobj,
                                  &dev->kobj, state_names[state];
        }

so the symlinks point to the device which is assigned to a state. That
gives at least some insight into the actual assignments on systmes which
need more than one RTC to wake up.

Thanks,

        tglx




