Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91345606A89F
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 03:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pXm9k9So;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=UtiLhEwj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3a+9UrHFnp0GCYUcXwgUcuHkUgb2iyxD30t2rDDa9ak=; b=pXm9k9SoN10bqm
	mLmhQuCEFnGLct420ltYFCaDqkiCph5Hxr536aZkNh6Golf0Kq0tE/Gz0mbmi+Ex7kJKYmW9PkmOS
	JOv6NLr5DSiCqCYxvyaV4kwTVF4jUsYrQL1cCGa65iU31g319lEWf//FZVsHsA6TrK4rJgof1qzSR
	X/7qH3+9XHWKVkGpwWV8hIckZxM6slNbPwDGXYRkjSXPh/ZeKfDdV/CKMeYyJs5XPQx3KtoIFZFJU
	LkT7Mpal1XSNlJYdg16s2aSgxHDBgXAppJyfr7OUFNSwrKOjwdSMFvV3KP/Qcom5Ok9pIIORovniL
	6CWNgBkfnnhFw8z0neIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS4Za-0000000FIHU-3bRx;
	Sat, 14 Nov 2026 03:37:02 +0000
Received: from mail-pj1-x1062.google.com ([2607:f8b0:4864:20::1062])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS4ZY-0000000FIH8-0lRj
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 03:37:01 +0000
Received: by mail-pj1-x1062.google.com with SMTP id 98e67ed59e1d1-3adac5c10e3so893134a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 19:36:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794627419; x=1795232219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3a+9UrHFnp0GCYUcXwgUcuHkUgb2iyxD30t2rDDa9ak=;
        b=fOicxMHtaZpsjpbc2WfoWVkMUBXtlAgMCPJ3XY+AwK9fvL/NFgcrI6vt57UnIhHAbb
         1lvkIbZgqbIhEeC3CJzsUiV2RszJOZbkUM7xPpQDgbUu6NW3d6iBTsPD0DzaFok4Ion7
         U7ps4ewXs9ZbO0AGt5WJel63bxQ1kGaKEXxqDCi70dPuGK7g9d09dup0CzcbpUjD8o0U
         ZmWFv7OyqmqdNN8Dbn53vt0Nocjt+psLu8pripayHUtb+xWmHCp3fGoYgYjWDmzKEice
         vE4UiNbLPr1D3yixY46cvqPK93gT7HZFdudbYTSvV3h3gPsQ69rDWtBumG1Y9fAoJZml
         8VmQ==
X-Forwarded-Encrypted: i=1; AL+hErFchy7crG9mZ3uvoe0nomGxdwNEv9lut+5+TjEPCbFzG+cJcwJfQR/99wQy/wD+pbDIej7hB+1WIrLJEPaQh9g9@lists.infradead.org
X-Gm-Message-State: APuU4Z+s/hL/YtqUA/QsHr2oxk3ba6P2XWZPzfBcCHERPfJbY6QVgSuA
	KT0FroArgBJHhFd6FAQ9cWn+XMqgjBixhtsFil1MbeXAkgWwqltfgwebhT+p/qVeH5PmXM65Fmu
	wS2pP/SSp2Vc2+N2a2pr558mtYoI6MuTvbsHxv4fo1l33oFTgfXT+u9Jwdhq8pQrEVHs4QTTTIC
	R9VypVIwHpRxZXMSICASE7J7l0PJcHdtsMj9kLmBqqDjgVpHWh8jfukd8ypHUzFZEqGUmfMJdIu
	JE5SJwqdmBKqo3YhawRqPO3Y9+6aJBMStM=
X-Gm-Gg: AYBFou2GyzoJm9SnFiSyGuCD7b6Ofj4wQfTMTi2QNvk0xd8NUCpg8X1JJLi0UvqNCqJ
	e7ZoooZPGwLUYjjYfRDCGxsUEzFAsNmu/4cGxZ4VBPwGMvvqc5P8lfxDO2rbyD5k81hUD4gRwyJ
	IeRr6REa4w2p4yrF7gGRYDhl569qRsCl6dow3OCJqKqObAG7uFnTAOB40qrQP5xPiM2yF/B/FDc
	Mc8VKWXaeLmPtboYyCDSHD4RtNZ4ImIl7DFEyhhdtdr4lSwGYyuhod5I/KCWvZTKvsAGl/xVP33
	Qe3GBKaoREX45BX9LP1YsEu4ii5LMz5ohXpFadBhCVQbuQWPngliC393ru0u0w78+9QTpYEAJzW
	9L2IiInyvQ64pk3gRXdGZV6Kxu1UiQC9JJrobTFR3nQ6LKn0zLfTPUoWmRJhh0aS6v74SRyeMG2
	CZB5IP87Ns0wlaMF0v4bZ9jHrWVDinI+3nDRzBmpHS
X-Received: by 2002:a17:90a:c88b:b0:3ac:7449:40b4 with SMTP id 98e67ed59e1d1-3b1b0b5316cmr4529055a91.45.1794627419317;
        Fri, 13 Nov 2026 19:36:59 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b197ca0af1sm8877831a91.3.2026.11.13.19.36.58
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:36:59 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-37549877380so2079534eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 19:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794627410; x=1795232210; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3a+9UrHFnp0GCYUcXwgUcuHkUgb2iyxD30t2rDDa9ak=;
        b=UtiLhEwjwE/fL9JcV+A8bkdOK22cUHihB/TI9ATx8ThFIkUcoz6quJOH2/1Oy0UgAu
         mZvDkKAuS4+DHCOl3oLWPHzehjSP9uq8Rvm+WqoVFU9ptEZ6G98aKg4d/iXGK+Z0EmAo
         jOTDI9L4L8tarQY+smF+4Wl/ZyQVG+5Y77rCU=
X-Forwarded-Encrypted: i=1; AL+hErFwp9CHDWJh0mbPVEC5jVYn5Bpzxy4ph1etMMvda6UNsaK/XXjJJ4y1OazK4gidcyL+sn9MMCK0gNXRzIIpTTjy@lists.infradead.org
X-Received: by 2002:a05:7301:1506:b0:36d:394d:e690 with SMTP id 5a478bee46e88-37969089a16mr3722070eec.40.1794627410044;
        Fri, 13 Nov 2026 19:36:50 -0800 (PST)
X-Received: by 2002:a05:7301:1506:b0:36d:394d:e690 with SMTP id 5a478bee46e88-37969089a16mr3722036eec.40.1794627409340;
        Fri, 13 Nov 2026 19:36:49 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3797f98b9b2sm11532824eec.6.2026.11.13.19.36.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:36:48 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Martin Wetterwald <martin@wetterwald.eu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Gaston Gonzalez <gascoar@gmail.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Phil Elwell <phil@raspberrypi.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <uajain@igalia.com>,
	Kees Cook <kees@kernel.org>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH v2] platform/raspberrypi: vchiq: register bus at subsys_initcall
Date: Fri, 13 Nov 2026 19:36:47 -0800
Message-ID: <20261114033647.876683-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261022082927.59030-1-martin@wetterwald.eu>
References: <CAFERDQ0FpdVvA5VJxOyRAE_pgxnPVmFx1tkZio5R272j6Bs4tg@mail.gmail.com> <20261022082927.59030-1-martin@wetterwald.eu>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_193700_220344_C4DCDBDA 
X-CRM114-Status: GOOD (  15.23  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Florian Fainelli <f.fainelli@gmail.com>

On Thu, 22 Oct 2026 10:29:24 +0200, Martin Wetterwald <martin@wetterwald.eu> wrote:
> Since 6.19-rc1, with CONFIG_BCM2835_VCHIQ=y and CONFIG_SND_BCM2835=y
> (both builtin), the sound cards bcm2835_headphones and bcm2835_hdmi are
> not detected anymore (vc4-hdmi is not affected).
> 
> dmesg shows:
> 
>   Driver 'bcm2835-audio' was unable to register with bus_type
>   'vchiq-bus' because the bus was not initialized.
> 
> Since the VCHIQ interface was moved out of staging, its bus is no longer
> guaranteed to be registered before its client drivers. bcm2835-audio,
> still in drivers/staging, registers at device_initcall level and now
> runs first.
> 
> Register the bus and the platform driver at subsys_initcall so the bus
> exists before any client driver, independently of link order. The
> platform driver probe already returns -EPROBE_DEFER while the firmware
> is not ready, so probing earlier is safe. When built as modules, this is
> equivalent to module_init() and nothing changes.
> 
> Tested on Raspberry Pi 1B rev2, 1B+, 2B, 3B and 4B with VCHIQ and
> bcm2835-audio both builtin and both as modules.
> 
> Cc: stable@vger.kernel.org
> Fixes: aa125180c673 ("platform/raspberrypi: Destage VCHIQ interface")
> Reported-by: Martin Wetterwald <martin@wetterwald.eu>
> Closes: https://lore.kernel.org/r/CAFERDQ0FpdVvA5VJxOyRAE_pgxnPVmFx1tkZio5R272j6Bs4tg@mail.gmail.com/
> Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>
> Tested-by: Gaston Gonzalez <gascoar@gmail.com> # Raspberry Pi Zero
> Signed-off-by: Martin Wetterwald <martin@wetterwald.eu>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/drivers/fixes, thanks!
--
Florian

