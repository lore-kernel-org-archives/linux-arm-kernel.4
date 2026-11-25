Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF03606A326
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 14:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vHqBjhBP;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=UPlNaIu4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mLjx3CTEUXIT2f/3aLm5eAmD1Nrm0DwEfALNNSAoscU=; b=vHqBjhBPLE3IuE
	rAnLsRRfczZlJ2qv+zY3Y8OyTNHkw7vbNyfYtDVR3/MVCqu7IxY8mwtqDWvq/XOwKRnDsHBu+wGf6
	MiUXERCWyHuW0IKnogYSU8MBD9qqRSJQck0pNs1I1SrdKVMcNZm9iMZh7RBDlimT/8FryQnjzJKmo
	M3pEe++ZVCv1TvNQfGxyfXNg0aiSX0QPk295Wx5k3j6bDeIXt9E4RPwPpArAuoDrZ7ZZ0DaSjY3E7
	PDptACTXGwgryJNoJjpq3Fv7ZkAwsru30ItXKQlAbCey7Suu9cJoqHzlsu/XXG3EfbamVtGoGpF6O
	hWI41LSnX/0b7v4GcF7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWECn-0000000AD8u-2V5M;
	Wed, 25 Nov 2026 14:42:41 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWEC4-0000000ACxC-0sv8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 14:41:58 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-c513a854320so90470766b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 06:41:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795617714; cv=none;
        d=google.com; s=arc-20260327;
        b=OOhzYkA1YiZGG/i3xaSeM6X0dSlWfPf7JetoKFC+pHcwVhHJAsT2KX3iObB2k4gD2G
         +R5GnkvnPzjgkuApRLiRSB+DdR/T6QvXQqNusXW4TahRMAbjCorZP4hPPV7OOka3JlPE
         1Htb0vs9eYQloOY+ui78n4S2SQDqf83CBrHqAJxklJemDRRPFbRaUiWbN+GC0gGqwaCn
         o4oWPdryx6pS3/REMwYbqff6xqTupkR3l0MTegFSUGdORSl9HZxs3V5n5viUMvRLEFt3
         JtUFoFxKGlI8lIv1NGrgLj+5T2KcciG/21gvVUF5SynOkSEiB4LzYxyBGfOCSXGeqrH6
         soRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mLjx3CTEUXIT2f/3aLm5eAmD1Nrm0DwEfALNNSAoscU=;
        fh=JwiHl0pEVZfNXq+thB6MDRRvfZKyHkBQJQwUmNyjNik=;
        b=gQS6z/60i+HmMDxkbf/WDtlrOFOBsSF5k760LQTyRwKmQlNg/BUDGEjaPqtuOVjiv9
         4dy3RqOlKOya9SZhuHJsBeTjK+BscpR9ZH9dWm7ezz947NuhWrww96/Gnoha63ATtAyO
         2k6aUiPpo5iphaRCXlqzZe1TS+0N0D93RZ3NE/yKotIkJsmYMwcAmyA3sx65JIUC2DuG
         8Pp5og54Sgs6Dl9RfJNBQabElwc7R5GT/PCVkYSusXrb/1B+Py6LIhtKJCTdXe4NUqK3
         tWqROKqauyhc7VLK74amCgDb4UQlYFTwC2FCtR3/Cy3GYjxD1KhhyAD1MXbEZyu7U4cO
         l+qw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795617714; x=1796222514; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mLjx3CTEUXIT2f/3aLm5eAmD1Nrm0DwEfALNNSAoscU=;
        b=UPlNaIu4UfBxob0i54p8AHd5zscNXmQmMEXR27wcinlG1hg24Tqq8j3jQtI4gZ4DqP
         +8/ulJ4fKbA6WZzYGl4/neVDOVmslH+8x2XV4mkXEI6MVOT7veLPQYTwu+MXTvAS3W6Z
         t1DJ48by2PAYTf5c9cesyDQTouAvZfMwxZnbeSANzb1U2SitJIjuj9+fY6aYlrLtTai2
         SNlN1PqaC2Mu/ibsmNFtf1fwGYxTbvn5/w+Ptv0X8utvbhw+nc08kodAmQyYwPD5SyM0
         1gzqLEnXvp9wC4BJpFw+/n+OFnr3FQpxDgHJYhsg2Xmug6Fg4ikBlWDJhdQXTMkn70zR
         TRBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795617714; x=1796222514;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mLjx3CTEUXIT2f/3aLm5eAmD1Nrm0DwEfALNNSAoscU=;
        b=QY6FDpQNt2CgySsi7bNnOlY4nLDsS2cQOnNPSDfWQ/0q5NGfeMjxrvzYEApkcz6Xnt
         c+ZlEKiappBydc96NvLgDIC2yRfdWSpxMtK4NiXFknVNw3b8C+Hd0pkBjeE/O3R/6FVo
         Krlp3whzepoEewEPsSTFj9PhAI8DUScJ6A23Oercq3oqeZR9sae+PtEkmLo+boSDBh+J
         OyddvhxxkaI8gvCuELO9Wvf6o/A2U+KaDJIsbwRqmkZ3mYWQYNlwsgWqp+ky/2kB2aUD
         eKiDxFVQuTSW53ZVi2R+YikTijAIl4auIIX+ZjU2ehz2RKUi+nx16ojZbxOP8+cTQnYV
         lhpw==
X-Forwarded-Encrypted: i=1; AL+hErFA1UFtXWGfnQlnel3O9XsjUqTfymligFPIcthzN4JXDzkLOz2YiEEqyc0cJj2N8uWMd1cee0tBjKKt4vRlN6Mc@lists.infradead.org
X-Gm-Message-State: APuU4Z8noGB9kKCBYj2EbO1SuS3gXVNZR75KZKLSHCsXXzHFmimmS9LQ
	H7OE6/cPH8DWsqK5u6nO2mlghAsy5S1muE5mBZp95Azw4CnUUUaQxRNvl0kJxSZr6TqLya7r11e
	TDTuZ3Cx/41W0HoJB//Fc3CyGwyJT9wjfhk2xaJGSeA==
X-Gm-Gg: AZFdTZcYYLsAQ9XetPwzTqEXWkFtMcb8F16UEH9JhfsHEX4q6/SuxCuKT1P6NkOjMgZ
	E8Wfgd9Ka7L0Q/to/P7YZY6F+miW6E5J6CQszxMOB3oe/yy6p5x310llLtlIeQvJDutXujFvpqN
	mTbMDE7PlGPEm8E1FMu8E7BWueXLVos7Biba5TtcePk75eEnl0F4w4x3Y1XyXXEUnQfuPkRqVsQ
	4y4WKIoBi+UJcfEFDpTY4RdGeY5IKR5yUQcfCIWdZtjl+BIQHyUwFUk3T7wReIvzFwkhNIqGDSa
	KOXNL86puXEto44TFHXaQW7ATofEFeyPN3XYx6deYE471Ji5Pkt0VWHnV9dho2RFLyvDYAapuD8
	swpDghTM+c4bqoaXs6PH8S9JgIlKLui31bk6qNw+ZKPAVpXDmpWHR1cY4H6eAuzho6T64ZFKUlD
	MxbY0IwsW6iAS85w==
X-Received: by 2002:a05:6938:e04f:20b0:c2e:8eb7:53dd with SMTP id
 a640c23a62f3a-c513ab1349cmr1102866166b.42.1795617714171; Wed, 25 Nov 2026
 06:41:54 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261124-rk3576-otp-cpuid-mac-v4-0-d403b8a25113@flipper.net>
 <20261124-rk3576-otp-cpuid-mac-v4-3-d403b8a25113@flipper.net>
 <0aH4P5VH9HNiTXpCUTaTlvGaoUDQBnvv-0cSXtipSDkLOGjzGy96jDqsVtU0DJTWrocgoMcGFEgd0JUlF5mljVvCzGKVz4yUgDQ0s6HaDLg=@protonmail.com>
 <2f8da604-36af-4944-8168-02b046e97699@lunn.ch>
In-Reply-To: <2f8da604-36af-4944-8168-02b046e97699@lunn.ch>
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 25 Nov 2026 18:41:42 +0400
X-Gm-Features: Aa3M54p30Iatdogoy58JfnAd55Gl1tkvrMVT9GbSbV-cJhdMvMKH6OgZsz2cLWQ
Message-ID: <CAKTNdwG1sSBVKcKpHBj24nFCdc6WVKabV5=K4sJFucWpTLqRQQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] nvmem: rockchip-otp: Derive MAC addresses from the
 CPU ID
To: Andrew Lunn <andrew@lunn.ch>
Cc: Ryan Leung <untilscour@protonmail.com>, Srinivas Kandagatla <srini@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Willem de Bruijn <willemb@google.com>, Simon Horman <horms@kernel.org>, 
	Ricardo Pardini <ricardo@pardini.net>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_064156_318266_AE708B09 
X-CRM114-Status: GOOD (  19.42  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 25, 2026 at 6:21=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > > +static int rockchip_otp_cpuid_pp(void *priv, const char *id, int ind=
ex,
> > > +                            unsigned int offset, void *buf, size_t b=
ytes)
> > > +{
> > > +   char cpuid[ROCKCHIP_CPUID_LEN * 2];
> > > +   u8 digest[SHA256_DIGEST_SIZE];
> > > +   u8 *mac =3D buf;
> > > +
> > > +   if (!id || strcmp(id, "mac-address"))
> > > +           return 0;
>
> I don't know OTP drivers. But to me, a function called
> rockchip_otp_cpuid_pp() which does not actually return the CPU ID is
> architecturally wrong.

There is precedent for this at least in IMX [1], [2]. To me the
interpretation is "Rockchip CPU ID used as a MAC address base with
offset X", which is exactly what the derivation does. IMO, this is
less clunky than the alternatives (e.g., a custom NVMEM layout which I
used in v1-v2; a "virtual" NVMEM driver referencing the real cell and
returning the processed one, which Ryan proposed in v2 discussion, or
caller-side processing).

[1] https://elixir.bootlin.com/linux/v7.4-rc1/source/drivers/nvmem/imx-ocot=
p.c#L224-L238
[2] https://elixir.bootlin.com/linux/v7.4-rc1/source/drivers/nvmem/imx-ocot=
p-ele.c#L115-L129

> I would probably not mangle the CPU ID in the OTP driver, but in the
> MAC driver. The MAC driver should ask for the CPU ID and then hash it.

This would then tie the address derivation logic to a specific MAC
driver, rather than to the platform, and it won't work for boards
using other MACs (such as PCIe connected ones).

Best regards,
Alexey

