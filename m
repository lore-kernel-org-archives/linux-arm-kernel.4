Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601A3606A8A4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 00:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=A8k8E/ip;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j/kbjgX6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=kTNrEmxNbCnmj9l3gKKv43Fyixiy3ZR1yX2zY41P3W0=; b=A8k8E/ip1fGN7/
	AeUPgw/4SjUZdgUd7UjjcyiuBqTKkfsFSnD3ZjY2uWH+kXkiUSo2ElMgsFwNBsJ+iWnd/+iF0T82Q
	XKXlOoVV2XWz9TlYsgWldswQ8BZiNcgl4XwYm/X+fOq+slYPX2kPOctFhF2GCDtFfMio15VwaJHVn
	QHhu6CZe+FFXqeQw7/faMGCy7/qkb3YxdgqyA6L03rWKYai5AGh8fy5vQ6XQFaFpIIYB1OHlKEWfH
	YrNv+K+Ttgm5WrGkkpnjqHQwwh6ZO6qK2xKZZGBRnFtAefp5GFmrfwE67Y1QhW89QpY1aidd3+lpI
	ZezOgwifKn9tFN7Opfxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRfGq-0000000BKka-13rq;
	Fri, 13 Nov 2026 00:36:00 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRfGn-0000000BKj1-00j6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 00:35:58 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so6198325e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 16:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794530155; x=1795134955; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kTNrEmxNbCnmj9l3gKKv43Fyixiy3ZR1yX2zY41P3W0=;
        b=j/kbjgX6hUZzC3Asrz/oNyrrCZhScAaWK9f0p7Yt74RnOpyIakGVftBRfOYrw+wlpe
         GlecmTNcMPYxKbD19iQEdkJkXWbVMqQwogOMPSrZHEPM59eg9av/qrbNcQzrBSUdxLYn
         KiHdGdxaw2IGpA1IOHNcusd8XK32kPn4bijhbQYUlEN1H+pBrHqZSFcBdj+Fh968eknt
         PxRgmFnW9QJmW0VOLtdFYtV5ROCD0REZMvv/F0z+n8mo5ZrU/XCm4m6HHB9pzfK4+hkC
         btWH2ug39870B44J2xHDVP1JbxWIANE18+ldFOoZHJ6InjjjpOKyGCdgG+bpWDMazDHF
         Iksg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794530155; x=1795134955;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kTNrEmxNbCnmj9l3gKKv43Fyixiy3ZR1yX2zY41P3W0=;
        b=tmdMMboYF6RYs7b1tKVYEUaUhY3/acpKpYlUBxUPRzygI0hnMrTsG1bO5+pj7ruwUQ
         cxK8mNGxxGwGpvi+mIALuTmoErHG6PyInTYLpZQKpKkOUlonRk+b18wOvReUO/mpTCpH
         h5yEGlLoJGRCz97Mrrn+vsrk0LRlod/uKtkyKCxpaTOd5KNmPwwd2cI0RJreseQOiyTJ
         d7/zEpNUyKwnGnfSD9IA/HhBRPurlnApSePuQI0tGn4072q1+q5PDvgtVgH29OqbKmRC
         o314kOHLdihM/v5KyrhmQVTIa35Vk+XWCMftLgYvGxNkJTkAUXBUuJNJm8MRjIvzINvj
         Qe6g==
X-Gm-Message-State: APuU4Z87ewRQmaKibuhLZ4r1Vh0qErtVZWxBjSSWqBYJnsoB/Avx9Q2R
	X2vRmusr/n/szbE9CjFk2Sue1mz+nCwR7iN+Xn+zBKV4XM/VwLj9m1zx
X-Gm-Gg: AYBFou2h8OlHIABQw6fNUu7e9sLFV4QBgB04OC2TXjko03f3ZubqGZL0OzlqsTYb3h1
	R+a4K0JrAW0+4MurtQlV6aSp3GtYcPWJF8gmQ4SluGK3M3B58bQtk/WpTBK9n6cF3OcK9bLQsRO
	m1hfI7wAE+FYRBYK5S0vcX6hrXcRYgceCX+1y99n7CmIa4c7BCLBaO/3070+5W2eW0c8SGfxscZ
	lVwCqvhh0nTKOdp3vMYOVIKzFUt+gNFS3n+0waZhAn0dWY76FS5QK5bc5alMaUWZMf8raSWjx/F
	RI+sIZN9GfrcZzSc+KyPdw2y3O0Zg9dBT5inBm9BnLFcTDEo9LWVz/z5wdY5r0HULHMK0TlMCnj
	rtnMB8rfSjivwsFHL1t1UpHCbtgKbqc5F/FyYreJG0BfHb6Eipcorqqb/ADRpG8uo6xXOTD7Fno
	qY1lUo0s7tSNtL591If0nJvfWyXHWB6eCbrg+zpszEgoOf8iGYyFb5F/UD5pfJNzyz320A7VdMy
	ZNmpiSyr0zjjh6bf9MJkFGnsuGUg3UA4YK+ZpnEXSu0KqKBuEgS9qnI384B9bC+E1IWzoU7nZcb
	Kd0O2p2bqO3CcI2IstLiC4VJX4Tqf9vCut6Bl9BZozBeWqwYM6NxZQOJEhwOEGzM6dXrcIIjZPA
	Y0JiaD0o8+dLv1DDdW+kSYiUgCcpwPZv4LuY1MEIbGF2jc4LeRYwABmvdXjZFIk09c7mPz73ASR
	rhMD8uYQrINBDQ2jcY
X-Received: by 2002:a05:6000:2508:b0:498:a72d:c097 with SMTP id ffacd0b85a97d-49c70ed7c56mr2426773f8f.19.1794530155089;
        Thu, 12 Nov 2026 16:35:55 -0800 (PST)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c7da37b19sm1497029f8f.5.2026.11.12.16.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:35:54 -0800 (PST)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: =?UTF-8?q?Stefan=20D=C3=B6singer?= <stefandoesinger@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	krzk@kernel.org,
	Mark Brown <broonie@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-kernel@vger.kernel.org,
	linux-spi@vger.kernel.org
Subject: Re: [PATCH v2 20/24] spi: zx: Add ZTE ZX family SPI flash controller driver
Date: Fri, 13 Nov 2026 00:35:53 +0000
Message-ID: <20261113003553.3661566-1-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <jjb8MyAPSXaXqHtedDkkwQ@gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com> <20261014072109.1759502-21-ghahramani.navid@gmail.com> <jjb8MyAPSXaXqHtedDkkwQ@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_163557_067385_72EB4859 
X-CRM114-Status: GOOD (  18.75  )
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Stefan,

Thanks for looking at the changes. Since you plan to submit the driver
yourself, I am dropping the SPI patches from my series, so this is just
to answer your questions.

Stefan Dösinger wrote:
> So IOW, this function should primarily configure ZX_QSPI_TIMING_REG. If the
> target clock can't be achieved with the controller input clock (e.g. divider
> is larger than ZX_QSPI_TIMING_REG supports or clock rate is lower than
> requested SPI speed), then a change to the wclk is in order.

Agreed. I only changed the wclk because that is what worked on my
board, and I never checked whether ZX_QSPI_TIMING_REG has a divider.

> > +	ctrl->min_speed_hz = clk_round_rate(qspi->wclk, 1);
> > +	ctrl->max_speed_hz = 50000000;
> This looks wrong - the max speed is probably the highest possible wclk rate,
> the lowest speed the lowest possible wclk rate divided by the highest possible
> divider.

Agreed.

> > +	/* Ensure proper data sampling point */
> > +	reg = readl_relaxed(qspi->io_base + ZX_QSPI_TIMING_REG);
> > +	if (!FIELD_GET(GENMASK(17, 16), reg)) {
> > +		reg |= FIELD_PREP(GENMASK(17, 16), 1);
> > +		writel_relaxed(reg, qspi->io_base + ZX_QSPI_TIMING_REG);
> > +	}
> I don't know what this is doing. Can you elaborate?

That value came over from the earlier driver I used on this board,
which always wrote 1 to bits 17:16. There is no public register
documentation for this SoC, so I kept it, and v2 only writes it when
the field reads 0. The sampling point in the comment is my guess at
what it does and I have not tried other values. If it matters for your
driver, I can try 0 to 3 on my board and tell you which ones read the
flash correctly.

Best regards,
Navid

