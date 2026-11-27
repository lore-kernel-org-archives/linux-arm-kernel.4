Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82EF8606A33B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 20:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=a5eqhjO8;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MQXNy4Np
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=EO5k6n/37i6TdunZgGiZGXGdx4jOGbhNEYDu4cn2rWw=; b=a5eqhjO8iKwCHkK0VuTWNgAEre
	amb/Yq2aP2jgdrbBXQ5hFGMtBwXyHu2/XwklzQYlgV6ZkeU+c8j57u49r9uP9LxKvGhlCG9+enbR1
	5YizhuE2EGI+ysalvBWzr3Jc2FC/fw+/qC/Nh9Ovp9qPtGhxzFTd280FGLZ/8aI73ViUFT/8ka+/z
	5hYfdKrsrTdSwvITNN5BX36DpUzzc9tzVaEa7RenNdi4J6lXU9LgQdoeMbmAh998ictJLWrITBXFw
	rnpY9xhGh0SpP1u6Gf2QWdKuFFB/P2M0YR4+aY94yTM4xHw7BSCcYN9fczAvIDO2x6OQ8odwZv+PV
	b+1guIYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX2NU-0000000037i-421X;
	Fri, 27 Nov 2026 20:17:04 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX2NR-0000000036r-3pix
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 20:17:03 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so87163515e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 12:17:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795810619; x=1796415419; darn=lists.infradead.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EO5k6n/37i6TdunZgGiZGXGdx4jOGbhNEYDu4cn2rWw=;
        b=MQXNy4NpVDyNC6cj4niPCeem1bbhh7/rZlEw8M0X9ZhbCwbz3l6Ox/R5huaZNuX66r
         6GJu414uWFnr2RpHwAMk/PfkegHIk+Wav5AT9+z7tq4EJeQrkGfWYAoWh+6tFVpNkSuh
         hwgFWrw61N1F9tDU55/7yOIm0ZCjFmUZcQys6oQh+gd9/Jr8IAP58hd+skHozdNcGaP1
         EQeHGcjorjBzKJW8aEKVSZhQQCzJwAg0eyD1SiJUoqdU3JOU2qnM92gHFxo1BqtjHkA5
         pOl0DL6I5WxFSmf7ctHykFYQiRcDqGSe+puxTEpb5ze4N5mQiW+i/QzQbZjaEWyhqPK5
         z4dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795810619; x=1796415419;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EO5k6n/37i6TdunZgGiZGXGdx4jOGbhNEYDu4cn2rWw=;
        b=opepyD3l35fpLtG1cKAcISCnkAJC4pYOM6RBJ9+PuFhAUIEf1NtFZA+XHNoOiIOWtN
         ILoAqtTL2WMQHTQxq74CbQ+nzCvAZ0ixPCblftjToeqyCB1u6rObMSE1DBbDxI4bqUmN
         MDgXUHHsFeAREhxEBb62mpK1UOvdJ7SonpvLC5DLFC/8Mte95W8lPaka6fzX09HVan8P
         dCmLH7tTyGeIAzj5Cd9OvPEq3RpNRDjGy1EyJSnU9ehZ08tT0CboNfqt2fJLwfaL/wiO
         iEuul2A8XY7BE7tqJijS9WSnyJ8zD3SJlhAmv9uLONu1MFLvDzj0uo8lbbIqG1L1heDj
         iMeg==
X-Forwarded-Encrypted: i=1; AL+hErF28iCIX+BMA0SUbti4+Xok4qVydSy3ZGW9/3M/KpUobuM6BT8GsBf8dyFAubhU50a8D/nRwIvNKK7YmB6SlllT@lists.infradead.org
X-Gm-Message-State: APuU4Z8LUecMjfctu/zY0/FT2PvtLluhOURD8FDl8R4HByPBoKHBX0DI
	kDvNowB1TG0Mf2GkG7ptKMkgfmMghColpHm3I7U6c96dCu7SaIhjaPZ8
X-Gm-Gg: AZFdTZfmio4CrNNC8TCkrdJHr2YJkgE6I2yVycB/sxUH5RGFc0ZyCkhGyWgEdNnhYtz
	Fyu5fszgQG80SrJP0N63T4LW9gSxK/KNgflgh0FOBSZ3LQZJI7A280wfAMCjb+0EjsTmiXZ/6Dt
	6X2W1YFVaBoXTgmcymUaTF1O6pdKXaMI0vrXYc8l0QvGp7QZtFuiD/9qyuek4Gl1ml5dh7INNg2
	NV1G8pzv/E7GL7SQbmry0GNiDxst5NIgMnyYftuQs752ODPlgaYu06M8tdjAkyGuZhx8hSzZIPh
	D7zBSqPCnvfRP+1AR8sUgjQNkoGCAyDX9ITVE6WpwwgvtRnsH8BZOjEMfDcMSs57kt4E3q8/9k+
	c5o4PYULnuOjS0JQL1PBvrz9NfgEwQ8uObjK2vp6nqBFFmxmzCTeqUAZSbPuJKaGTk9yjfO6uRs
	tAQvBgRfhOjmZ/AVv8VKTPvXq6FK9DpI/gf7SK6ZLafwbFVKash3G1j47iNlVwAuOGB2cN3/Xqe
	2zbejoQXy9hkE55duQH0IZmqHD/Z2AIVP7L6X/Z+pNw0FUdIqgrjCKgPY/ktCs9KLiztZRZ9kg3
	22YT4Aak3MuDTZhvBLSozkGkNzo9WW5q/eJA+nZIZ+zvuIarP1nnRXw+hkYOHvliKH38bRRMD3W
	xu1rtQJ9UzCvGs1m1RrR1ufuekymZxj+/Suos6FefIKo+4Oo1o76ocHLo6vdMshF7XbrTOGl8cb
	0dAiTGDtHY3AoaZFmQUU5m6U6h8Ddhsa4uMqqPjSf82A99VU5ieimlGKFr+f0d9pcrNVu/JQoV7
	p+rXMynR+5hMQcsh7FtNP6EVg==
X-Received: by 2002:a05:600c:1d09:b0:4bb:73d5:ab33 with SMTP id 5b1f17b1804b1-4bb88816acemr564296155e9.22.1795810619117;
        Fri, 27 Nov 2026 12:16:59 -0800 (PST)
Received: from jernej-laptop.localnet ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm1298123635e9.4.2026.11.27.12.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 12:16:58 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>, Hans de Goede <hansg@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, Alastair D'Silva <alastair@d-silva.org>
Subject: Re: [PATCH 0/3] arm64: dts: allwinner: sun60i-a733: Add simplefb HDMI support
Date: Fri, 27 Nov 2026 21:16:57 +0100
Message-ID: <QITIdKDQRWGwlU1DQqnbAg@gmail.com>
In-Reply-To: <d4a41c5cfb33d6d39f0ba927541beca1175ad001.camel@d-silva.org>
References: <20261127080649.1982883-1-alastair@d-silva.org>
 <18637573-d20f-4a58-9e63-6bf71b015cef@arm.com>
 <d4a41c5cfb33d6d39f0ba927541beca1175ad001.camel@d-silva.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_121702_005162_9D5276D4 
X-CRM114-Status: GOOD (  21.26  )
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Dne petek, 27. november 2026 ob 11:20:02 Srednjeevropski standardni =C4=8Da=
s je Alastair D'Silva napisal(a):
>=20
> On Fri, 2026-11-27 at 10:03 +0000, Andre Przywara wrote:
> > Hi,
> >=20
> > On 11/27/26 09:06, Alastair D'Silva wrote:
> > > This series adds boot-time simplefb HDMI support for Allwinner A733
> > > (sun60i-a733). U-Boot enables DE3.5, TCON_TV0, and DW-HDMI2.0 and
> >=20
> > Where does it do that and which U-Boot version does?
> > I don't think we really want simplefb in the mainline DTs any more,=20
> > unless there is a big blocker or delay for proper Linux DE support (lik=
e=20
> > there was back in the A64 days).
> > In Jernej's HDMI series he hints about A733 support being pretty=20
> > straight-forward with the reworked H616 DE code, so chances are we see=
=20
> > proper DE3.5 support in DRM rather sooner than later.
> >=20
> > Cheers,
> > Andre
> >=20
>=20
> I think the blocker was firmware for DE for this SoC - it can be ripped o=
ut
> of the Orange Pi OS blobs, but that won't be acceptable for linux-firmwar=
e.
>=20
> I'm currently reverse engineering the GPU firmware blob, it's not very la=
rge,
> and is a well understood instruction set (MIPs) so that may be a path for=
ward
> without the vendor contributing the blob to linux-firmware themselves.

What is this GPU firmware blob? If you mean for Imagination GPU, that
blob is already in linux-firmware. But then, this has nothing to do with
actual display output. Display Engine 3.5 doesn't need any firmware...

I'm with Andre here. simplefb isn't needed. For anything more fancy,
Maxime is working on DRM readout series, which should allow seamless
takeover of display devices from bootloaders, like U-Boot.

Best regards,
Jernej



