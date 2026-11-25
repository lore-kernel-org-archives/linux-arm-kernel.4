Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965A0606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 15:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0S/9mixs;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=0++rdv/U
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ThFdUoEJLgqCzj0vafLu3KqzUK86YitR/mdeY+BUk6Y=; b=0S/9mixstx269F2ikgm/1iAJFT
	mRAE45NV+cXB8/figIR5Ck6d7FrEzXVeB3Wus6HTQw+7feQfC0qKxGhzMPRtqzyFO9Rk0MsnJTaGz
	uhpyy+QWaQLa3NHJJqTJtEgMaMiCvDa9rEeZagJp003xU0MnWavwhTqCrYyx8dKJE7iVqIwkdHrgr
	/mTTgpSPB2S006amTSx2KXDLPnWXBMC3AYCy7aJ3RMKo14M1SKX54F+wmKsEqjhO3a0KQD/bsDT2d
	AHBgkWjCf8jM6pRp73OpO38oNt88Yn6x6i92DgP4fA6Jfz+ocs8Hmlu/XPd3si3D84QzmC/Hb/5/5
	nqasvtVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWEqa-0000000AKhR-1sd1;
	Wed, 25 Nov 2026 15:23:48 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWEqX-0000000AKf8-0NMj;
	Wed, 25 Nov 2026 15:23:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=ThFdUoEJLgqCzj0vafLu3KqzUK86YitR/mdeY+BUk6Y=; b=0+
	+rdv/UzeXgKEWrxyUm2DWDbskcRohtC3uXGCMM+h/PlzgBWFEGRDttHI8k5wQ1oEwK8Yv08V7l7iW
	MHBm4KEPc79e9TDjqWqkv079MFfabStCjmcVEjgBeTieU45uuXG/fG9O8vFg4J55ru2pLfnj7rkT+
	bPu0p/C11Z17gtU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xWEq8-001LhM-9d; Wed, 25 Nov 2026 16:23:20 +0100
Date: Wed, 25 Nov 2026 16:23:20 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Alexey Charkov <alchark@flipper.net>
Cc: Ryan Leung <untilscour@protonmail.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	Simon Horman <horms@kernel.org>,
	Ricardo Pardini <ricardo@pardini.net>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/5] nvmem: rockchip-otp: Derive MAC addresses from
 the CPU ID
Message-ID: <1defc5c8-ba61-40d2-99f3-6654f1743af1@lunn.ch>
References: <20261124-rk3576-otp-cpuid-mac-v4-0-d403b8a25113@flipper.net>
 <20261124-rk3576-otp-cpuid-mac-v4-3-d403b8a25113@flipper.net>
 <0aH4P5VH9HNiTXpCUTaTlvGaoUDQBnvv-0cSXtipSDkLOGjzGy96jDqsVtU0DJTWrocgoMcGFEgd0JUlF5mljVvCzGKVz4yUgDQ0s6HaDLg=@protonmail.com>
 <2f8da604-36af-4944-8168-02b046e97699@lunn.ch>
 <CAKTNdwG1sSBVKcKpHBj24nFCdc6WVKabV5=K4sJFucWpTLqRQQ@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKTNdwG1sSBVKcKpHBj24nFCdc6WVKabV5=K4sJFucWpTLqRQQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_072345_128373_A2C3803E 
X-CRM114-Status: GOOD (  21.47  )
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 25, 2026 at 06:41:42PM +0400, Alexey Charkov wrote:
> On Wed, Nov 25, 2026 at 6:21 PM Andrew Lunn <andrew@lunn.ch> wrote:
> >
> > > > +static int rockchip_otp_cpuid_pp(void *priv, const char *id, int index,
> > > > +                            unsigned int offset, void *buf, size_t bytes)
> > > > +{
> > > > +   char cpuid[ROCKCHIP_CPUID_LEN * 2];
> > > > +   u8 digest[SHA256_DIGEST_SIZE];
> > > > +   u8 *mac = buf;
> > > > +
> > > > +   if (!id || strcmp(id, "mac-address"))
> > > > +           return 0;
> >
> > I don't know OTP drivers. But to me, a function called
> > rockchip_otp_cpuid_pp() which does not actually return the CPU ID is
> > architecturally wrong.
> 
> There is precedent for this at least in IMX [1], [2]. To me the
> interpretation is "Rockchip CPU ID used as a MAC address base with
> offset X", which is exactly what the derivation does. IMO, this is
> less clunky than the alternatives (e.g., a custom NVMEM layout which I
> used in v1-v2; a "virtual" NVMEM driver referencing the real cell and
> returning the processed one, which Ryan proposed in v2 discussion, or
> caller-side processing).
> 
> [1] https://elixir.bootlin.com/linux/v7.4-rc1/source/drivers/nvmem/imx-ocotp.c#L224-L238

I would say this one is different. The cell specifically contains the
MAC address. But its endianness is wrong. Nothing about CPU ID here.

> [2] https://elixir.bootlin.com/linux/v7.4-rc1/source/drivers/nvmem/imx-ocotp-ele.c#L115-L129

And this seems to be the same.

As i said, i don't like the concept that a function called
rockchip_otp_cpuid_pp() returns something which is not a CPU ID. The
two examples you give ask for a MAC address, and they get a MAC
address.

Does nvmem support aliases? Can you put two different names on the
same cell? If you access the cell via the name cpu-id, it calls a
function _cpu_id_, it gives you the CPU ID. If you access the cell via
the name mac-address, it calls a function called _mac_address_, and it
gives you a MAC address.

That way of_get_mac_address_nvmem() just works, so the MAC driver just
needs to call of_get_mac_address() or of_get_ethdev_address().

      Andrew

