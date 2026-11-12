Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5FA606A8B6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 08:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=N8qjXLs1;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VeMnwYi3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ig8TOwEwu93oj/vlPs1jDWfcC/HjbbLnhomiuGEjcu0=; b=N8qjXLs1KewVo+
	vxqDaKIiq+VtR334z4I36ouzALFmwH41Q80xKwBjK9X8pjtR8X5iDJ5JlHd/G2CRgHuYlVVoJgY/5
	iRiKaLopwkYK+CweBOznMr18/VWS+bwXG8QwCEw390FUd2UM4TdGQzbwxRUbfPSYGRixuVf/kmsax
	AWC+zJ/TEbtymSgRvURolJrZDSTtFtcUseClWecBSIwoATpZkBrviKfk8pjzt94HMtvhnW31JbWD3
	kOBFDLBQG6cO0GRzau5l5xB+6kbDmMYgDKYDs3nhHQPj96188K5PGk0mioZka7kDm3wuPgbCDDFfw
	QZLCvUrREDQ2eBOoe2Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQOh-00000009CtB-3kDW;
	Thu, 12 Nov 2026 08:43:07 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQL4-00000009BK5-2Rff
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 08:39:46 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-5c05727a58aso103472e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 00:39:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794472760; cv=none;
        d=google.com; s=arc-20260327;
        b=ht6SvofZdNrrqJoeZ7+hVEytae2HEgtsKJcBl+4WxBT938rl2HPuEIMcGD6ajf+KGE
         pKdFHGtuxmPLENljNo7Hb/St2hBRTLPlo7vs8MKXscEPon3sh03duPhq+Z7prBJkGLwu
         OAskTj8ibtCb+57xtcf75rwtgeR/P8yLJrBecn9pxTCAg31xHZnNAklogkXBNX8MW8PN
         niEPCdjfcJG215tk82HK+73FRI60U87A3RopS91S9XBlbJEgaBPrJZaHoeQQj8NxJp0i
         0VMXhQmORugv1EqBdMf/B84UpdUmp8s9fhvYpWGWQyURDrUtuNcrUlEfNgQ0Es9xdaar
         6EvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ig8TOwEwu93oj/vlPs1jDWfcC/HjbbLnhomiuGEjcu0=;
        fh=ecaU3r1cpleVeoJ6Op9soD/ys206YGywfNqgSivzI8g=;
        b=eZJGxvu83T3ZIIEMU53lUYZ5/52dVKuUNqARVQhywbZhwkzeoqJywMutCZS8f7aNcd
         6hfpOsvLnDuBaOl0d6gXO/bSQBFD2Eyzpd89+mmdrx6DPxJ+v8ieXXp+PcxtVJBQFADg
         Wma60mIQVC11VCdBklol8dsOPHns9NA6g2qZsMPhSdxbxeIXZmSBkV3LgJnvGAAJSpQq
         7QxfvcnEoM0nEQDsA65w7zem+sJwKf6BJ/dU+V9eYpBpuvDko7nIzku7nnOGqtsth3xC
         abCX6VnYoGfiANUFK1lKA/0M1AKMSlhLpnGsAQBuSg3wkPaC6grfUzk4JWOw1Tqd7yWc
         3Yjg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794472760; x=1795077560; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ig8TOwEwu93oj/vlPs1jDWfcC/HjbbLnhomiuGEjcu0=;
        b=VeMnwYi38fFtKuUe0bVv9fEoYygDo6yaLkGc9Kbg0g6DnFixnAiV8ZJcZpYOAptC0O
         4MXNqIUct9GKvzbI4HQHxc9xRyBIf5azaZwgKyQ2sDX6MjaT6aOoBNoXdmM30rCP5fT+
         Uf3jhIVXhgJu80BOduiEr0v3hZ8BwZA9+jG6L7AVPgva9ucf8YxdrNju9vrRNefmV94w
         u85TAEageYJgsz7/OJjJwi1M175GLFfjxbnHu0VrINziSZJWz4P4pXfUEfGI5NAvr6VG
         +aMzVeqJL5yDM2PhLe5BxSItmKv01G+PVle4ZUq3ClQzHULmJktgGVxCm05Mq7WPAiJM
         IBFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794472760; x=1795077560;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ig8TOwEwu93oj/vlPs1jDWfcC/HjbbLnhomiuGEjcu0=;
        b=qcQ1DmXW/6BWzFE0hbNBu1yBVDKcT7R9qu2xbnTZnDmLv5sl7SkdO90qMkqcTHDOJo
         xeKkBe92UMHo7RlK5fPfd7rO7hgMNTK8kj4H8ks9NdQvcT7F34UJEtXYkYF9InXOmCeL
         6tyu1hN9NjoGD9AdTIXEwPMSxdf6BLMbtVXjxv4N4AVSBFjuJ0UEnQRVi754rDhOz01+
         UiTCRLOxAbarxhRjOGkG0ImbpjGTQZaPl2ZtPGGCIPyEUUYzHiKUZpcT2m3LTrvOu5vp
         cKPyKW3nZkGOWxXDJSwe5scKz/rygZF61zoJTOgepgfGTincF6IbolD4T1tvJUiVUzZd
         vOIA==
X-Forwarded-Encrypted: i=1; AL+hErEU9H//LAEwkzNW5lD7fBtk4VgGxphUVoSLVH1pPUlXbSob0PcsWc0hfFEGXLI9CelSVZ5T5E/130YPPVy3deXE@lists.infradead.org
X-Gm-Message-State: APuU4Z84y1s7oEeDJUAJLHUXOxowjETfafBE9Teym3A4AkzIsYSFFH4P
	BdTuGGW0hlu9X20xAycksh4H5/4HwFxsDL+tsRaS/YeKFu5WEGg1UZ5nE9r+lhnt5sKagUVcVsF
	wdYPGUKjKslt0dH2aif+fH8TL9RAz54Q=
X-Gm-Gg: AYBFou2BLnuhXaRn/HeRzQvsSp5MNucwelpu/v7SRfXjCicDycG9Yhuwh/W+Ish+p3F
	n898vjUtrLXlqEBPH306Gojoms6kXt7H2yRE2CeaotsiwzC0whwWCp8JXjx50o61aBSgaaStHfe
	cYG7yWg41rdYm9J51Ao9ZtVYrzG93eG7ikapWY72Eiy5WFr9v5WJbXr4tNHMvLNgXHSHsbKVPU3
	6CJSBMeH4Kjg0DUAbxw4lI8XGn+aJgIhuuDS/nOgxqVIkqKs679VWyjfiaDr/oxjYW6yugXu/45
	unFaHeNsHhBCO6Y+rQPB/w5srtOj5s19jCbFArNL6pDeN981CNfKbV+rxrzzWP4e6440pz/BObc
	sKZAxhbYjhSszmTXEfkVvn3voeXP0NLmQkDQ0YsJoiwL3iU0uBhgEXNyxxnlZWDYFP4pi4DM=
X-Received: by 2002:ac2:51c8:0:b0:5c1:57ce:d4b4 with SMTP id
 2adb3069b0e04-5c15d5f7848mr1986848e87.2.1794472760172; Thu, 12 Nov 2026
 00:39:20 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261112-dwc3-s2idle-optin-v1-0-842e3f8413d0@gmail.com>
In-Reply-To: <20261112-dwc3-s2idle-optin-v1-0-842e3f8413d0@gmail.com>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Thu, 12 Nov 2026 00:39:08 -0800
X-Gm-Features: AclHuK-LsUOtbUqqsSLc1VRlkuatKOgx5pOiztBW2KXQJW8AeA8OYEhVHHOWdbc
Message-ID: <CAEy9hNXag+0ssyuc9U9vSLqUS3jv=xKAaPkegR3W3Lyqma=1TA@mail.gmail.com>
Subject: Re: [PATCH RFC 0/2] usb: dwc3: Let the Rockchip glue keep the host
 bus across suspend-to-idle
To: aiyengar1990@gmail.com
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Heiko Stuebner <heiko@sntech.de>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, Joonhoe Kim <26rote@gmail.com>, 
	Vladyslav Tymoshchuk <tvlad744@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_003924_668211_D8B63522 
X-CRM114-Status: GOOD (  37.21  )
X-Spam-Score: -0.8 (/)
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
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Please drop this series.

In host mode, patch 1 duplicates Joonhoe Kim's earlier "usb: dwc3:
tell xHCI that it lost its state when the core is powered off" [1],
which I only found after sending. I have tested it on an Orange Pi 5
(RK3588S), with the core teardown forced so that it takes the same
path as that patch alone: 10 of 10 suspend-to-idle cycles with the
core powered off recover without "xHC error in resume". Please take
it instead.

Patch 2 is not safe as a default for every dwc3 host (Sashiko's review
of it holds). I have reworked it as an opt-in that a glue driver sets,
used by the Rockchip glue for RK3588 only, and posted it as an RFC on
top of Sebastian Reichel's Rockchip glue series and Joonhoe's patch:
https://lore.kernel.org/r/20261112-dwc3-s2idle-optin-v1-0-842e3f8413d0@gmai=
l.com

[1] https://lore.kernel.org/r/20260929130252.869-1-26rote@gmail.com

Arun

On Thu, Nov 12, 2026 at 12:35=E2=80=AFAM Arun Iyengar via B4 Relay
<devnull+aiyengar1990.gmail.com@kernel.org> wrote:
>
> In host mode, dwc3 tears the core down for system suspend unless the
> controller is a wakeup source. On RK3588 that ends the power session of
> every suspended USB device in suspend-to-idle: on an Orange Pi 5 a
> SanDisk Extreme drive on the Type-A USB3 port and a card reader behind a
> USB3 hub are disconnected and enumerated again after every resume, which
> kills a filesystem mounted on them. With the bus kept suspended they
> resume from U3 in milliseconds.
>
> Patch 2 of v1 [1] kept the host core in suspend-to-idle for every dwc3
> host. Sashiko found three ways in which that breaks other platforms, and
> all three hold on usb-next:
> - legacy glue drivers still act in their own suspend callbacks in
>   suspend-to-idle (dwc3-of-simple asserts its resets on rk3399,
>   dwc3-meson-g12a powers the PHYs off, dwc3-exynos switches its supplies
>   off), so the core would skip the re-init on a reset controller;
> - dwc3-google asserts its resets unless wakeup is enabled;
> - genpd keeps a domain on for a device on the awake path only with
>   GENPD_FLAG_ACTIVE_WAKEUP, which e.g. RK3568 PD_PIPE does not set.
>   Vladyslav Tymoshchuk has since seen this one on hardware [2]: on
>   SM8750 the USB GDSCs lack the flag, genpd powers them off in
>   suspend-to-idle and the xHCI dies on resume, already on the existing
>   wakeup path.
> Commit c4a5153e87fd ("usb: dwc3: core: Power-off core/PHYs on
> system_suspend in host mode") also made the teardown deliberate, so
> that the PHYs can be powered off. Thanks to Sashiko for the review and
> to Vladyslav for the test on SM8750.
>
> This version makes it an opt-in instead: patch 1 adds
> keep_host_bus_in_s2idle to dwc3_properties for the glue to set, and
> patch 2 sets it in the Rockchip glue for RK3588 only, whose PD_USB has
> GENPD_FLAG_ACTIVE_WAKEUP. Nothing changes for any other platform, nor
> for suspend-to-RAM and hibernation.
>
> It is an RFC because it depends on two postings that are not merged:
> - Sebastian Reichel's Rockchip dwc3 glue driver, v18 [3]; patch 2 is on
>   top of it.
> - Joonhoe Kim's "usb: dwc3: tell xHCI that it lost its state when the
>   core is powered off" [4]; patch 1 uses its xhci_power_lost flag to
>   re-initialise the core on resume exactly when suspend tore it down.
>   In host mode it does the same as patch 1 of v1 [1], which I withdrew
>   in its favour.
> The base is usb-next (v7.4-rc1) with [3] and [4] applied.
>
> Tested on an Orange Pi 5 (RK3588S, no wakeup source) with the code of
> this series on top of [3] and [4] in a v7.3-based kernel, 50
> suspend-to-idle cycles through rtcwake. Both dwc3 controllers of the
> board run on the Rockchip glue: USB3OTG2 (no power domain) with a
> SanDisk Extreme drive on the Type-A port, and USB3OTG0 (in PD_USB) with
> the USB 2.0 billboard device behind the Type-C port.
> - Bus kept (this series), 40 of 40 cycles: the same USB bus and device
>   numbers before and after resume; no "root hub lost power", no "xHC
>   error in resume", no disconnect, re-enumeration or "reset
>   SuperSpeed", no WARNING/BUG/Oops; the drive was readable after every
>   resume (64 MiB direct read).
> - Core torn down as without the opt-in (forced with a test-only module
>   parameter that is not part of this series), 10 of 10 cycles: all
>   root hubs reported "root hub lost power or was reset" (80 lines), no
>   "xHC error in resume" thanks to [4], no WARNING/BUG/Oops; the drive
>   was disconnected and enumerated again on every resume, which is what
>   this series avoids.
> Not tested: RK3576 (left unchanged), USB3OTG1 (not on the RK3588S),
> suspend-to-RAM (not run with this series; the opt-in does not apply
> there).
>
> [1] https://lore.kernel.org/r/20261110-dwc3-s2idle-v1-0-2ef4cc3f8130@gmai=
l.com
> [2] https://lore.kernel.org/r/20261111121556.1871-1-tvlad744@gmail.com
> [3] https://lore.kernel.org/r/20261021-b4-rockchip-dwc3-rockchip-glue-v18=
-0-60000d03fca2@collabora.com
> [4] https://lore.kernel.org/r/20260929130252.869-1-26rote@gmail.com
>
> This series was developed with Claude (Anthropic) as a coding assistant:
> it wrote the code and the commit messages, and I reviewed and tested it
> as described above.
>
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
> Arun Iyengar (2):
>       usb: dwc3: Let the glue keep the host bus suspended across suspend-=
to-idle
>       usb: dwc3: rockchip: Keep the host bus across suspend-to-idle on RK=
3588
>
>  drivers/usb/dwc3/core.c          | 41 ++++++++++++++++++++++++++++++++++=
++----
>  drivers/usb/dwc3/core.h          |  3 +++
>  drivers/usb/dwc3/dwc3-rockchip.c | 10 ++++++++++
>  drivers/usb/dwc3/glue.h          |  7 +++++++
>  4 files changed, 57 insertions(+), 4 deletions(-)
> ---
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> change-id: 20261110-dwc3-s2idle-optin-1e3021adb650
> prerequisite-message-id: <20261021-b4-rockchip-dwc3-rockchip-glue-v18-0-6=
0000d03fca2@collabora.com>
> prerequisite-patch-id: 4fa3aae8ccfa5383522070179c8777302411082c
> prerequisite-patch-id: db09b4f5b0cffc1d5bf098fbdebb06b8be448fb7
> prerequisite-patch-id: c2e1c453454a7589a691fe391dc79e86f09ca7b7
> prerequisite-patch-id: dadeaf9e369e04d8b3329493a1a0756ddd6140f0
> prerequisite-patch-id: aa0125edb604ecf704a69250cc0d693013a977c9
> prerequisite-patch-id: 62b492b7b6e9957282f1029a02aaf258b63e990f
> prerequisite-patch-id: fcc7dd5dcd583913f91bf9986b0137c2930d2200
> prerequisite-message-id: <20260929130252.869-1-26rote@gmail.com>
> prerequisite-patch-id: 34a5a2c638a729bde49c06a330bf0847bf17e5e9
>
> Best regards,
> --
> Arun Iyengar <aiyengar1990@gmail.com>
>
>

