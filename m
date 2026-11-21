Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F47606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 21:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MXW9gfrq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=lxD5zixKw7Tr1W31Lc/kVqjisXnCxr4/jEW2jAJqxqY=; b=MXW9gfrq1lBx2FK9lTiryWLyEk
	FDEGpp5CkRISxlu0QoADk35eDXqjsiNwEMc1NmDtERVZ05vFti2xrWcXgtyRcaro5iBtVVFjx4GHC
	pJj7V4xy7vn8tklnSn3CHZdTYOCM6oBec5LGSUxfARM1nIOzR4xZ6t/ReCtSwgqYXmvt1F3vBK6wL
	jGv6IkOieWbdb7Ed2c8QcPUxnjnFe4o1iYXwAFQJTe58JQ0Xunq+7kNka26gHsx2ErO4mGyJ5lj/5
	AYlscml6OgXeAt/2JPtzm4fEcd24UfV7lgGSoGRhafooWRwHQCKJSNhghE3g1YSfn+AOmU4eIlnjy
	bwHAmMdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUsbT-00000000Kyj-3CXr;
	Sat, 21 Nov 2026 21:26:35 +0000
Received: from mail-yw1-f179.google.com ([209.85.128.179])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUsbR-00000000Ky4-0Mxa
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 21:26:34 +0000
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8b2d14968c9so19365977b3.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Nov 2026 13:26:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795296391; x=1795901191;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lxD5zixKw7Tr1W31Lc/kVqjisXnCxr4/jEW2jAJqxqY=;
        b=BRKhRDbNU6hIFGYGkCwwxEX795LMpXZ/CYbvMnSyiP6/HI8pOUtxBgOEy+JWp3meSj
         HrZ+4J0mxqWYao2Opl9kBRaC4EEhVVEDF/AfSNtYzBWXDFP0x+fgfHeINCxmhnjlEoPL
         TWpqrH6OhZ5/jOxfo0f3ghMhOFG6Y3/H+P5bxvJTkE4G1+XbpuMo2LUbA1LXkrdhxeTZ
         WdPcX/QVlpp1LqNPWQmDyyyAUuYj+LLfBo1EbCB7o2ljVfAJQDkJO84R+ZtLwDd973kG
         ihmCjtgo3IgeTglY3p68EwdtB6XblcnKtak4dFVPMPH9xKW5P8nU3aQv3Vac//CwZdZ1
         6efQ==
X-Forwarded-Encrypted: i=1; AL+hErHmUx6qxaZGuNWa76NYVG1NMhKle0ltRs2SOrkwaAgYa6UJuSEfXPJXkyNkReLxuMJE683TjqjgI93shmKuCV8R@lists.infradead.org
X-Gm-Message-State: APuU4Z+jz+Vj8TkOv8Z1mTOTXjw51DV5Fnkfs2bcHTMsN8Ynn78JZqm5
	ahzTIVdmm2pDNiiHwQ+IjFoggI7/y4LQ/znnbPhLt9U6TOELWUhSvh/TIYYdarIF
X-Gm-Gg: AZFdTZdT88oe5e+rJivjrFplV9Kj4vE2mjbEtRwkJ1SJzoDKSFAWJ3cQ/cIxBmZYHpB
	zoXX0zZ+mdbPKdDKlsNvXaou5Mi1cemotcuAZHPLodRREF2w2d5LMTLcGAG0M6X8iOBhglc+nWU
	H2BORO0envF4eJBkCXM8e6YsoCmzVjpeWJMYHV33FbIe+CQrA9n805+Pe6I9VZ2Px1OvBfPur2A
	747Jb4kiL37CDbTYNDaOn0rbwnhJTH/43ZJ03I37pahArihCY+FSgyahXCc3IloDKwAfibDFghd
	2vU1CWmS1wYAJ1VDICmhGHFmCJxGp5qThvvaP7k2KrtTKiBNwPzVgUiUbViwI+RClb/NQZTc2J1
	5vIGWAwpDC5TwcOaEe0TS2yg4tufUQkPxfwRGKGMBK/wW4yToHNntrhbJ30gy5ZzX1nxetQfkVi
	i7o/CoFdYdkghU161WQ7IKP0NDEAU6IHpr5wtWXu9Fag/zNQtYJESbfIXu9z37l+BKaWD3mjVzI
	jG5RYYfk3SMfaxmACaM8FCb/W2/1V8doudyR0bKPb+baLEDEBk0RUE73LOJDPveYhkzskxxm65q
	HIRqpkSlb+SOBzT1Z+3ordEtb4VHWrPEvQ2opry9wLTA+icBrup6Cg+JSGfm9mzPAWZMQOR5jwp
	2I1ZUXwBHa/JiMDI9ThK5SoG8AH8IPJL+i91DB3R1BkQpndQWzraOXS18cg==
X-Received: by 2002:a05:690c:a:b0:8b1:2db3:b845 with SMTP id 00721157ae682-8b520435b3emr24442827b3.14.1795296391507;
        Sat, 21 Nov 2026 13:26:31 -0800 (PST)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b52031aa4bsm27474457b3.34.2026.11.21.13.26.29
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Nov 2026 13:26:30 -0800 (PST)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8b2d14968c9so19365777b3.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Nov 2026 13:26:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErG8grdoUHNGKlgcS3PNb4Hbuutcox79koON/dvkfT5DTwp+GsiNV6a5QdNj0we5GCFDk0GpyLFlAyDhf+N1KTYZ@lists.infradead.org
X-Received: by 2002:a05:690c:7206:b0:8b4:e51a:c4f9 with SMTP id
 00721157ae682-8b52032b68dmr26349417b3.1.1795296389589; Sat, 21 Nov 2026
 13:26:29 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261113121852.334604-1-tanure@linux.com> <20261113121852.334604-8-tanure@linux.com>
 <CAFBinCBZpruWYPrCWhRY146C9fd6ij2cOirJNORqAJFaiGZJ5Q@mail.gmail.com>
In-Reply-To: <CAFBinCBZpruWYPrCWhRY146C9fd6ij2cOirJNORqAJFaiGZJ5Q@mail.gmail.com>
From: Lucas Tanure <tanure@linux.com>
Date: Sat, 21 Nov 2026 21:26:17 +0000
X-Gmail-Original-Message-ID: <CAJX_Q+3X8BGwj5ydk2TN3tDNLrrhgfKx1X1LQqjePYXJwqs5LA@mail.gmail.com>
X-Gm-Features: Aa3M54ryC1wrMtzkfpXZSCYbt8X4yrGmEQflHHmQnHyfNLikt3muwFhwFJm0PEo
Message-ID: <CAJX_Q+3X8BGwj5ydk2TN3tDNLrrhgfKx1X1LQqjePYXJwqs5LA@mail.gmail.com>
Subject: Re: [PATCH v7 7/7] arm64: dts: amlogic: t7: khadas-vim4: enable the
 ethernet port
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
X-CRM114-CacheID: sfid-20261121_132633_132327_598881BD 
X-CRM114-Status: GOOD (  17.22  )
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

On Sun, Nov 15, 2026 at 6:08=E2=80=AFPM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Hi Lucas,
>
> On Fri, Nov 13, 2026 at 1:19=E2=80=AFPM Lucas Tanure <tanure@linux.com> w=
rote:
> [...]
> > +&ext_mdio {
> > +       external_phy: ethernet-phy@0 {
> > +               /* Realtek RTL8211FD-CG */
> > +               reg =3D <0>;
> We've been following this for a long time until someone found out that
> RTL8211F has a broadcast feature.
> Can you check the strapping registers (or simply see if the PHY
> answers on address 1 as well)?

Checked both. The schematic (v13a, page 9) straps PHYAD[2:0] to 001:
RXCTL/PHYAD2 and RXCLK/PHYAD1 have 4.7K to GND, RXD3/PHYAD0 has 4.7K
to EVDDIO. So the PHY sits at address 1.

A scan from the running kernel agrees. It reads PHY ID registers 2
and 3 at all 32 addresses through SIOCGMIIREG, which goes through the
mux to the external bus:

  addr  0: 0x001c 0xc916
  addr  1: 0x001c 0xc916
  addr  2..31: 0xffff 0xffff

Address 1 is the strap. Address 0 is the RTL8211F broadcast address
(PHYAD0_EN in PHYCR1, on after reset). The vendor tree uses 0 and
only works because of that.

> I'd appreciate it if you could update this patch so we can use this
> approach as reference from now on.

v8 uses reg =3D <1>. The PHY attaches as mdio_mux-0.0:01, link at
1Gbps/Full, 941/944Mbit/s with iperf3, no error. The commit message
says where the address comes from and why 0 also worked.

Thanks,
Lucas

>
>
> Best regards,
> Martin
>
>
> [0] https://lore.kernel.org/all/bc8c7c6a-5d5f-4f7c-a1e2-e10a6a82d50e@lunn=
.ch/

