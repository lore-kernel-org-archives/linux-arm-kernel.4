Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DABC60A261F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 18:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JJ0TM892;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gZhN+++4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=yh+8+SwLk5Q55HtZNGGsREJIH5CMKWnk0ZRZ1TLMdIU=; b=JJ0TM892LXK1SB
	FtAUwXDkFlGL/hx+95dY7oNqKE2siQAlkcgVj9NhMObtHGYdmVHdAf/E8oFC56ngzbu4ZJxkkK7Bi
	SpzxifRhfj5KRNwqvVGcj2t77D1jGc0mC8QD0Y+D30rFPtRn0AFqJroav4bYqmPs+Au56dvi3itqH
	Kgm9DwyM0X0yWgwGXYyQTZq3vdYQ7EtCvgmVmHwXv8BXkjvXw7BGu1ItcVag0JJx5dsKcAXpzSqrw
	JyIkJkpwa9+UM6Lv+OKYMQIyuzTyjzH23RVol5lmWJVRYMu7S2MsDdxMlHvbMx0Bw4zUef33nOfg3
	7IMlP9KmyNbUU+xDA+ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUTd2-0000000FySs-17AT;
	Fri, 20 Nov 2026 18:46:32 +0000
Received: from mail-vk1-xa33.google.com ([2607:f8b0:4864:20::a33])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUTcu-0000000FyS9-2etZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 18:46:31 +0000
Received: by mail-vk1-xa33.google.com with SMTP id 71dfb90a1353d-5ea969fafeeso425600e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 10:46:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795200383; cv=none;
        d=google.com; s=arc-20260327;
        b=hihY3lDjQOmBrQag1h36SYGa6/4JnmoIAjUPD6xFLaZofaqxe88YPHoakrS0RYFkvI
         Z+53e8FJ9EXN74/crojRfEdAUWokR6hwxGM9bKdg1CddHex54sS1bsfxQi5npsppautq
         YEbaaPrf6fxzsXF2qbXiTHdQ7rDh2Db14+rxBT86pDIpQ2WsRYvAc69Q4UHFUBZJ+H5n
         Tz85FndH68nN8iMpzfH+EJLXMQx+RNZJ7O7rYjK2APSDDEzOv3tFYOoXDt55U45zISoz
         /QtuXBeQD8iaG1hnQsnMyvqb19wBxV9R5w87+/xXQyVdv35ERMMuGpB2SCw/bNnPVHhi
         Z9Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yh+8+SwLk5Q55HtZNGGsREJIH5CMKWnk0ZRZ1TLMdIU=;
        fh=95ESchJLTVQtgH5uSMbAzZvsW9+WF++fb4wBwTu5Zao=;
        b=RsTvFHzS9xEvnXiJSleoBQsyduSXVbMOBseFvDvwoG332ODcmD6B/9yhkoxyF5kvfT
         lOW0ctLJ11jTarLMW80PrkHLXGi00vyHlZagRuadx4Rw4IZ1vensYaleVsnesYM4yPN+
         u3uUdG5qV1FDOZq8yrnqP4DYA02u0BKS81CqPW1yfauTkRQGp7W3dt4+0Y87OvbBPkom
         BFNKNP6PkzgGNfVAQlv/ExJLojT+a9w0SAWnobJX8P5ylZOaodHLhob96ay61tTNDM7Y
         AzFcn0+rRgI6b389S4KNDmauaZ7Zo9+FFMQvPXrn3ZDp9saVHcDkCLu+cm+9qoVRJzxE
         cBUg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795200383; x=1795805183; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yh+8+SwLk5Q55HtZNGGsREJIH5CMKWnk0ZRZ1TLMdIU=;
        b=gZhN+++43NTdrMR6fvbjOgHd2opvRwiCrjFV3WKXUmKw4ESsE1Xlw5Q9JEL647hlQ4
         nWhlh4rpC0pNF9aS2dotlVOUbQRX5jWw7ocjr36PZ9Qb/oiG2GRlxOiq5g6htPXSEAro
         /bNBs4Yu+eFP+GqUaeLS0eSO9cawovK/WYyvtumF+L5uNr9VrA17CfJhz+NIsKKufYPr
         VsoL0vuoaZn5nvAPml22w+kzb57+iZ1dEprjB5kCZWpznR/MazclY3HQ1jbN71AHjgri
         3P0KI11pXsTdJwMCIvGYhFfAZSRdfhfhPTBh29FkjAwYXG6R+srgdnTAm77JHvppIJYu
         vsIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795200383; x=1795805183;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yh+8+SwLk5Q55HtZNGGsREJIH5CMKWnk0ZRZ1TLMdIU=;
        b=Xypti/R7FSTtB4IACC8iTClcREPvtnqeU/KcJJVIejfQVCxIvSxENKDbLhU4Q6cUOg
         8kq6vPCMKo7lZMSljBWfVuPPw+oUsLfTWTx7dSXKR0v91m0+TsGsKHvJT3Jp9xWbICE0
         pBndtPQWjO1Ji8pZTXGtNRxfY5MzQKQn1hnzreqVgVO4+8ctxJssr4sSz1XUCMoxCIas
         xeCMznhZBMl7Xkwwl1WGw8d+1k/0cUj1rCnf7z/enxtFNW6OSuftSvAOUKqJDOowfsUG
         i032dypWIcZebMiYaUbb0uFJU8++qbIjMMKxBLBlImdbFtJ4Tu6FA69cnmgWJqj6ymNk
         j6GQ==
X-Forwarded-Encrypted: i=1; AL+hErHOU/6XAxZI0feybRvvRf5aKTzJyG5EzHYgw70BRhf9/SwMHVWIUQw1i0aoqX01fw2+e3npverRwLcQZQuwfyb1@lists.infradead.org
X-Gm-Message-State: APuU4Z8siiZFcN+FCuHDo5xNez3cuyWQlc7AR2ePqfzpUR01k1cUBD+n
	L/oXtEpvThk2TOA+qYp3293MuoO04Dno3aWt/sbS/pVyVz3gmfJK1gU6gS7lLnNRA+FZ5hgrBbC
	l3RkRFEt7WZ8Sir3oropqc+nokbLREbZTWHhn
X-Gm-Gg: AZFdTZd1PFqxTjRdm53Rp04Fm7CSyhXmaAqXshm9lBlmgMbie1K00785UPCqA0CNFcn
	okHF/D5p7hSXRUJ38uPPcM2PHXEU87DY9e5in8+od7OsJ835PyGihBGowLGV/4xGqOrO6xY1SDF
	lrYgyA2OLCRpzWi5qswaMuPk8Wditd4skWEGctpX/Yww39PRdgb5PL8qzBscEtUv0dMk3Ra19x6
	rlab9jLhsGI1yHeN20q3D/MnQYAaiKkrAYUMBzHeL4eAQuvuzXY2bygOA716JoPMaZHL6dTNRHp
	4JpstqO/dp6BLF0ZTM4H1bb5DXb2NC8i5pELeqZbVhHWIh/klGSSVrR4Vpy9ikj7tSiipPxAzCs
	6NTpAj3hvSGKke5zpfyx/NBQuPkwdjgeHyECtkN2KwR1EA3RSPeP4xcUZXuDvra5h9B5mXTxpg/
	0wHEEmmxlWMRbIPFC2UapNxu3qR58isPtmP/ge7S3IJ4qO4n6dYyzPHZE0qK485KYaV2ytapAMR
	0Lx+p14YDdeP9B/srHxucHYDgDrJg==
X-Received: by 2002:a05:6122:9003:b0:5ec:41df:f110 with SMTP id
 71dfb90a1353d-5ee8af6c74amr2016084e0c.23.1795200382307; Fri, 20 Nov 2026
 10:46:22 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261120-submit-sun8i-rx-features-v1-v1-0-5058fecba6b3@gmail.com>
 <20261120-submit-sun8i-rx-features-v1-v1-2-5058fecba6b3@gmail.com> <a91278be-9c14-4769-81f1-38497c38c47b@bootlin.com>
In-Reply-To: <a91278be-9c14-4769-81f1-38497c38c47b@bootlin.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 11:46:10 -0700
X-Gm-Features: Aa3M54rJ5Y8qFUvIsWTDnCsT7oGEaCdkKyaPFOPkJ_ACUKYfdbfqerO9yZONmfs
Message-ID: <CADvTj4r-KPM6GB7UyDK=XF-D9mvOy9m7EvC3qzznz9VKvFLw6A@mail.gmail.com>
Subject: Re: [PATCH net-next 2/2] net: stmmac: dwmac-sun8i: support ethtool rx-all
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Ong Boon Leong <boon.leong.ong@intel.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, LABBE Corentin <clabbe.montjoie@gmail.com>, 
	Jakub Kicinski <kuba@kernel.org>, Oleksij Rempel <o.rempel@pengutronix.de>, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_104627_763227_B494C169 
X-CRM114-Status: GOOD (  23.82  )
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

On Fri, Nov 20, 2026 at 11:30=E2=80=AFAM Maxime Chevallier
<maxime.chevallier@bootlin.com> wrote:
>
> Hi,
>
> On 11/20/26 16:32, James Hilliard wrote:
> > Packet captures on sun8i cannot currently inspect frames the driver
> > discards for Ethernet errors. Add opt-in rx-all support for complete
> > frames with a reported wire error and for runts the MAC can forward.
> >
> > Set the runt-forwarding bit at hardware initialization and when rx-all
> > changes. Serialize live updates with the DMA controls in the same
> > register. Deliver these frames without claiming a verified checksum or
> > including them in the good-packet and good-byte totals. Keep counting
> > the wire errors even when the frames are delivered.
>
> This deserves a series on its own. it's not only about sun8i, it add the
> whole plumbing to stmmac itself. Is it something you've used and needed ?

I used the hardware error-forwarding controls on H616 while comparing
the AC200 PHY's CRC error counter with what the MAC delivered to DMA.
For example, the PHY counted both 63-byte and 64-byte frames with a bad
FCS, but only the 64-byte frames reached DMA. The use case for rx-all
is to inspect the frames the MAC can forward with a normal packet
capture. It isn't needed for normal reception.

> This feels a bit strange as you answer to the series info bot that this
> comes from Jakub's comment on the previous series, but I don't really
> see the connection except that Jakub mentions RX_ALL.

My reply to the bot was about the checksum fix in patch 1. Jakub's point
was that a bad transport checksum alone shouldn't cause a packet to be
dropped. On sun8i the same hardware bit forwards both checksum and
Ethernet errors to DMA, so patch 1 enables forwarding and lets the
driver discard bad-FCS frames. That addresses his comment without
needing rx-all.

> If you want and need this feature, you can submit that separately.

I'll send the checksum fix on its own and keep the rx-all support for a
separate net-next series.

>
> Maxime
>

