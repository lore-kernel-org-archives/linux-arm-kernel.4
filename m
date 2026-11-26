Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7306606A684
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 20:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MfLywGJa;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iIMb/Kvr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=sbsvamPXVVsk6WUGKrA0iCW9sEFQvSqMVX1Sf+ynGWM=; b=MfLywGJaeqm4AI
	qNwyTf0Ckw0gFKI3igXTuK6i2Mxf7D+yWnJqeaXVURAKiXAxu7S3eFjvqzj4Y41cyRYnN7L9nHPMt
	SneFPXR7mZLE98Qa4gUMRojSDB9/51DijO/k32dg5nXfBDHLA2OvxOjfKzVluxT2O8nQEVB1ippkL
	veTiEt1pI9IBwl6VtboGplGlAzq0o+KRcAfUhPnyCaJB/0Gftw8vOOMynDf1ApnuoiQ1ejjM7Ogo6
	I/aYrWtbm7BLLWzjscVYcyhoN03XLt/qXMvXgXuTQ/zkTzZUyACgPsaCBtpK6Boy5q0sGd/LNE+dy
	CntX2GzLCz90IyOlpFpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWgAr-0000000ETWW-0nJI;
	Thu, 26 Nov 2026 20:34:33 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWgAM-0000000ETIW-0tKv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 20:34:04 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-844a8bf7e25so3968973a34.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 12:34:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795725241; x=1796330041; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sbsvamPXVVsk6WUGKrA0iCW9sEFQvSqMVX1Sf+ynGWM=;
        b=iIMb/KvrOCJNc2J+att3tyclle0566RcaM7EENoRJTLWF1RTgfJiZHhsymvpc8pNvo
         eibugHS8FvLN9LdOLGgx7DU/Wa5Z7kxu9pj4km3wl6etRLpj6tVnw18yTDSsFAt9Ki6A
         piHzHeE+0qqWTtcfEgIbUj/Pl1zNFcQ2fMeOicK8/sKqA06/XBSaRfTFnJcVWS84dAAO
         sv8JBTVfzp4XS1w4tWm8pnYD0MzuXfx7GFPIGLqWZRNPK0g1Y2MczqV4jzoRCXX/7gQI
         U2KRtUT3h+0/UMq+Ng4lhcPf7SoBqb0tlsPpkq6w7WKJ1E0J/AKJp2ehF7uR/Dbsu93p
         K/AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795725241; x=1796330041;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sbsvamPXVVsk6WUGKrA0iCW9sEFQvSqMVX1Sf+ynGWM=;
        b=HCUas5Ewl5bmsg1C66ssEBaqcnJCkidYBBL+NT0KvtKKgdmiP6gawyc7S1rRIVNHGa
         lCZK4rRkHf14hW1roMpVf11d2TLp9LTgb7+b4KyzijhIj1DtMsVDqXxDdNLx2Pcha6M3
         ONuSWbXPGuNJuvBgdhDIfvr4yhWDbnNcNylsIhmBYMDZ7KdBa3e2PyjVPMBl2COeJ6iW
         pF/iAm5PSmXtWoNJJYWBB8seKSlYo+Wm0m9q4v4tzAMh0Kq/ixp9/o7O2MUL5F8EXI6+
         LYIhctCr9xA7X0mmGJ4wnEbTZtaB4W92PLofxIf6UrUx5yoIMgUjfBUBlO/DvyrNCs1r
         ifHg==
X-Forwarded-Encrypted: i=1; AL+hErESNgy5wKqPtOyXIcAcejJms60XxFEBjFM1aXD0Tf06rt+l2TCdWGehU6ET6YtLL/amiGwWl5igPvzBVYx3iUxa@lists.infradead.org
X-Gm-Message-State: APuU4Z/Xu3B6X5s6UdCVm0DJ6k3oOzvltCqJVpamaz93easMogc8CsD2
	7Kr9fw7TmmkkAt6RXp/Wcr29KhSUFgY3erSfUHOWME81MZOSZ893eS5A
X-Gm-Gg: AZFdTZfi3nGhGr3R3b+xNxIiQ9JjDqkqs549DGcUZGXIvXswFn9ufr3kpbh2QJWxb9m
	bND7QFSivHMBQhfat9pA0ObvZKBpURpWg1p/wcRx2SebzcaE1KHYnndLVY79Fmh2xUPC2JVzCoR
	y8o1U6+SlS7GjycrgglDH397Nhle/dqK9D8VBIn5IBcCTDKmac3ft1gQE+tG4q1EsB7c0xJFpOi
	Lpnkqa9QJP1D+P7CM+HWLnUptYo6vuMH10JkUKZheEPUa3GUTqyJ2Wf0QQMsHy81VaJIny3rs9y
	cwD/wwEdiIHCIBMhIryUGEbVC+V/mZHWzX5XNZZiFRDvpFgYjNnNAyye1WOIuWF+RWvmJen0/+G
	YCW0y4cQJQYoTz1In7QEF7mI4zp2jVKkr4oSSL8O/XMmGYamIeg54v0716fbd0E4LWntsOw4Ox4
	3HcF97aowJqnRXCyc6qEi/zR5QgbwTZ5ffAVXs9VqV14xz4Gso95CqvG8ddtA1FhC/LkO+KMbrG
	x3KqlCSxnj19SXXhf+6RHaY5tyJFwBqeoMtvKyBcqj14E2U9ShllW9+6b0U9fSmV2/iPancRD2j
	QhH6ay7PCBe4ONm/GsCJuDaF8V/QvwhFRSfu50CQoTkHfjelXKiVJ2ZKOX/YCvxnlMVLNYhgv+u
	GEfN/rQs=
X-Received: by 2002:a05:6830:438f:b0:862:aa2b:eae4 with SMTP id 46e09a7af769-863159e9bd9mr23567439a34.24.1795725241022;
        Thu, 26 Nov 2026 12:34:01 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8631692f049sm16133926a34.25.2026.11.26.12.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 12:34:00 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: wens@kernel.org
Cc: andre.przywara@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	Alexander Sverdlin <alex@sverdlin.org>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>
Subject: Re: [PATCH v5 3/3] arm64: dts: allwinner: add Radxa Cubie A7S board
Date: Thu, 26 Nov 2026 15:33:58 -0500
Message-ID: <20261125-a733-03-board@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <CAGb2v64p4GvDMDKzDLfedDQCexD+=gu3+YxMAt=ARj4bZxR_eA@mail.gmail.com>
References: <20261121-a733-cubie-a7s-dt-v5-0@gmail.com> <20261121-a733-cubie-a7s-dt-v5-3@gmail.com> <CAGb2v64p4GvDMDKzDLfedDQCexD+=gu3+YxMAt=ARj4bZxR_eA@mail.gmail.com>
Content-Type: text/plain; charset="us-ascii"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_123402_287848_1CBCCC2F 
X-CRM114-Status: GOOD (  15.36  )
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

> "PS" is a separate output from the PMIC's "PS" pins. It is fed from
> the "DCIN" pins and has some internal resistance and a zener diode (if
> the block diagram is to be believed) for some poor regulation. In
> practice I would expect at least a little bit of voltage drop here.

Sheet 4 shows VCC5V0_SYS feeding DCIN. PS feeds the buck inputs and
UP11. I've described the two nets separately and used LDO2V5-INPUT for
the downstream rail. I've also renamed the oscillator, reordered the
regulators and removed cap-sdio-irq and the blank lines before status.

> > +       cd-gpios = <&pio 5 6 (GPIO_ACTIVE_HIGH | GPIO_PULL_DOWN)>;
> Please actually test this.

On a Cubie A7S with the posted v5 DTB and Vinicius's EINT-mux fix,
MMC0 reported four-bit SD high-speed at 50 MHz and 3.3 V. One read of
the first 16 MiB matched the vendor kernel's SHA-256. The mismatch on
the earlier 4 MiB read at offset 16 MiB is still unexplained. The
EINT-mux fix is now in pinctrl fixes as a256b8c8083e [1].

On his A7S with v5, Norman verified that PF6 reports the card present,
MMC write/readback matches, EEPROM reads work, both LEDs switch visibly,
and warm reboot and power-off work [3]. The v6 cover lists A7S card
hotplug, EEPROM writes and write protection, and 1.8 V SD signalling as
untested. The v6 DTBs have yet to run on hardware.

> > +                       reg_dcdc9: dcdc9 {
> Missing voltage range.

DCDC9 reads back 1.240 V on A7S. Vinicius cites a 1.2 V ELDOIN minimum
from the AXP318W datasheet draft [2]. I've used 1.240 V for both bounds.

> > +                       reg_eldo1: eldo1 {
> Missing voltage range.

For ELDO1, schematic sheets 4-5 label LPDDR5 VDD2L as 0.9 V. The
regulator reports 1.075 V after firmware DRAM training on the A7S.
Do you have a validated VDD2L range for this memory, or would you
prefer to preserve the firmware setting until the range is confirmed?

I'll wait for the AXP318W series before asking you to take the board.

[1] https://lore.kernel.org/r/CAD++jL=xA7eZUeb30xOnCZ8uRy0UE7q8h=8AA4p-tmiBf3Sb9g@mail.gmail.com
[2] https://lore.kernel.org/r/nh-1384c024-38de-4962-9d4f-a0bfb55471a6@google.com
[3] https://lore.kernel.org/r/CqGMQaDysL6l016qtEM8oOEnYUMKACgmwLUbb0wruVAzPcwiqrz00WCOhTrhkVEaZt1YB3xfucXdEc-ZFi-sCPgn69RNqtW0v4Gn_HjQZXs=@proton.me

Thanks,
Enzo

