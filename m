Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E1D606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 10:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zuyizStY;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cp+B0IAK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=j1Jaxi0epvM9H+YYF/12BTxgHO0xd6ENCQ22SVFOz5I=; b=zuyizStYNITTQv
	hIHack/NtvFzFBHM2NuxqppseXjLnsRv+hnewIr8VMMP+zNH1WhB4EzDLS9XCDIrrykLqdN7FG7pX
	XTNgojFcJpAzZ+9ZhyXcWihcgYontJRl0qqIHJhIBXQmUeAJQEktB4BGeGt7j56KYMDAh3+nNrMvu
	jWVzauKPv2/bYbZ+H0ONLXdzmSk+yC/1SbwHukb6qyaHTES7mFnW5h2++R4Q65gGRxqGpmu9p6jCG
	XSO3N+/cDou2LmFJC8/SYgb9FPi4aPsYt5dvz64l2ToG+R1WYEMRxDGhMSGYyAofl1nUSuM+jvGgL
	jfy8Ci+y4tBWxLA7uXDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWA5c-00000009R0E-3kVH;
	Wed, 25 Nov 2026 10:19:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWA5b-00000009R06-2LGA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 10:18:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A39EF609D0
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 10:18:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A59DD1F000C6;
	Wed, 25 Nov 2026 10:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795601938;
	bh=j1Jaxi0epvM9H+YYF/12BTxgHO0xd6ENCQ22SVFOz5I=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=cp+B0IAKkRiSOe8pzJt6jymekkpELUyzbmJDzWjRiLEzcEmYB2tvPiryx/Yx0K4j7
	 mg3mP1DtFbccR84P/lULFwNIyjU+71Ug3HZYiPZeq6p1r7kzSIt9e4beCpq0YHqQjc
	 sAPm0TTKPp7rznAKUMibfAMt0pzgtEQ17LRMxRX2FwmPuOHT6CZm9P6FP5F0XLnRfr
	 PNqHoH0JfwaUZ05fRc2KWzBDiCBZhnkm9Xc3N/jKj307I0thn9D25Ewjaz1jDdZ9hd
	 JouaM1zvJ9k+ggeDEWermwXbr2pjdXRI7ZIA6opD0AgGsp8TanZkRe8T9lubbqq4LD
	 2NTAixu0wmadA==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id CAEC0198004A;
	Wed, 25 Nov 2026 05:18:55 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Wed, 25 Nov 2026 05:18:55 -0500
X-ME-Sender: <xms:DrYGa6su6Fci7WUzdFv7ppurMNBaCYf7xkftjkTQV774M1_43RieOw>
    <xme:DrYGa6RU_DKuTrePpL69JhvupdjXEspbE8YsRn-jVZKpJMAAecQpiqt5N9pVrJ5I2
    cZX7dUsGsUK4QQrume3BUkcFRzTuGKTAT4Y8I40koR24eZJNoYOsGY>
X-ME-Proxy-Cause: dmFkZTFHDZDnOUlJqJalGnpIdslxvPBgSXFSsXnpVmsMn/ny03M8fWSB66rN+A7/KdD8Wa
    oTMQVIOxvcVk6Jz0kx0i7epOSEpikyljFIJGS6lhIWkETnywGQ2ebjRxyud2a6oXHG4pRP
    CCc3GC4/VjwYNmIlqBIU0JoWeOVagKvXHBaxWQDlI790m3BpHaOLHZy8iqcA+E5V4XUH2S
    TKwgaCBWoIGcbkKtnAzfSGi08CntENpiE3gpxPMcdrhRIFgHpxsK6OR3+L4qx66nu8Gb8L
    5qxGNyEROZSOo/pDRZo1/6+0klc73BJo+X09xsvJNr7rA1OGV1hdrjlMOKUHd5hgT1vWhN
    tCLEkDcNL8qsLDpIlyu68iA0ymNgFQJboGxtlS8r2EV0ysTOECQTtPbi1rNJnSCfa0iU0w
    h/nPKf0ty5HdZdtgo2t14dUyV0Clk29d0UEeCrdblUIIKYV+nMNQ+EAGZXci44YKfCRN+Z
    0AjNg2j+2VyKMKM6kcNsiKKEkH7In1HwRPCEoeZGMzRk9JBxxlWL6+HAvwsoeJRV6yRxDA
    j7tfYiyTri1ylZE+SLLSjdRuWreIqjXoVYvJ8sAKZ6T7MUn2WkYwirwOynewlh6Fbg1F1T
    HgBSSA5eJ+iqxzIkekghTSm795y2tay6XvunBiL4ZQjrE/e45B5lEB917PTw
X-ME-Proxy: <xmx:D7YGa045Puw495Fn4NfS0CC2PCZow3CsCzEZxEboSBY-ovBcCehaLQ>
    <xmx:D7YGa-3T3vl4gIJ6vSdShfV8eVk2Myt-ndW7O0MgVFbNthRqwAHbIA>
    <xmx:D7YGa_Bx_NArmiab6lEUh9Mi-J-_v1ICAyqdHYhRvYMTCkSqV20uBQ>
    <xmx:D7YGa5Nki-oSxhH2UoIiKDRshn_E8ZZ1AY3oon5im0vprNc60ICuZw>
    <xmx:D7YGa0Y__ZOngtMIu3sgRuTZd2BuGTMljQAxjOZaILPisgSYltHM0vma>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 59A9832A0099; Wed, 25 Nov 2026 05:18:54 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ThreadId: AY4jvdWTtgU7
Date: Wed, 25 Nov 2026 11:17:09 +0100
From: "Arnd Bergmann" <arnd@kernel.org>
To: "Brad Hawthorne" <brad@sim.vu>, "Yoshifumi SHU" <envzhu@gmail.com>,
 "Linus Walleij" <linusw@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Message-Id: <f72246fa-48f5-4f23-a2ba-8a136c96726e@app.fastmail.com>
In-Reply-To: <20261122003911.1203777-1-brad@sim.vu>
References: <20260914140821.1805449-1-arnd@kernel.org>
 <17a74e90-27d1-4954-86a8-491267f00cb8@gmail.com>
 <CAD++jL=VJsnk-GzAvR4oR8oKJayQzq9Oes+ZW7K=iHGrQ1jh0w@mail.gmail.com>
 <20261122003911.1203777-1-brad@sim.vu>
Subject: Re: [PATCH v2 00/14] ARM: deprecated platform removal
Content-Type: text/plain
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Nov 22, 2026, at 01:37, Brad Hawthorne wrote:
>
> Arnd, one question about the plan for the CPUs. After the 7.5
> removals, nothing in-tree selects ARM_SINGLE_ARMV7M but !MMU itself,
> and no board's device tree uses the v7-M core; Yoshifumi's boards and
> mine are out of tree. Would a small RP2350 platform (DT, timer, clocks,
> resets, watchdog), run on hardware for each -rc, be a welcome in-tree
> user of CPU_V7M, or would you rather keep the core with no platform
> and boards out of tree? I'd hold the platform series until the core
> question is settled either way.

Hi Brad,

Overall my feeling is that Arm NOMMU support has no future
in mainline kernels, based on conversations I've had with kernel
memory management maintainers (who overwhelmingly would prefer to
have it removed years ago) and the maintainers of the currently
supported NOMMU platforms.

Obviously we do care about users of the existing platforms that
may still have requirements for kernel upgrades and appreciate
any bugfixes you can send, but new platform code would just be
a liability at this point, so please keep that out of tree and
try to come up with a migration plan for your downstream users.

I think your best options are:

- linux-7.3 is most likely going to be the last LTS kernel with
  Arm NOMMU support, so I would advise to move any production
  systems to that version but no later. This way there are
  at least two more years of security fixes. As you have noticed,
  the NOMMU support has its own set of bugs and you may already
  be on your own for those fixes, but would at least receive
  updates for common kernel issues.

- The SoC itself seems to have reasonable support in both
  upstream Zephyr and the Raspberry Pi downstream fork of
  FreeRTOS, both of which are generally a better fit for
  this type of hardware and may be able to include support
  for this board as well.

- As the chip also has RISC-V cores (also without MMU as I
  understand), you may be able to run Linux on those.
  I expect this also to go away in the long run, but it
  may give you an extra LTS release compared to the Arm
  cores in case that makes a difference for the timeline
  to convert to another operating system altogether.

- If you have users that require more than two or three
  years of security updates for existing products and are
  unable to port their applications to another OS during
  that time, let us know what the specific requirements are.
  There are companies like emcraft that specialize in this
  type of workload and may be able to offer paid support
  beyond the official life of the 7.3LTS kernel.

      Arnd

