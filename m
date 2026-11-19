Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816E8606A326
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 23:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cZdzklC8;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PX+tTg6M
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=db1dSJIcWvwP9jZk7KvLgI0rZAQDCeyNT1LeRTG4P5c=; b=cZdzklC8G7j0Ay
	I8+FshSpM9P9q2Ikm3weQRuLbesr28pgh+TdTbR6ZbatF++AI84aD3hRRViSWpRu1L7evEzSH9ceU
	k+FIXKDsunMGyUI1uZPuC78oY8oiIpNTuN1BZYxCLbD0MKejRzNlzU9JttQDRQK/UJ95AOKXAebHy
	OZbE57Sj/ZwpQ69cr9iQPJJ8q6Q4nI+62rO7WvV58nPXfxcih0lP84YMZnLraE4n/oM89woNzrli/
	w1SDGrkyfdHZEdWJyUOgha+z/w4wy2SsAmVht1RmkkqDdPn9lFdJtojqXHN7SkxkSzcg2xECfXXPM
	xp9tH7+79vzwgaLDQ6TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUBcx-0000000DfTM-0HMD;
	Thu, 19 Nov 2026 23:33:15 +0000
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUBcu-0000000DfSj-1h0b
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 23:33:13 +0000
Received: by mail-vs1-xe2d.google.com with SMTP id ada2fe7eead31-7d2d18f1bf5so226783137.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 15:33:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795131190; cv=none;
        d=google.com; s=arc-20260327;
        b=c6NGOSu2IFZtEFwQVgJOdB0tGFg2QDGaEbKbxRx89ZeUI57EjIt2ueN9e5bYkIGK8C
         UA4HFSvn1AjjpADMtlIIE0i4PvxRKekzQtXFLwWUrY6DGzT6C196dNw1ItkxujJHII1F
         GWxZt8KIBl66UuSnC+rqB9AMoecyi16yH8hbMfaLT4ARMBIZMokvmqX7xOYRn8Nc3YyO
         h7waxHAlkTpGI4Whh+vV7gnk1MGRW8lu1BYtZB/cWNpPqx4OJHf+notbf1tJLuTBE3i0
         mS/Qs0RPef8GOgdYjUZpmey/M/Xo9UGk4Ge6Yz8qkGItBdIjWHlJKQ0r74wOv2TA99Dj
         eVPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=db1dSJIcWvwP9jZk7KvLgI0rZAQDCeyNT1LeRTG4P5c=;
        fh=HBCMxDBXc9JK7H1828TDrz3LcfpoP2Ncaui9T1sbJAE=;
        b=rG2/2ZcKuBeClf1nsk3D8ZHLPmdWh3D0yofWtfG68KMYAdQanFT/CgJPoA8KibiZSo
         n6Bw/9FUFek+GznUucuH6+uQH0tEPncJIG4xHE1g/MWWf31tFZe0HzGdDjur/riFnCBy
         lI2H0R44KeJbi2LTIleh36Xyw99N+KWbduekS34EK6RAXXKDOY1dbw2fX2rotep4Vkf5
         ovj0PffQjueeecoMAUbJyTrOjAhqnrMSj4i2G7SEIhnWNvrQSWT4EAsC7DY47ij4XekE
         cxF9SlAoAMsqGgwd1/KicCKoJlWpOL0GmU8O74dk7DsTNRqpUupV/creCg7FOwkfaVoc
         /+Tg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795131190; x=1795735990; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=db1dSJIcWvwP9jZk7KvLgI0rZAQDCeyNT1LeRTG4P5c=;
        b=PX+tTg6MY9UXvZAfTlahEsngFhaRtXGUK/Q2Av25UYGJccxpZdYlZ0IvZ9f2+h5PxT
         FpUYfKZwuQurFYNfo2Lfg2VilXxXDdes9981QO4M3QEiq5qI5fn3aSlFq1x9hRCDbtkv
         urhmS+vaWJwOX6FeU2+hzlvc/XScr5j9NR78tU3rj7/S2dfUJ6JVvR7E1GGhKnufzbUq
         wiJGQ6lfSulko63bUmX6mCTwCGMFXRuvKJLU0XaM9F71/thvJQ1BG4LxGLVqDKk48VTh
         mplY959ng5v5T9xO4VPPDnXkOaPl+4zABz7kFQuDJ4VkDw7G3d1KB38RBiaMJBOIOuch
         K++w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795131190; x=1795735990;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=db1dSJIcWvwP9jZk7KvLgI0rZAQDCeyNT1LeRTG4P5c=;
        b=fUTGShvaiytVHclRMkTNvwQTDptDVzixhPtI42B7QGC69v5UqGsTlJznmOmKKuKHV/
         Sr3CxdKZMBOLY6lnoBmAeHm+gdFT2vUcLgHaWi464bTyTtBSI/eZtcxjKBQiqjjg4qpn
         ILtC08TrE4h0ZaL4bNMUrQTCEM37zNYB7W3gW0inxYi7UsEeL0c7shURq66LqMsaOM2L
         VVb6gj6RvUqqpz2ZVlRKlbllAu6OvwZMDcqplrLIo58UNpWLcizf/fVHl7EVuENaa3o+
         h4TTgltuXxMzhyarEdUyvRoNy0jlBD1wl3vaRvF0md4Co1ms0FVTJj3FsDiU0F3yiZB1
         Jr7Q==
X-Forwarded-Encrypted: i=1; AL+hErEkP+P0fUAe97X1zQsaoujksqGzty3UtauxIp7eT5xyZKU8btZDY3Y1ZSXiXXfdF9KJgq2f72VRDAW82KA28Qvt@lists.infradead.org
X-Gm-Message-State: APuU4Z8vOV5F5PXn7D3UhcdvUM46K7OGjvH2wXqh51BDX7+H+S0yVmGF
	AGtk5GgxbGs82NOmvKGSgjcY3lbIjkZYv4T7WZ+wIqM1u9buZfpfbr272TmerrE+U7oKlOlQg+W
	AG55+J07mWMtEXkQ/HgHu/k7BZjqGTVY=
X-Gm-Gg: AYBFou3pMuDUjr9MJ/PQAb1Bxxpx0nH1JBNqedaevpIvY7n8HU7yj5zEqCxQ0yq4A0B
	IAvoNUL/RPJx/JcMAzLwTKYNPknn39g3UTwIP066qdxHww/p5yed8wLx/9O6hn6TrXbwzFx+hGM
	eS8/0TUc7NcBxwYwbT7QZxtG5rAV4aTZ7WqkjFARfoAUJLq0sOGFRdQDfVhlGePqLFye++Z2uuJ
	fNDFaeLXO0kaB6PZiNf4w+Ss+CQgmL79AE3qkPJRvK9gOc06nF/5f1a8Rh2+siPrnjjdxMTrg21
	6HdxHTeA+ZlwcJmh/8Hwa0Ana6RQL108UGIDYLzFx3tPCp41Tqxmkya3mY3xozh0UWnOTA+5tEM
	3adDM9A+5rRPGAQineaKA4uEjLCEYO60ICoDFISrwKNEHyBf9NhRJUZ17kx04SkB/W6bWltbY0f
	CkOZdoHZdSxBK1jNYaSlDDBc0epMl8ZPbctyM0O3mgQHaol3xWb5czpjddxJWjxgJstGhKniS0E
	iHxEn4fDb22RDOvC58q4gGyYcxwlg==
X-Received: by 2002:a05:6102:162c:b0:7d2:b199:6710 with SMTP id
 ada2fe7eead31-7d7394619edmr563227137.15.1795131190654; Thu, 19 Nov 2026
 15:33:10 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261115-submit-sun8i-emac-rx-checksum-v1-v1-1-f186d127b39f@gmail.com>
 <20261119144848.4ddd88cb@kernel.org>
In-Reply-To: <20261119144848.4ddd88cb@kernel.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 19 Nov 2026 16:32:58 -0700
X-Gm-Features: Aa3M54pl4hlXRMcwBzZFHc9YCWzUYN6am3kufSQboJBVsJ7s6nPiZ-HbdhxnAag
Message-ID: <CADvTj4oJ6HDR2k6qVgefUX-h0TGh2n+AO5gx_dcJFzzWML+2UQ@mail.gmail.com>
Subject: Re: [PATCH net] net: stmmac: dwmac-sun8i: Honor the RX checksum
 offload setting
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, LABBE Corentin <clabbe.montjoie@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_153312_523799_F114BB39 
X-CRM114-Status: GOOD (  24.94  )
X-Spam-Score: -1.9 (-)
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

On Thu, Nov 19, 2026 at 3:48=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Sun, 15 Nov 2026 17:58:26 -0700 James Hilliard wrote:
> > stmmac_set_features() clears hw->rx_csum when RX checksum offload is
> > disabled, but sun8i_dwmac_rx_ipc_enable() unconditionally enables the
> > hardware checksum engine. The MAC therefore keeps dropping packets with
> > invalid IP or transport checksums before they reach the host, even afte=
r
> > ethtool reports RX checksumming as disabled.
>
> Rx checksumming only controls whether the _good_ packet indication /
> offload is communicated up the stack. The device should never drop
> packets due to a bad L4 checksum. Checksumming L4 is not much of a DoS
> vector. Oleksij was fixing this in other stmmac variants. I _think_ you
> should always clear this bit if it leads to packet drops.

The case I hit was `rx off`: on H616, ethtool reported RX checksumming
off, but the driver still set EMAC_RX_CTL0 bit 27. Clearing it let
packets with a bad UDP checksum reach the stack, where they failed
software validation. With `rx on`, the driver sets bit 27 both before
and after my patch, so the drops in that mode predate the patch.

H616 also has a separate control for forwarding error frames to DMA:
RX_ERR_FRM (EMAC_RX_CTL1 bit 3). With bit 27 set and normal filtering,
none of 100 packets with a bad UDP checksum reached an RX descriptor.
Setting RX_ERR_FRM let all 100 through to DMA in both the IPv4 and
IPv6 tests. The descriptors had the payload checksum error and error
summary bits set, but not the CRC error bit. The driver discarded
them on the error summary.

> (FCS is fine, bad FCS should only be passed up if RX_ALL is set,
> but sounds like your device has all checksums controlled by one bit?
> in which case we prefer to see all and let driver discard the bad FCS)

Ethernet FCS checking stays active on H616 with bit 27 clear. With
normal filtering, bad-FCS frames produced no RX descriptor in either
setting. With error forwarding enabled, all 100 bad-FCS frames had
RDES0_CRC_ERROR set in each setting, and the driver discarded them.

> If I completely misunderstand things we should at least get a respin
> to update the cover letter. The commit message talks about L4 offload,
> and rx_csum is L4 AFAIU but the bit is called CRC which deserves a
> mention somewhere IMVHO.

The H616 manual calls bit 27 CHECK_CRC and mentions the IPv4 header
checksum. What I should have made clearer is that the bit also affects
transport checksum checking, but clearing it doesn't disable Ethernet
FCS detection.

Would it make sense to address the `rx on` drops in a separate
follow-up along the lines of Oleksij's dwmac4 fix [0]? On sun8i that
would mean enabling error forwarding to DMA and passing packets whose
only error is an IP or transport checksum up as CHECKSUM_NONE, while
still discarding frames with a bad FCS or other fatal RX errors.

If we leave the checker enabled in both modes, `rx off` would only
control whether the driver reports a checksum as verified. In that
form the follow-up would replace the conditional bit-27 write rather
than depend on this patch.

[0] https://lore.kernel.org/r/20250818090217.2789521-4-o.rempel@pengutronix=
.de/

> --
> pw-bot: cr

