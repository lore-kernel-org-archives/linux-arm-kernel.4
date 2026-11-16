Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79BB606BE06
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 11:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zSs67BG4;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=amrq9Vjy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=IFTIRi6DR/4GBO7pnHZgtAC31IQ40N5eezi1VUpmpyg=; b=zSs67BG4HuxAKAvKpcq/GOjYHw
	PAhjRrCoioovYr3B+jbFRT1ahYtJhO3P7CwgUK/wAbbW3jLt9tB3sybyFp30Z1hUsuVI6EtTagIFM
	/6CtMxyRSDPAmrLnpqzHBp/uG1GbvPPCCxXcSpIokSSV9HESJUNZ3BASRk0sR9zvRCWrKQ61QyRea
	7+8l+B6Wfoc97pVBp10/234X87kg7vZVqNa5SXhEdQNDJGw/3fwAyGmpA9bckAuBP/4noq5VnI48T
	s195wsJzz2cQCIfGcsRZb1UO2ufUqco1Jcmo6QILEHptWSwTPFzPNdOK2C3Nw3ISNyxa8hqLKJduL
	ltliyqZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSuoS-00000002ASV-17d5;
	Mon, 16 Nov 2026 11:23:54 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSuoP-00000002ARm-35tH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 11:23:50 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-4910b863b84so2396388f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 03:23:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794828228; cv=none;
        d=google.com; s=arc-20260327;
        b=gRevyDCBJoV+eRS62I6DioYy/qnPiwWmKsMtvIYbKetb1j0xUP5Uuim7+bwzIfcCoL
         K7VT/SOeWc2o2+I3JuadVA5sqkVSTDtV/lRtuUn4TalJIldNTgDMr/qIzIYZfR9BZ1h6
         NxA4TRT5FW0hGrAls6G9n5omVPcTSvIcOkrSOQyJaAQrUp6Dfvva6sC20h+o8M5BWVmm
         2ynH9AxYRccBPuxLudRSDaFS9GeBIVQ5oL9aqjbV+GOpwOjUu4esp8D2wjZPWXbZPVOO
         F/qRANlGwKMNlY01i4uUiw5Ox3Ddp0ZzlKqe6vPz60EpOhVR+dr0W90pjV/33z+WcwJC
         m1PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=IFTIRi6DR/4GBO7pnHZgtAC31IQ40N5eezi1VUpmpyg=;
        fh=MTK0yYv0drn1mJauebuModsdW4Rbn0va/5/aUSY+qGA=;
        b=jBmJSmtgklaRxipkOb2gQI65j9i47Y0cIH1w1W94PYzufwi4KTi8d1xPzkk/WWh8yT
         vrJM8Ov9TKL6Q8/6rPSPu1nc0Nic8KtAaKH6YAbCwBSVXy1fh9WcQY33thiS3DA2h0YN
         AlSCOXaMG+5ZoK9/hybLF28Vp1IE8FxrXyx4Rv+ynBlAOSSOD2plX8i0t/pS68wxLRFs
         3Gbswbo8YF5fClZf9rvKGfki+fiPY7UeMqHhp7iYWGRi/Sj2xj70krj834R2c35oNCFu
         Bjeikhp250rygY0726JZ99qUU4bJz3hgyERlwEVN3PEkEklzpRhoDXaqcu3IjbZzfKvn
         1HSw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794828228; x=1795433028; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IFTIRi6DR/4GBO7pnHZgtAC31IQ40N5eezi1VUpmpyg=;
        b=amrq9VjyfCr9jCyalqx2c2GK4g/mJ4t/BDCXaXpm/X126Y5kHQv5iiZNqJqtkIrdSl
         XdajzDah2FfVJ85CwAx7neetSEuLimT6ZImRXubUb2CV6LPEhSPA+N2syYj7r0bQicsT
         BIX0oLMLvGAE6mXhkyBdOCzPMNyZhBsIN4PuPaf1Rn0UNtSRQ8PFstKXNDsrSyHq3ygA
         UIG7UXZUMBjujJ8g3b/6MOTvda+BXWC7Sg5069J+MCuaH4XP65LYfSJTr6ECJlbnCu6D
         bHv3+8Nl8lJhXRBl/4Fi1Dp3GRMx5IN7AO/89jx87DyLpvZ5f/H191ECJAVQzsiVZH4c
         96Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794828228; x=1795433028;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IFTIRi6DR/4GBO7pnHZgtAC31IQ40N5eezi1VUpmpyg=;
        b=eVT2VVBAmB6K4jr8pH/wvMHZDonsfqI175y9wyXbTij7rBiB2LyVk3Nd3115RNzkFI
         ho0Hy7WUELOQF6HpqKBooF1Fy0HXTGJVpiYPOEms7yXB1vMwiMZLRlBXKe5oSddWRdL7
         7mdHJ1VIEOoy/CVmajGmetIgFY5OC0yRS+OZrilboZZqIRt8pc8Db8oLXlh7bmf39Y/1
         U2w68sA2gJo78OVlCjcu+v+WapfYNvyiJAbC1Ljyso1NMIYwWBU3Y92bCwOv5o2XrfFT
         EDlqh7K3BgeQDqO2CuHVtPWoG0zc6Sc+LCSzcJF9UO2WsmGqmFLgf34DieMEJeK+qOXW
         eStA==
X-Forwarded-Encrypted: i=1; AL+hErHgGvnL3wPW1Q3YoWPdEMfkSvxBzrt5SoPPEgUhVR5Cl13i2yIHNbd7obntKWsxYghqj0U7I2vLc5hrWk8MNkId@lists.infradead.org
X-Gm-Message-State: APuU4Z/gtz2e84UdSRiAlg/hmfimsv2kq8kq5Sh6Y7T3xWUkh4QR3A4F
	FDZeP/QiKpvv6noy6Naz59eTgEVMXtiaJD+H+Bs0X2/sBDBM2o3dMuPqo4CGHMGHXyUbuYeZl7s
	xYjQHqOmmAaoyDDD8emRsmonXYXwgBVc=
X-Gm-Gg: AZFdTZe2v+aoy9SHSydP0c3UtWVLUwSrc0EQQqr1t1VHYLEQnfHPvaouLH+1P6kvL9Y
	8cYLsi4AfuE+jbRxoSsh3Baqu5SGVxefRF8jNE1W8Oi3ffjprbzA1lYAQf9Vz36sDmk9bbIRoul
	M/evQy1uqTzf1VZTd16IByvtv3LtwW3vDwRE/fROuE1cGbr9pZgdsTj65IByRAB+FMVU0bDoyib
	Z570sKH2i+RekMFeSQYudEYKxkZ0D2Y3zWgPI29KfzdcvcDUGEHzbVEvcT6bal2Qn8lDjzBMOxL
	E+vh09YZoX4nO1St2iNx9ixTL+bIS0DpIg65ANmNI+pYh33cupIFhkDvsQeAjOMJQien0x48aNE
	O7oZ+izj0aYcR0Z2yP+TYRq8ryd/p/k9GrMyQePiaNYkLibGJ7TFcs7G5rXuHmfNOyI8=
X-Received: by 2002:a05:6000:401f:b0:48a:f4d4:e1f3 with SMTP id
 ffacd0b85a97d-49c6ff8142amr23541572f8f.13.1794828227485; Mon, 16 Nov 2026
 03:23:47 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261116091757.1656602-1-magnusleatti@kernelriot.com>
In-Reply-To: <20261116091757.1656602-1-magnusleatti@kernelriot.com>
From: Giuseppe Nespolino <g.nespolino@gmail.com>
Date: Mon, 16 Nov 2026 12:23:35 +0100
X-Gm-Features: Aa3M54rcJmWUc1Ncq_Fk9iW3VcokWpJC0yoijn8Jeo0Icrve_bZeoYCpsWMQggs
Message-ID: <CAKx9m6O=uqC16v5-swStrtq4xzNzExbM0xFoi5znQOmnwDvSZA@mail.gmail.com>
Subject: Re: [PATCH net-next 0/2] net: stmmac: dwmac-motorcomm: shutdown hook
 and Wake-on-LAN from S5
To: Magnus Leatti <magnusleatti@kernelriot.com>
Cc: me@ziyao.cc, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_032349_796321_B04B32C2 
X-CRM114-Status: GOOD (  13.19  )
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Magnus,

On Mon, Nov 16, 2026 at 10:17 AM Magnus Leatti wrote:
> Giuseppe, this is the OOB WoL enable you and Yao discussed in the
> s2idle thread [1]: it is only enabled when powering off, because only
> a chip reset disables it again. If you can try "wol g" and a power-off
> on the Slimbook, a laptop would be a good third board.

Tried it on the Slimbook EVO15-A8 (Ryzen 7 8845HS, BIOS N.1.14GOS07).
I ran Ubuntu's 7.0.0-43 kernel with both patches applied to the
distro's dwmac-motorcomm.c and built out of tree, so not net-next
itself. The module also carried my pending reset-on-resume change and
a register dump, neither of which runs at shutdown. Magic packet sent
from another host on the LAN about 75 s after power-off, on AC:

  patched   wol g, BIOS WoL disabled   no wake, 1 of 1
  patched   wol g, BIOS WoL enabled    wake, 1 of 1
  distro    wol g, BIOS WoL enabled    no wake, 1 of 1

One thing worth knowing for laptops: on this one the firmware gates
the root port. \_SB.PCI0.GPP5._PRW (SSDT23) returns {0x0F, 0x04} only
when the BIOS setup "Wake on LAN" option is on, otherwise {0x0F, 0},
and /proc/acpi/wakeup shows GPP5 at S0. It was off here, which is why
my first attempt didn't wake.

I couldn't check for warnings from the shutdown path: the journal
stops before devices are shut down, and I have no serial console or
netconsole on this machine.

Tested-by: Giuseppe Nespolino <g.nespolino@gmail.com>

As before, I worked through this with an AI assistant; the test runs
and their results are from this machine.

Thanks,
Giuseppe

