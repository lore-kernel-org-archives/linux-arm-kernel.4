Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF138606A327
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 11:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=utD2Cf6z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=J/w9woKIDcG1KIzz6jIjSge7TDzANIjKjukbxSS5bGE=; b=utD2Cf6zYo7EBDEOIibDD+2Ld2
	4pCM76ifOO15dgzf3F2j0fNswrmHzZ3gEZ+rHbwkpBV4DWKvmKEwIG+h8wdPrruOBi6miicvGKdtP
	Axi5XxJU33orf+EJU0+Yxvyy37Zehc+r7Ht6zWLjU9D5Xz5OgyKjmkpNXvXYFzxLut6B/lPfBhGZx
	QkThp2vSxISYoE/9pJlCzzDTuHOpGr8elr1aMzpTChxsx1vjX7KwPdAYR2OWjJ91PZzvUP0u0O7zo
	Hx8AEYlM59kJFE2vOKFM4Ml1hHFInfSCQA2kpoaJV7WSJojmlUE/LZvqpuZSF/dJpr3wsm7d3krL4
	0Lcy9tmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXub-0000000D32x-1Gu9;
	Thu, 26 Nov 2026 11:45:13 +0000
Received: from mail-yw1-f178.google.com ([209.85.128.178])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXuT-0000000D30U-3jhw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 11:45:11 +0000
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8b2d14968c9so65746187b3.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 03:45:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795693502; x=1796298302;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J/w9woKIDcG1KIzz6jIjSge7TDzANIjKjukbxSS5bGE=;
        b=ITwKjXXjTMLNHx8lleW7g6mFNmSTdDf/rdpeAuz35E1fqwGYrYML/eFcKhVXbcDH3J
         YSgQBKqm9sEef3uSJzOOmHvLy9nG5qrJDCzAj8K0IMF9C+0D0beIxYkL/okf2tm42w3V
         iWjhV/OdxsqsEWW6PVuCxeVgFdp5GnW1gnfOr1sGvShpPFp/I5IGAIv/CRgGysrJIukU
         m7sTj17Hsd0LfSNpnUAQ8O+5qc9o3HXrkCFGh74IIveXmU1teWYk82BGjvlaEgC2HjMv
         7iLlRYfpcDtNScvPxhsvJkWqK90+cuc9XV/y4svapMKSdsqcei1e9I/lL8/sk0KOZoQJ
         ZzUA==
X-Forwarded-Encrypted: i=1; AL+hErHq10xYjFz/tClsUF2GHq89zshyT7kT9+IJ+Ukt7NoJknom7kmthTCfoYuQpPZwq1FtF8isoVWea7+5v4/Xk944@lists.infradead.org
X-Gm-Message-State: APuU4Z+4r5mCHvwGgyJ0vuOC/H/HeD/JB+8ccu4RrQmE9kiPyEHE+VGj
	zRIX3OwCbUDF8v3HpNSnC4acN3qVGyu6r0sse9d36paXmzqXkSN8MyKF9WpKtDX2
X-Gm-Gg: AZFdTZdssI2165JKjlwtGezdCqSwTZCuqEWZfwb6G4yYBKw/yPSZOj4k6VMbLnWQutE
	38w1dWXo2EdodGRjVmVnKPEQCY+VbeUe6A6226vb8LYlqFeOaLaa2x+rt42DBJsDSD/cSa8X5bP
	PA/asI5syHcLU0b8Uhjwg5QsGfPzkg93FLl1UWU/yU5yHb3iHwgJ76cNOOduqhFHTbeAg9bAzbf
	eOPtbLK3YWLHFuIk+6tudD2+moSpbapx3BFDKwTkLHSKeVhNNUGnwJfH1ZqGlVTKxi/u4cGghUO
	EB5wVEf0MCTSdKlW2k4twKOIMyA78qBm8swYJI05MN4EHtFHdAtFvFufsP2JRRN2fhS9PXg2czQ
	GU5mvmH1iKYagddfl/+oaq6LwRmKzp73QkllyzzEQRS6uzcVOiXPD1HaHIMLfTzzng+21+ia7iM
	lTTdZsYw9/H3PXQwysqs4cva4NGG2oxHVh34ZxlFZntNecPsLaGNPwUw8SvVXLZIZjqplN/1SKO
	pUnzCOwZK06d+wI9K4KKPtnpxZHFwJ1CNO+1+jRqvyBL+cI/7LhH6jFaEDfXsq5Vmuggr6JdiwE
	yMyoBvo5dBxSJ9UJ4MOX/nt4nY06G9mr/5TON6bSg3+4rwy0rusG8swOiE4WM+BGMmQm5ZMe7fN
	zGNLPcmiRARL6ZqjB4bIh88ghyZmBZ5xHkaXilspp/4vg4j0lki/1wldF2Q==
X-Received: by 2002:a05:690c:5c04:b0:8b5:5e99:b04f with SMTP id 00721157ae682-8b55e99b114mr26053427b3.37.1795693502508;
        Thu, 26 Nov 2026 03:45:02 -0800 (PST)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b5202b09c6sm85610707b3.17.2026.11.26.03.45.01
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 03:45:01 -0800 (PST)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8b4e18369c8so41252967b3.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 03:45:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHcLmIYtzTRGi7IB8HxwCy7gY+1SG3s7FqE2Jfi5WhUwxXpxvn0sIKwArYS5HAwKpydrzJQOYLDerIUCpeeSFTz@lists.infradead.org
X-Received: by 2002:a05:690c:4985:b0:8b3:3854:c28b with SMTP id
 00721157ae682-8b520435d1bmr62048027b3.22.1795693500919; Thu, 26 Nov 2026
 03:45:00 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261121213102.143130-1-tanure@linux.com> <20261121213102.143130-4-tanure@linux.com>
 <CAFBinCAzSgCGfXb_Q3FuwEmPAEiHSxzVR_ceyqMNp+LEZ18u1g@mail.gmail.com>
In-Reply-To: <CAFBinCAzSgCGfXb_Q3FuwEmPAEiHSxzVR_ceyqMNp+LEZ18u1g@mail.gmail.com>
From: Lucas Tanure <tanure@linux.com>
Date: Thu, 26 Nov 2026 11:44:49 +0000
X-Gmail-Original-Message-ID: <CAJX_Q+1or5Eqe46hdtv0CtekSnLTJkfZ3UQY=RmfmYGeXd7YxA@mail.gmail.com>
X-Gm-Features: Aa3M54p7abSX0OPwjSGJJWzx2W6fGgqfMqyz9aVR061y3YOch6bS5dv9yFIyoYk
Message-ID: <CAJX_Q+1or5Eqe46hdtv0CtekSnLTJkfZ3UQY=RmfmYGeXd7YxA@mail.gmail.com>
Subject: Re: [PATCH v8 3/4] arm64: dts: amlogic: t7: add the ethernet controller
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_034505_939200_2FD8338C 
X-CRM114-Status: GOOD (  17.55  )
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
Reply-To: tanure@linux.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 24, 2026 at 9:37=E2=80=AFPM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> On Sat, Nov 21, 2026 at 10:31=E2=80=AFPM Lucas Tanure <tanure@linux.com> =
wrote:
> [...]
> > +                               int_mdio: mdio@1 {
> > +                                       reg =3D <1>;
> > +                                       #address-cells =3D <1>;
> > +                                       #size-cells =3D <0>;
> > +                                       status =3D "disabled";
> Lucas, Igor (+Cc) has taken a closer look at the MDIO mux, see [0]
> What he's saying is that (in my own words):
> - status =3D "disabled" is unnecessary
> - if you had problems without status =3D "disabled": Igor's patch should
> fix it, can you please test it?
>
>
> [0] https://lore.kernel.org/linux-amlogic/20261124-re-martin-g12a-mux-t7@=
iav.lv/T/#m240f885979c7c3a84af26ee8b60d38f3092f0c0a

I never saw a problem without it. v1 to v4 had the on-chip bus
enabled and the VIM4 ran at full speed. v5 disabled it after a review
comment, so that a board enables only the bus it uses, and Igor calls
that ordinary practice for a new SoC. I am fine either way: keep the
line, or drop it in v9 if you prefer.

Tested Igor's patch on the VIM4 on linux-next (next-20261120, which
has it and the T7 driver) with the on-chip bus enabled, the MAC on
the external RTL8211F:

- both buses come up, mdio_mux-0.0:01 (RTL8211F, the MAC's PHY) and
  mdio_mux-0.1:08 (Meson G12A Internal PHY); link 1Gbps/Full;
  ETH_PHY_CNTL2 reads 0x0 after the attach
- while receiving 942 Mbit/s with iperf3, I unbound and re-bound the
  internal PHY driver twice (phy_probe reads the PHY through the mux):
  after each bind ETH_PHY_CNTL2 reads 0x40, SMI_SRC_MAC only,
  USE_INTERNAL and RX_CLK_EPHY clear
- the stream kept 941 to 942 Mbit/s in every 2 s interval, 0
  retransmits, 0 errors in 2.4M received packets, and receive keeps
  running with the register left at 0x40

So the data path stays on the external PHY across an internal access,
on the T7 as well.

Lucas

